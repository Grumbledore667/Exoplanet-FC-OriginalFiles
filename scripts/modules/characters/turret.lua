local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter

local f = require "fun"
local partial = f.partial

local ai = require "ai"
local coro = require "coroutines.helpers"

local hlp = require "helpers"

---@class CTurret : CCharacter
local CTurret = oo.class({
   inventoryType = "turret",
   itemName = "turret.itm",
   BASE_PREFAB = "turret_construct_base.sbg",
   HEAD_PREFAB = "turret_construct_head.sbg",
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

   local tree = loadParam(self, "tree", "ai.trees.turret")
   self:createTree(tree)

   self:setBBVar("scanAngle", self.parameters.viewAngle/2)
end

function CTurret:showInventory(state)
   gameplayUI.inventoryTurret:show(state)
end

function CTurret:OnDestroy()
   CCharacter.OnDestroy(self)

   self:setOrientationSpeed(9999)
   self:setOrientationFull (0)

   self:getInventory():destroyAllItems()

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

function CTurret:setupTimers(freq)
   self:stopTimers()

   self.senseScheduler.timer = runTimer(freq, self.senseScheduler, self.senseScheduler.OnIdle, true)
   self.behaviorTreeTimer    = runTimer(freq, self, ai.utils.ticker, true)
end

function CTurret:stopTimers()
   CCharacter.stopTimers(self)

   if self.behaviorTreeTimer then
      self.behaviorTreeTimer:stop()
      self.behaviorTreeTimer = nil
   end
end

function CTurret:shoot_running()
   local gun = self:getWeaponSlotItem()
   local enemy = self.senseScheduler:getCurEnemy()

   --Visuals
   self.lasers.red:setVisible(true)

   --Aim
   local pos = enemy:getPose():getPos()
   pos.y = pos.y + 100
   gun:setImpactPos(pos)

   --Shoot and draw new ammo
   self:OnItemActivateSafe(gun)
   local ammoItem = gun:getAvailableAmmoItem()
   if ammoItem then
      gun.magazine = gun.magazine + 1
   end

   coro.wait(gun:getCooldown())
end

function CTurret:lookSides_running()
   --Visuals
   self:playSound("Play_turret_move")
   self:soundDistance("Play_turret_move", 1000)
   self:soundDistance("Play_turret_scan", 2000)
   self.lasers.green:setVisible(true)
   self.lasers.red:setVisible(false)
   self:setOrientationSpeed(self.parameters.patrolSpeed)

   --Rotate head
   local angle = self:getBBVar("scanAngle")
   local lookLeft = self:getBBVar("lookLeft")
   if lookLeft then
      self:setOrientationFull(angle)
      while self:getOrientationFull() < angle - 1 do
         coro.waitNextTick()
      end
   else
      self:setOrientationFull(-angle)
      while self:getOrientationFull() > -angle + 1 do
         coro.waitNextTick()
      end
   end

   --Scan
   self:stopSound("Play_turret_move")
   self:playSound("Play_turret_scan")

   self:setBBVar("lookLeft", not lookLeft)

   coro.wait(1)
end

function CTurret:lookSides_finish()
   self:stopSound("Play_turret_move")
   self:stopSound("Play_turret_scan")
   self.lasers.green:setVisible(false)

   self:setOrientationSpeed(0)
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

function CTurret:pickupItem(inventory)
   local item = inventory:addItem(self.itemName)

   if item then
      self:getInventory():giveAllItemsTo(getMC():getInventory())
      getScene():destroyEntity(self)
      item:setVisible(false)
   end
   return item, 1
end

function CTurret:OnInventoryChange(event)
   if event.eventType == "ItemAdded" then
      if event.item:isRangedWeapon() then
         self:getInventory():equipSlotWithItem(self:getWeaponSlot(), event.item:getId())
         event.item:setPose(self.head:getPose())
         event.item:getPose():setParent(self.head:getPose())
         event.item:getPose():setLocalPos({x=0, y=121, z=10})
      end
   end
   local gun = self:getWeaponSlotItem()
   if gun then
      gun:OnEquip(self:getWeaponSlot())
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
