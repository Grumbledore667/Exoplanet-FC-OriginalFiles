local oo = require "loop.simple"
local CPlayer = (require "player").CPlayer
local CCharacter = (require "character").CCharacter
local player = (require "player")
local ItemsData = (require "itemsData")

local hlp = require "helpers"

local CMainCharacterBug = oo.class({}, CPlayer)

function CMainCharacterBug:init()
   CMainCharacterBug.loadParameters( self )

   self.parameters.runSpeed  = 200.0
   self.parameters.walkSpeed = 100.0

   self:setRole( ROLE_INSECT )

   self.animationsManager:stopAnimation( "death.caf" )

   self.weapon = hlp.safeCreateItemWithoutModel("bug_bite.wpn", "CWeapon")
   self.weapon:setDamage(20)
   self.weapon:setOffset(false)
   self.weapon:setDimensions(25, 0)
   self.weapon = self.itemsManager:addItemObj( self.weapon )
   self.itemsManager:equipSlotWithItem( 0, self.weapon.id, true )
end

function CMainCharacterBug:loadParameters()
   self.animations =
      {
         idle =
         {
            default = "idle.caf",
            jump    = { default = "jump_front.caf" },
            attack  = { default = "suck.caf" },
         },
         walk =
         {
            back =
            {
               default = "walk_front.caf",
               jump    = { default = "jump_front.caf" },
               attack  = { default = "suck.caf" },
            },
            front =
            {
               default = "walk_front.caf",
               jump    = { default = "jump_front.caf" },
               attack  = { default = "suck.caf" },
            },
            left =
            {
               default = "walk_left.caf",
               jump    = { default = "jump_front.caf" },
               attack  = { default = "suck.caf" },
            },
            right =
            {
               default = "walk_right.caf",
               jump    = { default = "jump_front.caf" },
               attack  = { default = "suck.caf" },
            },
         },
         run =
         {
            back =
            {
               default = "run_front.caf",
               jump    = { default = "jump_front.caf" },
               attack  = { default = "suck.caf" },
            },
            front =
            {
               default = "run_front.caf",
               jump    = { default = "jump_front.caf" },
               attack  = { default = "suck.caf" },
            },
            left =
            {
               default = "run_left.caf",
               jump    = { default = "jump_front.caf" },
               attack  = { default = "suck.caf" },
            },
            right =
            {
               default = "run_right.caf",
               jump    = { default = "jump_front.caf" },
               attack  = { default = "suck.caf" },
            },
         },
         hit =
         {
            default = "hit.caf",
         },
         die =
         {
            default = "death.caf",
         },
      }

   self.weaponSlots = {}
   self.weaponSlots[0] = {"empty",}
   self.weaponSlots[1] = {"machete.wpn", "axe.wpn",}

   self.parameters.velocityFactor = 0.4
   self.parameters.weaponSlotId   = 0
end

function CMainCharacterBug:OnCreate()
   --log( "CMainCharacterBug:OnCreate()" )

   CPlayer.OnCreate      ( self )
   CMainCharacterBug.init( self )
   setGlobalParam("firstTimeBug", false)

   self:subscribeOnDeath(function(self)
      if self.carryItem then
         self:dropItem()
      end
   end, self)
end

-- animations
function CMainCharacterBug:animatedMoveEvent( moveType, dirType )
   if ( not self.ownerPlayer ) then
      return
   end

   local animations   = nil
   local animationSet = self.itemsManager:getSlotAnimationSet( self.parameters.weaponSlotId )
   local jumpAnims    = nil
   local attackAnims  = nil

   if ( not self.animations[moveType] ) then
      return
   else
      if ( not self.animations[moveType][dirType] or not dirType ) then
         animations = self.animations[ moveType ][ animationSet ]
         if ( not animations ) then
            animations = self.animations[ moveType ][ "default" ]
         end
         jumpAnims   = self.animations[ moveType ]["jump"]
         attackAnims = self.animations[ moveType ]["attack"]
      else
         animations = self.animations[ moveType ][ dirType ][ animationSet ]
         if ( not animations ) then
            animations = self.animations[ moveType ][ dirType ][ "default" ]
         end
         jumpAnims   = self.animations[ moveType ][ dirType ]["jump"]
         attackAnims = self.animations[ moveType ][ dirType ]["attack"]
      end
   end

   local animation = animations

   if ( type(animations) == "table" ) then
      animation = animations[1]
   end

   if ( self:getState("inAir") ) then
      return
   end

   self.animationsManager:loopAnimation( animation )

   if ( jumpAnims ) then
      self.animations.jump = jumpAnims[ animationSet ]

      if ( not self.animations.jump ) then
         self.animations.jump = jumpAnims[ "default" ]
      end
   end

   if ( attackAnims ) then
      self.animations.attack = attackAnims[ animationSet ]

      if ( not self.animations.attack ) then
         self.animations.attack = attackAnims[ "default" ]
      end
   end
end

function CMainCharacterBug:animatedEvent( eventType )
   if ( not self.ownerPlayer ) then
      return
   end

   CPlayer.animatedEvent(self, eventType)

   if ( not self.animations[eventType] ) then
      return
   end

   if (eventType == "attack") then
      self:stopMove()
      self:setState("disableAttack", true)
      self:setState("disableMove"  , true)
      self:setState("disableJump"  , true)
      self:onAttackAnimationIn()

      self.animationsManager:playAnimation       ( self.animations.attack )
      self.animationsManager:addAnimationCallback( self.animations.attack, self, self.onAttackAnimationStop )

      -- jump
   elseif (eventType == "jump") then
      self.animationsManager:loopAnimation( self.animations.jump )
      self:onAttackAnimationIn()
      -- land
   elseif (eventType == "land") then
      self:onAttackAnimationOut()
      -- hit
   elseif (eventType == "hit") then
      self.animationsManager:playAnimation( self.animations.hit.default )
      -- die
   elseif (eventType == "die") then
      self.animationsManager:playAnimationWithLock( self.animations.die.default )
      self:onAttackAnimationOut()
      runTimer( 2, self, self.activateObject, false )
   end
end

function CMainCharacterBug:onAttackAnimationIn()
   self.weapon:OnActivate()
end

function CMainCharacterBug:onAttackAnimationOut()
   self.weapon:OnDeactivate()
end

function CMainCharacterBug:onAttackAnimationStop()
   self.weapon:OnDeactivate()

   self:setState( "disableAttack", false )
   self:setState( "disableMove"  , false )
   self:setState( "disableJump"  , false )
end

function CMainCharacterBug:updateCamera()
   self:setCameraHeight( 50, 0 )
   self:setCameraDist  ( 50, 0 )
   self:setCameraFov   ( 75, 0 )
end

function CMainCharacterBug:activateObject()
   if ( not self.ownerPlayer ) then
      return
   end

   self:stopSounds()
   self.animationsManager:stopAnimations()

   self:resetButtons()

   --self:dropItem()

   self.weapon:OnDeactivate()

   runTimer( 0, self.ownerPlayer, self.ownerPlayer.stopControlObject, false )
   self.ownerPlayer = nil
end

function CMainCharacterBug:hit(damage, charAttacker)
   if self:getState("dead") then return end
   CPlayer.hit( self, damage, charAttacker )
   self:dropItem()
end

function CMainCharacterBug:dropItem()
   if self.holdingItem then
      local p = self.holdingItem:getPose()
      p:resetParent()
      local rot = p:getRot()
      p:setRot{x=0,y=rot.y,z=0}

      local pos = p:getPos()
      p:setPos{x=pos.x,y=self:getPose():getPos().y+20,z=pos.z}

      p:resetLocalPos()

      self.holdingItem.interactor:setTriggerActive(true)
      self.holdingItem:setCollisionObjects(true)
      self.holdingItem.package = false
      self.holdingItem = nil
   end
end

local function getKosherFocusObj()
   local pick = gameplayUI:getFocusObj()
   if not pick or not pick.getScriptClass or pick:getScriptClass() ~= "CSmallRigid" then
      pick = nil
   end
   return pick
end

function CMainCharacterBug:OnControlDown( code )
   if ( not CPlayer.OnControlDown( self, code ) ) then
      return false
   end

   if ( code == getButtonCode( "ATTACK" ) ) then
   elseif ( code == getButtonCode( "ACTIVATE" ) ) then
      if not getKosherFocusObj() and not self.holdingItem then
         gameplayUI:showInteractProgress( "Release bug", 3 )

         self.interactTimer = runTimer( 3, self,  function ( obj )
            if getButton( "ACTIVATE" ) then
               gameplayUI:hideInteractProgress()
               self:activateObject()
            end
         end, false )
      end
   end

   return true
end

function CMainCharacterBug:OnControlUp( code )
   if ( not CPlayer.OnControlUp( self, code ) ) then
      return false
   end

   if ( code == getButtonCode( "ATTACK" ) ) then
   elseif ( code == getButtonCode( "ACTIVATE" ) ) then
      local pick = getKosherFocusObj()

      if ( self.holdingItem ) then
         self:dropItem()
      elseif pick then
         self:carryItem(pick)
         pick.package = true
      else
         if self.interactTimer then
            self.interactTimer:stop()
            self.interactTimer = nil
         end
         gameplayUI:hideInteractProgress()
      end
   end

   return true
end

function CMainCharacterBug:OnLanding( landingSpeed )
   CPlayer.OnLanding( self, landingSpeed )
   if landingSpeed < -200 then -- TODO: FIXME: for some reason this function is called almost every frame with a value of ~-5
      self.itemsManager:getSlotItem( 0 ):OnDeactivate()
   end
end

function CMainCharacterBug:carryItem(smallRigid)
   if self.holdingItem then
      return
   end
   if smallRigid then
      self.holdingItem = smallRigid
      self.holdingItem.interactor:setTriggerActive(false)
      self.holdingItem:setCollisionObjects(false)
      self.holdingItem:setCollisionCharacters( false, false )
      self.holdingItem:getPose():setParent(self:getBonePose("item_slot0"))
      self.holdingItem:getPose():setLocalPos({y=10})
   end
end


function CMainCharacterBug:addExp( value, silent )
   getDefaultPlayer():addExp( value, silent )
end

return {CMainCharacterBug=CMainCharacterBug}
