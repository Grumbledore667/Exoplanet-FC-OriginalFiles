local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CTalker = (require "characters.talker").CTalker

---@class COldOutcast : CTalker
local COldOutcast = oo.class({}, CTalker)

function COldOutcast:OnCreate()
   CTalker.OnCreate(self)
   self:setFeelRadius(600)
   self.dialogState = "subtitles"
   self.subtitles = {"Ugh... Oh..."}
end

function COldOutcast:startTalk(char)
   questSystem:fireEvent("talk_start", self:getName(), self)
   return CTalker.startTalk(self, char)
end

function COldOutcast:patrol_()
   return self:getState("patrol") and self:getState("waitsPlayer") and not self:fear_() and not self:getState("pausePatrol") and self:getState("nearPlayer")
end

function COldOutcast:fear_()
   return next(self.senseScheduler.enemies) or next(self.senseScheduler.ignores)
end

function COldOutcast:doFear(char)
   return getMC():isEnemy(char)
end

function COldOutcast:OnVisualIn(char)
   if not char:getState("dead") then
      CTalker.OnVisualIn(self, char)
      if char == getMC() then
         self:setState("nearPlayer", true)
      end
      if self:getState("waitsPlayer") then
         if self:doFear(char) then
            self:patrol_stop()
            self.idleAnimation = "fear"
            self:idle_start()
            gameplayUI.subtitlesUI:addSubtitle("Aaah!", 1, self)
            self.subtitles = {"Don't let them get me!"}
         elseif char == getMC() then
            if not self:fear_() and not self:getState("pausePatrol") then
               self.idleAnimation = "idle"
               self:startMoveNextPoint()
               self.subtitles = {"We've gotta keep moving, huma."}
            end
         end
      end
   end
end

function COldOutcast:OnVisualOut(char)
   CTalker.OnVisualOut(self, char)
   if char == getMC() then
      self:setState("nearPlayer", false)
   end
   if self:getState("waitsPlayer") then
      if self:doFear(char) then
         if not self:fear_() then
            self.idleAnimation = "idle"
            if self:getState("nearPlayer") then
               self:startMoveNextPoint()
            end
         end
      elseif char == getMC() then
         self:patrol_stop()
      end
   end
end

function COldOutcast:pausePatrol(time)
   self:setState("pausePatrol", true)
   self:patrol_stop()
   runTimer(time, nil, function()
      self:setState("pausePatrol", false)
      if not self:fear_() and self:getState("nearPlayer") then
         self:startMoveNextPoint()
      end
   end, false)
end

function COldOutcast:getLabel()
   return "Old Outcast"
end

function COldOutcast:OnSaveState(state)
   CTalker.OnSaveState(self, state)
   state.waitsPlayer = self:getState("waitsPlayer")
   state.pausePatrol = self:getState("pausePatrol")
end

function COldOutcast:OnLoadState(state)
   self:setState("waitsPlayer", state.waitsPlayer)
   self:setState("pausePatrol", state.pausePatrol)
   if state.pausePatrol then
      self:pausePatrol(2)
   end

   --Tweaked copy of CTalker.OnLoadState
   CCharacter.OnLoadState(self, state)

   if state.inventory then
      self:getInventory():destroyAllItems()
      self:getInventory():deserialize(state.inventory)
   end

   if state.dead then
    self.interactor:setTriggerActive(false)
   else
      if state.patrolPoints then
         runTimer(0, nil, function ()
            self.patrolPoints = loadParamObjects({}, "patrolPoints", state.patrolPoints)
         end, false)
      end
      --outcast decides patrol in his custom feel methods
      if state.nextPatrolPoint then
         self.nextPatrolPoint = state.nextPatrolPoint
      end
      self.headLooking = state.headLooking
      self.dialogInitiator = state.dialogInitiator
      if state.dialogState then
         self.dialogState = state.dialogState
      end
      if state.subtitles then
         self.subtitles = state.subtitles
      end
      self.idleAnimation = state.idleAnimation or self.idleAnimation
      self:idle_start()
      self.patrolLoop = state.patrolLoop
   end
end

return {COldOutcast=COldOutcast}
