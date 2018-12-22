local oo = require "loop.simple"
local Decorator = require "ai.Decorator"
local NodeState = require "ai.NodeState"

local BehaviorTree = oo.class({}, Decorator)

function BehaviorTree:__init()
   if not self._preinit and not self.child then
      log(string.format("WARNING: BT BehaviorTree '%s' root child not set", tostring(self.name)))
   end
   self:setBlackboard(self.blackboard or {})
end

function BehaviorTree:running()
   return self.child:update()
end

function BehaviorTree:tick()
   local result = self:update()

   if result ~= NodeState.RUNNING then
      self:reset()
   end
end

return BehaviorTree
