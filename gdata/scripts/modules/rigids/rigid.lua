local oo = require "loop.simple"
local _rootRigid = (require "roots")._rootRigid

---@class CRigid : shRigidEntity
local CRigid = oo.class({
   activated = false,
   item = nil,
}, _rootRigid)

function CRigid:OnCreate()
end

function CRigid:OnDestroy()
end

function CRigid:OnTouchCharacter(obj)
end

function CRigid:OnUntouchCharacter(obj)
end

function CRigid:OnHit(params)
-- impactor - damage source object (item)
-- impactType - string (ranged, melee, explosion)
-- impactPos - impact position
-- impactForce - set by engine, can be changed
-- impactRadius - set by engine, can be changed
-- target - target object (character, rigid)
-- targetType - target type (string) (character, rigid)
-- interrupt - boolean, defaults to false. if set to true - stops hit event propagation
end

function CRigid:OnSaveState(state)
   state.pos = self:getPose():getPos()
   state.collisionOnbjects = self:getCollisionObjects()
   state.collisionCharacters = self:getCollisionCharacters()
end

function CRigid:OnLoadState(state)
   if state.pos then
      self:getPose():setPos(state.pos)
   end
   self:setCollisionObjects(state.collisionOnbjects)
   self:setCollisionCharacters(state.collisionCharacters, state.collisionCharacters)
end

return {CRigid=CRigid}
