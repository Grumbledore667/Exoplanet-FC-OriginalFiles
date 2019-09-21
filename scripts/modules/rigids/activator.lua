local oo = require "loop.multiple"
local CRigid = require "rigids.rigid".CRigid

local ItemsData = (require "itemsData")
local ItemsLists = (require "itemsLists")
local ObjectsLabels = (require "objectsLabels")
local CInteractable = require "mixins.interactable"

local tablex = require "pl.tablex"
local hlp = require "helpers"

---@class CActivator : CRigid
local CActivator = oo.class({}, CInteractable, CRigid)

function CActivator:OnCreate(params)
   getmetatable(self)["__tostring"] = function(t) return "activator" end

   self.activateByHit = loadParam(self, "activateByHit", false)

   self.activated = false

   self.labelId      = loadParam(self, "labelId", "")
   self.interactTime = loadParamNumber(self, "interactTime", 0)

   self.soundsToPlay = loadParamStrings(self, "soundsToPlay", {})

   self.animationToPlay = loadParam(self, "animationToPlay", "")
   self.animationCycled = loadParam(self, "animationCycled", true)

   --TODO:FIXME: change 'activatorEnabled' to 'enabled'
   self.parameters.enabled = loadParam(self, "activatorEnabled", true)
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

   CInteractable.OnCreate(self, params)

   self.interactor:setRaycastRadius(self.raycastRadius)

   getScene():subscribeOnLocationEnter(self.loadNamedObjectParams, self)

   self.interactAnchor = self:getMeshByName("anchor_1")
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

function CActivator:addItemsToPlayer()
   for itemName, count in pairs(self.addItems) do
      addItemToObj(itemName, getPlayer(), count)
   end
end

function CActivator:spawnObject()
   local entity = getScene():createEntity(self.objectTypeToSpawn, self.objectClassToSpawn, {installer=self})
   entity:setPose(self:getPose())

   if entity.subscribeOnDestroy then
      entity:subscribeOnDestroy(self.removeInstallation, self, entity)
   end
   self:addSpawnedObject(entity)
end

function CActivator:despawnObjects()
   for _,obj in pairs(self.spawnedObjects) do
      hlp.safeDestroyEntity(obj)
   end
   self.spawnedObjects = {}
end

function CActivator:addSpawnedObject(obj)
   local index = tablex.find(self.spawnedObjects, obj)
   if not index then
      table.insert(self.spawnedObjects, obj)
   end
end

function CActivator:removeInstallation(obj)
   local index = tablex.find(self.spawnedObjects, obj)
   if index then
      table.remove(self.spawnedObjects, index)
   end
end

function CActivator:enable()
   self.enabled = true
   self.interactor:setRaycastActive(self.enabled and self.activateByPlayer)
end

function CActivator:OnHit(params)
   local char = params.impactor and params.impactor.owner and params.impactor.owner.owner
   if not self.enabled or not self.activateByHit
      or self.activateByPlayer and char ~= getPlayer() or params.impactor:isRangedWeapon() then return end
   self:activate(char)
   if char.onObjectActivate then
      char:onObjectActivate(self, self:getInteractType())
   end
end

function CActivator:preActivate(char)
end

function CActivator:activate(char)
   if not self.enabled then return end

   self.activated = true

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
end

---Reverse activate effects, when possible. Used in subclasses.
function CActivator:activateReverse(char)
   self.activated = false
   if not self.activateMultiple then
      self:disable()
   end

   for _, object in ipairs(self.objectsToShow) do
      object:setVisible(false)
   end
   for _, object in ipairs(self.objectsToHide) do
      object:setVisible(true)
   end

   for _, name in ipairs(self.soundsToPlay) do
      getPlayer():playSound(name) --This one is the same
   end

   for _, sound in ipairs(self.soundsToStop) do
      sound:play()
   end

   for _, emitter in ipairs(self.emittersToStart) do
      emitter:stop()
   end
   for _, emitter in ipairs(self.emittersToStop) do
      emitter:play()
   end

   self:playAnimation(self.animationToPlay, self.animationCycled) --This one is the same

   for _, object in ipairs(self.objectsToActivate) do
      object:activate(self)
   end

   for _, object in ipairs(self.objectsToEnable) do
      object:disable()
   end
   for _, object in ipairs(self.objectsToDisable) do
      object:enable()
   end

   for _, object in ipairs(self.collisionsToEnable) do
      disableObjectCollisions(object:getName())
   end
   for _, object in ipairs(self.collisionsToDisable) do
      enableObjectCollisions(object:getName())
   end

   if #self.spawnedObjects > 0 then
      self:despawnObjects()
   end

   if self.activatorHide then
      self:setVisible(false)
   end
   --Don't actually take back items
end

function CActivator:pickupItem(inventory)
   self:activate(inventory.owner)
end

function CActivator:getInteractType(char)
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

function CActivator:getInteractData(char)
   local data = {
      time = self.interactTime,
      animations = {},
      holdButton = true,
   }
   if self.itemPickup then
      data.animations.activate = hlp.getPickupAnimationFor(char, self)
   end

   if self.interactAnchor then
      data.anchorPos = self.interactAnchor:getPose():getPos()
      data.anchorDir = vec3RotateQuat({x=0,y=0,z=-1}, self.interactAnchor:getPose():getRotQuat())
   end
   return data
end

function CActivator:OnSaveState(state)
   CInteractable.OnSaveState(self, state)
   CRigid.OnSaveState(self, state)
   if #self.spawnedObjects > 0 then
      state.spawned = true
   end
   state.activated = self.activated
end

function CActivator:OnLoadState(state)
   CInteractable.OnLoadState(self, state)
   CRigid.OnLoadState(self, state)

   if state.spawned then
      self:spawnObject()
   end
   self.activated = state.activated
end

return {CActivator=CActivator}
