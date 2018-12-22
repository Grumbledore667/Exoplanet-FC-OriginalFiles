local oo = require "loop.simple"

local CRigid = oo.class({
   activated = false,
   item = nil,
})

function CRigid:OnCreate()
end

function CRigid:OnDestroy()
end

function CRigid:OnTouchCharacter( obj )
--[[
   if ( self.activated ) then
      --return
   end
   
   self.activated = true
   
   log( "OnTouchCharacter: " .. obj:getName() )
   
   if ( not self.sound ) then
      self.sound = self:createAspect( "waterfall_big.wav" )
   end
   
   self.sound:play()
   self.sound:setPose( self:getPose() )
   ]]
end

function CRigid:OnUntouchCharacter( obj )
--[[
   log( "OnUntouchCharacter: " .. obj:getName() )
   
   self.sound:stop()
   ]]
end

function CRigid:OnHit(params)
-- impactor - damage source object (item)
-- impactType - string (ranged, melee, explosion)
-- impactPos - impact position
-- impactForce - set by engine, can be changed
-- impactRadius - set by engine, can be changed
-- target - target object (character, rigid)
-- targetType - target type (string) (character, rigid)
-- interrupt - boolean, defaults to false. if set to true - stops hit event propagation
end

function CRigid:OnSaveState(state)
   state.pos = self:getPose():getPos()
end

function CRigid:OnLoadState(state)
   if state.pos then
      self:getPose():setPos(state.pos)
   end
end

return {CRigid=CRigid}
