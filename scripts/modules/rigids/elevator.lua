local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local CDestroyable = require "mixins.destroyable"
local CInteractable = require "mixins.interactable"

---@class CElevator : shRigidEntity
local CElevator = oo.class({}, _rootRigid, CDestroyable, CInteractable)

function CElevator:OnCreate()
   CDestroyable.OnCreate(self)
   CInteractable.OnCreate(self)

   self.interactor:getPose():setLocalPos({x=0,y=150,z=0})
   getScene():subscribeOnLocationEnter(self.onLocationEnter, self)

   self.sounds = {}

   self.disabled = false
end

function CElevator:onLocationEnter()
   self.destinationObj = loadParamObjects(self, "obj", nil)[1]
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

function CElevator:getInteractType(char)
   if self.disabled or not self.destinationObj then
      return "no_interaction"
   else
      return "elevator"
   end
end

function CElevator:isInteractionLingering(char)
   return true
end

function CElevator:getInteractData(char)
   local data = {
      holster = false,
      noEscape = true,
   }
   return data
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
