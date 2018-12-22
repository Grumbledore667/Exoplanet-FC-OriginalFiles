local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local CInventorySlotted = require "inventorySlotted"
local ItemsData = (require "itemsData")
local random = require "random"

---@class CBanditOld : CCharacter
local CBandit = oo.class({}, CCharacter)

function CBandit:initWithParams(params)
   local prefabName = self:getPrefabName()

   local healthMax = params.healthMax or 200
   local energyMax = params.energyMax or loadParamNumber(self, "energyMax", 0)

   local stats = {
      armor     = {baseValue = 0},
      healthMax = {baseValue = healthMax, min = 1},
      health    = {value = healthMax, min = 0, max = "healthMax", regen = 0},
      energyMax = {baseValue = energyMax, min = 0},
      energy    = {value = energyMax, min = 0, max = "energyMax", regen = 0},
   }
   self:initializeStats(stats)
   self.statusEffectsManager:addStatusEffect({ name = "basicArmor" })

   if energyMax > 0 then
      self:getInventory():addItem("energy_shield_1.itm")
   end

   self.senseScheduler:setFeelRadius(loadParamNumber(self, "viewRange", 2000))

   self.parameters.maxLandingSpeed = 1800

   self.parameters.viewDist        = params.viewDist or 2000
   self.parameters.viewAngle       = 180
   self.parameters.backViewDist    = 400
   self.parameters.warnDist        = 600
   self.parameters.attackDist      = params.attackDist or 170
   self.parameters.attackAngle     = 100

   self.parameters.zoneSize        = params.zoneSize or 1000 -- 10m

   self.parameters.defenceDist     = 200

   self.headLookingLimits = {x=10, y=45, z=0}

   self.standardLoot = params.standardLoot or {}
   self.lootItems = params.lootItems or loadParamItemCounts(self, "lootItems", {})

   if not params.load then
      for name, count in pairs(self.standardLoot) do
         self:getInventory():addItem(name, count)
      end
      for name, count in pairs(self.lootItems) do
         self:getInventory():addItem(name, count)
      end
   end

   self.walkSpeed = 105
   self.runSpeed = 390

   self.customLabel = params.customLabel or loadParam(self, "customLabel", nil)

   if params.styles then
      self:setupAppearance(random.choice(params.styles))
   else
      self:setupAppearance(loadParam(self, "style", ""))
   end

   self:equipHatOnStart()
   self:equipAttireOnStart()

   if not params.weapons then
      self.weapon = loadParam(self, "weapon", "hand_to_hand.wpn")
   else
      if #params.weapons ~= 0 then
         self.weapon = random.choice(params.weapons)
      end
   end

   if self.weapon then
      local item = self:getInventory():addItem(self.weapon)
      self:getInventory():equipSlotWithItem(self:getWeaponSlot(), item:getId(), true)
      self:updateAnims()
   end

   local item = self:getWeaponSlotItem()
   if item:isRangedWeapon() then
      item.magazine = random.random(1, item.magazineMax)
      self.parameters.attackDist = params.attackDist or 2000
   elseif item:getItemName() == "hand_to_hand.wpn" then
      if prefabName == "hulk.cfg" then
         self.parameters.attackDist = 240
         item:setDamage(35)
      else
         self.parameters.attackDist = 130
      end
   end
end

function CBandit:initSenses()
   self.senseScheduler:addSense("inZone"     , false, self.senseScheduler, self.senseScheduler.checkZone)
   self.senseScheduler:addSense("enemyDetect", false, self.senseScheduler, self.senseScheduler.checkDetect)
   self.senseScheduler:addSense("enemyClose" , false, self.senseScheduler, self.senseScheduler.checkClose)
   self.senseScheduler:addSense("enemyFront" , false, self.senseScheduler, self.senseScheduler.checkFront)
end

function CBandit:initFX()
   local name = "human_damage.sps"
   if self:getPrefabName() == "abori.cfg" or self:getPrefabName() == "hulk.cfg" then
      name = "abori_damage.sps"
   end

   if not self.bloodFX then
      self.bloodFX = self:createAspect(name)
      self.bloodFX:setLoop(false)
      self.bloodFX:getPose():setParent(self:getPose())
      self.bloodFX:getPose():resetLocalPos()
      self.bloodFX:getPose():setLocalPos({x=0,y=130,z=0})
      self.bloodFX:disable()
   end
end

function CBandit:initAnims()
   local prefabName = self:getPrefabName()

   self.turnRightAnim = "turn_right_90"
   self.turnLeftAnim  = "turn_left_90"

    if prefabName == "human_male.cfg" then
      self.idleAnims   = { "idle_machete" }
      self.attackAnims = { "melee__fire_machete", "melee__fire_machete_alt", }
      self.punchAnims  = { "melee__fire_machete" }
      self.walkAnim    = "walk_front_machete"
      self.runAnim     = "run_front_machete"
      self.aimAnim     = "idle_pistol_aim"
      self.recoilAnim  = "recoil__pistol"
      self.hurtAnim    = "hit__default"
      self.talkAnim    = "talk"
      self.dieAnim     = { "death" }
      self.fallAnim    = "jump_falling"
      self.landAnim    = "jump_land"

   elseif prefabName == "abori.cfg" then
      self.idleAnims   = { "idle_1h_weapon" }
      self.attackAnims = { "melee_idle_1h_weapon", "melee_idle_1h_weapon_1", "melee_idle_1h_weapon_2", "melee_idle_1h_weapon_3", }
      self.punchAnims  = { "melee_idle_hand_1", "melee_idle_hand_2" }
      self.walkAnim    = "walk_front"
      self.runAnim     = "run_front"
      self.hurtAnim    = "hit__front_1h_weapon"
      self.dieAnim     = { "kd_front", "kd_back" }
      self.fallAnim    = "jump_down"
      self.landAnim    = "jump_land_pistol"

   elseif prefabName == "hulk.cfg" then
      self.idleAnims   = { "idle" }
      self.punchAnims  = { "melee_idle_1", "melee_idle_2" }
      self.walkAnim    = "walk_front"
      self.runAnim     = "run"
      self.hurtAnim    = "hit__front"
      self.dieAnim     = { "death" }
   end
end

function CBandit:updateAnims()
   local prefabName = self:getPrefabName()
   local weapon = self:getWeaponSlotItem()
   if prefabName == "human_male.cfg" then
      if weapon and weapon:isRangedWeapon() then
         local weapAnimationSet = ItemsData.ItemsInfo[weapon:getItemName()].animations
         if weapAnimationSet == "shotgun" or weapAnimationSet == "carbine" then
            self.idleAnims  = { "idle_shotgun" }
            self.walkAnim   = "walk_front_shotgun"
            self.runAnim    = "run_front_shotgun"
            self.aimAnim    = "idle_shotgun_aim"
            self.recoilAnim = "recoil__shotgun_2"
            self.landAnim   = "jump_land_shotgun"
         else
            self.idleAnims  = { "idle_pistol" }
            self.walkAnim   = "walk_front_pistol"
            self.runAnim    = "run_front_pistol"
            self.landAnim   = "jump_land_pistol"
         end
         if weapAnimationSet == "shotgun" then
            self.cockAnim = "reload2__shotgun_idle"
         elseif weapAnimationSet == "carbine" then
            self.cockAnim = "reload2__carbine_idle"
         end
      end

   elseif self:getPrefabName() == "abori.cfg" then
      if weapon and weapon:isRangedWeapon() then
         local weapAnimationSet = ItemsData.ItemsInfo[weapon:getItemName()].animations
         if weapAnimationSet == "shotgun" or weapAnimationSet == "carbine" then
            self.walkAnim    = "walk_front_rifle"
            self.runAnim     = "run_front_rifle"
            self.idleAnims   = { "idle_rifle" }
            self.recoilAnim  = "recoil__idle_rifle"
            self.cockAnim    = "cock__idle_rifle"
            self.aimAnim     = "idle_rifle_aim"
            self.hurtAnim    = "hit__front_rifle"
            self.fallAnim    = "jump_down_rifle"
            self.landAnim    = "jump_land_rifle"
         else
            self.walkAnim   = "walk_front_pistol"
            self.runAnim    = "run_front_pistol"
            self.idleAnims = { "idle_pistol" }
            self.recoilAnim  = "recoil__idle_pistol"
            self.aimAnim     = "idle_pistol_aim"
            self.hurtAnim    = "hit__front_pistol"
         end
      end
   elseif self:getPrefabName() == "hulk.cfg" then
   end
end

function CBandit:OnCreate()
   CCharacter.OnCreate(self)
   self.interactor:getPose():setParent(self:findBonePose("Pelvis"))
   self.interactor:getPose():resetLocalPos()

   local loot = {}
   if self:getPrefabName() == "human_male.cfg" then
      loot["token_human.itm"] = 1
   elseif self:getPrefabName() == "abori.cfg" or self:getPrefabName() == "hulk.cfg" then
      loot["token_abori.itm"] = 2
   end

   self:initAnims()
   self:initFX()

   CBandit.initWithParams(self, { standardLoot = loot })

   self:initSenses()

   self:setGuild   ("GLD_NPC_ENEMY")
   self:addActions()

   self:idle_run()
end

function CBandit:OnStuckIn()
end

function CBandit:OnStuckOut()
end

-- Actions
function CBandit:addActions()
   local idle = CAction{}
   --idle:allowRestartOnEvent("setSense")
   idle.start = self.idle_start
   idle.stop  = self.idle_stop
   idle.name = "idle"

   local move = CAction{}
   move:allowRestartOnEvent("onChangeState")
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
function CBandit:alive_()
   if (not self.senseScheduler:getCurEnemy()) or (not objInDist(self:getPose():getPos(), self.senseScheduler:getCurEnemy():getPose():getPos(), self.parameters.backViewDist/3)) then
      self:setState("panic", false)
   end

   return not self:getState("dead")
end

function CBandit:move_()
   return self:getState("move") and not self:getState("disableMove") and self.parameters.zoneSize ~= 0
end

function CBandit:chase_()
   if self:getState("blockAttack") or self:getState("panic") or self:getState("disableMove") then
      return false
   end

   if self.senseScheduler:getSense("enemyDetect") then
      self:setState("chase", true)
      return true
   end

   return false
end

function CBandit:attack_()
   if self:getState("blockAttack") or self:getState("panic") then
      return false
   end
   if self.senseScheduler:getSense("enemyClose") then
      self:setState("attack", true)
      return true
   end

   return false
end

function CBandit:panic_()
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

function CBandit:damage_()
   return self:getState("damage")
end

function CBandit:search_()
   return self:getState("search")
end


-- Callbacks
-- ----------------------------- IDLE ----------------------------------------------------
function CBandit:idle_run()
   if self:getState("chase") or self:getState("panic") then
      return
   end

   self:setState("idle", true)
   self:setState("move", false)
end

function CBandit:idle_start()
   self.animationsManager:playCycle(self.idleAnims[1])

   runTimer(random.random() * 2, self, self.move_run, false)
end

function CBandit:idle_stop()
   self:setState("idle", false)
end

-- ----------------------------- MOVE ----------------------------------------------------
function CBandit:move_run()
   if self:getState("chase") or self:getState("panic") or self:getState("blockAttack") then
      return
   end

   self:setState("move", true)
   self:setState("idle", false)
end

function CBandit:move_start()
   if self:getState("swimming") then
      self:setOrientationSpeed(40)
      self:setMoveSpeed       (self.walkSpeed/2)
   else
      self:setOrientationSpeed(80)
      self:setMoveSpeed       (self.walkSpeed)
   end

   self.animationsManager:playCycle(self.walkAnim)

   runTimer(random.random() * 4, self, self.idle_run, false)

   if not self.senseScheduler:getSense("inZone") then
      self:setOrientation(getTargetAngleDir(self, self.senseScheduler:getCurZone()))
   else
      self:setOrientationFull(random.random() * 360)
   end
end

function CBandit:move_stop()
   self:setMoveSpeed(0)
   self:setOrientationSpeed(0)

   self:setState("move", false)
end

-- ----------------------------- CHASE ----------------------------------------------------
function CBandit:chase_start()
   if self:getState("swimming") then
      self:setOrientationSpeed(200)
      self:setMoveSpeed       (self.runSpeed/2)
   else
      self:setOrientationSpeed(400)
      self:setMoveSpeed       (self.runSpeed)
   end
   self.animationsManager:playCycle(self.runAnim)
   self.animationsManager:subscribeAnimationEventIn(self.runAnim, "step1", self.onStepEventIn, self)
   self.animationsManager:subscribeAnimationEventIn(self.runAnim, "step2", self.onStepEventIn, self)


   if self.senseScheduler:getCurEnemy() then
      self:setTarget(self.senseScheduler:getCurEnemy(), {y=100})
   end
end

function CBandit:chase_stop()
   self:setMoveSpeed(0)
   self:setOrientationSpeed(0)
   self:resetTarget()

   self:setState("chase", false)
end

-- ----------------------------- ATTACK ----------------------------------------------------
function CBandit:attack_start()
   if not self.senseScheduler:getCurEnemy() then
      return
   end

   if self:getState("swimming") then
      self:setOrientationSpeed(100)
   else
      self:setOrientationSpeed(200)
   end

   self:setOrientation(getTargetAngleDir(self, self.senseScheduler:getCurEnemy():getPose():getPos()))
   local weapon = self:getWeaponSlotItem()
   if weapon:isMeleeWeapon() then
      local anim
      if weapon.name == "hand_to_hand.wpn" then
         anim = random.choice(self.punchAnims)
      else
         anim = random.choice(self.attackAnims)
      end

      self.animationsManager:playCycle(self.idleAnims[1])
      self.animationsManager:playAction(anim)
      self.animationsManager:subscribeAnimationEventIn(anim, "attack", self.onAttackAnimationIn, self)
      self.animationsManager:subscribeAnimationEventOut(anim, "attack", self.onAttackAnimationOut, self)
      if anim == "melee_idle_1" then
         self.animationsManager:subscribeAnimationEventIn(anim, "attack2", self.onAttack2AnimationIn, self)
         self.animationsManager:subscribeAnimationEventOut(anim, "attack2", self.onAttack2AnimationOut, self)
      end
      self.animationsManager:subscribeAnimationEnd(anim, self.onAttackAnimationEnd, self)

      --Stationary attacks
      if not anim:find("__") then
         self:setState("disableMove", true)
      end
   elseif weapon:isRangedWeapon() then
      self.animationsManager:playCycle(self.aimAnim)
      self.animationsManager:subscribeAnimationEnd(self.aimAnim, self.onAttackAnimationEnd, self)

      if self.aimTimer then self.aimTimer:stop() end
      self.aimTimer = runTimer(1, self, function(self)
         if not self:getState("dead") and not self:getState("damage") and self:getState("attack") then
            local enemy = self.senseScheduler:getCurEnemy()
            if enemy then
               local pos = enemy:getPose():getPos()
               pos.y = pos.y + 100
               self:getWeaponSlotItem():setImpactPos(pos)
            end
            self:OnItemActivateSafe(weapon)

            self.animationsManager:playAction(self.recoilAnim)

            local weapAnimationSet = ItemsData.ItemsInfo[weapon.name].animations
            if weapAnimationSet == "shotgun" or weapAnimationSet == "carbine" then
               self.animationsManager:subscribeAnimationEnd(self.recoilAnim, self.onAttackAnimationEndReload, self)
            else
               self.animationsManager:subscribeAnimationEnd(self.recoilAnim, self.onAttackAnimationEnd, self)
            end
         end
      end, false)
   end
end

function CBandit:attack_stop()
   self:setOrientationSpeed(0)
end

function CBandit:onAttackAnimationIn()
   if self:getState("search") then return end
   self:OnItemActivateSafe(self:getWeaponSlotItem())
end

function CBandit:onAttackAnimationOut()
   self:OnItemDeactivateSafe(self:getWeaponSlotItem())
end

function CBandit:onAttack2AnimationIn()
   if self:getState("search") then return end
   local weapon = self:getWeaponSlotItem()
   if weapon then
      weapon:getPose():setParent(self:getBonePose("item_slot2"))
      weapon:getPose():resetLocalPose()
      self:OnItemActivateSafe(weapon)
   end
end

function CBandit:onAttack2AnimationOut()
   local weapon = self:getWeaponSlotItem()
   if weapon then
      weapon:getPose():setParent(self:getBonePose("item_slot1"))
      weapon:getPose():resetLocalPose()
      self:OnItemDeactivateSafe(weapon)
   end
end

function CBandit:onAttackAnimationEnd()
   self:OnItemDeactivateSafe(self:getWeaponSlotItem())
   self:setState("attack", false)
   self:setState("disableMove", false)
   --self:setState("blockAttack", true)
   --runTimer(0.3, self, self.coolDown, false)
end

function CBandit:onAttackAnimationEndReload()
   self.animationsManager:playAction(self.cockAnim)
   self.animationsManager:subscribeAnimationEnd(self.cockAnim, self.onAttackAnimationEnd, self)
end

function CBandit:coolDown()
   self:setState("blockAttack", false)
end

-- ----------------------------- PANIC ----------------------------------------------------
function CBandit:panic_start()
   self:setOrientation(getTargetAngle(self, self.senseScheduler:getCurEnemy():getPose():getPos())+180)

   if self:getState("swimming") then
      self:setMoveSpeed(self.runSpeed * 1.5/2)
   else
      self:setMoveSpeed(self.runSpeed * 1.5)
   end
   self.animationsManager:playCycle(self.runAnim)
end

function CBandit:panic_stop()
   self:setMoveSpeed(0)
end

-- ----------------------------- DAMAGE ----------------------------------------------------
function CBandit:damage_start()
   self.bloodFX:play()
   if self.animationsManager.currentAnimations[self.hurtAnim] then return end
   self.animationsManager:playCycle        (self.idleAnims[1])
   self.animationsManager:playAction        (self.hurtAnim)
   self.animationsManager:subscribeAnimationEnd(self.hurtAnim, self.damage_stop, self)

   if self.senseScheduler:getCurEnemy() ~= nil then
   else
      self:setState("search", true)
   end
end

function CBandit:damage_stop()
   self.animationsManager:playCycle(self.idleAnims[1])
   self:setState("damage", false)
end

-- ----------------------------- SEARCH ----------------------------------------------------
function CBandit:search_start()
   self:setOrientation(90 + random.random() * 180)

   if self:getState("swimming") then
      self:setOrientationSpeed(200)
      self:setMoveSpeed       (self.runSpeed/2)
   else
      self:setOrientationSpeed(400)
      self:setMoveSpeed       (self.runSpeed)
   end
   self.animationsManager:playCycle(self.runAnim)
   runTimer(2, self, self.searchAnimStop, false)
end

function CBandit:search_stop()
   self:setMoveSpeed(0)
end

function CBandit:searchAnimStop()
   self:setOrientationSpeed(0)
   self:setState("search", false)
end

-- ----------------------------- ANIM EVENTS ----------------------------------------------------
function CBandit:animatedEvent(eventType)
   if not CCharacter.animatedEvent(self, eventType) then return end

   if eventType == "hit" then
      self:setState("damage", true)
   elseif eventType == "land" and self.landAnim then
      self:setState("disableMove", true)
      self.animationsManager:playCycle(self.idleAnims[1])
      self.animationsManager:playAction(self.landAnim)
      local function onLandingEnd()
         self:setState("disableMove", false)
      end
      self.animationsManager:subscribeAnimationEnd(self.landAnim, onLandingEnd, self)
   elseif eventType == "die" then
      self:OnDie()
   end
end

function CBandit:OnAir()
   CCharacter.OnAir(self)
   if self.fallAnim then
      self:setState("disableMove", true)
      if self.fallTimer then
         self.fallTimer:stop()
         self.fallTimer = nil
      end

      self.fallTimer = runTimer(0.1, nil, function()
         if self:getState("inAir") then
            self.animationsManager:playCycle(self.fallAnim, 0.2)
         end
      end, false)
   end
end

function CBandit:OnLanding(landingSpeed)
   CCharacter.OnLanding(self, landingSpeed)
   if self.fallTimer then
      self.fallTimer:stop()
      self.fallTimer = nil
   end
end

function CBandit:OnItemEquip(event)
   CCharacter.OnItemEquip(self, event)
   if event.eventType == "ItemEquipped" and event.item:isRangedWeapon() then
      event.item:setEndless(true)
   end
end

function CBandit:OnItemUnequip(event)
   CCharacter.OnItemUnequip(self, event)
   if event.eventType == "ItemUnequipped" and event.item:isRangedWeapon() then
      event.item:setEndless(false)
   end
end

function CBandit:die()
   CCharacter.die(self)

   self.bloodFX:play()
end

function CBandit:OnDie()
   self:stopMove()
   self.animationsManager:stopActionsAndCycles()
   self.animationsManager:playAction(random.choice(self.dieAnim), nil, nil, true)

   local enemy = self.senseScheduler:getLastEnemy()
   if enemy then
      self:pushFrom(enemy:getPose():getPos(), 3000, 0.5, {y=180})
   end

   self:getInventory():destroyItem(self:getInventory():getSlotItem("shield"), -1, true, true)
   self:getInventory():destroyItemByName("hand_to_hand.wpn", -1, true, true)
   self.interactor:setRaycastActive(true)
end

function CBandit:getLabel()
   local label = self.customLabel or "Bandit"
   return label
end

function CBandit:getInteractLabel()
   if self:getState("dead") then
      return "loot"
   end
end

function CBandit:getLabelPos()
   local pos = CCharacter.getLabelPos(self)
   local pelvisPose = self:findBonePose("Pelvis")
   if self:getState("dead") and pelvisPose then
      pos = pelvisPose:getPos()
      pos.y = pos.y + 35
   end
   return pos
end

function CBandit:OnSaveState(state)
   CCharacter.OnSaveState(self, state)
   -- dynamic object spawned by installer
   if self.installer then
      state.pos = self:getSafePos()
      state.zoneSize = self.parameters.zoneSize
      state.customLabel = self.customLabel
      state.viewDist = self.parameters.viewDist
      state.attackDist = self.parameters.attackDist
      state.energyMaxCount = self:getStatCount("energyMax")
   end
   state.idleAnims = self.idleAnims
end

function CBandit:OnLoadState(state)
   local params = {}
   params.load = true

   if self.installer then
      if state.pos then
         self:getPose():setPos(state.pos)
      end
      params.weapons = {}
      params.lootItems = {}
      params.zoneSize = state.zoneSize
      params.customLabel = state.customLabel
      params.viewDist = state.viewDist
      params.attackDist = state.attackDist
      params.energyMaxCount = state.energyMaxCount
      self:initWithParams(params)
   end

   CCharacter.OnLoadState(self, state)

   self.parameters.attackDist = state.attackDist or self.parameters.attackDist

   if not state.dead then
      self.idleAnims = state.idleAnims or self.idleAnims
      self:idle_start()
      self:updateAnims()
   end
end

return {CBandit=CBandit}
