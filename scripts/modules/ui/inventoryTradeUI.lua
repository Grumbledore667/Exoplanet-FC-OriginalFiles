local oo = require "loop.simple"

local tablex = require "pl.tablex"
local f = require "fun"
local partial = f.partial
local GUIUtils = require "ui.utils"

local CInventoryBaseUI = require "ui.inventoryBaseUI"

---@class CInventoryTradeUI : CInventoryBaseUI
local CInventoryTradeUI = oo.class({
   containerWnd = nil,
   layoutName = nil,
   windowName = nil,
   initVisible = true,
   initAsInteractive = false,
   minRowCount = 2,
   rowWidth = 5,
   currentTab = nil,
   targetInventoryName = nil,
}, CInventoryBaseUI)

function CInventoryTradeUI:init()
   self.wnd = self.containerWnd
   self.windowName = self.wnd:getName()

   CInventoryBaseUI.init(self)

   self.items = {}

   if self.currentTab then
      for tabName in pairs(self.tabFilters) do
         GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild(tabName), "Clicked", partial(self.onTabClick, self))
      end
      GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("TabAll"), "Clicked", partial(self.onTabClick, self))
   end
end

function CInventoryTradeUI:remapItemsList(items)
   self.items = {}
   for _,item in ipairs(items) do
      table.insert(self.items, { item = item, count = item:getCount() })
   end
   self:setup()
end

function CInventoryTradeUI:setup()
   self:adjustRows(self.items)

   self:clearSlots()

   self:updateContentPane()

   local player = getMC()
   local filterTable = self.tabFilters[self.currentTab]
   local sortedIterator = tablex.sortv(self.items, partial(self.sort, self))
   local index = 0
   for _,itemTable in sortedIterator do
      if not filterTable or tablex.search(filterTable, itemTable.item:getInvCategory()) then
         index = index + 1
         self.slots[index].slot:setProperty  ("DraggingEnabled", "true")
         self.slots[index].slot:setUserString("itemID", tostring(itemTable.item:getId()))
         self.slots[index].image:setProperty ("Image", "gameplay/" .. itemTable.item.icon)
         self.slots[index].quality:setProperty("Image", "gameplay/QualityMark" .. itemTable.item:getQuality())
         self.slots[index].item = itemTable.item
         if itemTable.count > 1 then
            self.slots[index].counter:setText(tostring(itemTable.count))
         else
            self.slots[index].counter:setText("")
         end

         if player.lastWeapon == itemTable.item then
            self.slots[index].equipped:setProperty("Image", "gameplay/EquippedWeapon")
         elseif itemTable.item:isEquipped() then
            self.slots[index].equipped:setProperty("Image", "gameplay/Equipped")
         end
      end
   end
   self:updateItemSum()
end

function CInventoryTradeUI:updateItemSum()
   if self.windowName ~= "buyInventory" and self.windowName ~= "sellInventory" then return end
   local sum = 0
   for _, itemTable in ipairs(self.items) do
      local item = itemTable.item
      local count = itemTable.count
      local globalMul = 1
      local personalMul = 1
      local sellMul = 1
      if item then
         if not item:isMoney() then
            local value = item:getValue() or 1
            if self.windowName == "sellInventory" then
               sellMul = getGlobalParam("sellingPriceMultiplier")
               globalMul = getGlobalParam("sellToVendorMul")
               personalMul = getGlobalParam(getMC().exchangeTarget:getName() .. "_sellToVendorMul") or personalMul
            elseif self.windowName == "buyInventory" then
               globalMul = getGlobalParam("buyFromVendorMul")
               personalMul = getGlobalParam(getMC().exchangeTarget:getName() .. "_buyFromVendorMul") or personalMul
            end
            sum = sum + value * count * sellMul * globalMul * personalMul
         else
            sum = sum + count
         end
      end
   end
   sum = math.ceil(sum)

   self.wnd:getChild("Sum"):setText(sum)
end

function CInventoryTradeUI:sort(a, b)
   return CInventoryBaseUI.sort(self, a.item, b.item)
end

--item is itemObj
function CInventoryTradeUI:addItem(item, count)
   for i,itemTable in ipairs(self.items) do
      if itemTable.item == item then
         itemTable.count = itemTable.count + count
         self:setup()
         return
      end
   end
   table.insert(self.items, { item = item, count = count })
   self:setup()
end

--item is either itemObj, itemName or ID
function CInventoryTradeUI:removeItem(item, count)
   for i,itemTable in ipairs(self.items) do
      if itemTable.item:getId() == item or itemTable.item == item or itemTable.item:getItemName() == item then
         if count and count < itemTable.count then
            itemTable.count = itemTable.count - count
         else
            table.remove(self.items, i)
         end
         break
      end
   end
   self:setup()
end

--item is either itemName or ID
function CInventoryTradeUI:getItem(item)
   local itemTable = self:getItemTable(item)
   if itemTable then return itemTable.item end
end

--item is either item Obj, itemName or ID
function CInventoryTradeUI:getItemTable(item)
   for _,itemTable in ipairs(self.items) do
      if itemTable.item:getId() == item or itemTable.item == item or itemTable.item:getItemName() == item then
         return itemTable
      end
   end
end

--item is either item Obj, itemName or ID
function CInventoryTradeUI:getItemCount(item)
   local itemTable = self:getItemTable(item)
   local count = 0
   if itemTable then count = itemTable.count end
   return count
end

function CInventoryTradeUI:moveItem(item, count, targetInventoryName)
   if not item then return end

   local player = getMC()
   local trader = getMC().exchangeTarget
   local itemCount = self:getItemCount(item)

   if gameplayUI.shiftPressed then
      count = itemCount
   elseif not count and itemCount > 1 then
      gameplayUI.itemDelimiterUI:setup(item, function()
         self:moveItem(item, gameplayUI.itemDelimiterUI:getCount(), targetInventoryName)
      end, nil, itemCount)
      gameplayUI.itemDelimiterUI:show(true)
      return
   end

   count = math.min(itemCount, count or 1)

   --Check if you/trader can store the items you're trying to transfer plus the ones that are already in sell/buy
   if targetInventoryName == "buyInventory" then
      local checkCount = count + gameplayUI.tradingUI.buyInventory:getItemCount(item) - gameplayUI.tradingUI.sellInventory:getItemCount(item)
      count = math.min(count, player:getInventory():canStoreItems(item, checkCount))
   elseif targetInventoryName == "sellInventory" then
      local checkCount = count - gameplayUI.tradingUI.buyInventory:getItemCount(item) + gameplayUI.tradingUI.sellInventory:getItemCount(item)
      count = math.min(count, trader:getInventory():canStoreItems(item, checkCount))
   end

   if count <= 0 then return end

   self:removeItem(item, count)
   gameplayUI.tradingUI[targetInventoryName]:addItem(item, count)
end


--CALLBACKS
function CInventoryTradeUI:onSlotClick(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      local sourceInventoryName = click_args.window:getUserString("inventoryName")
      local itemID = tonumber(click_args.window:getUserString("itemID"))
      local item = self:getItem(itemID)
      if item then
         local targetInventoryName
         if sourceInventoryName == "traderInventory" then
            targetInventoryName = "buyInventory"
         elseif sourceInventoryName == "buyInventory" then
            targetInventoryName = "traderInventory"
         elseif sourceInventoryName == "playerInventory" then
            targetInventoryName = "sellInventory"
         elseif sourceInventoryName == "sellInventory" then
            targetInventoryName = "playerInventory"
         end
         self:moveItem(item, nil, targetInventoryName)
      end
   end
end

function CInventoryTradeUI:onSlotItemDrop(args)
   if not CInventoryBaseUI.onSlotItemDrop(self, args) then return false end
   local dd_args = CEGUI.toDragDropEventArgs(args)
   local sourceInventoryName = dd_args.dragDropItem:getUserString("inventoryName")
   local targetInventoryName = dd_args.window:getUserString("inventoryName")
   local itemID = tonumber(dd_args.dragDropItem:getUserString("itemID"))
   local item = gameplayUI.tradingUI[sourceInventoryName] and gameplayUI.tradingUI[sourceInventoryName]:getItem(itemID)
   if item and gameplayUI.tradingUI[sourceInventoryName].targetInventoryName == targetInventoryName then
      gameplayUI.tradingUI[sourceInventoryName]:moveItem(item, nil, targetInventoryName)
   end
end

return CInventoryTradeUI
