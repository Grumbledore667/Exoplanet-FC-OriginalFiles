local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CNPC = (require "characters.npc").CNPC
local CNavigator = require "navigator"
local ai = require "ai"

local random = require "random"
local hlp = require "helpers"

---@class CArphant : CCharacter
local CArphant = oo.class({}, CCharacter)

function CArphant:OnCreate(params)
   CCharacter.OnCreate(self, params)

   self:initSenses()

   self:initFX()

   self:setGuild("GLD_ANIMAL")

   local tree = loadParam(self, "tree", "ai.trees.arphant")
   self:createTree(tree)
end

function CArphant:init()
   self.navigator = CNavigator{owner = self}

   CCharacter.init(self)
end

function CArphant:getDefaultParametersBeforeNpcData()
   local parameters = CCharacter.getDefaultParameters(self)
   parameters.attitudeToMainCharacter = "NEUTRAL"

   parameters.immortality = false
   parameters.maxLandingSpeed  = 1800

   parameters.orientationSpeed = 120
   parameters.feelRadiusCutoff = 2000
   parameters.viewDist         = 1000
   parameters.viewAngle        = 180
   parameters.backViewDist     = 400
   parameters.warnDist         = 600
   parameters.attackDist       = 380
   parameters.attackAngle      = 100
   parameters.zoneSize         = 1500

   parameters.healthMax        = 1500
   return parameters
end

function CArphant:getDefaultParameters()
   return CNPC.getDefaultParameters(self)
end

function CArphant:loadParameters()
   CCharacter.loadParameters(self)

   self.headLookingLimits = {x=10, y=45, z=0}

   getScene():subscribeOnLocationEnter(self.navigator.loadOwnerParameters, self.navigator)

   self:setImmortality(loadParam(self, "immortality", "immortal"))
   self.senseScheduler:setFeelRadius(loadParamNumber(self, "feelRadiusCutoff"))

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

function CArphant:setupTimers(freq)
   self:stopTimers()

   self.senseScheduler.timer = runTimer(freq, self.senseScheduler, self.senseScheduler.OnIdle, true)
   self.behaviorTreeTimer    = runTimer(freq, self, ai.utils.ticker, true)
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

function CArphant:initFX()
   if not self.fx then
      self.fx = {}
      self.bloodFX = self:createAspect("kab_blood1.sps")
      self.bloodFX:setLoop(false)
      self.bloodFX:getPose():setParent(self:getBonePose("item_slot1"))
      self.bloodFX:getPose():resetLocalPos()
      self.bloodFX:disable()

      self.bloodFX2 = self:createAspect("kab_blood2.sps")
      self.bloodFX2:setLoop(false)
      self.bloodFX2:getPose():setParent(self:getBonePose("item_slot1"))
      self.bloodFX2:getPose():resetLocalPos()
      self.bloodFX2:disable()
   end
end

function CArphant:hit(damage, charAttacker, direction)
   if random.random() < 0.2 then
      self:setState("damage", true)
   end
   CCharacter.hit(self, damage, charAttacker, direction)
   self.bloodFX:play()
end

function CArphant:OnHit(params)
   local player = getMC()
   local charAttacker = params.impactor:getObject()
   if charAttacker == player and not self:isEnemy(player) and self:isDamageAllowed(charAttacker) then
      self:setAttitudeToMainCharacter("ENEMY")
      questSystem:fireEvent("turnAggressive", self:getName(), self)
   end
   CCharacter.OnHit(self, params)
end

function CArphant:die__()
   CCharacter.die__(self)

   self:playDeathAnimation(self:getAnimationFor("death"))
end

function CArphant:die()
   CCharacter.die(self)

   self:getInventory():destroyItem(self.weapon, -1, true, true)
   self:getInventory():destroyItem(self.weapon2, -1, true, true)

   if self:getInventory():getItemsCount() ~= 0 then
      self.interactor:setRaycastActive(true)
   end
end

function CArphant:getAnimationFor(event, direction)
   if event == "walk" then
      return self.animations.walk.front.default
   elseif event == "run" then
      return self.animations.run.front.default
   elseif event == "idle" then
      return self.animations.idle.default
   elseif event == "idle_neutral" then
      return self.animations.idle.default
   elseif event == "idle_attack" then
      return self.animations.idle.default
   elseif event == "attack" then
      return self.animations.idle.attack.default
   elseif event == "hit" then
      return self.animations.hit.default
   elseif event == "death" then
      return self.animations.die.default
   end
end

function CArphant:getWalkSpeed()
   return 113
end

function CArphant:getRunSpeed()
   return 300
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

   if self.installer then
      state.pos = self:getPose():getPos()
      state.orientationGlobal = self:getOrientationGlobal()
   end

   self.navigator:OnSaveState(state)
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

   self.weapon = nil
   self.weapon2 = nil
   if not state.dead then
      self:addWeapon()
   end

   self.navigator:OnLoadState(state)
end

return { CArphant=CArphant }
