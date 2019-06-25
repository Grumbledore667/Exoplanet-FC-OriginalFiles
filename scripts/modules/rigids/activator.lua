local oo = require "loop.simple"
local CRigid = require "rigids.rigid".CRigid

local ItemsData = (require "itemsData")
local ItemsLists = (require "itemsLists")
local ObjectsLabels = (require "objectsLabels")
local Installation = (require "items.installation")

local tablex = require "pl.tablex"

---@class CActivator : CRigid
local CActivator = oo.class({}, CRigid)

function CActivator:OnCreate()
   getmetatable(self)["__tostring"] = function(t) return "activator" end

   self.enabled = true

   self.labelId      = loadParam(self, "labelId", "")
   self.interactTime = loadParamNumber(self, "interactTime", 0)

   self.soundsToPlay = loadParamStrings(self, "soundsToPlay", {})

   self.animationToPlay = loadParam(self, "animationToPlay", "")
   self.animationCycled = loadParam(self, "animationCycled", true)

   self.activatorEnabled = loadParam(self, "activatorEnabled", true)
   self.activatorHide    = loadParam(self, "activatorHide", false)
   self.activateByPlayer = loadParam(self, "activateByPlayer", true)
   self.activateMultiple = loadParam(self, "activateMultiple", false)
   self.raycastRadius    = loadParam(self, "raycastRadius", 50)

   self.objectTypeToSpawn      = loadParam(self, "objectTypeToSpawn", nil)
   self.objectClassToSpawn      = loadParam(self, "objectClassToSpawn", nil)
   self.spawnedObjects      = {}

   self.removeItems         = loadParamItemCounts(self, "removeItems", {})
   self.addItems            = loadParamItemCounts(self, "addItems", {})

   self.itemPickup = loadParam(self, "itemPickup", false)

   self.interactor = self:createAspect("interactor")
   self.interactor:setObject(self)
   self.interactor:setRaycastRadius(self.raycastRadius)
   self.interactor:getPose():setParent(self:getPose())
   self.interactor:getPose():resetLocalPose()
   self.interactor:setRaycastActive(self.activateByPlayer)

   if self.activatorEnabled then
      self:enable()
   else
      self:disable()
   end

   getScene():subscribeOnLocationEnter(self.loadNamedObjectParams, self)
end

function CActivator:loadNamedObjectParams()
   self.objectsToShow       = loadParamObjects(self, "objectsToShow")
   self.objectsToHide       = loadParamObjects(self, "objectsToHide")

   self.soundsToStop        = loadParamObjects(self, "soundsToStop")

   self.emittersToStart     = loadParamObjects(self, "emittersToStart")
   self.emittersToStop      = loadParamObjects(self, "emittersToStop")

   self.objectsToActivate   = loadParamObjects(self, "objectsToActivate")
   self.objectsToDeactivate = loadParamObjects(self, "objectsToDeactivate")

   self.objectsToEnable     = loadParamObjects(self, "objectsToEnable")
   self.objectsToDisable    = loadParamObjects(self, "objectsToDisable")

   self.collisionsToEnable  = loadParamObjects(self, "collisionsToEnable")
   self.collisionsToDisable = loadParamObjects(self, "collisionsToDisable")
end

function CActivator:OnDestroy()
end

function CActivator:checkRemoveItems()
   if self.removeItems then
      local hasAllItems = true
      for itemName, count in pairs(self.removeItems) do
         local item = getPlayer():getInventory():getItemByName(itemName)
         if not item then
            gameplayUI:showInventoryDropInfo("Missing ".. count .. " " ..  ItemsData.getItemLabel(itemName))
            hasAllItems = false
         elseif item:getCount() < count then
            gameplayUI:showInventoryDropInfo("Missing ".. (count - item:getCount()) .. " " .. ItemsData.getItemLabel(itemName))
            hasAllItems = false
         end
      end

      if not hasAllItems then return false end

      for itemName, count in pairs(self.removeItems) do
         removeItemFromObj(itemName, getPlayer(), count)
      end
   end
   return true
end

function CActivator:addItemsToPlayer()
   for itemName, count in pairs(self.addItems) do
      addItemToObj(itemName, getPlayer(), count)
   end
end

function CActivator:spawnObject()
   local entity = getScene():createEntity(self.objectTypeToSpawn, self.objectClassToSpawn, {installer=self})
   entity:setPose(self:getPose())

   if entity.subscribeOnDestroy then
      entity:subscribeOnDestroy(self.removeSpawnedObject, self, entity)
   end
   self:addSpawnedObject(entity)
end

function CActivator:addSpawnedObject(obj)
   local index = tablex.find(self.spawnedObjects, obj)
   if not index then
      table.insert(self.spawnedObjects, obj)
   end
end

function CActivator:removeSpawnedObject(obj)
   local index = tablex.find(self.spawnedObjects, obj)
   if index then
      table.remove(self.spawnedObjects, index)
   end
end

function CActivator:enable()
   self.enabled = true
   self.interactor:setRaycastActive(self.enabled and self.activateByPlayer)
end

function CActivator:disable()
   self.enabled = false
   self.interactor:setRaycastActive(self.enabled)
end

function CActivator:isEnabled()
   return self.enabled
end

function CActivator:activate(obj)
   if not self.enabled then
      return false
   end

   if not self:checkRemoveItems() then
      return false
   end

   questSystem:fireEvent("activate", self:getName())

   if not self.activateMultiple then
      self:disable()
   end

   for _, object in ipairs(self.objectsToShow) do
      object:setVisible(true)
   end
   for _, object in ipairs(self.objectsToHide) do
      object:setVisible(false)
   end

   for _, name in ipairs(self.soundsToPlay) do
      getPlayer():playSound(name)
   end

   for _, sound in ipairs(self.soundsToStop) do
      sound:stop()
   end

   for _, emitter in ipairs(self.emittersToStart) do
      emitter:play()
   end
   for _, emitter in ipairs(self.emittersToStop) do
      emitter:stop()
   end

   self:playAnimation(self.animationToPlay, self.animationCycled)

   for _, object in ipairs(self.objectsToActivate) do
      object:activate(self)
   end
   for _, object in ipairs(self.objectsToDeactivate) do
      object:deactivate(self)
   end

   for _, object in ipairs(self.objectsToEnable) do
      object:enable()
   end
   for _, object in ipairs(self.objectsToDisable) do
      object:disable()
   end

   for _, object in ipairs(self.collisionsToEnable) do
      enableObjectCollisions(object:getName())
   end
   for _, object in ipairs(self.collisionsToDisable) do
      disableObjectCollisions(object:getName())
   end

   if self.objectTypeToSpawn and self.objectClassToSpawn then
      self:spawnObject()
   end

   if self.activatorHide then
      self:setVisible(false)
   end

   self:addItemsToPlayer()

   return true
end

function CActivator:pickupItem(inventory)
   self:activate(inventory.owner)
end

function CActivator:getType()
   if self.itemPickup then
      return "pickup"
   else
      return "activator"
   end
end

function CActivator:getLabel()
   local label = ObjectsLabels.getLabel(self.labelId)

   if label == "" then
      label = ObjectsLabels.getLabel(self:getName())
   end

   if label == "" then
      label = ItemsLists.getLabelForModel(self:getPrefabName())
   end

   if label == "" then
      label = self:getName()
   end

   return label
end

function CActivator:getInteractLabel()
   local label = ObjectsLabels.getInteractLabel(self.labelId)

   if label == "" then
      if self.itemPickup then
         label = "pick up"
      else
         label = "interact"
      end
   end

   return label
end

function CActivator:getInteractTime(interactType)
   return self.interactTime
end

function CActivator:OnSaveState(state)
   CRigid.OnSaveState(self, state)
   state.enabled = self.enabled
   if #self.spawnedObjects > 0 then
      state.spawned = true
   end
end

function CActivator:OnLoadState(state)
   CRigid.OnLoadState(self, state)
   if state.enabled then
      self:enable()
   else
      self:disable()
   end

   if state.spawned then
      self:spawnObject()
   end
end

return {CActivator=CActivator}
