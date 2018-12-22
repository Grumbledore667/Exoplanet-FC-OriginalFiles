local oo = require "loop.simple"
local CItemsManager = (require "itemsManager").CItemsManager
local CStatusEffectsManager = require "statusEffectsManager"
local CSenseScheduler = (require "senseScheduler").CSenseScheduler
local CNotificationCenter = (require "notificationCenter").CNotificationCenter
local CAnimationsManager = (require "animationsManager").CAnimationsManager
local CActionsScheduler = (require "actionsScheduler").CActionsScheduler
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local Roles = (require "characters.charactersGroup").Roles
local ObjectsLabels = (require "objectsLabels")
local Appearance = (require "appearance")
local ItemsData = (require "itemsData")
local MeshTextureMapping = require "meshTextureMapping"

local hlp = require "helpers"

local CCharacter = oo.class({
   parameters         = nil,
   states             = nil,
   subscribersOnDeath = nil,
   spawnPos           = nil,
   triggers           = nil,
   immortality        = nil,
})

function CCharacter:loadParameters()
   --log("CCharacter:loadParameters()")

   -- self.parameters are initially filled by engine with external values
   if ( self.parameters == nil ) then
      self.parameters = {}
   end

   self.parameters.orientationSpeed = 300
   self.parameters.maxLandingSpeed  = 750
   self.parameters.weaponSlotId     = 1
   self.parameters.zoneSize         = 1000 -- 10 meters

   self.parameters.viewDist         = 2000  -- 20 meters
   self.parameters.backViewDist     = 1000  -- 10 meters
   self.parameters.viewAngle        = 180

   self.parameters.attackDist       = 1000 -- 10 meters
   self.parameters.attackAngle      = 120

   self.headLooking = loadParam( self, "headLooking", true )
   self.headLookingLimits = {x=30, y=50, z=0}

   self.stats = {
      armor  = {base = 0, current = 0, min = 0},

      health      = {            current = 100, min = 0},
      healthMax   = {base = 100, current = 100, min = 1},
   }
   self:setHealth( self.stats.healthMax.current )

   self.style = { body = {}, attachments = {}, attachmentsList = {}, textures = {} }
end

function CCharacter:init()
   self.notificationCenter = CNotificationCenter{ owner = self }
   self.notificationCenter:init()

   self.itemsManager = CItemsManager{ owner = self }
   self.itemsManager:init()

   self.statusEffectsManager = CStatusEffectsManager{ owner = self }
   self.statusEffectsManager:init()

   self.actionsScheduler = CActionsScheduler{ owner = self }

   self.animationsManager = CAnimationsManager{ owner = self }
   self.animationsManager:init()

   self.senseScheduler = CSenseScheduler{ owner = self }
   self.senseScheduler:init()

   self.states             = {}
   self.blackboard         = {}
   self.subscribersOnDeath = {}
   self.spawnPos           = {x=0,y=0,z=0}
   self.triggers           = {}
   self.triggersVisited    = {}

   self:setRole( ROLE_PLAYER )

   self.killer = nil

   CCharacter.loadParameters( self )

   self:setupTimers( 1/10 )

   self:setSpawnPos( self:getPose():getPos() )

   self:initLookAtData()
end

function CCharacter:initLookAtData()
   self.lookAtFactor = 0
   self.headBonePose = self:findBonePose( "Head" )

   if ( not self.headBonePose ) then
      self.headBonePose = self:findBonePose( "head" )
   end
end

function CCharacter:setupTimers( freq )
   self:stopTimers()

   self.actionsScheduler.timer = runTimer( freq, self.actionsScheduler, self.actionsScheduler.OnIdle, true )
   self.senseScheduler.timer   = runTimer( freq, self.senseScheduler, self.senseScheduler.OnIdle, true )
end

function CCharacter:stopTimers()
   if ( self.actionsScheduler.timer ) then
      self.actionsScheduler.timer:stop()
      self.actionsScheduler.timer = nil
   end

   if ( self.senseScheduler.timer ) then
      self.senseScheduler.timer:stop()
      self.senseScheduler.timer = nil
   end
end

function CCharacter:OnCreate()
   --log("CCharacter:OnCreate()")
   getmetatable(self)["__tostring"] = function(t) return t:getName() end

   CCharacter.init(self)

   self:resetTarget()
   self:stopMove()

   self:setOrientationSpeed( self.parameters.orientationSpeed )
end

function CCharacter:getStatusEffectsManager()
   return self.statusEffectsManager
end

function CCharacter:OnChangeItem( slotId, item )
   self.notificationCenter:postNotification("onChangeItem")
end

function CCharacter:OnDestroy()
   self:stopSounds()
   self:stopTimers()
   --Usually means it's the end of the simulation so no need to go through all the items with inventory updates
   if self == getDefaultPlayer() then return end
   for _,item in pairs(self.itemsManager.items) do
      item.count = 1
      item:destroy()
   end
end

function CCharacter:OnLanding( landingSpeed )
   local deltaSpeed = (-landingSpeed) - self.parameters.maxLandingSpeed

   if ( deltaSpeed > 0 ) then
      self:hit( scaleValue(self:getStatCount("healthMax"), deltaSpeed, self.parameters.maxLandingSpeed) )
   end

   self:animatedEvent( "land" )
   self:setState     ( "inAir", false )
   self:setState     ( "jumping", false )
end

function CCharacter:OnAir(dist)
   self:setState( "inAir", true )
end

function CCharacter:OnSlideBegin()
end

function CCharacter:OnSlideEnd()
end

function CCharacter:OnEnemyHit( params )
-- when CCharacter hits params.target
end

function CCharacter:isDamageAllowed( charAttacker )
   if self.immortality == "immortal" or self.god_mode
      or (self.immortality == "protected" and charAttacker ~= getPlayer()) then
      return false
   end
   return true
end

function CCharacter:equipHatOnStart()
   for _, item in pairs(self.itemsManager.items) do
      if item:getAttireType() == "hat" then
         self.itemsManager:equipSlotWithItem( "hat", item.id, true )
         return
      end
   end
end

function CCharacter:equipAttireOnStart()
   local index = 0
   for _, item in pairs(self.itemsManager.items) do
      if index >= 4 then return end
      if item:getAttireType() == "top" and not self.itemsManager:getSlotItem( "top" ) then
         self.itemsManager:equipSlotWithItem( "top", item.id, true )
         index = index + 1
      elseif item:getAttireType() == "bottom" and not self.itemsManager:getSlotItem( "bottom" ) then
         self.itemsManager:equipSlotWithItem( "bottom", item.id, true )
         index = index + 1
      elseif item:getAttireType() == "shield" and not self.itemsManager:getSlotItem( "shield" ) then
         self.itemsManager:equipSlotWithItem( "shield", item.id, true )
         index = index + 1
      elseif item:getAttireType() == "scanner" and not self.itemsManager:getSlotItem( "scanner" ) then
         self.itemsManager:equipSlotWithItem( "scanner", item.id, true )
         index = index + 1
      end
   end
end

function CCharacter:hasShield()
   return self.itemsManager:getSlotItem( "shield" ) ~= nil
end

function CCharacter:getShieldItem()
   return self.itemsManager:getSlotItem( "shield" )
end

function CCharacter:OnHit( params )
   -- impactor - damage source object (item)
   -- impactType - string (ranged, melee, explosion)
   -- impactPos - impact position
   -- impactForce - set by engine, can be changed
   -- impactRadius - set by engine, can be changed
   -- target - target object (character, rigid)
   -- targetType - target type (string) (character, rigid)
   -- interrupt - boolean, defaults to false. if set to true - stops hit event propagation

   local charAttacker, itemName, damageValue
   charAttacker = params.impactor:getObject()
   itemName = params.impactor:getItemName()
   damageValue = params.impactor:getDamage()

   if not self:isDamageAllowed( charAttacker ) then return end

   -- TODO:FIXME: proper OnHit sequence refactor that allows items to have own additional
   -- logic, damage increase and reduction etc
   damageValue = damageValue * getGlobalParam("dmgMultiplier")
   if charAttacker == getPlayer() then
      damageValue = damageValue * getGlobalParam("dmgOutgoingMultiplier")
   elseif params.target == getPlayer() then
      damageValue = damageValue * getGlobalParam("dmgIncomingMultiplier")
   end

   if self:getStatusEffectsManager():hasEffectName("scamp_22_shock") and itemName == "beacon_light.wpn" then
      damageValue = damageValue * 3
   end
   if self:hasShield() then
      local item = self:getShieldItem()
      damageValue = item:reduceDamage( damageValue )
   end
   if ( not charAttacker or self:getState("dead") ) then
      params.interrupt = true
      return
   end

   if ( not self:isFriend(charAttacker) or getPlayer() == charAttacker ) then
      if getPlayer() == charAttacker then
         damageValue = damageValue * getGlobalParam("dmgOutgoingMultiplier")
         runTimer(0, self, function(self)
            gameplayUI:showEnemyStatus(self)
         end, false)
      end
      if charAttacker.OnEnemyHit then
         charAttacker:OnEnemyHit(params)
      end
      self:hit( math.floor(damageValue), charAttacker)
      if self:getState("dead") == true then
         self.killer = charAttacker
      end
   end

   self.senseScheduler:OnHit( charAttacker, itemName, damageValue )
end

function CCharacter:OnTriggerEnter( trigger )
   --log( "CCharacter:OnTriggerEnter " .. trigger:getName() )

   if self.eventManager then
      self.eventManager:postNotification("OnTriggerEnter", {obj=trigger})
   end

   self.triggers[#self.triggers + 1] = trigger

   if ( not self:isTriggerVisited(trigger) ) then
      if ( trigger.isEnabled and trigger:isEnabled() ) then
         self.triggersVisited[#self.triggersVisited + 1] = trigger
      else
         self.triggersVisited[#self.triggersVisited + 1] = trigger
      end
   end

   --log( "cnt = " .. tostring(#self.triggers) )
   --log( "is in trigger = " .. tostring(self:isInTrigger(Trigger_0)) )
end

function CCharacter:OnTriggerLeave( trigger )
   --log( "CCharacter:OnTriggerLeave " .. trigger:getName() )

   if self.eventManager then
      self.eventManager:postNotification("OnTriggerLeave", {obj=trigger})
   end

   for i=1,#self.triggers do
      if ( self.triggers[i] == trigger ) then
         table.remove( self.triggers, i )
         break
      end
   end

   --log( "cnt = " .. tostring(#self.triggers) )
end

function CCharacter:OnSenseBegin()
end

function CCharacter:OnSenseEnd()
end

function CCharacter:OnStuckIn()
end

function CCharacter:OnStuckOut()
end

function CCharacter:OnFeelIn( char )
   self.senseScheduler:OnFeelIn( char )
end

function CCharacter:OnFeelOut( char )
   self.senseScheduler:OnFeelOut( char )
end

function CCharacter:OnVisualIn( char )
   self.senseScheduler:OnVisualIn( char )
end

function CCharacter:OnVisualOut( char )
   self.senseScheduler:OnVisualOut( char )
end

function CCharacter:OnSleepBegin()
end

function CCharacter:OnSleepEnd()
end

function CCharacter:OnAnimationStop( animation )
   if ( self.animationsManager ) then
      self.animationsManager:OnAnimationStop(animation)
   end
end

function CCharacter:OnAnimationEventIn( animation, event )
   if ( self.animationsManager ) then
      self.animationsManager:OnAnimationEventIn(animation, event)
   end
end

function CCharacter:OnAnimationEventOut( animation, event )
   if ( self.animationsManager ) then
      self.animationsManager:OnAnimationEventOut(animation, event)
   end
end

function CCharacter:isInTrigger( trigger )
   local object = trigger

   if ( type(trigger) == "string" ) then
      object = getObj(trigger)
   end

   for i=1,#self.triggers do
      if ( self.triggers[i] == object ) then
         return true
      end
   end

   return false
end

function CCharacter:isTriggerVisited( trigger )
   local object = trigger

   if ( type(trigger) == "string" ) then
      object = getObj(trigger)
   end

   for i=1,#self.triggersVisited do
      if ( self.triggersVisited[i] == object ) then
         return true
      end
   end

   return false
end

function CCharacter:setImmortality( state )
   self.immortality = state
end

function CCharacter:setSpawnPos( pos )
   self.spawnPos = pos

   self.senseScheduler:setCurZone( self.spawnPos )
end

function CCharacter:getSpawnPos()
   return self.spawnPos
end

function CCharacter:setSpawn( spawner )
   self.spawn = spawner
end

function CCharacter:getSpawn()
   return self.spawn
end

-- items
function CCharacter:hasItem( itemName )
   return self.itemsManager:getItemByName( itemName ) ~= nil
end

function CCharacter:getItemLabel( itemName )
   local item = self.itemsManager:getItemByName( itemName )

   if ( item ) then
      return item:getLabel()
   else
      return ""
   end
end

function CCharacter:addItem( itemName )
   return self.itemsManager:addItem( itemName )
end

function CCharacter:destroyItemByName( itemName )
   local item = self.itemsManager:getItemByName( itemName )

   if ( item ) then
      return self:destroyItem( item.id )
   end
   return false
end

function CCharacter:destroyItem( itemId )
   local item = self.itemsManager:getItemById( itemId )
   if ( item ) then
      return self.itemsManager:destroyItem( itemId )
   end
   return false
end

function CCharacter:giveItemByName( itemName, char, count )
   local item = self.itemsManager:getItemByName( itemName )

   if ( item ) then
      return self:giveItem( item.id, char, count or 1 )
   end
   return false
end

function CCharacter:giveItem( itemId, char, count )
   local myItem = self.itemsManager:getItemById( itemId )
   local foundItem = char.itemsManager:getItemByName( myItem.name )
   local item   = char:addItem( myItem.name )

   if ( item ) then
      if ItemsData.isItemAlive(item.name) then
         if char.itemsManager.aliveItemsCount + count - 1 >= char.itemsManager.aliveItemsMax then
            count = char.itemsManager.aliveItemsMax - char.itemsManager.aliveItemsCount + 1
         end
      end

      myItem:changeCount( -(count) )

      item:changeCount( count - 1 )
      self.itemsManager:updateInventoryUI()
      char.itemsManager:updateInventoryUI()
      if not foundItem then
         item.magazine = myItem.magazine
         item.params = tableDeepCopy( myItem.params )
      end

      if self.OnLostItem then
         self:OnLostItem()
      end
      if char == getPlayer() then
         gameplayUI:showInventoryPickInfo( count .. " " .. item:getLabel() .. " was added to inventory" )
      elseif self == getPlayer() then
         gameplayUI:showInventoryDropInfo( count .. " " .. item:getLabel() .. " was removed from inventory" )
      end
      return item
   end
   return nil
end

function CCharacter:takeItemFrom( itemId, char, count )
   return char:giveItem( itemId, self, count )
end

function CCharacter:getWeaponSlot()
   return self.parameters.weaponSlotId
end

function CCharacter:getWeaponSlotItem()
   return self.itemsManager:getSlotItem( self:getWeaponSlot() )
end

-- roles
function CCharacter:setRole(role)
   --log( "role = " .. tostring(role) )
   self.role = role
   --[[
   if (self.senseScheduler ~= nil) then
      self.senseScheduler:refreshRoles()
   end]]
   self:setFeelVisible(false) -- instantly lose targets
   self:setFeelVisible(true)
end

function CCharacter:getRole()
   return self.role
end

function CCharacter:isEnemy( char )
   return Roles[self.role][char:getRole()] == ENEMY
end

function CCharacter:isIgnore( char )
   return Roles[self.role][char:getRole()] == IGNOR
end

function CCharacter:isFriend( char )
   return Roles[self.role][char:getRole()] == FRIEND
end

-- Sounds

function CCharacter:setSoundParameters(sound, volume, speed, distance)
   if (volume ~= nil) then
      self:soundVolume(sound, volume)
   end
   if (speed ~= nil) then
      self:soundSpeed(sound, speed)
   end
   if (distance ~= nil) then
      self:soundDistance(sound, distance)
   end
end

function CCharacter:loopSound(sound)
   self:soundLoop(sound, true)
   self:playSound(sound)
end

function CCharacter:playSound(sound)
   self:playSound(sound)
end

function CCharacter:stopSound(sound)
   self:stopSound(sound)
end

function CCharacter:stopSounds(sound)
   self:stopSounds()
end

-- Blackboard

function CCharacter:setBBVar(name, value)
   self.blackboard[name] = value
end

function CCharacter:getBBVar(name)
   return self.blackboard[name]
end

-- States

function CCharacter:setState(state, value)
   if (self.states[state] ~= value) then
      self.states[state] = value
      self.notificationCenter:postNotification("onChangeState")
      --log( "setState = " .. state .. " = " .. tostring(value) )
   end
end

function CCharacter:getState( state )
   if ( self.states[state] == nil ) then
      self.states[state] = false
   end

   return self.states[state]
end

-- target
function CCharacter:setTarget( target, offset )
   if target then
      self.target = target
      self:setLookTarget( target:getPose(), offset, 0 )
   end
end

function CCharacter:resetTarget()
   self.target = nil
   self:resetLookTarget()
end

function CCharacter:orientTo( obj )
   local angle = getTargetAngleDir( self, obj:getPose():getPos() )
   self:setOrientation( angle )
   self:setOrientationSpeed( self.orientateSpeed or 120 )

   if ( math.abs(angle) > 30 ) then
      if self.turnRightAnim then
         if ( angle < 0 ) then
            self.animationsManager:playAnimation( self.turnRightAnim .. ".caf", false )
         else
            self.animationsManager:playAnimation( self.turnLeftAnim .. ".caf", false )
         end
      end
   end
end

--Unified method for stats that DON'T recieve bonuses
function CCharacter:setStatCount( statName, value )
   if not statName or not self.stats[statName] or self.stats[statName].base or not value then return end

   if self.stats[statName].min then
      value = math.max( value, self.stats[statName].min )
   end
   if self.stats[statName].max then
      value = math.min( value, self.stats[statName].max )
   elseif self.stats[statName.."Max"] then
      value = math.min( value, self.stats[statName.."Max"].current )
   end

   self.stats[statName].current = value

   if statName == "health" then
      self:setHealth( value )
      if ( value <= 0 ) then
         self:die()
      end
   end
end

--Unified method for stats that DON'T recieve bonuses
function CCharacter:changeStatCount( statName, delta )
   if not statName or not self.stats[statName] or self.stats[statName].base or not delta then return end

   local value = self:getStatCount( statName ) + delta

   if self.god_mode then
      self:setStatCount( statName, math.max( self:getStatCount( statName ), value ) )
   else
      self:setStatCount( statName, value )
   end
end

function CCharacter:getStatCount( statName )
   if not statName or not self.stats[statName] then return end
   return self.stats[statName].current
end

function CCharacter:isStatFull( statName )
   if self.stats[statName.."Max"] then
      return self.stats[statName].current >= self.stats[statName.."Max"].current
   end
end

function CCharacter:getStatPercent( statName )
   if self.stats[statName.."Max"] then
      return ( self.stats[statName].current / self.stats[statName.."Max"].current ) * 100
   end
end

--Spend a requiered amount from a stat if it has enough to cover the cost of the action (which is another stat)
function CCharacter:spendStat( statName1, statName2, deplete )
   if self.stats[statName1].base or not self.stats[statName2].base then return end
   if self:getStatCount( statName1 ) >= math.abs( self:getStatCount( statName2 ) or deplete ) then
      self:changeStatCount( statName1, self:getStatCount( statName2 ) )
      return true
   else
      return false
   end
end

--Unified method for stats that CAN recieve bonuses
function CCharacter:updateStat( statName )
   if not statName or not self.stats[statName] or not self.stats[statName].base then return end
   local flat = 0
   local mult = 1
   local overrideValue
   for _,statusEffect in ipairs(self:getStatusEffectsManager().statusEffects) do
      flat = flat + ( ( statusEffect:getStatBonus( statName .. "Flat" ) or 0 ) * statusEffect:getStackCount() )
      mult = mult + ( ( statusEffect:getStatBonus( statName .. "Mult" ) or 0 ) * statusEffect:getStackCount() )
      overrideValue = statusEffect:getStatBonus( statName .. "Ovrd" )
      if overrideValue then
         break
      end
   end

   self.stats[statName].current = overrideValue or ( (self.stats[statName].base + flat) * mult )
end

function CCharacter:updateStats()
   for statName in pairs( self.stats ) do
      self:updateStat( statName )
   end
end

function CCharacter:subscribeOnDeath( func, obj )
   self.subscribersOnDeath[#self.subscribersOnDeath+1] = { ["func"] = func, ["obj"] = obj, }
end

-- actions
function CCharacter:hit( damage, charAttacker )
   if not self:isDamageAllowed( charAttacker ) or self:getState("dead") then return end

   local armor = self:getStatCount( "armor" )
   local armorCap = getGlobalParam("armorCap") or 60 --having max armor will completely block all damage
   damage = math.floor( damage - (damage*armor/armorCap) - (armor * 0.1) )

   if damage > 0 then
      self:changeStatCount( "health", -damage )

      if ( self:getStatCount( "health" ) > 0 ) then
         self:animatedEvent( "hit" )
      end
   end
end

function CCharacter:die__()
   self:animatedEvent ( "die" )
   self:setState      ( "dead", true )
   self.headLooking = false
end

function CCharacter:die()
   self:die__()

   for i=1,#self.subscribersOnDeath do
      self.subscribersOnDeath[i].func( self.subscribersOnDeath[i].obj, self )
   end
   if not self.installer
      or self.installer:getScriptClass() ~= "CSpawn" and self.installer:getScriptClass() ~= "CSmartSpawn" then
      questSystem:fireEvent("dead", self:getName(), self)
   end
end

function CCharacter:stopMove()
   self:setStrafeSpeed( 0 )
   self:setMoveSpeed  ( 0 )
end

function CCharacter:animatedMoveEvent( moveType, dirType )
   return not self:getState( "dead" )
end

function CCharacter:animatedEvent( eventType )
   return not self:getState( "dead" )
end

function CCharacter:setStealth( value )
   self:setState( "inStealth", value )
end

function CCharacter:getStealth()
   return self:getState( "inStealth" )
end

-- ---------------------------------------------------------------------------------------
-- Appearance
-- ---------------------------------------------------------------------------------------
function CCharacter:setupAppearance( styleName )
   if not styleName then return end
   local prefabName = self:getPrefabName():gsub(".cfg", "")
   if styleName == "" or not Appearance.getStyle( styleName ) then
      if prefabName == "abori" or prefabName == "human_male" or prefabName == "hulk" then
         styleName = prefabName .. "_naked"
      else
         return
      end
   end

   local style = Appearance.getStyle( styleName )

   if ( not style ) then
      return
   end

   self.styleName = styleName

   local body = {}
   for i=1,#style.body do
      for j=1,#style.body[i] do
         body[#body+1] = style.body[i][j]
      end
   end
   self:setVisibleMeshesOnly( body )
   self.style.body = style.body

   local charMeshTextureMap = MeshTextureMapping.getCharacterMeshTextureMap( self )
   if style.textures and charMeshTextureMap then
      for name,textureID in pairs( style.textures ) do
         --we found a mesh-texture map with that name
         if charMeshTextureMap[name] then
            for _,meshTextureMap in pairs( charMeshTextureMap[name] ) do
               for _,meshName in pairs( meshTextureMap.meshes ) do
                  self:setMeshTexture( meshName, 0, meshTextureMap.textures[textureID] )
               end
            end
         else --means we have to set only a single mesh
            local meshTextures = MeshTextureMapping.getCharacterMeshTextures( name )
            if meshTextures[textureID] then
               self:setMeshTexture( name, 0, meshTextures[textureID] )
            end
         end
      end
      self.style.textures = style.textures
   end

   --clear prev attachments
   for _,v in pairs(self.style.attachmentsList) do
      hlp.safeDestroyEntity( v )
   end
   self.style.attachments = {}
   self.style.attachmentsList = {}
   if style.attachments then
      for _,v in pairs(style.attachments) do
         local targetBone = self:getBonePose( v.bone )
         if ( targetBone ) then
            local entity = hlp.safeCreateEntity( v.name, "" )
            entity:getPose():setParent( targetBone )
            entity:getPose():resetLocalPose()
            entity:getPose():setLocalPos( v.pos )
            entity:getPose():setLocalRot( v.rot )
            entity:getPose():setLocalScale( v.scale )
            table.insert(self.style.attachments, v)
            table.insert(self.style.attachmentsList, entity)
         end
      end
   end
end

function CCharacter:updateAttire()
   if #self.style.body == 0 then return end

   local dontRemoveBodyMesh = { "junk_legs_1", "junk_top_1", "junk_top_2" }
   local t = {}
   for _,v in pairs(self.style.body) do
      for __,val in pairs(v) do
         table.insert(t, val)
      end
   end
   for _, slotName in pairs( { "top", "bottom", "scanner" } ) do
      local item = self.itemsManager.slots[slotName]
      if item then
         for __,val in pairs(item:getAttireMeshes()) do
            table.insert(t, val)
            if val:find("legs") and not getKeyByValue( dontRemoveBodyMesh, val ) and getKeyByValue( t, "human_male_legs" ) then
               table.remove(t, getKeyByValue( t, "human_male_legs" ))
            elseif val:find("top") and not getKeyByValue( dontRemoveBodyMesh, val ) and getKeyByValue( t, "human_male_top" ) then
               table.remove(t, getKeyByValue( t, "human_male_top" ))
            end
         end
      end
   end
   self:setVisibleMeshesOnly( t )
end

function CCharacter:setupAccessory( attachments )
   if not attachments then
      return
   end
   local destroyHairFor = { "hat", "turban", "mask", "helmet" }

   for _,v in pairs(attachments) do
      local targetBone = self:getBonePose( v.bone )
      if ( targetBone ) then
         for key,val in pairs(self.style.attachmentsList) do
            if val:getPrefabName():find("hair") -- destroy hair for selected accessory meshes
               and ( v.name:find("hat") or v.name:find("turban") or v.name:find("mask") or v.name:find("helmet") )
               or val:getPrefabName() == v.name then --or destroy existing accessory
               getScene():destroyEntity( val )
               table.remove(self.style.attachments, key)
               table.remove(self.style.attachmentsList, key)
               break
            end
         end

         local entity = getScene():createEntity( v.name, "" )
         entity:getPose():setParent( targetBone )
         entity:getPose():resetLocalPose()
         if v.pos then
            entity:getPose():setLocalPos( v.pos )
         end
         if v.rot then
            entity:getPose():setLocalRot( v.rot )
         end
         if v.scale then
            entity:getPose():setLocalScale( v.scale )
         end
         table.insert(self.style.attachments, v)
         table.insert(self.style.attachmentsList, entity)
      end
   end
end

function CCharacter:removeAccessory( attachments )
   if not attachments then
      return
   end

   for _,v in pairs(attachments) do
      local targetBone = self:getBonePose( v.bone )
      for key,val in pairs(self.style.attachmentsList) do
         if ( val ) then
            local bone = val:getPose():getParent( )
            if v.name == val:getPrefabName() then
               getScene():destroyEntity( val )
               table.remove(self.style.attachments, key)
               table.remove(self.style.attachmentsList, key)
               break
            end
         end
      end
   end
end
-- ---------------------------------------------------------------------------------------
-- Dialogs' rootine
-- ---------------------------------------------------------------------------------------
function CCharacter:startTalk( char )
   return false
end

function CCharacter:stopTalk( char )
end

function CCharacter:getLabel()
   local label = ObjectsLabels.getLabel( self:getPrefabName() )

   if ( label == "" ) then
      label = self:getName()
   end

   return label
end

-- ---------------------------------------------------------------------------------------
--
-- ---------------------------------------------------------------------------------------
function CCharacter:OnIdle()
   self:trackLookAtTarget()
   --TODO:FIXME: Large amounts of npcs with stats and effects could slow down the game
   --Might need to think of a more efficient way to update stats.
   if self.immortality ~= "immortal" and not self:getState("dead") then
      self:updateStats()
      self:regenerate()
   end
end

function CCharacter:regenerate()
end

function CCharacter:getHeadPos()
   if ( self.headBonePose ) then
      return self.headBonePose:getPos()
   end

   return self:getPose():getPos()
end

function CCharacter:trackLookAtTarget()
   if ( not self.headBonePose or not self.headLooking ) then
      return
   end

   local closestChar = self.senseScheduler:getClosestCharacter()

   if self:getState("talk") and self.talkChar then
      closestChar = self.talkChar
   end

   if ( self.prevHeadTarget and self.prevHeadTarget ~= closestChar ) then
      closestChar = nil
   end

   if ( not closestChar and self.lookAtFactor <= 0 ) then
      self.prevHeadTarget = nil
      return
   end

   if ( not closestChar or not closestChar.getHeadPos or self:getStrafeSpeed() ~= 0 or self:getMoveSpeed() < 0 ) then
      if ( self.lookAtFactor > 0 ) then
         self.headBonePose:setLocalRotQuat( quatSlerp( self.headBonePose:getLocalRotQuat(), self.lookAtTargetRot, clamp(self.lookAtFactor,0,1) ) )
         self.lookAtFactor = self.lookAtFactor - getFrameTime() * 2
      end
      return
   end

   --if ( self == getPlayer() ) then log( "cn = " .. closestChar:getName() ) end
   --log( "cv = " .. tostring(self:checkInView( closestChar:getHeadPos(), 40, true )) )

   local targetDir = vec3Normalize( vec3Sub( closestChar:getHeadPos(), self:getHeadPos() ) )

   targetDir = vec3RotateQuat( targetDir, quatInverse(self:getPose():getRotQuat()) )

   local targetRotation = quatRotateQuat( quatFromDirs( {z=-1}, targetDir ) )
   local targetAngles = getAnglesFromQuat( targetRotation )
   targetAngles.x = clamp(targetAngles.x, -self.headLookingLimits.x, self.headLookingLimits.x)
   targetAngles.y = clamp(targetAngles.y, -self.headLookingLimits.y, self.headLookingLimits.y)
   targetAngles.z = clamp(targetAngles.z, -self.headLookingLimits.z, self.headLookingLimits.z)
   self.lookAtTargetRot = quatRotateQuat( quatFromEuler( targetAngles ), self.headBonePose:getLocalRotQuat() )
   --self.lookAtTargetRot = quatRotateQuat( quatFromDirs( {z=-1}, targetDir ), self.headBonePose:getLocalRotQuat() )
   --self.lookAtTargetRot = quatRotateQuat( quatFromDirs( self:getDirSoft(), targetDir ), self.headBonePose:getLocalRotQuat() )

   if ( self.lookAtFactor < 1 ) then
      self.lookAtTargetRot = quatSlerp( self.headBonePose:getLocalRotQuat(), self.lookAtTargetRot, clamp(self.lookAtFactor,0,1) )
      self.lookAtFactor    = self.lookAtFactor + getFrameTime() * 3
   end

   self.headBonePose:setLocalRotQuat( self.lookAtTargetRot )

   self.prevHeadTarget = closestChar
end

-- ---------------------------------------------------------------------------------------
-- effects rootine
-- ---------------------------------------------------------------------------------------
function CCharacter:playEffect( effectName, time )
   if ( not self.fx ) then self.fx = {} end

   if ( effectName == "electro_shock" ) then
      if ( not self.fx.electroShock ) then
         self.fx.electroShock = {}
         self.fx.electroShock.emitter = self:createAspect( "electro_shock.sps" )

         local emitter = self.fx.electroShock.emitter

         emitter:setLoop( true )

         local scale = (self:getCollisionRadius() + self:getCollisionHeight()) * 0.005
         if ( scale < 0.5 ) then scale = 0.5 end

         emitter:getPose():setScale     ( {x=scale,y=scale,z=scale} )
         emitter:getPose():setParent    ( self:getPose() )
         emitter:getPose():resetLocalPos()
         emitter:getPose():setLocalPos  ( {x=0,y=self:getCollisionHeight() * 0.5,z=0} )

         self.fx.electroShock.sound = self:createAspect( "electro_smash.wav" )

         self.fx.electroShock.sound:getPose():setParent( self:getPose() )
         self.fx.electroShock.sound:getPose():resetLocalPose()
         self.fx.electroShock.sound:getPose():setLocalPos( {x=0,y=100,z=0} )
         self.fx.electroShock.sound:setLoop( false )
         self.fx.electroShock.sound:setDistance( 1200 )
      end

      if ( self.fx.electroShock.timer ) then
         self.fx.electroShock.timer:stop()
         self.fx.electroShock.timer = nil
      end

      self.fx.electroShock.emitter:play()
      self.fx.electroShock.sound:play()
      self.fx.electroShock.timer = runTimer( time, self.fx.electroShock, CCharacter.stopEffect, false )
   end
end

function CCharacter:stopEffect()
   self.emitter:stop()
   self.timer = nil
end

function CCharacter:getLootTable()
   local t = {}
   local itemsMgr = self.itemsManager
   if not itemsMgr and self.inventory then itemsMgr = self.inventory.itemsManager end

   for _,item in pairs(itemsMgr.items) do
      t[item:getItemName()] = item.count
   end

   return t
end

function CCharacter:OnSaveState( state )
   state.immortality = self.immortality
   state.feelVisible = self:getFeelVisible()
   state.styleName = self.styleName

   state.stats = {}
   for statName,v in pairs(self.stats) do
      if not v.base then
         state.stats[statName] = v.current
      end
   end

   local index = 1
   state.statusEffects = {}
   for _,effect in ipairs(self.statusEffectsManager.statusEffects) do
      if effect:isSaved() then
         state.statusEffects[index] = {}
         effect:OnSaveState( state.statusEffects[index] )
         index = index + 1
      end
   end
end

function CCharacter:OnLoadState( state )
   if state.immortality then
      self.immortality = state.immortality
   end
   if state.feelVisible ~= nil then
      self:setFeelVisible( state.feelVisible )
   end
   if state.styleName then
      self:setupAppearance( state.styleName )
   end

   if not self:getState("dead") then
      if state.stats then
         for statName,value in pairs(state.stats) do
            self:setStatCount( statName, value)
         end
      end
   end

   if state.statusEffects then
      for _,effectState in ipairs(state.statusEffects) do
         self.statusEffectsManager:addStatusEffect( effectState )
      end
   end
end

return {CCharacter=CCharacter}
