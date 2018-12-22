local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CActionsScheduler = (require "actionsScheduler").CActionsScheduler
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local CInventory = (require "inventory").CInventory

local hlp = require "helpers"

local CKabarogPain = oo.class({}, CCharacter)

function CKabarogPain:loadParameters()
   self.stats.healthMax = {base = 500, current = 500, min = 1}
   self:setStatCount( "health", self.stats.healthMax.current )

   self.senseScheduler:setFeelRadius( loadParamNumber(self, "viewRange", 10000) )

   self.parameters.maxLandingSpeed = 1800

   self.parameters.viewDist        = 4000
   self.parameters.backViewDist    = 2000
   self.parameters.attackDist      = 800
   self.parameters.attackAngle     = 100

   self.parameters.defenceDist     = 200

   self.parameters.enemySpotted    = 3

   self.lootItems = loadParamStrings( self, "lootItems", {} )
   self.lootItems[ #self.lootItems + 1 ] = "meat.itm"
   self.lootItems[ #self.lootItems + 1 ] = "horn.itm"

   self.weapon = hlp.safeCreateItemWithoutModel("kabarog_bite.wpn", "CWeapon")
   self.weapon:setDamage(20)
   self.weapon:setOffset(false)
   self.weapon:setDimensions(25, 0)
   self.weapon = self.itemsManager:addItemObj( self.weapon )
   self.itemsManager:equipSlotWithItem( 1, self.weapon.id, true )
end

function CKabarogPain:initSenses()
   --log("CKabarogPain:initSenses()")

   self.senseScheduler:addSense("inZone"     , false, self.senseScheduler, self.senseScheduler.checkZone)
   self.senseScheduler:addSense("enemyDetect", false, self.senseScheduler, self.senseScheduler.checkDetect)
   self.senseScheduler:addSense("enemyClose" , false, self.senseScheduler, self.senseScheduler.checkClose)
   self.senseScheduler:addSense("enemyFront" , false, self.senseScheduler, self.senseScheduler.checkFront)

   --self:addSense("targetObjInZone", false, self.checkTargetObjDist, self)
   --self:addSense("targetObjFront", false, self.checkTargetObjAngle, self)
end

function CKabarogPain:OnCreate()
   CCharacter.OnCreate(self)
   --log("CKabarogPain:OnCreate()")

   CKabarogPain.loadParameters( self )
   CKabarogPain.initSenses    ( self )

   self.inventory = CInventory{}
   self.inventory:init     ( self )
   self.inventory:setActive( false )
   self.inventory:setRadius( 300 )
   --self.inventory:addItems( loadParamStrings( self, "items", nil ) )

   self:setRole   ( ROLE_ANIMAL )
   self:addActions()
   self.animationsManager:stopAnimation( "death.caf" )

   self:idle_run()
end

function CKabarogPain:OnStuckIn()
end

function CKabarogPain:OnStuckOut()
end

-- Actions

function CKabarogPain:addActions()
   local idle = CAction{}
   --idle:allowRestartOnEvent("setSense")
   idle.start = self.idle_start
   idle.stop  = self.idle_stop
   idle.name = "idle"

   local move = CAction{}
   move.start = self.move_start
   move.stop  = self.move_stop
   move.name = "move"

   local chase = CAction{}
   chase:allowRestartOnEvent("onChangeState")
   chase.start = self.chase_start
   chase.stop  = self.chase_stop
   chase.name = "chase"

   local attack = CAction{}
   attack:allowRestartOnEvent("onChangeState")
   attack.start = self.attack_start
   attack.stop  = self.attack_stop
   attack.name = "attack"

   local defence = CAction{}
   defence.start = self.defence_start
   defence.stop  = self.defence_stop
   defence.name = "defence"

   local panic = CAction{}
   panic:allowRestartOnEvent("onChangeState")
   panic.start = self.panic_start
   panic.stop  = self.panic_stop
   panic.name = "panic"

   local damage = CAction{}
   damage:allowRestartOnEvent("onChangeState")
   damage.start = self.damage_start
   damage.stop  = self.damage_stop
   damage.name = "damage"

   local root = CNode{}
   root:yes (self.alive_):yes (self.defence_):no  (self.attack_):no  (self.chase_):no (self.panic_):no (self.move_):no  (idle)
   root:yes (self.alive_):yes (self.defence_):no  (self.attack_):no  (self.chase_):no (self.panic_):no (self.move_):yes (move)
   root:yes (self.alive_):yes (self.defence_):no  (self.attack_):no  (self.chase_):no (self.panic_):yes(panic)
   root:yes (self.alive_):yes (self.defence_):no  (self.attack_):no  (self.chase_):yes(chase)
   root:yes (self.alive_):yes (self.defence_):no  (self.attack_):yes (attack)

   self.actionsScheduler.root = root
end


-- Predicates

function CKabarogPain:alive_()
   --log( "-----------------------" )
   --log( self.states )
   if ( (not self.senseScheduler:getCurEnemy()) or (not objInDist(self:getPose():getPos(), self.senseScheduler:getCurEnemy():getPose():getPos(), self.parameters.backViewDist/3)) ) then
      self:setState("panic", false)
   end

   return not self:getState( "dead" )
end

function CKabarogPain:move_()
   return self:getState( "move" )
end

function CKabarogPain:chase_()
   if ( self:getState("blockAttack") or self:getState("panic") ) then
      return false
   end

   if ( self.senseScheduler:getSense("enemyDetect") ) then
      self:setState("chase", true)
      return true
   end

   return false
end

function CKabarogPain:attack_()
   if ( self:getState("blockAttack") or self:getState("panic") ) then
      return false
   end

   if ( self.senseScheduler:getSense("enemyClose") ) then
      self:setState("attack", true)
      return true
   end

   return false
end

function CKabarogPain:defence_()
   if ( self:getState("blockAttack") or self:getState("panic") ) then
      return false
   end

   if ( not self.senseScheduler:getCurEnemy() ) then
      return false
   end

   if ( self.senseScheduler:getSense("enemyFront") and objInDist(self:getPose():getPos(), self.senseScheduler:getCurEnemy():getPose():getPos(), self.parameters.defenceDist) ) then
      self:setState("defence", true)
      return true
   end

   return false
end

function CKabarogPain:panic_()
   if ( self:getState("panic") ) then
      return true
   end

   if ( not self.senseScheduler:getCurEnemy() ) then
      return false
   end

   if ( (not self.senseScheduler:getSense("enemyFront")) and objInDist(self:getPose():getPos(), self.senseScheduler:getCurEnemy():getPose():getPos(), self.parameters.defenceDist) ) then
      self:setState("panic", true)
      return true
   end

   return false
end

function CKabarogPain:damage_()
   return self:getState( "damage" )
end


-- Callbacks
-- ----------------------------- IDLE ----------------------------------------------------
function CKabarogPain:idle_run()
   if ( self:getState("chase") or self:getState("panic") ) then
      return
   end

   self:setState( "idle"  , true )
   self:setState( "move"  , false )
end

function CKabarogPain:idle_start()
   self.animationsManager:loopAnimation( "idle.caf" )

   runTimer( rand(2), self, self.move_run, false )

   --log( "-----------------------" )
   --log( self.states )
end

function CKabarogPain:idle_stop()
   self:setState("idle" , false)
end

-- ----------------------------- MOVE ----------------------------------------------------
function CKabarogPain:move_run()
   if ( self:getState("chase") or self:getState("panic") or self:getState("blockAttack") ) then
      return
   end

   self:setState("move" , true)
   self:setState("idle" , false)
end

function CKabarogPain:move_start()
   self:setOrientationSpeed( 80 )
   self:setMoveSpeed       ( 250 )

   self.animationsManager:loopAnimation( "walk.caf" )

   runTimer( rand(4), self, self.idle_run, false )

   if ( not self.senseScheduler:getSense("inZone") ) then
      --log( "outzone" )
      self:setOrientation( getTargetAngleDir(self, self.senseScheduler:getCurZone()) )
   else
      self:setOrientationFull( rand(360) )
   end
end

function CKabarogPain:move_stop()
   self:setMoveSpeed( 0 )
   self:setOrientationSpeed( 0 )

   self:setState("move" , false)
end

-- ----------------------------- ROAR ----------------------------------------------------
function CKabarogPain:roar_start()
   --log("roar_start")
   self:setState( "blockAttack", true )

   self:chase_stop()

   -- local animation = "cry.caf"
   local animation = "attack_2.caf" --temp since no animatino

   --if ( rand(2) > 1 ) then
   --animation = "roar.caf"
   --end

   self.animationsManager:playAnimation( animation, false )
   self.animationsManager:subscribeAnimationEnd( animation, self, self.animStopRoar )
end

function CKabarogPain:animStopRoar()
   --log("----------------")
   --log(self.states)
   self:setState( "blockAttack", false )
   self:setState( "move", not self:getState("move") )
   --log("----------------")
   --log(self.states)
end

-- ----------------------------- CHASE ----------------------------------------------------
function CKabarogPain:chase_start()
   if ( self.senseScheduler:getSense("enemyFront") ) then
      self.parameters.enemySpotted = self.parameters.enemySpotted + 1
      if ( self.parameters.enemySpotted >= 3 ) then
         self:roar_start()
         self.parameters.enemySpotted = 0
         return
      end
   end

   self:setMoveSpeed( 600 )
   self.animationsManager:loopAnimation( "run.caf" )

   self:setOrientationSpeed( 400 )

   if ( self.senseScheduler:getCurEnemy() ) then
      self:setTarget( self.senseScheduler:getCurEnemy(), {y=100} )
   end
   --self:setOrientation     ( getTargetAngleDir(self, self.senseScheduler:getCurEnemy():getPose():getPos()) )
end

function CKabarogPain:chase_stop()
   self:setMoveSpeed( 0 )
   self:setOrientationSpeed( 0 )
   self:resetTarget()

   self:setState( "chase", false )
end

-- ----------------------------- ATTACK ----------------------------------------------------
function CKabarogPain:attack_start()
   if ( not self.senseScheduler:getCurEnemy() ) then
      return
   end

   self:setOrientationSpeed( 200 )
   self:setOrientation     ( getTargetAngleDir(self, self.senseScheduler:getCurEnemy():getPose():getPos()) )

   local pushPos = self.senseScheduler:getCurEnemy():getPose():getPos()
   local selfPos = self:getPose():getPos()
   pushPos.x = (pushPos.x - selfPos.x)
   pushPos.y = (pushPos.y - selfPos.y)
   pushPos.z = (pushPos.z - selfPos.z)
   self:push( pushPos, 10000, 1.0 )

   self.animationsManager:loopAnimation("run.caf")
   runTimer(0.05, self, self.attackTimer, false)

   --self.animationsManager:subscribeAnimationEventOut( "attack.caf", "attack", self, self.attackAnimStop )

   self.weapon:OnActivate()
end

function CKabarogPain:attackTimer()
   animation = "attack.caf"
   if ( rand(2) > 1) then
      animation = "attack_2.caf"
   end
   self.animationsManager:playAnimation        ( animation, false )
   self.animationsManager:subscribeAnimationEnd( animation, self, self.attackAnimStop )
end

function CKabarogPain:attack_stop()
   self:setOrientationSpeed( 0 )
end

function CKabarogPain:attackAnimStop()
   self:setState( "attack", false )
   self:setState( "blockAttack", true )

   self.weapon:OnDeactivate()

   runTimer( 1, self, self.coolDown, false )
end

function CKabarogPain:coolDown()
   self:setState("blockAttack", false)
end

-- ----------------------------- DEFENCE ----------------------------------------------------
function CKabarogPain:defence_start()
   --self:setOrientationSpeed( 200 )
   --self:setOrientation     ( getTargetAngleDir(self, self.senseScheduler:getCurEnemy():getPose():getPos()) )

   self.animationsManager:playAnimation        ( "eat_play.caf", false )
   self.animationsManager:subscribeAnimationEnd( "eat_play.caf", self, self.defenceAnimStop )

   self.weapon:OnActivate()
end

function CKabarogPain:defence_stop()
end

function CKabarogPain:defenceAnimStop()
   self:setState( "defence", false )
   self:setState( "blockAttack", true )

   self.weapon:OnDeactivate()

   runTimer( 1, self, self.coolDown, false )
end

-- ----------------------------- PANIC ----------------------------------------------------
function CKabarogPain:panic_start()
   self:setOrientation( getTargetAngle(self, self.senseScheduler:getCurEnemy():getPose():getPos())+180 )

   self:setMoveSpeed( 1200 )
   self.animationsManager:loopAnimation( "run.caf" )
end

function CKabarogPain:panic_stop()
   self:setMoveSpeed( 0 )
end

-- ----------------------------- DAMAGE ----------------------------------------------------
function CKabarogPain:damage_start()
   local animation = "hurt__light.caf"

   self.animationsManager:playAnimation        ( animation, false )

   if ( self.senseScheduler:getCurEnemy() ~= nil ) then
      local pushPos = self.senseScheduler:getCurEnemy():getPose():getPos()
      local selfPos = self:getPose():getPos()
      pushPos.x = -(pushPos.x - selfPos.x)
      pushPos.y =  (pushPos.y - selfPos.y) + 180
      pushPos.z = -(pushPos.z - selfPos.z)
      self:push( pushPos, 3000, 0.5 )
   end
end

function CKabarogPain:damage_stop()
   self:setState( "damage", false )
end

-- ----------------------------- ANIM EVENTS ----------------------------------------------------
function CKabarogPain:animatedEvent(eventType)
   CCharacter.animatedEvent(self, eventType)

   if ( self:getHealth() == 0 and eventType ~= "die" ) then
      return
   end

   --log( "animatedEvent = " .. eventType )

   if ( eventType == "hit" ) then
      self:damage_start()
   end

   if ( eventType == "die" ) then
      self:OnDie()
   end
end

function CKabarogPain:OnEnemyHit( params )
   local char = params.target
   local pushPos = self:getPose():getPos()
   local selfPos = char:getPose():getPos()
   pushPos.x = -(pushPos.x - selfPos.x)
   pushPos.y =  (pushPos.y - selfPos.y) + 180
   pushPos.z = -(pushPos.z - selfPos.z)
   char:push( pushPos, 15000, 1.0 )
end

function CKabarogPain:OnDie()
   self:stopMove()
   self.animationsManager:stopAnimations()
   self.animationsManager:playAnimationWithLock( "death.caf" )

   if ( self.senseScheduler:getLastEnemy() ~= nil ) then
      log( "die enemy = " .. tostring(self.senseScheduler:getLastEnemy()) )
      local pushPos = self.senseScheduler:getLastEnemy():getPose():getPos()
      local selfPos = self:getPose():getPos()
      pushPos.x = -(pushPos.x - selfPos.x)
      pushPos.y =  (pushPos.y - selfPos.y) + 180
      pushPos.z = -(pushPos.z - selfPos.z)
      self:push( pushPos, 3000, 0.5 )
   end

   self.inventory:setActive( true )
   self.inventory:addItems( self.lootItems )
end

function CKabarogPain:OnLostItem()
   if ( self.inventory:getItemsCount() == 0 ) then
      self:showGibs()
   end
end

function CKabarogPain:showGibs()
   if ( not self.gibs ) then
      self.gibs = self:createAspect( "kabarog_carcass.sbg" )
   end

   self.gibs:setPose       ( self:getPose() )
   self.gibs:setVisible    ( true )
   self:setVisible         ( false )
   self.inventory:setActive( false )

   if ( not self.gibsFlies ) then
      self.gibsFlies = self:createAspect( "flies.sps" )
   end

   self.gibsFlies:setPose    ( self.gibs:getPose() )
   self.gibsFlies:play()

   if ( not self.gibsFliesSound ) then
      self.gibsFliesSound = self:createAspect( "flies.wav" )
   end

   self.gibsFliesSound:setPose    ( self:getPose() )
   self.gibsFliesSound:setLoop    ( true )
   self.gibsFliesSound:setDistance( 500 )
   self.gibsFliesSound:play       ()
end

function CKabarogPain:getLabel()
   return "Hornhog"
end

function CKabarogPain:getInteractLabel()
   if self:getState("dead") then
      return "loot"
   end
end

return {CKabarogPain=CKabarogPain}
