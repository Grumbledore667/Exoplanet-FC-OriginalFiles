local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid

local hlp = require "helpers"
local tablex = require "pl.tablex"
local ItemsData = require "itemsData"
local ObjectsLabels = (require "objectsLabels")
local CInteractable = require "mixins.interactable"

---@class CDigSite : shRigidEntity
local CDigSite = oo.class({}, _rootRigid, CInteractable)

function CDigSite:OnCreate(params)
   CInteractable.OnCreate(self, params)
   self.meshRaycast = loadParam(self, "meshRaycast", true)

   self.label = loadParam(self, "label", "")
   self.containerModel = loadParam(self, "containerModel", "")
   self.lootItems = loadParamItemCounts(self, "lootItems", {})
   self.position = loadParamVec3(self, "position", vec3Zero())
   self.rotation = loadParamVec3(self, "rotation", vec3Zero())

   self.digsToOpen = math.floor(loadParamNumber(self, "digsToOpen", 2))
   self.digsDone = 0

   self.digSound = loadParam(self, "digSound", "dig_dirt")

   self.interactor:getPose():setLocalPos({x=0,y=100,z=0})

   self.spawnedItems = {}
   self.spawnedContainer = nil
end

function CDigSite:activate(char)
   if char:getInventory():getItemByName("shovel.wpn") then
      char:startDigging(self)
   else
      gameplayUI:showInfoTextEx("I need a shovel to dig here", "minor", "")
   end
end

function CDigSite:getActivationsLeft()
   return self.digsToOpen - self.digsDone
end

function CDigSite:onDigDone()
   self.digsDone = self.digsDone + 1
   if self:getActivationsLeft() <= 0 then
      self.active = false
      self.interactor:setRaycastActive(false)
      self:showLoot()
   end
end

function CDigSite:showLoot(itemsToShow)
   self:setVisible(false)
   self:setCollisionCharacters(false, false)
   self:setCollisionObjects(false)

   local pos = vec3Add(self.position, self:getPose():getPos())

   if self.containerModel ~= "" then
      self.spawnedContainer = hlp.safeCreateEntity(self.containerModel, "CContainer", {})

      self.spawnedContainer:getPose():setPos(pos)
      self.spawnedContainer:getPose():setRot(self.rotation)

      for name, count in pairs(self.lootItems) do
         self.spawnedContainer:getInventory():addItem(name, count)
      end
   else
      for itemName, count in pairs(itemsToShow or self.lootItems) do
         if ItemsData.isCorrectItemName(itemName) then
            local model = ItemsData.getItemModel(ItemsData.getRealItemName(itemName))
            if model then
               local obj = hlp.safeCreateEntity(model, "CItemGenerator", {
                  itemName = itemName, itemCount = count,
                  highlightMaterial = self.highlightMaterial, highlightTime = self.highlightTime
               })
               obj:getPose():setPos(pos)
               obj:getPose():setRot(self.rotation)
               self.spawnedItems[#self.spawnedItems + 1] = obj
            end
         end
      end
   end
end

function CDigSite:getDigSound()
   return self.digSound
end

function CDigSite:getType()
   return "activator"
end

function CDigSite:getLabel()
   --check if label id exists
   local label = ObjectsLabels.getLabel(self.label)
   --if not, then take it literally
   if label == "" then
      label = self.label
   end
   --if empty, then lookup object name
   if label == "" then
      label = ObjectsLabels.getLabel(self:getName())
   end
   --resort to default label
   if label == "" then
      label = "Digging Site"
   end
   return label
end

function CDigSite:getLabelPos()
   return vec3Add(self.interactor:getPose():getPos(), {y=75})
end

function CDigSite:getInteractLabel()
   return "dig"
end

function CDigSite:isOpen()
   return self.digsDone >= self.digsToOpen
end

function CDigSite:getLootTable()
   local t = tablex.deepcopy(self.lootItems)
   return t
end

function CDigSite:OnSaveState(state)
   state.lootItems = self.lootItems
   state.raycastActive = self.interactor:getRaycastActive()
   state.digsDone = self.digsDone

   -- spawned items and containers
   state.spawnedItems = {}
   for _, obj in pairs(self.spawnedItems) do
      if obj:getVisible() then
         state.spawnedItems[obj.itemName] = obj.itemCount
      end
   end

   if self.spawnedContainer then
      state.containerInventory = self.spawnedContainer:getInventory():serialize()
   end
end

function CDigSite:OnLoadState(state)
   if state.raycastActive then
      self.interactor:setRaycastActive(true)
   else
      self.interactor:setRaycastActive(false)
   end
   self.digsDone = state.digsDone

   if self:isOpen() then
      self:showLoot(state.spawnedItems) --Should be a table and not nil or it will add new items
      if self.spawnedContainer then
         self.spawnedContainer:getInventory():destroyAllItems()
         self.spawnedContainer:getInventory():deserialize(state.containerInventory)
      end
   else
      self.lootItems = state.lootItems
   end
end

local CAnomalyDigSite = oo.class({}, CDigSite)

function CAnomalyDigSite:OnCreate(params)
   params = params or {}
   params.highlightMaterial = "highlight_anomaly"
   params.highlightTime = 10

   CDigSite.OnCreate(self, params)

   self.radMax = loadParam(self, "radMax", 1500)
   self.radCritical = loadParam(self, "radCritical", 250)

   self.oldRadius = self.interactor:getRaycastRadius()
   self.interactor:setRaycastRadius(0)
   self.interactor:setTriggerActive(true)
   self.interactor:setTriggerRadius(self.radCritical + 25)
   self.scanned = false
end

function CAnomalyDigSite:OnInteractTriggerBegin(obj)
   if obj == getMC() then
      self.canBeScanned = true
   end
end

function CAnomalyDigSite:OnInteractTriggerEnd(obj)
   if obj == getMC() then
      self.canBeScanned = false
   end
end

function CAnomalyDigSite:OnInteractHighlightBegin(obj)
   if not self.setMaterialVisible or not self:shouldScanHighlight(obj) or not self.canBeScanned then
      return
   end
   self.interactor:setRaycastRadius(self.oldRadius)
   CDigSite.OnInteractHighlightBegin(self, obj)
   self.scanned = true
end

function CAnomalyDigSite:OnSaveState(state)
   CDigSite.OnSaveState(self, state)
   state.scanned = self.scanned
end

function CAnomalyDigSite:OnLoadState(state)
   CDigSite.OnLoadState(self, state)
   self.scanned = state.scanned
   if self.scanned then
      self.interactor:setRaycastRadius(self.oldRadius)
   end
end

local classes = {}

classes.CDigSite        = CDigSite
classes.CAnomalyDigSite = CAnomalyDigSite

return classes
