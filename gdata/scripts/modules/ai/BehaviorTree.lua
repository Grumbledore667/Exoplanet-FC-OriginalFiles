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
   local iterBranch = (require "ai").utils.iterBranch
   for node in iterBranch(self) do
      node:setRoot(self)
   end
   self.coroutineManager = CBTCoroutineManager("BTCoroutineManager", self)
end

function BehaviorTree:setBlackboard(blackboard)
   self.blackboard = blackboard
end

function BehaviorTree:running()
   return self.child:update()
end

function BehaviorTree:tick()
   self.history = {_indent=0}
   -- TODO: replace with self.entity:getSleep() when it's added to method table
   if self.entity:getState("engineSleep") then
      return
   end
   self.entity.eventManager:postEvent("coroutineEvent", "BehaviorTreeTick")
   local result = self:update()

   if result ~= NodeState.RUNNING then
      self:reset()
   end
end

return BehaviorTree
