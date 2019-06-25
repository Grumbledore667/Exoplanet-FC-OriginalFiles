local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Composite = require "ai.Composite"
local random = require "random"

---@class ai.Probabilitor : ai.Composite
local Probabilitor = oo.class({
   probabilities = nil,
   className = className,
}, Composite)

function Probabilitor:__init()
   self.probabilities = self.probabilities or {}
end

function Probabilitor:start()
   Composite.start(self)
   self.currentIndex = self:getCurrentIndex()
end

function Probabilitor:running()
   local childStatus = self.children[self.currentIndex]:update()
   return childStatus
end

function Probabilitor:getCurrentIndex()
   local value = random.random()
   local summ = 0
   for i = 1, #self.probabilities do
      summ = summ + self.probabilities[i]
      if value <= summ then
         return i
      end
   end
end

return Probabilitor
