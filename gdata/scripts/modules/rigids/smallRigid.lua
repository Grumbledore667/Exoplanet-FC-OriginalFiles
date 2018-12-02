local oo = require "loop.multiple"

local CItemGenerator = require ("rigids.itemGenerator").CItemGenerator

---@class CSmallRigid : CItemGenerator
local CSmallRigid = oo.class({}, CItemGenerator)

function CSmallRigid:OnCreate(params)
   CItemGenerator.OnCreate(self, params)

   self.interactor:setTriggerRadius(100)
   self.interactor:setTriggerActive(true)
   self.interactor:setRaycastRadius(100)
end

function CSmallRigid:OnInteractTriggerBegin(obj)
   if obj == getMC() then return end

   gameplayUI:setFocusObj(self)

   self:OnFocusBegin(obj)
end

function CSmallRigid:OnInteractTriggerEnd(obj)
   if obj == getMC() then return end

   if not self.package then
      self:setCollisionCharacters(true, false)
   end
   gameplayUI:setFocusObj(nil)

   self:OnFocusEnd(obj)
end

function CSmallRigid:activate(obj)
   CItemGenerator.activate(self, obj)
   self:setVisible(false)
   self:setCollisionObjects(false)
   self.interactor:setTriggerActive(false)
   self.interactor:setRaycastActive(false)
end

function CSmallRigid:createSpawnedCopy()
   local copy = getScene():createEntity(self:getPrefabName(), "CSmallRigid", {itemName = self.itemName, itemCount = self.itemCount, template = self.template})
   copy:setPose(self:getPose())
   copy.isSpawned = true
   copy.interactor:setTriggerActive(true)
   copy.interactor:setRaycastActive(true)
   copy.installer = self
   self.spawnedCopy = copy
   return copy
end

function CSmallRigid:getLabelPos()
   if getPlayer().ownerPlayer then
      return vec3Add(self:getPose():getPos(), {y=10})
   end
   return vec3Add(self:getPose():getPos(), {y=50})
end

function CSmallRigid:OnSaveState(state)
   CItemGenerator.OnSaveState(self, state)
   if self.spawnedCopy and self.spawnedCopy:getVisible() then
      state.spawnedCopyPos = self.spawnedCopy:getPose():getPos()
      state.spawnedCopyRot = self.spawnedCopy:getPose():getRot()
   end
end

function CSmallRigid:OnLoadState(state)
   CItemGenerator.OnLoadState(self, state)
   self:setCollisionObjects(state.visible)
   self.interactor:setTriggerActive(state.visible)
   if state.spawnedCopyPos then
      local copy = self:createSpawnedCopy()
      copy:getPose():setPos(state.spawnedCopyPos)
      copy:getPose():setRot(state.spawnedCopyRot)
   end
end

return {CSmallRigid=CSmallRigid}
