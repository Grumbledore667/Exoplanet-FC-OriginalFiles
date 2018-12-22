local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CBug = (require "characters.bug").CBug
local ai = require "ai"

local CBugGreen = oo.class({}, CBug)

function CBugGreen:OnCreate()
   CBug.OnCreate( self )

   self:disablePickupItem()

   if ( not self.effects ) then
      self.effects = {}
      self.effects.magic = self:createAspect( "antigrav_magic.sps" )
      self.effects.magic:getPose():setParent( self:getPose() )
      self.effects.magic:getPose():resetLocalPose()
      --self.effects.magic:getPose():setLocalPos( {y=-15} )
      --self.effects.magic:getPose():setLocalScale( {x=0.9, y=0.9, z=0.9} )
      self.effects.magic:enable()
   end

   if ( not self.omni ) then
      self.omni = self:createAspect( "omni" )
      self.omni:getPose():setParent( self:getPose() )
      self.omni:getPose():resetLocalPose()
      self.omni:getPose():setLocalPos( {x=0,y=10,z=0} )
      self.omni:setColor( {r=0,g=0.7,b=0} )
      self.omni:setRadius ( 100 )
      self.omni:setVisible( true )
   end

   self.itemType     = "bug_green.itm"
   self.itemTypeDead = "bug_green_dead.itm" -- used for item generation at death (by parent)
end

function CBugGreen:CreateTree()
   self.BT = ai.utils.loadTree("ai.trees.bugGreen", self)
   self.BT:setBlackboard(self.blackboard)
end

function CBugGreen:animatedEvent( eventType )
   CCharacter.animatedEvent(self, eventType)

   if ( self:getHealth() == 0 and eventType ~= "die" ) then
      return
   end

   if ( eventType == "hit" ) then
      self.fx.blood:play()
      self.animationsManager:playAnimation( "hit.caf", false )

      if ( self.senseScheduler:getCurEnemy() ~= nil ) then
         self:stopMove()
         local pushPos = self.senseScheduler:getCurEnemy():getPose():getPos()
         local selfPos = self:getPose():getPos()
         pushPos.x = -(pushPos.x - selfPos.x)
         pushPos.y =  (pushPos.y - selfPos.y) + 180
         pushPos.z = -(pushPos.z - selfPos.z)
         self:push( pushPos, 5000, 1.5 )
      end
   end

   if ( eventType == "die" ) then
      self.fx.blood_death:play()
      self:stopMove()
      self.animationsManager:stopAnimations()
      self.animationsManager:playAnimationWithLock( "death.caf" )
      self.itemsManager:getSlotItem( 0 ):OnDeactivate()

      self:startJump(1000)

      self:enablePickupItem()

      self:hideBait()
   end
end

function CBugGreen:getAsItem()
   local item = CBug.getAsItem(self)
   self:hideBait()
   return item
end

function CBugGreen:hideBait()
   hideObject("q_greenbug_antigravium_bait")
end

function CBugGreen:OnSaveState(state)
   CBug.OnSaveState(self, state)
   state.foodFull = self:getState("foodFull")
end

function CBugGreen:OnLoadState(state)
   CBug.OnLoadState(self, state)
   if state and state.foodFull ~= nil then
      self:setState("foodFull", state.foodFull)
   end
end

return {CBugGreen=CBugGreen}
