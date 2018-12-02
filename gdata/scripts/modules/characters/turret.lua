local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local ItemsData = (require "itemsData")

local f = require "fun"
local partial = f.partial

local hlp = require "helpers"

---@class CTurret : CCharacter
local CTurret = oo.class({
   inventoryType = "turret",
   itemName = "turret.itm",
   BASE_PREFAB="turret_construct_base.sbg",
   HEAD_PREFAB="turret_construct_head.sbg",
}, CCharacter)

function CTurret:getDefaultParameters()
   local parameters = CCharacter.getDefaultParameters(self)

   parameters.viewDist     = 3000
   parameters.viewAngle    = 170
   parameters.backViewDist = 3000
   parameters.attackDist   = 2000
   parameters.attackAngle  = 30

   parameters.patrolSpeed  = 180

   parameters.healthMax = 10000
   return parameters
end

function CTurret:loadParameters()
   CCharacter.loadParameters(self)

   self.senseScheduler:setFeelRadius(loadParamNumber(self, "feelRadiusCutoff", 2000))

   self.patrolTimers = {}
end

function CTurret:initSenses()
   self.senseScheduler:addSense("enemyDetect", false, self.senseScheduler, self.senseScheduler.checkDetect)
   self.senseScheduler:addSense("enemyFront" , false, self.senseScheduler, self.senseScheduler.checkFront)
end

function CTurret:OnCreate(params)
   CCharacter.OnCreate(self, params)

   self:initPrefabs()
   self:initSenses()

   self:setGuild("GLD_TURRET")
   self:addActions()

   self:setState("patrol", false)
   self:setState("dead", false)
end

function CTurret:showInventory(state)
   gameplayUI.inventoryTurret:show(state)
end

function CTurret:OnDestroy()
   CCharacter.OnDestroy(self)

   self:setOrientationSpeed(9999)
   self:setOrientationFull (0)

   self:setState("dead", true)

   self:getInventory():destroyAllItems()

   self:attack_stop()
   self:stopLasersTimer()

   getScene():destroyEntity(self.base)
   getScene():destroyEntity(self.head)
end

function CTurret:initPrefabs()
   --Delay needed, cause obj pos will be set after OnCreate
   runTimer(0, self, function()
      --TODO:FIXME: Maybe find a way to still parent but disable rotation change so we could get rid of the delay above
      self.base = getScene():createEntity(self.BASE_PREFAB, "")
      self.base:setPose(self:getPose())
   end, false)

      self.head = getScene():createEntity(self.HEAD_PREFAB, "")
      self.head:setPose(self:getPose())
      self.head:getPose():setParent(self:getPose())

      self.lasers = {}
      self.lasers.green = self:createAspect("laser_green.sbg")
      self.lasers.green:getPose():setParent(self.head:getPose())
      self.lasers.green:getPose():resetLocalPose()
      self.lasers.green:getPose():setLocalPos({x=0,y=140,z=-17})
      self.lasers.green:playAnimation("scan", true)
      self.lasers.green:setAnimationSpeed(4.0)
      self.lasers.green:setVisible(false)
      self.lasers.green:setMaterials("lazer_scanner")

      self.lasers.red = self:createAspect("laser_red.sbg")
      self.lasers.red:getPose():setParent(self.head:getPose())
      self.lasers.red:getPose():resetLocalPose()
      self.lasers.red:getPose():setLocalPos({x=1,y=140,z=-15})
      self.lasers.red:setVisible(false)

      self:initLookAtData()
end

function CTurret:initLookAtData()
   self.lookAtFactor = 0
   self.headBonePose = self:findBonePose("item_slot2")

   if not self.headBonePose then
      self.headBonePose = self:findBonePose("head")
   end
end

function CTurret:freeGun()
   local gun = self:getWeaponSlotItem()
   if gun then
      gun:getPose():resetParent()
      gun:hide()
   end
end

-- Actions
function CTurret:addActions()
   local patrol = CAction{}
   patrol:allowRestartOnEvent("onChangeState")
   patrol.start = self.patrol_start
   patrol.stop  = self.patrol_stop
   patrol.name = "patrol"

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
   root:yes (self.alive_):yes (self.damage_):no  (self.attack_):no  (patrol)
   root:yes (self.alive_):yes (self.damage_):no  (self.attack_):yes (attack)
   --root:yes (self.alive_):yes (self.damage_):yes (damage)

   self.actionsScheduler.root = root
end


-- Predicates
function CTurret:alive_()
   --log("-----------------------")
   --log(self.states)
   return not self:getState("dead")
end

function CTurret:attack_()
   if self.senseScheduler:getSense("enemyFront") then
      return true
   end

   return false
end

function CTurret:damage_()
   return false
end


-- Callbacks
-- ----------------------------- PATROL ----------------------------------------------------
function CTurret:stopPatrolTimers()
   if self.patrolTimers[0] then
      self.patrolTimers[0]:stop()
      self.patrolTimers[0] = nil
   end

   if self.patrolTimers[1] then
      self.patrolTimers[1]:stop()
      self.patrolTimers[1] = nil
   end

   if self.retargetTimer then
      self.retargetTimer:stop()
      self.retargetTimer = nil
   end
end

function CTurret:stopLasersTimer()
   if self.lasers.timer then
      self.lasers.timer:stop()
      self.lasers.timer = nil
   end
end
--[[
function CTurret:OnFeelIn(char)
   CCharacter.OnFeelIn(self, char)
   log("turret feel in: " .. char:getName())
end

function CTurret:OnFeelOut(char)
   CCharacter.OnFeelOut(self, char)
   log("turret feel out: " .. char:getName())
end
]]
function CTurret:patrol_start()
   if not self:getState("patrol") then
      return
   end

   --if (self.senseScheduler.enemies) then log("enemies cnt: " .. tostring(#self.senseScheduler.enemies)) end
   --if (self.senseScheduler.curEnemy) then log("cur enemy: " .. tostring(self.senseScheduler.curEnemy:getName())) end

   self.animationsManager:playCycle("idle")
   self:stopPatrolTimers()
   self:patrol_checkPauseTurn()

   self.retargetTimer = runTimer(1, self.senseScheduler, self.senseScheduler.resetCurEnemy, true)
end

function CTurret:patrol_stop()
   self:stopPatrolTimers   ()
   self:setOrientationSpeed(0)
   self:stopSound          ("turret_move.wav")
end

function CTurret:patrol_checkPauseTurn()
   if not self:getState("patrol") or not self:alive_() then
      return
   end
   --log("patrol_checkPauseTurn")
   --log("getOrientationFull = " .. tostring(self:getOrientationFull()))
   self.patrolTimers[1] = nil

   self:playSound("turret_move.wav")
   self:loopSound("turret_move.wav", true)
   self:soundDistance("turret_move.wav", 1000)

   if self:getWeaponSlotItem() and not self.lasers.timer then
      self.lasers.timer = runTimer(2, self, self.lasersDeactivate, false)
   end

   self:setOrientationSpeed(self.parameters.patrolSpeed)
   self:setOrientationFull ((self.parameters.viewAngle/2+1) * -sign(self:getOrientationFull()))

   self.patrolTimers[0] = runTimer(0.2, self, self.patrol_checkStartTurn, false)
end

function CTurret:patrol_checkStartTurn()
   if not self:getState("patrol") or not self:alive_() then
      return
   end

   self.patrolTimers[0] = nil

   --log("getOrientationFull = " .. tostring(self:getOrientationFull()))

   if math.abs(self:getOrientationFull()) > self.parameters.viewAngle/2 then
      self:setOrientationSpeed(9999)
      self:setOrientationFull ((self.parameters.viewAngle/2-1) * sign(self:getOrientationFull()))
      self.patrolTimers[1] = runTimer(0.3, self, self.patrol_checkPauseTurn, false)
      self:stopSound("turret_move.wav")
   else
      self.patrolTimers[0] = runTimer(0.2, self, self.patrol_checkStartTurn, false)
   end
end

-- ----------------------------- ATTACK ----------------------------------------------------
function CTurret:attack_start()
   if self:getState("attack") or not self.senseScheduler:getCurEnemy() then
      return
   end

   self:setState("attack", true)

   local enemy = self.senseScheduler:getCurEnemy()
   --log("enemy height = " .. tostring(enemy:getCollisionHeight()))
   self:setTarget(enemy, {y=enemy:getCollisionHeight()/2})
   self:attackEvent()

   if self:getWeaponSlotItem() then
      if self.lasers.timer then
         self.lasers.timer:stop()
         self.lasers.timer = nil
      end

      self:stopSound("turret_scan.wav")
      self.lasers.green:setVisible(false)
      self.lasers.red:setVisible  (true)
   end
end

function CTurret:lasersDeactivate()
   self:playSound("turret_scan.wav")
   self:loopSound("turret_scan.wav", true)
   self:soundDistance("turret_scan.wav", 2000)

   self.lasers.green:setVisible(true)
   self.lasers.red:setVisible  (false)
   self.lasers.timer = nil
end

function CTurret:attackEvent()
   log("CTurret:attackEvent")
   local gun = self:getWeaponSlotItem()

   if not gun or not self:getState("attack") then
      return
   end

   local enemy = self.senseScheduler:getCurEnemy()
   if enemy then
      local pos = enemy:getPose():getPos()
      pos.y = pos.y + 100
      gun:setImpactPos(pos)
   end

   self:OnItemActivateSafe(gun)
   local ammoItem = gun:getAvailableAmmoItem()
   if ammoItem then
      gun.magazine = gun.magazine + 1
      ammoItem:destroy()
   end

   self.attackTimer = runTimer(0.5, self, self.attackEvent, false)
end

function CTurret:attack_stop()
   if self.attackTimer then
      self.attackTimer:stop()
      self.attackTimer = nil
   end

   self:setState("attack", false)
   self:resetTarget()
end

-- Guilds
function CTurret:isEnemy(char)
   return CCharacter.isEnemy(self, char) and (not self.installer or self.installer ~= char)
end

function CTurret:isIgnore(char)
   return CCharacter.isIgnore(self, char)
end

function CTurret:isFriend(char)
   return CCharacter.isFriend(self, char) and (not self.installer or self.installer == char)
end

function CTurret:getType()
   return "activator"
end

function CTurret:getLabel()
   return "Turret"
end

function CTurret:getLabelPos()
   local pos = self:getPose():getPos()
   if self.head then
      pos = self.head:getPose():getPos()
   end
   return vec3Add(pos, {y=200})
end

function CTurret:getInteractLabel()
   return "Manage"
end

function CTurret:getInteractTime(interactType)
   if interactType == "pick" then
      return 1
   end

   return 0
end

function CTurret:activate(obj)
   if not self.activated then
      self.activated = true
      obj.exchangeTarget = self
      obj:exchangeStart(self)
   end
   return true
end

function CTurret:deactivate(obj)
   if self.activated then
      self.activated = false
      obj.exchangeTarget = nil
      obj:exchangeStop(self)
   end
   return true
end

function CTurret:isActivated()
   return self.activated
end

function CTurret:getAsItem()
   local item = hlp.safeCreateItemWithModel(self.itemName, ItemsData.getItemClass(self.itemName))

   if item then
      self:getInventory():giveAllItemsTo(getMC():getInventory())
      getScene():destroyEntity(self)
      item:setVisible(false)
      return item
   else
      log("Can't create " .. self.itemName)
      return nil
   end
end

function CTurret:OnInventoryChange(event)
   if event.eventType == "ItemAdded" then
      if event.item:isRangedWeapon() then
         self:getInventory():equipSlotWithItem(self:getWeaponSlot(), event.item:getId())
         event.item:setPose(self.head:getPose())
         event.item:getPose():setParent(self.head:getPose())
         event.item:getPose():setLocalPos({x=0, y=121, z=10})
         self:setState("patrol", true)
      end
   end
   local gun = self:getWeaponSlotItem()
   if gun then
      gun:OnEquip(self:getWeaponSlot())
   else
      self:setState("patrol", false)
   end
end

function CTurret:OnSaveState(state)
   if self.installer then
      state.pos = self:getSafePos()
      state.orientationGlobal = self:getOrientationGlobal()
   end
   state.inventory = self:getInventory():serialize()
end

function CTurret:OnLoadState(state)
   if self.installer then
      if state.pos then
         self:getPose():setPos(state.pos)
      end
      if state.orientationGlobal then
         self:setOrientationGlobal(state.orientationGlobal)
      end
   end
   if state.inventory then
      self:getInventory():deserialize(state.inventory)
   end
end

return {CTurret=CTurret}
