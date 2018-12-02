local oo = require "loop.simple"
local CPlayer = (require "player").CPlayer
local CCharacter = (require "character").CCharacter
local hlp = require "helpers"
local tablex = require "pl.tablex"
local random = require "random"

---@class CMainCharacterBug : CPlayer
local CMainCharacterBug = oo.class({}, CPlayer)

function CMainCharacterBug:init()
   CPlayer.init(self)

   self.parameters.runSpeed  = self:getRunSpeed()
   self.parameters.walkSpeed = self:getWalkSpeed()

   self:setGuild("GLD_INSECT")

   self.weapon = hlp.safeCreateItemWithoutModel("bug_bite.wpn", "CWeapon")
   self.weapon:setDamage(20)
   self.weapon:setOffset(false)
   self.weapon:setDimensions(25, 0)
   self.weapon = self:getInventory():addItemObj(self.weapon)
   self:getInventory():equipSlotWithItem(self:getWeaponSlot(), self.weapon:getId(), true)
end

function CMainCharacterBug:loadParameters()
   CPlayer.loadParameters(self)
   self.chipMeshes = {
      idle = {
         default = { "syg_1", "syg_2", "syg_3", "syg_4", "syg_5", "syg_6", "syg_7", "syg_8", },
      },
      move = {
         front = {
            default = "forward",
         },
         back = {
            default = "back",
         },
         left = {
            default = "left",
         },
         right = {
            default = "right",
         },
      },
      diagonalMove = {
         forwardLeft  = "fl",
         forwardRight = "fr",
         backLeft   = "bl",
         backRight  = "br",
      },
      attack = {
         default = "attack",
      },
      jump = {
         default = "jump",
      },
      hit = {
         default = "get_hit",
      },
      release = {
         default = "release",
      },
      blank = {
         default = "blank",
      },
   }

   self.parameters.velocityFactor = 0.4
   self.parameters.weaponSlotId   = 0
end

function CMainCharacterBug:OnCreate()
   CPlayer.OnCreate(self)
   self:initPrefabs()

   setGlobalParam("firstTimeBug", false)

   self:subscribeOnDeath(function(self)
      if self.carryItem then
         self:dropItem()
      end
   end, self)
end

function CMainCharacterBug:getWalkSpeed()
   return 100
end

function CMainCharacterBug:getRunSpeed()
   return 200
end

function CMainCharacterBug:initPrefabs()
   self.chip = hlp.safeCreateEntity("bug_chip.sbg")
   local pose = self.chip:getPose()
   pose:setParent(self:getBonePose("item_slot0"))
   pose:resetLocalPose()
   pose:setLocalRot({x=90})
   self:resetChip()
end

-- animations
function CMainCharacterBug:animatedMoveEvent(moveType, dirType)
   local animationSet = self:getInventory():getWeaponSlotAnimationSet()
   local animations
   local jumpAnims
   local attackAnims

   if not self.animations[moveType] then
      return
   else
      if not self.animations[moveType][dirType] or not dirType then
         animations = self.animations[ moveType ][ animationSet ]
         if not animations then
            animations = self.animations[ moveType ][ "default" ]
         end
         jumpAnims   = self.animations[ moveType ]["jump"]
         attackAnims = self.animations[ moveType ]["attack"]
      else
         animations = self.animations[ moveType ][ dirType ][ animationSet ]
         if not animations then
            animations = self.animations[ moveType ][ dirType ][ "default" ]
         end
         jumpAnims   = self.animations[ moveType ][ dirType ]["jump"]
         attackAnims = self.animations[ moveType ][ dirType ]["attack"]
      end
   end

   local animation = animations

   if type(animations) == "table" then
      animation = animations[1]
   end

   if self:getState("inAir") then
      return
   end

   self.animationsManager:playCycle(animation)

   local chipAnims
   if dirType then
      chipAnims = self.chipMeshes.move[ dirType ].default
   elseif moveType == "idle" then
      self:chipStartIdle(0.5)
      return
   end
   --A try at diagonal move indication
   if getButton("FORWARD") and getButton("LEFT") then
      chipAnims = self.chipMeshes.diagonalMove.forwardLeft
   elseif getButton("FORWARD") and getButton("RIGHT") then
      chipAnims = self.chipMeshes.diagonalMove.forwardRight
   elseif getButton("BACK") and getButton("LEFT") then
      chipAnims = self.chipMeshes.diagonalMove.backLeft
   elseif getButton("BACK") and getButton("RIGHT") then
      chipAnims = self.chipMeshes.diagonalMove.backRight
   end
   self:animateChip(chipAnims)
end

function CMainCharacterBug:animatedEvent(eventType)
   if not self.ownerPlayer then return end

   CPlayer.animatedEvent(self, eventType)

   if not self.animations[eventType] then
      return
   end

   self:chipStopIdle()

   if eventType == "attack" then
      self:animateChip(self.chipMeshes.attack.default)
      self:stopMove()
      self:setState("attack", true)
      self:setState("disableAttack", true)
      self:setState("disableMove"  , true)
      self:setState("disableJump"  , true)
      self:onAttackAnimationIn()

      self.animationsManager:playAction(self.animations.attack.default)
      self.animationsManager:subscribeAnimationEnd(self.animations.attack.default, self.onAttackAnimationStop, self)
      -- jump
   elseif eventType == "jump" then
      self.animationsManager:playCycle(self.animations.jump.default)
      self:onAttackAnimationIn()
      self:animateChip(self.chipMeshes.jump.default)
      self:setState("jump", true)
      -- land
   elseif eventType == "land" then
      self:onAttackAnimationOut()
      -- hit
   elseif eventType == "hit" then
      self.animationsManager:playAction(self.animations.hit.default)
      self:animateChip(self.chipMeshes.hit.default)
      self:setState("hit", true)
      runTimer(0.5, nil, function() self:setState("hit", false) end, false)
   elseif eventType == "release" then
      self:animateChip(self.chipMeshes.release.default)
   end
end

function CMainCharacterBug:onAttackAnimationIn()
   self:OnItemActivateSafe(self.weapon)
end

function CMainCharacterBug:onAttackAnimationOut()
   self:OnItemDeactivateSafe(self.weapon)
   self:chipStartIdle(0.5)
end

function CMainCharacterBug:onAttackAnimationStop()
   self:OnItemDeactivateSafe(self.weapon)

   self:setState("attack", false)
   self:setState("disableAttack", false)
   self:setState("disableMove"  , false)
   self:setState("disableJump"  , false)
end

function CMainCharacterBug:updateCamera()
   self:setCameraHeight(50, 0)
   self:setCameraDist  (50, 0)
   self:setCameraFov   (75, 0)
end

function CMainCharacterBug:stopControlObject(killOriginal)
   if not self.ownerPlayer then return end
   self.animationsManager:stopActionsAndCycles()
   self:resetButtons()

   self:OnItemDeactivateSafe(self.weapon)
   self:dropItem()

   self.controlledOriginal:setVisible(true)
   self.controlledOriginal:setActive(true)
   self.controlledOriginal:OnFree(self.controlledOriginal:getPose())
   if killOriginal then
      self.controlledOriginal:die()
   end

   self.ownerPlayer:onStopControlObject()
end

function CMainCharacterBug:hit(damage, charAttacker)
   if self:getState("dead") then return end
   CPlayer.hit(self, damage, charAttacker)
   self:dropItem()
end

function CMainCharacterBug:dropItem()
   if self.holdingItem then
      local p = self.holdingItem:getPose()
      p:resetParent()
      local rot = p:getRot()
      p:setRot{x=0,y=rot.y,z=0}

      local pos = p:getPos()
      p:setPos{x=pos.x,y=self:getPose():getPos().y+20,z=pos.z}

      p:resetLocalPos()

      self.holdingItem.interactor:setTriggerActive(true)
      self.holdingItem:setCollisionObjects(true)
      self.holdingItem.package = false
      self.holdingItem = nil
   end
end

local function getAllowedFocusObj()
   local pick = gameplayUI:getFocusObj()
   if not pick or not pick.getScriptClass or pick:getScriptClass() ~= "CSmallRigid" then
      pick = nil
   end
   return pick
end

function CMainCharacterBug:OnControlDown(code)
   if not CPlayer.OnControlDown(self, code) then return false end

   if code == getButtonCode("ATTACK") then
   elseif code == getButtonCode("ACTIVATE") then
      if not getAllowedFocusObj() and not self.holdingItem then
         self:startRelease()
      end
   end

   return true
end

function CMainCharacterBug:OnControlUp(code)
   if not CPlayer.OnControlUp(self, code) then return false end

   if code == getButtonCode("ATTACK") then
   elseif code == getButtonCode("ACTIVATE") then
      local pick = getAllowedFocusObj()

      if self.holdingItem then
         self:dropItem()
      elseif pick then
         self:carryItem(pick)
         pick.package = true
      else
         self:stopRelease()
      end
   end

   return true
end

function CMainCharacterBug:OnLanding(landingSpeed)
   CPlayer.OnLanding(self, landingSpeed)
   if landingSpeed < -200 then -- TODO: FIXME: for some reason this function is called almost every frame with a value of ~-5
      self:OnItemDeactivateSafe(self:getWeaponSlotItem())
   end
   self:setState("jump", false)
end

function CMainCharacterBug:carryItem(smallRigid)
   if self.holdingItem then
      return
   end
   if smallRigid then
      if not smallRigid.isSpawned then
         smallRigid:activate()
         self.holdingItem = smallRigid:createSpawnedCopy()
      else
         self.holdingItem = smallRigid
      end

      self.holdingItem.interactor:setTriggerActive(false)
      self.holdingItem:setCollisionObjects(false)
      self.holdingItem:setCollisionCharacters(false, false)
      self.holdingItem:getPose():setParent(self:getBonePose("item_slot0"))
      self.holdingItem:getPose():setLocalPos({y=10})
   end
end

function CMainCharacterBug:canAnything()
   return CPlayer.canAnything(self) and not self:getState("release")
end

function CMainCharacterBug:resetChip()
   --Recursively reset chip meshes
   --TODO:FIXME: get rid of this when and if our engine stops showing all the submeshes by default
   local function hideMeshesRecursively(t)
      for _,v in pairs(t) do
         if type(v) == "table" then
            hideMeshesRecursively(v)
         else
            local mesh = self.chip:getMeshByName(v)
            if mesh then mesh:setVisible(false) end
         end
      end
   end
   hideMeshesRecursively(self.chipMeshes)

   self.currentChipMesh = self.chipMeshes.blank.default
   self:animateChip(self.currentChipMesh)
end

function CMainCharacterBug:animateChip_()
   return not self:getState("hit") and not self:getState("attack") and not self:getState("jump") and not self:getState("release")
end

function CMainCharacterBug:animateChip(anim)
   if not self:animateChip_() then return end
   if anim then
      self:chipStopIdle()
      local oldmesh = self.chip:getMeshByName(self.currentChipMesh)
      if oldmesh then oldmesh:setVisible(false) end
      local mesh = self.chip:getMeshByName(anim)
      if mesh then
         self.currentChipMesh = anim
         mesh:setVisible(true)
      end
   end
end

function CMainCharacterBug:chipStartIdle(delay)
   if not self:animateChip_() then return end
   self:chipStopIdle()
   if delay > 0.3 then
      self:animateChip(self.chipMeshes.blank.default)
   end
   self.chipTimer = runTimer(delay or 0.1, nil, function()
      self:animateChip(random.choice(self.chipMeshes.idle.default))
      self:chipStartIdle(0.1)
   end, false)
end

function CMainCharacterBug:chipStopIdle()
   if self.chipTimer then
      self.chipTimer:stop()
      self.chipTimer = nil
   end
end

function CMainCharacterBug:startRelease()
   self:animatedEvent("release")
   self:setState("release", true)
   local timeout = 1.5
   gameplayUI.interactProgressUI:setup("Release bug", timeout)
   self.interactTimer = runTimer(timeout, nil, function()
      if getButton("ACTIVATE") then
         gameplayUI.interactProgressUI:show(false)
         self:stopControlObject(false)
      end
   end, false)
end

function CMainCharacterBug:stopRelease()
   self:setState("release", false)
   if self.interactTimer then
      self.interactTimer:stop()
      self.interactTimer = nil
   end
   gameplayUI.interactProgressUI:show(false)
end

function CMainCharacterBug:addExp(value, silent)
   getMC():addExp(value, silent)
end

function CMainCharacterBug:die()
   --Use CCharacter cause that's not a real player death
   CCharacter.die(self)
   --delay destruction, cause otherwise we'd be destroying a character right in the middle of his 'OnHit > die > senseScheduler:OnHit' sequence
   runTimer(0, nil, function()
      self:stopControlObject(true)
   end, false)
end


function CMainCharacterBug:OnDestroy()
   self:chipStopIdle()
   getScene():destroyEntity(self.chip)
   self.chip = nil
   CPlayer.OnDestroy(self)
end

return {CMainCharacterBug=CMainCharacterBug}
