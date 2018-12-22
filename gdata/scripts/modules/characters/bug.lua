local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local ItemsData = (require "itemsData")

local CEventManager = (require "notificationCenter2").CNotificationCenter

local ai = require "ai"

local hlp = require "helpers"

local CBug = oo.class({
   itemType     = "bug.itm",
   itemTypeDead = "bug_dead.itm",
   installer = nil,
}, CCharacter)

function CBug:setInstaller(obj)
   self.installer = obj
end

function CBug:OnDestroy()
   CCharacter.OnDestroy(self)
   if self.installer then
      self.installer:removeInstallation(self)
   end
end

function CBug:initSenses()
   self.senseScheduler:addSense("enemyDetect", false, self.senseScheduler, self.senseScheduler.checkDetect)
   -- adding "enemyDetect" since "checkClose" depends on it
   self.senseScheduler:addSense("enemyClose" , false, self.senseScheduler, self.senseScheduler.checkClose)
   self.senseScheduler:addSense("inZone"     , false, self.senseScheduler, self.senseScheduler.checkZone)
end

function CBug:loadParameters()
   --log("CBug:loadParameters()")

   --log( tostring(self.parameters.zoneSize) )
   self.parameters.zoneSize = loadParamNumber(self, "walkRange" , 1000)
   self.parameters.attackDist = 300

   self.parameters.viewDist         = 1000  -- 10 meters
   self.parameters.backViewDist     = 500   -- 5 meters
   self.parameters.viewAngle        = 180

   --log( tostring(self.parameters.viewRange) )
   self.senseScheduler:setFeelRadius( loadParamNumber(self, "viewRange", 3000) )
   self.blockChirping = loadParam(self, "blockChirping", false)

   self.parameters.maxLandingSpeed = 1500
end

function CBug:OnCreate()
   CCharacter.OnCreate(self)
   --log("CBug:OnCreate()")

   self.stats.healthMax = {base = 10, current = 10, min = 1}
   self:setStatCount( "health", self.stats.healthMax.current )

   self.weapon = hlp.safeCreateItemWithoutModel("bug_bite.wpn", "CWeapon")
   self.weapon:setDamage(20)
   self.weapon:setOffset(false)
   self.weapon:setDimensions(25, 0)
   self.weapon = self.itemsManager:addItemObj( self.weapon )
   self.itemsManager:equipSlotWithItem( 0, self.weapon.id, true )

   CBug.loadParameters(self)
   CBug.initSenses    (self)
   CBug.initFX        (self)

   self.interactor = self:createAspect( "interactor" )
   self.interactor:setObject( self )
   self.interactor:setRaycastRadius( 150.0 )
   self.interactor:getPose():setParent( self:getPose() )
   self.interactor:getPose():resetLocalPose()
   self.interactor:getPose():setLocalPos( {x=0,y=0,z=0} )
   self.interactor:setRaycastActive( false )
   self.interactor:setTriggerActive( false )

   self.animationsManager:stopAnimation ( "death.caf" )

   self:setRole( ROLE_INSECT )

   self:enablePickupItem()
   self.eventManager = CEventManager{owner=self}
   self.eventManager:init()
   self:CreateTree()
end

function CBug:setupTimers( freq )
   self:stopTimers()

   self.senseScheduler.timer = runTimer( freq, self.senseScheduler, self.senseScheduler.OnIdle, true )
   self.behaviorTreeTimer    = runTimer( freq, nil, function ()
      if(self.BT) then
         self.BT:tick()
         self.eventManager:removeNotifications()
      end
   end, true )
end

function CBug:stopTimers()
   CCharacter.stopTimers(self)

   if ( self.behaviorTreeTimer ) then
      self.behaviorTreeTimer:stop()
      self.behaviorTreeTimer = nil
   end
end

function CBug:CreateTree()
   self.BT = ai.utils.loadTree("ai.trees.bug", self)
   self.BT:setBlackboard(self.blackboard)
end

function CBug:initFX()
   if not self.fx then
      self.fx = {}
      self.fx.blood = self:createAspect( "bug_blood.sps" )
      self.fx.blood:setLoop( false )
      self.fx.blood:getPose():setParent( self:getBonePose( "item_slot1" ) )
      self.fx.blood:getPose():resetLocalPos()
      self.fx.blood:disable()

      self.fx.blood_death = self:createAspect( "bug_blood_death.sps" )
      self.fx.blood_death:setLoop( false )
      self.fx.blood_death:getPose():setParent( self:getBonePose( "item_slot1" ) )
      self.fx.blood_death:getPose():resetLocalPos()
      self.fx.blood_death:disable()

      self.sounds = {}
      self.sounds.chirp = "bug_live.wav"
   end
end

function CBug:enablePickupItem()
   self.interactor:setRaycastActive( true )
end

function CBug:disablePickupItem()
   self.interactor:setRaycastActive( false )
end

function CBug:OnCaught( pose )
   --log( "CBug:OnCaught" )
   self:setState( "caught", true )
   self.caughtPose = pose
end

function CBug:OnFree( pose )
   --  if ( self:getState("dead") ) then
   --    return
   --  end
   log( "CBug:OnFree" )

   self:setCollision  ( true )
   self:setFeelVisible( true )

   self:getPose():resetParent()
   self:getPose():setRot( pose:getRot() )

   self:enablePickupItem()
   self:setState( "caught", false )
   self:CreateTree()
end

function CBug:hit(damage, charAttacker)
   CCharacter.hit(self, damage, charAttacker)
   self:setState("damage", true)
end

function CBug:move_start()
   self:setOrientationSpeed( 500 )

   self:setMoveSpeed( 300 )
   self.animationsManager:loopAnimation( "run_front.caf" )

   if ( not self.senseScheduler:getSense("inZone") ) then
      --log( "outzone" )
      self:setOrientation( getTargetAngleDir(self, self.senseScheduler:getCurZone()) )
   else
      if ( not self.senseScheduler:getCurEnemy() ) then
         self:setOrientation( rand(360) )
      else
         self:setOrientation( getTargetAngle(self, self.senseScheduler:getCurEnemy():getPose():getPos()) )
      end
   end
end

function CBug:death_start()
   self.fx.blood_death:play()
   self:stopMove()
   self.animationsManager:stopAnimations()
   self.animationsManager:playAnimationWithLock( "death.caf" )
   self.itemsManager:getSlotItem( 0 ):OnDeactivate()

   if ( self.senseScheduler:getLastEnemy() ~= nil ) then
      local pushPos = self.senseScheduler:getLastEnemy():getPose():getPos()
      local selfPos = self:getPose():getPos()
      pushPos.x = -(pushPos.x - selfPos.x)
      pushPos.y =  (pushPos.y - selfPos.y) + 180
      pushPos.z = -(pushPos.z - selfPos.z)
      self:push( pushPos, 5000, 1.5 )
   end

   self.BT = nil
   self:stopTimers()
   self:enablePickupItem()
end

function CBug:death_stop()
end


function CBug:move_stop()
   self:setMoveSpeed( 0 )
end

function CBug:chase_start()
   self:setOrientationSpeed( 400 )
   self:setMoveSpeed       ( 400 )
   self.animationsManager:loopAnimation( "run_front.caf" )
   self:setTarget( self.senseScheduler:getCurEnemy(), {y=100} )
   self:setOrientation( getTargetAngleDir(self, self.senseScheduler:getCurEnemy():getPose():getPos()) )
end

function CBug:chase_stop()
   self:resetTarget()
end

function CBug:attack_start()
   -- log("---attack")
   local currentEnemy = self.senseScheduler:getCurEnemy()
   if currentEnemy then
      self:setOrientation( getTargetAngleDir(self, currentEnemy:getPose():getPos()) )
      self:setOrientationSpeed(500)
   end

   self:startJump   ( 400 )
   self:setMoveSpeed( 600 )

   self.itemsManager:getSlotItem( 0 ):OnActivate()
   self.animationsManager:loopAnimation("jump_front.caf")
end

function CBug:attack_running()
   return #self.eventManager:notification("OnLanding") == 0
end


function CBug:attack_stop()
   --self.animationsManager:stopAnimations()
   self.itemsManager:getSlotItem( 0 ):OnDeactivate()
   self:stopMove()
   -- end
end

function CBug:caught_start()
   self.animationsManager:loopAnimation( "escaping.caf" )

   self:setCollision  ( false )
   self:setFeelVisible( false )

   self.itemsManager:getSlotItem( 0 ):OnDeactivate()

   self:getPose():setParent( self.caughtPose )
   self:getPose():resetLocalPose()
   self:getPose():setLocalRotQuat( quatFromEuler({x=-45}) )

   self:disablePickupItem()
   self.BT = nil

end

function CBug:caught_stop()
-- self.animationsManager:loopAnimation( "idle.caf" )
end

function CBug:preattack_start()
   self:stopMove()
   self:setOrientationSpeed(500)
   self:setOrientation( getTargetAngleDir(self, self.senseScheduler:getCurEnemy():getPose():getPos()))
   self.animationsManager:playAnimation("jump_ready.caf", false )
end

function CBug:preattack_stop()
end

function CBug:idle_start()
   self:stopMove()
   self.animationsManager:loopAnimation( "idle.caf" )
   self.timer = runTimer(rand(5), nil,nil,false)
end

function CBug:idle_running()
   return self.timer:getTimeLeft() > 0
end

function CBug:idle_stop()
   self.animationsManager:stopAnimations()
end

function CBug:walk_start()
   self:setOrientationSpeed( 500 )
   self:setMoveSpeed( 150 )
   self.animationsManager:loopAnimation( "walk_front.caf" )

   if ( not self.senseScheduler:getSense("inZone") ) then
      self:setOrientation( getTargetAngleDir(self, self.senseScheduler:getCurZone()) )
   else
      self:setOrientation( rand(360) )
   end
   self.timer = runTimer(rand(5), nil,nil,false)
end

function CBug:walk_running()
   return self.timer:getTimeLeft() > 0
end

function CBug:walk_stop()
   self.animationsManager:stopAnimations()
   self:stopMove()
end

function CBug:damaged_start()
   log("-----------------get damage")
   self.animationsManager:playAnimation( "hit.caf", false )
   self.fx.blood:play()
   self:stopMove()
   if ( self.senseScheduler:getCurEnemy() ~= nil ) then
      local pushPos = self.senseScheduler:getCurEnemy():getPose():getPos()
      local selfPos = self:getPose():getPos()
      pushPos.x = -(pushPos.x - selfPos.x)
      pushPos.y =  (pushPos.y - selfPos.y) + 180
      pushPos.z = -(pushPos.z - selfPos.z)
      self:push( pushPos, 5000, 1.5 )
   end
end

function CBug:damaged_stop()
   self:setState("damage", false)
end

function CBug:getType()
   return "pickup"
end

function CBug:getLabel()
   if ( self:getState("dead") ) then
      return ItemsData.getItemLabel( self.itemTypeDead )
   else
      return ItemsData.getItemLabel( self.itemType )
   end
end

function CBug:getInteractLabel()
   if ( self:getState("dead") ) then
      return "pick up"
   else
      return "catch"
   end
end

function CBug:getAsItem()
   local itemName = self.itemType

   if ( self:getState("dead") ) then
      itemName = self.itemTypeDead
   end

   if ( ItemsData.isItemAlive(itemName) and getPlayer() and getPlayer().itemsManager:isItemsAliveLimit() ) then
      return nil
   end

   local item = hlp.safeCreateItemWithoutModel( itemName, ItemsData.getItemClass(itemName) )

   if ( item ) then
      self.weapon:OnDeactivate()
      self.itemsManager:destroyItem(self.weapon.id)
      getScene():destroyEntity( self )
      item:setVisible( false )
      return item
   else
      log( "Can't create " .. itemName )
      return nil
   end
end

function CBug:OnLanding( landingSpeed )
   self.eventManager:postNotification("OnLanding")
   CCharacter.OnLanding( self, 0 ) -- TODO: FIXME: potential bug: the bug won't receive fall damage
   self.weapon:OnDeactivate()
end

function CBug:OnSaveState( state )
   state.dead = self:getState( "dead" )
   -- dynamic object spawned by installer
   if self.installer then
      local pos = self:getPose():getPos()
      state.pos = {x=pos.x, y=pos.y, z=pos.z}
      if not state.dead then
         state.health = self:getHealthCount()
      end
      state.caught = self:getState("caught")
   end
end

function CBug:OnLoadState( state )
   -- prevent duping when holding bug in hand
   if state.caught then
      getScene():destroyEntity(self)
      return
   end
   if self.installer then
      if state.pos then
         self:getPose():setPos(state.pos)
      end
   end
   if ( state.dead ) then
      self:die__()
      self:stopSounds()
   end
end

return {CBug=CBug}
