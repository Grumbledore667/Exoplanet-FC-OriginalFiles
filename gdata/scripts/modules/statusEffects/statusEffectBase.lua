local miscLabels = require("miscLabels")
local oo = require "loop.simple"

local CStatusEffectBase = oo.class({})

function CStatusEffectBase:init()
   local char = self.owner.owner

   self.params.stackCount = self.params.stackCount or 1
   self.params.statBonuses = self.params.statBonuses or {}
   self.params.changeStats = self.params.changeStats or {}
   self.params.particles = self.params.particles or {}
   self.sounds = self.params.sounds or {}

   self.params.timeLeft = self.params.timeLeft or self.params.duration
   if self.params.duration then
      self.params.interval = self.params.interval or 0.05
      self.timer = runTimer( self.params.interval, self, self.tick, true )
   end

   self.emitters = {}
   self:attachEmitters()

   for _,soundName in pairs(self.sounds) do
      if char.sounds and char.sounds[soundName] then
         char.sounds[soundName]:play()
      end
   end

   if char == getDefaultPlayer() and (self:isVisible() or isDebug()) then
      gameplayUI:addEffectToUI( self )
   end
end

function CStatusEffectBase:getStatBonus( bonusName )
   if self.params.statBonuses[bonusName] and type(self.params.statBonuses[bonusName]) == "function" then
      return self.params.statBonuses[bonusName]( self )
   elseif self.params.statBonuses then
      return self.params.statBonuses[bonusName]
   end
end

function CStatusEffectBase:getAllStatBonuses()
   local t = {}
   for bonusName,_ in pairs( self.params.statBonuses ) do
      t[bonusName] = self:getStatBonus( bonusName )
   end
   return t
end

function CStatusEffectBase:isVisible()
   if self.params.visible ~= nil then
      return self.params.visible
   end
   return true
end

function CStatusEffectBase:isSaved()
   if self.params.saved ~= nil then
      return self.params.saved
   end
   return true
end

function CStatusEffectBase:isDebuff()
   if self.params.debuff ~= nil then
      return self.params.debuff
   end
   return false
end

function CStatusEffectBase:getName()
   return self.params.name or "unnamed_status_effect"
end

function CStatusEffectBase:getLabel()
   local label = self.params.label or miscLabels.getLabel( self:getName() )
   if label == "" then label = self:getName() end
   return label
end

function CStatusEffectBase:getIcon()
   return self.params.icon or "gameplay/Empty"
end

function CStatusEffectBase:removeOnDeath()
   if self.params.removeOnDeath ~= nil then
      return self.params.removeOnDeath
   end
   return true
end

function CStatusEffectBase:incStackCount()
   self:setStackCount( self:getStackCount() + 1 )
end

function CStatusEffectBase:decStackCount()
   self:setStackCount( self:getStackCount() - 1 )
end

function CStatusEffectBase:setStackCount( value )
   self.params.stackCount = value
   if self.params.stackCount <= 0 then
      self:destroy()
   end
end

function CStatusEffectBase:getStackCount()
   return self.params.stackCount
end

function CStatusEffectBase:attachEmitters()
   local char = self.owner.owner
   local pose = char:getPose()
   for _,t in pairs(self.params.particles) do
      local emitter =  char:createAspect( t.name )
      --Manage emitter's position on a character

      emitter:getPose():setParent( pose )
      emitter:getPose():resetLocalPos()

      if t.offset then
         if t.offset == "impactPos" then
            t.offset = self.params.impactPos
         end
         emitter:getPose():setLocalPos( t.offset )
      end

      if t.bones then
         local index = 1
         while t.bones[index] and not char:findBonePose( t.bones[index] ) do
            index = index + 1
         end
         local bonePose = char:findBonePose( t.bones[index] )
         if bonePose then
            emitter:getPose():setParent( bonePose )
            if not t.offset then
               emitter:getPose():resetLocalPos()
            end
         end
      end

      if t.light then
         emitter:setColor( t.light.color )
         emitter:setRadius( t.light.radius )
         emitter:setIntensity( t.light.intensity )
         self.omniTimer = runTimer( 0.1, { intensity = t.light.intensity, omni = emitter }, omniFlicker, true )
      end

      table.insert(self.emitters, emitter)
   end
end

function CStatusEffectBase:tick()
   local char = self.owner.owner
   if self.params.timeLeft <= 0 or ( char:getState("dead") and self:removeOnDeath() ) then
      self:destroy()
      return
   end

   if not char:getState("dead") then
      local inflictor
      if self.params.inflictor then
         inflictor = getObj( self.params.inflictor, true )
      end
      local denominator = self.params.duration/self.params.interval
      for statName,value in pairs(self.params.changeStats) do
         if not inflictor or inflictor and ( value > 0 or char:isDamageAllowed( inflictor ) ) then
            if statName:find("Percentage") then
               statName = statName:gsub("Percentage", "")
               local statMax = char:getStatCount( statName .. "Max" )
               if statMax then
                  value = ( ( value * self:getStackCount() ) / 100 ) * statMax
               end
            else
               value = value * self:getStackCount()
            end
            char:changeStatCount( statName, value/denominator )

            if char ~= getPlayer() and inflictor == getPlayer()
               and ( gameplayUI.enemyStatus.char == char or not gameplayUI.enemyStatus.char ) then
               runTimer(0, nil, function()
                  gameplayUI:showEnemyStatus(char)
               end, false)
               if char:getStatCount( "health" ) <= 0 then
                  char.killer = getPlayer()
               end
            end
         end
      end
   end

   self.params.timeLeft = round( self.params.timeLeft - self.params.interval, 2 )
end

function CStatusEffectBase:getTimeLeft()
   return self.params.timeLeft
end

function CStatusEffectBase:setTimeLeft( newTime )
   self.params.timeLeft = newTime
end

function CStatusEffectBase:onDestroy()
   local char = self.owner.owner
   for _,aspect in pairs(self.emitters) do
      char:destroyAspect(aspect)
   end
   if self.omniTimer then
      self.omniTimer:stop()
      self.omniTimer = nil
   end
   self.emitters = {}

   for _,soundName in pairs(self.sounds) do
      char.sounds[soundName]:stop()
   end

   if char == getDefaultPlayer() then
      gameplayUI:removeEffectFromUI( self )
   end
end

function CStatusEffectBase:destroy()
   self.owner:destroyEffectByID( self.ID )
end

function CStatusEffectBase:OnSaveState( state )
   if self.static then
      state.stackCount = self.params.stackCount
      state.impactPos = self.params.impactPos
   else
      for k,v in pairs(self.params) do
         state[k] = v
      end
   end

   state.name = self:getName()
   state.timeLeft = self.params.timeLeft
end

return CStatusEffectBase
