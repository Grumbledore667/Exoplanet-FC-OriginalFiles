local oo = require "loop.simple"

---@class CCharacterStatBase
local CCharacterStatBase = oo.class({
   name = nil,
   value = 0,
   min = nil,
   max = nil,
   owner = nil,
})

function CCharacterStatBase:__new(members)
   self = oo.rawnew(self, members)
   self:setValue(self.value)
   return self
end

function CCharacterStatBase:clamp()
   if self.min then
      self.value = math.max(self.value, self:getMin())
   end
   if self.max then
      self.value = math.min(self.value, self:getMax())
   end
end

function CCharacterStatBase:getMin()
   return oo.isinstanceof(self.min, CCharacterStatBase) and self.min:getValue() or self.min
end

function CCharacterStatBase:getMax()
   return oo.isinstanceof(self.max, CCharacterStatBase) and self.max:getValue() or self.max
end

function CCharacterStatBase:getRegen()
   return 0
end

function CCharacterStatBase:getValue(unclamped)
   if not unclamped then
      self:clamp()
   end
   return self.value
end

function CCharacterStatBase:setValue(value)
   self.value = value

   if self.name == "health" and self.owner then
      self.owner:setHealth(value)
      if value <= 0 and not self.owner:getState("dead") then
         self.owner:die()
      end
   end
end

function CCharacterStatBase:changeValue(value)
   self:setValue(self.value + value)
end

function CCharacterStatBase:getPercent()
   local val = self:getValue()
   local min = self:getMin()
   local max = self:getMax()
   if min and max and max ~= min then
      return ((val - min) / (max - min)) * 100
   end
   return 0
end

return CCharacterStatBase
