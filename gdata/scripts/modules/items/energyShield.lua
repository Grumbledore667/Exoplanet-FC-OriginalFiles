local oo = require "loop.simple"
local CItem = (require "items.item").CItem

local CEnergyShield = oo.class({}, CItem)

function CEnergyShield:setClassParams(params)
   CItem.setClassParams(self, params)
   self.dmgPerEnergy = params.dmgPerEnergy
end

function CEnergyShield:OnEquip(slotId, silent)
   CItem.OnEquip(self, slotId, silent)
   --self:playSound("activate", true)
   self:getPose():setParent(self:getOwner():getOwner():getPose())
   self:getPose():resetLocalPose()
   self:getPose():setLocalScale({x=0.065,y=0.135,z=0.065})
end

function CEnergyShield:reduceDamage(damage)
   local energy = self:getOwner():getOwner():getStatCount("energy")

   if energy > 0 then
      local energyDelta = - math.ceil( damage/self.dmgPerEnergy)
      self.owner.owner:changeStatCount("energy", energyDelta)
      damage = math.max(0, damage - energy*self.dmgPerEnergy)

      self:show()
      runTimer(0.2, self, self.hide, false)
      self:playSound("activate", true)
   end
   return damage
end

return {CEnergyShield=CEnergyShield}
