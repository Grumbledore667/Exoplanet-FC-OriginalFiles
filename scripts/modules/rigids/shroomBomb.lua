local oo = require "loop.simple"
local _rootRigid = (require "roots")._rootRigid

local tablex = require "pl.tablex"

---@class CShroomBomb : shRigidEntity
local CShroomBomb = oo.class({}, _rootRigid)

function CShroomBomb:OnCreate()
   self.startled = false
   self.bursted = false
   self.burstWalkDistance = 200
   self.burstRunDistance = 400
   self.detectionDistance = 500

   self.initialScale = self:getPose():getScale()
   self.targetScale = self.initialScale

   self.scaleReactionSpeed = 0.004
   self.scaleIdleSpeed = -0.001
   self.scaleSpeed = 0

   self.maxScaleMul = 1.17

   self.burstDelay = 1.5

   self.dpsCounter = 0
   self.dpsMaxCounter = 10

   self.burstDamage = 25
   self.cloudDPS = 10

   self.chars = {}

   self.interactor = self:createAspect("interactor")
   self.interactor:setObject(self)
   self.interactor:setRaycastRadius(100.0)
   self.interactor:getPose():setParent(self:getPose())
   self.interactor:getPose():resetLocalPose()
   self.interactor:getPose():setLocalPos(vec3Zero())
   self.interactor:setRaycastActive(false)
   self.interactor:setTriggerRadius(self.detectionDistance)

   local cageBrokenName = self:getPrefabName():gsub(".sbg", "_broken.sbg")
   self.cageBroken = getScene():createEntity(cageBrokenName, "")
   self.cageBroken:setPose(self:getPose())
   self.cageBroken:setVisible(false)

   self.shroom = getScene():createEntity("shroom_baloon.sbg", "")
   self.shroom:setPose(self:getPose())

   self.dfx = { detect1 = {}, detect2 = {} }
   self.dfx.detect1.name = "shroom_angry.sps"
   self.dfx.detect1.emitter = nil
   self.dfx.detect1.stopped = true

   self.dfx.detect2.name = "shroom_angry_spores.sps"
   self.dfx.detect2.emitter = nil
   self.dfx.detect2.stopped = true

   self.fx = {}
   self.fx.burst1 = self:createAspect("shroom_explosion.sps")
   self.fx.burst1:setLoop(false)
   self.fx.burst1:getPose():setParent(self:getPose())
   self.fx.burst1:getPose():resetLocalPos()
   self.fx.burst1:disable()

   self.fx.burst2 = self:createAspect("shroom_explosion_spores.sps")
   self.fx.burst2:setLoop(false)
   self.fx.burst2:getPose():setParent(self:getPose())
   self.fx.burst2:getPose():resetLocalPos()
   self.fx.burst2:disable()

   self.fx.cloud1 = self:createAspect("shroom_cloud.sps")
   self.fx.cloud1:setLoop(true)
   self.fx.cloud1:getPose():setParent(self:getPose())
   self.fx.cloud1:getPose():resetLocalPos()
   self.fx.cloud1:getPose():setLocalPos({x=0,y=50,z=0})
   self.fx.cloud1:disable()

   self.fx.cloud2 = self:createAspect("shroom_cloud_spores.sps")
   self.fx.cloud2:setLoop(true)
   self.fx.cloud2:getPose():setParent(self:getPose())
   self.fx.cloud2:getPose():resetLocalPos()
   self.fx.cloud2:getPose():setLocalPos({x=0,y=50,z=0})
   self.fx.cloud2:disable()

   self.sounds = {}

   self.sounds.idle = self:createAspect("Play_shroom_idle")
   self.sounds.idle:getPose():setParent(self:getPose())
   self.sounds.idle:getPose():resetLocalPose()
   self.sounds.idle:setDistance(4000)

   self.sounds.death = self:createAspect("Play_shroom_explosion")
   self.sounds.death:getPose():setParent(self:getPose())
   self.sounds.death:getPose():resetLocalPose()
   self.sounds.death:setDistance(3000)

   self.sounds.broken = self:createAspect("Play_shroom_cage_crash")
   self.sounds.broken:getPose():setParent(self:getPose())
   self.sounds.broken:getPose():resetLocalPose()
   self.sounds.broken:setDistance(4000)
end

function CShroomBomb:OnInteractTriggerBegin(obj)
   if not self.bursted and not self.charTrackTimer then
      self.charTrackTimer = runTimer(0.03, self, self.charTrack, true)
      self.sounds.idle:play()
   end
   self.chars[#self.chars+1] = obj
end

function CShroomBomb:OnInteractTriggerEnd(obj)
   for i=1,#self.chars do
      if self.chars[i] == obj then
         table.remove(self.chars, i)
         break
      end
   end
   if #self.chars == 0 then
      self.sounds.idle:stop()
   end
end

function CShroomBomb:OnHit(params)
   if not self.bursted then
      self:burst()
   end
end

function CShroomBomb:charTrack()
   local char = getClosestObject(self, self.chars)
   local scale = self.shroom:getPose():getScale()

   if not char then
      self.scaleSpeed = self.scaleIdleSpeed
      self.targetScale = self.initialScale
      self.charTrackTimer:stop()
      self.charTrackTimer = nil
      return
   end

   local burstDist
   local charSpeed = math.max(math.abs(char:getMoveSpeed()), math.abs(char:getStrafeSpeed()))
   if charSpeed > 150 then
      burstDist = self.burstRunDistance
   else
      burstDist = self.burstWalkDistance
   end

   if objInDist(self:getPose():getPos(), char:getPose():getPos(), burstDist) then
      self:burstSequence(self.burstDelay)
   else
      local targetScaleMul
      if charSpeed == 0 then
         targetScaleMul = 1
         self.scaleSpeed = self.scaleIdleSpeed
      else
         local currentDistance = getDistance(self:getPose():getPos(), char:getPose():getPos())
         targetScaleMul = 1 + (self.maxScaleMul - 1) * burstDist/currentDistance
         self.scaleSpeed = self.scaleReactionSpeed
      end
      self.targetScale = vec3Mul(self.initialScale, targetScaleMul)
      if not tablex.deepcompare(scale, self.targetScale, true, nil) then
         if self.scaleSpeed < 0 then --play particles on exhale
            self:playDynamicEffect("detect1", true)
            self:playDynamicEffect("detect2", true)
         else
            self:playDynamicEffect("detect1", false)
            self:playDynamicEffect("detect2", false)
         end
         self:changeScaleWithSpeed(false)
      end
   end
end

function CShroomBomb:changeScaleWithSpeed(override)
   if self.changeScaleTimer then
      if override then
         self.changeScaleTimer:stop()
      else
         return
      end
   end
   self.changeScaleTimer = runTimer(0.03, nil, function()
      local scale = self.shroom:getPose():getScale()
      scale = vec3Add(scale, self.scaleSpeed)
      scale = vec3Clamp(scale, self.initialScale, vec3Mul(self.initialScale, self.maxScaleMul))
      self.shroom:getPose():setScale(scale)
      if tablex.deepcompare(scale, self.targetScale, true, nil) then
         if self.startled then
            self.scaleSpeed = vecInvert(self.scaleSpeed)
            if self.scaleSpeed.x < 0 then
               self.targetScale = self.initialScale
            else
               self.targetScale = vec3Mul(self.initialScale, self.maxScaleMul)
            end
         else
            self:playDynamicEffect("detect1", false)
            self:playDynamicEffect("detect2", false)
            self.changeScaleTimer:stop()
            self.changeScaleTimer = nil
         end
      end
   end, true)
end

function CShroomBomb:playDynamicEffect(effectName, state)
   if state then
      if not self.dfx[effectName].emitter or self.dfx[effectName].stopped then --CREATE ONLY IF NONE ARE PLAYING
         local emitter = self:createAspect(self.dfx[effectName].name)
         emitter:setLoop(true)
         emitter:getPose():setParent(self:getPose())
         emitter:getPose():resetLocalPos()
         emitter:getPose():setLocalPos({x=0,y=50,z=0})

         self.dfx[effectName].emitter = emitter
         self.dfx[effectName].stopped = false
      end
   else
      local entity = self.dfx[effectName].emitter
      self.dfx[effectName].emitter = nil
      if entity then
         self.dfx[effectName].stopped = true
         entity:stop()
         runTimer(3, nil, function()
            self:destroyAspect(entity)
         end, false)
      end
   end
end

function CShroomBomb:burstSequence(delay)
   self.startled = true
   self.charTrackTimer:stop()
   self.charTrackTimer = nil

   self.targetScale = self.initialScale
   self.scaleSpeed = { x=-0.05, y=-0.02, z=-0.05}
   self:changeScaleWithSpeed(true)

   self.burstSequenceTimer = runTimer(delay, nil, function()
      self:burst()
   end, false)
end

function CShroomBomb:burst()
   if self.bursted then return end
   self:onBurst()
   self:playDynamicEffect("detect1", false)
   self:playDynamicEffect("detect2", false)
   self.fx.burst1:play()
   self.fx.burst2:play()
   self.sounds.broken:play()
   self.sounds.death:play()
   self.sounds.idle:stop()

   for _, char in pairs(self.chars) do
      if objInDist(self:getPose():getPos(), char:getPose():getPos(), self.burstRunDistance) then
         char:hit(self.burstDamage)
      end
   end

   self.dpsTimer = runTimer(1, self, self.dps, true)

   runTimer(0.3, nil, function()
      self.fx.cloud1:play()
      self.fx.cloud2:play()
      end, false)
end

function CShroomBomb:onBurst()
   self.startled = false
   self.bursted = true
   self:setVisible(false)
   self.shroom:setVisible(false)
   self.cageBroken:setVisible(true)
   self:setCollisionCharacters(false, false)
   if self.charTrackTimer then
      self.charTrackTimer:stop()
      self.charTrackTimer = nil
   end
   if self.changeScaleTimer then
      self.changeScaleTimer:stop()
      self.changeScaleTimer = nil
   end
end

function CShroomBomb:dps()
   self.dpsCounter = self.dpsCounter + 1

   if self.dpsCounter > self.dpsMaxCounter then
      self.dpsTimer:stop()
      self.dpsTimer = nil
      self.fx.cloud1:stop()
      self.fx.cloud2:stop()
      return
   end

   for _, char in pairs(self.chars) do
      if objInDist(self:getPose():getPos(), char:getPose():getPos(), self.burstRunDistance) and not char:getState("dead") then
         local t = { changeStats = { health = -self.cloudDPS }, duration = 1, name = "shroom_poison",
                    refresh = true, removeOnDeath = true, sounds = {{name = "cough", actionSound = true}} }
         char.statusEffectsManager:addStatusEffect(t)
      end
   end
end

function CShroomBomb:getLabel()
   return "Stink Shroom"
end

function CShroomBomb:OnSaveState(state)
   state.startled = self.startled
   if self.startled and self.burstSequenceTimer then
      state.burstDelay = self.burstSequenceTimer:getTimeLeft()
   end
   state.bursted = self.bursted
   state.scale = self.shroom:getPose():getScale()
   state.dpsCounter = self.dpsCounter
end

function CShroomBomb:OnLoadState(state)
   if state.startled and state.burstDelay and state.burstDelay > 0 then
      self.shroom:getPose():setScale(state.scale)
      self:burstSequence(state.burstDelay)
   elseif state.bursted then
      self:onBurst()

      self.dpsCounter = state.dpsCounter
      if self.dpsCounter < self.dpsMaxCounter then
         self.dpsTimer = runTimer(1, self, self.dps, true)
         self.fx.cloud1:play()
         self.fx.cloud2:play()
      end
   else
      self.shroom:getPose():setScale(state.scale)
   end
end

return {CShroomBomb=CShroomBomb}
