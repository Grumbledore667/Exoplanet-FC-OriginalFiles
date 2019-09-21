local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local CInteractable = require "mixins.interactable"

---@class CReadable : shRigidEntity
local CReadable = oo.class({}, _rootRigid, CInteractable)

function CReadable:OnCreate(params)
   CInteractable.OnCreate(self, params)

   self.interactor:setTriggerRadius(300.0)
   self.interactor:setRaycastRadius(100.0)
   self.interactor:setTriggerActive(true)

   self.title = loadParam(self, "title", "Title")
   self.contents = loadParam(self, "contents", "Contents")
   self.visibleLabel = loadParam(self, "visibleLabel", "Notice")
   self.interactLabel = loadParam(self, "interactLabel", "Read")
   self.window = loadParam(self, "window", false)
   self.enabled = loadParam(self, "enabled", true)

   self.interactor:setRaycastActive(self.enabled)
end

function CReadable:OnInteractTriggerEnd(char)
   if char == getMC() then
      char:onObjectDeactivate(self, self:getInteractType(char))
   end
end

function CReadable:getInteractType(char)
   return "readable"
end

function CReadable:getLabel()
   return self.visibleLabel
end

function CReadable:getInteractLabel()
   return self.interactLabel
end

function CReadable:enable()
   CInteractable.enable(self)

   self.interactor:setTriggerActive(true)
end

function CReadable:disable()
   CInteractable.disable(self)

   self.interactor:setTriggerActive(false)
end

function CReadable:OnSaveState(state)
   CInteractable.OnSaveState(self, state)
end

function CReadable:OnLoadState(state)
   CInteractable.OnLoadState(self, state)
end

return {CReadable=CReadable}
