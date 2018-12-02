local oo = require "loop.simple"

---@class CCharacterStatModifier
local CCharacterStatModifier = oo.class({
   value = 0,
   type = "Flat",
   source = nil, --Item or status effect
   affectedStat = nil,
})

function CCharacterStatModifier:getValue()
   local stackCount = 1
   if self.source and self.source.getStackCount then
      stackCount = self.source:getStackCount()
   end
   if type(self.value) == "function" then
      return self.value(self.source) * stackCount
   end
   return self.value * stackCount
end

function CCharacterStatModifier:getType()
   return self.type
end

function CCharacterStatModifier:getSource()
   return self.source
end

return CCharacterStatModifier
