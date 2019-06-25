local oo = require "loop.multiple"
local CItem = (require "items.item").CItem
local _rootGun = (require "roots")._rootGun
local tablex = require "pl.tablex"

local f = require "fun"
local partial = f.partial

---@class CGun : CItem
local CGun = oo.class({}, _rootGun, CItem)
---@class CGunShock : CGun
local CGunShock = oo.class({}, CGun)
---@class CGunFlare : CGun
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
      local dir = vec3Normalize(vec3Sub(pos, self:getPose():getPos()))
      pos = vec3Sub(pos, vec3Mul(dir, 7))

      if params.targetType == "terrain" then
         omniPos.y = params.impactPos.y + 130
      end

      local emitter1 = self:createAspect("flare_hit_black.sps")
      local emitter2 = self:createAspect("flare_hit_red.sps")
      local emitter3 = self:createAspect("flare_hit_sparks.sps")
      emitter1:getPose():setPos(pos)
      emitter2:getPose():setPos(pos)
      emitter3:getPose():setPos(pos)

      local omni = self:createAspect("omni")
      omni:getPose():setPos(omniPos)
      omni:setColor(self.light.color)
      omni:setRadius(self.light.radius)
      omni:setIntensity(self.light.intensity)
      local omniTimer = runTimer(0.1, { intensity = self.light.intensity, omni = omni }, omniFlicker, true)

      if obj then
         local pose = obj:getPose()
         emitter1:getPose():setParent(pose)
         emitter2:getPose():setParent(pose)
         emitter3:getPose():setParent(pose)
         omni:getPose():setParent(pose)
      end

      local delay = self.hitEffects[1].duration or 5
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

function CGunShock:setClassParams(params)
   CGun.setClassParams(self, params)
   self:initParam("energyCost", params.energyCost, 10)
end

function CGunShock:OnActivate()
   if self:getOwner():getOwner():getStatCount("energy") >= self.energyCost then
      self:OnShot()
      self:showFlash()
      runTimer(0.01, self, self.fadeOmni, false)
   else
      self:OnShotEmpty()
   end
end

function CGunShock:OnShot()
   CItem.OnActivate(self)

   self:getOwner():getOwner():changeStatCount("energy", -self.energyCost)
   self:getOwner():OnChange({eventType="WeaponUsed", item = self})
end

function CGun:OnLoadGun()
   local ammoMissing = self.magazineMax - self.magazine
   local ammoLoad = ammoMissing
   local ammoCount = self:getAvailableAmmoCount() - self.magazine
   if ammoCount > 0 then
      if self:getReloadAnimations() == "shotgun1" or self:getReloadAnimations() == "carbine" then
         ammoLoad = 1
      elseif ammoCount < ammoMissing then
         ammoLoad = ammoCount
      end
      if ammoLoad > 0 then
         self.magazine = self.magazine + ammoLoad
      end
   end
   self:getOwner():OnChange({eventType="WeaponLoaded", item = self})
end

function CGun:OnCreate(params)
   CItem.OnCreate(self, params)

   self.omni = self:createAspect("omni")
   self.omni:getPose():setParent(self:getPose())
   self.omni:getPose():resetLocalPose()
   self.omni:getPose():setLocalPos({x=0,y=0,z=-100})
   self.omni:setColor({r=0.5,g=0.5,b=0.5})

   self:hideFlash()
   self:setGameGroups("0")
   self.endless = false
end

function CGun:initSounds()
   CItem.initSounds(self)
   local aspect = self:createAspect("Play_flesh_impact_bullet")
   aspect:setDistance(1000)
   self.sounds.target = {aspect}

   --TODO:FIXME: No need for this anymore - this goes to itemsData
   if self:getReloadAnimations() == "shotgun1" then
      aspect = self:createAspect("Play_shotgun_insert_shell")
      aspect:setDistance(1200)
      self.sounds.reload_loop = {aspect} --TODO:FIXNE: get rid of this mockup of deprecated table structure which is used in CItem.playSound
   else
      aspect = self:createAspect("Play_carbine_insert_shell")
      aspect:setDistance(1200)
      self.sounds.reload_loop = {aspect}
   end
end

function CGun:setClassParams(params)
   CItem.setClassParams(self, params)

   self.ammo = {}
   if params and params.ammo then
      self.ammo = tablex.copy(params.ammo)

      if params.magazineMax then
         self.magazine = 0
         self.magazineMax = params.magazineMax
      end
   end

   self:initParam("accuracy", params.accuracy, 1.0)
   self:initParam("flash", params.flash, "flash")
   self:initParam("bullet", params.bullet, "bullet")
   self:initParam("light", params.light, nil)
   self:initParam("bulletsInShot", params.bulletsInShot, 1)
   self:initParam("bulletSpeed", params.bulletSpeed, 18000)
end

function CGun:updateEngineParams()
   self:setActionMesh(getScene():getGeometry("gun_effects.sbg"):getMesh(self.flash))
   self:setTraceMesh (getScene():getGeometry("gun_effects.sbg"):getMesh(self.bullet))
   if self.light then
      self:setLightRadius(self.light.radius)
      self:setLightIntensity(self.light.intensity)
      self:setLightColor(self.light.color)
      self:setLightBlinkFrequency(0.1)
      self:setLightBlinkIntensity(2.5)
   end
   self:setAccuracy(math.min(1, self.accuracy + self:getQualityBonus("accuracyFlat")))
   self:setBulletsSpeed(self.bulletSpeed * self:getQualityBonus("bulletSpeedMul"))
   self:setBulletsInShot(self.bulletsInShot)
end

function CGun:setQuality(qualityInt, silent)
   CItem.setQuality(self, qualityInt, silent)
   self:updateEngineParams()
end

function CGun:OnEquip(slotId, silent)
   CItem.OnEquip(self, slotId, silent)
   if slotId == self:getObject():getWeaponSlot() then
      self.onInventoryChangeCallback = self:getOwner():subscribeOnChange(partial(self.OnInventoryChange, self))
   end
end

function CGun:OnUnequip(slotId, silent)
   CItem.OnUnequip(self, slotId, silent)
   self:getOwner():unsubscribeOnChange(self.onInventoryChangeCallback)
end

function CGunShock:getAmmoCount()
   if self.energyCost > 0 then
      return math.floor(self:getOwner():getOwner():getStatCount("energy") / self.energyCost)
   end
   return 0
end

function CGunShock:isMagazineEmpty()
   return self:getOwner():getOwner():getStatCount("energy") < self.energyCost
end

function CGun:getCompatibleAmmo()
   return tablex.deepcopy(self.ammo)
end

function CGun:getAvailableAmmoItem()
   if not self.owner then return end
   for _,ammoName in ipairs(self.ammo) do
      local ammoItem = self.owner:getItemByName(ammoName)
      if ammoItem then
         return ammoItem
      end
   end
end

function CGun:getAvailableAmmoCount()
   local ammoItem = self:getAvailableAmmoItem()
   if ammoItem then
      return ammoItem:getCount()
   end
   return 0
end

function CGun:isAmmoCompatible(itemName)
   for _,ammoName in ipairs(self.ammo) do
      if ammoName == itemName then
         return true
      end
   end
   return false
end

function CGun:updateAmmoCount()
   --Energy weapons don't have magazine param
   if self.magazine then
      self.magazine = math.min(self:getAvailableAmmoCount(), self.magazine)
      if self.owner.owner == getPlayer() then
         gameplayUI.hudUI:updateWeaponUI({item=self})
      end
   end
end

function CGun:setEndless(state)
   self.endless = state
end

function CGun:isEndless()
   return self.endless
end

function CGun:isMagazineEmpty()
   return self.magazine <= 0
end

function CGun:getMagazine()
   return self.magazine or 0
end

function CGun:getMagazineMax()
   return self.magazineMax or 0
end

function CGun:OnActivate()
   if self.magazine > 0 then
      self:OnShot()
      self:showFlash()
      runTimer(0.01, self, self.fadeOmni, false)
   else
      self:OnShotEmpty()
   end
end

function CGun:OnShot()
   CItem.OnActivate(self)
   if not self:isEndless() then
      self.magazine = math.max(0, self.magazine - 1)
      local ammoItem = self:getAvailableAmmoItem()
      if ammoItem then
         ammoItem:destroy(1)
      elseif self.owner.owner == getPlayer() then
         gameplayUI.hudUI:updateWeaponUI({item=self})
      end
   end
end

function CGun:OnShotEmpty()
   self:playSound("inactive", true)
end

function CGun:OnInventoryChange(event)
   CItem.OnInventoryChange(self, event)
   if tablex.find(self:getCompatibleAmmo(), event.item:getItemName()) then
      self:updateAmmoCount()
   end
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
   --log("disableOmni")
   if self.omni:getRadius() > 1 then
      self.omni:setRadius(self.omni:getRadius() * 0.7)
      runTimer(0.01, self, self.fadeOmni, false)
   else
      self:hideFlash()
   end
end

function CGun:show()
   CItem.show(self)
   self:hideFlash()
end

function CGun:hide()
   CItem.hide(self)
end

function CGun:showFlash()
   self.omni:setVisible(true)
   self.omni:setRadius(1000)
end

function CGun:hideFlash()
   self.omni:setVisible(false)
end

return {
   CGun=CGun,
   CGunShock=CGunShock,
   CGunFlare=CGunFlare,
}
