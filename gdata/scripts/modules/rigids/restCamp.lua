local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local CInteractable = require "mixins.interactable"

---@class CRestCamp : shRigidEntity
local CRestCamp = oo.class({}, _rootRigid, CInteractable)

function CRestCamp:OnCreate()
   CInteractable.OnCreate(self)

   self.interactor:setRaycastRadius(100)
   self.activated = false
end

function CRestCamp:isActivated()
   return self.activated
end

function CRestCamp:activate(obj)
   if self.activated then return false end

   if obj:restAtCamp(self) then
      self.activated = true
      return true
   end
   return false
end

function CRestCamp:deactivate(obj)
   if not self.activated then return false end

   if obj:leaveCamp(self) then
      self.activated = false
      return true
   end
   return false
end

function CRestCamp:getType()
   return "activator"
end

function CRestCamp:getLabel()
   return "Rest Camp"
end

function CRestCamp:getInteractLabel()
   return "rest"
end

return {CRestCamp=CRestCamp}
