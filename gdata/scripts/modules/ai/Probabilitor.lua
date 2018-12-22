local oo = require "loop.simple"
local Composite = require "ai.Composite"

local Probabilitor = oo.class({
   probabilities = nil,
}, Composite)

function Probabilitor:__init()
   self.probabilities = self.probabilities or {}
end

function Probabilitor:start()
   self.currentIndex = self:getCurrentIndex()
end

function Probabilitor:running()
   local childStatus = self.children[self.currentIndex]:update()
   return childStatus
end

function Probabilitor:getCurrentIndex()
   local value = rand(1)
   local summ = 0
   for i = 1, #self.probabilities do
      summ = summ + self.probabilities[i]
      if (value <= summ) then
         return i
      end
   end
end

return Probabilitor
