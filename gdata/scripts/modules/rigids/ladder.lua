local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local CDestroyable = require "mixins.destroyable"
local CInteractable = require "mixins.interactable"

---@class CLadder : shRigidEntity
local CLadder = oo.class({}, _rootRigid, CDestroyable, CInteractable)

function CLadder:OnCreate()
   CDestroyable.OnCreate(self)
   CInteractable.OnCreate(self)

   self:initAnchors()

   local anchorBot = self:getAnchorByName("anchor_bot")
   local anchorTopF = self:getAnchorByName("anchor_top_f")
   if anchorBot and anchorTopF then
      local height = getDistance(anchorBot:getPose():getPos(), anchorTopF:getPose():getPos())
      self.interactor_top = self:createAspect("interactor")
      self.interactor_top:setObject(self)
      self.interactor_top:setRaycastRadius(150)
      self.interactor_top:getPose():setParent(self:getPose())
      self.interactor_top:getPose():resetLocalPose()
      self.interactor_top:getPose():setLocalPos({x=0,y=height,z=0})
      self.interactor_top:setRaycastActive(true)
   end
end

function CLadder:initAnchors()
   self.anchors = {}
   for _, name in ipairs{"anchor_bot", "anchor_mid",  "anchor_top_f", "anchor_top_b"} do
     local anchor = self:getMeshByName(name)
     if anchor then
       self.anchors[name] = anchor
     else
       log(string.format("ERROR: CLadder '%s' has no anchor '%s' ...", self:getName(), name))
     end
   end
end

function CLadder:getAnchorByName(name)
   return self.anchors and self.anchors[name]
end

function CLadder:OnDestroy()
   CDestroyable.OnDestroy(self)
   self.anchors = nil
end

function CLadder:bottom()
   local playerPos = getPlayer():getPose():getPos()
   local dist_to_bottom = getDistance(playerPos, self.interactor:getPose():getPos())
   if self.interactor_top then
      local dist_to_top = getDistance(playerPos, self.interactor_top:getPose():getPos())
      return dist_to_bottom < dist_to_top
   else
      return true
   end
end

function CLadder:activate(obj)
   if self.interactor_top then
      obj:climbLadder(self)
      return true
   end
end

function CLadder:deactivate(obj)
   return true
end

function CLadder:getType()
   return "activator"
end

function CLadder:getLabel()
   return ""
end

function CLadder:getLabelPos()
   local pos
   if self:bottom() then
      pos = self.interactor:getPose():getPos()
   else
      pos = self.interactor_top:getPose():getPos()
   end
   return vec3Add(pos, {y=100})
end

function CLadder:getInteractLabel()
   if self:bottom() then
      return "climb"
   else
      return "climb down"
   end
end

return {CLadder=CLadder}
