local oo              = require "loop.simple"
local CCharacter      = (require "character").CCharacter
local CNavigator      = require "navigator"
local CInventoryBase  = require "inventoryBase"
local ItemsLists      = (require "itemsLists")
local ObjectsLabels   = (require "objectsLabels")
local npcData         = require "npcData"
local SkySystem       = (require "environment.sky").SkySystem

local random          = require "random"
local hlp             = require "helpers"
local CTime           = hlp.CTime

local stringx         = require "pl.stringx"
local tablex          = require "pl.tablex"

local f               = require "fun"
local partial         = f.partial

local ai              = require "ai"
local coro            = require "coroutines.helpers"

---@class CNPC : CCharacter
local CNPC = oo.class({}, CCharacter)

function CNPC:OnCreate(params)
   CCharacter.OnCreate(self, params)
   self.defaultOrientationGlobal = self:getOrientationGlobal()

   self.interactor:getPose():setParent(self:findBonePose("Pelvis"))
   self.interactor:getPose():resetLocalPos()

   self:initSenses()
   self:initFX()

   local guild = loadParam(self, "guild", "GLD_NPC_FRIEND")
   self:setGuild(guild)

   local tree = loadParam(self, "tree", "ai.trees.npc")
   self:createTree(tree)

   self.allowOnLanding = false
end

function CNPC:init()
   self.navigator = CNavigator{owner = self}

   CCharacter.init(self)
end

function CNPC:initSenses()
   self.senseScheduler:addPlayerDetectSense()
   self.senseScheduler:addDistanceSense("playerInDialogDistance", "player", "dialogInitiatorDist")
   self.senseScheduler:addSense("inZone", false, self.senseScheduler, self.senseScheduler.checkZone)
end

function CNPC:initFX()
   local prefabName = self:getPrefabName()
   local name = "human_damage.sps"
   if prefabName == "abori.cfg" or prefabName == "hulk.cfg" then
      name = "abori_damage.sps"
   end

   if not self.bloodFX then
      self.bloodFX = self:createAspect(name)
      self.bloodFX:setLoop(false)
      self.bloodFX:getPose():setParent(self:getPose())
      self.bloodFX:getPose():resetLocalPos()
      self.bloodFX:getPose():setLocalPos(vec3New{y=130})
      self.bloodFX:disable()
   end

   if not self.smokeFX and (prefabName == "human_male.cfg" or prefabName == "abori.cfg")  then
      self.smokeFX = hlp.createJointSmokingEmitterAspect(self)
   end
end

function CNPC:loadDynamicParameters(params)
   CCharacter.loadDynamicParameters(self, params)
   if params.weapons then
      self.parameters.weaponList = table.concat(params.weapons, ",")
   end

   self.lootItems = params.lootItems

   if params.styles then
      self.parameters.style = random.choice(params.styles)
   end

   local keys = {
      "customLabel",
      "zoneSize",
      "feelRadiusCutoff",
      "viewDist",
      "attackDist",
      "energyMax",
      "healthMax",
      "patrolPoints",
      "patrolAllowed",
      "patrolLoop",
   }
   for _, key in pairs(keys) do
      self.parameters[key] = params[key]
   end
end

function CNPC:getDefaultParametersBeforeNpcData()
   local parameters = CCharacter.getDefaultParameters(self)
   parameters.dialogInitiatorDist = 300
   parameters.orientationSpeed    = 300 -- used in CCharacter:OnCreate
   parameters.maxLandingSpeed     = 1000
   parameters.weaponSlotId        = 1
   parameters.zoneSize            = 1000

   parameters.feelRadiusCutoff    = 2000

   parameters.viewDist            = 1500 -- params for enemyDetect sense
   parameters.backViewDist        = 400
   parameters.viewAngle           = 180

   parameters.attackDist          = 170 -- params for enemyClose sense
   parameters.attackAngle         = 100 -- params for enemyFront

   parameters.healthMax           = 200
   parameters.energyMax           = 0

   parameters.knockoutHealthPercent = 10

   return parameters
end

function CNPC:getDefaultParameters()
   local parameters = self:getDefaultParametersBeforeNpcData()

   if self:isManaged() then
      local name = self:getName()
      local charData = npcData.getDataFor(name)
      if charData then
         parameters = tablex.union(parameters, charData)
      end
   end

   return parameters
end

function CNPC:loadParameters()
   CCharacter.loadParameters(self)

   getScene():subscribeOnLocationEnter(self.navigator.loadOwnerParameters, self.navigator)

   local dialogName = loadParam(self, "dialog", self:getName())
   if self:isManaged() and dialogName ~= false then
      local uniqueName = string.format("%s_%s", self:getName(), dialogName)
      self.dialog = dialogSystem:createDialog(dialogName, uniqueName)
      self:setDialogInitiator(loadParam(self, "dialogInitiator", false))
      getScene():subscribeOnLocationEnter(self.initDialog, self)
   end

   self:loadTradeParams()

   self:setupAppearance(loadParam(self, "style", self:getName()))
   self.customLabel = loadParam(self, "customLabel", "")

   local weaponList = loadParamStrings(self, "weaponList", {"hand_to_hand.wpn"})
   local weaponName = random.choice(weaponList)
   local item = self:getInventory():addItem(weaponName)
   if item:isRangedWeapon() then
      item.magazine = random.random(item.magazineMax)
   end
   self:getInventory():equipSlotWithItem(self:getWeaponSlot(), item.id, true)
   if self:getPrefabName() == "hulk.cfg" then
      self.parameters.attackDist = 240
      item:setDamage(35)
   end

   self.lootItems = self.lootItems or loadParamItemCounts(self, "lootItems", {})
   if loadParam(self, "defaultLoot", true) then
      if self:getPrefabName() == "human_male.cfg" then
         self.lootItems["token_human.itm"] = 1
      elseif self:getPrefabName() == "abori.cfg" or self:getPrefabName() == "hulk.cfg" then
         self.lootItems["token_abori.itm"] = 2
      end
   end

   for name, count in pairs(self.lootItems) do
      self:getInventory():addItem(name, count)
   end
   self:equipHatOnStart()
   self:equipAttireOnStart()

   self:setDefaultAnimation(loadParam(self, "defaultAnimation", "idle"))

   local healthMax = loadParamNumber(self, "healthMax", 200)
   local energyMax = loadParamNumber(self, "energyMax", 0)
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

   self:setImmortality(loadParam(self, "immortality", "immortal"))

   self:setState("shouldFearEnemy", loadParam(self, "shouldFearEnemy", false))
   self:setState("knockoutBeforeDeath", loadParam(self, "knockoutBeforeDeath", false))
   self:setKnockout(loadParam(self, "knockout", false))

   -- log(self.parameters, {depth=5})
   self.senseScheduler:setFeelRadius(loadParamNumber(self, "feelRadiusCutoff"))
end

function CNPC:setOrientationGlobal(angle)
   CCharacter.setOrientationGlobal(self, angle)
   self.defaultOrientationGlobal = self:getOrientationGlobal()
end

local orientWhitelist = {
   ["human_male.cfg"] = {
      "idle","idle_2","idle_3",
      "gadget_idle",
      "bottle_idle",
      "food_idle",
      "2hm_idle",
      "2hm_idle_2",
      "idle_armcross",
      "idle_arms_on_hips",
      "idle_hurt",
      "idle_hurt_2",
      "1hm_idle",
      "1hm_idle_2",
      "pistol_idle",
      "pistol_idle_2",
      "pistol_idle_view",
      "railing_idle",
      "railing_idle_2",
      "shotgun_idle",
      "shotgun_idle_2",
      "shotgun_idle_3",
      "shotgun_idle_view",
      "idle_smoke_draw",
      "wall_idle",
      "wall_idle_armcross",
      "wall_idle_leg",
      "wall_idle_leg_2",
      "wall_idle_leg_3",
      "wall_idle_leg_armcross",
      "wall_idle_leg_armcross_2",
      "wall_idle_leg_armcross_3",
      "wall_idle_leg_armcross_4",
   },
   ["abori.cfg"] = {
      "idle","idle_2","idle_3","idle_4","idle_5",
      "bag_idle",
      "bag_1hm_idle",
      "idle_look",
      "pistol_idle",
      "rifle_idle",
      "idle_smoke_draw",
      "1hm_idle",
   },
   ["space_biker.cfg"] = {
      "idle","idle_2",
   }
}

function CNPC:isOrientAllowedFor(anim)
   local whitelist = orientWhitelist[self:getPrefabName()]
   if whitelist and tablex.find(whitelist, anim) then
      return true
   end
   return false
end

function CNPC:setDefaultAnimation(animation)
   if animation and animation ~= "" then
      if self:getAnimDuration(animation) > 0 then
         self.defaultAnimation = animation
         self:refreshOrientateToPlayerFlag()
      else
         local template = "ERROR: trying to set default animation '%s' which character model %s of class %s lacks"
         log(string.format(template, animation, self:getPrefabName(), self:getScriptClass()))
      end
   end
end

function CNPC:refreshOrientateToPlayerFlag()
   local orient = loadParam(self, "orientateToPlayer", true)
   orient = orient and self:isOrientAllowedFor(self.defaultAnimation)
   self:setState("orientateToPlayer", orient)
end

local function loadListHelper(self, paramName, fallback)
   local listName = loadParam(self, paramName, fallback)
   return ItemsLists.getItemsList(listName)
end

function CNPC:loadTradeParams()
   local name = self:getName():lower()
   local fallback = name .. "_trade_inventory"
   self.tradeInventorylist = loadListHelper(self, "tradeInventory", fallback) or {}
   if tablex.size(self.tradeInventorylist) > 0 then
      self.tradeInventory = CInventoryBase{}
      self.tradeInventory:init(self)
   end

   fallback = name .. "_trade_whitelist"
   self.tradeWhitelist = loadListHelper(self, "tradeWhitelistName", fallback)

   if not self.tradeWhitelist then
      fallback = "default_trade_whitelist"
      self.tradeWhitelist = loadListHelper(self, "tradeWhitelistName", fallback) or {}
   end

   if not getScene():isLoadedGame() then
      self:obtainTradeInventory()
   end
end

function CNPC:getTradeInventory()
   return self.tradeInventory
end

function CNPC:obtainTradeInventory()
   for name, count in pairs(self.tradeInventorylist) do
      self:getTradeInventory():addItem(name, count)
   end
end

function CNPC:resetSpeed()
   self:setMoveSpeed(0)
   self:setOrientationSpeed(0)
end

---External animated damage function if damage is allowed and character is alive
function CNPC:hit(damage, charAttacker, direction)
   if random.random() < 0.7 then
      self:setState("damage", true)
   end
   CCharacter.hit(self, damage, charAttacker, direction)
   self.bloodFX:play()
end

---Affect damage numbers with armor and etc.
function CNPC:recalculateDamage(damage, charAttacker, direction)
   damage = CCharacter.recalculateDamage(self, damage, charAttacker, direction)

   --TODO:FIXME:knockoutable npcs are essentially immortal until finishers are implemented
   if self:getState("knockoutBeforeDeath") then
      local health = self:getStatCount("health")
      if damage >= health then
         damage = clamp(damage, 0, health - 1)
      end
   end

   return damage
end

---Reduces HP if the character is alive
function CNPC:takeDamage(damage, charAttacker, direction)
   damage = CCharacter.takeDamage(self, damage, charAttacker, direction)

   if not damage then return end

   --Knockout is initiated if hp is under certain threshold
   if self:getState("knockoutBeforeDeath") and self:getStatPercent("health") < self.parameters.knockoutHealthPercent then
      self:setKnockout(true, 10)
   end

   return damage
end

function CNPC:die__()
   CCharacter.die__(self)

   self:playDeathAnimation(self:getAnimationFor("death"))
end

function CNPC:die()
   CCharacter.die(self)
   
   self.bloodFX:play()

   self:getInventory():destroyItem(self:getInventory():getSlotItem("shield"), -1)
   self:getInventory():destroyItemByName("hand_to_hand.wpn", -1)

   if self:getInventory():getItemsCount() ~= 0 then
      self.interactor:setRaycastActive(true)
   end
end

function CNPC:animatedEvent(eventType, direction)
   if eventType == "hit" then
      self:setBBVar("hitAnimation", self:getAnimationFor("hit", direction) or "")
   end
end

function CNPC:OnItemEquip(event)
   CCharacter.OnItemEquip(self, event)
   if event.eventType == "ItemEquipped" and event.item:isRangedWeapon() then
      event.item:setEndless(true)
   end
end

function CNPC:OnItemUnequip(event)
   CCharacter.OnItemUnequip(self, event)
   if event.eventType == "ItemUnequipped" and event.item:isRangedWeapon() then
      event.item:setEndless(false)
   end
end

function CNPC:OnInventoryChange(event)
   if self:getInventory():getItemsCount() == 0 then
      self.interactor:setRaycastActive(false)
   end
end

function CNPC:getWalkSpeed()
   return 105
end

function CNPC:getRunSpeed()
   return 390
end

---Start or end animated knockout for desired time. Done through a status effect.
---@param state boolean
---@param knockoutTime number | nil Sets the duration of the knockout in real seconds. nil makes the knockout endless
---@param side string Presets the knockout direction instead of randoming
function CNPC:setKnockout(state, knockoutTime, side)
   if state then
      if side then
         self:setBBVar("knockoutSide", side)
      end
      self.statusEffectsManager:addStatusEffect({name = "knockout", duration = knockoutTime, refresh = true})
   else
      self.statusEffectsManager:destroyEffectsByName("knockout")
   end
end

--region ai Actions
function CNPC:knockout_start()
   self:setHeadLookingAllowed(false)
   self:setState("talkForbidden", true)
   self:setCollisionCharacters(false)

   --Allows to preset direction
   local side = self:getBBVar("knockoutSide") or random.choice({"front", "back"})
   self:setBBVar("knockoutSide", side)

   local anims = self:getAnimationFor("knockout", side)

   self.animationsManager:playCycle(anims.idle)
   self.animationsManager:playAction(anims.to)

   questSystem:fireEvent("knockout", self:getName(), self)
end

function CNPC:knockout_finish()
   self:setKnockout(false)
   self:setState("knockoutHasToGetup", true)
end

function CNPC:knockoutGetup_running()
   local anims = self:getAnimationFor("knockout", self:getBBVar("knockoutSide"))

   self.animationsManager:playAction(anims.out)
   if self.defaultAnimation then
      self.animationsManager:playCycle(self.defaultAnimation)
   end

   coro.waitAnimationEnd(self, anims.out)
end

function CNPC:knockoutGetup_finish()
   self:setHeadLookingAllowed(true)
   self:setBBVar("knockoutSide", nil)
   self:setState("knockoutHasToGetup", false)
   self:setState("talkForbidden", false)
   self:setCollisionCharacters(true)
   local health = self:getStatCount("healthMax") * (self.parameters.knockoutHealthPercent + 5)/ 100 --5% over the threshold
   if self:getStatCount("health") < health then
      self:setStatCount("health", health)
   end

   if self.defaultAnimation then
      self.animationsManager:playCycle(self.defaultAnimation)
   end

   questSystem:fireEvent("knockout_end", self:getName(), self)
end

function CNPC:stuck_jump_running()
   self:setState("stuckJumping", true)
   self:setMoveSpeed(self:getRunSpeed())
   self:startJump(400)

   coro.wait(1) --more reliable than OnLanding
end

function CNPC:stuck_jump_finish()
   self:setState("stuckJumping", false)
   self:resetSpeed()
end

function CNPC:fall_running()
   self:setState("fallRecovery", true)
   local anim = self:getAnimationFor("fall")
   self.animationsManager:playCycle(anim, 0.2)
   self.prevPos = self:getPose():getPos()
   --Fail safe timer that will call OnLanding if it's missing or already came before this coro's waitEvent
   if not self.fallTimer then
      self.fallTimer = runTimer(0.1, nil, function()
         local pos = self:getPose():getPos()
         if tablex.deepcompare(pos, self.prevPos) then
            self.allowOnLanding = true
            self:OnLanding(0)
         end
         self.prevPos = pos
      end, true)
   end

   coro.waitEvent("OnLanding") --inAir being false is going to end this routine preemptively
end

function CNPC:fall_finish()
   -- prevent playing damaged node
   self:setState("damage", false)
end

function CNPC:fall_recovery_running()
   local anim = self:getAnimationFor("land")
   if anim and anim ~= "" then
      local idleNeutral = self:getAnimationFor("idle_neutral")
      self.animationsManager:playCycle(idleNeutral)
      self.animationsManager:playAction(anim)
      coro.waitAnimationEnd(self, anim)
   end
end

function CNPC:fall_recovery_finish()
   self:setState("fallRecovery", false)
end

local humanoidPrefabs = {
   ["human_male.cfg"] = 0.75,
   ["abori.cfg"] = 0.75,
   ["hulk.cfg"] = 0.75,
   ["nomad.cfg"] = 0.75,
   ["space_biker.cfg"] = 0.75,
}
function CNPC:aim_running()
   local enemy = self.senseScheduler:getCurEnemy()
   local enemyPrefab = enemy:getPrefabName()
   local factor = humanoidPrefabs[enemyPrefab] or 0.5
   self:setBBVar("cachedPrefabFactor", enemy:getCollisionHeight() * factor)
   self:setBBVar("enemy", enemy)
   self:setTarget(enemy)
   self:setOrientationSpeed(300)
   local cooldown = math.max(self:getWeaponSlotItem():getCooldown(), 0.5)
   self.animationsManager:playCycle(self:getAnimationFor("aim"), cooldown)
   coro.wait(cooldown)
end

function CNPC:aim_finish()
   self:resetTarget()
   self:setOrientationSpeed(0)
end

function CNPC:shoot_running()
   local gun = self:getWeaponSlotItem()
   local enemy = self.senseScheduler:getCurEnemy()
   local pos = enemy:getPose():getPos()
   pos.y = pos.y + self:getBBVar("cachedPrefabFactor")
   gun:setImpactPos(pos)
   self:OnItemActivateSafe(gun)
   local recoilAnimation, cockAnimation
   recoilAnimation, cockAnimation = unpack(getWords(self:getAnimationFor("recoil")))
   self.animationsManager:playAction(recoilAnimation)
   coro.waitAnimationEnd(self, recoilAnimation)
   self:OnItemDeactivateSafe(gun)
   cockAnimation = cockAnimation or self:getAnimationFor("cock")
   if cockAnimation and cockAnimation ~= "" then
      self.animationsManager:playAction(cockAnimation)
      coro.waitAnimationEnd(self, cockAnimation)
   end
   coro.wait(gun:getCooldown())
end

function CNPC:trackTarget_start()
   local function getVerticalAngle(position, targetPos)
      local targetDir = vec3Sub(targetPos, position)
      local targetDirFlat = vec3Mul(targetDir, vec3New(1, 0, 1))
      return getAngle(targetDir, targetDirFlat, crossProduct(vec3New{y=1}, self:getDirTarget()))
   end

   local maxAngle = 70
   local prefix = "Man"
   if self:getPrefabName() == "abori.cfg" then
      prefix = "Bip001"
   end
   local hlp = require "helpers"
   local spine2 = self:getBonePose(prefix .. " Spine2")
   local camSlope = 0
   local horizontalSlope = 0
   local function trackTarget()
      local target = self:getBBVar("enemy")
      local targetPos
      local multiplier = 20
      if hlp.isOperable(target) then
         targetPos = vec3Add(target:getPose():getPos(), vec3New{y=self:getBBVar("cachedPrefabFactor")})
      else
         targetPos = localPointToWorld(vec3New{z=-100}, spine2)
      end

      local horizontalAngle = getTargetAngleFlat(self, targetPos)
      local angle = getVerticalAngle(spine2:getPos(), targetPos)
      if math.abs(horizontalAngle) > 30 then
         angle = camSlope
         horizontalAngle = horizontalSlope
      end
      camSlope = mixF(camSlope, clamp(angle, -maxAngle, maxAngle), getFrameTime() * multiplier)
      horizontalSlope = mixF(horizontalSlope, horizontalAngle, getFrameTime() * multiplier)

      --Have to update bones in OnIdle, otherwise it causes weird twisting
      local y = horizontalSlope
      self.rotateBonesAngles = {
         [1] = {y=y, x=camSlope*0.2},
         [2] = {y=y, x=camSlope*0.5},
         [3] = {y=y, x=camSlope},
      }
      self.rotateBones = true
   end
   local timer = runTimerAdv(0, true, trackTarget)
   self:setBBVar("camSlopeTimer", timer)
end

function CNPC:trackTarget_finish()
   local timer = self:getBBVar("camSlopeTimer")
   if timer then
      timer:stop()
      self:setBBVar("camSlopeTimer", nil)
   end
end

function CNPC:setTargetObjPlayer_start()
   self:setTarget(getMC())
end

local function getSideExtentSpeed(angle)
   local extent = "quarter"
   local side, speed

   if math.abs(angle) > 90 then
      extent = "full"
      speed = 200
   elseif math.abs(angle) > 45 then
      speed = 150
   else
      speed = 100
   end

   if angle > 0 then
      side = "left"
   else
      side = "right"
   end
   return side, extent, speed
end

function CNPC:orientationWorker()
   local angle = self:getOrientation()

   local side, extent, speed = getSideExtentSpeed(angle)
   local speedMult = self:getBBVar("orientationMultiplier") or 1

   self:setOrientationSpeed(speed * speedMult)
   self:setAnimSpeed(speedMult)

   if extent ~= "full" then
      self.animationsManager:playCycle(self.animations.turn[side][extent])
   end
   self.animationsManager:playAction(self.animations.turn[side][extent])

   while self:getOrientation() ~= 0 do
      coro.waitNextTick()
   end
end

function CNPC:orientation_finish()
   self:setOrientationSpeed(0)
   self:setAnimSpeed(1)
   self:resetTarget()
   self:setOrientationFull(self:getOrientationFull()) -- reset getOrientation
   self.animationsManager:playCycle(self.defaultAnimation)
end

local function normalizeAngle(angle)
   local newAngle = angle
   while (newAngle <= -180) do newAngle = newAngle + 360 end
   while (newAngle > 180) do newAngle = newAngle - 360 end
   return newAngle
end

function CNPC:orientTo(obj)
   local relativeAzimuth = getTargetAngleFlat(self, obj:getPose():getPos())
   self:setBBVar("defaultAzimuth", normalizeAngle(relativeAzimuth + self:getOrientationFull()))
end

function CNPC:talkToPlayer_start()
   getPlayer():startTalk(self)
   self:setState("activate", false)
   self:setState("inDialog", true)
   if self:isDialogInitiator() then
      self.dialog.initiator = self
   end
end

function CNPC:inDialog_start()
   dialogSystem:playDialog(self.dialog)
end

function CNPC:consumeItem_running()
   local itemName = self:getBBVar("consumeItemName")
   local item = self:getInventory():getItemByName(itemName)
   self:setHeadLookingAllowed(false)

   local slotName = "item_slot1" --default right hand
   local action
   if item:isFood() then
      action = "eat"
   elseif item:isDrink() then
      action = "drink"
   elseif item:isSmokable() then
      action = "smoke"
   end

   local animation = self:getAnimationFor(action)
   if animation and animation ~= "" then
      self.animationsManager:playAction(animation)

      coro.waitAnimationEventIn(self, animation, "spawn_item")

      local consumeEntity = hlp.spawnConsumeEntity(item, self:getBonePose(slotName))
      self:setBBVar("consumeEntity", consumeEntity)

      coro.waitAnimationEventIn(self, animation, "buff_apply")

      self:applyItemEffects(item)
      if action == "smoke" and self.smokeFX then
         self.smokeFX:play()
      end
      local interval = self:getAnimationEventInterval(animation, "item_change")
      if interval[1] ~= -1 then
         coro.waitAnimationEventIn(self, animation, "item_change")
         consumeEntity:setVisible(false)
      end
      coro.waitAnimationEnd(self, animation)
   else
      self:applyItemEffects(item)
   end

   item:destroy()
end

function CNPC:consumeItem_finish()
   if self.smokeFX then
      self.smokeFX:stop()
   end
   self:setHeadLookingAllowed(true)
   self:setBBVar("consumeItemName", nil)
   hlp.safeDestroyEntity(self:getBBVar("consumeEntity"))
   self:setBBVar("consumeEntity", nil)
end

function CNPC:unequipWeapon_running()
   local inventory = self:getInventory()
   local animation = self:getAnimationFor("unequip")
   local unequipAnimationExists = animation and animation ~= ""
   if unequipAnimationExists then
      self.animationsManager:playAction(animation)
      coro.waitAnimationEventIn(self, animation, "unequip")
   end
   local item = inventory:unequipSlot(self:getWeaponSlot())
   self:setBBVar("lastEquippedWeapon", item)
   if unequipAnimationExists then
      coro.waitAnimationEnd(self, animation)
   end
end

function CNPC:unequipWeapon_finish()
end

function CNPC:reequipWeapon_running()
   ---@type CItem
   local item = self:getBBVar("lastEquippedWeapon")
   local inventory = self:getInventory()
   local animation = self.animations.equip.idle[item:getAnimations()]
   local equipAnimationExists = animation and animation ~= ""
   if equipAnimationExists then
      self.animationsManager:playAction(animation)
      coro.waitAnimationEventIn(self, animation, "equip")
   end
   inventory:equipSlotWithItem(self:getWeaponSlot(), item:getId())
   if equipAnimationExists then
      coro.waitAnimationEnd(self, animation)
   end
end

function CNPC:reequipWeapon_finish()
   self:setBBVar("lastEquippedWeapon", nil)
end

--scarecrow quest chip cutting action
function CNPC:cutOutChip_running()
   local cutChipAnimation = "idle_cut_chip"
   self.animationsManager:playAction(cutChipAnimation)
   coro.waitAnimationEnd(self, cutChipAnimation)
end
--endregion

function CNPC:getAnimationFor(...)
   local ok, anim = pcall(self._getAnimationFor, self, ...)
   if ok then
      return anim
   else
      return ""
   end
end

function CNPC:_getAnimationFor(event, direction)
   local wpn = self:getWeaponSlotItem()
   local wpnType = wpn and wpn:getAnimations()

   if event == "walk" then
      return self.animations.walk.front.default
   elseif event == "run" then
      return self.animations.run.front.default
   elseif event == "idle" then
      return self.animations.idle.default
   elseif event == "idle_neutral" then
      return self.animations.idle.default[1]
   elseif event == "idle_attack" then
      local attack = self.animations.idle[wpnType or "melee_low"]
      if not attack then
         attack = self:_getAnimationFor("idle_neutral", direction)
      end
      return attack
   elseif event == "attack" then
      local attack = self.animations.idle.attack
      return attack[wpnType or "melee_low"]
   elseif event == "unequip" then
      return self.animations.unequip.idle[wpnType]
   elseif event == "eat" then
      return self.animations.idle.eat.default
   elseif event == "drink" then
      return self.animations.idle.drink.default
   elseif event == "smoke" then
      return self.animations.idle.to.smoke
   elseif event == "aim" then
      local anim
      if wpnType then
         anim = self.animations.idle[wpnType]
      end
      if not anim then
         anim = self.animations.idle["pistol"]
      end
      return anim[#anim]
   elseif event == "recoil" then
      return self.animations.idle.attack[wpnType]
   elseif event == "cock" then
      return self.animations.idle.cock[wpnType]
   elseif event == "fall" then
      local anim = self.animations.fall and (self.animations.fall[wpnType or "default"] or self.animations.fall.default)
      return anim or ""
   elseif event == "land" then
      local anim = self.animations.land and (self.animations.land.default[wpnType or "default"] or self.animations.land.default.default)
      return anim or ""
   elseif event == "hit" then
      local animSet = wpnType and self.animations.hit[wpnType]
      local anim = animSet and animSet[direction] or self.animations.hit.default
      return anim
   elseif event == "knockout" then
      return self.animations.idle.knockout[direction]
   elseif event == "fear_idle" then
      return self.animations.idle.fear.idle
   elseif event == "death" then
      return self.animations.die.default
   end
   return ""
end

function CNPC:getRandomAnimationFor(event, direction)
   local anim = self:getAnimationFor(event, direction)
   if type(anim) == "table" then
      return random.choice(anim)
   else
      return anim
   end
end

function CNPC:initDialog()
   if self.dialog then
      self.dialog.actors[1] = getMC()

      self.dialogActors = loadParamObjects(self, "dialogActors", nil)

      if not self.dialogActors or #self.dialogActors == 0 then
         self.dialog.actors[2] = self
      else
         for _, actor in ipairs(self.dialogActors) do
            table.insert(self.dialog.actors, actor)
         end
      end
   end
end

function CNPC:startTalk(char)
   dialogSystem:subscribeOnStopDialog(self.setHasNoEnemiesOverride, self, self.hasNoEnemiesOverride)
   self:setHasNoEnemiesOverride(true)
   questSystem:fireEvent("talk_start", self:getName(), self)
   self.talkChar = char
   return true
end

function CNPC:isTalkAnimAllowed()
   if self._talkAllowed ~= nil then
      return self._talkAllowed
   end
   self._talkAllowed = true
   local weapon = self:getWeaponSlotItem()
   if tablex.search(self.style.attachments or {}, "item_slot1") or (weapon and weapon:getItemName() ~= "hand_to_hand.wpn") then
      self._talkAllowed = false
   end
   return self._talkAllowed
end

function CNPC:onStartMessage(animation)
   if not (self:isOrientAllowedFor(self.defaultAnimation) and
            self:isTalkAnimAllowed() and
            self:getState("orientateToPlayer")) then
      return
   end

   CCharacter.onStartMessage(self, animation)
end

function CNPC:onStopMessage()
end

function CNPC:onStopDialog()
   if self.dialog then
      runTimer(0, nil, function()
         dialogSystem:stopDialog(self.dialog)
      end, false)
      self.dialog.initiator = nil
   end
   self:setState("inDialog", false)
   self:setDialogInitiator(false)
   self.talkChar = nil
end

function CNPC:setupTimers(freq)
   self:stopTimers()

   self.senseScheduler.timer = runTimer(freq, self.senseScheduler, self.senseScheduler.OnIdle, true)
   self.behaviorTreeTimer    = runTimer(freq, self, ai.utils.ticker, true)
end

function CNPC:OnAir(dist)
   self.allowOnLanding = true
   CCharacter.OnAir(self, dist)
end

function CNPC:OnLanding(speed)
   if self.allowOnLanding then
      CCharacter.OnLanding(self, speed)
      self.allowOnLanding = false
      if self.fallTimer then
         self.fallTimer:stop()
         self.fallTimer = nil
      end
   end
end

function CNPC:OnIdle()
   if self.rotateBones and self.rotateBonesAngles then
      local prefix = "Man"
      if self:getPrefabName() == "abori.cfg" then
         prefix = "Bip001"
      end

      local angles = self.rotateBonesAngles

      local function rotateBone(obj, boneName, angles)
         local rot = obj:getBonePose(boneName):getLocalRotQuat()
         rot = quatRotateQuat(quatFromEuler(angles), rot)
         obj:getBonePose(boneName):setLocalRotQuat(rot)
      end
      rotateBone(self, prefix.." Spine" , angles[1])
      rotateBone(self, prefix.." Spine1", angles[1])
      rotateBone(self, prefix.." Spine2", angles[2])

      rotateBone(self, prefix.." Neck", angles[3])
      rotateBone(self, prefix.." Head", angles[3])

      rotateBone(self, prefix.." L Clavicle", angles[3])
      rotateBone(self, prefix.." R Clavicle", angles[3])

      self.rotateBones = false
      self.rotateBonesAngles = nil
   else
      CCharacter.OnIdle(self)
   end
end

function CNPC:stopTimers()
   CCharacter.stopTimers(self)

   if self.behaviorTreeTimer then
      self.behaviorTreeTimer:stop()
      self.behaviorTreeTimer = nil
   end
end

function CNPC:subscribeToStepEvents(anim)
   self.animationsManager:subscribeAnimationEventIn(anim, "step1", self.onStepEventIn, self)
   self.animationsManager:subscribeAnimationEventIn(anim, "step2", self.onStepEventIn, self)
end

function CNPC:isDialogInitiator()
   return self.dialogInitiator
end

function CNPC:setDialogInitiator(value)
   self.dialogInitiator = value
end


function CNPC:getInteractType(char)
   if self:getState("dead") then
      return "container"
   elseif self:isEnemy(char) or not self.dialog or self:getState("talkForbidden") then
      return "no_interaction"
   else
      return "talker"
   end
end

function CNPC:getLabel()
   local label = ObjectsLabels.getLabel(self:getName())

   if label == "" then
      label = self.customLabel
   end

   if label == nil or label == "" then
      label = self:getName()
      label = string.gsub(label, "%d+", "")
      label = string.gsub(label, "_", " ")
      label = stringx.strip(label)
      label = stringx.capitalize(label)
   end

   return label
end

function CNPC:getLabelPos()
   local pos = CCharacter.getLabelPos(self)
   local pelvisPose = self:findBonePose("Pelvis")
   if self:getState("dead") and pelvisPose then
      pos = pelvisPose:getPos()
      pos.y = pos.y + 35
   end
   return pos
end

function CNPC:getInteractLabel()
   if self:getState("dead") then
      return "loot"
   end

   local label = ObjectsLabels.getInteractLabel(self:getName())

   if label == "" then
      if self.dialog then
         return "talk"
      end
      return
   end

   return label
end

function CNPC:activate(char)
   if not self:isEnemy(char) and not self:getState("talkForbidden") then
      self:setState("activate", true)
   end
end

function CNPC:OnSaveState(state)
   CCharacter.OnSaveState(self, state)
   -- dynamic object spawned by installer
   if self.installer then
      state.pos = self:getSafePos()
      state.orientationGlobal = self:getOrientationGlobal()
   end
   state.defaultOrientationGlobal = self.defaultOrientationGlobal
   state.orientationDifference = self:getOrientationFull()
   state.dialogInitiator = self:isDialogInitiator()

   if self.tradeInventory then
      state.tradeInventory = self:getTradeInventory():serialize()
   end

   state.talkForbidden = self:getState("talkForbidden")

   state.knockout = self:getState("knockout")

   state.defaultAnimation = self.defaultAnimation

   self.navigator:OnSaveState(state)
end

function CNPC:OnLoadState(state)
   if self.installer then
      if state.pos then
         self:getPose():setPos(state.pos)
      end
      if state.orientationGlobal then
         self:setOrientationGlobal(state.orientationGlobal)
      end
   end
   if state.defaultOrientationGlobal then
      self.defaultOrientationGlobal = state.defaultOrientationGlobal
      self:setOrientationGlobal(self.defaultOrientationGlobal)
   end
   if state.orientationDifference then
      self:setOrientationDifference(state.orientationDifference)
   end

   CCharacter.OnLoadState(self, state)

   if state.tradeInventory then
      self:getTradeInventory():destroyAllItems()
      self:getTradeInventory():deserialize(state.tradeInventory)
   end
   self:setDialogInitiator(state.dialogInitiator)

   if state.defaultAnimation then
      self:setDefaultAnimation(state.defaultAnimation)
   end

   self:setState("talkForbidden", state.talkForbidden)
   self:setState("knockout", state.knockout)

   self.navigator:OnLoadState(state)
end

return {
   CNPC=CNPC,
   _testCNPC=CNPC,
}
