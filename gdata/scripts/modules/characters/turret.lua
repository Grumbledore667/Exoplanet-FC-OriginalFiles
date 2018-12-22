local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CActionsScheduler = (require "actionsScheduler").CActionsScheduler
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local ItemsData = (require "itemsData")

local hlp = require "helpers"

local CTurret = oo.class({installer = nil}, CCharacter)

function CTurret:loadParameters()
   self.stats.healthMax = {base = 10000, current = 10000, min = 1}
   self:setStatCount( "health", self.stats.healthMax.current )

   self.senseScheduler:setFeelRadius( loadParamNumber(self, "viewRange", 10000) )

   self.parameters.viewDist     = 3000
   self.parameters.viewAngle    = 170
   self.parameters.backViewDist = 3000
   self.parameters.attackDist   = 2000
   self.parameters.attackAngle  = 30

   self.parameters.patrolSpeed  = 180

   self.patrolTimers = {}
end

function CTurret:initSenses()
   self.senseScheduler:addSense("enemyDetect", false, self.senseScheduler, self.senseScheduler.checkDetect)
   self.senseScheduler:addSense("enemyFront" , false, self.senseScheduler, self.senseScheduler.checkFront)
end

function CTurret:OnCreate()
   CCharacter.OnCreate   ( self )
   CTurret.loadParameters( self )
   CTurret.initSenses    ( self )

   self.activated = false
   self.itemsManager.inventoryType = "turret"

   self:setRole   ( ROLE_TURRET )
   self:addActions()
   self.animationsManager:stopAnimation( "death.caf" )

   self:setState( "patrol", false )
   self:setState( "dead", false )
end

function CTurret:OnDestroy()
   CCharacter.OnDestroy( self )

   self:setOrientationSpeed( 9999 )
   self:setOrientationFull ( 0 )

   self:setState( "dead", true )

   if ( self.gun ) then
      local id = self.gun.id
      self:freeGun()
      self:destroyItem( id )
   end

   self:attack_stop()
   self:stopLasersTimer()

   getScene():destroyEntity( self.base )
   getScene():destroyEntity( self.head )

   if self.installer then
      self.installer:removeInstallation(self)
   end
end

-- params is the table with turret elements
-- params.head - stores head name
-- params.base - stores base model name
function CTurret:initWithParams( params )
   --log ("CTurret:initWithParams")

   self.itemName = "turret.itm"

   self.interactor = self:createAspect( "interactor" )
   self.interactor:setObject( self )
   self.interactor:setTriggerRadius( 130.0 )
   self.interactor:getPose():setParent( self:getPose() )
   self.interactor:getPose():resetLocalPose()
   self.interactor:getPose():setLocalPos( {x=0,y=0,z=0} )
   self.interactor:setTriggerActive( true )

   if ( params.base ) then
      --log ( "CTurret:initWithParams: params.base = " .. tostring(params.base) )
      self.base = getScene():createEntity( params.base, "" )
      self.base:setPose( self:getPose() )
   end

   if ( params.head ) then
      self.head = getScene():createEntity( params.head, "" )
      self.head:setPose( self:getPose() )
      self.head:getPose():setParent( self:getPose() )

      self.lasers = {}
      self.lasers.green = self:createAspect( "laser_green.sbg" )
      self.lasers.green:getPose():setParent( self.head:getPose() )
      self.lasers.green:getPose():resetLocalPose()
      self.lasers.green:getPose():setLocalPos( {x=0,y=140,z=-17} )
      self.lasers.green:playAnimation( "scan", true )
      self.lasers.green:setAnimationSpeed( 4.0 )
      self.lasers.green:setVisible( false )
      self.lasers.green:setMaterials( "lazer_scanner" )

      self.lasers.red = self:createAspect( "laser_red.sbg" )
      self.lasers.red:getPose():setParent( self.head:getPose() )
      self.lasers.red:getPose():resetLocalPose()
      self.lasers.red:getPose():setLocalPos( {x=1,y=140,z=-15} )
      self.lasers.red:setVisible( false )
   end

   if ( params.installerItem and
      params.installerItem.params and
      params.installerItem.params.attachments ) then
      for k,v in pairs(params.installerItem.params.attachments) do
         --log( tostring(v.name) )
         local item = self:addItem( v.name )
         if ( item ) then
            item.count = v.count
         end
      end

      self.gun:OnEquip( self:getWeaponSlot() )
   end
   self:initLookAtData()
end

function CTurret:initLookAtData()
   self.lookAtFactor = 0
   self.headBonePose = self:findBonePose( "item_slot2" )

   if ( not self.headBonePose ) then
      self.headBonePose = self:findBonePose( "head" )
   end
end

function CTurret:giveItem( itemId, char, count )
   local myItem = self.itemsManager:getItemById( itemId )
   local foundItem = char.itemsManager:getItemByName( myItem.name )
   local item   = char:addItem( myItem.name )

   if ( item ) then
      if myItem.count - count <= 0 then
         myItem.count = 1
         self:destroyItem(itemId) -- make sure OnLostItem callback gets called
      else
         myItem:changeCount( -(count) )
      end
      item:changeCount( count - 1 )
      self.itemsManager:updateInventoryUI()
      char.itemsManager:updateInventoryUI()
      if not foundItem then
         item.magazine = myItem.magazine
         item.params = tableDeepCopy( myItem.params )
      end

      if ( self.gun and self.gun.name == myItem.name ) then
         self.gun = nil
         self:setState( "patrol", false )
      end

      return item
   end
   return nil
end

function CTurret:takeItemFrom( itemId, char, count )
   local prevGun = self.gun
   local item    = char:giveItem( itemId, self, count )
   if ( item ) then
      if ( prevGun and not prevGun:isAmmo(item.name) ) then
         self:giveItem( prevGun.id, char, prevGun.count )

         local items         = self.itemsManager.items
         local itemsToReturn = {}

         for i=1,#items do
            if ( prevGun:isAmmo(items[i].name) ) then
               itemsToReturn[#itemsToReturn + 1] = items[i]
            end
         end
         for i=1,#itemsToReturn do
            self:giveItem( itemsToReturn[i].id, char, itemsToReturn[i].count )
         end
      end
      return item
   end

   return nil
end

function CTurret:addItem( itemName )
   if ( self.itemsManager:isMeleeWeapon(itemName) ) then
      return nil
   end

   if ( self.gun and self.gun.name == itemName ) then
      return nil
   end

   if ( self.itemsManager:isItem(itemName) ) then
      if ( self.gun ) then
         if ( self.gun:isAmmo( itemName ) ) then
            local item = self.itemsManager:addItem( itemName )
            self.gun:OnEquip( self:getWeaponSlot() )
            return item
         end
      end
      return nil
   end

   self:freeGun()

   local item = self.itemsManager:addItem( itemName )

   self.gun = item
   self.gun:setPose( self.head:getPose() )
   self.gun:getPose():setParent( self.head:getPose() )
   self.gun:getPose():setLocalPos( {x=0, y=121, z=10} )
   self.gun:show()
   self.gun:OnEquip( self:getWeaponSlot() )

   self:setState( "patrol", true )

   return item
end

function CTurret:freeGun()
   if ( self.gun ) then
      self.gun:getPose():resetParent()
      self.gun:hide()
      self.gun = nil
   end
end

-- Actions
function CTurret:addActions()
   local patrol = CAction{}
   patrol:allowRestartOnEvent("onChangeState")
   patrol.start = self.patrol_start
   patrol.stop  = self.patrol_stop
   patrol.name = "patrol"

   local attack = CAction{}
   attack:allowRestartOnEvent("onChangeState")
   attack.start = self.attack_start
   attack.stop  = self.attack_stop
   attack.name = "attack"

   local damage = CAction{}
   damage:allowRestartOnEvent("onChangeState")
   damage.start = self.damage_start
   damage.stop  = self.damage_stop
   damage.name = "damage"

   local root = CNode{}
   root:yes (self.alive_):yes (self.damage_):no  (self.attack_):no  (patrol)
   root:yes (self.alive_):yes (self.damage_):no  (self.attack_):yes (attack)
   --root:yes (self.alive_):yes (self.damage_):yes (damage)

   self.actionsScheduler.root = root
end


-- Predicates
function CTurret:alive_()
   --log( "-----------------------" )
   --log( self.states )
   return not self:getState( "dead" )
end

function CTurret:attack_()
   if ( self.senseScheduler:getSense("enemyFront") ) then
      return true
   end

   return false
end

function CTurret:damage_()
   return false
end


-- Callbacks
-- ----------------------------- PATROL ----------------------------------------------------
function CTurret:stopPatrolTimers()
   if ( self.patrolTimers[0] ) then
      self.patrolTimers[0]:stop()
      self.patrolTimers[0] = nil
   end

   if ( self.patrolTimers[1] ) then
      self.patrolTimers[1]:stop()
      self.patrolTimers[1] = nil
   end

   if ( self.retargetTimer ) then
      self.retargetTimer:stop()
      self.retargetTimer = nil
   end
end

function CTurret:stopLasersTimer()
   if ( self.lasers.timer ) then
      self.lasers.timer:stop()
      self.lasers.timer = nil
   end
end
--[[
function CTurret:OnFeelIn( char )
   CCharacter.OnFeelIn( self, char )
   log( "turret feel in: " .. char:getName() )
end

function CTurret:OnFeelOut( char )
   CCharacter.OnFeelOut( self, char )
   log( "turret feel out: " .. char:getName() )
end
]]
function CTurret:patrol_start()
   if ( not self:getState( "patrol" ) ) then
      return
   end

   --if ( self.senseScheduler.enemies ) then log( "enemies cnt: " .. tostring(#self.senseScheduler.enemies) ) end
   --if ( self.senseScheduler.curEnemy ) then log( "cur enemy: " .. tostring(self.senseScheduler.curEnemy:getName()) ) end

   self.animationsManager:loopAnimation( "idle.caf" )
   self:stopPatrolTimers()
   self:patrol_checkPauseTurn()

   self.retargetTimer = runTimer( 1, self.senseScheduler, self.senseScheduler.resetCurEnemy, true )
end

function CTurret:patrol_stop()
   self:stopPatrolTimers   ()
   self:setOrientationSpeed( 0 )
   self:stopSound          ( "turret_move.wav" )
end

function CTurret:patrol_checkPauseTurn()
   if ( not self:getState("patrol") or not self:alive_() ) then
      return
   end
   --log("patrol_checkPauseTurn")
   --log("getOrientationFull = " .. tostring(self:getOrientationFull()))
   self.patrolTimers[1] = nil

   self:playSound( "turret_move.wav" )
   self:loopSound( "turret_move.wav", true )
   self:soundDistance( "turret_move.wav", 1000 )

   if ( self.gun and not self.lasers.timer ) then
      self.lasers.timer = runTimer( 2, self, self.lasersDeactivate, false )
   end

   self:setOrientationSpeed( self.parameters.patrolSpeed )
   self:setOrientationFull ( (self.parameters.viewAngle/2+1) * -sign(self:getOrientationFull()) )

   self.patrolTimers[0] = runTimer( 0.2, self, self.patrol_checkStartTurn, false )
end

function CTurret:patrol_checkStartTurn()
   if ( not self:getState("patrol") or not self:alive_() ) then
      return
   end

   self.patrolTimers[0] = nil

   --log("getOrientationFull = " .. tostring(self:getOrientationFull()))

   if ( math.abs( self:getOrientationFull() ) > self.parameters.viewAngle/2 ) then
      self:setOrientationSpeed( 9999 )
      self:setOrientationFull ( (self.parameters.viewAngle/2-1) * sign(self:getOrientationFull()) )
      self.patrolTimers[1] = runTimer( 0.3, self, self.patrol_checkPauseTurn, false )
      self:stopSound( "turret_move.wav" )
   else
      self.patrolTimers[0] = runTimer( 0.2, self, self.patrol_checkStartTurn, false )
   end
end

-- ----------------------------- ATTACK ----------------------------------------------------
function CTurret:attack_start()
   if ( self:getState("attack") or not self.senseScheduler:getCurEnemy() ) then
      return
   end

   self:setState( "attack", true )

   local enemy = self.senseScheduler:getCurEnemy()
   --log( "enemy height = " .. tostring(enemy:getCollisionHeight()) )
   self:setTarget( enemy, {y=enemy:getCollisionHeight()/2} )
   self:attackEvent()

   if ( self.gun ) then
      if ( self.lasers.timer ) then
         self.lasers.timer:stop()
         self.lasers.timer = nil
      end

      self:stopSound( "turret_scan.wav" )
      self.lasers.green:setVisible( false )
      self.lasers.red:setVisible  ( true )
   end
end

function CTurret:lasersDeactivate()
   self:playSound( "turret_scan.wav" )
   self:loopSound( "turret_scan.wav", true )
   self:soundDistance( "turret_scan.wav", 2000 )

   self.lasers.green:setVisible( true )
   self.lasers.red:setVisible  ( false )
   self.lasers.timer = nil
end

function CTurret:attackEvent()
   log( "CTurret:attackEvent" )

   if ( not self.gun ) then
      return
   end

   if ( not self:getState("attack") ) then
      return
   end
   local enemy = self.senseScheduler:getCurEnemy()
   if enemy then
      local pos = enemy:getPose():getPos()
      pos.y = pos.y + 100
      self.gun:setImpactPos(pos)
   end

   self.gun:OnActivate()
   if self.gun.activeAmmo then
      self.gun.magazine = self.gun.magazine + 1
      self.gun.activeAmmo:changeCount( -1 )
      self.itemsManager:updateInventoryUI()
      self.gun:updateOwnerAmmo()
      self.gun:updateActiveAmmo()
   end

   self.attackTimer = runTimer( 0.5, self, self.attackEvent, false )
end

function CTurret:attack_stop()
   if ( self.attackTimer ) then
      self.attackTimer:stop()
      self.attackTimer = nil
   end

   self:setState( "attack", false )
   self:resetTarget()
end

-- Roles
function CTurret:isEnemy( char )
   return CCharacter.isEnemy( self, char ) and ( not self.installer or self.installer ~= char )
end

function CTurret:isIgnore( char )
   return CCharacter.isIgnore( self, char )
end

function CTurret:isFriend( char )
   return CCharacter.isFriend( self, char ) and ( not self.installer or self.installer == char )
end

function CTurret:getType()
   return "turret"
end

function CTurret:getLabel()
   return "Turret"
end

function CTurret:getLabelPos()
   local pos = self:getPose():getPos()
   if self.head then
      pos = self.head:getPose():getPos()
   end
   return vec3Add(pos, {y=200})
end

function CTurret:getInteractLabel()
   return "deinstall"
end

function CTurret:getInteractTime( interactType )
   if ( interactType == "pick" ) then
      return 1
   end

   return 0
end

function CTurret:activate( obj )
   self.activated = true

   self.itemsManager:showInventory( true )

   if ( obj.exchangeStart ) then
      obj:exchangeStart( self )
   end

   return true
end

function CTurret:deactivate( obj )
   self.activated = false

   self.itemsManager:showInventory( false )

   if ( obj.exchangeStop ) then
      obj:exchangeStop()
   end

   return true
end

function CTurret:isActivated()
   return self.activated
end

function CTurret:getAsItem()
   local item = hlp.safeCreateItemWithModel( self.itemName, ItemsData.getItemClass(self.itemName) )

   if ( item ) then
      if ( self.gun ) then
         -- item attachments used to be here. now we just add all items back to player
         local items = self.itemsManager:serialize()

         for i=1,#items do
            if items[i].count > 1 then
               addItemsToPlayer(items[i].name, items[i].count)
            else
               addItemToPlayer(items[i].name)
            end
         end
      end

      getScene():destroyEntity( self )
      item:setVisible( false )
      return item
   else
      log( "Can't create " .. self.itemName )
      return nil
   end
end

function CTurret:setInstaller(obj)
   self.installer = obj
end

function CTurret:OnSaveState(state)
   if self.installer then
      local pos = self:getPose():getPos()
      state.pos = {x=pos.x, y=pos.y, z=pos.z }
      local rot = self:getPose():getRot()
      state.rot = {x=rot.x, y=rot.y, z=rot.z }
      state.inventory = self.itemsManager:serialize()
   end
end

function CTurret:OnLoadState(state)
   if self.installer then
      if state.pos then
         self:getPose():setPos(state.pos)
      end
      if state.rot then
         self:getPose():setRot(state.rot)
      end
      -- TODO:FIXME: get rid of this bullshit system
      local params = (require"items.installation").ItemRecipes["turret.itm"]["turret.cfg"].params
      self:initWithParams(params)

      if state.inventory then
         local rest = {}
         for k, v in pairs(state.inventory) do
            if self.itemsManager:isWeapon(v.name) then
               self:addItem(v.name)
            else
               table.insert(rest, v)
            end
         end
         for k, v in pairs(rest) do
            for i = 1, v.count do
               self:addItem(v.name)
            end
         end
         --         self.itemsManager:deserialize(state.inventory)
      end
   end
end

return {CTurret=CTurret}
