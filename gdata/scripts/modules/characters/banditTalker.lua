local oo = require "loop.simple"
local CTalker = (require "characters.talker").CTalker
local CBandit = (require "characters.bandit").CBandit
local CBanditTalker = oo.class({}, CBandit)
local CAction = (require "action").CAction

function CBanditTalker:initWithParams( params )
   self.savedFeelRadius = loadParamNumber(self, "viewRange", 10000)
   self.senseScheduler:setFeelRadius( 0 )
   if self:getPrefabName() == "human_male.cfg" then
      self.idleAnims   = { loadParam(self, "idleAnim", "idle_machete") .. ".caf" }
   elseif self:getPrefabName() == "abori.cfg" then
      self.idleAnims = { loadParam(self, "idleAnim", "idle_weapon") .. ".caf" }
   elseif self:getPrefabName() == "hulk.cfg" then
      self.idleAnims = { loadParam(self, "idleAnim", "idle") .. ".caf" }
   end

   self.dialogInitiator     = loadParam( self, "dialogInitiator", false )
   self.dialogInitiatorDist = loadParam( self, "dialogInitiatorDist", 300 )
   self.dialogState = "dialog"
   self.orientateToPlayer = true
   self.orientateSpeed = 120
   self.activated = false
end

function CBanditTalker:OnCreate()
   CBandit.OnCreate( self )
   CBanditTalker.initWithParams( self, nil )
   local dialogName = loadParam( self, "dialog", "" )
   self.dialog = dialogSystem:createDialog( dialogName, self:getName() .. "_" .. dialogName )
   CTalker.initDialog( self )

   self.interactor = self:createAspect( "interactor" )
   self.interactor:setObject( self )
   self.interactor:setTriggerRadius( self.dialogInitiatorDist )
   self.interactor:getPose():setParent( self:getPose() )
   self.interactor:getPose():resetLocalPose()
   self.interactor:getPose():setLocalPos( {x=0,y=100,z=0} )
   self.interactor:setTriggerActive( true )
end

function CBanditTalker:idle_start()
   self.animationsManager:loopAnimation( self.idleAnims[1] )

   if self.activated then
      runTimer( rand(2), self, self.move_run, false )
   end
end

function CBanditTalker:startTalk( char )
   local state = CTalker.startTalk( self, char )
   if state then
      self.animationsManager:loopAnimation( "idle.caf" )

      CTalker.talk_start( self, char )
   end
   return state
end

function CBanditTalker:initDialog()
   CTalker.initDialog( self )
end

function CBanditTalker:stopTalk( char )
   CTalker.stopTalk( self, char )
end

function CBanditTalker:onStartMessage()
   if not self.talkAnim then return end
   self.animationsManager:loopAnimation( self.talkAnim )
end

function CBanditTalker:onStopMessage()
   self.animationsManager:loopAnimation( self.idleAnims[1] )
end

function CBanditTalker:setDialogInitiator(value)
   self.dialogInitiator = value
end

function CBanditTalker:isDialogInitiator()
   return self.dialogInitiator
end

function CBanditTalker:OnInteractTriggerBegin(obj)
   CTalker.OnInteractTriggerBegin( self, obj )
end

function CBanditTalker:OnHit( params )
   CBandit.OnHit( self, params )
   if not self.activated then
      self:activate()
   end
end

function CBanditTalker:activate( silent )
   if not self.activated then
      if self:getPrefabName() == "human_male.cfg" then
         self.idleAnims   = { "idle_machete.caf" }
      elseif self:getPrefabName() == "abori.cfg" then
         self.idleAnims   = { "idle_weapon.caf" }
      elseif self:getPrefabName() == "hulk.cfg" then
         self.idleAnims   = { "idle.caf" }
      end
      self.senseScheduler:setFeelRadius( self.savedFeelRadius )
      self.activated = true
      self:idle_start()
      if not silent then
         questSystem:fireEvent("activate", self:getName())
      end
   end
end

function CBanditTalker:getType()
   return "talker"
end

function CBanditTalker:OnDie()
   CTalker.OnDie( self )
   CBandit.OnDie( self )
end

function CBanditTalker:OnSaveState( state )
   CBandit.OnSaveState(self, state)
   state.activated = self.activated
   state.dialogInitiator = self.dialogInitiator
end

function CBanditTalker:OnLoadState( state )
   CBandit.OnLoadState(self, state)
   self.dialogInitiator = state.dialogInitiator
   if state.activated then
      self:activate( true )
   end
end

return {CBanditTalker=CBanditTalker}
