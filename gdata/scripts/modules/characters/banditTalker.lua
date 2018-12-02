local oo = require "loop.simple"
local CTalker = (require "characters.talker").CTalker
local CBandit = (require "characters.bandit").CBandit

---@class CBanditTalker : CBanditOld
local CBanditTalker = oo.class({}, CBandit)
local CAction = (require "action").CAction
local CNPC = (require "characters.npc").CNPC
local random = require "random"

function CBanditTalker:initWithParams(params)
   self.savedFeelRadius = loadParamNumber(self, "viewRange", 10000)
   self.senseScheduler:setFeelRadius(0)
   if self:getPrefabName() == "human_male.cfg" then
      self.idleAnims   = { loadParam(self, "idleAnim", "idle_machete") }
   elseif self:getPrefabName() == "abori.cfg" then
      self.idleAnims = { loadParam(self, "idleAnim", "idle_1h_weapon") }
   elseif self:getPrefabName() == "hulk.cfg" then
      self.idleAnims = { loadParam(self, "idleAnim", "idle") }
   end

   self.dialogInitiator     = loadParam(self, "dialogInitiator", false)
   self.dialogInitiatorDist = loadParam(self, "dialogInitiatorDist", 300)
   self.dialogState = "dialog"
   self.orientateToPlayer = true
   self.orientateSpeed = 120
end

function CBanditTalker:OnCreate()
   CBandit.OnCreate(self)
   CBanditTalker.initWithParams(self, nil)

   self.interactor:setTriggerRadius(self.dialogInitiatorDist)
   self.interactor:setTriggerActive(true)
   self.interactor:setRaycastActive(true)

   local dialogName = loadParam(self, "dialog", "")
   self.dialog = dialogSystem:createDialog(dialogName, self:getName() .. "_" .. dialogName)
   CTalker.initDialog(self)
end

function CBanditTalker:idle_start()
   self.animationsManager:playCycle(self.idleAnims[1])

   if self.aggressive then
      runTimer(random.random() * 2, self, self.move_run, false)
   end
end

function CBanditTalker:startTalk(char)
   local state = CTalker.startTalk(self, char)
   if state then
      self.animationsManager:playCycle("idle")

      CTalker.talk_start(self, char)
   end
   return state
end

function CBanditTalker:initDialog()
   CTalker.initDialog(self)
end

function CBanditTalker:stopTalk(char)
   CTalker.stopTalk(self, char)
end

function CBanditTalker:isTalkAnimAllowed()
   return CNPC.isTalkAnimAllowed(self)
end

function CBanditTalker:onStartMessage(animation)
   if self:isTalkAnimAllowed() then
      CTalker.onStartMessage(self, animation)
   end
end

function CBanditTalker:onStopMessage()
end

function CBanditTalker:setDialogInitiator(value)
   self.dialogInitiator = value
end

function CBanditTalker:isDialogInitiator()
   return self.dialogInitiator
end

function CBanditTalker:OnInteractTriggerBegin(obj)
   CTalker.OnInteractTriggerBegin(self, obj)
end

function CBanditTalker:OnHit(params)
   CBandit.OnHit(self, params)
   if not self.aggressive then
      self:turnAggressive()
   end
end

function CBanditTalker:turnAggressive(silent)
   if not self.aggressive then
      if self:getPrefabName() == "human_male.cfg" then
         self.idleAnims   = { "idle_machete" }
      elseif self:getPrefabName() == "abori.cfg" then
         self.idleAnims   = { "idle_1h_weapon" }
      elseif self:getPrefabName() == "hulk.cfg" then
         self.idleAnims   = { "idle" }
      end
      self.senseScheduler:setFeelRadius(self.savedFeelRadius)
      self.aggressive = true
      self:idle_start()
      if not silent then
         questSystem:fireEvent("turnAggressive", self:getName())
      end
      if self.talkChar and self.dialog then
         dialogSystem:stopDialog(self.dialog)
      end
   end
end

function CBanditTalker:OnDie()
   CTalker.OnDie(self)
   CBandit.OnDie(self)
end

function CBanditTalker:OnSaveState(state)
   CBandit.OnSaveState(self, state)
   state.aggressive = self.aggressive
   state.dialogInitiator = self.dialogInitiator
end

function CBanditTalker:OnLoadState(state)
   CBandit.OnLoadState(self, state)
   self.dialogInitiator = state.dialogInitiator
   if state.aggressive and not state.dead then
      self:turnAggressive(true)
   end
end

return {CBanditTalker=CBanditTalker}
