local oo = require "loop.simple"
local CCharacterStatBase = require "characterStatBase"

---A character stat class that CAN recieve bonuses and can NOT regenerate
---@class CCharacterStatModified : CCharacterStatBase
local CCharacterStatModified = oo.class({
   baseValue = 0,
   modifiers = nil,
}, CCharacterStatBase)

function CCharacterStatModified:__new(members)
   self = oo.rawnew(self, members)
   self.modifiers = {}
   return self
end

---Calculates getValue on demand, allows to have custom logic in every modifier's getter
---Might be expensive for stats with lots of modifiers if used multiple times during the frame
---@param unclamped boolean whether to clamp
function CCharacterStatModified:getValue(unclamped)
   self.value = self.baseValue
   local totalMult = 0
   for modifier in pairs(self.modifiers) do
      local modType = modifier:getType()
      if modType == "Flat" then
         self.value = self.value + modifier:getValue()
      elseif modType == "Mult" then
         totalMult = totalMult + modifier:getValue()
      elseif modType == "Ovrd" then
         return modifier:getValue()
      end
   end
   self.value = self.value + self.value * totalMult

   if not unclamped then
      self:clamp()
   end
   return self.value
end

function CCharacterStatModified:setValue(value)
   self.baseValue = value
end

function CCharacterStatModified:changeValue(value)
   self.baseValue = self.baseValue + value
end

function CCharacterStatModified:addModifier(mod)
   self.modifiers[mod] = true
   mod.affectedStat = self
end

function CCharacterStatModified:removeModifier(mod)
   self.modifiers[mod] = nil
   mod.affectedStat = nil
end

return CCharacterStatModified
