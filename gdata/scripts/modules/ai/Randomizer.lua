local oo = require "loop.simple"
local Composite = require "ai.Composite"

local Randomizer = oo.class({}, Composite)

function Randomizer:start()
   self.currentIndex = math.random(#self.children)
end

function Randomizer:running()
   local childStatus = self.children[self.currentIndex]:update()
   return childStatus
end

return Randomizer
