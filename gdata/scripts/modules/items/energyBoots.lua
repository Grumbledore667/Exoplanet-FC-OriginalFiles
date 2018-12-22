local oo = require "loop.simple"
local CItem = (require "items.item").CItem

local CEnergyBoots = oo.class({
}, CItem)

function CEnergyBoots:setClassParams( params )
   CItem.setClassParams( self, params )
   self.jumpStrength = params.jumpStrength
   self.jumpEnergyCost = params.jumpEnergyCost
   self.fallEnergyCost = params.fallEnergyCost
   self.fallDamageBlockMul = params.fallDamageBlockMul
end

function CEnergyBoots:OnActivate()
   --self:playSound( "activate", true )
   local moveSpeed   = self.owner.owner:getMoveSpeed()
   local strafeSpeed = self.owner.owner:getStrafeSpeed()
   local maxSpeed    = moveSpeed

   if ( maxSpeed < strafeSpeed ) then
      maxSpeed = strafeSpeed
   end
   local velocity = self.jumpStrength + maxSpeed * self.owner.owner.parameters.velocityFactor

   self.owner.owner:startJump( velocity )
end

return {CEnergyBoots=CEnergyBoots}
