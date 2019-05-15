local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"

local DelimiterUI
local CInventoryBaseUI = require "ui.inventoryBaseUI"
local CBaseModule = require "ui.baseModule"

---@class CNpcEditorOverviewInventoryUI : CBaseModule
local CNpcEditorOverviewInventoryUI = oo.class({
   initAsInteractive = false,
   initVisible = true,
   rowWidth = 7,
   minRowCount = 3,
   contentPane = nil,
}, CInventoryBaseUI)

function CNpcEditorOverviewInventoryUI:init()
   DelimiterUI = gameplayUI.itemDelimiterUI

   CBaseModule.init(self)

   self.slots = {}
   self.createdRows = 0
   self.visibleRows = 0
   self.slotWidth = 1/self.rowWidth - 0.005

   self:addRows(self.minRowCount)
   self:clearSlots()

   GUIUtils.widgetSubscribeEventProtected(gameplayUI.npcEditorUI.wnd, "DragDropItemDropped", partial(self.onItemDragDropToMainWindow, self))
end

function CNpcEditorOverviewInventoryUI:setup()
   --Subscribe to inventory changes
   if self.char ~= gameplayUI.npcEditorUI.char then
      if self.char then
         self.char.inventory:unsubscribeOnChange(self.onChangeSubscription)
      end
      self.char = gameplayUI.npcEditorUI.char
      self.onChangeSubscription = self.char.inventory:subscribeOnChange(partial(self.setup, self))
   end

   self:adjustRows(self.char.inventory.items)

   self:clearSlots()

   self:updateContentPane()

   for i, item in pairs(self.char.inventory.items) do
      local slotWindows = self.slots[i]
      slotWindows.slot:setUserString("sourceWindowName", "NpcEditorOverviewInventory")
      slotWindows.slot:setProperty("DraggingEnabled", "true")
      slotWindows.image:setProperty("Image", "gameplay/" .. item.icon)
      slotWindows.slot:setUserString("itemID", tostring(item.id))
      slotWindows.quality:setProperty("Image", "gameplay/QualityMark" .. item:getQuality())
      slotWindows.item = item
      if item:getCount() > 1 then
         slotWindows.counter:setText(tostring(item:getCount()))
      else
         slotWindows.counter:setText("")
      end
      if item:isEquipped() then
         slotWindows.equipped:setProperty("Image", "gameplay/Equipped")
      end
      local itemName = item:getItemName()
      if itemName == "hand_to_hand.wpn" or itemName == "token_human.itm" or itemName == "token_abori.itm" then --Default items
         slotWindows.slot:setProperty("Disabled", "true")
         slotWindows.image:setProperty("Alpha", "0.5")
      else
         slotWindows.slot:setProperty("Disabled", "false")
         slotWindows.image:setProperty("Alpha", "1")
      end
   end
end


--Callbacks--
function CNpcEditorOverviewInventoryUI:onSlotItemDrop(args)
   local dd_args = CEGUI.toDragDropEventArgs(args)
   local window = dd_args.dragDropItem
   if window:getUserString("sourceWindowName") == "NpcEditorItems" then
      gameplayUI.npcEditorUI.itemsUI:onItemAdded(window:getUserString("itemName"))
   elseif window:getUserString("sourceWindowName") == "NpcEditorOverviewEquipment" then
      gameplayUI.npcEditorUI.overviewEquipmentUI:onItemUnequipped(window)
   end
end

--LMB removes an item
function CNpcEditorOverviewInventoryUI:onSlotClick(args)
   local click_args = args:toMouseEventArgs()
   local window = click_args.window
   local itemID = tonumber(window:getUserString("itemID"))
   local item = self.char.inventory:getItemById(itemID)

   if not item then return end
   if click_args.button == CEGUI.LeftButton then
      self:onItemRemoved(item)
   elseif click_args.button == CEGUI.RightButton then
      local popupOptions = {
         quality = {func = self.onItemPopupClicked, args = {self, item, "quality"}},
      }
      if item:isRangedWeapon() and not item:isEnergy() then
         popupOptions.magazine = {func = self.onItemPopupClicked, args = {self, item, "magazine"}}
      end
      gameplayUI.popupMenuUI:setup(popupOptions)
   end
end

function CNpcEditorOverviewInventoryUI:onItemPopupClicked(item, option)
   if option == "quality" then
      DelimiterUI:setup(item, function()
         item:setQuality(DelimiterUI:getCount())
         gameplayUI.npcEditorUI:onChangeMade()
      end, nil, 4)
      DelimiterUI:show(true)
      DelimiterUI.editbox:setText(item:getQuality())
      DelimiterUI.scrollbar:setProperty("ScrollPosition", item:getQuality())
   elseif option == "magazine" then
      DelimiterUI:setup(item, function()
         item.magazine = DelimiterUI:getCount()
         gameplayUI.npcEditorUI:onChangeMade()
      end, nil, item:getMagazineMax())
      DelimiterUI:show(true)
      DelimiterUI.editbox:setText(item:getMagazine())
      DelimiterUI.scrollbar:setProperty("ScrollPosition", item:getMagazine())
   end
end

--Drag drop to main window removes an item
function CNpcEditorOverviewInventoryUI:onItemDragDropToMainWindow(args)
   local dd_args = CEGUI.toDragDropEventArgs(args)
   local window = dd_args.dragDropItem

   if window:getUserString("sourceWindowName") == "NpcEditorOverviewInventory" then
      local item = GUIUtils.getWindowItem(window, self.char.inventory)
      if item then
         self:onItemRemoved(item)
      end
   end
end

function CNpcEditorOverviewInventoryUI:onItemRemoved(item)
   if gameplayUI.shiftPressed then
      item:destroy(item:getCount())
   elseif item:getCount() > 1 then
      DelimiterUI:setup(item, function()
         item:destroy(math.min(item:getCount(), DelimiterUI:getCount()))
      end)
      DelimiterUI:show(true)
   else
      item:destroy()
   end

   gameplayUI.npcEditorUI:onChangeMade()
end

return CNpcEditorOverviewInventoryUI
