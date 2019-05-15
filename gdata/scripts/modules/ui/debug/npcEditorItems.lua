local oo = require "loop.simple"

local tablex = require "pl.tablex"
local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"
local hlp = require "helpers"

local ItemsData = require "itemsData"
local ItemsInfo = ItemsData.ItemsInfo
local CInventoryBaseUI = require "ui.inventoryBaseUI"

---@class CNpcEditorItemsUI : CBaseModule
local CNpcEditorItemsUI = oo.class({
   initAsInteractive = false,
   rowWidth = 7,
   currentTab = "TabAll",
}, CInventoryBaseUI)

function CNpcEditorItemsUI:init()
   self.wnd = gameplayUI.npcEditorUI.wnd:getChild("AvailableItems")

   CInventoryBaseUI.init(self)

   --Create additional rows beforehand so it doesn't lag during the first inventory use with lots of items
   self:addRows(30)
   self:showRows(30, false)

   for tabName in pairs(self.tabFilters) do
      GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild(tabName), "Clicked", partial(self.onTabClick, self))
   end
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("TabAll"), "Clicked", partial(self.onTabClick, self))

   self.itemsList = {}
   for itemName in pairs(ItemsInfo) do
      table.insert(self.itemsList, itemName)
   end
end

function CNpcEditorItemsUI:clearSlot(slotTable)
   CInventoryBaseUI.clearSlot(self, slotTable)
   slotTable.slot:setUserString("itemName", "")
end

function CNpcEditorItemsUI:setup()
   self.char = gameplayUI.npcEditorUI.char

   local filterTable = self.tabFilters[self.currentTab]

   self:adjustRows(self.itemsList)

   self:clearSlots()

   self:updateContentPane()

   local sortedIterator = tablex.sortv(self.itemsList, partial(self.sort, self))
   local index = 1
   for _, itemName in sortedIterator do
      if not filterTable or tablex.search(filterTable, ItemsData.getItemInvCategory(itemName)) then
         self.slots[index].slot:setUserString("sourceWindowName", "NpcEditorItems")
         self.slots[index].slot:setUserString("itemName", itemName)
         self.slots[index].slot:setProperty("DraggingEnabled", "true")
         self.slots[index].image:setProperty("Image", "gameplay/" .. ItemsInfo[itemName].icon)
         index = index + 1
      end
   end
end

function CNpcEditorItemsUI:sort(itemNameA, itemNameB)
   local orderA = self:getItemOrder(itemNameA) or self.itemsOrderTable.misc
   local orderB = self:getItemOrder(itemNameB) or self.itemsOrderTable.misc
   if orderA == orderB then
      orderA = itemNameA
      orderB = itemNameB
   end
   return orderA < orderB
end

function CNpcEditorItemsUI:getItemOrder(itemName)
   return self.itemsOrderTable[ItemsData.getItemInvCategory(itemName)]
end

--Callbacks--

--Highlight and display item info of a fake item
function CNpcEditorItemsUI:onSlotMouseHover(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local window = click_args.window

   local slotID = tonumber(click_args.window:getUserString("slotID"))
   self.slots[slotID].selected:setVisible(true)

   local itemName = window:getUserString("itemName")
   if itemName == "" then return end

   --Create an unowned item for the sake of showing itemInfo
   self.itemMockup = {itemName = itemName}
   gameplayUI.itemInfoUI:show(true, self.itemMockup)
   self:onSlotMouseMove(args)
end

function CNpcEditorItemsUI:onSlotMouseMove(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if not self.itemMockup then
      gameplayUI.itemInfoUI:show(false)
      return
   end

   gameplayUI.itemInfoUI:setPosition(click_args.position)
end

function CNpcEditorItemsUI:onSlotMouseLeave(args)
   if not CEGUI then return end
   local click_args = CEGUI.toMouseEventArgs(args)
   local slotID = tonumber(click_args.window:getUserString("slotID"))
   self.slots[slotID].selected:setVisible(false)
   gameplayUI.itemInfoUI:show(false)
   if self.itemMockup then
      self.itemMockup = nil
   end
end

--LMB adds an item
function CNpcEditorItemsUI:onSlotClick(args)
   local click_args = args:toMouseEventArgs()
   local window = click_args.window
   local itemName = window:getUserString("itemName")
   if click_args.button == CEGUI.LeftButton then
      self:onItemAdded(itemName)
   end
end

function CNpcEditorItemsUI:onItemAdded(itemName, count)
   if gameplayUI.shiftPressed and not count then
      gameplayUI.itemDelimiterUI:setup({icon = ItemsData.getItemIcon(itemName)}, function()
         self.char.inventory:addItem(itemName, gameplayUI.itemDelimiterUI:getCount())
      end, nil, 1000)
      gameplayUI.itemDelimiterUI:show(true)
      gameplayUI.itemDelimiterUI.editbox:setText(1)
      gameplayUI.itemDelimiterUI.scrollbar:setProperty("ScrollPosition", 1)

      gameplayUI.npcEditorUI:onChangeMade()
   else
      local item = self.char.inventory:addItem(itemName, count or 1)

      gameplayUI.npcEditorUI:onChangeMade()

      return item
   end
end

return CNpcEditorItemsUI
