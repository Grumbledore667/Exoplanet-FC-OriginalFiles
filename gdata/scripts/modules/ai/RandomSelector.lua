local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Composite = require "ai.Composite"
local NodeState = require "ai.NodeState"

local seq = require "pl.seq"

---@class ai.RandomSelector : ai.Composite
local RandomSelector = oo.class({
   className = className,
}, Composite)


function RandomSelector:start()
   Composite.start(self)
   self.shuffledIndicesIter = seq.random(#self.children, 1, #self.children)
   self.shuffledIndex = self.shuffledIndicesIter()
end

function RandomSelector:running()
   while self.shuffledIndex ~= nil do
      local childStatus = self.children[self.shuffledIndex]:update()

      if childStatus ~= NodeState.FAILURE then
         return childStatus
      end

      self.shuffledIndex = self.shuffledIndicesIter()
   end
   return NodeState.FAILURE
end

return RandomSelector
