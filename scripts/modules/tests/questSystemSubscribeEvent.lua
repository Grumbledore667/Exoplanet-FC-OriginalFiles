require "pl.compat"
local tablex = require "pl.tablex"

local function eqapprox(t1, t2, epsilon)
   return tablex.deepcompare(t1, t2, true, epsilon)
end

local test = require "gambiarra"
local testingHelpers = require "testingHelpers"

-- luacheck: read globals ok spy eq


testingHelpers.assureLog()

-- setting up basic test events handler
test(testingHelpers.getEventsHandlerSimpleLogger(_G.log))

local timers = {}
local function async_next()
   local timer = table.remove(timers, 1)
   if timer then
      timer.func(unpack(timer.args))
   end
end

local env = {
   -- quest.lua needs _G.quests and runTimerAdv
   quests = {},
}
setmetatable(env, {__index=_G})

local function sandboxQuests()
   env.runTimerAdv = function(_, _, func, ...)
      table.insert(timers, {func=func, args=table.pack(...)})
   end
   -- quest.lua needs _G.splitQuestTopic in dialog.lua
   local dialog = loadfile "../dialog.lua"
   local quest = loadfile "../quest.lua"
   setfenv(dialog, env)
   setfenv(quest, env)
   dialog()
   quest()
end


if not env.questSystem then
   sandboxQuests()
end

local qs = env.questSystem

test("questSystem:subscribeEvent", function (next)
   local callbackObj
   local cbQuestEvent
   cbQuestEvent = spy(function ()
      env.runTimerAdv(0, false, function ()
         ok(eq(cbQuestEvent.called[1], {"find", "testTarget", "testObject"}), "called with correct arguments")
         qs:unsubscribeEvent("find", callbackObj)
         ok(eq(tablex.find(qs.eventSubscribers.find, callbackObj), nil), "no callbacks for 'find' event")

         local cbQuestEvent2
         cbQuestEvent2 = spy(function ()
            ok(eq(cbQuestEvent2.called[1], {"find", "testTarget", "testObject", "lol"}), "called with our argument last")
            qs:unsubscribeEvent("find", callbackObj)
            next()
         end)
         callbackObj = qs:subscribeEvent("find", cbQuestEvent2, "lol")
         qs:fireEvent("find", "testTarget", "testObject")
      end)
   end)
   callbackObj = qs:subscribeEvent("test", cbQuestEvent)
   ok(eq(type(callbackObj), 'table'), "get callback table on subscribeEvent")
   ok(not eq(tablex.find(qs.eventSubscribers.test, callbackObj), nil), "found our callback for 'test' event")
   qs:unsubscribeEvent("test", callbackObj)
   ok(eq(tablex.find(qs.eventSubscribers.test, callbackObj), nil), "our callback for 'test' event no more")

   callbackObj = qs:subscribeEvent("find", cbQuestEvent)
   qs:fireEvent("find", "testTarget", "testObject")
end, true)

async_next()
async_next()
async_next()
async_next()
async_next()
