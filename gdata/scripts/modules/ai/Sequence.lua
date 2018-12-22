local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Composite = require "ai.Composite"
local NodeState = require "ai.NodeState"

---@class ai.Sequence : ai.Composite
local Sequence = oo.class({
   className = className,
}, Composite)

function Sequence:running()
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
end

return Sequence
