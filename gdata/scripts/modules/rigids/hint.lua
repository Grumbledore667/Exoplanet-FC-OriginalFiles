local oo = require "loop.simple"
local CReadable = (require "rigids.readable").CReadable

local CHint = oo.class({
   defaultRaycastRadius = 150,
}, CReadable)

function CHint:OnCreate()
   CReadable.OnCreate(self)
   self.interactor:setRaycastRadius( 0 )

   self.radius = loadParamNumber( self, "radius", 200 )
   self.interactor:setTriggerRadius(math.max(300, self.radius))
   self.enabled = loadParam(self, "enabled", true)
   self.keep_original_material = loadParam(self, "keep_original_material", true)
   self.highlight_material = loadParam(self, "highlight_material", "hint")
   self.proximity_activate = loadParam(self, "proximity_activate", true)
   self.show_hint_right_away = loadParam(self, "show_hint_right_away", false)
   if self.show_hint_right_away then
      self.interactor:setRaycastRadius( self.defaultRaycastRadius )
   end

   self.highlight_timer = loadParamNumber(self, "highlight_timer", 0)
   self.interactor:setRaycastActive( self.enabled )
   self.interactor:setTriggerActive( self.enabled )

   ---
   --- Add timer to remove highlight
   ---

   if self.keep_original_material then
      self:addMaterial(self.highlight_material)
   else
      self:setMaterials( self.highlight_material )
   end
   self:setMaterialVisible( self.highlight_material, false )
end

function CHint:OnInteractTriggerBegin( obj )
   if obj == getPlayer() and self.proximity_activate and self.show_hint_right_away then
      self:activate(obj)
   end
end

function CHint:OnInteractTriggerEnd( obj )
   if obj == getPlayer() then
      self:deactivate(obj)
   end
end

function CHint:OnInteractHighlightBegin( obj )
   self.show_hint_right_away = true
   self.interactor:setRaycastRadius( self.defaultRaycastRadius )
   self.interactor:setRaycastActive( self.enabled )

   self:setMaterialVisible( self.highlight_material, true )
   if self.highlight_timer > 0 then
      runTimer(self.highlight_timer, self, function (self) self:setMaterialVisible(self.highlight_material, false) end, false)
   end
   if obj == getPlayer() and self.proximity_activate and objInDist( self:getPose():getPos(), obj:getPose():getPos(), self.interactor:getTriggerRadius() ) then
      self:activate(obj)
   end
end

function CHint:enable()
   self.enabled = true
   self.interactor:setTriggerActive( self.enabled )
   self.interactor:setRaycastActive( self.enabled )
end

function CHint:disable()
   self.enabled = false
   self.interactor:setTriggerActive( self.enabled )
   self.interactor:setRaycastActive( self.enabled )
end

function CHint:isEnabled()
   return self.enabled
end

function CHint:OnSaveState(state)
   state.enabled = self:isEnabled()
   state.interactorHighlightRadius = self.interactor:getRaycastRadius()
end

function CHint:OnLoadState(state)
   if state.enabled then
      self:enable()
   elseif state.enabled == false then
      self:disable()
   end

   if state.interactorHighlightRadius then
      self.interactor:setRaycastRadius(state.interactorHighlightRadius)
   end
   self:setMaterialVisible( self.highlight_material, false )
end

return {CHint=CHint}
