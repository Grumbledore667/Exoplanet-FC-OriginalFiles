local oo = require "loop.simple"
local Composite = require "ai.Composite"
local NodeState = require "ai.NodeState"

local DynamicGuardSelector = oo.class({}, Composite)

function DynamicGuardSelector:start()
   self.currentIndex = 0
end

function DynamicGuardSelector:running()
   local childToRun = 0
   for i, child in ipairs(self.children) do
      if child.guard ~= nil then
         child.guard:reset()
         if child.guard:update() == NodeState.SUCCESS then
            childToRun = i
            break
         end
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
