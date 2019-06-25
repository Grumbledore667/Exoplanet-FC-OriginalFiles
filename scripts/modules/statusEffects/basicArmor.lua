local oo = require "loop.simple"
local CStatusEffectBase = (require "statusEffects.statusEffectBase")
local CBasicArmor = oo.class({}, CStatusEffectBase)

function CBasicArmor:init()
   self.params.visible = false
   self.params.saved = false

   self.params.statBonuses.armorFlat = self.armorFlat

   CStatusEffectBase.init(self)
end

function CBasicArmor:armorFlat()
   local value = 0
   local char = self.owner.owner
   for _,item in pairs(char:getInventory():getSlots()) do
      value = value + (item:getArmor() or 0)
   end
   return value
end

return CBasicArmor
