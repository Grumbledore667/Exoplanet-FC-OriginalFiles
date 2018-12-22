local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CActionsScheduler = (require "actionsScheduler").CActionsScheduler
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local CInventory = (require "inventory").CInventory

local hlp = require "helpers"

local CKabarog = oo.class({}, CCharacter)
local CKabarogWeak = oo.class({}, CKabarog)

function CKabarogWeak:OnCreate()
   CKabarog.OnCreate(self)

   self.stats.healthMax = {base = 250, current = 250, min = 1}
   self:setStatCount( "health", self.stats.healthMax.current )
end

function CKabarogWeak:getLabel()
   return "Juvenile Hornhog"
end

function CKabarogWeak:addWeapon()
   CKabarog.addWeapon( self )
   self.weapon:setDamage(10)
end

function CKabarog:initWithParams( params )
   local healthMax = params.healthMax or 500
   self.stats.healthMax = {base = healthMax, current = healthMax, min = 1}
   self:setStatCount( "health", self.stats.healthMax.current )

   self.senseScheduler:setFeelRadius( loadParamNumber(self, "viewRange", 10000) )

   self.parameters.maxLandingSpeed = 1800

   self.parameters.viewDist        = 4000
   self.parameters.backViewDist    = 2000
   self.parameters.attackDist      = 800
   self.parameters.attackAngle     = 100

   self.parameters.defenceDist     = 200

   self.parameters.enemySpotted    = 3

   self.headLookingLimits = {x=10, y=30, z=0}

   self.standardLoot = params.standardLoot or {}
   self.lootItems = params.lootItems or loadParamItemCounts( self, "lootItems", {} )

   if not params.load then
      for name, count in pairs(self.standardLoot) do
         for i=1, count do
            self.itemsManager:addItem(name)
         end
      end
      for name, count in pairs(self.lootItems) do
         for i=1, count do
            self.itemsManager:addItem(name)
         end
      end
   end

   self:addWeapon()
end

function CKabarog:addWeapon()
   if not self.weapon then
      self.weapon = hlp.safeCreateItemWithoutModel("kabarog_bite.wpn", "CWeapon")
      self.weapon:setOffset(false)
      self.weapon:setDimensions(25, 0)
      self.weapon = self.itemsManager:addItemObj( self.weapon )
      self.itemsManager:equipSlotWithItem( 1, self.weapon.id, true )
      self.weapon:setDamage(20)
   end
end

function CKabarog:initSenses()
   --log("CKabarog:initSenses()")

   self.senseScheduler:addSense("inZone"     , false, self.senseScheduler, self.senseScheduler.checkZone)
   self.senseScheduler:addSense("enemyDetect", false, self.senseScheduler, self.senseScheduler.checkDetect)
   self.senseScheduler:addSense("enemyClose" , false, self.senseScheduler, self.senseScheduler.checkClose)
   self.senseScheduler:addSense("enemyFront" , false, self.senseScheduler, self.senseScheduler.checkFront)

   --self:addSense("targetObjInZone", false, self.checkTargetObjDist, self)
   --self:addSense("targetObjFront", false, self.checkTargetObjAngle, self)
end

function CKabarog:OnCreate()
   CCharacter.OnCreate(self)
   --log("CKabarog:OnCreate()")

   CKabarog.initWithParams( self, { standardLoot = {["meat.itm"] = 1,["horn.itm"] = 1} } )
   CKabarog.initSenses( self )
   CKabarog.initFX( self )

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

function CKabarog:initFX()
   if not self.fx then
      self.fx = {}
      self.fx.blood1 = self:createAspect( "kab_blood1.sps" )
      self.fx.blood1:setLoop( false )
      self.fx.blood1:getPose():setParent( self:getBonePose( "item_slot1" ) )
      self.fx.blood1:getPose():resetLocalPos()
      self.fx.blood1:disable()

      self.fx.blood2 = self:createAspect( "kab_blood2.sps" )
      self.fx.blood2:setLoop( false )
      self.fx.blood2:getPose():setParent( self:getBonePose( "item_slot1" ) )
      self.fx.blood2:getPose():resetLocalPos()
      self.fx.blood2:disable()

      self.fx.blood_death = self:createAspect( "kab_blood_death.sps" )
      self.fx.blood_death:setLoop( false )
      self.fx.blood_death:getPose():setParent( self:getBonePose( "item_slot1" ) )
      self.fx.blood_death:getPose():resetLocalPos()
      self.fx.blood_death:disable()
   end
end

function CKabarog:OnDestroy()
   CCharacter.OnDestroy(self)
   if self.installer then
      self.installer:removeInstallation(self)
   end
end

function CKabarog:OnStuckIn()
end

function CKabarog:OnStuckOut()
end

function CKabarog:setInstaller(obj)
   self.installer = obj
end

-- Actions

function CKabarog:addActions()
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

   local search = CAction{}
   search.start = self.search_start
   search.stop = self.search_stop
   search.name = "search"

   local root = CNode{}
   root:yes (self.alive_):yes (self.search_):yes (search)
   root:yes (self.alive_):yes (self.damage_):no  (self.defence_):no  (self.attack_):no  (self.chase_):no (self.panic_):no (self.move_):no  (idle)
   root:yes (self.alive_):yes (self.damage_):no  (self.defence_):no  (self.attack_):no  (self.chase_):no (self.panic_):no (self.move_):yes (move)
   root:yes (self.alive_):yes (self.damage_):no  (self.defence_):no  (self.attack_):no  (self.chase_):no (self.panic_):yes(panic)
   root:yes (self.alive_):yes (self.damage_):no  (self.defence_):no  (self.attack_):no  (self.chase_):yes(chase)
   root:yes (self.alive_):yes (self.damage_):no  (self.defence_):no  (self.attack_):yes (attack)
   -- root:yes (self.alive_):yes (self.damage_):no  (self.defence_):yes (defence) --no anims yet
   root:yes (self.alive_):yes (self.damage_):yes (damage)

   self.actionsScheduler.root = root
end


-- Predicates

function CKabarog:search_()
   return self:getState("search")
end

function CKabarog:alive_()
   --log( "-----------------------" )
   --log( self.states )
   if ( (not self.senseScheduler:getCurEnemy()) or (not objInDist(self:getPose():getPos(), self.senseScheduler:getCurEnemy():getPose():getPos(), self.parameters.backViewDist/3)) ) then
      self:setState("panic", false)
   end

   return not self:getState( "dead" )
end

function CKabarog:move_()
   return self:getState( "move" )
end

function CKabarog:chase_()
   if ( self:getState("blockAttack") or self:getState("panic") ) then
      return false
   end

   if ( self.senseScheduler:getSense("enemyDetect") ) then
      self:setState("chase", true)
      return true
   end

   return false
end

function CKabarog:attack_()
   if ( self:getState("blockAttack") or self:getState("panic") ) then
      return false
   end

   if ( self.senseScheduler:getSense("enemyClose") ) then
      self:setState("attack", true)
      return true
   end

   return false
end

function CKabarog:defence_()
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

function CKabarog:panic_()
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

function CKabarog:damage_()
   return self:getState( "damage" )
end


-- Callbacks
-- ----------------------------- IDLE ----------------------------------------------------
function CKabarog:idle_run()
   if ( self:getState("chase") or self:getState("panic") ) then
      return
   end

   self:setState( "idle"  , true )
   self:setState( "move"  , false )
end

function CKabarog:idle_start()
   self.animationsManager:loopAnimation( "idle.caf" )

   runTimer( rand(2), self, self.move_run, false )

   --log( "-----------------------" )
   --log( self.states )
end

function CKabarog:idle_stop()
   self:setState("idle" , false)
end

-- ----------------------------- MOVE ----------------------------------------------------
function CKabarog:move_run()
   if ( self:getState("chase") or self:getState("panic") or self:getState("blockAttack") ) then
      return
   end

   self:setState("move" , true)
   self:setState("idle" , false)
end

function CKabarog:move_start()
   if self:getState("swimming") then
      self:setOrientationSpeed( 40 )
      self:setMoveSpeed       ( 125 )
   else
      self:setOrientationSpeed( 80 )
      self:setMoveSpeed       ( 250 )
   end

   self.animationsManager:loopAnimation( "walk.caf" )

   runTimer( rand(4), self, self.idle_run, false )

   if ( not self.senseScheduler:getSense("inZone") ) then
      --log( "outzone" )
      self:setOrientation( getTargetAngleDir(self, self.senseScheduler:getCurZone()) )
   else
      self:setOrientationFull( rand(360) )
   end
end

function CKabarog:move_stop()
   self:setMoveSpeed( 0 )
   self:setOrientationSpeed( 0 )

   self:setState("move" , false)
end

-- ----------------------------- ROAR ----------------------------------------------------
function CKabarog:roar_start()
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

function CKabarog:animStopRoar()
   --log("----------------")
   --log(self.states)
   self:setState( "blockAttack", false )
   self:setState( "move", not self:getState("move") )
   --log("----------------")
   --log(self.states)
end

-- ----------------------------- CHASE ----------------------------------------------------
function CKabarog:chase_start()
   if ( self.senseScheduler:getSense("enemyFront") ) then
      self.parameters.enemySpotted = self.parameters.enemySpotted + 1
      if ( self.parameters.enemySpotted >= 3 ) then
         self:roar_start()
         self.parameters.enemySpotted = 0
         return
      end
   end

   if self:getState("swimming") then
      self:setOrientationSpeed( 200 )
      self:setMoveSpeed       ( 300 )
   else
      self:setOrientationSpeed( 400 )
      self:setMoveSpeed       ( 600 )
   end

   self.animationsManager:loopAnimation( "run.caf" )


   if ( self.senseScheduler:getCurEnemy() ) then
      self:setTarget( self.senseScheduler:getCurEnemy(), {y=100} )
   end
   --self:setOrientation     ( getTargetAngleDir(self, self.senseScheduler:getCurEnemy():getPose():getPos()) )
end

function CKabarog:chase_stop()
   self:setMoveSpeed( 0 )
   self:setOrientationSpeed( 0 )
   self:resetTarget()

   self:setState( "chase", false )
end

-- ----------------------------- ATTACK ----------------------------------------------------
function CKabarog:attack_start()
   if ( not self.senseScheduler:getCurEnemy() ) then
      return
   end

   if self:getState("swimming") then
      self:setOrientationSpeed( 100 )
   else
      self:setOrientationSpeed( 200 )
   end
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

function CKabarog:attackTimer()
   animation = "attack.caf"
   if ( rand(2) > 1) then
      animation = "attack_2.caf"
   end
   self.animationsManager:playAnimation        ( animation, false )
   self.animationsManager:subscribeAnimationEnd( animation, self, self.attackAnimStop )
end

function CKabarog:attack_stop()
   self:setOrientationSpeed( 0 )
end

function CKabarog:attackAnimStop()
   self:setState( "attack", false )
   self:setState( "blockAttack", true )

   self.weapon:OnDeactivate()

   runTimer( 1, self, self.coolDown, false )
end

function CKabarog:coolDown()
   self:setState("blockAttack", false)
end

-- ----------------------------- DEFENCE ----------------------------------------------------
function CKabarog:defence_start()
   --self:setOrientationSpeed( 200 )
   --self:setOrientation     ( getTargetAngleDir(self, self.senseScheduler:getCurEnemy():getPose():getPos()) )

   self.animationsManager:playAnimation        ( "eat_play.caf", false )
   self.animationsManager:subscribeAnimationEnd( "eat_play.caf", self, self.defenceAnimStop )

   self.weapon:OnActivate()
end

function CKabarog:defence_stop()
end

function CKabarog:defenceAnimStop()
   self:setState( "defence", false )
   self:setState( "blockAttack", true )

   self.weapon:OnDeactivate()

   runTimer( 1, self, self.coolDown, false )
end

-- ----------------------------- PANIC ----------------------------------------------------
function CKabarog:panic_start()
   self:setOrientation( getTargetAngle(self, self.senseScheduler:getCurEnemy():getPose():getPos())+180 )

   if self:getState("swimming") then
      self:setMoveSpeed       ( 600 )
   else
      self:setMoveSpeed       ( 1200 )
   end
   self.animationsManager:loopAnimation( "run.caf" )
end

function CKabarog:panic_stop()
   self:setMoveSpeed( 0 )
end

-- ----------------------------- DAMAGE ----------------------------------------------------
function CKabarog:damage_start()
   local animation = "hurt.caf"

   self.fx.blood1:play()
   self.fx.blood2:play()

   if self.animationsManager.currentAnimations[animation] then return end

   if rand(5) > 4 then
      self.animationsManager:playAnimation        ( animation, false )
      self.animationsManager:subscribeAnimationEnd( animation, self, self.damage_stop )
   else
      self:callAnimEvent("hurt")

      runTimer(0, self, CKabarog.damage_stop, false)
   end

   if ( self.senseScheduler:getCurEnemy() ~= nil ) then
      local pushPos = self.senseScheduler:getCurEnemy():getPose():getPos()
      local selfPos = self:getPose():getPos()
      pushPos.x = -(pushPos.x - selfPos.x)
      pushPos.y =  (pushPos.y - selfPos.y) + 180
      pushPos.z = -(pushPos.z - selfPos.z)
      self:push( pushPos, 3000, 0.5 )
   else
      self:setState("search", true)
   end
end

function CKabarog:damage_stop()
   self:setState( "damage", false )
   --log( "-----------------------" )
   --log( self.states )
end

-- ----------------------------- SEARCH ----------------------------------------------------
function CKabarog:search_start()
   -- log("search start")
   -- self:setOrientation( -90 )
   self:setOrientation( 180 )

   if self:getState("swimming") then
      self:setOrientationSpeed( 200 )
   else
      self:setOrientationSpeed( 400 )
   end
   self.animationsManager:loopAnimation( "run.caf" )
   runTimer(0.5, self, self.searchAnimStop, false)
   --self:setOrientationFull( rand(360) )
end

function CKabarog:search_stop()
   self:setMoveSpeed( 0 )
end

function CKabarog:searchAnimStop()
   self:setOrientationSpeed(0)
   self:setState("search", false)
end

-- ----------------------------- ANIM EVENTS ----------------------------------------------------
function CKabarog:animatedEvent(eventType)
   CCharacter.animatedEvent(self, eventType)

   if ( self:getHealth() == 0 and eventType ~= "die" ) then
      return
   end

   --log( "animatedEvent = " .. eventType )

   if ( eventType == "hit" ) then
      self:setState( "damage", true )
   end

   if ( eventType == "die" ) then
      self:OnDie()
   end
end

function CKabarog:OnEnemyHit( params )
   local char = params.target
   local pushPos = self:getPose():getPos()
   local selfPos = char:getPose():getPos()
   pushPos.x = -(pushPos.x - selfPos.x)
   pushPos.y =  (pushPos.y - selfPos.y) + 180
   pushPos.z = -(pushPos.z - selfPos.z)
   char:push( pushPos, 15000, 1.0 )
end

function CKabarog:OnDie()
   self:stopMove()
   self.animationsManager:stopAnimations()
   self.animationsManager:playAnimationWithLock( "death.caf" )

   self.fx.blood2:play()
   self.fx.blood_death:play()

   if ( self.senseScheduler:getLastEnemy() ~= nil ) then
      log( "die enemy = " .. tostring(self.senseScheduler:getLastEnemy()) )
      local pushPos = self.senseScheduler:getLastEnemy():getPose():getPos()
      local selfPos = self:getPose():getPos()
      pushPos.x = -(pushPos.x - selfPos.x)
      pushPos.y =  (pushPos.y - selfPos.y) + 180
      pushPos.z = -(pushPos.z - selfPos.z)
      self:push( pushPos, 3000, 0.5 )
   end

   self.itemsManager:destroyItemByName(self:getWeaponSlotItem().name)
   self.inventory.itemsManager.items = self.itemsManager.items
   self.inventory.itemsManager.idGenerator = self.itemsManager.idGenerator --FIXME: Hack that fixes wrong IDs for newly placed items double inventory system
   self.inventory:setActive( true )
end

function CKabarog:OnLostItem()
   if ( self.inventory:getItemsCount() == 0 ) then
      self:showGibs()
   end
end

function CKabarog:showGibs()
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
   self.gibsFlies:getPose():setParent( self:getPose() )
   self.gibsFlies:play()

   if ( not self.gibsFliesSound ) then
      self.gibsFliesSound = self:createAspect( "flies.wav" )
   end

   self.gibsFliesSound:setPose    ( self:getPose() )
   self.gibsFliesSound:setLoop    ( true )
   self.gibsFliesSound:setDistance( 500 )
   self.gibsFliesSound:setFadeIn  ( 1 )
   self.gibsFliesSound:setFadeOut ( 1 )
   self.gibsFliesSound:play       ()
end

function CKabarog:getLabel()
   return "Hornhog"
end

function CKabarog:getInteractLabel()
   if self:getState("dead") then
      return "loot"
   end
end

function CKabarog:OnSaveState( state )
   CCharacter.OnSaveState(self, state)

   state.gibsVisible = self.gibs ~= nil
   state.dead = self:getState( "dead" )
   if self.installer then
      local pos = self:getPose():getPos()
      state.pos = {x=pos.x, y=pos.y, z=pos.z}
   end
   state.items = self.itemsManager:serialize()
end

function CKabarog:OnLoadState( state )
   if self.installer then
      if state.pos then
         self:getPose():setPos(state.pos)
      end
      local params = {}
      params.load = true
      params.lootItems = {}
      self:initWithParams( params )
   end

   CCharacter.OnLoadState(self, state)

   self.itemsManager:removeAllItems()
   self.itemsManager:deserialize(state.items)
   self.weapon = nil
   self:addWeapon()

   if ( state.dead ) then
      self:die__()
      self:stopSounds()
   end

   if ( state.gibsVisible ) then
      self:showGibs()
   end

   self.lootItems = state.lootItems
end

return {
   CKabarog=CKabarog,
   CKabarogWeak=CKabarogWeak,
}
