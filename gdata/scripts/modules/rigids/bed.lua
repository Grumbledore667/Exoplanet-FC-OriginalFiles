local oo = require "loop.simple"
local ItemsData = (require "itemsData")

local CBed = oo.class({})

function CBed:OnCreate()
   self:initWithParams( nil )
end

function CBed:initWithParams( params )
   if ( not params ) then
      self.interactor = self:createAspect( "interactor" )
      self.interactor:setObject( self )
      self.interactor:setRaycastRadius( 100.0 )
      self.interactor:getPose():setParent( self:getPose() )
      self.interactor:getPose():resetLocalPose()
      self.interactor:getPose():setLocalPos( {x=0,y=0,z=0} )
      self.interactor:setRaycastActive( true )

      self.owner = loadParam(self, "owner", "")
   end

   self.activated = false
end

function CBed:isActivated()
   return self.activated
end

function CBed:activate( obj )
   if ( self.activated ) then
      return false
   end
   if self.owner == "" or self.owner == "player" then
      if ( obj:restAtBed(self) ) then
         --save interactTarget from interactStop
         runTimer(0, self, function(self) obj.interactTarget = self end, false)
         self.activated = true
         self:setCollisionCharacters(false, false)
         return true
      end
   else
      gameplayUI:showInfoTextEx( "It's not your bed", "minor", "" )
   end
   return false
end

function CBed:deactivate( obj )
   if ( not self.activated ) then
      return false
   end

   if ( obj:leaveBed(self) ) then
      self.activated = false
      self:setCollisionCharacters(true, true)
      return true
   end
   return false
end

function CBed:getType()
   return "activator"
end

function CBed:getLabel()
   return "Bed"
end

function CBed:getInteractLabel()
   return "sleep"
end

return {CBed=CBed}
