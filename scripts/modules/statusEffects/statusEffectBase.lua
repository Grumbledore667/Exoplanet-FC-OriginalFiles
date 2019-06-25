local MiscLabels = require "miscLabels"
local SkySystem = (require "environment.sky").SkySystem

local f = require "fun"
local partial = f.partial
local tablex = require "pl.tablex"

local CCharacterStatBase = require "characterStatBase"
local CCharacterStatModifier = require "characterStatModifier"

local oo = require "loop.simple"

---@class CStatusEffectBase
---@field owner CStatusEffectsManager
---@field source any for non saveable status effects' custom logic.
local CStatusEffectBase = oo.class({
   owner = nil,
   source = nil,
})

function CStatusEffectBase:__new(members)
   local defaultParams = {
      stackCount = 1,
      statBonuses = {},
      changeStats = {},
      particles = {},
      sounds = {},
      interval = 5,
      timeLeft = nil,
      inflictor = nil, --string - serializable inflictor character's name
      visible = true,
      saved = true,
      debuff = false,
      removeOnDeath = true,
   }
   self = oo.rawnew(self, members)
   self.params = tablex.union(defaultParams, self.params)
   self.emitters = {}
   self.soundAspects = {}
   self.statModifiers = {}
   return self
end

function CStatusEffectBase:init()
   if self.params.duration then
      --Enables you to have an instance with X duration and Y timeLeft
      self.params.timeLeft = (self.params.timeLeft or self.params.duration) * 100 --Counting in miliseconds removes floating point problems
      --TODO:FIXME: Make it use CTime
      self.timer = runTimer(self.params.interval/100, self, self.tick, true)
      self.ffCallback = SkySystem:subscribeFastForwardTime(partial(self.onFastForwardTime, self))
   end

   self:attachStatModifiers()
   self:attachEmitters()
   self:startSounds()

   local char = self.owner.owner
   if char == getMC() and (self:isVisible() or isDebug()) then
      gameplayUI.characterUI:addEffectToUI(self)
   end

   self:onInit()
end

function CStatusEffectBase:onInit()
end

---Does not refresh sounds, particles or timer interval
function CStatusEffectBase:refreshWithParams(params)
   self.params = tablex.union(self.params, params)
   if params.duration then
      self.params.timeLeft = params.duration * 100
   end
   --Refresh stat modifiers
   self:removeStatModifiers()
   self:attachStatModifiers()
end

function CStatusEffectBase:isVisible()
   return self.params.visible
end

function CStatusEffectBase:isSaved()
   return self.params.saved
end

function CStatusEffectBase:isDebuff()
   return self.params.debuff
end

function CStatusEffectBase:getName()
   return self.params.name or "unnamed_status_effect"
end

function CStatusEffectBase:getLabel()
   local label = self.params.label or MiscLabels.getLabel(self:getName())
   if label == "" then label = self:getName() end
   return label
end

function CStatusEffectBase:getIcon()
   return self.params.icon or "gameplay/Empty"
end

function CStatusEffectBase:isRemoveOnDeath()
   return self.params.removeOnDeath
end

function CStatusEffectBase:incStackCount()
   self:setStackCount(self:getStackCount() + 1)
end

function CStatusEffectBase:decStackCount()
   self:setStackCount(self:getStackCount() - 1)
end

function CStatusEffectBase:setStackCount(value)
   self.params.stackCount = value
   if self.params.stackCount <= 0 then
      self:destroy()
   end
end

function CStatusEffectBase:getStackCount()
   return self.params.stackCount
end

---Create modifiers from params.statBonuses table, store references and attach them to character stats. If the stat exists on the character.
---Modifier type is in the last 4 characters - 'Flat', 'Mult' or 'Ovrd'
function CStatusEffectBase:attachStatModifiers()
   for bonusName, value in pairs(self.params.statBonuses) do
      local statName = string.sub(bonusName, 0, string.len(bonusName) - 4)
      local type = string.sub(bonusName, string.len(bonusName) - 3)
      local stat = self.owner.owner:getStatByName(statName)
      if stat and oo.isinstanceof(stat, CCharacterStatBase) then
         local modifier = CCharacterStatModifier{value = value, type = type, source = self}
         self.statModifiers[bonusName] = modifier
         stat:addModifier(modifier)
      end
   end
end

function CStatusEffectBase:getAllStatBonuses()
   local t = {}
   for bonusName, modifier in pairs(self.statModifiers) do
      t[bonusName] = modifier:getValue()
   end
   return t
end

function CStatusEffectBase:removeStatModifiers()
   for _, modifier in pairs(self.statModifiers) do
      modifier.affectedStat:removeModifier(modifier)
   end
   self.statModifiers = {}
end

function CStatusEffectBase:attachEmitters()
   local char = self.owner.owner
   local pose = char:getPose()
   for _,t in pairs(self.params.particles) do
      local emitter =  char:createAspect(t.name)
      --Manage emitter's position on a character

      emitter:getPose():setParent(pose)
      emitter:getPose():resetLocalPos()

      if t.offset then
         if t.offset == "impactPos" then
            t.offset = self.params.impactPos
         end
         emitter:getPose():setLocalPos(t.offset)
      end

      if t.bones then
         local index = 1
         while t.bones[index] and not char:findBonePose(t.bones[index]) do
            index = index + 1
         end
         local bonePose = char:findBonePose(t.bones[index])
         if bonePose then
            emitter:getPose():setParent(bonePose)
            if not t.offset then
               emitter:getPose():resetLocalPos()
            end
         end
      end

      if t.light then
         emitter:setColor(t.light.color)
         emitter:setRadius(t.light.radius)
         emitter:setIntensity(t.light.intensity)
         self.omniTimer = runTimer(0.1, { intensity = t.light.intensity, omni = emitter }, omniFlicker, true)
      end

      table.insert(self.emitters, emitter)
   end
end

function CStatusEffectBase:startSounds()
   local char = self.owner.owner
   for _, soundParams in pairs(self.params.sounds) do
      local aspect
      if soundParams.actionSound then
         --TODO:FIXME: stop using char.sounds in favor of soundManager
         if char.sounds then
            aspect = char.sounds[soundParams.name]
            aspect:play()
         end
      else
         aspect = char.soundManager:playSoundDynamic(soundParams.name, soundParams.channel, soundParams.distance)
      end
      table.insert(self.soundAspects, aspect)
   end
end

function CStatusEffectBase:tick(tickAmount, allowOverflow)
   tickAmount = tickAmount or 1
   local char = self.owner.owner
   if self.params.timeLeft <= 0 or (char:getState("dead") and self:isRemoveOnDeath()) then
      self:destroy()
      return
   end

   if not char:getState("dead") then
      local inflictor
      if self.params.inflictor then
         inflictor = getObj(self.params.inflictor, true)
      end
      local denominator = (self.params.duration * 100)/self.params.interval
      for statName,value in pairs(self.params.changeStats) do
         if value > 0 or char:isDamageAllowed(inflictor) then
            if statName:find("Percentage") then
               statName = statName:gsub("Percentage", "")
               local statMax = char:getStatCount(statName .. "Max")
               if statMax then
                  value = ((value * self:getStackCount()) / 100) * statMax
               end
            else
               value = value * self:getStackCount()
            end

            value = (value/denominator) * tickAmount
            if statName == "health" and value < 0 then
               char:takeDamage(math.abs(value), inflictor)
            else
               char:changeStatCount(statName, value, allowOverflow)
            end

            if char ~= getPlayer() and inflictor == getPlayer()
               and (gameplayUI.hudUI.enemyStatus.char == char or not gameplayUI.hudUI.enemyStatus.char) then
               runTimer(0, nil, function()
                  gameplayUI.hudUI:showEnemyStatus(char)
               end, false)
               if char:getStatCount("health") <= 0 then
                  char.killer = getPlayer()
               end
            end
         end
      end
   end

   self.params.timeLeft = self.params.timeLeft - self.params.interval * tickAmount
end

function CStatusEffectBase:onFastForwardTime(event, ...)
   local stepsToCatchUp = math.floor(event.elapsed:getAs("rMSecond") / self.params.interval)
   stepsToCatchUp = math.min(stepsToCatchUp, self.params.timeLeft/self.params.interval)
   self:tick(stepsToCatchUp, true)
end

function CStatusEffectBase:getTimeLeft()
   return self.params.timeLeft and self.params.timeLeft / 100
end

function CStatusEffectBase:setTimeLeft(newTime)
   self.params.timeLeft = newTime
end

function CStatusEffectBase:onDestroy()
   local char = self.owner.owner

   if char == getMC() then
      gameplayUI.characterUI:removeEffectFromUI(self)
   end

   self:removeStatModifiers()

   for _,aspect in pairs(self.emitters) do
      char:destroyAspect(aspect)
   end
   if self.omniTimer then
      self.omniTimer:stop()
      self.omniTimer = nil
   end
   self.emitters = {}

   for _,aspect in pairs(self.soundAspects) do
      aspect:stop()
   end

   SkySystem:unsubscribeFastForwardTime(self.ffCallback)
end

function CStatusEffectBase:destroy()
   self.owner:destroyEffectByID(self.ID)
end

function CStatusEffectBase:OnSaveState(state)
   if self.static then
      state.stackCount = self.params.stackCount
      state.impactPos = self.params.impactPos
   else
      for k,v in pairs(self.params) do
         state[k] = v
      end
   end

   state.name = self:getName()
   if self.params.timeLeft then
      state.timeLeft = self.params.timeLeft / 100
   end
end

return CStatusEffectBase
