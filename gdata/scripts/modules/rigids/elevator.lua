local oo = require "loop.simple"

local CElevator = oo.class({})

function CElevator:OnCreate()
   self.interactor = self:createAspect( "interactor" )
   self.interactor:setObject( self )
   self.interactor:setRaycastRadius( 150.0 )
   self.interactor:getPose():setParent( self:getPose() )
   self.interactor:getPose():resetLocalPose()
   self.interactor:getPose():setLocalPos( {x=0,y=150,z=0} )
   self.interactor:setRaycastActive( true )
   self.destinationObj = loadParamObjects( self, "obj", nil )[1]

   self.sounds = {}

   self.disabled = false

   if self.isMaterialHelper and not self:isMaterialHelper() then
      self:addMaterial( "highlight" )
      self:setMaterialVisible( "highlight", false )
   end
end

function CElevator:OnFocusBegin( obj )
   if self.setMaterialVisible then
      self:setMaterialVisible( "highlight", true )
   end
end

function CElevator:OnFocusEnd( obj )
   if self.setMaterialVisible then
      self:setMaterialVisible( "highlight", false )
   end
end

function CElevator:OnInteractHighlightBegin( obj )
   if not self.setMaterialVisible then
      return
   end

   self:stopHighlightTimer()

   self.highlightTimer = runTimer( 2, nil, function()
      self:setMaterialVisible( "highlight", false )
      self.highlightTimer = nil
   end, false )

   self:setMaterialVisible( "highlight", true )
end

function CElevator:stopHighlightTimer()
   if self.highlightTimer then
      self.highlightTimer:stop()
      self.highlightTimer = nil
   end
end

function CElevator:activate( obj )
   if self.disabled or not self.destinationObj then return false end
   obj:setState( "disableAttack", true )
   obj:setState( "disableMove", true )
   obj:setState( "disableJump", true )
   obj:setState( "disableInteraction", true )
   gameplayUI:startFadeToBlackSequence( 0.5, 1, 0.5 )
   runTimer(1, nil, function()
      obj:getPose():setPos( self.destinationObj:getPose():getPos() )
      obj:setState( "disableAttack", false )
      obj:setState( "disableMove", false )
      obj:setState( "disableJump", false )
      obj:setState( "disableInteraction", false )
   end, false)
   return true
end

function CElevator:deactivate( obj )
   return true
end

function CElevator:getType()
   return "activator"
end

function CElevator:getLabel()
   return "Elevator Button"
end

function CElevator:getLabelPos()
   return self.interactor:getPose():getPos()
end

function CElevator:getInteractLabel()
   return "Activate"
end

function CElevator:OnSaveState(state)
   state.disabled = self.disabled
end

function CElevator:OnLoadState(state)
   if state.disabled then
      self.disabled = state.disabled
   end
end

return {CElevator=CElevator}
