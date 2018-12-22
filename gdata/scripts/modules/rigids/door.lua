local oo = require "loop.simple"

local CDoor = oo.class({})

function CDoor:OnCreate()
   self.interactor = self:createAspect( "interactor" )
   self.interactor:setObject( self )
   self.interactor:setTriggerRadius( 200.0 )
   self.interactor:setRaycastRadius( 100.0 )
   self.interactor:getPose():setParent( self:getPose() )
   self.interactor:getPose():resetLocalPose()
   self.interactor:getPose():setLocalPos( {x=0,y=150,z=-150} )
   self.interactor:setTriggerActive( true )
   self.interactor:setRaycastActive( true )

   self.sounds = {}
   self.sounds.open = self:createAspect( "door_slide_open.wav" )
   self.sounds.open:getPose():setParent( self:getPose() )
   self.sounds.open:getPose():setLocalPos( {x=0,y=0,z=-150} )
   self.sounds.open:getPose():resetLocalPose()
   self.sounds.open:setLoop( false )

   self.opened    = false
   self.animating = false

   self:subscribeAnimationStop( self.animStop, self )

   self.disableOnOpen = loadParam( self, "disableOnOpen", false )

   if ( self.isMaterialHelper and not self:isMaterialHelper() ) then
      self:addMaterial( "highlight" )
      self:setMaterialVisible( "highlight", false )
   end
end

function CDoor:OnInteractTriggerEnd( obj )
   if self.disableOnOpen then
      return
   elseif ( not self:closeDoor() ) then
      runTimer( 1, self, self.closeDoor, false )
   end
end

function CDoor:OnFocusBegin( obj )
   if ( self.setMaterialVisible ) then
      self:setMaterialVisible( "highlight", true )
   end
end

function CDoor:OnFocusEnd( obj )
   if ( self.setMaterialVisible ) then
      self:setMaterialVisible( "highlight", false )
   end
   if self.opened and not objInDist(obj:getPose():getPos(), self:getPose():getPos(), self.interactor:getTriggerRadius()) then
      self:OnInteractTriggerEnd(obj)
   end
end

function CDoor:animStop()
   self.animating = false
end

function CDoor:activate( obj )
   if ( self.opened or self.animating ) then
      return false
   end

   self.animating = true
   self:playAnimation( "open", false )

   self.sounds.open:play()

   self.opened = true
   if self.disableOnOpen then
      self.interactor:setTriggerActive(false)
   end
   return true
end

function CDoor:deactivate( obj )
   return true
      --self:closeDoor()
end

function CDoor:closeDoor()
   if ( not self.opened or self.animating ) then
      return false
   end

   self.animating = true
   self:playAnimation( "close", false )

   self.sounds.open:play()

   self.opened = false
   return true
end

function CDoor:getType()
   return "activator"
end

function CDoor:getLabel()
   return "Door"
end

function CDoor:getLabelPos()
   return self.interactor:getPose():getPos()
end

function CDoor:getInteractLabel()
   return "open"
end

function CDoor:OnSaveState(state)
   state.opened = self.opened
   state.interactor = self.interactor:getTriggerActive()
end

function CDoor:OnLoadState(state)
   if state.opened then
      self.opened = state.opened
      self:playAnimation("open", false)
   end
   if state.interactor == true then
      self.interactor:setTriggerActive(true)
   elseif state.interactor == false then
      self.interactor:setTriggerActive(false)
   end
end

return {CDoor=CDoor}
