local oo = require "loop.simple"
-- local CAnimationsManager = (require "animationsManager").CAnimationsManager
-- local CNotificationCenter = (require "notificationCenter").CNotificationCenter

local COpenClose = oo.class({})

function COpenClose:OnCreate()
   self.interactor = self:createAspect( "interactor" )
   self.interactor:setObject( self )
   self.interactor:setRaycastRadius( 100.0 )
   self.interactor:getPose():setParent( self:getPose() )
   self.interactor:getPose():resetLocalPose()
   self.interactor:setRaycastActive( true )

   self.sounds = {}
   self.sounds.open = self:createAspect( "door_slide_open.wav" )
   self.sounds.open:getPose():setParent( self:getPose() )
   self.sounds.open:getPose():resetLocalPose()
   self.sounds.open:setLoop( false )

   self.visibleLabel = loadParam( self, "visibleLabel", "Togglable Object" )

   self:subscribeAnimationStop( self.animStop, self )

   self.opened    = false
   self.animating = false
end

function COpenClose:animStop()
   self.animating = false
end

function COpenClose:activate( obj )
   if ( self.animating ) then
      return false
   end

   self.animating = true
   if ( not self.opened ) then
      self:playAnimation( "open", false )
      -- TODO: FIXME: WORKAROUND: bug with some rigids not calling subscribeAnimationStop
      -- function after the animation stops!
      runTimer(3, self, self.animStop, false)
      self.opened = true
   else
      self:playAnimation( "close", false )
      runTimer(3, self, self.animStop, false)
      self.opened = false
   end


   self.sounds.open:play()

   return true
end

function COpenClose:deactivate( obj )
   return true
end

function COpenClose:closeDoor()
   if ( not self.opened or self.animating ) then
      return false
   end

   self.animating = true
   self:playAnimation( "close", false )
   runTimer(3, self, self.animStop, false)

   self.sounds.open:play()

   self.opened = false
   return true
end

function COpenClose:getType()
   return "activator"
end

function COpenClose:getLabel()
   return self.visibleLabel
end

function COpenClose:getLabelPos()
   return vec3Add(self.interactor:getPose():getPos(), {y=150})
end

function COpenClose:getInteractLabel()
   if (self.opened) then
      return "close"
   else
      return "open"
   end
end

function COpenClose:OnSaveState(state)
   state.opened = self.opened
end

function COpenClose:OnLoadState(state)
   if state.opened then
      self.opened = true
      self:playAnimation( "open", false )
   end
end

return {COpenClose=COpenClose}
