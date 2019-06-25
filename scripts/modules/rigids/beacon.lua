local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local CDestroyable = require "mixins.destroyable"
local ItemsData = (require "itemsData")
local SkySystem = (require "environment.sky").SkySystem
local CInteractable = require "mixins.interactable"

local hlp = require "helpers"
local f = require "fun"
local partial = f.partial

---@class CBeacon : shRigidEntity
local CBeacon = oo.class({
   itemName = "beacon.itm",
   animations =
   {
      legs =
      {
         open  = "Legs_Open",
         close = "Legs_Close",
      },
      lamp =
      {
         open  = "Lamp_Open",
         close = "Lamp_Close",
      },
      batteries =
      {
         open  = "Battaries_Open",
         close = "Battaries_Close",
      },
   },
   lampMesh = nil,
   currentAnimation = nil,
   animationInProgress = nil,
   animationsQueue = {},
   installer = nil,
}, _rootRigid, CDestroyable, CInteractable)

function CBeacon:initPrefabs()
   self.interactor:setRaycastRadius(100.0)
   self.interactor:getPose():setLocalPos({x=0,y=50,z=0})

   self.omni = self:createAspect("omni")
   self.omni:getPose():setParent(self:getPose())
   self.omni:getPose():resetLocalPose()
   self.omni:getPose():setLocalPos({x=0,y=300,z=0})
   self.omni:setColor({r=0.5,g=0.5,b=0.5})
   self.omni:setRadius(1000)
   self.omni:setVisible(false)

   self.lampMesh = self:getMeshByName("lights")
   self.lampMesh:setMaterials("solid_ns_mono")

   self.collision = getScene():createEntity("collision_box.sbg", "")
   self.collision:getPose():setParent(self:getPose())
   self.collision:getPose():resetLocalPose()
   self.collision:getPose():setLocalScale({x=0.1,y=2.0,z=0.1})

   self.sounds = {}
   self.sounds.Lamp_Open = self:initSound("Play_beacon_lamp_open")
   self.sounds.Lamp_Close = self:initSound("Play_beacon_lamp_close")
   self.sounds.Battaries_Open = self:initSound("Play_beacon_battary_open")
   self.sounds.Battaries_Close = self:initSound("Play_beacon_battary_close")
end

function CBeacon:initSound(soundName)
   local sound = self:createAspect(soundName)
   sound:getPose():setParent(self:getPose())
   sound:getPose():resetLocalPose()
   sound:getPose():setLocalPos({x=0,y=100,z=0})
   sound:setDistance(1500)
   return sound
end

function CBeacon:OnCreate(params)
   CDestroyable.OnCreate(self)
   CInteractable.OnCreate(self)
   if params then
      self:setInstaller(params.installer)
   end

   self:initPrefabs()

   self:subscribeAnimationStop(self.onAnimStop, self)

   --TODO:FIXME: refactor this to work with engine animation loading properly
   --Delay daystate sub and animation play, because engine will prevent animation stop during animation loading
   self.timer = runTimer(0.5, nil, function()
      self:playAnimationSpecial(self.animations.legs.open, false)
      self.dayStateCallback = SkySystem:subscribeDayStateChange("all", partial(self.onDayStateChange, self))
      self.timer = runTimer(0.5, nil, function()
         self:onDayStateChange(SkySystem:getDayState())
      end, false)
   end, false)
end

function CBeacon:OnDestroy()
   CDestroyable.OnDestroy(self)
   SkySystem:unsubscribeDayStateChange(self.dayStateCallback)

   if self.timer then
      self.timer:stop()
      self.timer = nil
   end

   getScene():destroyEntity(self.collision)
end

function CBeacon:onDayStateChange(dayState)
   if SkySystem:isDay() then
      self.animationsQueue = {}
      if self.currentAnimation == self.animations.lamp.open then
         self:playAnimationSpecial(self.animations.lamp.close, false)
      end
      self:playAnimationSpecial(self.animations.batteries.open, false)
   elseif SkySystem:isNight() then
      self.animationsQueue = {}
      if self.currentAnimation == self.animations.batteries.open then
         self:playAnimationSpecial(self.animations.batteries.close, false)
      end
      self:playAnimationSpecial(self.animations.lamp.open, false)
   end
end

function CBeacon:onAnimStop()
   self.animationInProgress = false
   if self.currentAnimation == self.animations.lamp.open then
      self.omni:setVisible(true)
      self.lampMesh:setMaterials("default_ns_mono_glow")
   elseif self.currentAnimation == self.animations.lamp.close then
      self.omni:setVisible(false)
      self.lampMesh:setMaterials("solid_ns_mono")
   end
   if self.animationsQueue[1] then
      self:playAnimationSpecial(self.animationsQueue[1], false)
      table.remove(self.animationsQueue, 1)
   end
end

function CBeacon:playAnimationSpecial(anim, cycled)
   if not anim or self.currentAnimation == anim then return end
   if not self.animationInProgress then
      self:playAnimation(anim, cycled)
      self.currentAnimation = anim
      self.animationInProgress = true
      if self.sounds[anim] then
         self.sounds[anim]:play()
      end
   else
      table.insert(self.animationsQueue, anim)
   end
end

function CBeacon:getInteractType(char)
   return "pickup"
end

function CBeacon:getInteractData(char)
   local data = {
      animations = {
         activate = hlp.getPickupAnimationFor(char, self)
      },
   }
   return data
end

function CBeacon:getLabel()
   return "'Sunflower' lamp"
end

function CBeacon:getLabelPos()
   return vec3Add(self:getPose():getPos(), {y=175})
end

function CBeacon:getInteractLabel()
   return "deinstall"
end

function CBeacon:pickupItem(inventory)
   local item = inventory:addItem(self.itemName)

   if item then
      getScene():destroyEntity(self)
   end
   return item, 1
end

function CBeacon:setInstaller(obj)
   self.installer = obj
end

function CBeacon:OnSaveState(state)
   if self.installer then
      state.pos = self:getPose():getPos()
      state.rotQuat = self:getPose():getRotQuat()
   end
end

function CBeacon:OnLoadState(state)
   if self.installer then
      if state.pos then
         self:getPose():setPos(state.pos)
      end
      if state.rotQuat then
         self:getPose():setRotQuat(state.rotQuat)
      end
   end
end

return {CBeacon=CBeacon}
