local oo = require "loop.simple"
local Composite = require "ai.Composite"
local NodeState = require "ai.NodeState"

local Sequence = oo.class({}, Composite)

function Sequence:running()
   while(true) do
      local childStatus = self.children[self.currentIndex]:update()

      if(childStatus ~= NodeState.SUCCESS) then
         return childStatus
      end

      if( self.currentIndex < #self.children) then
         self.currentIndex = self.currentIndex+1
      else
         return NodeState.SUCCESS
      end
   end
end

return Sequence
