local test = require "gambiarra"
local testingHelpers = require "testingHelpers"

-- luacheck: read globals ok spy eq

testingHelpers.assureLog()
testingHelpers.assureMockRng()

-- setting up basic test events handler
local tools = {}
test(testingHelpers.getEventsHandlerSimpleLogger(_G.log), tools)

local Node = require "ai.Node"
local Action = require "ai.Action"
local AnimatedAction = require "ai.AnimatedAction"
local CoroutineAction = require "ai.CoroutineAction"
local Finisher = require "ai.Finisher"
local Decorator = require "ai.Decorator"
local DynamicGuardSelector = require "ai.DynamicGuardSelector"
local TimeLimiter = require "ai.TimeLimiter"
local Sequence = require "ai.Sequence"
local ConditionNode = require "ai.ConditionNode"
local NodeState = require "ai.NodeState"

local function callCount(spiedFunction)
   return spiedFunction.called and #spiedFunction.called or 0
end

test("ai.Node finish", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy

   local node = Node{
      name = "test",
      finish = spy(Node.finish),
   }
   local finish = node.finish
   ok(callCount(finish) == 0, "finish isn't called after init")
   node:update()
   ok(callCount(finish) == 1, "finish is called once after update")
   node:reset()
   ok(callCount(finish) == 1, "finish isn't called in reset")
   node:reset()
   ok(callCount(finish) == 1, "finish isn't called in second reset")
end)

test("ai.Node running finish", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy

   local node = Node{
      name = "test",
      finish = spy(Node.finish),
      running = function(self)
         return NodeState.RUNNING
      end,
   }

   local finish = node.finish
   ok(callCount(finish) == 0, "finish isn't called after init")
   node:update()
   ok(callCount(finish) == 0, "finish isn't called while status is running")
   node:reset()
   ok(callCount(finish) == 1, "finish is called if reset running")
   node:reset()
   ok(callCount(finish) == 1, "finish isn't called in second reset")
end)

test("ai.Action finish_function", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy

   local node = Action{
      name = "test action",
      finish_function = spy(),
      entity = {},
   }

   local finish = node.finish_function
   ok(callCount(finish) == 0, "finish_function isn't called after init")
   node:update()
   ok(callCount(finish) == 1, "finish_function is called once in update()")
   node:reset()
   ok(callCount(finish) == 1, "finish_function isn't called in reset")
   node:reset()
   ok(callCount(finish) == 1, "finish_function isn't called in second reset")
end)

test("ai.Action guarded finish_function", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy

   local guard = ConditionNode{
      name = "test guard",
      condition = function()
         return false
      end,
      entity = {},
   }

   local node = Action{
      name = "test action",
      finish_function = spy(),
      entity = {},
      guard = guard,
   }

   local finish = node.finish_function
   ok(callCount(finish) == 0, "finish_function isn't called after init")
   node:update()
   ok(callCount(finish) == 0, "finish_function isn't called after update() with failed guard")
   node:reset()
   ok(callCount(finish) == 0, "finish_function isn't called in reset")
   node:reset()
   ok(callCount(finish) == 0, "finish_function isn't called in second reset")
end)

test("ai.AnimatedAction finish_function", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy

   local node = AnimatedAction{
      name = "test animated action",
      animation = "test",
      finish_function = spy(),
      entity = testingHelpers.mockCallable,
   }

   local finish = node.finish_function
   ok(callCount(finish) == 0, "finish_function isn't called after init")
   node:update()
   ok(callCount(finish) == 0, "finish_function isn't called in first update()")
   node.stopEventArrived = true
   node:update()
   ok(callCount(finish) == 1, "finish_function is called in second update() after event has arrived")
   node:reset()
   ok(callCount(finish) == 1, "finish_function isn't called in reset")
   node:reset()
   ok(callCount(finish) == 1, "finish_function isn't called in second reset")
end)

test("ai.CoroutineAction finish_function", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy

   local node = CoroutineAction{
      name = "test coroutine action",
      running_function = function() end,
      finish_function = spy(),
      entity = testingHelpers.mockCallable,
   }

   local finish = node.finish_function
   ok(callCount(finish) == 0, "finish_function isn't called after init")
   node:update()
   ok(callCount(finish) == 1, "finish_function is called once in update()")
   node:reset()
   ok(callCount(finish) == 1, "finish_function isn't called in reset")
   node:reset()
   ok(callCount(finish) == 1, "finish_function isn't called in second reset")
end)

test("ai.Finisher finish_function", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy

   local finisher_ff, action_ff = spy(), spy()

   local action = Action{
      name = "test action",
      finish_function = action_ff,
      entity = testingHelpers.mockCallable,
   }

   local finisher = Finisher{
      name = "test finisher",
      finish_function = finisher_ff,
      entity = testingHelpers.mockCallable,
      child = action,
   }

   finisher:update()
   ok(callCount(finisher_ff) == 1, "finisher:finish_func is called once in update()")
   ok(callCount(action_ff) == 1, "action:finish_func is called once in update()")
   finisher:reset()
   ok(callCount(finisher_ff) == 1, "finisher:finish_func isn't called in reset")
   ok(callCount(action_ff) == 1, "action:finish_func isn't called in reset")
   finisher:reset()
   ok(callCount(finisher_ff) == 1, "finisher:finish_func isn't called in second reset")
   ok(callCount(action_ff) == 1, "action:finish_func isn't called in second reset")
end)

test("bug: decorator causes action with failed guard to call finish_function", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy

   local action_ff = spy()

   local condition = ConditionNode{
      name = "failing condition",
      entity = {},
      condition = function()
         return false
      end,
   }

   local action = Action{
      name = "test action",
      guard = condition,
      finish_function = action_ff,
      entity = testingHelpers.mockCallable,
   }

   local decorator = Decorator{
      name = "test decorator",
      entity = testingHelpers.mockCallable,
      child = action,
   }

   decorator:update()
   ok(callCount(action_ff) == 0, "action:finish_func is called once in update()")
   decorator:reset()
   ok(callCount(action_ff) == 0, "action:finish_func isn't called in reset")
   decorator:reset()
   ok(callCount(action_ff) == 0, "action:finish_func isn't called in second reset")
end)

test("bug: sequence causes action with failed guard to call finish_function", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy

   local action_ff = spy()

   local condition = ConditionNode{
      name = "failing condition",
      entity = {},
      condition = function()
         return false
      end,
   }

   local action = Action{
      name = "test action",
      guard = condition,
      finish_function = action_ff,
      entity = testingHelpers.mockCallable,
   }

   local sequence = Sequence{
      name = "test sequence",
      entity = testingHelpers.mockCallable,
      children = {
         action,
         condition,
      }
   }

   sequence:update()
   ok(callCount(action_ff) == 0, "action:finish_func is called once in update()")
   sequence:reset()
   ok(callCount(action_ff) == 0, "action:finish_func isn't called in reset")
   sequence:reset()
   ok(callCount(action_ff) == 0, "action:finish_func isn't called in second reset")
end)

test("bug: TimeLimiter doesn't call child's finisher when terminating child", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy
   local action_ff = spy()

   local timeLimiter = TimeLimiter{
      name = "interrupter",
      seconds = 1,
      entity = {},
      start = function(self)
         Decorator.start(self)
         self.timer = {
            -- in this test the function is only gonna be called twice so we can use coroutine.wrap like so
            getTimeLeft = coroutine.wrap(function()
               -- first getTimeLeft call returns 1
               coroutine.yield(1)
               -- second getTimeLeft call returns 0
               return 0
            end)
         }
      end,
      child = Action{
         name = "test action",
         entity = testingHelpers.mockCallable,
         running_function = true,
         finish_function = action_ff,
      }
   }

   local result = timeLimiter:update()
   ok(result == NodeState.RUNNING, "first update returns RUNNING status")
   result = timeLimiter:update()
   ok(result == NodeState.SUCCESS, "second update returns SUCCESS status")
   ok(callCount(action_ff) == 1, "action:finish_func is called once if decorator terminated action")
   timeLimiter.child:reset()
   ok(callCount(action_ff) == 1, "extra action:reset call doesn't call action:finish_func")
end)

test("bug: Decorator doesn't call own finish on reset during running", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy

   local decorator = Decorator{
      name = "testdeco",
      entity = {},
      child = Action{
         name = "test action",
         entity = testingHelpers.mockCallable,
         running_function = true,
      }
   }

   local finish_spy = spy(decorator.finish)
   decorator.finish = finish_spy

   local result = decorator:update()
   ok(result == NodeState.RUNNING, "first update returns RUNNING status")
   decorator:reset()
   ok(callCount(finish_spy) == 1, "decorator finish called once on reset")
   decorator:reset()
   ok(callCount(finish_spy) == 1, "decorator finish not called again on second reset")
end)

test("bug: DynamicGuardSelector gap between children", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy

   local state1, state2 = false, false

   local g1 = ConditionNode{
      name = "g1",
      entity = {},
      condition = function()
         return state1
      end
   }
   local a1 = Action{
      name = "a1",
      entity = {},
      running_function = true,
   }
   a1:addGuard(g1)

   local g2 = ConditionNode{
      name = "g2",
      entity = {},
      condition = function()
         return state2
      end
   }
   local a2 = Action{
      name = "a2",
      entity = {},
      running_function = true,
      finish_function = function()
         state1, state2 = true, false
      end,
   }
   a2:addGuard(g2)

   local a3 = Action{
      name = "a3",
      entity = {},
      running_function = true,
   }

   local root = DynamicGuardSelector{
      name = "root",
      entity = {},
      blackboard = {},
      children = {
         a1, a2, a3
      }
   }

   root:update()
   ok(a1.status ~= NodeState.RUNNING, "a1 not running")
   ok(a2.status ~= NodeState.RUNNING, "a2 not running")
   ok(a3.status == NodeState.RUNNING, "a3 running")
   state2 = true
   root:update()
   ok(a1.status ~= NodeState.RUNNING, "a1 not running")
   ok(a2.status == NodeState.RUNNING, "a2 running")
   ok(a3.status ~= NodeState.RUNNING, "a3 not running")
   state2 = false
   root:update()
   ok(a1.status == NodeState.RUNNING, "a1 running")
   ok(a2.status ~= NodeState.RUNNING, "a2 not running")
   ok(a3.status ~= NodeState.RUNNING, "a3 not running")
   state1 = false
   root:update()
   ok(a1.status ~= NodeState.RUNNING, "a1 not running")
   ok(a2.status ~= NodeState.RUNNING, "a2 not running")
   ok(a3.status == NodeState.RUNNING, "a3 running")
end)
