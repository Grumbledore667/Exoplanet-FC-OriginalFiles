local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Decorator = require "ai.Decorator"

---@class ai.Finisher : ai.Decorator
local Finisher = oo.class({
   className = className,
}, Decorator)

function Finisher:running()
   return self.child:update()
end

function Finisher:finish()
   if self.finished or self.status == nil then
      return
   end
   self.child:finish()
   if self.finish_function then
      self.finish_function(self.entity)
   end
   self.finished = true
end

function Finisher:reset()
   self:finish()
   self.child:reset()
   self.status = nil
   self.finished = nil
end

return Finisher
