local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Composite = require "ai.Composite"
local NodeState = require "ai.NodeState"

---@class ai.Selector : ai.Composite
local Selector = oo.class({
   className = className,
}, Composite)

function Selector:running()
   while self.currentIndex <= #self.children do
      local childStatus = self.children[self.currentIndex]:update()

      if childStatus ~= NodeState.FAILURE then
         return childStatus
      end

      self.currentIndex = self.currentIndex + 1
   end
   return NodeState.FAILURE
end

return Selector
