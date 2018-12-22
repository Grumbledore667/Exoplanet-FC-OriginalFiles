local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CActionsScheduler = (require "actionsScheduler").CActionsScheduler
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local random = require "random"

local hlp = require "helpers"

local CShark = oo.class({}, CCharacter)

function CShark:loadParameters()
   --log("CShark:loadParameters()")

   self.senseScheduler:setFeelRadius(loadParamNumber(self, "viewRange", 1000))

   self.parameters.zoneSize        = loadParamNumber(self, "walkRange", 1000)
   self.parameters.maxLandingSpeed = 2800
   self.parameters.viewAngle       = 360
   self.parameters.viewDist        = self:getFeelRadius()
   self.parameters.backViewDist    = self:getFeelRadius()
   self.parameters.attackDist      = 1200

   self:setMaxHealthCount(1000)
   self:setHealthCount   (1000)
   self:setMassCoeff     (2)

   self:initEffects()
   self:initSounds ()

   self.weapon = hlp.safeCreateItemWithoutModel("shark_bite.wpn", "CWeapon")
   self.weapon:setDamage(20)
   self.weapon:setOffset(false)
   self.weapon:setDimensions(25, 0)
   self.weapon = self.itemsManager:addItemObj(self.weapon)
   self.itemsManager:equipSlotWithItem(self:getWeaponSlot(), self.weapon.id)
end

function CShark:initEffects()
   self.fx = {}

   self.fx.sandFlow = self:createAspect("sand_flow.sps")
   self.fx.sandFlow:getPose():setParent(self:getPose())
   self.fx.sandFlow:getPose():resetLocalPose()
   self.fx.sandFlow:getPose():setLocalPos({z=-150})
   self.fx.sandFlow:setLoop(true)
   self.fx.sandFlow:disable()

   self.fx.sandBlastJump = self:createAspect("sand_blast.sps")
   self.fx.sandBlastJump:getPose():setParent(self:getBonePose("item_slot3"))
   self.fx.sandBlastJump:getPose():resetLocalPos()
   self.fx.sandBlastJump:setLoop(false)
   self.fx.sandBlastJump:disable()

   self.fx.sandBlastOut = self:createAspect("sand_blast.sps")
   self.fx.sandBlastOut:setLoop(false)
   self.fx.sandBlastOut:disable()

   self.fx.sandBlastIn = self:createAspect("sand_blast.sps")
   self.fx.sandBlastIn:setLoop(false)
   self.fx.sandBlastIn:disable()
end

function CShark:initSounds()
   self.sounds = {}

   self.sounds.move = self:createAspect("shark_move.wav")
   self.sounds.move:getPose():setParent(self:getPose())
   self.sounds.move:getPose():resetLocalPose()
   self.sounds.move:setLoop    (true)
   self.sounds.move:setDistance(5000)
   self.sounds.move:setVolume  (1)

   self.sounds.surfOut = self:createAspect("shark_surf_out.wav")
   self.sounds.surfOut:getPose():setParent(self:getPose())
   self.sounds.surfOut:getPose():resetLocalPose()
   self.sounds.surfOut:setLoop    (false)
   self.sounds.surfOut:setDistance(5000)
   self.sounds.surfOut:setVolume  (1)

   self.sounds.surfIn = self:createAspect("shark_surf_in.wav")
   self.sounds.surfIn:getPose():setParent(self:getPose())
   self.sounds.surfIn:getPose():resetLocalPose()
   self.sounds.surfIn:setLoop    (false)
   self.sounds.surfIn:setDistance(5000)
   self.sounds.surfIn:setVolume  (1)

   self.sounds.attack = self:createAspect("shark_wisp.wav")
   self.sounds.attack:getPose():setParent(self:getPose())
   self.sounds.attack:getPose():resetLocalPose()
   self.sounds.attack:setLoop    (false)
   self.sounds.attack:setDistance(5000)
   self.sounds.attack:setVolume  (2)
end

function CShark:initSenses()
   log("CShark:initSenses()")

   self.senseScheduler:addSense("inZone"     , false, self.senseScheduler, self.senseScheduler.checkZone)
   self.senseScheduler:addSense("enemyDetect", false, self.senseScheduler, self.senseScheduler.checkDetectAtZone)
   self.senseScheduler:addSense("enemyClose" , false, self.senseScheduler, self.senseScheduler.checkCloseAtZone)

   self.senseScheduler:addSense("enemyFar", false, self, self.checkEnemyFar)
end

function CShark:checkEnemyFar()
   local obj = self.senseScheduler:getCurEnemy()
   if not obj then
      return false
   end

   return not objInDist(self:getPose():getPos(), obj:getPose():getPos(), self.parameters.attackDist * 1.5)
end

function CShark:checkEnemyTooClose()
   local obj = self.senseScheduler:getCurEnemy()
   if not obj then
      return false
   end

   return objInDist(self:getPose():getPos(), obj:getPose():getPos(), self.parameters.attackDist * 0.8)
end

function CShark:OnCreate()
   CCharacter.OnCreate(self)
   log("CShark:OnCreate()")

   CShark.loadParameters(self)
   CShark.initSenses    (self)

   self:setGuild   ("GLD_SHARK")
   self:addActions()
   self.animationsManager:stopAnimation("death")

   self:idle_run()
end

-- Actions

function CShark:addActions()
   local idle = CAction{}
   idle:allowRestartOnEvent("setSense")
   idle:allowRestartOnEvent("onChangeState")
   idle.start = self.idle_start
   idle.stop  = self.idle_stop
   idle.name = "idle"

   local move = CAction{}
   idle:allowRestartOnEvent("setSense")
   move.start = self.move_start
   move.stop  = self.move_stop
   move.name = "move"

   local chase = CAction{}
   chase:allowRestartOnEvent("onChangeState")
   chase.start = self.chase_start
   chase.stop  = self.chase_stop
   chase.name = "chase"

   local aiming = CAction{}
   aiming:allowRestartOnEvent("onChangeState")
   aiming.start = self.aiming_start
   aiming.stop  = self.aiming_stop
   aiming.name = "aiming"

   local attack = CAction{}
   attack:allowRestartOnEvent("onChangeState")
   attack.start = self.attack_start
   attack.stop  = self.attack_stop
   attack.name = "attack"

   local damage = CAction{}
   damage:allowRestartOnEvent("onChangeState")
   damage.start = self.damage_start
   damage.stop  = self.damage_stop
   damage.name = "damage"

   local root = CNode{}
   root:yes (self.alive_):yes (self.damage_):no  (self.aiming_):no  (self.attack_):no  (self.chase_):no (self.move_):no  (idle)
   root:yes (self.alive_):yes (self.damage_):no  (self.aiming_):no  (self.attack_):no  (self.chase_):no (self.move_):yes (move)
   root:yes (self.alive_):yes (self.damage_):no  (self.aiming_):no  (self.attack_):no  (self.chase_):yes(chase)
   root:yes (self.alive_):yes (self.damage_):no  (self.aiming_):no  (self.attack_):yes (attack)
   root:yes (self.alive_):yes (self.damage_):no  (self.aiming_):yes (aiming)
   root:yes (self.alive_):yes (self.damage_):yes (damage)

   self.actionsScheduler.root = root
end


-- Predicates

function CShark:alive_()
   return not self:getState("dead")
end

-- Callbacks
-- ----------------------------- IDLE ----------------------------------------------------
function CShark:idle_run()
   if self:getState("chase") then
      return
   end

   self:setState("idle", true)
   self:setState("move", false)
end

function CShark:idle_start()
   self.animationsManager:loopAnimation("dive")

   if not self.senseScheduler:getSense("inZone") then
      self:setOrientation(getTargetAngleDir(self, self.senseScheduler:getCurZone()))
   else
      self:setOrientationFull(random.random() * 360)
      runTimer(3 + random.random() * 3, self, self.move_run, false)
   end
end

function CShark:idle_stop()
   self:setState("idle", false)
end

-- ----------------------------- MOVE ----------------------------------------------------
function CShark:move_()
   if self:getState("move") and not self:getState("blockAttack") and self.senseScheduler:getSense("enemyDetect") and self.senseScheduler:getCurEnemy() then
      --log("ce: " .. self.senseScheduler:getCurEnemy():getName())
      return true
   end
   --log("ce: no")
   return false
end

function CShark:move_run()
   if self:getState("chase") or self:getState("blockAttack") then
      return
   end

   self:setState("move", true)
   self:setState("idle", false)
end

function CShark:move_start()
   self:setOrientationSpeed(80)
   self:setMoveSpeed       (250)

   self.animationsManager:loopAnimation("swim_fwd")

   self.fx.sandFlow:play()
   self.sounds.move:play()
   self.sounds.move:setSpeed(1)

   if not self.senseScheduler:getSense("inZone") then
      self:setOrientation(getTargetAngleDir(self, self.senseScheduler:getCurZone()))
   else
      self:setOrientationFull(random.random() * 360)
      runTimer(3 + random.random() * 3, self, self.idle_run, false)
   end
end

function CShark:move_stop()
   --self:setMoveSpeed(0)
   --self:setOrientationSpeed(0)

   self.fx.sandFlow:stop()
   self.sounds.move:stop()

   self:setState("move" , false)
end

-- ----------------------------- CHASE ----------------------------------------------------
function CShark:chase_()
   if self:getState("blockAttack") then
      return false
   end

   if self.senseScheduler:getSense("enemyDetect") and self.senseScheduler:getCurEnemy() then
      if self:checkEnemyTooClose() then
         self:setState("aiming", true)
         return false
      else
         self:setState("chase", true)
         return true
      end
   end

   return false
end

function CShark:chase_start()
   self.animationsManager:loopAnimation("fast_fwd")

   self.fx.sandFlow:play()
   self.sounds.move:play()
   self.sounds.move:setSpeed(2)

   self:setMoveSpeed       (800)
   self:setOrientationSpeed(400)
   self:setTarget          (self.senseScheduler:getCurEnemy(), {y=100})
end

function CShark:chase_stop()
   self:setMoveSpeed       (0)
   self:setOrientationSpeed(0)
   self:resetTarget        ()

   self.fx.sandFlow:stop()
   self.sounds.move:stop()

   self:setState("chase", false)
end

-- ----------------------------- AIMING ----------------------------------------------------
function CShark:aiming_()
   if self:getState("aiming") and self.senseScheduler:getCurEnemy() and not self:getState("inAir") then
      if self.senseScheduler:getSense("enemyFar") then
         self:setState("aiming", false)
         return false
      end
      return true
   end

   return false
end

function CShark:aiming_start()
   self:setMoveSpeed(800)
   self.animationsManager:loopAnimation("fast_fwd")

   self.fx.sandFlow:play()
   self.sounds.move:play()
   self.sounds.move:setSpeed(2)

   self:setOrientationSpeed(400)

   if not self.senseScheduler:getSense("inZone") then
      self:setOrientation(getTargetAngleDir(self, self.senseScheduler:getCurZone()))
   else
      self:setOrientation(getTargetAngleDir(self, self.senseScheduler:getCurEnemy():getPose():getPos())+180)
   end

   self:setState("aiming", true)
end

function CShark:aiming_stop()
   self.fx.sandFlow:stop()
   self.sounds.move:stop()

   self:setState("aiming", false)
end

-- ----------------------------- ATTACK ----------------------------------------------------
function CShark:attack_()
   if self:getState("blockAttack") then
      return false
   end

   if self.senseScheduler:getSense("enemyClose") then
      if self:checkEnemyTooClose() then
         self:setState("aiming", true)
         return false
      else
         self:setState("attack", true)
         return true
      end
   end

   return false
end

function CShark:attack_start()
   if not self.senseScheduler:getCurEnemy() then
      return
   end

   self:setOrientationSpeed(200)
   self:setOrientation     (getTargetAngleDir(self, self.senseScheduler:getCurEnemy():getPose():getPos()))
   --self:startJump          (900)

   local pushPos = self.senseScheduler:getCurEnemy():getPose():getPos()
   local selfPos = self:getPose():getPos()
   pushPos.x = (pushPos.x - selfPos.x)
   pushPos.y = (pushPos.y - selfPos.y) + 2500
   pushPos.z = (pushPos.z - selfPos.z)
   self:push(pushPos, 26000, 3.0)

   --self:setMoveSpeed       (700)

   self.animationsManager:loopAnimation        ("dive")
   self.animationsManager:playAnimation        ("jump", false)
   self.animationsManager:subscribeAnimationEnd("jump", self.attackAnimStop, self)
   --self.animationsManager:subscribeAnimationEventOut("jump", "attack", self.attackAnimStop, self)
   self:setState("inAir", true)

   self.fx.sandBlastJump:play()

   local pos = self:getPose():getPos()
   self.fx.sandBlastOut:getPose():setPos({x=pos.x, y=pos.y-300, z=pos.z})
   self.fx.sandBlastOut:play()
   self.sounds.surfOut:play()

   runTimer(0.2, self, function (self)
      self.sounds.attack:play()
   end, false)

   runTimer(1.3, self, function (self)
      local pos = self:getPose():getPos()
      self.fx.sandBlastIn:getPose():setPos({x=pos.x, y=pos.y-400, z=pos.z})
      self.fx.sandBlastIn:play()
      self.sounds.surfIn:play()
   end, false)

   self.weapon:OnActivate()
end

function CShark:attack_stop()
   self:setMoveSpeed       (0)
   self:setOrientationSpeed(0)

   self:setState("aiming", true)
end

function CShark:attackAnimStop()
   self:setState("attack", false)
   self:setState("blockAttack", true)

   self.weapon:OnDeactivate()

   runTimer(random.random() * 2, self, self.coolDown, false)
end

function CShark:coolDown()
   self:setState("blockAttack", false)
end

-- ----------------------------- DAMAGE ----------------------------------------------------
function CShark:damage_()
   return self:getState("damage")
end

function CShark:damage_start()
   local animation = "swim_left"

   if random.random() * 2 > 1 then
      animation = "swim_right"
   end

   self.animationsManager:playAnimation        (animation, false)
   self.animationsManager:subscribeAnimationEnd(animation, self.damage_stop, self)
   if self.senseScheduler:getCurEnemy() ~= nil then
      local pushPos = self.senseScheduler:getCurEnemy():getPose():getPos()
      local selfPos = self:getPose():getPos()
      pushPos.x = -(pushPos.x - selfPos.x)
      pushPos.y =  (pushPos.y - selfPos.y) + 180
      pushPos.z = -(pushPos.z - selfPos.z)
      self:push(pushPos, 3000, 0.5)
   end
end

function CShark:damage_stop()
   self:setState("damage", false)
end

-- ----------------------------- ANIM EVENTS ----------------------------------------------------
function CShark:animatedEvent(eventType)
   if not CCharacter.animatedEvent(self, eventType) then
      return false
   end

   if self:getHealth() == 0 and eventType ~= "die" then
      return false
   end

   --log("animatedEvent = " .. eventType)

   if eventType == "hit" then
      self:setState("damage", true)
   end

   if eventType == "die" then
      self:stopMove()
      self.animationsManager:stopAnimations()
      self.animationsManager:playAnimationWithLock("death")

      if self.senseScheduler:getLastEnemy() ~= nil then
         log("die enemy = " .. tostring(self.senseScheduler:getLastEnemy()))
         local pushPos = self.senseScheduler:getLastEnemy():getPose():getPos()
         local selfPos = self:getPose():getPos()
         pushPos.x = -(pushPos.x - selfPos.x)
         pushPos.y =  (pushPos.y - selfPos.y) + 180
         pushPos.z = -(pushPos.z - selfPos.z)
         self:push(pushPos, 3000, 0.5)
      end
   end

   --[[if (eventType == "land" and not self.fx.sandBlastIn:isActive() and self:getState("inAir")) then
      self.fx.sandBlastIn:getPose():setPos(self:getPose():getPos())
      self.fx.sandBlastIn:play()
   end]]

   return true
end

function CShark:OnLanding(landingSpeed)
   CCharacter.OnLanding(self, landingSpeed)
end

function CShark:OnEnemyHit(params)
   local char = params.target
   local pushPos = self:getPose():getPos()
   local selfPos = char:getPose():getPos()
   pushPos.x = -(pushPos.x - selfPos.x)
   pushPos.y =  (pushPos.y - selfPos.y) + 180
   pushPos.z = -(pushPos.z - selfPos.z)
   char:push(pushPos, 15000, 1.0)
end

function CShark:hit(damage, charAttacker)
end

return {CShark=CShark}
