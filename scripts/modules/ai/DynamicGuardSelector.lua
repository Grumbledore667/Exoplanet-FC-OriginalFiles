local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Composite = require "ai.Composite"
local NodeState = require "ai.NodeState"

---@class ai.DynamicGuardSelector : ai.Composite
local DynamicGuardSelector = oo.class({
   className = className,
}, Composite)

function DynamicGuardSelector:start()
   Composite.start(self)
   self.currentIndex = nil
end

function DynamicGuardSelector:findFirstChildWithPassingGuard()
   for i, child in ipairs(self.children) do
      if child:checkGuard() then
         return i
      end
   end
end

function DynamicGuardSelector:running()
   local childToRun = self:findFirstChildWithPassingGuard()

   if self.currentIndex and childToRun ~= self.currentIndex then
      self.children[self.currentIndex]:reset()
      self.currentIndex = nil
      --recheck children guards in case reset changed things (like in finisher events)
      childToRun = self:findFirstChildWithPassingGuard()
   end

   if not childToRun then
      return NodeState.FAILURE
   else
      if not self.currentIndex then
         self.currentIndex = childToRun
      end
      return self.children[self.currentIndex]:update()
   end
end

return DynamicGuardSelector
