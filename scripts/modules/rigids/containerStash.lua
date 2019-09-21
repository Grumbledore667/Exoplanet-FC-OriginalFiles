local oo = require "loop.simple"
local CContainer = (require "rigids.container").CContainer
local CInteractable = require "mixins.interactable"

local hlp = require "helpers"

---@class CContainerStash : CContainer
local CContainerStash = oo.class({}, CContainer)

function CContainerStash:OnCreate()
   CContainer.OnCreate(self)
   self.gStash = hlp.CGParam("playerStash")
end

function CContainerStash:activate(obj)
   self:getInventory().items = {}
   self:getInventory():deserialize(self.gStash:get() or {})
   CContainer.activate(self, obj)
end

function CContainerStash:deactivate(obj)
   self.gStash:set(self:getInventory():serialize() or {})
   CContainer.deactivate(self, obj)
end

function CContainerStash:getLabel()
   local stash = self.gStash:get()
   if stash and #stash > 0 then
      return "Stash"
   else
      return "Stash (empty)"
   end
end

-- force overwrite parent save routines
function CContainerStash:OnSaveState(state)
   CInteractable.OnSaveState(self, state)
end

function CContainerStash:OnLoadState(state)
   CInteractable.OnLoadState(self, state)

   self:updateLockMeshes() --Simply hides the 'Locked' submesh
   self:resetAnimations()
end

return {CContainerStash=CContainerStash}
