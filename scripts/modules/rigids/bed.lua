local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local CInteractable = require "mixins.interactable"

---@class CBed : shRigidEntity
local CBed = oo.class({}, _rootRigid, CInteractable)

function CBed:OnCreate()
   CInteractable.OnCreate(self)
   self.ownerName = loadParam(self, "owner", nil)
end

function CBed:preActivate(char)
   self:setCollisionCharacters(false, false)
end

function CBed:activate(char)
end

function CBed:deactivate(char)
   self:setCollisionCharacters(true, true)
end

function CBed:getOwnerName()
   return self.ownerName
end

function CBed:getLabel()
   return "Bed"
end

function CBed:getInteractLabel()
   return "sleep"
end

function CBed:getInteractType(char)
   return "bed"
end

function CBed:isInteractionLingering(char)
   return true
end

function CBed:getInteractData(char)
   local data = {
      anchorPos = localPointToWorld({x=20,y=20,z=80}, self:getPose()),
      anchorDir = vec3RotateQuat({x=0,y=0,z=1}, self:getPose():getRotQuat()),
      animations = {
         activate = "idle_to_sleep_bed_idle",
         loop = "sleep_bed_idle",
         deactivate = "sleep_bed_idle_to_idle",
      },
   }
   return data
end

function CBed:OnSaveState(state)
   CInteractable.OnSaveState(self, state)
end

function CBed:OnLoadState(state)
   CInteractable.OnLoadState(self, state)
end

return {CBed=CBed}
