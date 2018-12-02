local oo = require "loop.simple"
local _rootRigid = (require "roots")._rootRigid

---@class CDynamicFloor : shRigidEntity
local CDynamicFloor = oo.class({}, _rootRigid)

function CDynamicFloor:OnCreate(params)
   self.activated = false
end

function CDynamicFloor:isActivated()
   return self.activated
end

function CDynamicFloor:activate(obj)
   if not self.activated then
      self.activated = true
      self.collisionBox = getScene():createEntity("collision_box_dyn.sbg", "")
      self.collisionBox:setDynamic(true)
      local pos = self:getPose():getPos()
      pos.y = pos.y - 100
      self.collisionBox:getPose():setPos(pos)
      --self:getPose():setParent(self.collisionBox:getPose())
      --self:getPose():resetLocalPose()
   end
end

function CDynamicFloor:deactivate(obj)
end

return {CDynamicFloor=CDynamicFloor}
