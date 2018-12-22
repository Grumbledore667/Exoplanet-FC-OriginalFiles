local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local ItemsData = (require "itemsData")

local ai = require "ai"
local coro = require "coroutines.helpers"
local random = require "random"

local hlp = require "helpers"

---@class CBug : CCharacter
local CBug = oo.class({
   itemName     = "bug.itm",
   itemNameDead = "bug_dead.itm",
   itemNameChipped = "bug_chipped.itm",
   installer = nil,
   spawnCorpseDummy = false,
}, CCharacter)

function CBug:OnDestroy()
   CCharacter.OnDestroy(self)
   if self.installer then
      self.installer:removeInstallation(self)
   end
   self:stopTimers()
   self:deleteBehaviorTree()
end

function CBug:initSenses()
   self.senseScheduler:addSense("enemyDetect", false, self.senseScheduler, self.senseScheduler.checkDetect)
   -- adding "enemyDetect" since "checkClose" depends on it
   self.senseScheduler:addSense("enemyClose" , false, self.senseScheduler, self.senseScheduler.checkClose)
   self.senseScheduler:addSense("inZone"     , false, self.senseScheduler, self.senseScheduler.checkZone)
end

function CBug:getDefaultParameters()
   local parameters = CCharacter.getDefaultParameters(self)

   parameters.healthMax    = 10
   parameters.walkSpeed    = 150
   parameters.runSpeed     = 400

   parameters.weaponSlotId = 0
   parameters.weaponDamage = 20
   parameters.attackDist   = 300

   parameters.viewDist     = 1000  -- 10 meters
   parameters.backViewDist = 500   -- 5 meters
   parameters.viewAngle    = 180

   return parameters
end

function CBug:loadDynamicParameters(params)
   CCharacter.loadDynamicParameters(self, params)
   self.parameters.healthMax = params.healthMax
   self.parameters.zoneSize = params.zoneSize
   self.parameters.feelRadiusCutoff = params.feelRadiusCutoff
   self.parameters.blockChirping = params.blockChirping
   self.parameters.walkSpeed = params.walkSpeed
   self.parameters.runSpeed = params.runSpeed
   self.parameters.weaponDamage = params.weaponDamage
end

function CBug:loadParameters()
   CCharacter.loadParameters(self)

   self.senseScheduler:setFeelRadius(loadParamNumber(self, "feelRadiusCutoff", 1000))
   self.blockChirping = loadParam(self, "blockChirping", false)

   self.parameters.maxLandingSpeed = 1500
end

function CBug:OnCreate(params)
   CCharacter.OnCreate(self, params)
   self.interactor:setRaycastRadius(150)
   self.interactor:setRaycastActive(false)

   self:initSenses()
   self:initFX()

   self.weapon = hlp.safeCreateItemWithoutModel("bug_bite.wpn", "CWeapon")
   self.weapon:setDamage(self.parameters.weaponDamage)
   self.weapon:setOffset(false)
   self.weapon:setDimensions(35, 0)
   self.weapon = self:getInventory():addItemObj(self.weapon)
   self:getInventory():equipSlotWithItem(self:getWeaponSlot(), self.weapon:getId(), true)

   self:setGuild("GLD_INSECT")

   self:enablePickupItem()
   self:createTree("ai.trees.bug")
end

function CBug:setupTimers(freq)
   self:stopTimers()

   self.senseScheduler.timer = runTimer(freq, self.senseScheduler, self.senseScheduler.OnIdle, true)
   self.behaviorTreeTimer    = runTimer(freq, self, ai.utils.ticker, true)
end

function CBug:stopTimers()
   CCharacter.stopTimers(self)

   if self.behaviorTreeTimer then
      self.behaviorTreeTimer:stop()
      self.behaviorTreeTimer = nil
   end
end

function CBug:initFX()
   if not self.fx then
      self.fx = {}
      self.fx.blood = self:createAspect("bug_damage.sps")
      self.fx.blood:setLoop(false)
      self.fx.blood:getPose():setParent(self:getBonePose("item_slot1"))
      self.fx.blood:getPose():resetLocalPos()
      self.fx.blood:disable()

      self.fx.blood_death = self:createAspect("bug_blood_death.sps")
      self.fx.blood_death:setLoop(false)
      self.fx.blood_death:getPose():setParent(self:getBonePose("item_slot1"))
      self.fx.blood_death:getPose():resetLocalPos()
      self.fx.blood_death:disable()
   end
end

function CBug:enablePickupItem()
   self.interactor:setRaycastActive(true)
end

function CBug:disablePickupItem()
   self.interactor:setRaycastActive(false)
end

function CBug:OnCaught()
   self:setState("caught", true)
end

function CBug:OnFree(pose)
   self:setCollision  (true)
   self:setFeelVisible(true)

   self:getPose():resetParent()
   self:getPose():setRot(pose:getRot())
   self:setSpawnPos(pose:getPos())

   self:enablePickupItem()
   self:setState("caught", false)
   self:createTree("ai.trees.bug")
   self:setupTimers(self.defaultTimerFrequency)
end

function CBug:hit(damage, charAttacker)
   CCharacter.hit(self, damage, charAttacker)
   self:setState("damage", true)
end

function CBug:die__()
   CCharacter.die__(self)

   self:playDeathAnimation("death")
end

function CBug:die()
   CCharacter.die(self)

   self.fx.blood_death:play()
   self:OnItemDeactivateSafe(self:getWeaponSlotItem())

   local lastEnemy = self.senseScheduler:getLastEnemy()
   if lastEnemy then
      self:pushFrom(lastEnemy:getPose():getPos(), 5000, 1.5, {y=180})
   end
end

function CBug:chase_start()
   self:setOrientationSpeed(400)
   self:setMoveSpeed(self.parameters.runSpeed)
   self.animationsManager:playCycle("run_front")

   local enemy = self.senseScheduler:getCurEnemy()
   self:setTarget(enemy, {y=100})
   self:setOrientation(getTargetAngleDir(self, enemy:getPose():getPos()))
end

function CBug:chase_finish()
   self:resetTarget()
   self:stopMove()
end

-- CoroutineAction
function CBug:attack_running()
   local currentEnemy = self.senseScheduler:getCurEnemy()

   self:setOrientationSpeed(500)
   self:setOrientation(getTargetAngleDir(self, currentEnemy:getPose():getPos()))
   self.animationsManager:playAction("jump_ready")
   self.animationsManager:playCycle("jump_front")

   coro.waitAnimationEnd(self, "jump_ready")

   self:setOrientation(getTargetAngleDir(self, currentEnemy:getPose():getPos()))

   self:startJump(350)
   self:setMoveSpeed(600)

   self:OnItemActivateSafe(self:getWeaponSlotItem())

   coro.waitEvent("OnLanding")
end

function CBug:attack_finish()
   self:OnItemDeactivateSafe(self:getWeaponSlotItem())
   self:stopMove()
end

function CBug:caught_start()
   self.animationsManager:playCycle("escaping")
   self:OnItemDeactivateSafe(self:getWeaponSlotItem())

   self:deleteBehaviorTree()
   self:stopTimers()
end

function CBug:idle_start()
   self.animationsManager:playCycle("idle")
end

function CBug:walk_start()
   self:setOrientationSpeed(150)

   if not self.senseScheduler:getSense("inZone") then
      self:setOrientation(getTargetAngleDir(self, self.senseScheduler:getCurZone()))
   else
      self:setOrientation(random.normal(-180, 180))
   end
   self:setMoveSpeed(self.parameters.walkSpeed)
   self.animationsManager:playCycle("walk_front")
end

-- CoroutineAction
function CBug:damaged_running()
   self.animationsManager:playAction("hit")
   self.fx.blood:play()
   local enemy = self.senseScheduler:getCurEnemy()
   if enemy then
      self:pushFrom(enemy:getPose():getPos(), 5000, 1.5, {y=180})
   end
   coro.waitAnimationEnd(self, "hit")
end

function CBug:damaged_finish()
   self:setState("damage", false)
end

function CBug:getType()
   return "pickup"
end

function CBug:getLabel()
   return ItemsData.getItemLabel(self:getItemName())
end

function CBug:getInteractLabel()
   if self:getState("dead") then
      return "pick up"
   else
      return "catch"
   end
end

function CBug:getItemName()
   local itemName = self.itemName

   if self:getState("dead") then
      itemName = self.itemNameDead
   elseif self.wasChipped then
      itemName = self.itemNameChipped
   end
   return itemName
end

function CBug:getAsItem()
   local itemName = self:getItemName()

   local item = hlp.safeCreateItemWithoutModel(itemName, ItemsData.getItemClass(itemName))

   if item then
      self:OnItemDeactivateSafe(self.weapon)
      self:getInventory():destroyItem(self.weapon, -1, true, true)
      getScene():destroyEntity(self)
      item:setVisible(false)
      return item
   else
      log("Can't create " .. itemName)
      return nil
   end
end

function CBug:OnLanding(landingSpeed)
   CCharacter.OnLanding(self, 0) -- TODO: FIXME: potential bug: the bug won't receive fall damage
   self:OnItemDeactivateSafe(self:getWeaponSlotItem())
end

function CBug:OnSaveState(state)
   state.dead = self:getState("dead")
   -- dynamic object spawned by installer
   if self.installer then
      state.pos = self:getSafePos()
      state.orientationGlobal = self:getOrientationGlobal()
      if not state.dead then
         state.health = self:getStatCount("health")
      end
      state.caught = self:getState("caught")
   end
end

function CBug:OnLoadState(state)
   -- prevent duping when holding bug in hand
   if state.caught then
      getScene():destroyEntity(self)
      return
   end
   if self.installer then
      if state.pos then
         self:getPose():setPos(state.pos)
      end
      if state.orientationGlobal then
         self:setOrientationGlobal(state.orientationGlobal)
      end
      if state.health and not state.dead then
         self:setStatCount("health", state.health)
      end
   end
   if state.dead then
      self:die__()
   end
end

return {CBug=CBug}
