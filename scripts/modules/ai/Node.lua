local oo = require "loop.simple"
local hierarchy = require "loop.hierarchy"
local NodeState = require "ai.NodeState"
local random = require "random"
local seq = require "pl.seq"

---@class ai.Node
---@field root ai.Node
---@field name string
---@field guardedName string
---@field className string
---@field status ai.NodeState.SUCCESS | ai.NodeState.RUNNING | ai.NodeState.FAILURE
---@field entity CNPC | CCharacter
---@field start_function fun(CNPC | CCharacter):void
---@field running_function fun(CNPC | CCharacter):boolean
---@field finish_function fun(CNPC | CCharacter):void
---@field history string[] @ list of node names from last ai tick in order of updating
---@field children ai.Node[]
---@field child ai.Node
---@field probabilities number[]
---@field times number
---@field senseName string
---@field stateName string
---@field seconds number
local Node = oo.class{
   name = nil,
   guardedName = nil,
   className = "Node",
   __new = hierarchy.mutator, -- calls __init methods from top parent to child
}

local composites = {}
for _, v in pairs{"Sequence",
             "Probabilitor",
             "Randomizer",
             "Selector",
             "RandomSelector",
             "DynamicGuardSelector",
             "Parallel",} do composites[v] = true end

local decorators = {}
for _, v in pairs{"Decorator",
                  "BehaviorTree",
                  "Repeater",
                  "UntilSuccess",
                  "UntilFailure",
                  "Invertor",
                  "ForceSuccess",
                  "ForceFailure",
                  "Finisher",
                  "TimeLimiter",} do decorators[v] = true end

function Node:__init()
   if not self.name then
      log("WARNING: BT Node name not set")
   end
   local nodeClass = self.className
   if nodeClass == "SenseCondition" then
      --function SenseCondition:__init()
      if not self.senseName then
         log(string.format("WARNING: BT SenseCondition '%s' senseName not set", tostring(self.name)))
      end
   elseif nodeClass == "ButtonCondition" then
      --function ButtonCondition:__init()
      if not self.buttonName then
         log(string.format("WARNING: BT ButtonCondition '%s' buttonName not set", tostring(self.name)))
      end
   elseif nodeClass == "StateCondition" then
      --function StateCondition:__init()
      if not self.stateName then
         log(string.format("WARNING: BT StateCondition '%s' stateName not set", tostring(self.name)))
      end
   elseif nodeClass == "ConditionNode" then
      --function ConditionNode:__init()
      if not self.condition then
         log(string.format("WARNING: BT ConditionNode '%s' condition not set", tostring(self.name)))
      end
   elseif nodeClass == "CoroutineAction" then
      --function CoroutineAction:__init()
      if not self.entity then
         log(string.format("WARNING: BT CoroutineAction '%s' entity not set", tostring(self.name)))
      end
      self.eventQueue = {}
      self.eventArrived = nil
   elseif nodeClass == "Action" or nodeClass == "AnimatedAction" then
      --function Action:__init()
      if not self.entity then
         log(string.format("WARNING: BT Action '%s' entity not set", tostring(self.name)))
      end

      if self.running_function == true then
         self.running_function = (require "ai").utils.running_state
      elseif not self.running_function then -- nil or false
         self.running_function = (require "ai").utils.not_running_state
      end
      if nodeClass == "AnimatedAction" then
         --function AnimatedAction:__init()
         if not self.animation then
            log(string.format("WARNING: BT AnimatedAction '%s' animation not set", tostring(self.name)))
         end
      end
   elseif nodeClass == "Wait" then
      --function Wait:__init()
      if not self.seconds then
         log(string.format("WARNING: BT Wait '%s' seconds not set", tostring(self.name)))
      end
   elseif composites[nodeClass] then
      --function Composite:__init()
      self.children = self.children or {}
      if nodeClass == "Probabilitor" then
         --function Probabilitor:__init()
         self.probabilities = self.probabilities or {}
      end
   elseif decorators[nodeClass] then
      --function Decorator:__init()
      if not self._preinit and not self.child then
         log(string.format("WARNING: BT Decorator '%s' child not set", tostring(self.name)))
      end
      if nodeClass == "Repeater" then
         --function Repeater:__init()
         if not self.times then
            log(string.format("WARNING: BT Repeater '%s' times not set", tostring(self.name)))
         end
      elseif nodeClass == "BehaviorTree" then
         --function BehaviorTree:__init()
         if not self._preinit and not self.child then
            log(string.format("WARNING: BT BehaviorTree '%s' root child not set", tostring(self.name)))
         end
      elseif nodeClass == "TimeLimiter" then
         --function TimeLimiter:__init()
         if not self.seconds then
            log(string.format("WARNING: BT TimeLimiter '%s' seconds not set", tostring(self.name)))
         end
      end
   end
end

local function getCurrentIndex(probabilities)
   --function Probabilitor:getCurrentIndex()
   local value = random.random()
   local summ = 0
   for i = 1, #probabilities do
      summ = summ + probabilities[i]
      if value <= summ then
         return i
      end
   end
end

local function runCoroutine(coroNode, ...)
   --function CoroutineAction:runRoutine(...)
   local function notificationPoster(handler)
      coroNode.entity.eventManager:postEvent("coroutineEvent", handler)
      if coroNode.handler and coroNode.handler:checkEventMatch(handler) then
         coroNode.eventArrived = handler
         coroNode.entity.shouldTickAI = true
      end
   end

   local result
   local args = table.pack(coroutine.resume(coroNode.routine, ...))
   local ok = args[1]
   if ok and coroutine.status(coroNode.routine) ~= "dead" then
      coroNode.handler = args[2]
      coroNode.handler:init(notificationPoster)
      result = NodeState.RUNNING
   else
      if coroNode.handler then
         coroNode.handler:destroy()
      end
      result = NodeState.SUCCESS
   end
   if not ok then
      local err = args[2]
      log(err)
   end
   return result
end

function Node:condition(entity)
   local nodeClass = self.className
   if nodeClass == "SenseCondition" then
      --function SenseCondition:condition(entity)
      return entity.senseScheduler:getSense(self.senseName)
   elseif nodeClass == "StateCondition" then
      --function StateCondition:condition(entity)
      return entity:getState(self.stateName)
   end
end

function Node:setRoot(root)
   self.root = root
end

function Node:getBBVar(key)
   return self.root.blackboard[key]
end

function Node:setBBVar(key, value)
   self.root.blackboard[key] = value
end

function Node:addGuard(guard)
   self.guard = guard
   if guard then
      guard.guardedName = self.name
   end
end

function Node:start()
   local nodeClass = self.className
   if nodeClass == "CoroutineAction" then
      local function eventInserter(_, data)
         table.insert(self.eventQueue, data)
      end
      self.eventCallback = self.entity.eventManager:subscribeToEvent("coroutineEvent", eventInserter)
   elseif nodeClass == "Action" or nodeClass == "AnimatedAction" then
      if nodeClass == "AnimatedAction" then
         self.callbackObj = self.entity.animationsManager:subscribeAnimationEnd(self.animation,
            function() self.stopEventArrived = true end)
      end
      if self.start_function then
         self.start_function(self.entity)
      end
   elseif nodeClass == "Wait" then
      self.timer = runTimer(self.seconds, nil, nil, false)
   elseif nodeClass == "Probabilitor" then
      self.currentIndex = getCurrentIndex(self.probabilities)
   elseif nodeClass == "Selector" or nodeClass == "Sequence" then
      self.currentIndex = 1
   elseif nodeClass == "RandomSelector" then
      self.currentIndex = 1
      self.shuffledIndicesIter = seq.random(#self.children, 1, #self.children)
      self.shuffledIndex = self.shuffledIndicesIter()
   elseif nodeClass == "Randomizer" then
      self.currentIndex = random.random(#self.children)
   elseif nodeClass == "DynamicGuardSelector" then
      self.currentIndex = nil
   elseif nodeClass == "Parallel" then
      self.currentIndex = 0
      self.noRunningTasks = true
   elseif nodeClass == "Repeater" then
      self.currentIndex = 0
   elseif nodeClass == "TimeLimiter" then
      self.timer = runTimer(self.seconds, nil, nil, false)
   end
end

function Node:addChild(child)
   table.insert(self.children, child)
end

local function findFirstChildWithPassingGuard(children)
   for i, child in ipairs(children) do
      if child:checkGuard() then
         return i
      end
   end
end

local function onParallelChildSuccess(parallel)
   if parallel.policy == "sequence" then
      if parallel.orchestrator == "join" then
         if parallel.noRunningTasks and parallel.children[#parallel.children].status == NodeState.SUCCESS then
            return true
         end
         return nil
      elseif parallel.orchestrator == "resume" then
         if parallel.noRunningTasks and parallel.currentIndex == #parallel.children then
            return true
         end
         return nil
      end
   elseif parallel.policy == "selector" then
      return true
   end
end

local function onParallelChildFailure(parallel)
   if parallel.policy == "sequence" then
      return false
   elseif parallel.policy == "selector" then
      if parallel.noRunningTasks and parallel.currentIndex == #parallel.children then
         return false
      end
      return nil
   end
end

function Node:running()
   local nodeClass = self.className
   if nodeClass == "SenseCondition" then
      --function SenseCondition:running()
      local result = self:condition(self.entity)
      if result then
         return NodeState.SUCCESS
      else
         return NodeState.FAILURE
      end
   elseif nodeClass == "ButtonCondition" then
      --function ButtonCondition:running()
      local result = getButton(self.buttonName)
      if result then
         return NodeState.SUCCESS
      else
         return NodeState.FAILURE
      end
   elseif nodeClass == "StateCondition" then
      --function StateCondition:running()
      local result = self:condition(self.entity)
      if result then
         return NodeState.SUCCESS
      else
         return NodeState.FAILURE
      end
   elseif nodeClass == "ConditionNode" then
      --function ConditionNode:running()
      -- we call here self.condition without passing it a self BY DESIGN
      -- this is NOT AN ERROR
      local result = self.condition(self.entity)
      if result then
         return NodeState.SUCCESS
      else
         return NodeState.FAILURE
      end
   elseif nodeClass == "ReactiveGuard" then
      --function ReactiveGuard:running()
      local guardedName = self.guardedName

      local req = self:getBBVar("_request")

      if req and req[guardedName] then
         if req[guardedName] == "start" then
            self:setBBVar(guardedName, true)
            return NodeState.SUCCESS
         elseif req[guardedName] == "stop" then
            self:setBBVar(guardedName, false)
         end
      elseif self:getBBVar(guardedName) then
         return NodeState.SUCCESS
      end

      return NodeState.FAILURE
   elseif nodeClass == "CoroutineAction" then
      --function CoroutineAction:running()
      if not self.routine then
         self.routine = coroutine.create(self.running_function)
         -- first execution sends self.entity to self argument of running_function
         return runCoroutine(self, self.entity)
      elseif self.eventArrived then
         local event = self.eventArrived
         self.eventArrived = nil
         return runCoroutine(self, event)
      else
         for _, event in ipairs(self.eventQueue) do
            if self.handler:checkEventMatch(event) then
               self.eventQueue = {}
               return runCoroutine(self, event)
            end
         end
         self.eventQueue = {}
      end
      return NodeState.RUNNING
   elseif nodeClass == "Action" or nodeClass == "AnimatedAction" then
      --function Action:running()
      if nodeClass == "AnimatedAction" then
         --function AnimatedAction:running()
         if self.stopEventArrived then
            return NodeState.SUCCESS
         else
            return NodeState.RUNNING
         end
      else
         if not self.running_function(self.entity) then
            return NodeState.SUCCESS
         else
            return NodeState.RUNNING
         end
      end
   elseif nodeClass == "Wait" then
      --function Wait:running()
      if self.timer:getTimeLeft() > 0 then
         return NodeState.RUNNING
      end
      return NodeState.SUCCESS
   elseif nodeClass == "Failer" then
      --function Failer:running()
      return NodeState.FAILURE
   elseif nodeClass == "Succeeder" then
      --function Succeeder:running()
      return NodeState.SUCCESS
   elseif nodeClass == "Sequence" then
      --function Sequence:running()
      while true do
         local childStatus = self.children[self.currentIndex]:update()

         if childStatus ~= NodeState.SUCCESS then
            return childStatus
         end

         if self.currentIndex < #self.children then
            self.currentIndex = self.currentIndex+1
         else
            return NodeState.SUCCESS
         end
      end
   elseif nodeClass == "Selector" then
      --function Selector:running()
      while self.currentIndex <= #self.children do
         local childStatus = self.children[self.currentIndex]:update()

         if childStatus ~= NodeState.FAILURE then
            return childStatus
         end

         self.currentIndex = self.currentIndex + 1
      end
      return NodeState.FAILURE
   elseif nodeClass == "RandomSelector" then
      --function RandomSelector:running()
      while self.shuffledIndex ~= nil do
         local childStatus = self.children[self.shuffledIndex]:update()

         if childStatus ~= NodeState.FAILURE then
            return childStatus
         end

         self.shuffledIndex = self.shuffledIndicesIter()
      end
      return NodeState.FAILURE
   elseif nodeClass == "Randomizer" or nodeClass == "Probabilitor" then
      local childStatus = self.children[self.currentIndex]:update()
      return childStatus
   elseif nodeClass == "DynamicGuardSelector" then
      --function DynamicGuardSelector:running()
      local childToRun = findFirstChildWithPassingGuard(self.children)

      if self.currentIndex and childToRun ~= self.currentIndex then
         self.children[self.currentIndex]:reset()
         self.currentIndex = nil
         --recheck children guards in case reset changed things (like in finisher events)
         childToRun = findFirstChildWithPassingGuard(self.children)
      end

      if not childToRun then
         return NodeState.FAILURE
      else
         if not self.currentIndex then
            self.currentIndex = childToRun
         end
         return self.children[self.currentIndex]:update()
      end
   elseif nodeClass == "Parallel" then
      --function Parallel:running()
      -- 'resume' restarts finished children, 'join' does not
      -- 'sequence' fails with first failed child and succeeds when all children returned success
      -- 'selector' succeeds with first success and fails when all failed
      -- both selector and sequence reset all children when finished
      self.noRunningTasks = true
      local childResult
      local helperResult

      for i, child in ipairs(self.children) do
         self.currentIndex = i
         if self.orchestrator == "resume" then
            if child.status ~= NodeState.RUNNING and child.status ~= nil then
               child:reset()
            end
            childResult = child:update()
            helperResult = nil
            if childResult == NodeState.SUCCESS then
               helperResult = onParallelChildSuccess(self)
            elseif childResult == NodeState.FAILURE then
               helperResult = onParallelChildFailure(self)
            elseif childResult == NodeState.RUNNING then
               self.noRunningTasks = false
            end
            if helperResult ~= nil then
               self:resetChildren()
               if helperResult then
                  return NodeState.SUCCESS
               else
                  return NodeState.FAILURE
               end
            end
         elseif self.orchestrator == "join" then
            childResult = nil
            helperResult = nil
            if child.status ~= NodeState.SUCCESS and child.status ~= NodeState.FAILURE then
               childResult = child:update()
            end
            if childResult == NodeState.SUCCESS then
               helperResult = onParallelChildSuccess(self)
            elseif childResult == NodeState.FAILURE then
               helperResult = onParallelChildFailure(self)
            elseif childResult == NodeState.RUNNING then
               self.noRunningTasks = false
            end
            if helperResult ~= nil then
               self:resetChildren()
               if helperResult then
                  return NodeState.SUCCESS
               else
                  return NodeState.FAILURE
               end
            end
         end
      end
      return NodeState.RUNNING
   elseif nodeClass == "Decorator" or nodeClass == "BehaviorTree" or nodeClass == "Finisher" then
      return self.child:update()
   elseif nodeClass == "ForceSuccess" then
      --function ForceSuccess:running()
      local childStatus = self.child:update()
      if childStatus == NodeState.RUNNING then
         return childStatus
      end
      return NodeState.SUCCESS
   elseif nodeClass == "ForceFailure" then
      --function ForceFailure:running()
      local childStatus = self.child:update()
      if childStatus == NodeState.RUNNING then
         return childStatus
      end
      return NodeState.FAILURE
   elseif nodeClass == "UntilSuccess" then
      --function UntilSuccess:running()
      local childStatus = self.child:update()
      if childStatus == NodeState.RUNNING then
         return childStatus
      end
      if childStatus == NodeState.FAILURE then
         self.child:reset()
         return NodeState.RUNNING
      end
      return NodeState.SUCCESS
   elseif nodeClass == "UntilFailure" then
      --function UntilFailure:running()
      local childStatus = self.child:update()
      if childStatus == NodeState.RUNNING then
         return childStatus
      end
      if childStatus == NodeState.SUCCESS then
         self.child:reset()
         return NodeState.RUNNING
      end
      return NodeState.FAILURE
   elseif nodeClass == "Invertor" then
      --function Invertor:running()
      local childStatus = self.child:update()
      if childStatus == NodeState.RUNNING then
         return childStatus
      end
      if childStatus == NodeState.FAILURE then
         return NodeState.SUCCESS
      end
      if childStatus == NodeState.SUCCESS then
         return NodeState.FAILURE
      end
   elseif nodeClass == "Repeater" then
      --function Repeater:running()
      while self.currentIndex < self.times do
         local childStatus = self.child:update()

         if childStatus ~= NodeState.SUCCESS then
            return childStatus
         end

         self.currentIndex = self.currentIndex + 1
         self.child:reset()
      end
      return NodeState.SUCCESS
   elseif nodeClass == "TimeLimiter" then
      --function TimeLimiter:running()
      if self.timer:getTimeLeft() > 0 then
         return self.child:update()
      end

      self.child:reset()
      return NodeState.SUCCESS
   end
end

local finishFunctionWhitelist = {
   ["Action"]          = true,
   ["AnimatedAction"]  = true,
   ["CoroutineAction"] = true,
   ["Finisher"]        = true,
}

function Node:finish()
   local nodeClass = self.className
   if nodeClass == "CoroutineAction" then
      self.entity.eventManager:unsubscribeFromEvent("coroutineEvent", self.eventCallback)
      if self.handler then
         self.handler:destroy()
         self.handler = nil
      end
      self.eventCallback = nil
      self.eventQueue = {}
      self.eventArrived = nil
      self.routine = nil
   elseif nodeClass == "AnimatedAction" then
      self.entity.animationsManager:removeAnimationCallback(self.animation, self.callbackObj)
      self.callbackObj = nil
      self.stopEventArrived = false
   end
   if finishFunctionWhitelist[nodeClass] then
      if self.finish_function then
         self.finish_function(self.entity)
      end
   end
   if self.guard and self.guard.className == "ReactiveGuard" then
      self:setBBVar(self.name, false)
   end
end

function Node:preUpdate()
   local item = {
      name = self.name,
      className = self.className,
   }
   setmetatable(item, self)
   if self.root and self.root ~= self then
      local history = self.root.history
      table.insert(history, item)
      item._indent = history._indent
      history._indent = history._indent + 1
      item.guard = history._guard
   end
   return item
end

function Node:postUpdate(item)
   item.status = self.status
   if self.root and self.root ~= self then
      self.root.history._indent = item._indent
   end
end

function Node:preGuard()
   if self.root and self.root ~= self then
      self.root.history._guard = true
   end
end

function Node:postGuard()
   if self.root and self.root ~= self then
      self.root.history._guard = false
   end
end

function Node:checkGuard()
   if not self.guard then
      return true
   end

   self:preGuard()
   if not self.guard:checkGuard() then
      self:postGuard()
      return false
   end

   self.guard:reset()
   local guardState = self.guard:update()
   self:postGuard()
   if guardState == NodeState.SUCCESS then
      return true
   elseif guardState == NodeState.FAILURE then
      return false
   elseif guardState == NodeState.RUNNING then
      error("AI: Guard can't be non-atomic")
   else
      error("AI: Unknown guard state")
   end
end

function Node:update()
   local item = self:preUpdate()

   if self.status ~= NodeState.RUNNING then
      if not self:checkGuard() then
         self.status = NodeState.FAILURE
         self:postUpdate(item)
         return self.status
      end
      self:start()
   end
   self.status = self:running()

   if self.status ~= NodeState.RUNNING then
      self:finish()
   end
   self:postUpdate(item)
   return self.status
end

function Node:reset()
   if self.child then
      --decorators
      self.child:reset()
   elseif self.children then
      --composites
      self:resetChildren()
   end
   local nodeClass = self.className
   if nodeClass == "Wait" or nodeClass == "TimeLimiter" then
      if self.timer then
         self.timer:stop()
         self.timer = nil
      end
   elseif nodeClass == "Parallel" then
      self.noRunningTasks = true
   end
   if self.status == NodeState.RUNNING then
      self:finish()
   end
   self.status = nil
end

function Node:resetChildren()
   for _, child in ipairs(self.children) do
      child:reset()
   end
end

function Node:init()
   --BehaviorTree
   self:setRoot(self)
   local iterBranch = (require "ai").utils.iterBranch
   for node in iterBranch(self) do
      node:setRoot(self)
   end
end

function Node:setBlackboard(blackboard)
   --BehaviorTree
   self.blackboard = blackboard
end

function Node:requestBehaviorStart(name)
   --BehaviorTree
   local request = self:getBBVar("_nextRequest") or {}
   request[name] = "start"
   self:setBBVar("_nextRequest", request)

   self.entity.shouldTickAI = true
end

function Node:requestBehaviorStop(name)
   --BehaviorTree
   local request = self:getBBVar("_nextRequest") or {}
   request[name] = "stop"
   self:setBBVar("_nextRequest", request)

   self.entity.shouldTickAI = true
end

function Node:tick()
   --BehaviorTree
   self.history = {_indent=0}
   -- TODO: replace with self.entity:getSleep() when it's added to method table
   if self.entity:getState("engineSleep") then
      return
   end
   self.entity.eventManager:postEvent("coroutineEvent", "BehaviorTreeTick")
   self:setBBVar("_request", self:getBBVar("_nextRequest"))
   self:setBBVar("_nextRequest", nil)
   local result = self:update()

   if result ~= NodeState.RUNNING then
      self:reset()
   end
   self:setBBVar("_request", nil)
end

return Node
