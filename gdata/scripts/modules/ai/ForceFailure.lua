local oo = require "loop.simple"
local Decorator = require "ai.Decorator"
local NodeState = require "ai.NodeState"

local ForceFailure = oo.class({}, Decorator)

function ForceFailure:running()
   local childStatus = self.child:update()
   if childStatus == NodeState.RUNNING then
      return childStatus
   end
   return NodeState.FAILURE
end

return ForceFailure
