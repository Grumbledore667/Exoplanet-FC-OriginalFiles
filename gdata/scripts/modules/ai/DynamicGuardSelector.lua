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
   self.currentIndex = 0
end

function DynamicGuardSelector:running()
   local childToRun = 0
   for i, child in ipairs(self.children) do
      if child:checkGuard() then
         childToRun = i
         break
      end
   end

   if self.currentIndex ~= 0 and childToRun ~= self.currentIndex then
      self.children[self.currentIndex]:reset()
      self.currentIndex = 0
   end

   if childToRun == 0 then
      return NodeState.FAILURE
   else
      if self.currentIndex == 0 then
         self.currentIndex = childToRun
      end
      return self.children[self.currentIndex]:update()
   end
end

return DynamicGuardSelector
