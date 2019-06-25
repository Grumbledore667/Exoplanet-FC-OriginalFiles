local oo = require "loop.simple"
local random = require "random"

local CSoundManager = oo.class({
   owner = nil,
})

function CSoundManager:init()
   self.sounds = {}
   self.eventSounds = {}
   self.channels = {}
end

function CSoundManager:OnAnimationEventIn(animation, event)
   --log("OnAnimationEventIn " .. animation .. " " .. event)
   local animEvents = self.owner.animationsManager:getAnimationEvents(animation)
   if animEvents and animEvents[event] then
      self:OnEventIn(event)
   end
end

function CSoundManager:OnAnimationEventOut(animation, event)
end

function CSoundManager:OnEventIn(event)
   local eventSounds = self.owner.animationsManager:getEventSounds(event)
   if eventSounds then
      local soundName = random.choice(eventSounds)
      local soundParams = self.owner.animationsManager:getAnimationSoundParams(soundName) or {}
      --Choose a different sound if the previous one was the same
      --TODO:FIXME: replace with infinite shuffled iterator
      while #eventSounds > 1 and self.channels[soundParams.channel] and self.channels[soundParams.channel].soundName == soundName do
         soundName = random.choice(eventSounds)
         soundParams = self.owner.animationsManager:getAnimationSoundParams(soundName)
      end
      self:playEventSound(soundName, soundParams.channel, soundParams.distance, soundParams.priority)
   end
end

function CSoundManager:playEventSound(soundName, channel, distance, priority)
   channel = channel or -1
   priority = priority or 1
   --Stop prev sound if it has <= priority, ignore new one if its priority is lower
   local sound = self.channels[channel]
   if sound and sound.aspect:isPlaying() then
      if sound.priority <= priority then
         --Don't restart same sounds. Looping is set in wwise.
         if soundName ~= sound.soundName then
            sound.aspect:stop()
         end
      else
         return
      end
   end
   local aspect = self:getEventAspect(soundName)
   if aspect then
      self.channels[channel] = {aspect = aspect, priority = priority, soundName = soundName}
      aspect:setDistance(distance or 2000)
      aspect:play()
   end
   return aspect
end

function CSoundManager:getEventAspect(soundName)
   local aspect = self.eventSounds[soundName]
   if not aspect then
      aspect = self:initSound(soundName, self.eventSounds)
   end
   return aspect
end

function CSoundManager:playPrioritySound(actionName)
   self:stopSounds()
   self:playActionSound(actionName)
end

function CSoundManager:playSoundScheduled(soundName, channel)
   channel = channel or -1
   if self.channels[channel] and self.channels[channel].aspect:isPlaying() then
      runTimer(0.3, nil, function()
         self:playSoundScheduled(soundName, channel)
      end, false)
   else
      return self:playSoundDynamic(soundName, channel)
   end
end

function CSoundManager:playActionSound(actionName)
   local aspect = self:getAspect(actionName)
   if aspect then
      aspect:play()
   end
   return aspect
end

function CSoundManager:playSoundDynamic(soundName, channel, distance)
   channel = channel or -1
   local aspect = self:getAspect(soundName)
   if aspect then
      self.channels[channel] = {aspect = aspect, priority = 1, soundName = soundName}
      aspect:setDistance(distance or 2000)
      aspect:play()
   end
   return aspect
end

function CSoundManager:initSound(soundName, sourceTable)
   sourceTable = sourceTable or self.sounds
   local aspect = self.owner:createAspect(soundName)
   if aspect then
      aspect:setDistance(2000)
      aspect:getPose():setParent(self.owner:getPose())
      aspect:getPose():resetLocalPos()
      sourceTable[soundName] = aspect
      return aspect
   else
      log("ERROR: couldn't create sound " .. tostring(soundName))
   end
end

function CSoundManager:stopSounds()
   for _,aspect in pairs(self.sounds) do
      aspect:stop()
   end
   for _,aspect in pairs(self.eventSounds) do
      aspect:stop()
   end
end

function CSoundManager:getAspect(soundName)
   local aspect = self.sounds[soundName]
   if not aspect then
      aspect = self:initSound(soundName)
   end
   return aspect
end

return {CSoundManager=CSoundManager}
