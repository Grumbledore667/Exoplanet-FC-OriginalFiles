local oo = require "loop.simple"

local CCharacter = (require "character").CCharacter
local CInventory = (require "inventory").CInventory
local CEventManager = (require "notificationCenter2").CNotificationCenter

local hlp = require "helpers"

local ai = require "ai"

local CCrat = oo.class({}, CCharacter)
local CCratEating = oo.class({}, CCrat)
local CCratWeak = oo.class({}, CCrat)

local IDLE_ANIMATIONS = {"idle_2.caf", "idle_3.caf"}

function CCratWeak:OnCreate()
   CCrat.OnCreate(self)

   self.stats.healthMax = {base = 100, current = 100, min = 1}
   self:setStatCount( "health", self.stats.healthMax.current )
end

function CCratWeak:getLabel()
   return "Juvenile Crucass"
end

function CCratWeak:addWeapon()
   CCrat.addWeapon( self )
   self.weapon:setDamage(6)
end

function CCrat:initWithParams( params )
   local healthMax = params.healthMax or 200
   self.stats.healthMax = {base = healthMax, current = healthMax, min = 1}
   self:setStatCount( "health", self.stats.healthMax.current )

   self.senseScheduler:setFeelRadius( loadParamNumber(self, "viewRange", 10000) )

   self.parameters.maxLandingSpeed = 1800

   self.parameters.viewDist        = 2000
   self.parameters.viewAngle       = 180
   self.parameters.backViewDist    = 400
   self.parameters.warnDist        = 600
   self.parameters.attackDist      = 250
   self.parameters.attackAngle     = 100

   self.parameters.zoneSize         = 1000 -- 10 meter

   self.parameters.defenceDist     = 200

   self.parameters.enemySpotted    = 0

   self.headLookingLimits = {x=10, y=45, z=0}

   self.standardLoot = params.standardLoot or {}
   self.lootItems = params.lootItems or loadParamItemCounts( self, "lootItems", {} )

   if not params.load then
      for name, count in pairs(self.standardLoot) do
         for _=1, count do
            self.itemsManager:addItem(name)
         end
      end
      for name, count in pairs(self.lootItems) do
         for _=1, count do
            self.itemsManager:addItem(name)
         end
      end
   end

   self:addWeapon()
end

function CCrat:addWeapon()
   if not self.weapon then
      self.weapon = hlp.safeCreateItemWithoutModel("crucass_bite.wpn", "CWeapon")
      self.weapon:setOffset(false)
      self.weapon:setDimensions(25, 0)
      self.weapon = self.itemsManager:addItemObj( self.weapon )
      self.itemsManager:equipSlotWithItem( 1, self.weapon.id, true )
      self.weapon:setDamage(20)
   end
end

function CCrat:initSenses()
   self.senseScheduler:addSense("inZone"     , false, self.senseScheduler, self.senseScheduler.checkZone)
   self.senseScheduler:addSense("enemyDetect", false, self.senseScheduler, self.senseScheduler.checkDetect)
   self.senseScheduler:addSense("enemyClose" , false, self.senseScheduler, self.senseScheduler.checkClose)
   self.senseScheduler:addSense("enemyFront" , false, self.senseScheduler, self.senseScheduler.checkFront)
   self.senseScheduler:addSense("enemyWarn"  , false, self.senseScheduler, self.senseScheduler.checkWarn)
end

function CCrat:OnCreate()
   CCharacter.OnCreate(self)

   CCrat.initWithParams( self, { standardLoot = {["meat.itm"] = 1} } )
   CCrat.initSenses    ( self )

   self.inventory = CInventory{}
   self.inventory:init     ( self )
   self.inventory:setActive( false )
   self.inventory:setRadius( 300 )
   --self.inventory:addItems( loadParamStrings( self, "items", nil ) )

   self:setRole   ( ROLE_ANIMAL )
   self.animationsManager:stopAnimation( "die.caf" )

   self.eventManager = CEventManager{owner=self}
   self.eventManager:init()
   self:CreateTree()
end

function CCrat:setupTimers( freq )
   self:stopTimers()

   self.senseScheduler.timer = runTimer( freq, self.senseScheduler, self.senseScheduler.OnIdle, true )
   self.behaviorTreeTimer    = runTimer( freq, nil, function ()
      if(self.BT) then
         self.BT:tick()
         self.eventManager:removeNotifications()
      end
   end, true )
end

function CCrat:stopTimers()
   CCharacter.stopTimers(self)

   if ( self.behaviorTreeTimer ) then
      self.behaviorTreeTimer:stop()
      self.behaviorTreeTimer = nil
   end
end

function CCrat:CreateTree()
   self.BT = ai.utils.loadTree("ai.trees.crucas", self)
   self.BT:setBlackboard(self.blackboard)
end

function CCrat:OnDestroy()
   CCharacter.OnDestroy(self)
   if self.installer then
      self.installer:removeInstallation(self)
   end
end

function CCrat:hit(damage, charAttacker)
   CCharacter.hit(self, damage, charAttacker)
   self:setState("damage", true)
end

function CCrat:OnStuckIn()
end

function CCrat:OnStuckOut()
end

function CCrat:warn_start()
   self:setThreatFlag(false)
   self.animationsManager:loopAnimation("idle_1.caf")
   self.animationsManager:playAnimation("threat.caf")
   self:playSound("crat_threat.wav")
end

function CCrat:warn_stop()
end

function CCrat:setThreatFlag(value)
   self.canUseThreat = value
end

function CCrat:walk_start()
   self:setThreatFlag(true)
   self:setOrientationSpeed( 500 )
   self:setMoveSpeed( 200 )
   self.animationsManager:loopAnimation( "walk.caf" )

   if ( not self.senseScheduler:getSense("inZone") ) then
      self:setOrientation( getTargetAngleDir(self, self.senseScheduler:getCurZone()) )
   else
      self:setOrientation( rand(360) )
   end
   self.timer = runTimer(rand(5), nil,nil,false)
end

function CCrat:walk_running()
   return self.timer:getTimeLeft() > 0
end

function CCrat:walk_stop()
-- self.animationsManager:stopAnimations()
   self:stopMove()
end

function CCrat:idle_start()
   self:setThreatFlag(true)
   self:stopMove()
   self.animationsManager:loopAnimation( "idle_1.caf" )
   self.timer = runTimer(rand(5), nil,nil,false)
end

function CCrat:idle_running()
   return self.timer:getTimeLeft() > 0
end

function CCrat:idle_stop()
-- self.animationsManager:stopAnimations()
end

function CCrat:eat_dead_start()
   self:setThreatFlag(true)
   self.animationsManager:loopAnimation("idle_1.caf")
   self.animationsManager:playAnimation("eat.caf")
end

function CCrat:eat_dead_stop()
   self.animationsManager:stopAnimations()
end

function CCrat:shortIdle_start()
   self:setThreatFlag(true)
   self:stopMove()
   local animation = randChoice(IDLE_ANIMATIONS)
   self.animationsManager:loopAnimation( animation)
   self.timer = runTimer(rand(1.5), nil,nil,false)
end

function CCrat:shortIdle_running()
   return self.timer:getTimeLeft() > 0
end

function CCrat:shortIdle_stop()
--  self.animationsManager:stopAnimations()
end

-- -- ----------------------------- CHASE ----------------------------------------------------
function CCrat:chase_start()
   self:setThreatFlag(false)
   self:setOrientationSpeed( 400 )
   self:setMoveSpeed       ( 400 )
   self.animationsManager:loopAnimation( "run.caf" )
   self:setTarget( self.senseScheduler:getCurEnemy(), {y=100} )
end

function CCrat:chaseSwim_start()
   self:setThreatFlag(false)
   self:setOrientationSpeed( 400/3 )
   self:setMoveSpeed       ( 400/3 )
   self.animationsManager:loopAnimation( "walk.caf" )
   self:setTarget( self.senseScheduler:getCurEnemy(), {y=100} )
end

function CCrat:chase_stop()
   self:stopMove()
   self:resetTarget()
end

function CCrat:chase_dead_start()
   self:setThreatFlag(false)
   self:setOrientationSpeed( 400 )
   self:setMoveSpeed       ( 400 )
   self.animationsManager:loopAnimation( "run.caf" )
   self:setTarget( self.senseScheduler:getClosestCorpse(), {y=100} )
end

function CCrat:chase_dead_stop()
   self:stopMove()
   self:resetTarget()
end

function CCrat:face_enemy_start()
   -- the manual setOrientation instead of setTarget is deliberate, just to test
   -- an alternative approach. TODO:FIXME: should probably replace with setTarget
   self:setOrientationSpeed(100)
   self:setOrientation( getTargetAngleDir(self, self.senseScheduler:getCurEnemy():getPose():getPos()) )
   local targetAngle = getTargetAngle(self, self.senseScheduler:getCurEnemy():getPose():getPos())
   if targetAngle < 0 then
      self.animationsManager:loopAnimation("turn_left.caf")
   else
      self.animationsManager:loopAnimation("turn_right.caf")
   end
end

function CCrat:face_enemy_running()
   local enemy = self.senseScheduler:getCurEnemy()
   if enemy then
      local enemyPos = enemy:getPose():getPos()
      self:setOrientation(getTargetAngleDir(self, enemyPos))

      --TODO:FIXME: refactor into getTargetAngleFlat
      local targetAngle = getTargetAngle(self, vec3Add(vec3Mul(enemyPos, {x=1,y=0,z=1}), {y=self:getPose():getPos().y}))
      if targetAngle < 0 then
         self.animationsManager:loopAnimation("turn_left.caf")
      else
         self.animationsManager:loopAnimation("turn_right.caf")
      end
      if math.abs(targetAngle) > 10 then
         return true
      end
   end
   return false
end

function CCrat:face_enemy_stop()
   self:setOrientationSpeed(0)
   self.animationsManager:loopAnimation("idle_1.caf")
end

-- -- ----------------------------- ATTACK ----------------------------------------------------
function CCrat:attack_start()
   self:setThreatFlag(false)
   self:stopMove()
   self:setOrientationSpeed( 200 )
   self:setOrientation     ( getTargetAngleDir(self, self.senseScheduler:getCurEnemy():getPose():getPos()) )

   local pushPos = self.senseScheduler:getCurEnemy():getPose():getPos()
   local selfPos = self:getPose():getPos()
   pushPos.x = (pushPos.x - selfPos.x)
   pushPos.y = (pushPos.y - selfPos.y)
   pushPos.z = (pushPos.z - selfPos.z)
   --self:push( pushPos, 15000, 1.0 )

   local attackAnim = "attack.caf"

   self.animationsManager:playAnimation( attackAnim )
   self.animationsManager:subscribeAnimationEventIn(attackAnim, "attack", self, self.onAttackAnimationIn)
   self.animationsManager:subscribeAnimationEventOut(attackAnim, "attack", self, self.attack_stop)
   self:playSound("crat_attack.wav")
end

function CCrat:onAttackAnimationIn()
   self.weapon:OnActivate()
end

function CCrat:attack_stop()
   self.weapon:OnDeactivate()
end

function CCrat:damaged_start()
   self:setThreatFlag(false)
   self.animationsManager:loopAnimation("idle_1.caf")
   self.animationsManager:playAnimation("hit__hurt.caf", false)
end

function CCrat:damaged_stop()
   self:setState("damage", false)
end

function CCrat:death_start()
   self:stopMove()
   self.animationsManager:stopAnimations()
   self.animationsManager:playAnimationWithLock( "die.caf" )

   if ( self.senseScheduler:getLastEnemy() ~= nil ) then
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

   self.BT = nil
   self:stopTimers()
end

function CCrat:death_stop()
end

function CCrat:OnLostItem()
   if ( self.inventory:getItemsCount() == 0 ) then
      self:showGibs()
   end
end

function CCrat:showGibs()
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
   self.gibsFliesSound:setFadeIn  ( 1 )
   self.gibsFliesSound:setFadeOut ( 1 )
   self.gibsFliesSound:play       ()
end

function CCrat:getLabel()
   return "Crucass"
end

function CCrat:getInteractLabel()
   if self:getState("dead") then
      return "loot"
   end
end

function CCrat:setInstaller(obj)
   self.installer = obj
end

function CCrat:OnSaveState( state )
   CCharacter.OnSaveState(self, state)

   state.gibsVisible = self.gibs ~= nil
   state.dead = self:getState( "dead" )
   -- dynamic object spawned by installer
   if self.installer then
      local pos = self:getPose():getPos()
      state.pos = {x=pos.x, y=pos.y, z=pos.z}
   end
   state.items = self.itemsManager:serialize()
end

function CCrat:OnLoadState( state )
   local params = {}
   params.load = true

   if self.installer then
      if state.pos then
         self:getPose():setPos(state.pos)
      end

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
end

return {
   CCrat=CCrat,
   CCratWeak=CCratWeak,
   CCratEating=CCratEating,
}
