local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"

local wndMgr

local CBaseModule = require "ui.baseModule"
local CInventoryBaseUI = require "ui.inventoryBaseUI"

---@class CNpcEditorOverviewEquipmentUI : CBaseModule
local CNpcEditorOverviewEquipmentUI = oo.class({
   initAsInteractive = false,
   initVisible = true,
   rowWidth = 7,
   minRowCount = 3,
   contentPane = nil,
}, CBaseModule)

function CNpcEditorOverviewEquipmentUI:init()
   CBaseModule.init(self)

   wndMgr = CEGUI.WindowManager:getSingleton()

   self.slots = {}
   self.slotNames = {"top", "bottom", "hat", "eyewear", "mask", "slot1", "slot3", "slot4", "slot5", "slot6"}

   for _, slotName in pairs(self.slotNames) do
      local slotTable = self:addCharacterSlot(slotName)
      slotTable.slot:setUserString("inventoryName", "")
      slotTable.slot:setUserString("sourceWindowName", "NpcEditorOverviewEquipment")
   end

   GUIUtils.widgetSubscribeEventProtected(gameplayUI.npcEditorUI.wnd, "DragDropItemDropped", partial(self.onItemDragDropToMainWindow, self))
end

function CNpcEditorOverviewEquipmentUI:addCharacterSlot(slotName)
   local parent = self.wnd:getChild(slotName)
   local slot = wndMgr:loadLayoutFromFile("inventory_slot.layout")
   slot:setName(slotName)
   parent:addChild(slot)

   slot:setWidth(CEGUI.UDim(1,0))

   local newSlot = {}
   newSlot.slot     = slot:getChild("DragContainer")
   newSlot.image    = slot:getChild("DragContainer/ItemImage")
   newSlot.equipped = slot:getChild("DragContainer/ItemImage/Equipped")
   newSlot.selected = slot:getChild("DragContainer/ItemImage/Selected")
   newSlot.counter  = slot:getChild("DragContainer/ItemImage/Counter")
   newSlot.quality  = slot:getChild("DragContainer/ItemImage/Quality")

   newSlot.counter:setText("")

   newSlot.slot:setUserString("inventoryName", self.wnd:getName())
   newSlot.slot:setUserString("slotID", slotName)

   GUIUtils.widgetSubscribeEventProtected(newSlot.slot, "DragStarted", CInventoryBaseUI.onSlotDragStarted)
   GUIUtils.widgetSubscribeEventProtected(newSlot.slot, "DragDropItemDropped", partial(self.onSlotItemDrop, self))
   GUIUtils.widgetSubscribeEventProtected(newSlot.slot, "MouseClick", partial(self.onSlotClick, self))
   GUIUtils.widgetSubscribeEventProtected(newSlot.slot, "MouseMove", partial(self.onSlotMouseMove, self))
   GUIUtils.widgetSubscribeEventProtected(newSlot.slot, "MouseEntersArea", partial(self.onSlotOver, self))
   GUIUtils.widgetSubscribeEventProtected(newSlot.slot, "MouseLeavesArea", partial(self.onSlotLeave, self))

   self.slots[slotName] = newSlot
   return newSlot
end

function CNpcEditorOverviewEquipmentUI:setup()
   --Subscribe to inventory changes
   if self.char ~= gameplayUI.npcEditorUI.char then
      if self.char then
         self.char.inventory:unsubscribeOnChange(self.onChangeSubscription)
      end
      self.char = gameplayUI.npcEditorUI.char
      self.onChangeSubscription = self.char.inventory:subscribeOnChange(partial(self.setup, self))
   end

   local inventory = self.char:getInventory()
   local invSlots = inventory:getSlots()
   local weapon = self.char:getWeaponSlotItem()
   for _, slotName in pairs(self.slotNames) do
      local slotWindows = self.slots[slotName]
      if slotWindows then
         local slotID = slotName
         if slotID:find("slot") then
            slotID = slotID:gsub("slot", "")
            slotID = tonumber(slotID)
         end
         if invSlots[slotID] then
            local item = invSlots[slotID]
            slotWindows.image:setProperty("Image", "gameplay/"..item.icon)
            slotWindows.slot:setUserString("itemID", tostring(item.id))
            if slotID ~= 1 and weapon == item then
               slotWindows.image:setAlpha(0.4)
            else
               slotWindows.image:setAlpha(1)
            end
            slotWindows.slot:setProperty("DraggingEnabled", "true")
            slotWindows.quality:setProperty("Image", "gameplay/QualityMark" .. item:getQuality())
         else
            slotWindows.image:setProperty  ("Image", "")
            slotWindows.quality:setProperty("Image", "")
            slotWindows.slot:setProperty("DraggingEnabled", "false")
            slotWindows.slot:setUserString("ItemID", "")
         end
      end
   end
end


--Callbacks--
function CNpcEditorOverviewEquipmentUI:onSlotMouseMove(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local slotKey = GUIUtils.getWindowInventorySlotKey(click_args.window:getParent())
   local item = self.char.inventory:getSlotItem(slotKey)
   if not item then return false end

   gameplayUI.itemInfoUI:setPosition(click_args.position)
end

function CNpcEditorOverviewEquipmentUI:onSlotOver(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local slotKey = GUIUtils.getWindowInventorySlotKey(click_args.window:getParent())
   local slotName = click_args.window:getParent():getName()

   self.slots[slotName].selected:setVisible(true)

   local item = self.char.inventory:getSlotItem(slotKey)
   if not item then return end

   gameplayUI.itemInfoUI:show(true, item)
   self:onSlotMouseMove(args)
end

function CNpcEditorOverviewEquipmentUI:onSlotLeave(args)
   if not CEGUI then return end
   local click_args = CEGUI.toMouseEventArgs(args)
   local slotName = click_args.window:getParent():getName()
   gameplayUI.itemInfoUI:show(false)
   self.slots[slotName].selected:setVisible(false)
end


--From inventory equips the item, from itemsUI adds an item and equips it
function CNpcEditorOverviewEquipmentUI:onSlotItemDrop(args)
   local dd_args = CEGUI.toDragDropEventArgs(args)
   local window = dd_args.dragDropItem
   local sourceWindowName = window:getUserString("sourceWindowName")

   local slotKey = GUIUtils.getWindowInventorySlotKey(dd_args.window:getParent())
   local item

   if sourceWindowName == "NpcEditorOverviewInventory" or sourceWindowName == "NpcEditorOverviewEquipment" then
      local itemID = tonumber(window:getUserString("itemID"))
      item = self.char.inventory:getItemById(itemID)
   elseif sourceWindowName == "NpcEditorItems" then
      item = gameplayUI.npcEditorUI.itemsUI:onItemAdded(window:getUserString("itemName"), 1)
   end

   if not item then return end

   if item:isAttire() then
      if item:getAttireType() == slotKey then
         self.char.inventory:equipSlotWithItem(item:getAttireType(), item.id, false, false)
      end

      gameplayUI.npcEditorUI:onChangeMade()
   elseif item:isEquipable() and (item:getItemName() ~= "hand_to_hand.wpn" or slotKey == self.char:getWeaponSlot()) then
      self.char.inventory:equipSlotWithItem(slotKey, item.id, false, false)

      gameplayUI.npcEditorUI:onChangeMade()
   end
end

--LMB removes an item
function CNpcEditorOverviewEquipmentUI:onSlotClick(args)
   local click_args = args:toMouseEventArgs()
   if click_args.button == CEGUI.LeftButton then
      self:onItemUnequipped(click_args.window)
   end
end

function CNpcEditorOverviewEquipmentUI:onItemUnequipped(window)
   local slotName = window:getParent():getName()
   local slotID = slotName
   if slotName:find("slot") then
      slotID = slotID:gsub("slot", "")
      slotID = tonumber(slotID)
   end

   local item = self.char.inventory:getSlotItem(slotID)

   if not item then return end

   self.char.inventory:unequipSlot(slotID, false, false)

   gameplayUI.npcEditorUI:onChangeMade()
end

--Drag drop to main window removes an item
function CNpcEditorOverviewEquipmentUI:onItemDragDropToMainWindow(args)
   local dd_args = CEGUI.toDragDropEventArgs(args)
   local window = dd_args.dragDropItem
   if window:getUserString("sourceWindowName") == "NpcEditorOverviewEquipment" then
      local item = GUIUtils.getWindowItem(window, self.char.inventory)
      gameplayUI.npcEditorUI.overviewInventoryUI:onItemRemoved(item)

      gameplayUI.npcEditorUI:onChangeMade()
   end
end

return CNpcEditorOverviewEquipmentUI
