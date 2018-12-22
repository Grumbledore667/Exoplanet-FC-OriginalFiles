local oo = require "loop.simple"
local Decorator = require "ai.Decorator"
local NodeState = require "ai.NodeState"

local Invertor = oo.class({}, Decorator)

function Invertor:running()
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
end

return Invertor
