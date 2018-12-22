local oo = require "loop.simple"
local CStatusEffectBase = (require "statusEffects.statusEffectBase")
local CBasicArmor = oo.class({}, CStatusEffectBase)

function CBasicArmor:init()
   self.params.visible = false
   self.params.saved = false

   CStatusEffectBase.init( self )

   self.params.statBonuses.armorFlat = self.armorFlat
end

function CBasicArmor:armorFlat()
   local value = 0
   local char = self.owner.owner
   for _,item in pairs(char.itemsManager.slots) do
      value = value + item:getArmor()
   end
   return value
end

return CBasicArmor
