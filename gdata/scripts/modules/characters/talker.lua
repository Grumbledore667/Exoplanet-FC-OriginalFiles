local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CActionsScheduler = (require "actionsScheduler").CActionsScheduler
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local ObjectsLabels = (require "objectsLabels")
local ItemsData = (require "itemsData")
local ItemsLists = (require "itemsLists")

local tablex  = require "pl.tablex"
local stringx = require "pl.stringx"

local CTalker = oo.class( {trader = true}, CCharacter )

function CTalker:loadParameters()
   local dialogName = loadParam( self, "dialog", "" )
   self.dialog = dialogSystem:createDialog( dialogName, self:getName() .. "_" .. dialogName )
   self.dialogState = "dialog"
   self.subtitles = nil

   runTimer( 0, self, self.initDialog, false )

   self.labelId             = loadParam( self, "labelId", self:getName() )
   self.idleAnimation       = loadParam( self, "defaultAnimation", "idle" )
   self.moveAnimation       = loadParam( self, "moveAnimation", "move" )
   self.turnRightAnim       = loadParam( self, "turnRightAnim", "turn_right" )
   self.turnLeftAnim        = loadParam( self, "turnLeftAnim", "turn_left" )
   self.orientateToPlayer   = loadParam( self, "orientateToPlayer", true )
   self.patrolActive        = loadParam( self, "patrolActive", true )
   self.patrolLoop          = loadParam( self, "patrolLoop", true )
   self.orientateSpeed      = loadParamNumber( self, "orientateSpeed", 120 )
   self.patrolSpeed         = loadParamNumber( self, "patrolSpeed", 300 )
   self.dialogInitiator     = loadParam( self, "dialogInitiator", false )
   self.dialogInitiatorDist = loadParam( self, "dialogInitiatorDist", 300 )

   if self.parameters.tradeInventory == "" or self.parameters.tradeInventory == nil then
      self.parameters.tradeInventory = self:getName():lower() .. "_trade_inventory"
   end
   self.tradeInventory      = loadParamItemCounts( self, "tradeInventory", {} )

   self.tradeWhitelistName  = loadParam( self, "tradeWhitelistName", self:getName():lower() .. "_trade_whitelist" )
   self.tradeWhitelist      = ItemsLists.getItemsList(self.tradeWhitelistName)
   if not self.tradeWhitelist then
      self.tradeWhitelistName = "default_trade_whitelist"
      self.tradeWhitelist = ItemsLists.getItemsList(self.tradeWhitelistName)
   end

   self:setupAppearance( loadParam( self, "style", self:getName() ) )

   runTimer(0, self, self.obtainTradeInventory, false)

   runTimer( 0, self, function (self)
      self.patrolPoints = loadParamObjects( self, "patrolPoints", nil )

      if ( self.patrolPoints and #self.patrolPoints > 0 and self.patrolActive ) then
         self.nextPatrolPoint = 1
         self:startMoveNextPoint()
      end
   end, false )

   self.senseScheduler:setFeelRadius( 700 )
   self.parameters.viewAngle = 120
end

function CTalker:obtainTradeInventory()
   if self.loadedGame then
      self.loadedGame = false
      return
   end
   for name, count in pairs(self.tradeInventory) do
      for i=1, count do
         self.itemsManager:addItem(name)
      end
   end
end

function CTalker:isDialogInitiator()
   return self.dialogInitiator
end

function CTalker:setDialogInitiator(value)
   self.dialogInitiator = value
end

function CTalker:initDialog()
   if ( self.dialog ) then
      self.dialog.actors[1] = getPlayer()

      self.dialogActors = loadParamObjects( self, "dialogActors", nil )

      if ( not self.dialogActors or #self.dialogActors == 0 ) then
         self.dialog.actors[2] = self
      else
         for i=1,#self.dialogActors do
            self.dialog.actors[1+i] = self.dialogActors[i]
         end
      end

      for i=1,#self.dialog.actors do
         local actorLabel = "actor" .. (i-1)

         if ( i == 1 ) then
            actorLabel= "player"
         end
      end
   end
end

function CTalker:OnCreate()
   CCharacter.OnCreate( self )
   CTalker.loadParameters( self )

   self.interactor = self:createAspect( "interactor" )
   self.interactor:setObject( self )
   self.interactor:setTriggerRadius( self.dialogInitiatorDist )
   self.interactor:getPose():setParent( self:getPose() )
   self.interactor:getPose():resetLocalPose()
   self.interactor:getPose():setLocalPos( {x=0,y=100,z=0} )
   self.interactor:setTriggerActive( true )

   self:setRole( ROLE_NPC_FRIEND )

   self:addActions()
   self:idle_run()
   self:setImmortality( "immortal" )
end

function CTalker:OnInteractTriggerBegin(obj)
   if not self:isDialogInitiator() then
      return
   end
   if obj == getPlayer() and objInDist(obj:getPose():getPos(), self:getPose():getPos(), self.dialogInitiatorDist) then
      runTimer(0.3, {self=self, obj=obj}, function (data)
         if objInDist(data.obj:getPose():getPos(), data.self:getPose():getPos(), data.self.dialogInitiatorDist) then
            data.obj:startTalk(data.self)
            data.self:setDialogInitiator(false)
            data.self.dialog.initiator = data.self
         end
      end, false)
   end
end

function CTalker:OnDestroy()
   CCharacter.OnDestroy( self )
end

function CTalker:OnDie()
   if self.talkChar and self.dialog then
      dialogSystem:stopDialog( self.dialog )
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
   return self:getState( "talk" )
end

function CTalker:talk_start()
   if ( not self.talkChar ) then
      return
   end

   if ( self.orientateToPlayer ) then
      self:orientTo( self.talkChar )
   end

   dialogSystem:playDialog( self.dialog )
end

function CTalker:talk_stop()
   if ( not self.talkChar ) then
      return
   end

   if ( self.orientateToPlayer ) then
      local angle = -self:getOrientationFull()

      if ( math.abs(angle) > 30 ) then
         if ( angle < 0 ) then
            self.animationsManager:playAnimation( self.turnRightAnim .. ".caf", false )
         else
            self.animationsManager:playAnimation( self.turnLeftAnim .. ".caf", false )
         end
      end

      self:setOrientationFull ( 0 )
      self:setOrientationSpeed( self.orientateSpeed )
   end

   self.talkChar = nil

   dialogSystem:stopDialog( self.dialog )
end

-- ----------------------------- IDLE ----------------------------------------------------
function CTalker:idle_run()
   self:setState( "idle", true )
end

function CTalker:idle_start()
   self.animationsManager:loopAnimation( self.idleAnimation .. ".caf" )
end

function CTalker:idle_stop()
   self:setState( "idle", false )
end


-- ----------------------------- PATROL ----------------------------------------------------
function CTalker:patrol_()
   return self:getState("patrol")
end

function CTalker:patrol_start()
   self.animationsManager:loopAnimation( self.moveAnimation .. ".caf" )
   self:setOrientationSpeed( self.orientateSpeed )
end

function CTalker:patrol_stop()
   self:setMoveSpeed( 0 )
   self:resetTarget()
   self:setState( "patrol", false )
end

function CTalker:startMoveNextPoint()
   if ( self.nextPatrolPoint ) then
      self:setState( "patrol", true )
      self:setTarget( self.patrolPoints[ self.nextPatrolPoint ], {} )
      self:setMoveSpeed( self.patrolSpeed )
   else
      self:setState( "patrol", false )
   end
end

function CTalker:OnTriggerEnter( trigger )
   CCharacter.OnTriggerEnter( self, trigger )

   local index = self:isWaypoint( trigger )

   if ( index and index == self.nextPatrolPoint ) then
      self.nextPatrolPoint = self.nextPatrolPoint + 1

      if ( self.nextPatrolPoint > #self.patrolPoints ) then
         if ( self.patrolLoop ) then
            self.nextPatrolPoint = 1
         else
            self.nextPatrolPoint = nil
         end
      end

      self:startMoveNextPoint()
   end
end

function CTalker:isWaypoint( object )
   if ( self.patrolPoints ) then
      for i=1,#self.patrolPoints do
         if ( self.patrolPoints[i] == object ) then
            return i
         end
      end
   end

   return nil
end

-- ----------------------------- ANIM EVENTS ----------------------------------------------------
function CTalker:animatedEvent( eventType )
   if not CCharacter.animatedEvent(self, eventType) then return end

   if ( eventType == "hit" ) then
      self:setState( "damage", true )
   elseif ( eventType == "die" ) then
      self:stopMove()
      self:OnDie()
      self.animationsManager:stopAnimations()
      self.animationsManager:playAnimationWithLock( "death.caf" )
   end
end

-- ---------------------------------------------------------------------------------------
-- Dialogs
-- ---------------------------------------------------------------------------------------
function CTalker:startTalk( char )
   if self:getState("dead") or not self.dialog or self.dialogState ~= "dialog" then
      if self.dialogState == "subtitles" and self.subtitles then
         gameplayUI:addSubtitle(randChoice(self.subtitles), 4, self)
      end
      return false
   end
   self.talkChar = char
   self:setState( "talk", true )
   return true
end

function CTalker:stopTalk( char )
   self:setState( "talk", false )
end

function CTalker:onStartMessage()
   self.animationsManager:loopAnimation( "talk.caf" )
end

function CTalker:onStopMessage()
   self.animationsManager:loopAnimation( self.idleAnimation .. ".caf" )
end

function CTalker:onStopDialog()
   self:stopTalk( self.talkChar )
   self.dialog.initiator = nil
end

-- ---------------------------------------------------------------------------------------
-- Interactions
-- ---------------------------------------------------------------------------------------
function CTalker:activate( obj )
   self.patrolActive = true
   self.nextPatrolPoint = 1
   self:startMoveNextPoint()
   return true
end

function CTalker:deactivate( obj )
   return true
end

function CTalker:getType()
   return "talker"
end

function CTalker:getLabel()
   local label = ObjectsLabels.getLabel( self.labelId )

   if ( label == "" ) then
      label = self:getName()
      label = string.gsub(label, "%d+", "")
      label = string.gsub(label, "_", " ")
      label = stringx.strip(label)
      label = stringx.capitalize(label)
   end

   return label
end

function CTalker:getInteractLabel()
   local label = ObjectsLabels.getInteractLabel( self.labelId )

   if ( label == "" ) then
      label = "talk"
   end

   return label
end

function CTalker:getInteractTime( interactType )
   return 0
end

function CTalker:OnSaveState( state )
   CCharacter.OnSaveState( self, state )

   state.dead = self:getState( "dead" )
   state.headLooking = self.headLooking
   state.dialogInitiator = self.dialogInitiator
   state.nextPatrolPoint = self.nextPatrolPoint
   state.inventory = self.itemsManager:serialize()
   state.dialogState = self.dialogState
   state.subtitles = self.subtitles
   state.idleAnimation = self.idleAnimation
   state.patrolLoop = self.patrolLoop
   state.patrol = self:getState("patrol")
   if self.patrolPoints then
      local pp = ""
      for k,v in pairs(self.patrolPoints) do
         pp = pp .. v:getName() .. ","
      end
      state.patrolPoints = pp
   end
end

function CTalker:OnLoadState( state )
   self.loadedGame = true
   CCharacter.OnLoadState( self, state )

   if ( state.dead ) then
      self:die__()
      self.interactor:setTriggerActive(false)
      self:stopSounds()
   elseif state.inventory then
      self.itemsManager:deserialize(state.inventory)
   end
   if state.patrolPoints then
      runTimer( 0, nil, function ()
         self.patrolPoints = loadParamObjects({}, "patrolPoints", state.patrolPoints)
      end, false )
   end
   if state.nextPatrolPoint then
      runTimer( 0, nil, function ()
         self.nextPatrolPoint = state.nextPatrolPoint
         self:startMoveNextPoint()
      end, false )
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

return {CTalker=CTalker}
