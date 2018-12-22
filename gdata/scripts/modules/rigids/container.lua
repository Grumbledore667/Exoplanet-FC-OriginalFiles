local oo = require "loop.simple"
local CInventory = (require "inventory").CInventory
local ObjectsLabels = (require "objectsLabels")
local ItemsLists = (require "itemsLists")

local CContainer = oo.class({
   opened = false,
})

function CContainer:OnCreate()
   self.inventory = CInventory{}
   self.inventory:init     ( self )
   local items = loadParamItemCounts(self, "items", {})
   for name, count in pairs(items) do
      for i=1, count do
         self.inventory:addItem(name)
      end
   end

   self.inventory:setRadius( loadParamNumber ( self, "raycastRadius", 100) )

   self.labelId = loadParam( self, "labelId", "" )
end

function CContainer:OnDestroy()
end

function CContainer:activate( obj )
   if ( not self.opened ) then
      self:playAnimation( "open", false )
      self.opened = true
   end

   return true
end

function CContainer:deactivate( obj )
   if ( self.opened ) then
      self:playAnimation( "close", false )
      self.opened = false
   end

   return true
end

function CContainer:getLabel()
   local label = ObjectsLabels.getLabel( self.labelId )

   if label == "" then
      label = ItemsLists.getLabelForModel( self:getPrefabName() )
   end

   if label == "" then
      label = "Container"
   end

   if self.inventory:getItemsCount() == 0 then
      label = label.." (empty)"
   end

   return label
end

function CContainer:getInteractLabel()
   local label = ObjectsLabels.getInteractLabel( self.labelId )

   if ( label == "" ) then
      label = "open"
   end

   return label
end

function CContainer:getLootTable()
   local t = {}
   local itemsMgr = self.inventory.itemsManager

   for _,item in pairs(itemsMgr.items) do
      t[item:getItemName()] = item.count
   end

   return t
end

function CContainer:OnSaveState(state)
   state.inventory = self.inventory.itemsManager:serialize()
end

function CContainer:OnLoadState(state)
   self.inventory.itemsManager.items = {}
   if state.inventory then
      self.inventory.itemsManager:deserialize(state.inventory)
   end
   self:setMaterialVisible( "highlight", false )
end

return {CContainer=CContainer}
