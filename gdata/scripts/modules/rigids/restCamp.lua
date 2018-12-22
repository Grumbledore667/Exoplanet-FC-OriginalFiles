local oo = require "loop.simple"
local ItemsData = (require "itemsData")

local CRestCamp = oo.class({})

function CRestCamp:OnCreate()
   self:initWithParams( nil )
end

function CRestCamp:initWithParams( params )
   if ( not params ) then
      self.interactor = self:createAspect( "interactor" )
      self.interactor:setObject( self )
      self.interactor:setRaycastRadius( 100.0 )
      self.interactor:getPose():setParent( self:getPose() )
      self.interactor:getPose():resetLocalPose()
      self.interactor:getPose():setLocalPos( {x=0,y=0,z=0} )
      self.interactor:setRaycastActive( true )
   end

   self.activated = false
end

function CRestCamp:isActivated()
   return self.activated
end

function CRestCamp:activate( obj )
   if ( self.activated ) then
      return false
   end

   if ( obj:restAtCamp(self) ) then
      self.activated = true
      return true
   end
   return false
end

function CRestCamp:deactivate( obj )
   if ( not self.activated ) then
      return false
   end

   if ( obj:leaveCamp(self) ) then
      self.activated = false
      return true
   end
   return false
end

function CRestCamp:getType()
   return "activator"
end

function CRestCamp:getLabel()
   return "Rest Camp"
end

function CRestCamp:getInteractLabel()
   return "rest"
end

return {CRestCamp=CRestCamp}
