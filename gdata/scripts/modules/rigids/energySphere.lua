local oo = require "loop.simple"
local _rootRigid = (require "roots")._rootRigid

local random = require "random"

---@class CEnergySphere : shRigidEntity
local CEnergySphere = oo.class({enabled = true}, _rootRigid)

function CEnergySphere:OnCreate()
   self:setMaterials("energy_sphere")

   local scale = self:getPose():getScale().x

   self.interactor = self:createAspect("interactor")
   self.interactor:setObject(self)
   self.interactor:getPose():setParent(self:getPose())
   self.interactor:getPose():resetLocalPose()
   self.interactor:setTriggerRadius(1500 * scale)
   self.interactor:setTriggerActive(true)

   self.electroHit = self:createAspect("electro_touch.sps")
   self.electroHit:setLoop(false)
   self.electroHit:getPose():setScale({x=3,y=3,z=3})
   self.electroHit:getPose():setParent(self:getPose())
   self.electroHit:getPose():resetLocalPos()
   self.electroHit:disable()

   self.electroHitSound = self:createAspect("electro_smash.wav")
   self.electroHitSound:getPose():setParent(self.electroHit:getPose())
   self.electroHitSound:getPose():resetLocalPose()
   self.electroHitSound:setLoop(false)
   self.electroHitSound:setVolume(1.5)
   self.electroHitSound:setDistance(1600 * scale)

   self.soundDestroyed = self:createAspect("energy_bubble_destroyed.wav")
   self.soundDestroyed:getPose():setParent(self:getPose())
   self.soundDestroyed:getPose():resetLocalPose()
   self.soundDestroyed:setLoop(false)
   self.soundDestroyed:setVolume(2.5)

   self.soundBuzz = self:createAspect("energy_bubble_buzz.wav")
   self.soundBuzz:getPose():setParent(self:getPose())
   self.soundBuzz:getPose():resetLocalPose()
   self.soundBuzz:setLoop(true)
   self.soundBuzz:setFadeIn(2)
   self.soundBuzz:setFadeOut(2)
   self.soundBuzz:setDistance(2000 * scale)
   self.soundBuzz:setVolume(0.5)

   getScene():subscribeOnFirstFrame(function()
      if self.enabled then
         self.soundBuzz:play()
      end
   end)

   self.electroTimer = runTimer(5, self, function(self)
      self.electroHit:play()
      self.electroHitSound:play()

      local sphereRadius = 1400 * scale
      local rndT = random.random(0,2*math.pi)
      local rndP = random.random(-math.pi/2,math.pi/2)
      local rndR = random.random(0, sphereRadius)
      local pos = {}
      pos.x = rndR * math.cos(rndT) * math.cos(rndP)
      pos.y = rndR * math.sin(rndP)
      pos.z = rndR * math.sin(rndT) * math.cos(rndP)
      self.electroHit:getPose():setLocalPos(pos)
   end, true)
end

function CEnergySphere:OnInteractTriggerBegin(obj)
   if self.enabled and obj == getPlayer() then
      obj:pushFrom(self:getPose():getPos(), 10000, 0.5)
      obj:playEffect("electro_shock", 1)
      self:disable(true)
   end
end

function CEnergySphere:disable(play)
   self.enabled = false
   self.electroTimer:stop()
   self.soundBuzz:stop()
   if play then
      self.soundDestroyed:play()
   end
   self:setVisible(false)
end

function CEnergySphere:OnSaveState(state)
   state.enabled = self.enabled
end

function CEnergySphere:OnLoadState(state)
   if state.enabled == false then
      self:disable(false)
   end
end

return {CEnergySphere=CEnergySphere}
