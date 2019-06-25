local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local ObjectsLabels = (require "objectsLabels")
local ItemsLists = (require "itemsLists")
local CInventoryBase = require "inventoryBase"
local CLockable = require "mixins.lockable"
local CDestroyable = require "mixins.destroyable"

---@class CContainer : shRigidEntity
local CContainer = oo.class({}, _rootRigid, CLockable, CDestroyable)

function CContainer:OnCreate(params)
   CLockable.OnCreate(self)
   CDestroyable.OnCreate(self)

   self.inventory = CInventoryBase{}
   self.inventory:init(self)

   self.labelId = loadParam(self, "labelId", "")

   local items = loadParamItemCounts(self, "items", {})
   for name, count in pairs(items) do
      self:getInventory():addItem(name, count)
   end

   self.textureName = loadParam(self, "textureName", "")
   if self.textureName ~= "" then
      local top = self:getMeshByName("chest_top")
      local bottom = self:getMeshByName("chest_bottom")
      if top then
         top:setTexture(0, self.textureName)
      end
      if bottom then
         bottom:setTexture(0, self.textureName)
      end
   end
   self.animAnchor = self:getMeshByName("anchor_1")
end

function CContainer:isInteractionAnimated()
   return self.animAnchor ~= nil and self:getPrefabName() == "chest.sbg"
end

function CContainer:showInventory(state)
   gameplayUI.inventoryContainer:show(state)
end

function CContainer:activate(obj)
   if self.locked then
      CLockable.activate(self, obj)
   elseif not self.activated then
      self.activated = true
      obj.exchangeTarget = self
      if self:isInteractionAnimated() then
         obj:openLootbox(self)
      else
         self:playAnimation("open", false)
         obj:exchangeStart(self)
      end
   end
   return true
end

function CContainer:deactivate(obj)
   if self.locked then
      CLockable.deactivate(self, obj)
   elseif self.activated then
      self.activated = false
      self:playAnimation("close", false)
      obj.exchangeTarget = nil
      obj:exchangeStop(self)
      if self:isInteractionAnimated() then
         obj:closeLootbox(self)
      end
   end
   return true
end

function CContainer:getLabel()
   local label = ObjectsLabels.getLabel(self.labelId)

   if label == "" then
      label = ItemsLists.getLabelForModel(self:getPrefabName())
   end

   if label == "" then
      label = "Container"
   end

   if not self.locked and self:getInventory():getItemsCount() == 0 then
      label = label.." (empty)"
   end

   label = CLockable.getLabel(self) .. label

   return label
end

function CContainer:getInteractLabel()
   local label = ObjectsLabels.getInteractLabel(self.labelId)

   if label == "" then
      label = "open"
   end

   if self.locked then
      label = CLockable.getInteractLabel(self)
   end

   return label
end

function CContainer:getInventory()
   return self.inventory
end

function CContainer:getLootTable()
   return self:getInventory():getLootTable()
end

function CContainer:getLabelPos()
   local pos = self.interactor:getPose():getPos()
   pos.y = pos.y + 60
   return pos
end

function CContainer:OnSaveState(state)
   CLockable.OnSaveState(self, state)
   state.inventory = self:getInventory():serialize()
end

function CContainer:OnLoadState(state)
   CLockable.OnLoadState(self, state)
   self:getInventory().items = {}
   if state.inventory then
      self:getInventory():deserialize(state.inventory)
   end
   self:setMaterialVisible("highlight", false)
   self:resetAnimations()
end

return {CContainer=CContainer}
