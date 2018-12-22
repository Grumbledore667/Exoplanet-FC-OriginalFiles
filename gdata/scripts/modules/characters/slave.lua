local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CTalker = (require "characters.talker").CTalker
local CActionsScheduler = (require "actionsScheduler").CActionsScheduler
local CAction = (require "action").CAction
local CActionSequence = (require "action").CActionSequence
local CNode = (require "node").CNode
local ItemsData = (require "itemsData")
local ObjectsLabels = (require "objectsLabels")

local CSlave = oo.class( {}, CTalker )

function CSlave:OnCreate()
   CTalker.OnCreate( self )

   self:subscribeOnDeath(self.OnDeath, self)
end

function CSlave:addActions()
   local idle = CAction{}
   idle.start = self.idle_start
   idle.stop  = self.idle_stop
   idle.name  = "idle"

   local gotodig = CAction{}
   gotodig.name = "gotodig"
   gotodig.start = self.gotodig_start
   gotodig.loop  = self.gotodig_loop
   gotodig.loopDelay = 0.1

   local dig = CAction{}
   dig.start = self.dig_start
   dig.loop  = self.dig_loop
   dig.loopDelay = 1.5
   dig.stop  = self.dig_stop
   dig.name  = "dig"

   local digseq = CActionSequence{}
   digseq:addAction(gotodig)
   digseq:addAction(dig)
   digseq.name = "digseq"

   local patrol = CAction{}
   patrol.start = self.patrol_start
   patrol.stop  = self.patrol_stop
   patrol.name  = "patrol"

   local talk = CAction{}
   talk:allowRestartOnEvent("onChangeState")
   talk.start = self.talk_start
   talk.stop  = self.talk_stop
   talk.name = "talk"

   local root = CNode{}
   root:yes (self.talk_):no  (self.patrol_):no  (self.must_dig_):no  (idle)
   root:yes (self.talk_):no  (self.patrol_):no  (self.must_dig_):yes (digseq)
   root:yes (self.talk_):no  (self.patrol_):yes (patrol)
   root:yes (self.talk_):yes (talk)

   self.actionsScheduler.root = root
end

function CSlave:startMoveNextPoint()
   if ( self.nextPatrolPoint ) then
      self:setTarget( self.patrolPoints[ self.nextPatrolPoint ], {} )
      self:setMoveSpeed( self.patrolSpeed )
   else
      self:setMoveSpeed( 0 )
      self:resetTarget()
   end
end

function CSlave:must_dig_()
   return self:getState("dig")
end

function CSlave:gotodig_start()
   self:activate()
   self:patrol_start()
end

function CSlave:gotodig_loop()
   return self.nextPatrolPoint == nil
end

function CSlave:dig_start()
   self.shovelEntity = getScene():createEntity("shovel.sbg", "")

   self.shovelEntity:getPose():setParent(self:getBonePose("item_slot1"))
   self.shovelEntity:getPose():resetLocalPose()
   self.animationsManager:loopAnimation("dig.caf")

   self:setTarget(getObj("q_lost_arphant_bridge"), {})
   runTimer(1, self, function(self) self:resetTarget() end, false)
   if string.lower(self:getName()) == "juggo" then
      self.refuseTalk = false
   end
end

function CSlave:dig_loop()
   if string.lower(self:getName()) ~= "juggo" then
      if getQuest("lost_arphant"):isStepPassed("slave_dig") then
         self:setState("dig", false)
         return true
      end
      return false
   else
      local o = getObj("q_lost_arphant_bridge")
      local p = o:getPose():getPos()
      p.y = p.y + (isDebug("quest") and 50 or 1)
      o:getPose():setPos(p)
      if p.y >= getQuestParam("lost_arphant", "ramp_initial_height") + 200 then
         --      self.animationsManager:loopAnimation("idle_2.caf")
         questSystem:fireEvent("dig_done")
         --      goToQuestStep("lost_arphant", "clear_way")
         self:setState("dig", false)
         return true
      end
      return false
   end
end

function CSlave:dig_stop()
   getScene():destroyEntity( self.shovelEntity )
   self.shovelEntity = nil
   --   self.animationsManager:loopAnimation( self.idleAnimation .. ".caf" )
end

function CSlave:OnDeath()
   self.interactor:setTriggerActive(false)
end

function CSlave:getType()
   return self.refuseTalk and "" or "talker"
end

function CSlave:onStartMessage()
   self.animationsManager:loopAnimation( "idle_talk.caf" )
end

function CSlave:onStopMessage()
   self.animationsManager:loopAnimation( self.idleAnimation .. ".caf" )
end

function CSlave:OnSaveState( state )
   CTalker.OnSaveState(self, state)
   state.dig = self:getState("dig")
   state.refuseTalk = self.refuseTalk
end

function CSlave:OnLoadState( state )
   CTalker.OnLoadState(self, state)
   self:setState("dig", state.dig)
   self.refuseTalk = state.refuseTalk
end

return {CSlave=CSlave}
