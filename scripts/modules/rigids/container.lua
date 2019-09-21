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
   self.interactAnchor = self:getMeshByName("anchor_1")
end

function CContainer:showInventory(state)
   gameplayUI.inventoryContainer:show(state)
end

function CContainer:preActivate(char)
   if not self:isLocked() then
      self:playAnimation("open", false)
   end
end

function CContainer:activate(char)
   if not self:isLocked() then
      self.open = true
   end
end

function CContainer:deactivate(char)
   if not self:isLocked() and self.open then
      self:playAnimation("close", false)
      self.open = false
   end
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

function CContainer:getInteractType(char)
   if self:isLocked() then
      return CLockable.getInteractType(self, char)
   end
   return "container"
end

function CContainer:isInteractionLingering(char)
   if self:isLocked() then
      return CLockable.isInteractionLingering(self, char)
   else
      return true
   end
end

function CContainer:getInteractData(char)
   if not self:isLocked() and self.interactAnchor ~= nil and self:getPrefabName() == "chest.sbg" then
      local data = {
         anchorPos = self.interactAnchor:getPose():getPos(),
         anchorDir = vec3RotateQuat({x=0,y=0,z=-1}, self:getPose():getRotQuat()),
         animations = {
            activate = "idle_to_chest_idle",
            loop = "chest_idle",
            deactivate = "chest_idle_to_idle",
         },
      }
      return data
   else
      local data = {
         holster = false,
      }
      return data
   end
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
