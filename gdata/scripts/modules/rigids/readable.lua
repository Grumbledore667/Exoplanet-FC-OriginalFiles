local oo = require "loop.simple"
local _rootRigid = (require "roots")._rootRigid

---@class CReadable : shRigidEntity
local CReadable = oo.class({}, _rootRigid)

function CReadable:OnCreate()
   self.interactor = self:createAspect("interactor")
   self.interactor:setObject(self)
   self.interactor:setTriggerRadius(300.0)
   self.interactor:setRaycastRadius(100.0)
   self.interactor:getPose():setParent(self:getPose())
   self.interactor:getPose():resetLocalPose()
   self.interactor:setTriggerActive(true)
   self.interactor:setRaycastActive(true)

   self.title = loadParam(self, "title", "Title")
   self.contents = loadParam(self, "contents", "Contents")
   self.visibleLabel = loadParam(self, "visibleLabel", "Notice")
   self.interactLabel = loadParam(self, "interactLabel", "Read")
   self.window = loadParam(self, "window", false)
   self.enabled = loadParam(self, "enabled", true)

   self.interactor:setRaycastActive(self.enabled)
end

function CReadable:activate(obj)
   if self.window then
      gameplayUI.messageUI:showText(true, self.title, self.contents)
   else
      gameplayUI.billboardUI:setup(self.title, self.contents)
   end
   return true
end

function CReadable:deactivate(obj)
   if self.window then
      gameplayUI.messageUI:show(false)
   else
      gameplayUI.billboardUI:show(false)
   end
   return true
end

function CReadable:OnInteractTriggerEnd(obj)
   self:deactivate(obj)
end


function CReadable:getType()
   return "activator"
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
