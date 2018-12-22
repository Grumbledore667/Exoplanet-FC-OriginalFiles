local oo = require "loop.simple"
local CStatusEffectBase = (require "statusEffects.statusEffectBase")
local WeatherSystem = (require "environment.weather").WeatherSystem
local CBasicRegens = oo.class({}, CStatusEffectBase)

function CBasicRegens:init()
   self.params.visible = false
   self.params.saved = false

   CStatusEffectBase.init( self )

   self.params.statBonuses.sleepRegenFlat   = self.sleepRegenFlat
   self.params.statBonuses.staminaRegenFlat = self.staminaRegenFlat
   self.params.statBonuses.staminaRegenMult = self.staminaRegenMult
   self.params.statBonuses.waterRegenFlat   = self.waterRegenFlat
   self.params.statBonuses.healthRegenFlat   = self.healthRegenFlat
   self.params.statBonuses.healthRegenMult   = self.healthRegenMult
end

function CBasicRegens:sleepRegenFlat()
   local value = 0
   local char = self.owner.owner
   if char:getState("sleeping") then
      value = char:getStatCount( "sleepRest" )
   end
   return value
end

function CBasicRegens:healthRegenFlat()
   local char = self.owner.owner
   local value = char:getStatCount("staminaMax") / 1000 -- 0.01 health per sec per 10 stamina
   local foodPer = char:getStatPercent( "food" )
   local waterPer = char:getStatPercent( "water" )
   local sleepPer = char:getStatPercent( "sleep" )
   local staminaPer = char:getStatPercent( "stamina" )

   for _, stat in pairs{foodPer, waterPer, sleepPer, staminaPer} do
      if stat >= 75 then
         value = value + 0.02
      elseif stat >= 50 then
         value = value + 0.01
      end
   end

   return value
end

function CBasicRegens:healthRegenMult()
   local value = 1
   local char = self.owner.owner
   if char:getState("sleeping") or char:getState("resting") then
      value = 2
   end
   return value
end

function CBasicRegens:staminaRegenFlat()
   local value = 2.7
   local char = self.owner.owner
   local runCost = char:getStatCount( "staminaRunCost" )

   if not char:getState( "idleMode" ) then
      if char:getState( "sprintMode" ) then
         value = value + ( runCost * 7 )
      else
         value = value + runCost
      end
   end

   if char:getState("resting") or char:getState( "sleepAtBed" ) then
      value = char:getStatCount( "staminaRest" )
   end

   if char.statusEffectsManager:hasEffectName( "blockStaminaRegenDebuff" ) then
      value = math.min( value, 0 )
   end

   if char.statusEffectsManager:hasEffectName( "alcoholBuff" ) then
      if value > 0 then
         value = value * 0.5
      else
         value = value - 2
      end
   end

   return value
end

function CBasicRegens:staminaRegenMult()
   local value = 0
   local char = self.owner.owner
   local foodPer = char:getStatPercent( "food" )
   local waterPer = char:getStatPercent( "water" )
   local sleepPer = char:getStatPercent( "sleep" )

   if ( foodPer >= 75 and waterPer >= 75 and sleepPer >= 75 ) then
      value = 1.5
   elseif ( foodPer >= 50 and waterPer >= 50 and sleepPer >= 50 ) then
      value = 1
   elseif ( foodPer >= 25 and waterPer >= 25 and sleepPer >= 25 ) then
      value = 0.5
   end

   if char:getState("idleMode") or char:getState("walkMode") then
      value = value * 2
   end

   return value
end

function CBasicRegens:waterRegenFlat()
   if WeatherSystem:isDay() then
      return -1
   end
end

return CBasicRegens
