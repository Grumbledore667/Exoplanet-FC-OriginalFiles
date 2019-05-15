local test = require "gambiarra"
local testingHelpers = require "testingHelpers"

-- luacheck: read globals ok spy eq

testingHelpers.assureLog()
testingHelpers.assureMockRng()

-- setting up basic test events handler
local tools = {}
test(testingHelpers.getEventsHandlerSimpleLogger(_G.log), tools)

local CoroutineAction = require "ai.CoroutineAction"
local BehaviorTree = require "ai.BehaviorTree"
local CEventManager = require "eventManager"
local coro = require "coroutines.helpers"

local function callCount(spiedFunction)
   return spiedFunction.called and #spiedFunction.called or 0
end

--[[
This tests a unique situation when finish_function side effect causes the coroutine to be resumed,
such as stopMoveAndOrientate that fires OnMoveAndOrientateStop which could match the event that
the suspended coroutine currently awaits. It causes a behavior tree tick instead of cleanly
shutting down the node, which in case of stopMoveAndOrientate() call was causing a C Stack Overflow
]]
test("ai.CoroutineAction event in finish_function bug", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy

   local entity = {
      eventManager = CEventManager(),
      getState = function() return false end,
   }

   local allowed_func = spy()
   local forbidden_func = spy()

   local coro_action = CoroutineAction{
      name = "test coroutine action",
      running_function = function()
         allowed_func()
         coro.waitCharacterEvent(entity, "test event")
         forbidden_func()
      end,
      finish_function = function()
         entity.eventManager:postEvent("test event")
      end,
      entity = entity,
   }
   local root = BehaviorTree{
      name = "test root",
      child = coro_action,
      entity = entity,
      blackboard = {},
   }
   root:init()

   root:tick()
   root:reset()

   ok(callCount(allowed_func) == 1, "first part of coroutine executed properly")
   ok(callCount(forbidden_func) == 0, "this function must never execute")
end)
