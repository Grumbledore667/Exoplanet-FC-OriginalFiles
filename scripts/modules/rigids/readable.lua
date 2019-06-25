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
   if char == getPlayer() then
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
   self.enabled = true
   self.interactor:setRaycastActive(self.enabled)
   self.interactor:setTriggerActive(self.enabled)
end

function CReadable:disable()
   self.enabled = false
   self.interactor:setRaycastActive(self.enabled)
   self.interactor:setTriggerActive(self.enabled)
end

function CReadable:isEnabled()
   return self.enabled
end

function CReadable:OnSaveState(state)
   state.enabled = self.enabled
end

function CReadable:OnLoadState(state)
   if state.enabled then
      self:enable()
   else
      self:disable()
   end
end

return {CReadable=CReadable}
