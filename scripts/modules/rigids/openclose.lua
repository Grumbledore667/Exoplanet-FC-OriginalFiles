local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local CInteractable = require "mixins.interactable"

---@class COpenClose : shRigidEntity
local COpenClose = oo.class({}, _rootRigid, CInteractable)

function COpenClose:OnCreate()
   CInteractable.OnCreate(self)

   self.sounds = {}
   self.sounds.open = self:createAspect("Play_door_slide_open")
   self.sounds.open:getPose():setParent(self:getPose())
   self.sounds.open:getPose():resetLocalPose()

   self.visibleLabel = loadParam(self, "visibleLabel", "Togglable Object")

   self:subscribeAnimationStop(self.animStop, self)

   self.opened = false
   self.animating = false
end

function COpenClose:animStop()
   self.animating = false
end

function COpenClose:activate(char)
   self.animating = true
   self.sounds.open:play()
   if self.opened then
      self:playAnimation("close", false)
   else
      self:playAnimation("open", false)
   end
   self.opened = not self.opened
end

function COpenClose:getInteractType(char)
   if self.animating then
      return "no_interaction"
   else
      return "door"
   end
end

function COpenClose:getLabel()
   return self.visibleLabel
end

function COpenClose:getLabelPos()
   return vec3Add(self.interactor:getPose():getPos(), {y=150})
end

function COpenClose:getInteractLabel()
   if self.opened then
      return "close"
   else
      return "open"
   end
end

function COpenClose:OnSaveState(state)
   CInteractable.OnSaveState(self, state)

   state.opened = self.opened
end

function COpenClose:OnLoadState(state)
   CInteractable.OnLoadState(self, state)

   if state.opened then
      self.opened = true
   end
end

return {COpenClose=COpenClose}
