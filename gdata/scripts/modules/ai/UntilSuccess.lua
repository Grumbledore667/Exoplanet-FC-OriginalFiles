local oo = require "loop.simple"
local Decorator = require "ai.Decorator"
local NodeState = require "ai.NodeState"

local UntilSuccess = oo.class({}, Decorator)

function UntilSuccess:running()
   local childStatus = self.child:update()
   if childStatus == NodeState.RUNNING then
      return childStatus
   end
   if childStatus == NodeState.FAILURE then
      self.child:reset()
      return NodeState.RUNNING
   end
   return NodeState.SUCCESS
end

return UntilSuccess
