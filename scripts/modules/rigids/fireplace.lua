local oo = require "loop.multiple"
local CRestCamp = (require "rigids.restCamp").CRestCamp
local CDestroyable = require "mixins.destroyable"
local CActivator = (require "rigids.activator").CActivator

local SkySystem = (require "environment.sky").SkySystem
local CTime = (require "helpers").CTime

local BURNING_TIME = CTime(12, "gHour")
local BURNING_PROLONGATION_TIME = CTime(3, "gHour")

---@class CFireplace : CRestCamp
local CFireplace = oo.class({installer = nil}, CRestCamp, CDestroyable)

function CFireplace:OnCreate(params)
   CRestCamp.OnCreate(self, params)
   CDestroyable.OnCreate(self, params)
   if params then
      self:setInstaller(params.installer)
   end

   self.damage = 8
   self.damageInterval = 0.5

   self.chars = {}

   self.distance = 40

   self.eternal = loadParam(self, "eternal", false)

   self.interactor:setTriggerRadius(self.distance)
   self.interactor:setTriggerActive(false)

   if not self.effects then
      self.effects = {}
      self.effects.fire_base = self:createAspect("camp_fire_base.sps")
      self.effects.fire_base:getPose():setParent(self:getPose())
      self.effects.fire_base:getPose():resetLocalPose()
      -- self.effects.fire_base:getPose():setLocalPos({y=-15})
      self.effects.fire_base:getPose():setLocalScale({x=0.9, y=0.9, z=0.9})

      self.effects.fire_main = self:createAspect("camp_fire_main.sps")
      self.effects.fire_main:getPose():setParent(self:getPose())
      self.effects.fire_main:getPose():resetLocalPose()
      self.effects.fire_main:getPose():setLocalPos({y=15})
      self.effects.fire_main:getPose():setLocalScale({x=0.9, y=0.9, z=0.9})

      self.effects.fire_smoke = self:createAspect("camp_fire_smoke.sps")
      self.effects.fire_smoke:getPose():setParent(self:getPose())
      self.effects.fire_smoke:getPose():resetLocalPose()
      self.effects.fire_smoke:getPose():setLocalPos({y=20})
      self.effects.fire_smoke:getPose():setLocalScale({x=0.9, y=0.9, z=0.9})

      self.effects.fire_sparks = self:createAspect("camp_fire_sparks.sps")
      self.effects.fire_sparks:getPose():setParent(self:getPose())
      self.effects.fire_sparks:getPose():resetLocalPose()
      -- self.effects.fire_sparks:getPose():setLocalPos({y=15})
      self.effects.fire_sparks:getPose():setLocalScale({x=0.9, y=0.9, z=0.9})

      self.effects.omni = self:createAspect("omni")
      self.effects.omni:getPose():setParent(self:getPose())
      self.effects.omni:getPose():resetLocalPose()
      self.effects.omni:getPose():setLocalPos({x=0,y=90,z=0})
      self.effects.omni:setColor({r=1.0,g=0.9,b=0.45})
      self.effects.omni:setRadius   (1000)
      self.effects.omni:setIntensity(0.6)

      self.sounds = {}

      self.sounds.fire = self:createAspect("Play_fireplace")
      self.sounds.fire:setVolume  (3)
      self.sounds.fire:setDistance(600)
      self.sounds.fire:getPose():setParent(self:getPose())
      self.sounds.fire:getPose():resetLocalPose()
   end

   self.removeItems = {["firewood.itm"] = 1}
   if self.installer or self.eternal then
      self.burning = true
   else
      self.burning = false
   end
   self:setBurning(self.burning)
end

function CFireplace:activate(obj)
   if self.activated then return false end

   if not self:isBurning() then
      if CActivator.checkRemoveItems(self) then
         self:setBurning(true)
      end
   else
      return CRestCamp.activate(self, obj)
   end
   return false
end

function CFireplace:isBurning()
   return self.burning
end

function CFireplace:setBurning(state)
   if state then
      self:onBurningStart()
   else
      self:onBurningEnd()
   end
end

function CFireplace:onBurningStart()
   self.interactor:setTriggerActive(true)
   self.effects.fire_base:play()
   self.effects.fire_main:play()
   self.effects.fire_smoke:play()
   self.effects.fire_sparks:play()
   self.sounds.fire:play()
   self.effects.omni:setVisible(true)
   if not self.omniTimer then
      self.omniTimer = runTimer(0.1, self, self.pulseOmni, true)
   end
   if not self.burningCallback and not self.eternal then
      self.burningCallback = SkySystem:subscribeTimePassed(BURNING_TIME, false, self.onBurningEnd, self)
   end
   self.burning = true
end

function CFireplace:onBurningEnd(forced)
   SkySystem:unsubscribeDayTime(self.burningCallback) --safe
   self.burningCallback = nil
   if not self.activated or forced then
      self.interactor:setTriggerActive(false)
      self.effects.fire_base:stop()
      self.effects.fire_main:stop()
      self.effects.fire_smoke:stop()
      self.effects.fire_sparks:stop()
      self.sounds.fire:stop()
      self.effects.omni:setVisible(false)
      if self.omniTimer then
         self.omniTimer:stop()
         self.omniTimer = nil
      end
      self.burning = false
   else --If it's being used - prolong the burning
      self.burningCallback = SkySystem:subscribeTimePassed(BURNING_PROLONGATION_TIME, false, self.onBurningEnd, self)
   end
end

function CFireplace:OnDestroy()
   CDestroyable.OnDestroy(self)
end

function CFireplace:pulseOmni()
   local pulseSpeed = (math.sin(getGameTime()*5) * 0.5 + 0.5) * 10 + 20
   local intensity  = clamp(1.0-vec3Length(getScene():getEnvirState():getDiffuse()), 0.1, 1.0)
   --log("i: " .. tostring(intensity))

   self.effects.omni:setIntensity((0.7 + math.sin(getGameTime() * pulseSpeed * 1.5) * 0.1) * intensity)
end

function CFireplace:OnInteractTriggerBegin(obj)
   if objInDist(self:getPose():getPos(), obj:getPose():getPos(), self.distance) then
      self.chars[#self.chars+1] = obj
      if #self.chars > 0 and not self.timer and self.damage > 0 then
         self.timer = runTimer(self.damageInterval, self, self.impactDamage, true)
      end
   end
end

function CFireplace:OnInteractTriggerEnd(obj)
   for i=1,#self.chars do
      if self.chars[i] == obj then
         table.remove(self.chars, i)
         break
      end
   end
   if #self.chars == 0 and self.timer then
      self.timer:stop()
      self.timer = nil
   end
end

function CFireplace:impactDamage()
   for i=1,#self.chars do
      self.chars[i]:hit(self.damage, self)
   end
end

function CFireplace:setInstaller(obj)
   self.installer = obj
end

function CFireplace:getLabel()
   return "Campfire"
end

function CFireplace:OnSaveState(state)
   if self.installer then
      state.pos = self:getPose():getPos()
      state.rotQuat = self:getPose():getRotQuat()
   end
   state.burning = self:isBurning()
   if self.burningCallback then
      state.extinctionTime = self.burningCallback.targetTime:getAs("gSecond")
   end
end

function CFireplace:OnLoadState(state)
   if self.installer then
      if state.pos then
         self:getPose():setPos(state.pos)
      end
      if state.rotQuat then
         self:getPose():setRotQuat(state.rotQuat)
      end
   end
   self:setBurning(state.burning)
   if state.extinctionTime then
      SkySystem:unsubscribeDayTime(self.burningCallback)
      self.burningCallback = SkySystem:subscribeDayTime(CTime(state.extinctionTime, "gSecond"), false, self.onBurningEnd, self)
   end
end

return {CFireplace=CFireplace}
