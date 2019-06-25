local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local CInteractable = require "mixins.interactable"

---@class CRestCamp : shRigidEntity
local CRestCamp = oo.class({}, _rootRigid, CInteractable)

function CRestCamp:OnCreate()
   CInteractable.OnCreate(self)

   self.interactor:setRaycastRadius(100)
end

function CRestCamp:getInteractType(char)
   return "rest_camp"
end

function CRestCamp:getLabel()
   return "Rest Camp"
end

function CRestCamp:getInteractLabel()
   return "rest"
end

return {CRestCamp=CRestCamp}
