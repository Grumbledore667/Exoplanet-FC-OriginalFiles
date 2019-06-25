local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local CInteractable = require "mixins.interactable"

---@class CBed : shRigidEntity
local CBed = oo.class({}, _rootRigid, CInteractable)

function CBed:OnCreate()
   CInteractable.OnCreate(self)
   self.owner = loadParam(self, "owner", "")
end

function CBed:activate(obj)
   if self:isActivated() then return false end
   if self.owner == "" or self.owner == "player" then
      if obj:restAtBed(self) then
         self.activated = true
         self:setCollisionCharacters(false, false)
         return true
      end
   else
      gameplayUI:showInfoTextEx("It's not your bed", "minor", "")
   end
   return false
end

function CBed:deactivate(obj)
   if not self:isActivated() then return false end

   if obj:leaveBed(self) then
      self.activated = false
      self:setCollisionCharacters(true, true)
      return true
   end
   return false
end

function CBed:getLabel()
   return "Bed"
end

function CBed:getInteractLabel()
   return "sleep"
end

return {CBed=CBed}
