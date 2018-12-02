local oo = require "loop.simple"
local CCharacterStatBase = require "characterStatBase"

---A character stat class that can NOT recieve bonuses and CAN regenerate
---@class CCharacterStatSimple : CCharacterStatBase
local CCharacterStatSimple = oo.class({
   regen = nil,
}, CCharacterStatBase)

function CCharacterStatSimple:getRegen()
   return oo.isinstanceof(self.regen, CCharacterStatBase) and self.regen:getValue() or self.regen or 0
end

function CCharacterStatSimple:regenTick(secondsElapsed)
   local val = self:getRegen()
   if val ~= 0 then
      self:changeValue(val * secondsElapsed)
   end
end

return CCharacterStatSimple
