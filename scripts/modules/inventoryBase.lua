local oo = require "loop.simple"
local ItemsData = require "itemsData"
local ItemsDataRecipes = require "ItemsDataRecipes"
local tablex = require "pl.tablex"
local hlp = require "helpers"
local GUIUtils = require "ui.utils"

---@class CInventoryBase
---@field private items CItem[]
local CInventoryBase = oo.class({
   idGenerator = 0,
   limits = nil,
})

function CInventoryBase:init(owner)
   self.owner = owner
   self.items = {}
   self.itemCounts = {}
   self.subscribersOnChange = {}
   self.owner:subscribeOnDestroy(self.destroyAllItems, self)
end

function CInventoryBase:genId()
   self.idGenerator = self.idGenerator + 1
   return self.idGenerator
end

function CInventoryBase:canStoreItems(itemName, count)
   count = count or 1
   local category = ItemsData.getItemLimitCategory(itemName)
   if category and self.limits and self.limits[category] then
      return math.max(0, math.min(count, self.limits[category] - self:getItemCountByLimitCategory(category)))
   end
   return count
end

------------
--MANAGEMENT
function CInventoryBase:dismissItem(item)
   item.owner = nil
   item.count = self.itemCounts[item:getId()]
   self.itemCounts[item:getId()] = nil
   table.remove(self:getItems(), self:getItemIndexById(item:getId()))
end

---Adds an item by name and count
---@param itemName string
---@param count number
---@param quality number
---@param silent boolean
---@param noEvent boolean
---@return CItem
function CInventoryBase:addItem(itemName, count, quality, silent, noEvent)
   if not itemName then return nil end
   local template = ItemsData.getItemTemplate(itemName)
   if not template and (not ItemsData.isCorrectItemName(itemName) or not ItemsData.hasItemsInfo(itemName)) then
      log(string.format("ERROR: inventory of '%s' tried to add item '%s' which doesn't exist", self.owner:getName(), tostring(itemName)))
      return nil
   elseif template then
      template = ItemsData.getItemTemplate(itemName)
      itemName = template.itemName
      quality =  quality or template.quality
   end
   count = count or 1
   count = self:canStoreItems(itemName, count)
   if count <= 0 then return nil end

   local isStackable = ItemsData.isItemStackable(itemName)
   local item = self:findItemsByName(itemName)[1]
   local prevCount = 0
   if isStackable and item then
      prevCount = item:getCount()
      self:changeItemCount(item, count)
   elseif not isStackable then
      for i=1,count do
         item = hlp.safeCreateItem(itemName)
         if not item then return nil end
         self:finalizeItem(item, 1)
         item:setQuality(quality, true)
      end
   else
      item = hlp.safeCreateItem(itemName)
      if not item then return nil end
      self:finalizeItem(item, count)
      item:setQuality(quality, true)
   end

   if item.magazine and template and template.magazine then
      item.magazine = template.magazine
   end

   if not noEvent then
      self:OnChange({eventType="ItemAdded", item = item, prevCount = prevCount, currentCount = item:getCount(), delta = count, silent = silent})
   end
   return item
end

--Adds an existing item entity to this inventory
function CInventoryBase:addItemObj(item, silent, noEvent)
   if not item then return nil end
   local itemName = item:getItemName()

   local prevOwner = item:getOwner()
   if prevOwner then
      local prevCount = item:getCount()
      prevOwner:dismissItem(item)
      if not noEvent then
         prevOwner:OnChange({eventType="ItemLost", item = item, prevCount = prevCount, currentCount = 0, delta = -prevCount, silent = silent})
      end
   end

   local count = self:canStoreItems(itemName, item:getCount())
   if count <= 0 then return nil end

   local existing = self:filterByQuality(self:findItemsByName(itemName), item:getQuality())[1]
   local prevCount = 0
   local isStackable = ItemsData.isItemStackable(itemName)
   if isStackable and existing then
      prevCount = item:getCount()
      self:changeItemCount(existing, count, true)
      item:destroy(item:getCount())
      item = existing
   else
      self:finalizeItem(item, count)
   end

   if not noEvent then
      self:OnChange({eventType="ItemAdded", item = item, prevCount = prevCount, currentCount = item:getCount(), delta = count, silent = silent})
   end
   return item
end

function CInventoryBase:finalizeItem(item, count)
   item.id       = self:genId()
   item.count    = nil
   item.owner    = self
   item.icon     = ItemsData.getItemIcon(item:getItemName())
   item.equippedSlot = nil

   item:setPlayerMode(false)
   item:setObject(self:getOwner())
   item:setCollisionCharactersRoot(false, false)
   item:setDynamicRoot(false)
   item:getPose():resetParent()
   item:hide()

   table.insert(self:getItems(), item)
   self.itemCounts[item:getId()] = count
end

function CInventoryBase:giveItemToById(sourceItemId, targetInventory, count, silent, noEvent)
   local sourceItem = self:getItemById(sourceItemId)
   return self:giveItemTo(sourceItem, targetInventory, count, silent, noEvent)
end

function CInventoryBase:giveItemToByName(sourceItemName, targetInventory, count, silent, noEvent)
   local sourceItem = self:getItemByName(sourceItemName)
   return self:giveItemTo(sourceItem, targetInventory, count, silent, noEvent)
end

function CInventoryBase:giveItemTo(sourceItem, targetInventory, count, silent, noEvent)
   if not sourceItem or not targetInventory then return end

   local sourceItemCount = sourceItem:getCount()
   local itemName = sourceItem:getItemName()
   count = count or 1
   count = targetInventory:canStoreItems(itemName, count)
   if count <= 0 then return nil end

   log(string.format("Give %d of %s from %s to %s", count, sourceItem:getItemName(), self:getOwner():getName(), targetInventory:getOwner():getName()))

   local item
   local prevCount = sourceItem:getCount()
   local currentCount = 0
   --Transfer everything silently and fire two OnChange events later
   if count == sourceItemCount then
      item = targetInventory:addItemObj(sourceItem, true, true)
   else
      self:destroyItem(sourceItem, count, true, true)
      item = targetInventory:addItem(sourceItem:getItemName(), count, sourceItem:getQuality(), true, true)
      currentCount = sourceItem:getCount()
   end

   if not noEvent then
      self:OnChange({eventType="ItemGiven", item = item, prevCount = prevCount, currentCount = currentCount, delta = -count, targetInventory = targetInventory, silent = silent})
      targetInventory:OnChange({eventType="ItemAdded", item = item, prevCount = prevCount, currentCount = item:getCount(), delta = count, silent = silent})
   end
   return item
end

function CInventoryBase:giveAllItemsTo(targetInventory, silent, noEvent)
   for _, item in ipairs(tablex.copy(self:getItems())) do
      self:giveItemTo(item, targetInventory, item:getCount(), silent, noEvent)
   end
end

function CInventoryBase:decomposeItem(item)
   if not item then return end

   log("CInventoryBase:decomposeItem: " .. item:getItemName())
   local decomposeList = ItemsDataRecipes.getDecomposeRecipe(item:getItemName())
   if decomposeList then
      self:destroyItem(item)
      for itemName, count in pairs(decomposeList) do
         addItemToObj(itemName, self.owner, count)
      end
   end
end

function CInventoryBase:destroyItemById(itemId, count, silent, noEvent, searchSimilar)
   local item = self:getItemById(itemId)
   return self:destroyItem(item, count, silent, noEvent, searchSimilar)
end
function CInventoryBase:destroyItemByName(itemName, count, silent, noEvent, searchSimilar)
   local item = self:getItemByName(itemName)
   return self:destroyItem(item, count, silent, noEvent, searchSimilar)
end

function CInventoryBase:destroyItem(item, count, silent, noEvent, searchSimilar)
   if not item then return false end
   count = count or 1
   local prevCount = item:getCount()

   local currentCount = 0
   if count == -1 or prevCount <= count then
      self:dismissItem(item, silent)
      getScene():destroyEntity(item)
   else
      self:changeItemCount(item, -count)
      currentCount = item:getCount()
   end

   if not noEvent then
      self:OnChange({name="ItemLost", item = item, prevCount = prevCount, currentCount = currentCount, delta = -count, silent = silent})
   end

   --Try to search for discrete items of this type if we specified to destroy more
   --Used in crafting and etc
   if count > prevCount and searchSimilar then
      count = count - prevCount
      local items = self:filterByQuality(self:findItemsByName(item:getItemName()), item:getQuality())
      for _,v in pairs(items) do
         self:destroyItem(v, count, true, false, false)
         count = count - v:getCount()
         if count <= 0 then
            break
         end
      end
   end

   return true
end

function CInventoryBase:destroyAllItems()
   for _, item in ipairs(tablex.copy(self:getItems())) do
      self:destroyItem(item, -1, true, true)
   end
end

function CInventoryBase:setItemCount(item, count)
   if not item or not count then return end
   self.itemCounts[item:getId()] = count
   if count <= 0 then
      self:destroyItem(item)
   end
end

function CInventoryBase:changeItemCount(item, delta)
   if not item or not delta then return false end
   self:setItemCount(item, self:getItemCount(item) + delta)
   return true
end

-- utils
function CInventoryBase:getItemLimit(category)
   return self.limits and self.limits[category]
end

function CInventoryBase:getOwner()
   return self.owner
end
function CInventoryBase:getItems()
   return self.items
end

--legacy utility for showGibs func
function CInventoryBase:getItemsCount()
   return #self:getItems()
end

function CInventoryBase:getLootTable()
   local t = {}
   for _,item in pairs(self:getItems()) do
      t[item:getItemName()] = item:getCount()
   end
   return t
end

function CInventoryBase:getItemCountByLimitCategory(category)
   local count = 0
   for _,item in ipairs(self:getItems()) do
      if item:getLimitCategory() == category then
         count = count + self:getItemCount(item)
      end
   end
   return count
end

function CInventoryBase:getItemCountByName(itemName)
   if not itemName then return nil end
   local count = 0

   for _, item in ipairs(self.items) do
      if item:getItemName() == itemName then
         count = count + item:getCount()
      end
   end
   return count
end

function CInventoryBase:getItemCountById(itemId)
   local item = self:getItemById(itemId)
   return self:getItemCount(item)
end

function CInventoryBase:getItemCount(item, searchSimilar)
   if not item then return 0 end
   local count = 0

   if searchSimilar then
      local items = self:filterByQuality(self:findItemsByName(item:getItemName()), item:getQuality())
      for _,v in pairs(items) do
         count = count + self.itemCounts[v:getId()]
      end
   else
      count = self.itemCounts[item:getId()]
   end
   return count
end

---@return CItem
function CInventoryBase:getItemByName(itemName)
   if not itemName then return nil end

   for _, item in ipairs(self:getItems()) do
      if item:getItemName() == itemName then
         return item
      end
   end
   return nil
end

function CInventoryBase:findItemsByName(itemName)
   if not itemName then return {} end
   return tablex.filter(self:getItems(), function(item) return item:getItemName() == itemName end)
end

function CInventoryBase:filterByQuality(items, quality)
   if not items or not quality then return {} end
   return tablex.filter(items, function(item) return item:getQuality() == quality end)
end

function CInventoryBase:getItemById(itemId)
   if not itemId then return nil end
   for _, item in ipairs(self:getItems()) do
      if item:getId() == itemId then
         return item
      end
   end
   return nil
end

function CInventoryBase:getItemByIndex(itemIndex)
   return self:getItems()[itemIndex]
end

function CInventoryBase:getItemIndexById(itemId)
   for index, item in ipairs(self:getItems()) do
      if item:getId() == itemId then
         return index
      end
   end
   return nil
end

function CInventoryBase:getItemIdByName(name)
   for _, item in ipairs(self:getItems()) do
      if item:getItemName() == name then
         return item:getId()
      end
   end
   return nil
end

function CInventoryBase:subscribeOnChange(func, ...)
   local callback = { ["func"] = func, ["args"] = table.pack(...) }
   table.insert(self.subscribersOnChange, callback)
   return callback
end

function CInventoryBase:unsubscribeOnChange(callback)
   if not callback then return end
   for i, v in ipairs(self.subscribersOnChange) do
      if v == callback then
         table.remove(self.subscribersOnChange, i)
         break
      end
   end
end

function CInventoryBase:OnChange(event)
   for _,v in ipairs(self.subscribersOnChange) do
      v.func(event, unpack(v.args))
   end
end

--TODO: redo item state saving/loading inside item classes
function CInventoryBase:getItemState(item)
   local itemState = {}
   itemState.name     = item:getItemName()
   itemState.count    = item:getCount()
   itemState.quality  = item:getQuality()
   itemState.magazine = item.magazine

   if item:isItemContainer() then
      itemState.locked = item:isLocked()
      itemState.empty  = item:isEmpty()
      itemState.broken = item:isBroken()
   end
   return itemState
end

function CInventoryBase:serialize()
   local result = {}
   for _, item in ipairs(self:getItems()) do
      if ItemsData.hasItemsInfo(item:getItemName()) then --Ignores dynamic items
         table.insert(result, self:getItemState(item))
      end
   end
   if #result > 0 then
      return result
   else
      return nil
   end
end

function CInventoryBase:loadItemState(itemTable)
   if not ItemsData.hasItemsInfo(itemTable.name) then return end
   local item = self:addItem(itemTable.name, itemTable.count, itemTable.quality, true)
   if item then
      if item.magazine and itemTable.magazine then
         item.magazine = itemTable.magazine
      end

      if item:isItemContainer() then
         item.locked = itemTable.locked
         item.empty  = itemTable.empty
         item.broken = itemTable.broken
      end
   end
   return item
end

function CInventoryBase:deserialize(items)
   if items then
      for _,itemTable in pairs(items) do
         if not pcall(self.loadItemState, self, itemTable) then
            log("ERROR ON DESERIALIZE OF ITEMTABLE")
            log(itemTable)
         end
      end
   end
end

return CInventoryBase
