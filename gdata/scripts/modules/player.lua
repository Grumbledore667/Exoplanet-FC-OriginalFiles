local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local CSkillsManager = require "skillsManager"

local CPlayer = oo.class({}, CCharacter)

function CPlayer:init()
   self.cookItem      = nil

   self.skillsManager = CSkillsManager{ owner = self }
   self.skillsManager:init()

   CPlayer.loadParameters( self )

   self:setupTimers( 1/30 )
end

function CPlayer:loadParameters()
   self.parameters.heartbeatSound = "pilot_heartbeat.wav"
   self.parameters.heartbeatSoundDistance = 3000

   self.parameters.maxLandingSpeed  = 1000

   self.parameters.runSpeed  = 390.0
   self.parameters.walkSpeed = 105.0
   self.parameters.viewAngle = 110

   self.parameters.velocityFactor = 0.2

   self.senseScheduler:setFeelRadius( 1000 )
end

function CPlayer:OnCreate()
   CCharacter.OnCreate( self )

   CPlayer.init( self )

   self:setFlowSpeed( 1.0 )
   self:setHighlightsRadius( 0 )

   self.prevCamOffset = 3

   self:setSoundParameters( self.parameters.heartbeatSound, 1.0, 1.0, self.parameters.heartbeatSoundDistance )

   self:addActions     ()
   self:OnReturnControl()
end

function CPlayer:OnDestroy()
   CCharacter.OnDestroy(self)
   self:OnBlockControl()
end

function CPlayer:OnFeelIn( char )
   CCharacter.OnFeelIn( self, char )
end

function CPlayer:OnFeelOut( char )
   CCharacter.OnFeelOut( self, char )
end

function CPlayer:OnBlockControl()
   self:setState( "blockControl", true )
end

function CPlayer:OnReturnControl()
   self:setState( "blockControl", false )
end

function CPlayer:disableItemsUse( state )
   self:setState("disableItemsUse", state)
end

function CPlayer:resetButtons()
   for _,v in pairs(getKeysMap()) do
      self:OnControlUp(v.code)
   end
end

function CPlayer:canAnything()
   return not gameplayUI:isConsoleVisible()
      and not gameplayUI:isItemDelimiterVisible()
      and not gameplayUI:isDebugVisible()
      and not gameplayUI:isCombLockVisible()
      and not gameplayUI:isStylesEditorVisible()
      and gameplayUI:isGameplayRootWindow()
      and not getGlobalParam("inScene")
      and not self:getState("remoteControl")
end

function CPlayer:canUseItems()
   return self:canAnything() and not self:getState("disableItemsUse")
end

function CPlayer:canInteract()
   return self:canAnything() and not self:getState("disableInteraction")
end

function CPlayer:canAttack()
   return self:canAnything()
      and not gameplayUI:clickableWindowsVisible()
      and not self:getState( "disableAttack" ) and not self:getState( "waitReloadEnd" )
      and not self:getState("inAir") and not self:getState("sprintMode") and not terminalUI:isCursorVisible()
end

function CPlayer:canMove()
   return self:canAnything()
      and not gameplayUI:clickableWindowsVisible() and not self:getState("disableMove")
end

function CPlayer:canJump()
   return self:canAnything()
      and not gameplayUI:clickableWindowsVisible() and not self:getState("disableJump")
      and not self:getState("inAir")
end

function CPlayer:canUseUI()
   return not self:getState("disableUI")
end

function CPlayer:OnControlDown( code )
   if code == getButtonCode( "JUMP" ) then
      dialogSystem.space = true
   end

   if ( dialogSystem:inputKey( code ) or self:getState("dead") or not self:canAnything() ) then
      return false
   end

   resetButtonsWaitDouble( code )
   setButton( code, true )

   if code == getButtonCode( "FORWARD" ) then
   elseif code == getButtonCode( "BACK" ) then
      if getButtonWaitDouble( code ) then
         self:stepMove( "back" )
      else
         setButtonWaitDouble( code, true )
         runTimer(0.2, nil, function() setButtonWaitDouble( code, false ) end, false)
      end
   elseif code == getButtonCode( "LEFT" ) then
      if getButtonWaitDouble( code ) then
         self:stepMove( "left" )
      else
         setButtonWaitDouble( code, true )
         runTimer(0.2, nil, function() setButtonWaitDouble( code, false ) end, false)
      end
   elseif code == getButtonCode( "RIGHT" ) then
      if getButtonWaitDouble( code ) then
         self:stepMove( "right" )
      else
         setButtonWaitDouble( code, true )
         runTimer(0.2, nil, function() setButtonWaitDouble( code, false ) end, false)
      end
   elseif code == getButtonCode( "WALK" ) then
   elseif code == getButtonCode( "SPRINT" ) then
   elseif code == getButtonCode( "JUMP" ) then
   elseif code == getButtonCode( "JOURNAL" ) and self:canUseUI() then
      gameplayUI:showJournal( not gameplayUI:isJournalVisible() )
   end

   return true
end

function CPlayer:OnControlUp( code )
   if code == getButtonCode( "JUMP" ) then
      dialogSystem.space = false
   end
   if gameplayUI:isConsoleVisible() or not gameplayUI:isGameplayRootWindow() then
      return false
   end

   setButton( code, false )

   return true
end

function CPlayer:OnChangeItem( slotId, item )
   CCharacter.OnChangeItem( self, slotId, item )
   self:updateWeaponGui()
end

function CPlayer:OnInteractBegin( obj )
   if ( obj.OnInteractTriggerBegin ) then
      obj:OnInteractTriggerBegin( self )
   end
end

function CPlayer:OnInteractEnd( obj )
   if ( obj.OnInteractTriggerEnd ) then
      obj:OnInteractTriggerEnd( self )
   end
end

function CPlayer:OnInteractHighlightBegin( obj )
   if ( self.scanWaveTimer and obj.OnInteractHighlightBegin ) then
      obj:OnInteractHighlightBegin( self )
   end
end

function CPlayer:OnInteractHighlightEnd( obj )
   if ( self.scanWaveTimer and obj.OnInteractHighlightEnd ) then
      obj:OnInteractHighlightEnd( self )
   end
end

function CPlayer:OnInventoryDrag( item, count )end
function CPlayer:OnInventoryDrop( item, count )end
function CPlayer:OnInventoryClose()end
function CPlayer:OnInventoryTakeAll()end
function CPlayer:OnPopupInventoryOpen( item )end
function CPlayer:OnPopupInventoryClick( text )end
function CPlayer:OnCraftPrepare( listIds )end
function CPlayer:OnCraftClear()end
function CPlayer:OnCraft()end

function CPlayer:getInventory()
   return self.itemsManager
end

function CPlayer:getTargetInventory()
   if ( self.exchangeTarget ) then
      return self.exchangeTarget.itemsManager
   end

   return nil
end

-- gui
function CPlayer:updateWeaponGui()
   if ( self ~= getDefaultPlayer() ) then
      return
   end
   local currentWeapon = self.itemsManager:getSlotItem( self.parameters.weaponSlotId )

   if ( not currentWeapon ) then
      gameplayUI:setItemIcon("Hand")
   else
      if ( currentWeapon.icon ) then
         gameplayUI:setItemIcon( currentWeapon.icon )
      end
   end
   self:updateAmmoGui()
end

function CPlayer:updateAmmoGui()
   if ( self ~= getDefaultPlayer() ) then
      return
   end

   local item = self.itemsManager:getSlotItem( self.parameters.weaponSlotId )

   if ( item and item.getAmmoCount ) then
      local activeAmmoCount = 0
      if item.activeAmmo then
         activeAmmoCount = item.activeAmmo.count
      end
      if item:getWeaponType() == "energy" then
         gameplayUI:setAmmoCount( item:getAmmoCount() )
      else
         gameplayUI:setAmmoCount( item:getAmmoCount() .. "/" .. activeAmmoCount )
      end
   else
      gameplayUI:setAmmoCount( -1 )
   end
   gameplayUI:updateAllHotbarItems()
end

--Unified method for stats that DON'T recieve bonuses
function CPlayer:changeStatCount( statName, delta )
   CCharacter.changeStatCount( self, statName, delta )
   gameplayUI:updatePlayerStat( statName )
end

--Unified method for stats that CAN recieve bonuses
function CPlayer:updateStat( statName )
   CCharacter.updateStat( self, statName )
   gameplayUI:updatePlayerStat( statName )
end

function CPlayer:updateHeartbeat()
   local health = self:getHealth()
   local halfMaxHealth = self.parameters.health / 2
   if ((health > 0) and (health <= halfMaxHealth)) then
      if (not self.heartbeat) then
         self:loopSound(self.parameters.heartbeatSound)
         self.heartbeat = true
      end
      local volume = 1.0 - scaleValueFloat(0.9, health, halfMaxHealth)
      local speed = 1.5 - scaleValueFloat(0.75, health, halfMaxHealth)
      self:setSoundParameters(self.parameters.heartbeatSound, volume, speed)
   else
      self:stopSound(self.parameters.heartbeatSound)
      self.heartbeat = false
   end
end

function CPlayer:nextWeapon()
end

function CPlayer:prevWeapon()
end

-- activation
function CPlayer:activateObject()
end

-- actions
function CPlayer:addActions()
   local move = CAction{}
   move:allowRestartOnEvent("onChangeButtonState")
   move:allowRestartOnEvent("onChangeState")
   move.start = self.move_start
   move.stop  = self.move_stop
   move.name  = "move"

   local jump = CAction{}
   jump.start = self.jump
   jump.name  = "jump"

   local attack = CAction{}
   attack.start = self.attack
   attack.name  = "attack"

   local root = CNode{}
   root:yes (self.jump_):no  (self.attack_):yes (attack)
   root:yes (self.jump_):yes (jump)
   root:yes (self.move_):yes (move)

   self.actionsScheduler.root = root
   self.notificationCenter:postNotification( "onActionsSchedulerRootUpdate" )
end

function CPlayer:hit( damage, charAttacker )
   CCharacter.hit( self, damage, charAttacker )
   gameplayUI:updateImmersiveUITimeRef( "ammo" )
end

function CPlayer:die()
   CCharacter.die( self )
end

-- move
function CPlayer:move_()
   if ( self:getHealth() == 0 ) then
      return false
   end

   return true
end

function CPlayer:move_start()
   self:stopMove()

   local idleMode = true
   local aimMode = self:getState("aiming") and self.prevCamOffset ~= 3
   local runMode  = not getButton("WALK") and not aimMode and not self:getState("swimming") and self:canMove()
   local sprintMode = getButton("SPRINT") and runMode and not self:getState("tired") and getButton("FORWARD")
                     and not (self:getState("reloading") or self:getState("swimming") or getButton("BACK") or getButton("LEFT") or getButton("RIGHT"))
   local swimMode  = not aimMode and self:getState("swimming")
   local swimSprintMode = getButton("SPRINT") and swimMode and not self:getState("tired") and getButton("FORWARD") and self:canMove()
                           and (self:getState("swimming") and not getButton("BACK") or getButton("LEFT") or getButton("RIGHT"))
   local moveType = "walk"
   local dirType  = nil
   local speed    = self.parameters.walkSpeed
   local mvSpeed  = 0
   local stSpeed  = 0

   self:updateCamera()
   if self:canMove() then
      if sprintMode then
         moveType = "sprint"
         speed = self.parameters.runSpeed * 1.75
         dirType = "front"
         idleMode = false
         mvSpeed = speed
         stSpeed = 0
      elseif swimSprintMode then
         moveType = "sprint"
         speed = self.parameters.walkSpeed * 2
         dirType = "front"
         idleMode = false
         mvSpeed = speed
         stSpeed = 0
      else
         if ( runMode ) then
            moveType = "run"
            if self.super_speed then
               speed = self.parameters.runSpeed * 3
            else
               speed = self.parameters.runSpeed
            end
         end

         if ( getButton("BACK") ) then
            mvSpeed  = -speed
            dirType  = "back"
            idleMode = false
         elseif ( getButton("FORWARD") ) then
            mvSpeed  = speed
            dirType  = "front"
            idleMode = false
         end

         if ( getButton("LEFT") ) then
            stSpeed  = -speed
            dirType  = "left"
            idleMode = false
         elseif (getButton("RIGHT")) then
            stSpeed  = speed
            dirType  = "right"
            idleMode = false
         end
      end
   end

   if ( idleMode ) then
      self:animatedMoveEvent( "idle", nil )
   else
      self:setMoveSpeed  ( mvSpeed )
      self:setStrafeSpeed( stSpeed )
      self:animatedMoveEvent( moveType, dirType )
   end

   self:setState("walkMode", false)
   self:setState("runMode", false)
   self:setState("sprintMode", false)
   self:setState(moveType.."Mode", true)
   self:setState("idleMode", idleMode)

   self:updateStat( "staminaRegen" )
end

function CPlayer:move_stop()
   self:stopMove()

   self:setState("walkMode", false)
   self:setState("runMode", false)
   self:setState("sprintMode", false)
   self:setState("idleMode", true)

   self:updateStat( "staminaRegen" )
end

-- attack
function CPlayer:attack_()
   local currentWeapon = self:getWeaponSlotItem()
   if ( not currentWeapon
        or self:getHealth() == 0
        or not self:canAttack()
        or not getButton("ATTACK") and not ( getButton("AIM") and currentWeapon:isMeleeWeapon() ) ) then
      return false
   end

   return true
end

function CPlayer:attack()
   if getButton("AIM") then
      self:animatedEvent( "attackAlt" )
   else
      self:animatedEvent( "attack" )
   end
end

-- jump
function CPlayer:jump_()
   if ( not getButton("JUMP") or not self:canJump() ) then
      return false
   end

   return true
end

function CPlayer:jump()
   local moveSpeed   = self:getMoveSpeed()
   local strafeSpeed = self:getStrafeSpeed()
   local maxSpeed    = moveSpeed

   if ( maxSpeed < strafeSpeed ) then
      maxSpeed = strafeSpeed
   end

   local velocity = 300 + maxSpeed * self.parameters.velocityFactor

   self:setState( "jumping", true )
   self:startJump    ( velocity )
   self:animatedEvent( "jump" )
   self:move_start()
end

function CPlayer:stepMove( dir )
   if self:getScriptClass() == "CMainCharacter" and self:canMove() then
      local animationSet = self.itemsManager:getSlotAnimationSet( self.parameters.weaponSlotId )
      if animationSet ~= "" and not self:getState("inAir") then
         if self:spendStat( "stamina", "staminaStepMoveCost", false ) then
            self:stopMove()
            local pushDir = self:getDir()
            if dir == "back" then
               pushDir = vec3RotateEuler (pushDir, { x=0, y=180, z=0})
            elseif dir == "left" then
               pushDir = vec3RotateEuler (pushDir, { x=0, y=90, z=0})
            elseif dir == "right" then
               pushDir = vec3RotateEuler (pushDir, { x=0, y=-90, z=0})
            end
            self:push( pushDir, 10000, 0.6 )
            self.animationsManager:playAnimation( self.animations.step[dir][animationSet] )
            self:setDisableActionStates( true )
            self.animationsManager:subscribeAnimationEnd(self.animations.step[dir][animationSet], self, function(self)
               self:setDisableActionStates( false )
            end)
         end
      end
   end
end

function CPlayer:OnIdle()
   CCharacter.OnIdle( self )
   gameplayUI:immersiveUIUpdate()
end

function CPlayer:updateCamera()
end

function CPlayer:rotateBone( boneName, angle )
   local rot = self:getBonePose(boneName):getLocalRotQuat()
   rot = quatRotateQuat( quatFromEuler({x=angle}), rot )
   self:getBonePose(boneName):setLocalRotQuat( rot )
end

function CPlayer:animatedMoveEvent( moveType, dirType )
   if ( not CCharacter.animatedMoveEvent( self, moveType, dirType ) ) then
      return false
   end

   if ( (self:getMoveSpeed() ~= 0 or
      self:getStrafeSpeed() ~= 0 or
      (self:getWeaponSlotItem() and self.itemsManager:isWeapon(self:getWeaponSlotItem().name))) and
      not self:getState( "talk" ) ) then
      if self:getState("swimming") then
         self:setOrientationSpeed( self.parameters.orientationSpeed / 3 )
      else
         self:setOrientationSpeed( self.parameters.orientationSpeed )
      end
   else
      self:setOrientationSpeed( 0 )
   end

   return true
end

function CPlayer:animatedEvent( eventType )
   return CCharacter.animatedEvent( self, eventType )
end

function CPlayer:useItem( item )
end

return {
   CPlayer=CPlayer,
}
