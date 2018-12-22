local oo = require "loop.simple"
local Node = require "ai.Node"

local Composite = oo.class({
   children = nil,
}, Node)

function Composite:__init()
   self.children = self.children or {}
end

function Composite:setBlackboard(bb)
   Node.setBlackboard(self, bb)
   for _, child in pairs(self.children) do
      child:setBlackboard(bb)
   end
end

function Composite:start()
   self.currentIndex = 1
end

function Composite:addChild(child)
   table.insert(self.children, child)
end

function Composite:removeChild(child)
   table.remove(self.children, child)
end

function Composite:reset()
   Node.reset(self)
   self:resetChildren()
end

function Composite:resetChildren()
   for _, child in ipairs(self.children) do
      child:reset()
   end
end

return Composite
