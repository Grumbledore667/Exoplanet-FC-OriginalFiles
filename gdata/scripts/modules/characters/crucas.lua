local oo = require "loop.simple"

local CCharacter = (require "character").CCharacter

local stringx = require "pl.stringx"
local random = require "random"
local f = require "fun"
local partial = f.partial

local hlp = require "helpers"

local ai = require "ai"
local coro = require "coroutines.helpers"

---@class CCrucas : CCharacter
local CCrucas = oo.class({}, CCharacter)
local CCrucasEating = oo.class({}, CCrucas)
---@class CCrucasWeak : CCrucas
local CCrucasWeak = oo.class({}, CCrucas)

local IDLE_ANIMATIONS = {"idle_2", "idle_3"}

function CCrucasWeak:getDefaultParameters()
   local parameters = CCrucas.getDefaultParameters(self)
   parameters.healthMax = 100
   return parameters
end

function CCrucasWeak:getLabel()
   return "Juvenile Crucass"
end

function CCrucasWeak:addWeapon()
   CCrucas.addWeapon(self)
   self.weapon:setDamage(6)
end

function CCrucas:addWeapon()
   if not self.weapon then
      self.weapon = hlp.safeCreateItemWithoutModel("crucass_bite.wpn", "CWeapon")
      self.weapon:setOffset(false)
      self.weapon:setDimensions(28, 0)
      self.weapon = self:getInventory():addItemObj(self.weapon)
      self:getInventory():equipSlotWithItem(self:getWeaponSlot(), self.weapon:getId(), true)
      self.weapon:setDamage(20)
   end
end

function CCrucas:initSenses()
   self.senseScheduler:addSense("inZone"     , false, self.senseScheduler, self.senseScheduler.checkZone)
   self.senseScheduler:addSense("enemyDetect", false, self.senseScheduler, self.senseScheduler.checkDetect)
   self.senseScheduler:addSense("enemyClose" , false, self.senseScheduler, self.senseScheduler.checkClose)
   self.senseScheduler:addSense("enemyFront" , false, self.senseScheduler, self.senseScheduler.checkFront)
   self.senseScheduler:addSense("enemyWarn"  , false, self.senseScheduler, self.senseScheduler.checkWarn)
   self.senseScheduler:addSense("seesCorpses", false, self.senseScheduler, self.senseScheduler.seesCorpses)
end

function CCrucas:OnCreate(params)
   CCharacter.OnCreate(self, params)

   self:initSenses()

   self:initFX()

   self:setGuild("GLD_ANIMAL")

   self:createTree("ai.trees.crucas")
end

function CCrucas:initFX()
   if not self.fx then
      self.fx = {}
      self.fx.blood = self:createAspect("abori_damage.sps")
      self.fx.blood:setLoop(false)
      self.fx.blood:getPose():setParent(self:getBonePose("item_slot1"))
      self.fx.blood:getPose():resetLocalPos()
      self.fx.blood:disable()
   end
end

function CCrucas:getDefaultParameters()
   local parameters = CCharacter.getDefaultParameters(self)
   parameters.maxLandingSpeed  = 750
   parameters.weaponSlotId     = 1
   parameters.zoneSize         = 1000

   parameters.feelRadiusCutoff = 2000

   parameters.viewDist         = 1000
   parameters.viewAngle        = 180
   parameters.backViewDist     = 400
   parameters.warnDist         = 600

   parameters.attackDist       = 250
   parameters.attackAngle      = 100

   parameters.healthMax        = 200

   return parameters
end

function CCrucas:loadDynamicParameters(params)
   CCharacter.loadDynamicParameters(self, params)
   self.parameters.zoneSize = params.zoneSize
   self.parameters.feelRadiusCutoff = params.feelRadiusCutoff
   self.lootItems = params.lootItems
end

function CCrucas:loadParameters()
   CCharacter.loadParameters(self)

   self.senseScheduler:setFeelRadius(loadParamNumber(self, "feelRadiusCutoff"))

   self.headLookingLimits = {x=10, y=45, z=0}

   self.lootItems = self.lootItems or loadParamItemCounts(self, "lootItems", {})
   if loadParam(self, "defaultLoot", true) then
      self.lootItems["meat.itm"] = 1
   end

   for name, count in pairs(self.lootItems) do
      self:getInventory():addItem(name, count)
   end

   self:addWeapon()
end

function CCrucas:setupTimers(freq)
   self:stopTimers()

   self.senseScheduler.timer = runTimer(freq, self.senseScheduler, self.senseScheduler.OnIdle, true)
   self.behaviorTreeTimer    = runTimer(freq, self, ai.utils.ticker, true)
end

function CCrucas:stopTimers()
   CCharacter.stopTimers(self)

   if self.behaviorTreeTimer then
      self.behaviorTreeTimer:stop()
      self.behaviorTreeTimer = nil
   end
end

function CCrucas:animatedEvent(eventType)
   CCharacter.animatedEvent(self, eventType)

   if self:getHealth() == 0 and eventType ~= "die" then
      return
   end

   if eventType == "hit" then
      self:setState("damage", true)
   end
end

function CCrucas:warn_start()
   self:setThreatFlag(false)
   self.animationsManager:playCycle(self.animations.idle.default[1])
   self.animationsManager:playAction(self.animations.threat.default)
end

function CCrucas:warn_stop()
end

function CCrucas:setThreatFlag(value)
   self.canUseThreat = value
end

function CCrucas:walk_start()
   self:setThreatFlag(true)
   self:setOrientationSpeed(500)
   self:setMoveSpeed(200)
   self.animationsManager:playCycle(self.animations.walk.front.default)

   if not self.senseScheduler:getSense("inZone") then
      self:setOrientation(getTargetAngleDir(self, self.senseScheduler:getCurZone()))
   else
      self:setOrientation(random.normal(-180, 180))
   end
   self.timer = runTimer(random.normal(1, 5), nil,nil,false)
end

function CCrucas:walk_running()
   return self.timer:getTimeLeft() > 0
end

function CCrucas:walk_stop()
   self:stopLastLoopedSound()
   self:stopMove()
end

function CCrucas:idle_running()
   self:setThreatFlag(true)
   self:stopMove()
   self.animationsManager:playCycle(self.animations.idle.default[1])
   coro.wait(random.normal(3))
end

function CCrucas:idle_finish()
   local sound = self:getBBVar("idle_sound")
   if hlp.isOperable(sound) then
      sound:stop()
   end
end

function CCrucas:eat_dead_start()
   self:setThreatFlag(true)
   self.animationsManager:playCycle(self.animations.eat.default)
end

function CCrucas:shortIdle_running()
   self:setThreatFlag(true)
   self:stopMove()
   self.animationsManager:playCycle(self.animations.idle.default[1])
   local animation = random.choice(self.animations.idle.default)
   self.animationsManager:playAction(animation)
   coro.waitAnimationEnd(self, animation)
end

function CCrucas:shortIdle_finish()
end

-- -- ----------------------------- CHASE ----------------------------------------------------
function CCrucas:chase_start()
   self:setThreatFlag(false)
   self:setOrientationSpeed(400)
   self:setMoveSpeed       (400)
   self.animationsManager:playCycle(self.animations.run.front.default)
   self:setTarget(self.senseScheduler:getCurEnemy(), {y=100})
end

function CCrucas:chaseSwim_start()
   self:setThreatFlag(false)
   self:setOrientationSpeed(400/3)
   self:setMoveSpeed       (400/3)
   self.animationsManager:playCycle(self.animations.walk.front.default)
   self:setTarget(self.senseScheduler:getCurEnemy(), {y=100})
end

function CCrucas:chase_stop()
   self:stopMove()
   self:resetTarget()
   self:stopLastLoopedSound()
end

function CCrucas:chase_dead_start()
   self:setThreatFlag(false)
   self:setOrientationSpeed(400)
   self:setMoveSpeed       (400)
   self.animationsManager:playCycle(self.animations.run.front.default)
   self:setTarget(self:getBBVar("corpse"), {y=100})
end

function CCrucas:chase_dead_stop()
   self:stopMove()
   self:resetTarget()
   self:stopLastLoopedSound()
end

function CCrucas:face_enemy_start()
   -- the manual setOrientation instead of setTarget is deliberate, just to test
   -- an alternative approach. TODO:FIXME: should probably replace with setTarget
   self:setOrientationSpeed(100)
   self:setOrientation(getTargetAngleDir(self, self.senseScheduler:getCurEnemy():getPose():getPos()))
   local targetAngle = getTargetAngleFlat(self, self.senseScheduler:getCurEnemy():getPose():getPos())
   if targetAngle < 0 then
      self.animationsManager:playCycle(self.animations.turn.right.step)
   else
      self.animationsManager:playCycle(self.animations.turn.left.step)
   end
end

function CCrucas:face_enemy_running()
   local enemy = self.senseScheduler:getCurEnemy()
   if enemy then
      local enemyPos = enemy:getPose():getPos()
      self:setOrientation(getTargetAngleDir(self, enemyPos))

      local targetAngle = getTargetAngleFlat(self, enemyPos)
      if targetAngle < 0 then
         self.animationsManager:playCycle(self.animations.turn.left.step)
      else
         self.animationsManager:playCycle(self.animations.turn.right.step)
      end
      if math.abs(targetAngle) > 10 then
         return true
      end
   end
   return false
end

function CCrucas:face_enemy_stop()
   self:setOrientationSpeed(0)
   self.animationsManager:playCycle(self.animations.idle.default[1])
end

-- -- ----------------------------- ATTACK ----------------------------------------------------
function CCrucas:attack_start()
   self:setThreatFlag(false)
   self:stopMove()
   self:setOrientationSpeed(200)
   self:setOrientation(getTargetAngleDir(self, self.senseScheduler:getCurEnemy():getPose():getPos()))

   local attackAnim = random.choice(self.animations.idle.attack.default)
   self.animationsManager:playAction(attackAnim)
   self.animationsManager:subscribeAnimationEventIn(attackAnim, "attack", self.onAttackAnimationIn, self)
   self.animationsManager:subscribeAnimationEventOut(attackAnim, "attack", self.attack_stop, self)
end

function CCrucas:onAttackAnimationIn()
   self:OnItemActivateSafe(self.weapon)
end

function CCrucas:attack_stop()
   self:OnItemDeactivateSafe(self.weapon)
end

function CCrucas:damaged_start()
   self:setThreatFlag(false)
   self.animationsManager:playCycle(self.animations.idle.default[1])
   self.animationsManager:playAction(self.animations.hurt.default, false)
   self.fx.blood:play()
end

function CCrucas:damaged_stop()
   self:setState("damage", false)
end

function CCrucas:die__()
   CCharacter.die__(self)

   self:playDeathAnimation(self.animations.death.default)
end

function CCrucas:die()
   CCharacter.die(self)

   self.fx.blood:play()

   self:getInventory():destroyItem(self.weapon, -1, true, true)

   if self:getInventory():getItemsCount() ~= 0 then
      self.interactor:setRaycastActive(true)
   end
end

function CCrucas:OnInventoryChange(event)
   if self:getInventory():getItemsCount() == 0 then
      self:showGibs()
   end
end

CCrucas.showGibs = hlp.showGibs

function CCrucas:getLabel()
   return "Crucass"
end

function CCrucas:getInteractLabel()
   if self:getState("dead") then
      return "loot"
   end
end

function CCrucas:OnSaveState(state)
   CCharacter.OnSaveState(self, state)

   state.gibsVisible = self.gibs ~= nil
   -- dynamic object spawned by installer
   if self.installer then
      state.pos = self:getSafePos()
      state.orientationGlobal = self:getOrientationGlobal()
   end
end

function CCrucas:OnLoadState(state)
   if self.installer then
      if state.pos then
         self:getPose():setPos(state.pos)
      end

      if state.orientationGlobal then
         self:setOrientationGlobal(state.orientationGlobal)
      end
   end

   CCharacter.OnLoadState(self, state)

   self.weapon = nil
   if not state.dead then
      self:addWeapon()
   end

   if state.gibsVisible then
      self:showGibs()
   end
end

return {
   CCrucas=CCrucas,
   CCrucasWeak=CCrucasWeak,
   CCrucasEating=CCrucasEating,
}
