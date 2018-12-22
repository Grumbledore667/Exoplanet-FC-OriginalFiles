local oo = require "loop.simple"
local CItem = (require "items.item").CItem
local tablex = require "pl.tablex"
local CGun = oo.class({}, CItem)

local CGunShock = oo.class({}, CGun)

local CGunFlare = oo.class({}, CGun)

function CGunFlare:OnHitTarget(params)
   -- impactor - damage source object (item)
   -- impactType - string (ranged, melee, explosion)
   -- impactPos - impact position
   -- impactForce - set by engine, can be changed
   -- impactRadius - set by engine, can be changed
   -- target - target object (character, rigid)
   -- targetType - target type (string) (character, rigid)
   -- interrupt - boolean, defaults to false. if set to true - stops hit event propagation
   CGun.OnHitTarget(self, params)
   if params.targetType ~= "character" then
      local obj = params.target
      local pos = params.impactPos
      local omniPos = tablex.deepcopy(params.impactPos)

      --place emitters and omni a bit ealier so they won't sink into meshes
      local dir = vec3Normalize( vec3Sub( pos, self:getPose():getPos() ) )
      pos = vec3Sub( pos, vec3Mul( dir, 7 ) )

      if params.targetType == "terrain" then
         omniPos.y = params.impactPos.y + 130
      end

      local emitter1 = self:createAspect("flare_hit_black.sps")
      local emitter2 = self:createAspect("flare_hit_red.sps")
      local emitter3 = self:createAspect("flare_hit_sparks.sps")
      emitter1:getPose():setPos( pos )
      emitter2:getPose():setPos( pos )
      emitter3:getPose():setPos( pos )

      local omni = self:createAspect( "omni" )
      omni:getPose():setPos( omniPos )
      omni:setColor( self.light.color )
      omni:setRadius( self.light.radius )
      omni:setIntensity( self.light.intensity )
      local omniTimer = runTimer( 0.1, { intensity = self.light.intensity, omni = omni }, omniFlicker, true )

      if obj then
         local pose = obj:getPose()
         emitter1:getPose():setParent( pose )
         emitter2:getPose():setParent( pose )
         emitter3:getPose():setParent( pose )
         omni:getPose():setParent( pose )
      end

      local delay = self.hitEffect.duration or 5
      runTimer(delay, nil, function()
         self:destroyAspect(emitter1)
         self:destroyAspect(emitter2)
         self:destroyAspect(emitter3)
         if omni then
            self:destroyAspect(omni)
            omniTimer:stop()
         end
      end, false)
   end
end

function CGunShock:setClassParams( params )
   CGun.setClassParams( self, params )
   self:initParam( "energyCost", params.energyCost, 10 )
end

function CGunShock:OnActivate()
   if self.owner.owner:getStatCount("energy") >= self.energyCost then
      self:OnShot()
      self:showFlash()
      runTimer( 0.01, self, self.fadeOmni, false )
   else
      self:OnShotEmpty()
   end
end

function CGunShock:OnShot()
   CItem.OnActivate( self )

   self.owner.owner:changeStatCount("energy", -self.energyCost)
end

function CGunShock:getAmmoCount()
   local mag = math.floor(self.owner.owner:getStatCount("energy") / self.energyCost)
   return mag
end

local function OnLoadGun(self)
   local ammoMissing = self.magazineMax - self.magazine
   local ammoLoad = ammoMissing
   if self.activeAmmo then
      if self.activeAmmo.count < ammoMissing then
         ammoLoad = self.activeAmmo.count
      end
      if self:getReloadAnimations() == "shotgun1" or self:getReloadAnimations() == "carbine" then
         ammoLoad = 1
      end
      if ammoLoad > 0 then
         self.activeAmmo:changeCount(-ammoLoad)
         self.magazine = self.magazine + ammoLoad
      end

      if self.owner.mainInventoryUI then
         self.owner:updateInventoryUI()
      end
   end
   self:updateOwnerAmmo()
   self:updateActiveAmmo()
   if ( self.owner.owner.updateAmmoGui ) then
      self.owner.owner:updateAmmoGui()
   end
end

function CGun:OnCreate()
   CItem.OnCreate( self )

   self.omni = self:createAspect( "omni" )
   self.omni:getPose():setParent( self:getPose() )
   self.omni:getPose():resetLocalPose()
   self.omni:getPose():setLocalPos( {x=0,y=0,z=-100} )
   self.omni:setColor( {r=0.5,g=0.5,b=0.5} )

   self:hideFlash()
   self.OnLoadGun = OnLoadGun -- TODO:FIXME: sidestep lua memory corruption
   self:setGameGroups("0")
end

function CGun:setClassParams( params )
   CItem.setClassParams( self, params )

   self.ammo       = {}
   self.activeAmmo = nil

   if ( params and params.ammo ) then
      for i=1,#params.ammo do
         self.ammo[#self.ammo + 1] = { name = params.ammo[i], item = nil }
      end

      if params.magazineMax then
         self.magazine = params.magazineMax
         self.magazineMax = params.magazineMax
      end
   end

   self:initParam( "accuracy", params.accuracy, 1.0 )
   self:initParam( "flash", params.flash, "flash" )
   self:initParam( "bullet", params.bullet, "bullet" )
   self:initParam( "light", params.light, nil )
   self:initParam( "bulletsInShot", params.bulletsInShot, 1 )
   self:initParam( "bulletSpeed", params.bulletSpeed, 18000 )
end

function CGun:OnOwnerUpdate( action, item )
   --log("CGun:OnOwnerUpdate")
   if ( not self.activeAmmo or (self.activeAmmo and self.activeAmmo.count == 0) ) then
      self:updateOwnerAmmo()
      self:updateActiveAmmo()

      if ( self.owner.owner.updateAmmoGui ) then
         self.owner.owner:updateAmmoGui()
      end
   end
end

function CGun:OnEquip( slotId )
   CItem.OnEquip( self, slotId )

   if ( slotId == self:getObject():getWeaponSlot() ) then
      self:updateOwnerAmmo()
      self:updateActiveAmmo()
      self:setActionMesh( getScene():getGeometry("gun_effects.sbg"):getMesh(self.flash) )
      self:setTraceMesh ( getScene():getGeometry("gun_effects.sbg"):getMesh(self.bullet) )
      if self.light then
         self:setLightRadius( self.light.radius )
         self:setLightIntensity( self.light.intensity )
         self:setLightColor( self.light.color )
         self:setLightBlinkFrequency( 0.1 )
         self:setLightBlinkIntensity( 2.5 )
      end
      self:setAccuracy( self.accuracy )
      self:setBulletsSpeed( self.bulletSpeed )
      self:setBulletsInShot( self.bulletsInShot )
   end
end

function CGun:OnUnequip( slotId )
   CItem.OnUnequip( self, slotId )
end

function CGun:updateOwnerAmmo()
   for i=1,#self.ammo do
      self.ammo[i].item = self.owner:getItemByName( self.ammo[i].name )
   end
end

function CGun:updateActiveAmmo()
   self.activeAmmo = nil

   for i=1,#self.ammo do
      if ( self.ammo[i].item ) then
         self.activeAmmo = self.ammo[i].item
         break
      end
   end
end

function CGun:isAmmo( itemName )
   for i=1,#self.ammo do
      if ( self.ammo[i].name == itemName ) then
         return true
      end
   end
   return false
end

function CGun:OnActivate()
   if self.magazine > 0 then
      self:OnShot()
      self:showFlash()
      runTimer( 0.01, self, self.fadeOmni, false )
   else
      self:OnShotEmpty()
   end
end

function CGun:OnShot()
   CItem.OnActivate( self )

   self.magazine = self.magazine - 1

   if ( self.owner.owner.updateAmmoGui ) then
      self.owner.owner:updateAmmoGui()
   end
end

function CGun:OnShotEmpty()
   self:playSound( "inactive", true )
end

function CGun:getAmmoCount()
   return self.magazine or 0
end

function CGun:getType()
   return "gun"
end

function CGun:isEquipable()
   return true
end

function CGun:fadeOmni()
   --log( "disableOmni" )
   if ( self.omni:getRadius() > 1 ) then
      self.omni:setRadius( self.omni:getRadius() * 0.7 )
      runTimer( 0.01, self, self.fadeOmni, false )
   else
      self:hideFlash()
   end
end

function CGun:show()
   CItem.show( self )
   self:hideFlash()
end

function CGun:hide()
   CItem.hide( self )
end

function CGun:showFlash()
   self.omni:setVisible( true )
   self.omni:setRadius( 1000 )
end

function CGun:hideFlash()
   self.omni:setVisible( false )
end

return {
   CGun=CGun,
   CGunShock=CGunShock,
   CGunFlare=CGunFlare,
}
