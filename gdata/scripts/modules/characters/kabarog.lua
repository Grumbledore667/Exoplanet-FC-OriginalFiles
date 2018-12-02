local oo = require "loop.simple"

local CCharacter = (require "character").CCharacter
local hlp = require "helpers"
local coro = require "coroutines.helpers"

local f = require "fun"
local partial = f.partial
local random = require "random"

local ai = require "ai"

---@class CKabarog : CCharacter
local CKabarog = oo.class({}, CCharacter)

---@class CKabarogWeak : CKabarog
local CKabarogWeak = oo.class({}, CKabarog)

function CKabarogWeak:getDefaultParameters()
   local parameters = CKabarog.getDefaultParameters(self)
   parameters.healthMax = 250
   return parameters
end

function CKabarogWeak:getLabel()
   return "Juvenile Hornhog"
end

function CKabarogWeak:addWeapon()
   CKabarog.addWeapon(self)
   self.weapon:setDamage(10)
end

function CKabarog:OnCreate(params)
   CCharacter.OnCreate(self, params)

   self:initSenses()
   self:initFX()

   self:setGuild("GLD_ANIMAL")

   self:createTree("ai.trees.kabarog")
   self.shouldPlayHurtGenerator = random.shuffledSequenceGenerator{true, false, false, false, false}
end

function CKabarog:getDefaultParameters()
   local parameters = CCharacter.getDefaultParameters(self)
   parameters.maxLandingSpeed  = 750
   parameters.weaponSlotId     = 1
   parameters.zoneSize         = 1000

   parameters.feelRadiusCutoff = 2000

   parameters.viewDist         = 1250
   parameters.viewAngle        = 180
   parameters.backViewDist     = 500
   parameters.attackDist       = 250
   parameters.attackAngle      = 100

   parameters.healthMax        = 500

   return parameters
end

function CKabarog:loadDynamicParameters(params)
   CCharacter.loadDynamicParameters(self, params)
   self.parameters.zoneSize = params.zoneSize
   self.parameters.feelRadiusCutoff = params.feelRadiusCutoff
   self.lootItems = params.lootItems
end

function CKabarog:loadParameters()
   CCharacter.loadParameters(self)

   self.senseScheduler:setFeelRadius(loadParamNumber(self, "feelRadiusCutoff"))

   self.headLookingLimits = {x=10, y=30, z=0}

   self.lootItems = self.lootItems or loadParamItemCounts(self, "lootItems", {})
   if loadParam(self, "defaultLoot", true) then
      self.lootItems["meat.itm"] = 1
      self.lootItems["horn.itm"] = 1
   end

   for name, count in pairs(self.lootItems) do
      self:getInventory():addItem(name, count)
   end

   self:addWeapon()
end

function CKabarog:initFX()
   if not self.fx then
      self.fx = {}
      self.fx.blood1 = self:createAspect("kab_blood1.sps")
      self.fx.blood1:setLoop(false)
      self.fx.blood1:getPose():setParent(self:getBonePose("item_slot1"))
      self.fx.blood1:getPose():resetLocalPos()
      self.fx.blood1:disable()

      self.fx.blood2 = self:createAspect("kab_blood2.sps")
      self.fx.blood2:setLoop(false)
      self.fx.blood2:getPose():setParent(self:getBonePose("item_slot1"))
      self.fx.blood2:getPose():resetLocalPos()
      self.fx.blood2:disable()

      self.fx.blood_death = self:createAspect("kab_blood_death.sps")
      self.fx.blood_death:setLoop(false)
      self.fx.blood_death:getPose():setParent(self:getBonePose("item_slot1"))
      self.fx.blood_death:getPose():resetLocalPos()
      self.fx.blood_death:disable()
   end
end

function CKabarog:addWeapon()
   if not self.weapon then
      self.weapon = hlp.safeCreateItemWithoutModel("kabarog_bite.wpn", "CWeapon")
      self.weapon:setOffset(false)
      self.weapon:setDimensions(35, 0)
      self.weapon = self:getInventory():addItemObj(self.weapon)
      self:getInventory():equipSlotWithItem(self:getWeaponSlot(), self.weapon:getId(), true)
      self.weapon:setDamage(20)
   end
end

function CKabarog:initSenses()
   self.senseScheduler:addSense("inZone"     , false, self.senseScheduler, self.senseScheduler.checkZone)
   self.senseScheduler:addSense("enemyDetect", false, self.senseScheduler, self.senseScheduler.checkDetect)
   self.senseScheduler:addSense("enemyClose" , false, self.senseScheduler, self.senseScheduler.checkClose)
   self.senseScheduler:addSense("enemyFront" , false, self.senseScheduler, self.senseScheduler.checkFront)
end

function CKabarog:setupTimers(freq)
   self:stopTimers()

   self.senseScheduler.timer = runTimer(freq, self.senseScheduler, self.senseScheduler.OnIdle, true)
   self.behaviorTreeTimer    = runTimer(freq, self, ai.utils.ticker, true)
end

function CKabarog:stopTimers()
   CCharacter.stopTimers(self)

   if self.behaviorTreeTimer then
      self.behaviorTreeTimer:stop()
      self.behaviorTreeTimer = nil
   end
end

function CKabarog:OnEnemyHit(params)
   CCharacter.OnEnemyHit(self, params)
   params.target:pushFrom(self:getPose():getPos(), 10000, 0.5, {y=180})
end

function CKabarog:animatedEvent(eventType)
   CCharacter.animatedEvent(self, eventType)

   if self:getHealth() == 0 and eventType ~= "die" then
      return
   end

   if eventType == "hit" then
      self.fx.blood1:play()
      self:setState("damage", true)
   end
end

function CKabarog:shouldPlayHurt_condition()
   return self.shouldPlayHurtGenerator()
end

function CKabarog:damaged_running()
   local anim = "hurt"
   self.animationsManager:playAction(anim, nil, nil, false, 2)
   coro.waitAnimationEnd(self, anim)
end

function CKabarog:damaged_finish()
end

local chaseSpeed = 1.5
function CKabarog:chase_start()
   local enemy = self.senseScheduler:getCurEnemy()
   self:setOrientationSpeed(200)
   self:setMoveSpeed(400 * chaseSpeed)
   self:setAnimSpeed(chaseSpeed)
   self.animationsManager:playCycle("run")
   self:setTarget(enemy, {y=100})
end

function CKabarog:chase_finish()
   self:OnItemDeactivateSafe(self.weapon)
   self:setMoveSpeed(0)
   self:setOrientationSpeed(0)
   self:setStrafeSpeed(0)
   self:setAnimSpeed(1)
   self:resetTarget()
end

function CKabarog:playIdle_start()
   local enemy = self.senseScheduler:getCurEnemy()
   self:setOrientationSpeed(100)
   self:setTarget(enemy)
   self.animationsManager:playCycle("idle")
end

function CKabarog:attack_running()
   local enemy = self.senseScheduler:getCurEnemy()
   self:setOrientationSpeed(250)
   self:setOrientation(getTargetAngleDir(self, enemy:getPose():getPos()))
   local anims = {
      "attack",
      "attack_2",
   }
   local anim = random.choice(anims)
   self.animationsManager:playCycle("idle")
   coro.wait(0.1)
   self.animationsManager:playAction(anim)
   coro.wait(0.1)
   local angle = getTargetAngleDir(self, enemy:getPose():getPos())
   if math.abs(angle) <= 15 then
      self:push(self:getDir(), 5000, 1)
   end
   coro.waitAnimationEventIn(self, anim, "attack")
   self:OnItemActivateSafe(self.weapon)
   coro.waitAnimationEventOut(self, anim, "attack")
   self:OnItemDeactivateSafe(self.weapon)
   coro.waitAnimationEnd(self, anim)
end

function CKabarog:attack_finish()
   self:OnItemDeactivateSafe(self.weapon)
   self:setMoveSpeed(0)
   self:setOrientationSpeed(0)
   self:setStrafeSpeed(0)
end

function CKabarog:idle_running()
   self.animationsManager:playCycle("idle")
   coro.wait(random.random(1, 3))
end

function CKabarog:longIdle_running()
   self.animationsManager:playCycle("idle")
   self.animationsManager:playAction("idle_2")
   coro.waitAnimationEnd(self, "idle_2")
end

function CKabarog:longIdle_finish()
   self.animationsManager:stopAction("idle_2")
end

function CKabarog:walk_start()
   self:setMoveSpeed(175)
   self:setOrientationSpeed(100)

   self.animationsManager:playCycle("walk")

   if not self.senseScheduler:getSense("inZone") then
      self:setOrientation(getTargetAngleDir(self, self.senseScheduler:getCurZone()))
   else
      self:setOrientation(random.normal(-180, 180))
   end
end

function CKabarog:walk_finish()
   self:setMoveSpeed(0)
   self:setOrientationSpeed(0)
   self:setStrafeSpeed(0)
end

function CKabarog:die__()
   CCharacter.die__(self)

   self:playDeathAnimation("death")
end

function CKabarog:die()
   CCharacter.die(self)

   self.fx.blood2:play()
   self.fx.blood_death:play()

   self:getInventory():destroyItem(self.weapon, -1, true, true)

   if self:getInventory():getItemsCount() ~= 0 then
      self.interactor:setRaycastActive(true)
   end
end

function CKabarog:OnInventoryChange(event)
   if self:getInventory():getItemsCount() == 0 then
      self:showGibs()
   end
end

CKabarog.showGibs = hlp.showGibs

function CKabarog:getLabel()
   return "Hornhog"
end

function CKabarog:getInteractLabel()
   if self:getState("dead") then
      return "loot"
   end
end

function CKabarog:OnSaveState(state)
   CCharacter.OnSaveState(self, state)

   state.gibsVisible = self.gibs ~= nil
   if self.installer then
      state.pos = self:getSafePos()
      state.orientationGlobal = self:getOrientationGlobal()
   end
end

function CKabarog:OnLoadState(state)
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
   CKabarog=CKabarog,
   CKabarogWeak=CKabarogWeak,
}
