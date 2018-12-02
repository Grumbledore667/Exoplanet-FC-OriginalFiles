local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CInventoryBase = require "inventoryBase"
local CActionsScheduler = (require "actionsScheduler").CActionsScheduler
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local ObjectsLabels = (require "objectsLabels")
local ItemsData = (require "itemsData")
local ItemsLists = (require "itemsLists")

local random = require "random"
local tablex  = require "pl.tablex"
local stringx = require "pl.stringx"

---@class CTalker : CCharacter
local CTalker = oo.class({
   trader = true,
   dialogAnimationAllowed = true
}, CCharacter)

function CTalker:loadParameters()
   CCharacter.loadParameters(self)
   local dialogName = loadParam(self, "dialog", "")
   self.dialog = dialogSystem:createDialog(dialogName, self:getName() .. "_" .. dialogName)
   self.dialogState = "dialog"
   self.subtitles = nil

   getScene():subscribeOnLocationEnter(self.initDialog, self)

   self.labelId             = loadParam(self, "labelId", self:getName())
   self.idleAnimation       = loadParam(self, "defaultAnimation", "idle")
   self.moveAnimation       = loadParam(self, "moveAnimation", "move")
   self.turnRightAnim       = loadParam(self, "turnRightAnim", "turn_right")
   self.turnLeftAnim        = loadParam(self, "turnLeftAnim", "turn_left")
   self.orientateToPlayer   = loadParam(self, "orientateToPlayer", true)
   self.patrolActive        = loadParam(self, "patrolActive", true)
   self.patrolLoop          = loadParam(self, "patrolLoop", true)
   self.orientateSpeed      = loadParamNumber(self, "orientateSpeed", 120)
   self.patrolSpeed         = loadParamNumber(self, "patrolSpeed", 300)
   self.dialogInitiator     = loadParam(self, "dialogInitiator", false)
   self.dialogInitiatorDist = loadParam(self, "dialogInitiatorDist", 300)

   if self.parameters.tradeInventory == "" or self.parameters.tradeInventory == nil then
      self.parameters.tradeInventory = self:getName():lower() .. "_trade_inventory"
   end
   self.tradeInventorylist = ItemsLists.getItemsList(loadParam(self, "tradeInventory", "")) or {}
   if tablex.size(self.tradeInventorylist) > 0 then
      self.tradeInventory = CInventoryBase{}
      self.tradeInventory:init(self)
      if not getScene():isLoadedGame() then
         self:obtainTradeInventory()
      end
   end

   self.tradeWhitelistName  = loadParam(self, "tradeWhitelistName", self:getName():lower() .. "_trade_whitelist")
   self.tradeWhitelist      = ItemsLists.getItemsList(self.tradeWhitelistName)
   if not self.tradeWhitelist then
      self.tradeWhitelistName = "default_trade_whitelist"
      self.tradeWhitelist = ItemsLists.getItemsList(self.tradeWhitelistName)
   end

   self:setupAppearance(loadParam(self, "style", self:getName()))

   getScene():subscribeOnLocationEnter(self.initPatrolPoints, self)

   self.senseScheduler:setFeelRadius(700)
   self.parameters.viewAngle = 120
end

function CTalker:initPatrolPoints()
   self.patrolPoints = loadParamObjects(self, "patrolPoints", nil)

   if self.patrolPoints and #self.patrolPoints > 0 and self.patrolActive then
      self.nextPatrolPoint = 1
      self:startMoveNextPoint()
   end
end

function CTalker:getTradeInventory()
   return self.tradeInventory
end

function CTalker:obtainTradeInventory()
   for name, count in pairs(self.tradeInventorylist) do
      self:getTradeInventory():addItem(name, count)
   end
end

function CTalker:isDialogInitiator()
   return self.dialogInitiator
end

function CTalker:setDialogInitiator(value)
   self.dialogInitiator = value
end

function CTalker:subscribeToStepEvents(anim)
   self.animationsManager:subscribeAnimationEventIn(anim, "step1", self.onStepEventIn, self)
   self.animationsManager:subscribeAnimationEventIn(anim, "step2", self.onStepEventIn, self)
end

function CTalker:initDialog()
   if self.dialog then
      self.dialog.actors[1] = getMC()

      self.dialogActors = loadParamObjects(self, "dialogActors", nil)

      if not self.dialogActors or #self.dialogActors == 0 then
         self.dialog.actors[2] = self
      else
         for i=1,#self.dialogActors do
            self.dialog.actors[1+i] = self.dialogActors[i]
         end
      end

      for i=1,#self.dialog.actors do
         local actorLabel = "actor" .. (i-1)

         if i == 1 then
            actorLabel= "player"
         end
      end
   end
end

function CTalker:OnCreate()
   CCharacter.OnCreate(self)

   self.tradeInventory = CInventoryBase{ trade = true }
   self.tradeInventory:init(self)

   self.interactor:setTriggerRadius(self.dialogInitiatorDist)
   self.interactor:setTriggerActive(true)
   self.interactor:setRaycastActive(true)

   self:setGuild("GLD_NPC_FRIEND")

   self:addActions()
   self:idle_run()
   self:setImmortality("immortal")
end

function CTalker:OnInteractTriggerBegin(obj)
   if self:isDialogInitiator() and obj == getMC() and not getMC():getState("talk") then
      obj:startTalk(self)
      self:setDialogInitiator(false)
      self.dialog.initiator = self
   end
end

function CTalker:OnDestroy()
   CCharacter.OnDestroy(self)
end

function CTalker:OnDie()
   if self.talkChar and self.dialog then
      dialogSystem:stopDialog(self.dialog)
   end
end

-- Actions

function CTalker:addActions()
   local idle = CAction{}
   --idle:allowRestartOnEvent("setSense")
   idle.start = self.idle_start
   idle.stop  = self.idle_stop
   idle.name  = "idle"

   local patrol = CAction{}
   --patrol:allowRestartOnEvent("setSense")
   patrol.start = self.patrol_start
   patrol.stop  = self.patrol_stop
   patrol.name  = "patrol"

   local talk = CAction{}
   talk.start = self.talk_start
   talk.stop  = self.talk_stop
   talk.name = "talk"

   local root = CNode{}
   root:yes (self.talk_):no  (self.patrol_):no  (idle)
   root:yes (self.talk_):no  (self.patrol_):yes (patrol)
   root:yes (self.talk_):yes (talk)

   self.actionsScheduler.root = root
end

-- ---------------------------------------------------------------------------------------
-- Actions' Predicates and Callbacks
-- ----------------------------- TALK ----------------------------------------------------
function CTalker:talk_()
   return self:getState("talk")
end

function CTalker:talk_start()
   if not self.talkChar then
      return
   end

   if self.orientateToPlayer then
      self:orientTo(self.talkChar)
   end

   dialogSystem:playDialog(self.dialog)
end

function CTalker:talk_stop()
   if not self.talkChar then
      return
   end

   if self.orientateToPlayer then
      local angle = -self:getOrientationFull()

      if math.abs(angle) > 30 then
         if angle < 0 then
            self.animationsManager:playAction(self.turnRightAnim)
         else
            self.animationsManager:playAction(self.turnLeftAnim)
         end
      end

      self:setOrientationFull (0)
      self:setOrientationSpeed(self.orientateSpeed)
   end

   self.talkChar = nil

   dialogSystem:stopDialog(self.dialog)
end

-- ----------------------------- IDLE ----------------------------------------------------
function CTalker:idle_run()
   self:setState("idle", true)
end

function CTalker:idle_start()
   self.animationsManager:playCycle(self.idleAnimation)
end

function CTalker:idle_stop()
   self:setState("idle", false)
end


-- ----------------------------- PATROL ----------------------------------------------------
function CTalker:patrol_()
   return self:getState("patrol")
end

function CTalker:patrol_start()
   self.animationsManager:playCycle(self.moveAnimation)
   self:subscribeToStepEvents(self.moveAnimation)
   self:setOrientationSpeed(self.orientateSpeed)
end

function CTalker:patrol_stop()
   self:setMoveSpeed(0)
   self:resetTarget()
   self:setState("patrol", false)
end

function CTalker:startMoveNextPoint()
   if self.nextPatrolPoint then
      self:setState("patrol", true)
      self:setTarget(self.patrolPoints[ self.nextPatrolPoint ], {})
      self:setMoveSpeed(self.patrolSpeed)
   else
      self:setState("patrol", false)
   end
end

function CTalker:OnTriggerEnter(trigger)
   CCharacter.OnTriggerEnter(self, trigger)

   local index = self:isWaypoint(trigger)

   if index and index == self.nextPatrolPoint then
      self.nextPatrolPoint = self.nextPatrolPoint + 1

      if self.nextPatrolPoint > #self.patrolPoints then
         if self.patrolLoop then
            self.nextPatrolPoint = 1
         else
            self.nextPatrolPoint = nil
         end
      end

      self:startMoveNextPoint()
   end
end

function CTalker:isWaypoint(object)
   if self.patrolPoints then
      for i=1,#self.patrolPoints do
         if self.patrolPoints[i] == object then
            return i
         end
      end
   end

   return nil
end

-- ----------------------------- ANIM EVENTS ----------------------------------------------------
function CTalker:animatedEvent(eventType)
   if not CCharacter.animatedEvent(self, eventType) then return end

   if eventType == "hit" then
      self:setState("damage", true)
   elseif eventType == "die" then
      self:stopMove()
      self:OnDie()
      self.animationsManager:stopActionsAndCycles()
      self.animationsManager:playAction("death", nil, nil, true)
   end
end

-- ---------------------------------------------------------------------------------------
-- Dialogs
-- ---------------------------------------------------------------------------------------
function CTalker:startTalk(char)
   if self:getState("dead") or not self.dialog or self.dialogState ~= "dialog" then
      if self.dialogState == "subtitles" and self.subtitles then
         gameplayUI.subtitlesUI:addSubtitle(random.choice(self.subtitles), 4, self)
      end
      return false
   end
   self.talkChar = char
   self:setState("talk", true)

   dialogSystem:subscribeOnStopDialog(self.setHasNoEnemiesOverride, self, self.hasNoEnemiesOverride)
   self:setHasNoEnemiesOverride(true)
   return true
end

function CTalker:stopTalk(char)
   self:setState("talk", false)
end

function CTalker:onStopDialog()
   self:stopTalk(self.talkChar)
   self.dialog.initiator = nil
end

-- ---------------------------------------------------------------------------------------
-- Interactions
-- ---------------------------------------------------------------------------------------
function CTalker:activate(obj)
   self.patrolActive = true
   self.nextPatrolPoint = 1
   self:startMoveNextPoint()
   return true
end

function CTalker:deactivate(obj)
   return true
end

function CTalker:getLabel()
   local label = ObjectsLabels.getLabel(self.labelId)

   if label == "" then
      label = self:getName()
      label = string.gsub(label, "%d+", "")
      label = string.gsub(label, "_", " ")
      label = stringx.strip(label)
      label = stringx.capitalize(label)
   end

   return label
end

function CTalker:getInteractLabel()
   local label = ObjectsLabels.getInteractLabel(self.labelId)

   if label == "" then
      label = "talk"
   end

   return label
end

function CTalker:getInteractTime(interactType)
   return 0
end

function CTalker:OnSaveState(state)
   CCharacter.OnSaveState(self, state)

   state.headLooking = self.headLooking
   state.dialogInitiator = self.dialogInitiator
   state.nextPatrolPoint = self.nextPatrolPoint
   state.inventory = self:getInventory():serialize()
   state.dialogState = self.dialogState
   state.subtitles = self.subtitles
   state.idleAnimation = self.idleAnimation
   state.patrolLoop = self.patrolLoop
   state.patrol = self:getState("patrol")
   if self.patrolPoints then
      local pp = ""
      for k,v in ipairs(self.patrolPoints) do
         pp = pp .. v:getName() .. ","
      end
      state.patrolPoints = pp
   end
end

function CTalker:OnLoadState(state)
   CCharacter.OnLoadState(self, state)

   self:getInventory():destroyAllItems()
   self:getInventory():deserialize(state.inventory)

   if state.dead then
      self.interactor:setTriggerActive(false)
   else
      if state.patrolPoints then
         runTimer(0, nil, function ()
            self.patrolPoints = loadParamObjects({}, "patrolPoints", state.patrolPoints)
         end, false)
      end
      if state.nextPatrolPoint then
         runTimer(0, nil, function ()
            self.nextPatrolPoint = state.nextPatrolPoint
            self:startMoveNextPoint()
         end, false)
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

return {CTalker=CTalker}
