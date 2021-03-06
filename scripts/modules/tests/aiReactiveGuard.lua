local test = require "gambiarra"
local testingHelpers = require "testingHelpers"

-- luacheck: read globals ok spy eq

testingHelpers.assureLog()
testingHelpers.assureMockRng()

-- setting up basic test events handler
local tools = {}
test(testingHelpers.getEventsHandlerSimpleLogger(_G.log), tools)

local Node = require "ai.Node"
local CEventManager = require "eventManager"

local function callCount(spiedFunction)
   return spiedFunction.called and #spiedFunction.called or 0
end

test("ai.ReactiveGuard test", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy

   local entity = {
      eventManager = CEventManager(),
      getState = function() return false end,
   }

   local targetStartSpy = spy()
   local targetFinishSpy = spy()
   local action = Node{
      className = "Action",
      name = "targetBehavior",
      entity = entity,
      start_function = targetStartSpy,
      running_function = true,
      finish_function = targetFinishSpy,
   }
   local guard = Node{
      className = "ReactiveGuard",
      name = "guard",
      entity = entity,
   }
   action:addGuard(guard)

   local dummy_spy = spy()
   local dgs = Node{
      className = "DynamicGuardSelector",
      name = "dgs",
      entity = entity,
      children = {
         action,
         Node{
            className = "Action",
            name = "dummy",
            entity = entity,
            start_function = dummy_spy,
         },
      },
   }

   local root = Node{
      className = "BehaviorTree",
      name = "test root",
      child = dgs,
      entity = entity,
      blackboard = {},
   }
   root:init()

   root:tick()
   ok(callCount(targetStartSpy) == 0, "ReactiveGuard is not activated")
   root:requestBehaviorStart("targetBehavior")
   root:tick()
   ok(callCount(targetStartSpy) == 1, "ReactiveGuard allowed execution")
   ok(callCount(targetFinishSpy) == 0, "ReactiveGuard not finished")
   root:tick()
   ok(callCount(targetFinishSpy) == 0, "ReactiveGuard not finished after second tick")
   root:requestBehaviorStop("targetBehavior")
   root:tick()
   ok(callCount(targetFinishSpy) == 1, "ReactiveGuard finished after stop request")
end)
