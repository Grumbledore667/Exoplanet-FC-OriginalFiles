local oo = require "loop.simple"
local CNPC = (require "characters.npc").CNPC
local SkySystem = (require "environment.sky").SkySystem
local CTime = (require "helpers").CTime

local f = require "fun"
local partial = f.partial

---@class CSwiftStrider : CNPC
local CSwiftStrider = oo.class({}, CNPC)

function CSwiftStrider:loadParameters()
   CNPC.loadParameters(self)

   self:setStatCount("health", 1)
   self.daysLeftToDie = nil
   self.daysLeftToFort = nil
end

function CSwiftStrider:OnCreate()
   CNPC.OnCreate(self)

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

function CSwiftStrider:OnInventoryChange(event)
   local item = event.item
   local itemName = item:getItemName()
   if event.eventType == "ItemAdded" and (item:isSmokable() or item:isDrink()) then
      self:setBBVar("consumeItemName", itemName)
      if item:isBooze() then
         self.drunkCallback = SkySystem:subscribeTimePassed(CTime(24, "gHour"), nil, partial(self.onSober, self))
      end
   elseif event.eventType == "ItemAdded" and itemName == "bluethorn_leaf.itm" then
      item:destroy()
      self.inventory:addItem("joint.itm")
   end
   if self:getInventory():getItemsCount() == 0 then
      self.interactor:setRaycastActive(false)
   end
end

function CSwiftStrider:_getAnimationFor(event, direction)
   local prefix = "swift_sit"
   return self.animations[prefix][event] and self.animations[prefix][event].default
end

---TODO:Think of a way to figure out dialog anims through CNPC
function CSwiftStrider:onStartMessage()
   local anim = self:getAnimationFor("talk")[1]
   self.animationsManager:playCycle(anim)
end

function CSwiftStrider:onStopMessage()
   self.animationsManager:playCycle(self.defaultAnimation)
end

function CSwiftStrider:die()
   CNPC.die(self)

   SkySystem:unsubscribeDayTime(self.fortCallback)
   self.fortCallback = nil
   SkySystem:unsubscribeDayTime(self.deathCallback)
   self.deathCallback = nil
   if self.interactorGreeting then
      self.interactorGreeting:setTriggerActive(false)
      self.interactorGreeting = nil
   end
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
   local target = getObj(getQuest("ktharsis_harsh").strider_safe)
   if isObjectTeleportSafe(self, target) then
      goToQuestStep("ktharsis_harsh", "in_fort", true)
   else
      self:activateToFort(6)
   end
end

function CSwiftStrider:onSober()
   getQuest("ktharsis_harsh"):setTopicVisible("strider_drunk", false)
end

function CSwiftStrider:OnSaveState(state)
   CNPC.OnSaveState(self, state)

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
   CNPC.OnLoadState(self, state)

   if not state.dead then
      if state.deathCbTime then
         SkySystem:unsubscribeDayTime(self.deathCallback) --Only this one could be duplicated
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

return {CSwiftStrider=CSwiftStrider}
