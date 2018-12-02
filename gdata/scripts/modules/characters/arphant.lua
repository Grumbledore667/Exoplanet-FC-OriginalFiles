local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CActionsScheduler = (require "actionsScheduler").CActionsScheduler
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local random = require "random"

local hlp = require "helpers"

---@class CArphant : CCharacter
local CArphant = oo.class({}, CCharacter)

function CArphant:getDefaultParameters()
   local parameters = CCharacter.getDefaultParameters(self)

   parameters.maxLandingSpeed  = 1800

   parameters.feelRadiusCutoff = 0

   parameters.viewDist         = 1000
   parameters.viewAngle        = 180
   parameters.backViewDist     = 400
   parameters.warnDist         = 600
   parameters.attackDist       = 380
   parameters.attackAngle      = 100

   parameters.zoneSize         = 1500

   parameters.defenceDist      = 200

   parameters.healthMax        = 1500

   return parameters
end

function CArphant:loadDynamicParameters(params)
   CCharacter.loadDynamicParameters(self, params)
   self.parameters.zoneSize = params.zoneSize
   self.parameters.feelRadiusCutoff = params.feelRadiusCutoff
   self.parameters.lootItems = params.lootItems
end

function CArphant:loadParameters()
   CCharacter.loadParameters(self)

   self.senseScheduler:setFeelRadius(loadParamNumber(self, "feelRadiusCutoff"))

   self.parameters.enemySpotted = 0

   self.headLookingLimits = {x=10, y=45, z=0}

   self.lootItems = self.lootItems or loadParamItemCounts(self, "lootItems", {})
   if loadParam(self, "defaultLoot", true) then
      self.lootItems["meat.itm"] = 5
   end

   for name, count in pairs(self.lootItems) do
      self:getInventory():addItem(name, count)
   end

   self:addWeapon()
end

function CArphant:addWeapon()
   if not self.weapon then
      self.weapon = hlp.safeCreateItemWithoutModel("arphant_bite.wpn", "CWeapon")
      self.weapon:setOffset(false)
      self.weapon:setDimensions(45, 0)
      self.weapon = self:getInventory():addItemObj(self.weapon)
      self.weapon:setDamage(30)
      self:getInventory():equipSlotWithItem(self:getWeaponSlot(), self.weapon:getId())

      self.weapon2 = hlp.safeCreateItemWithoutModel("arphant_stomp.wpn", "CWeapon")
      self.weapon2:setOffset(false)
      self.weapon2:setDimensions(70, 0)
      self.weapon2 = self:getInventory():addItemObj(self.weapon2)
      self.weapon2:setDamage(60)
   end
end

function CArphant:initSenses()
   self.senseScheduler:addSense("inZone"     , false, self.senseScheduler, self.senseScheduler.checkZone)
   self.senseScheduler:addSense("enemyDetect", false, self.senseScheduler, self.senseScheduler.checkDetect)
   self.senseScheduler:addSense("enemyClose" , false, self.senseScheduler, self.senseScheduler.checkClose)
   self.senseScheduler:addSense("enemyFront" , false, self.senseScheduler, self.senseScheduler.checkFront)
end

function CArphant:subscribeToStepEvents(anim)
   self.animationsManager:subscribeAnimationEventIn(anim, "step1", self.onStepEventIn, self)
   self.animationsManager:subscribeAnimationEventIn(anim, "step2", self.onStepEventIn, self)
   self.animationsManager:subscribeAnimationEventIn(anim, "step3", self.onStepEventIn, self)
end

function CArphant:OnCreate(params)
   CCharacter.OnCreate(self, params)

   self:initSenses()
   self:initFX()

   self:setGuild("GLD_ANIMAL")
   self:addActions()

   self:idle_run()
end

function CArphant:initFX()
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
   end
end

function CArphant:OnStuckIn()
end

function CArphant:OnStuckOut()
end

-- Actions

function CArphant:addActions()
   local idle = CAction{}
   --idle:allowRestartOnEvent("setSense")
   idle.start = self.idle_start
   idle.stop  = self.idle_stop
   idle.name = "idle"

   local move = CAction{}
   move.start = self.move_start
   move.stop  = self.move_stop
   move.name = "move"

   local chase = CAction{}
   chase:allowRestartOnEvent("onChangeState")
   chase.start = self.chase_start
   chase.stop  = self.chase_stop
   chase.name = "chase"

   local attack = CAction{}
   attack:allowRestartOnEvent("onChangeState")
   attack.start = self.attack_start
   attack.stop  = self.attack_stop
   attack.name = "attack"

   local panic = CAction{}
   panic:allowRestartOnEvent("onChangeState")
   panic.start = self.panic_start
   panic.stop  = self.panic_stop
   panic.name = "panic"

   local damage = CAction{}
   damage:allowRestartOnEvent("onChangeState")
   damage.start = self.damage_start
   damage.stop  = self.damage_stop
   damage.name = "damage"

   local search = CAction{}
   search:allowRestartOnEvent("onChangeState")
   search.start = self.search_start
   search.stop = self.search_stop
   search.name = "search"

   local root = CNode{}
   root:yes (self.alive_):yes (self.search_):no (self.damage_):no (self.attack_):no  (self.chase_):no (self.panic_):no (self.move_):no  (idle)
   root:yes (self.alive_):yes (self.search_):no (self.damage_):no (self.attack_):no  (self.chase_):no (self.panic_):no (self.move_):yes (move)
   root:yes (self.alive_):yes (self.search_):no (self.damage_):no (self.attack_):no  (self.chase_):no (self.panic_):yes(panic)
   root:yes (self.alive_):yes (self.search_):no (self.damage_):no (self.attack_):no  (self.chase_):yes(chase)
   root:yes (self.alive_):yes (self.search_):no (self.damage_):no (self.attack_):yes (attack)
   root:yes (self.alive_):yes (self.search_):no (self.damage_):yes (damage)
   root:yes (self.alive_):yes (self.search_):yes (search)

   self.actionsScheduler.root = root
end


-- Predicates

function CArphant:alive_()
   --log("-----------------------")
   --log(self.states)
   if (not self.senseScheduler:getCurEnemy()) or (not objInDist(self:getPose():getPos(), self.senseScheduler:getCurEnemy():getPose():getPos(), self.parameters.backViewDist/3)) then
      self:setState("panic", false)
   end

   return not self:getState("dead")
end

function CArphant:move_()
   return self:getState("move")
end

function CArphant:chase_()
   if self:getState("blockAttack") or self:getState("panic") then
      return false
   end

   if self.senseScheduler:getSense("enemyDetect") then
      self:setState("chase", true)
      return true
   end

   return false
end

function CArphant:attack_()
   if self:getState("blockAttack") or self:getState("panic") then
      return false
   end
   if self.senseScheduler:getSense("enemyClose") then
      self:setState("attack", true)
      return true
   end

   return false
end

function CArphant:panic_()
   if self:getState("panic") then
      return true
   end

   if not self.senseScheduler:getCurEnemy() then
      return false
   end

   if (not self.senseScheduler:getSense("enemyFront")) and objInDist(self:getPose():getPos(), self.senseScheduler:getCurEnemy():getPose():getPos(), self.parameters.defenceDist) then
      self:setState("panic", true)
      return true
   end

   return false
end

function CArphant:damage_()
   return self:getState("damage")
end

function CArphant:search_()
   return self:getState("search")
end


-- Callbacks
-- ----------------------------- IDLE ----------------------------------------------------
function CArphant:idle_run()
   if self:getState("chase") or self:getState("panic") then
      return
   end

   self:setState("idle"  , true)
   self:setState("move"  , false)
end

function CArphant:idle_start()
   self.animationsManager:playCycle("idle")

   runTimer(random.random() * 2, self, self.move_run, false)

   --log("-----------------------")
   --log(self.states)
end

function CArphant:idle_stop()
   self:setState("idle" , false)
end

-- ----------------------------- MOVE ----------------------------------------------------
function CArphant:move_run()
   if self:getState("chase") or self:getState("panic") or self:getState("blockAttack") then
      return
   end

   self:setState("move" , true)
   self:setState("idle" , false)
end

function CArphant:move_start()
   if self:getState("swimming") then
      self:setOrientationSpeed(40)
      self:setMoveSpeed       (100)
   else
      self:setOrientationSpeed(80)
      self:setMoveSpeed       (150)
   end

   self.animationsManager:playCycle("walk")
   self:subscribeToStepEvents("walk")

   runTimer(random.random() * 4, self, self.idle_run, false)

   if not self.senseScheduler:getSense("inZone") then
      --log("outzone")
      self:setOrientation(getTargetAngleDir(self, self.senseScheduler:getCurZone()))
   else
      self:setOrientationFull(random.random() * 360)
   end
end

function CArphant:move_stop()
   self:setMoveSpeed(0)
   self:setOrientationSpeed(0)

   self:setState("move" , false)
end

-- ----------------------------- CHASE ----------------------------------------------------
function CArphant:chase_start()
   if self.senseScheduler:getSense("enemyFront") then
      self.parameters.enemySpotted = self.parameters.enemySpotted + 1
   end

   if self:getState("swimming") then
      self:setOrientationSpeed(200)
      self:setMoveSpeed       (200)
   else
      self:setOrientationSpeed(400)
      self:setMoveSpeed       (400)
   end
   self.animationsManager:playCycle("run")
   self:subscribeToStepEvents("run")


   if self.senseScheduler:getCurEnemy() then
      self:setTarget(self.senseScheduler:getCurEnemy(), {y=100})
   end
   --self:setOrientation     (getTargetAngleDir(self, self.senseScheduler:getCurEnemy():getPose():getPos()))
end

function CArphant:chase_stop()
   self:setMoveSpeed(0)
   self:setOrientationSpeed(0)
   self:resetTarget()

   self:setState("chase", false)
end

-- ----------------------------- ATTACK ----------------------------------------------------
function CArphant:attack_start()
   if not self.senseScheduler:getCurEnemy() then
      return
   end

   if self:getState("swimming") then
      self:setOrientationSpeed(100)
   else
      self:setOrientationSpeed(200)
   end
   self:setOrientation     (getTargetAngleDir(self, self.senseScheduler:getCurEnemy():getPose():getPos()))

   if random.random(0, 10) > 3 then
      self:getInventory():equipSlotWithItem(self:getWeaponSlot(), self.weapon:getId())
      self.animationsManager:playCycle("attack")
      runTimer(0.3, nil, function() self:OnItemActivateSafe(self.weapon) end, false)
      runTimer(0.8, self, self.attackAnimStop, false)
   else
      self:getInventory():equipSlotWithItem(self:getWeaponSlot(), self.weapon2:getId())
      self.animationsManager:playCycle("attack_2")
      runTimer(1, self, function() self:OnItemActivateSafe(self.weapon2) end, false)
      runTimer(2.2, self, self.attackAnimStop, false)
   end
end

function CArphant:attack_stop()
   self:setOrientationSpeed(0)
end

function CArphant:attackAnimStop()
   self:setState("attack", false)
   self:setState("blockAttack", true)

   self:OnItemDeactivateSafe(self.weapon)
   self:OnItemDeactivateSafe(self.weapon2)

   runTimer(0.5, self, self.coolDown, false)
end

function CArphant:coolDown()
   self:setState("blockAttack", false)
end

-- ----------------------------- PANIC ----------------------------------------------------
function CArphant:panic_start()
   self:setOrientation(getTargetAngle(self, self.senseScheduler:getCurEnemy():getPose():getPos())+180)

   if self:getState("swimming") then
      self:setMoveSpeed       (600)
   else
      self:setMoveSpeed       (1200)
   end
   self.animationsManager:playCycle("run")
   self:subscribeToStepEvents("run")
end

function CArphant:panic_stop()
   self:setMoveSpeed(0)
end

-- ----------------------------- DAMAGE ----------------------------------------------------
function CArphant:damage_start()
   local animation = "hurt"
   if self:getFeelRadius() == 0 then
      self.senseScheduler:setFeelRadius(1000)
   end

   self.fx.blood1:play()
   self.fx.blood2:play()

   if self.animationsManager.currentAnimations[animation] then return end

   if random.random(0, 5) > 4 then
      self.animationsManager:playAction(animation)
      self.animationsManager:subscribeAnimationEnd(animation, self.damage_stop, self)
   else
      self:callAnimEvent("hurt")

      runTimer(0, self, self.damage_stop, false)
   end

   if not self.senseScheduler:getCurEnemy()then
      self:setState("search", true)
   end
end

function CArphant:damage_stop()
   self:setState("damage", false)
end

-- ----------------------------- SEARCH ----------------------------------------------------
--function CArphant:search_run()

function CArphant:search_start()
   -- log("search start")
   -- self:setOrientation(-90)
   self:setOrientation(90 + random.random() * 180)

   if self:getState("swimming") then
      self:setOrientationSpeed(200)
      self:setMoveSpeed       (200)
   else
      self:setOrientationSpeed(400)
      self:setMoveSpeed       (400)
   end
   self.animationsManager:playCycle("run")
   self:subscribeToStepEvents("run")
   runTimer(2, self, self.searchAnimStop, false)
   --self:setOrientationFull(rand(360))
end

function CArphant:search_stop()
   self:setMoveSpeed(0)
end

function CArphant:searchAnimStop()
   self:setOrientationSpeed(0)
   self:setState("search", false)
end


-- ----------------------------- ANIM EVENTS ----------------------------------------------------
function CArphant:animatedEvent(eventType)
   CCharacter.animatedEvent(self, eventType)

   if self:getHealth() == 0 and eventType ~= "die" then
      return
   end

   -- log("animatedEvent = " .. eventType)

   if eventType == "hit" then
      self:setState("damage", true)
   end
end

function CArphant:die__()
   CCharacter.die__(self)

   self:playDeathAnimation("death")
end

function CArphant:die()
   CCharacter.die(self)

   self:getInventory():destroyItem(self.weapon, -1, true, true)
   self:getInventory():destroyItem(self.weapon2, -1, true, true)

   if self:getInventory():getItemsCount() ~= 0 then
      self.interactor:setRaycastActive(true)
   end
end

function CArphant:getLabel()
   return "Arphant"
end

function CArphant:getInteractLabel()
   if self:getState("dead") then
      return "loot"
   end
end

function CArphant:OnInventoryChange(event)
   if self:getInventory():getItemsCount() == 0 then
      self.interactor:setRaycastActive(false)
   end
end

function CArphant:OnSaveState(state)
   CCharacter.OnSaveState(self, state)

   state.feelRadius = self:getFeelRadius()

   -- dynamic object spawned by installer
   if self.installer then
      state.pos = self:getPose():getPos()
      state.orientationGlobal = self:getOrientationGlobal()
   end
end

function CArphant:OnLoadState(state)
   if self.installer then
      if state.pos then
         self:getPose():setPos(state.pos)
      end
      if state.orientationGlobal then
         self:setOrientationGlobal(state.orientationGlobal)
      end
   end

   CCharacter.OnLoadState(self, state)

   self:setFeelRadius(state.feelRadius)

   self.weapon = nil
   self.weapon2 = nil
   if not state.dead then
      self:addWeapon()
   end
end

return { CArphant=CArphant }
