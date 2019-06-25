local oo = require "loop.simple"
local classManager = require "global.classManager"
local CItem = (require "items.item").CItem

local CStrangeDetector = oo.class({
}, CItem)

local MIN_REPEAT_RATE = 0.5
local MAX_REPEAT_RATE = 2
local NOSIGNAL_REPEAT_RATE = 3
local MIN_PITCH = 1
local MAX_PITCH = 1.2

function CStrangeDetector:OnCreate(params)
   CItem.OnCreate(self, params)
   self.criticalSound = self.sounds["pulse_critical"][1]
   self.lastSoundTiming = 0
end

function CStrangeDetector:OnEquip(slotId, silent)
   CItem.OnEquip(self, slotId, silent)
   self:OnActivate()
end

function CStrangeDetector:OnUnequip(slotId, silent)
   CItem.OnUnequip(self, slotId, silent)
   self:OnDeactivate()
end

function CStrangeDetector:OnActivate()
   self.activateTimer = runTimer(0.7, nil, function()
      if not self.detectTimer then
         self.detectTimer = runTimer(0.1, self, self.playDetectionSound, true)
      end
   end, true)
end

function CStrangeDetector:OnDeactivate()
   if self.detectTimer then
      self.detectTimer:stop()
      self.detectTimer = nil

      gameplayUI.billboardUI:show(false)
      if self:isSoundPlaying("pulse_critical") then
         self:stopSound("pulse_critical")
      end
   end
   if self.activateTimer then
      self.activateTimer:stop()
      self.activateTimer = nil
   end
end

function CStrangeDetector:playDetectionSound()
   local pos = self.owner.owner:getPose():getPos()
   local objects = {}
   local sites = classManager.getAllByClassName("CAnomalyDigSite")
   --filter empty, hidden and taken sites
   for _,site in pairs(sites) do
      if site.spawnedContainer then
         table.insert(objects, site)
      elseif site.spawnedItems[1] and site.spawnedItems[1]:getVisible() then
         table.insert(objects, site)
      elseif site.interactor:getRaycastActive() then
         table.insert(objects, site)
      end
   end
   local obj = getClosestObject(self.owner.owner, objects)
   local timePassed = getGameTime() - self.lastSoundTiming
   if obj then
      local distance = getDistance(pos, obj:getPose():getPos())
      if distance <= obj.radMax then
         if distance <= obj.radCritical then
            if not self:isSoundPlaying("pulse_critical") then
               self:playSound("pulse_critical", pos)
               gameplayUI.billboardUI:setup("Anomaly Detected!", string.format("Press '%s' to perform an active scan to reveal exact location.", getButtonCurrentKeyName("HOTBARQ")))
            else
               self.sounds["pulse_critical"][1]:getPose():setPos(pos)
            end
            return
         end

         --Simply scale the pitch and frequency from max radius to the critical radius
         local scale = (distance - obj.radCritical)/(obj.radMax - obj.radCritical)
         local repeatRate = MIN_REPEAT_RATE + (MAX_REPEAT_RATE - MIN_REPEAT_RATE) * scale
         local pitchRate = MAX_PITCH - (MAX_PITCH - MIN_PITCH) * scale

         gameplayUI.billboardUI:show(false)

         --Not done through `setDelay` cause it prolongs the pause
         if timePassed >= repeatRate then
            self:playSound("pulse", pos, {speed = pitchRate})
            self.lastSoundTiming = getGameTime()
         end
      end
   end

   if self:isSoundPlaying("pulse_critical") then
      self:stopSound("pulse_critical")
   end

   if (not obj or getDistance(pos, obj:getPose():getPos()) > obj.radMax) and timePassed >= NOSIGNAL_REPEAT_RATE then
      self:playSound("nosignal", pos)
      self.lastSoundTiming = getGameTime()
      gameplayUI.billboardUI:setup("Anomaly Detection", "No signal", 2)
   end
end

return {CStrangeDetector=CStrangeDetector}
