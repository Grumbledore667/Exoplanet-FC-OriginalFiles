local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Node = require "ai.Node"

---@class ai.Composite : ai.Node
---@field children ai.Node[]
local Composite = oo.class({
   children = nil,
   className = className,
}, Node)

function Composite:__init()
   self.children = self.children or {}
end

function Composite:start()
   self.currentIndex = 1
end

function Composite:finish()
   local child = self.children[self.currentIndex]
   if child then
      child:finish()
   end
   Node.finish(self)
end

function Composite:addChild(child)
   table.insert(self.children, child)
end

function Composite:removeChild(child)
   table.remove(self.children, child)
end

function Composite:reset()
   self:resetChildren()
   Node.reset(self)
end

function Composite:resetChildren()
   for _, child in ipairs(self.children) do
      child:reset()
   end
end

return Composite
