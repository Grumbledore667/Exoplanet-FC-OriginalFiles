local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Composite = require "ai.Composite"
local random = require "random"

---@class ai.Randomizer : ai.Composite
local Randomizer = oo.class({
   className = className,
}, Composite)

function Randomizer:start()
   Composite.start(self)
   self.currentIndex = random.random(#self.children)
end

function Randomizer:running()
   local childStatus = self.children[self.currentIndex]:update()
   return childStatus
end

return Randomizer
