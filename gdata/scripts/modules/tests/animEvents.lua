local coroutines = require "coroutines"
local coroutineManager = coroutines.getDefaultManager()
local coro = coroutines.helpers

local hlp = require "helpers"

local test = require "gambiarra"
local testingHelpers = require "testingHelpers"

-- luacheck: read globals ok spy eq

testingHelpers.assureLog()

-- setting up basic test events handler
test(testingHelpers.getEventsHandlerSimpleLogger(_G.log))


local function corotest(name, fn, async)
   local co = coroutineManager:createCoroutine(fn)
   test(name, function(next) coroutineManager:executeRoutine(co, next) end, async)
end


--[[
TEST THE FOLLOWING FUNCTIONS

bool                addAnimationEvent         (const char* animName, const char* eventName, int startFrame, int endFrame);
bool                removeAnimationEvent      (const char* animName, const char* eventName);
std::pair<int, int> getAnimationEventInterval (const char* animName, const char* eventName);
--]]

local dummy = hlp.safeCreateEntity("dummy.cfg", "CCharacter")

test("can't add events to missing animations", function()
   ok(eq(dummy:addAnimationEvent("wololo", "idle", 0, 0), false))
end)

test("dummy character system check", function()
   ok(not eq(dummy:getAnimDuration("idle"), 0), "dummy has animation idle")
   ok(eq(dummy:getAnimationEventInterval("idle", "idle"), {-1,-1}),
      "doesn't have event idle defined")
   ok(eq(dummy:removeAnimationEvent("idle", "idle"), false),
      "doesn't have event idle defined (extra check)")
end)

test("can't get event interval for undefined events", function()
   ok(eq(dummy:getAnimationEventInterval("idle", "random_eventName"), {-1,-1}),
      "doesn't have event random_eventName defined")
   ok(eq(dummy:removeAnimationEvent("idle", "idle"), false),
      "doesn't have event idle defined (extra check)")
end)

test("querying and removing missing events", function()
   ok(eq(dummy:getAnimationEventInterval("idle", "random_eventName"), {-1,-1}),
      "can't get event interval for random_eventName - it's undefined")
   ok(eq(dummy:removeAnimationEvent("idle", "idle"), false),
      "can't remove event random_eventName - it's not there!")
end)

test("can add and remove events", function()
   ok(eq(dummy:addAnimationEvent("idle", "wololo", 0, 0), true))
   ok(eq(dummy:addAnimationEvent("idle", "wololo2", 0, 0), true))
   ok(eq(dummy:addAnimationEvent("idle", "wololo3", 0, 1), true))
   ok(eq(dummy:addAnimationEvent("idle", "wololo4", 1, 2), true))
   ok(eq(dummy:removeAnimationEvent("idle", "wololo"), true))
   ok(eq(dummy:removeAnimationEvent("idle", "wololo2"), true))
   ok(eq(dummy:removeAnimationEvent("idle", "wololo3"), true))
   ok(eq(dummy:removeAnimationEvent("idle", "wololo4"), true))
end)

test("if inFrame > outFrame then outFrame = inFrame + 1", function()
   ok(eq(dummy:addAnimationEvent("idle", "wololo", 1, 0), true), "1,2")
   local result = dummy:getAnimationEventInterval("idle", "wololo")
   ok(eq(result, {1,2}), "becomes 1,2")

   dummy:removeAnimationEvent("idle", "wololo")
end)

test("negative frames get clamped to 0,1", function()
   ok(eq(dummy:addAnimationEvent("idle", "test", -1, -1), true))
   ok(eq(dummy:addAnimationEvent("idle", "test2", -1, 0), true))
   ok(eq(dummy:addAnimationEvent("idle", "test3", 0, -1), true))
   ok(eq(dummy:getAnimationEventInterval("idle", "test"), {0,1}))
   ok(eq(dummy:getAnimationEventInterval("idle", "test2"), {0,1}))
   ok(eq(dummy:getAnimationEventInterval("idle", "test3"), {0,1}))

   dummy:removeAnimationEvent("idle", "test")
   dummy:removeAnimationEvent("idle", "test2")
   dummy:removeAnimationEvent("idle", "test3")
end)

test("frames too long for animation get clamped too", function()
   ok(eq(dummy:addAnimationEvent("idle", "test", 100, 100), true))
   ok(eq(dummy:getAnimationEventInterval("idle", "test"), {1,2}))
   dummy:removeAnimationEvent("idle", "test")
end)

test("can't add duplicate events to character", function()
   ok(eq(dummy:addAnimationEvent("idle", "idle", 0, 0), true))
   ok(eq(dummy:addAnimationEvent("idle", "idle", 0, 0), false))
   ok(eq(dummy:addAnimationEvent("idle", "idle", 0, 1), false))
   ok(eq(dummy:addAnimationEvent("idle", "idle", 1, 1), false))

   dummy:removeAnimationEvent("idle", "idle")
end)

test("added animated event to character returns same frames", function()
   dummy:addAnimationEvent("idle", "atrociousCharacter", 0, 1)

   ok(eq(dummy:getAnimationEventInterval("idle", "atrociousCharacter"), {0,1}))

   dummy:removeAnimationEvent("idle", "atrociousCharacter")
end)

corotest("destroying dummy", function(next)
   hlp.safeDestroyEntity(dummy)
   ok(not hlp.isOperable(dummy), "dummy destroyed successfully")
   next()
end, true)

-- test that added events work as intended
local bug

corotest("bug init system check", function(next)
   bug = hlp.safeCreateEntity("killerbug.cfg", "CCharacter")
   ok(hlp.isOperable(bug), "test bug created")
   bug.animationsManager:stopActionsAndCycles()
   next()
end, true)

corotest("added idle event to bug fires", function(next)
   bug:addAnimationEvent("idle", "idle123", 0, 0)
   bug.animationsManager:playAction("idle")
   coro.waitAnimationEventIn(bug, "idle", "idle123")
   ok(true, "eventIn fired")
   bug:removeAnimationEvent("idle", "idle123")
   next()
end, true)

test("destroy bug entity", function(next)
   hlp.safeDestroyEntity(bug)
   ok(true, "destroy bug")
   next()
end, true)
