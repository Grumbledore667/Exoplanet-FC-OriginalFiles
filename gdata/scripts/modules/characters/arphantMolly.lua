local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CTalker = (require "characters.talker").CTalker

local CArphantMolly = oo.class( {}, CTalker )

function CArphantMolly:loadParameters()
   self.stats.healthMax = {base = 2000, current = 2000, min = 1}
   self:setStatCount( "health", self.stats.healthMax.current )

   self.interactor:getPose():setLocalPos({x=0,y=150,z=0})
   self.interactor:setTriggerRadius( 350 )
   self.interactor:setTriggerActive( true )
   self.interactor:setRaycastRadius( 450 )
   self.interactor:setRaycastActive( true )
end

function CArphantMolly:OnCreate()
   CTalker.OnCreate( self )

   CArphantMolly.loadParameters( self )
   self:subscribeOnDeath(self.OnDeath, self)
end

function CArphantMolly:animatedEvent( eventType )
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
      self.animationsManager:playAnimationWithLock( "death.caf" )
   end
end

function CArphantMolly:OnDeath( self )
   self.interactor:setTriggerActive(false)
end

function CArphantMolly:onStartMessage()
   self.animationsManager:loopAnimation( "idle_talk.caf" )
end

function CArphantMolly:onStopMessage()
   self.animationsManager:loopAnimation( self.idleAnimation .. ".caf" )
end

return {CArphantMolly=CArphantMolly}
