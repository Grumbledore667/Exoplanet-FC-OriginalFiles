local oo = require "loop.simple"
local CStatusEffectBase = (require "statusEffects.statusEffectBase")
local CBasicStatUpgrade = oo.class({}, CStatusEffectBase)
local hlp = require "helpers"

function CBasicStatUpgrade:init()
   self.params.visible = false
   self.params.saved = false

   self.params.statBonuses.healthMaxFlat = self.healthMaxFlat
   self.params.statBonuses.staminaMaxFlat = self.staminaMaxFlat
   self.params.statBonuses.energyMaxFlat = self.energyMaxFlat

   CStatusEffectBase.init(self)
end

function CBasicStatUpgrade:getLabel()
   return "Stat Upgrades"
end

function CBasicStatUpgrade:healthMaxFlat()
   local char = self.owner.owner
   return round(char.assignedAttributes.healthMax * char.upgradeBonuses.healthMax * hlp.CGParam("statsUpgradeBonusMul"):get())
end

function CBasicStatUpgrade:staminaMaxFlat()
   local char = self.owner.owner
   return round(char.assignedAttributes.staminaMax * char.upgradeBonuses.staminaMax * hlp.CGParam("statsUpgradeBonusMul"):get())
end

function CBasicStatUpgrade:energyMaxFlat()
   local char = self.owner.owner
   return round(char.assignedAttributes.energyMax * char.upgradeBonuses.energyMax * hlp.CGParam("statsUpgradeBonusMul"):get())
end

return CBasicStatUpgrade
