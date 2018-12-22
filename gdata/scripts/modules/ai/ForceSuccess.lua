local oo = require "loop.simple"
local Decorator = require "ai.Decorator"
local NodeState = require "ai.NodeState"

local ForceSuccess = oo.class({}, Decorator)

function ForceSuccess:running()
   local childStatus = self.child:update()
   if childStatus == NodeState.RUNNING then
      return childStatus
   end
   return NodeState.SUCCESS
end

return ForceSuccess
