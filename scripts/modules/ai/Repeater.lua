local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Decorator = require "ai.Decorator"
local NodeState = require "ai.NodeState"

---@class ai.Repeater : ai.Decorator
local Repeater = oo.class({
   times = nil,
   className = className,
}, Decorator)

function Repeater:__init()
   if not self.times then
      log(string.format("WARNING: BT Repeater '%s' times not set", tostring(self.name)))
   end
end


function Repeater:start()
   Decorator.start(self)
   self.currentIndex = 0
end

function Repeater:running()
   while self.currentIndex < self.times do
      local childStatus = self.child:update()

      if childStatus ~= NodeState.SUCCESS then
         return childStatus
      end

      self.currentIndex = self.currentIndex + 1
      self.child:reset()
   end
   return NodeState.SUCCESS
end

return Repeater
