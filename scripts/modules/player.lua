local oo = require "loop.multiple"
local CCharacter = (require "character").CCharacter
local _rootPlayer = (require "roots")._rootPlayer
local CSkillsManager = require "skillsManager"
local Keys = require "global.keys"

local TerminalUI     = require "ui.terminal"
local ImmersiveUI = require "ui.immersiveUI"
local GUIUtils      = require "ui.utils"

local ai = require "ai"

---@class CPlayer : CCharacter
local CPlayer = oo.class({}, _rootPlayer, CCharacter)

function CPlayer:init()
   CCharacter.init(self)
   self.cookItem      = nil

   self.skillsManager = CSkillsManager{ owner = self }
   self.skillsManager:init()

   self:setupTimers(1/30)
end

function CPlayer:setupTimers(freq)
   self:stopTimers()

   self.senseScheduler.timer = runTimer(freq, self.senseScheduler, self.senseScheduler.OnIdle, true)
   self.behaviorTreeTimer    = runTimerAdv(freq, true, function()
      ai.utils.ticker(self)
      self.notificationCenter:removeNotifications()
   end)
end

function CPlayer:stopTimers()
   CCharacter.stopTimers(self)

   if self.behaviorTreeTimer then
      self.behaviorTreeTimer:stop()
      self.behaviorTreeTimer = nil
   end
end

function CPlayer:isManaged()
   return self:getName() ~= "__unmanaged_player"
end

function CPlayer:loadParameters()
   CCharacter.loadParameters(self)
   self.parameters.heartbeatSound = "Play_pilot_heartbeat"
   self.parameters.heartbeatSoundDistance = 3000

   self.parameters.maxLandingSpeed  = 1000

   self.parameters.runSpeed  = self:getRunSpeed()
   self.parameters.walkSpeed = self:getWalkSpeed()
   self.parameters.viewAngle = 110

   self.parameters.velocityFactor = 0.2

   self.senseScheduler:setFeelRadius(1000)
end

function CPlayer:OnCreate()
   CCharacter.OnCreate(self)

   self:setFlowSpeed(1.0)
   self:setHighlightsRadius(0)

   self.prevCamOffset = 3

   self:setSoundParameters(self.parameters.heartbeatSound, 1.0, 1.0, self.parameters.heartbeatSoundDistance)

   self:OnReturnControl()
end

function CPlayer:getWalkSpeed()
   return 105
end

function CPlayer:getRunSpeed()
   return 390
end

function CPlayer:OnDestroy()
   CCharacter.OnDestroy(self)
   self:OnBlockControl()
end

function CPlayer:OnFeelIn(char)
   CCharacter.OnFeelIn(self, char)
end

function CPlayer:OnFeelOut(char)
   CCharacter.OnFeelOut(self, char)
end

function CPlayer:OnBlockControl()
   self:setState("blockControl", true)
end

function CPlayer:OnReturnControl()
   self:setState("blockControl", false)
end

function CPlayer:disableItemsUse(state)
   self:setState("disableItemsUse", state)
end

function CPlayer:resetButtons()
   for _,v in pairs(Keys.getKeysMap()) do
      self:OnControlUp(v.code)
   end
end

function CPlayer:canAnything()
   return not gameplayUI:isConsoleVisible()
      and not gameplayUI.debugUI:isVisible()
      and not gameplayUI:editBoxHasFocus()
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
      and not GUIUtils.interactiveWindowsVisible()
      and not self:getState("disableAttack") and not self:getState("waitReloadEnd")
      and not self:getState("inAir") and not self:getState("sprintMode") and not TerminalUI.isCursorVisible()
end

function CPlayer:canMove()
   return self:canAnything()
      and not GUIUtils.interactiveWindowsVisible() and not self:getState("disableMove")
end

function CPlayer:canJump()
   return self:canAnything()
      and not GUIUtils.interactiveWindowsVisible() and not self:getState("disableJump")
      and not self:getState("inAir")
end

function CPlayer:canUseUI()
   return not self:getState("disableUI")
end

function CPlayer:OnControlDown(code)
   if code == getButtonCode("JUMP") then
      dialogSystem.space = true
   end

   if dialogSystem:inputKey(code) or self:getState("dead") or not self:canAnything() then
      return false
   end

   resetButtonsWaitDouble(code)
   setButton(code, true)

   if code == getButtonCode("WALK") then
   elseif code == getButtonCode("SPRINT") then
   elseif code == getButtonCode("JUMP") then
   end

   return true
end

function CPlayer:OnControlUp(code)
   if code == getButtonCode("JUMP") then
      dialogSystem.space = false
   end
   if gameplayUI:isConsoleVisible() or not gameplayUI:isGameplayRootWindow() then
      return false
   end

   setButton(code, false)

   return true
end

function CPlayer:OnChangeItem(slotId, item)
   CCharacter.OnChangeItem(self, slotId, item)
end

function CPlayer:OnInteractBegin(obj)
   if obj.OnInteractTriggerBegin then
      obj:OnInteractTriggerBegin(self)
   end
end

function CPlayer:OnInteractEnd(obj)
   if obj.OnInteractTriggerEnd then
      obj:OnInteractTriggerEnd(self)
   end
end

function CPlayer:OnInteractHighlightBegin(obj)
   if self.scanWaveTimer and obj.OnInteractHighlightBegin then
      obj:OnInteractHighlightBegin(self)
   end
end

function CPlayer:OnInteractHighlightEnd(obj)
   if self.scanWaveTimer and obj.OnInteractHighlightEnd then
      obj:OnInteractHighlightEnd(self)
   end
end

function CPlayer:OnInventoryDrag(item, count)end
function CPlayer:OnInventoryDrop(item, count)end

function CPlayer:updateHeartbeat()
   local health = self:getHealth()
   local halfMaxHealth = self.parameters.health / 2
   if (health > 0) and (health <= halfMaxHealth) then
      if not self.heartbeat then
         --self:loopSound(self.parameters.heartbeatSound)
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

function CPlayer:OnHit(params)
   CCharacter.OnHit(self, params)

   if params.impactor.isRangedWeapon and params.impactor:isRangedWeapon() then
      gameplayUI.hudUI:setupDamageIndicator(params.impactor)
   end
end

function CPlayer:hit(damage, charAttacker, direction)
   CCharacter.hit(self, damage, charAttacker, direction)
   ImmersiveUI.triggerUI("weapon")
end

function CPlayer:die()
   CCharacter.die(self)

   gameplayUI.hudUI:updatePlayerStats() --Update one last time because OnIdle is ignored if the character is dead
end

-- move
function CPlayer:move_()
   if self:getHealth() == 0 then
      return false
   end

   return true
end

function CPlayer:getRunSwimSprintMode()
   local weapon = self:getWeaponSlotItem()
   local movementRestrictedTo = weapon and weapon:getMovementRestriction()
   local aimMode = self:getState("aiming") and self.prevCamOffset ~= 3
   local runMode  = not getButton("WALK") and not aimMode and not self:getState("swimming") and self:canMove()
                    and movementRestrictedTo ~= "walk"

   local sprint = getButton("SPRINT") and not self:getState("tired") and getButton("FORWARD")
   local nonForwardButton = getButton("BACK") or getButton("LEFT") or getButton("RIGHT")
   local sprintMode = runMode and sprint
                     and not (self:getState("reloading") or self:getState("swimming") or nonForwardButton)
                     and movementRestrictedTo ~= "walk" and movementRestrictedTo ~= "run"

   local swimMode  = not aimMode and self:getState("swimming")
   local swimSprintMode = swimMode and sprint and self:canMove()
                          and self:getState("swimming") and not nonForwardButton
                          and movementRestrictedTo ~= "walk" and movementRestrictedTo ~= "run"
   return runMode, sprintMode, swimSprintMode
end

function CPlayer:getMovementParameters()
   local idleMode = true

   local runMode, sprintMode, swimSprintMode = self:getRunSwimSprintMode()

   local moveType = "walk"
   local dirType
   local speed    = self.parameters.walkSpeed
   local mvSpeed  = 0
   local stSpeed  = 0

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
   elseif self:canMove() then
      if runMode then
         moveType = "run"
         if self.super_speed then
            speed = self.parameters.runSpeed * 3
         else
            speed = self.parameters.runSpeed
         end
      end

      if getButton("BACK") then
         mvSpeed  = -speed
         dirType  = "back"
         idleMode = false
      elseif getButton("FORWARD") then
         mvSpeed  = speed
         dirType  = "front"
         idleMode = false
      end

      if getButton("LEFT") then
         stSpeed  = -speed
         dirType  = "left"
         idleMode = false
      elseif getButton("RIGHT") then
         stSpeed  = speed
         dirType  = "right"
         idleMode = false
      end
   end

   local result = {}

   result.moveType = idleMode and "idle" or moveType
   result.dirType = dirType
   result.mvSpeed = mvSpeed
   result.stSpeed = stSpeed

   return result
end

function CPlayer:move_start()
   self:updateCamera()
   local result = self:getMovementParameters()
   local moveType = result.moveType
   local dirType = result.dirType
   local mvSpeed = result.mvSpeed
   local stSpeed = result.stSpeed

   self:setMoveSpeed  (mvSpeed)
   self:setStrafeSpeed(stSpeed)
   self:animatedMoveEvent(moveType, dirType)

   self:setState("walkMode", moveType == "walk")
   self:setState("runMode", moveType == "run")
   self:setState("sprintMode", moveType == "sprint")
   self:setState("idleMode", moveType == "idle")
end

function CPlayer:move_stop()
   self:stopMove()

   self:setState("walkMode", false)
   self:setState("runMode", false)
   self:setState("sprintMode", false)
   self:setState("idleMode", true)
end

-- attack
function CPlayer:attack_()
   local currentWeapon = self:getWeaponSlotItem()
   if (not currentWeapon
        or self:getHealth() == 0
        or not self:canAttack()
        or not getButton("ATTACK") and not (getButton("AIM") and currentWeapon:isMeleeWeapon())) then
      return false
   end

   return true
end

function CPlayer:attack()
   if getButton("AIM") then
      self:animatedEvent("attackAlt")
   else
      self:animatedEvent("attack")
   end
end

-- jump
function CPlayer:jump_()
   if not getButton("JUMP") or not self:canJump() then
      return false
   end

   return true
end

function CPlayer:getJumpVelocity()
   local moveSpeed   = self:getMoveSpeed()
   local strafeSpeed = self:getStrafeSpeed()
   local maxSpeed    = moveSpeed

   if maxSpeed < strafeSpeed then
      maxSpeed = strafeSpeed
   end

   return 300 + maxSpeed * self.parameters.velocityFactor
end

function CPlayer:jump()
   local velocity = self:getJumpVelocity()

   self:setState("jumping", true)
   self:startJump    (velocity)
   self:animatedEvent("jump")
   self:move_start()
end

function CPlayer:updateCamera()
end

function CPlayer:rotateBone(boneName, angle)
   local rot = self:getBonePose(boneName):getLocalRotQuat()
   rot = quatRotateQuat(quatFromEuler({x=angle}), rot)
   self:getBonePose(boneName):setLocalRotQuat(rot)
end

function CPlayer:animatedMoveEvent(moveType, dirType)
   if not CCharacter.animatedMoveEvent(self, moveType, dirType) then
      return false
   end

   if (self:getMoveSpeed() ~= 0
      or self:getStrafeSpeed() ~= 0
      or self:getWeaponSlotItem() and self:getWeaponSlotItem():isWeapon())
      and not self:getState("talk") then
      if self:getState("swimming") then
         self:setOrientationSpeed(self.parameters.orientationSpeed / 3)
      else
         self:setOrientationSpeed(self.parameters.orientationSpeed)
      end
   else
      self:setOrientationSpeed(0)
   end

   return true
end

function CPlayer:animatedEvent(eventType)
   return CCharacter.animatedEvent(self, eventType)
end

function CPlayer:useItem(item)
end

function CPlayer:OnIdle()
   CCharacter.OnIdle(self)
   gameplayUI.hudUI:updatePlayerStats()
   gameplayUI.characterUI:updatePlayerStats()
end

return {
   CPlayer=CPlayer,
}
