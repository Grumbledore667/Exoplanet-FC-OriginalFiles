local oo = require "loop.simple"

local CDynamicFloor = oo.class({})

function CDynamicFloor:OnCreate()
   log("CREATE FLOOR")
   self:initWithParams( nil )
end

function CDynamicFloor:initWithParams( params )
   self.activated = false
end

function CDynamicFloor:isActivated()
   return self.activated
end

function CDynamicFloor:activate( obj )
   log("ACTIVATE")
   if not self.activated then
      self.activated = true
      self.collisionBox = self:createAspect( "collision_box_dyn.sbg" )
      local pos = self:getPose():getPos()
      pos.y = pos.y - 50
      self.collisionBox:getPose():setPos( pos )
      --self:getPose():setParent( self.collisionBox:getPose() )
      --self:getPose():resetLocalPose()
   end
end

function CDynamicFloor:deactivate( obj )
end

return {CDynamicFloor=CDynamicFloor}
