local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CTalker = (require "characters.talker").CTalker
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local ItemsData = (require "itemsData")
local WeatherSystem = (require "environment.weather").WeatherSystem

local CSwiftStrider = oo.class( {}, CTalker )

function CSwiftStrider:loadParameters()
   self:setStatCount( "health", 1 )
   self:setImmortality( false )
   self.daysLeftToDie = nil
   self.daysLeftToFort = nil

   self.smoke_fx = self:createAspect( "koster_smoke.sps" )
   self.smoke_fx:getPose():setParent( self:getBonePose("head_slot") )
   self.smoke_fx:getPose():resetLocalPose()
   self.smoke_fx:getPose():setLocalPos( {z=-15, y=-15} )
   self.smoke_fx:getPose():setLocalRotQuat(quatFromEuler({x=-90}) )
   self.smoke_fx:getPose():setLocalScale( {x=0.25, y=0.25, z=0.25} )
   self.smoke_fx:enable()
   self.smoke_fx:stop()
end

function CSwiftStrider:OnCreate()
   CTalker.OnCreate( self )

   self.interactorGreeting = self:createAspect( "interactor" )

   local dummy = {}
   local function dummyBegin(_, obj)
      if obj ~= getDefaultPlayer() then return end
      if getQuest("ktharsis_harsh"):isStarted() then
         if self.interactorGreeting then
            self.interactorGreeting:setTriggerActive( false )
            self.interactorGreeting = nil
         end
      else
         gameplayUI:addSubtitle("Hey you, huma... over here... You're not one of them... *coughs* Water...", 8, self)
         self:activateDeath( 0.75)
      end
   end
   dummy.OnInteractTriggerBegin = dummyBegin

   self.interactorGreeting:setObject( dummy )
   self.interactorGreeting:setTriggerRadius( 1000 )
   self.interactorGreeting:getPose():setParent( self:getPose() )
   self.interactorGreeting:getPose():resetLocalPose()
   self.interactorGreeting:getPose():setLocalPos( {x=0,y=100,z=0} )
   self.interactorGreeting:setTriggerActive( true )
   self.interactorGreeting:setRaycastActive( false )

   CSwiftStrider.loadParameters( self )
   self:subscribeOnDeath(self.OnDeath, self)
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
   self.headLooking = false
   self.jointEntity = getScene():createEntity("joint_large.sbg", "")

   self.jointEntity:getPose():setParent(self:getBonePose("item_slot1"))
   self.jointEntity:getPose():resetLocalPose()
   -- self.jointEntity:getPose():setLocalRotQuat(quatFromEuler({x=90, y=90}) )
   -- self.jointEntity:getPose():setLocalPos    ( {z=-10} )
   self.animationsManager:loopAnimation( "sit_swift_smoke.caf" )
end

function CSwiftStrider:smoke_stop()
   getScene():destroyEntity( self.jointEntity )
   self.jointEntity = nil
   self.animationsManager:loopAnimation( self.idleAnimation .. ".caf" )
   self.headLooking = true
end

function CSwiftStrider:addItem( itemName )
   local item = CCharacter.addItem(self, itemName)

   local foodInfo = ItemsData.getItemFoodInfo(itemName)
   if foodInfo and foodInfo.water then
      self.headLooking = false
      self.animationsManager:playAnimation("sit_swift_drink.caf", false)
      self.animationsManager:subscribeAnimationEnd("sit_swift_drink.caf", self, self.drink_stop)

      local drinkModel = ItemsData.getItemModel(itemName)
      self.drinkEntity = getScene():createEntity(drinkModel, "")

      self.drinkEntity:getPose():setParent(self:getBonePose("item_slot" .. self:getWeaponSlot()))
      --         self.drinkEntity:getPose():setParent(self:getBonePose("Bip001 R Hand"))
      self.drinkEntity:getPose():resetLocalPose()
      --         self.drinkEntity:getPose():setLocalRotQuat(quatFromEuler({x=40}) )
      --         self.drinkEntity:getPose():setLocalPos    ( {x=10, z=-6} )
      self.drinkEntity:getPose():setLocalPos    ( {y=-16} )
      --destroy item
      runTimer(0, nil, function() self:destroyItemByName(itemName) end, false)
   end
   return item
end

function CSwiftStrider:drink_stop()
   getScene():destroyEntity( self.drinkEntity )

   self.drinkEntity     = nil
   self.headLooking = true
end

function CSwiftStrider:animatedEvent( eventType )
   CCharacter.animatedEvent( self, eventType )

   if ( self:getHealth() == 0 and eventType ~= "die" ) then
      return
   end

   if ( eventType == "hit" ) then
      self:setState( "damage", true )
   end

   if ( eventType == "die" ) then
      self:stopMove()
      self.animationsManager:stopAnimations()
      self.animationsManager:playAnimationWithLock( "sit_swift_death.caf" )
   end
end

function CSwiftStrider:OnAnimationEventIn( animation, event )
   CCharacter.OnAnimationEventIn(animation, event)
   if event == "smoke" then
      self.smoke_fx:play()
   end
end
function CSwiftStrider:OnAnimationEventOut( animation, event )
   CCharacter.OnAnimationEventOut(animation, event)
   if event == "smoke" then
      self.smoke_fx:stop()
   end
end

function CSwiftStrider:OnDeath( self )
   self.interactor:setTriggerActive(false)
   self.daysLeftToDie = nil
   WeatherSystem:unsubscribeDaytimeChange( self.onTimeStateDeath, self )
   self.daysLeftToFort = nil
   WeatherSystem:unsubscribeDaytimeChange( self.onTimeStateToFort, self )
end

function CSwiftStrider:onStartMessage()
   self.animationsManager:loopAnimation( "sit_swift_talk.caf" )
end

function CSwiftStrider:onStopMessage()
   self.animationsManager:loopAnimation( self.idleAnimation .. ".caf" )
end

function CSwiftStrider:onTimeStateDeath( state )
   self.daysLeftToDie = self.daysLeftToDie - 0.25
   if self.daysLeftToDie <= 0 then
      if self:getState("talk") then --prolong striders life
         self.daysLeftToDie = self.daysLeftToDie + 0.25
      else
         self:die__()
      end
   end
end

function CSwiftStrider:onTimeStateToFort( state )
   self.daysLeftToFort = self.daysLeftToFort - 0.25
   if self.daysLeftToFort <= 0 then
      --delay TP if player is likely to see it
      local wp = getObj(getQuest("ktharsis_harsh").strider_safe)
      if objInDist( getPlayer():getPose():getPos(), self:getPose():getPos(), 2000 )
         or objInDist( getPlayer():getPose():getPos(), wp:getPose():getPos(), 2000 ) then
         self.daysLeftToFort = self.daysLeftToFort + 0.25
      else
         goToQuestStep( "ktharsis_harsh", "in_fort", true )
         self.daysLeftToFort = nil
         WeatherSystem:unsubscribeDaytimeChange( self.onTimeStateToFort, self )
      end
   end
end

function CSwiftStrider:activateDeath( daysLeft )
   self.daysLeftToDie = daysLeft
   WeatherSystem:subscribeDaytimeChange( self.onTimeStateDeath, self )
end

function CSwiftStrider:deactivateDeath()
   self.daysLeftToDie = nil
   WeatherSystem:unsubscribeDaytimeChange( self.onTimeStateDeath, self )
end

function CSwiftStrider:addDeathTime()
   self.daysLeftToDie = self.daysLeftToDie + 0.25
end

function CSwiftStrider:activateToFort( daysLeft )
   self.daysLeftToFort = daysLeft
   WeatherSystem:subscribeDaytimeChange( self.onTimeStateToFort, self )
end

function CSwiftStrider:OnSaveState( state )
   CCharacter.OnSaveState( self, state )

   state.dead = self:getState( "dead" )
   state.inventory = self.itemsManager:serialize()
   if self.daysLeftToDie then
      state.daysLeftToDie = self.daysLeftToDie
   end
   if self.daysLeftToFort then
      state.daysLeftToFort = self.daysLeftToFort
   end
end

function CSwiftStrider:OnLoadState( state )
   CCharacter.OnLoadState( self, state )

   if ( state.dead ) then
      self:die__()
      self.interactor:setTriggerActive(false)
      self:stopSounds()
   elseif state.inventory then
      self.itemsManager:deserialize(state.inventory)
      if state.daysLeftToDie then
         self:activateDeath( state.daysLeftToDie )
      end
      if state.daysLeftToFort then
         self:activateToFort( state.daysLeftToFort )
      end
   end
end

function CSwiftStrider:getLabel()
   return "Swift Strider"
end

return {CSwiftStrider=CSwiftStrider}
