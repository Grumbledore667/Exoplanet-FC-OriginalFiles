local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Decorator = require "ai.Decorator"
local NodeState = require "ai.NodeState"

local CBTCoroutineManager = require "coroutines.behaviorTreeManager"

---@class ai.BehaviorTree : ai.Decorator
---@field history string[] @ list of node names from last ai tick in order of updating
local BehaviorTree = oo.class({
   className = className,
}, Decorator)

function BehaviorTree:__init()
   if not self._preinit and not self.child then
      log(string.format("WARNING: BT BehaviorTree '%s' root child not set", tostring(self.name)))
   end
end

function BehaviorTree:init()
   self:setRoot(self)
   local iterBranch = (require "ai").utils.iterBranch
   for node in iterBranch(self) do
      node:setRoot(self)
   end
   self.coroutineManager = CBTCoroutineManager("BTCoroutineManager", self)
end

function BehaviorTree:setBlackboard(blackboard)
   self.blackboard = blackboard
end

function BehaviorTree:requestBehaviorStart(name)
   local request = self:getBBVar("_nextRequest") or {}
   request[name] = "start"
   self:setBBVar("_nextRequest", request)

   self.entity.shouldTickAI = true
end

function BehaviorTree:requestBehaviorStop(name)
   local request = self:getBBVar("_nextRequest") or {}
   request[name] = "stop"
   self:setBBVar("_nextRequest", request)

   self.entity.shouldTickAI = true
end

function BehaviorTree:tick()
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

return BehaviorTree
