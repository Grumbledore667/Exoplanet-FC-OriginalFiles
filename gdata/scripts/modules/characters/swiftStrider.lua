local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CTalker = (require "characters.talker").CTalker
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local ItemsData = (require "itemsData")
local SkySystem = (require "environment.sky").SkySystem
local CTime = (require "helpers").CTime

local f = require "fun"
local partial = f.partial

---@class CSwiftStrider : CTalker
local CSwiftStrider = oo.class({}, CTalker)

function CSwiftStrider:loadParameters()
   CTalker.loadParameters(self)

   self:setStatCount("health", 1)
   self.daysLeftToDie = nil
   self.daysLeftToFort = nil

   self.smoke_fx = self:createAspect("koster_smoke.sps")
   self.smoke_fx:getPose():setParent(self:getBonePose("head_slot"))
   self.smoke_fx:getPose():resetLocalPose()
   self.smoke_fx:getPose():setLocalPos({z=-15, y=-15})
   self.smoke_fx:getPose():setLocalRotQuat(quatFromEuler({x=-90}))
   self.smoke_fx:getPose():setLocalScale({x=0.25, y=0.25, z=0.25})
   self.smoke_fx:enable()
   self.smoke_fx:stop()
end

function CSwiftStrider:OnCreate()
   CTalker.OnCreate(self)

   self:setImmortality(false)

   self.interactorGreeting = self:createAspect("interactor")

   local dummy = {}
   local function dummyBegin(_, obj)
      if obj ~= getMC() or self:getState("dead") then return end
      if getQuest("ktharsis_harsh"):isStarted() then
         if self.interactorGreeting then
            self.interactorGreeting:setTriggerActive(false)
            self.interactorGreeting = nil
         end
      else
         gameplayUI.subtitlesUI:addSubtitle("Hey you, huma... over here... You're not one of them... *coughs* Water...", 8, self)
         if not self.deathCallback then
            self:activateDeath(18)
         end
      end
   end
   dummy.OnInteractTriggerBegin = dummyBegin

   self.interactorGreeting:setObject(dummy)
   self.interactorGreeting:setTriggerRadius(1000)
   self.interactorGreeting:getPose():setParent(self:getPose())
   self.interactorGreeting:getPose():resetLocalPose()
   self.interactorGreeting:getPose():setLocalPos({x=0,y=100,z=0})
   self.interactorGreeting:setTriggerActive(true)
   self.interactorGreeting:setRaycastActive(false)
end

function CSwiftStrider:addActions()
   local idle = CAction{}
   --idle:allowRestartOnEvent("setSense")
   idle.start = self.idle_start
   idle.stop  = self.idle_stop
   idle.name  = "idle"

   local smoke = CAction{}
   --smoke:allowRestartOnEvent("setSense")
   smoke.start = self.smoke_start
   smoke.stop  = self.smoke_stop
   smoke.name  = "smoke"

   local patrol = CAction{}
   --patrol:allowRestartOnEvent("setSense")
   patrol.start = self.patrol_start
   patrol.stop  = self.patrol_stop
   patrol.name  = "patrol"

   local talk = CAction{}
   talk:allowRestartOnEvent("onChangeState")
   talk.start = self.talk_start
   talk.stop  = self.talk_stop
   talk.name = "talk"

   local root = CNode{}
   root:yes (self.talk_):no  (self.patrol_):no  (self.has_joint_):no  (idle)
   root:yes (self.talk_):no  (self.patrol_):no  (self.has_joint_):yes (smoke)
   root:yes (self.talk_):no  (self.patrol_):yes (patrol)
   root:yes (self.talk_):yes (talk)

   self.actionsScheduler.root = root
end

function CSwiftStrider:has_joint_()
   return self:hasItem("bluethorn_leaf.itm")
      -- return true
end

function CSwiftStrider:smoke_start()
   -- joint_large.sbg
   self:setHeadLookingAllowed(false)
   self.jointEntity = getScene():createEntity("joint_large.sbg", "")

   self.jointEntity:getPose():setParent(self:getBonePose("item_slot1"))
   self.jointEntity:getPose():resetLocalPose()
   -- self.jointEntity:getPose():setLocalRotQuat(quatFromEuler({x=90, y=90}))
   -- self.jointEntity:getPose():setLocalPos    ({z=-10})
   self.animationsManager:playCycle("sit_swift_smoke")
end

function CSwiftStrider:smoke_stop()
   getScene():destroyEntity(self.jointEntity)
   self.jointEntity = nil
   self.animationsManager:playCycle(self.idleAnimation)
   self:setHeadLookingAllowed(true)
end

function CSwiftStrider:OnInventoryChange(event)
   local item = event.item
   if not item or event.eventType ~= "ItemAdded" then return end
   local itemName = item:getItemName()
   local foodInfo = ItemsData.getItemFoodInfo(itemName)
   if foodInfo and (foodInfo.water or item:isBooze())then
      if item:isBooze() then
         self.drunkCallback = SkySystem:subscribeTimePassed(CTime(24, "gHour"), nil, partial(self.onSober, self))
      end
      self:setHeadLookingAllowed(false)
      self.animationsManager:playAction("sit_swift_drink")
      self.animationsManager:subscribeAnimationEnd("sit_swift_drink", self.drink_stop, self)
      local drinkModel = ItemsData.getItemModel(itemName)
      self.drinkEntity = getScene():createEntity(drinkModel, "")

      self.drinkEntity:getPose():setParent(self:getBonePose("item_slot" .. self:getWeaponSlot()))
      --         self.drinkEntity:getPose():setParent(self:getBonePose("Bip001 R Hand"))
      self.drinkEntity:getPose():resetLocalPose()
      --         self.drinkEntity:getPose():setLocalRotQuat(quatFromEuler({x=40}))
      --         self.drinkEntity:getPose():setLocalPos    ({x=10, z=-6})
      self.drinkEntity:getPose():setLocalPos({y=-16})
      runTimer(0, nil, function() self:getInventory():destroyItemByName(itemName) end, false)
   end
   if self:getInventory():getItemsCount() == 0 then
      self.interactor:setRaycastActive(false)
   end
end

function CSwiftStrider:drink_stop()
   getScene():destroyEntity(self.drinkEntity)

   self.drinkEntity = nil
   self:setHeadLookingAllowed(true)
end

function CSwiftStrider:activate(obj)
   return CCharacter.activate(self, obj)
end

function CSwiftStrider:deactivate(obj)
   return CCharacter.deactivate(self, obj)
end

function CSwiftStrider:animatedEvent(eventType)
   CCharacter.animatedEvent(self, eventType)

   if self:getHealth() == 0 and eventType ~= "die" then
      return
   end

   if eventType == "hit" then
      self:setState("damage", true)
   end
end

function CSwiftStrider:OnAnimationEventIn(animation, event)
   CCharacter.OnAnimationEventIn(animation, event)
   if event == "smoke" then
      self.smoke_fx:play()
   end
end
function CSwiftStrider:OnAnimationEventOut(animation, event)
   CCharacter.OnAnimationEventOut(animation, event)
   if event == "smoke" then
      self.smoke_fx:stop()
   end
end

function CSwiftStrider:die__()
   CCharacter.die__(self)

   self:playDeathAnimation("sit_swift_death")
end

function CSwiftStrider:die()
   CCharacter.die(self)

   SkySystem:unsubscribeDayTime(self.fortCallback)
   self.fortCallback = nil
   SkySystem:unsubscribeDayTime(self.deathCallback)
   self.deathCallback = nil
   if self.interactorGreeting then
      self.interactorGreeting:setTriggerActive(false)
      self.interactorGreeting = nil
   end
end

-- TODO: support custom dialog animations
function CSwiftStrider:onStartMessage()
   self.animationsManager:playCycle("sit_swift_talk")
end

function CSwiftStrider:onStopMessage()
   self.animationsManager:playCycle(self.idleAnimation)
end

function CSwiftStrider:onTimeStateDeath(state)
   self.daysLeftToDie = self.daysLeftToDie - 0.25
   if self.daysLeftToDie <= 0 then
      if self:getState("talk") then --prolong striders life
         self.daysLeftToDie = self.daysLeftToDie + 0.25
      else
         self:die()
      end
   end
end

function CSwiftStrider:postponeDeath(hours)
   if self.deathCallback then
      log("Strider death postponed by " .. hours .. " Hours")
      self.deathCallback.targetTime:inc(CTime(hours, "gHour"))
   end
end

function CSwiftStrider:activateDeath(hours)
   SkySystem:unsubscribeDayTime(self.deathCallback)
   local timeUnit = CTime(hours, "gHour")
   log("Activate strider death " .. timeUnit:getAs("gHour"))
   self.deathCallback = SkySystem:subscribeTimePassed(timeUnit, false, partial(self.onTimePassedDeath, self))
end

function CSwiftStrider:onTimePassedDeath(state)
   if self:getState("talk") then --prolong striders life
      self:postponeDeath(6)
   else
      self:die()
   end
end

function CSwiftStrider:deactivateDeath()
   SkySystem:unsubscribeDayTime(self.deathCallback)
   self.deathCallback = nil
end

function CSwiftStrider:activateToFort(hours)
   SkySystem:unsubscribeDayTime(self.fortCallback)
   local timeUnit = CTime(hours, "gHour")
   log("Activate strider to fort " .. timeUnit:getAs("gHour"))
   self.fortCallback = SkySystem:subscribeTimePassed(timeUnit, false, partial(self.onTimePassedToFort, self))
end

function CSwiftStrider:onTimePassedToFort()
   --delay TP if player is likely to see it
   local wp = getObj(getQuest("ktharsis_harsh").strider_safe)
   if objInDist(getPlayer():getPose():getPos(), self:getPose():getPos(), 2000)
      or objInDist(getPlayer():getPose():getPos(), wp:getPose():getPos(), 2000) then
      self:activateToFort(6)
   else
      goToQuestStep("ktharsis_harsh", "in_fort", true)
   end
end

function CSwiftStrider:onSober()
   getQuest("ktharsis_harsh"):setTopicVisible("strider_drunk", false)
end

function CSwiftStrider:OnSaveState(state)
   CCharacter.OnSaveState(self, state)

   if self.deathCallback then
      state.deathCbTime = self.deathCallback.targetTime:getAs("gSecond")
   end
   if self.fortCallback then
      state.fortCbTime = self.fortCallback.targetTime:getAs("gSecond")
   end
   if self.drunkCallback then
      state.drunkCbTime = self.drunkCallback.targetTime:getAs("gSecond")
   end
end

function CSwiftStrider:OnLoadState(state)
   CCharacter.OnLoadState(self, state)

   if not state.dead then
      if state.deathCbTime then
         self.deathCallback = SkySystem:subscribeDayTime(CTime(state.deathCbTime, "gSecond"), false, partial(self.onTimePassedDeath, self))
      end
      if state.fortCbTime then
         self.fortCallback = SkySystem:subscribeDayTime(CTime(state.fortCbTime, "gSecond"), false, partial(self.onTimePassedToFort, self))
      end
      if state.drunkCbTime then
         self.drunkCallback = SkySystem:subscribeDayTime(CTime(state.drunkCbTime, "gSecond"), false, partial(self.onSober, self))
      end
   end
end

function CSwiftStrider:getLabel()
   return "Swift Strider"
end

return {CSwiftStrider=CSwiftStrider}
