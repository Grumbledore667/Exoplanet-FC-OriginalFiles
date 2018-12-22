local oo = require "loop.simple"
local Decorator = require "ai.Decorator"
local NodeState = require "ai.NodeState"

local UntilFailure = oo.class({}, Decorator)

function UntilFailure:running()
   local childStatus = self.child:update()
   if childStatus == NodeState.RUNNING then
      return childStatus
   end
   if childStatus == NodeState.SUCCESS then
      self.child:reset()
      return NodeState.RUNNING
   end
   return NodeState.FAILURE
end

return UntilFailure
