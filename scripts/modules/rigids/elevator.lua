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
   self.destinationObj = loadParamObjects(self, "obj", nil)[1]

   self.sounds = {}

   self.disabled = false
end

function CElevator:activate(obj)
   if self.disabled or not self.destinationObj then return false end
   obj:setState("disableAttack", true)
   obj:setState("disableMove", true)
   obj:setState("disableJump", true)
   obj:setState("disableInteraction", true)
   gameplayUI:startFadeToBlackSequence(0.5, 1, 0.5)
   runTimer(1, nil, function()
      obj:getPose():setPos(self.destinationObj:getPose():getPos())
      obj:setState("disableAttack", false)
      obj:setState("disableMove", false)
      obj:setState("disableJump", false)
      obj:setState("disableInteraction", false)
   end, false)

   return true
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
