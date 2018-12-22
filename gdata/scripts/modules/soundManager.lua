local oo = require "loop.simple"
local SoundTables = require "soundTables"

local tablex = require "pl.tablex"
local random = require "random"

local CSoundManager = oo.class({
   owner = nil,
   lastLooped = nil,
})

function CSoundManager:init()
   local prefabName = string.gsub(self.owner:getPrefabName(), ".cfg$", "")
   self.soundNames = SoundTables.getTable(prefabName)
   if self.owner:getScriptClass() == "CMainCharacter" then
      self.soundNames = tablex.merge(self.soundNames, SoundTables.getTable("mainCharacter"), true)
   end
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
      local soundTable = self.owner.animationsManager:getAnimationSoundTable(soundName) or {}
      --Choose a different sound if the previous one was the same
      --TODO:FIXME: replace with infinite shuffled iterator
      while #eventSounds > 1 and self.channels[soundTable.channel] and self.channels[soundTable.channel].soundName == soundName do
         soundName = random.choice(eventSounds)
         soundTable = self.owner.animationsManager:getAnimationSoundTable(soundName)
      end
      self:playEventSound(soundName, soundTable.channel, soundTable.distance, soundTable.priority)
   end
end

function CSoundManager:playEventSound(soundName, channel, distance, priority)
   channel = channel or -1
   priority = priority or 1
   --Stop prev sound if it has <= priority, ignore new one if its priority is lower
   if self.channels[channel] and self.channels[channel].aspect:isPlaying() then
      if self.channels[channel].priority <= priority then
         self.channels[channel].aspect:stop()
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
   if not self.soundNames[actionName] then return end
   local soundName = random.choice(self.soundNames[actionName])
   local aspect = self:getAspect(soundName)
   if aspect then
      aspect:play()
   end
   return aspect
end

function CSoundManager:playActionSoundLooped(actionName)
   local aspect = self:playActionSound(actionName)
   if aspect then
      aspect:setLoop(true)
      self.lastLooped = aspect
   end
end

function CSoundManager:playSoundDynamic(soundName, channel, distance, looped)
   channel = channel or -1
   local aspect = self:getAspect(soundName)
   if aspect then
      self.channels[channel] = {aspect = aspect, priority = 1, soundName = soundName}
      aspect:setDistance(distance or 2000)
      aspect:setLoop(looped or false)
      aspect:play()
   end
   return aspect
end

function CSoundManager:stopLastLoopedSound()
   if self.lastLooped then
      self.lastLooped:stop()
   end
end

function CSoundManager:initSound(soundName, sourceTable)
   sourceTable = sourceTable or self.sounds
   local aspect = self.owner:createAspect(soundName)
   if aspect then
      aspect:setDistance(2000)
      aspect:setLoop(false)
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
