local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"
local wndMgr

local CBaseModule = require "ui.baseModule"

---@class CHotbarUI : CBaseModule
local CHotbarUI = oo.class({
   initVisible = true,
}, CBaseModule)

--Methods
function CHotbarUI:init()
   wndMgr = CEGUI.WindowManager:getSingleton()
   self.slots = {}
   self.QHotbarSlot = {}

   self.slotWidth = 0.085
   self.qSlotMargin = 0.01

   self.wnd = gameplayUI.wndGameplay:getChild("Hotbar/Container"):toHorizontalLayoutContainer()

   CBaseModule.init(self)

   self.QHotbarSlot = self:addHotbarSlot(11, "Q")
   for i=1,10 do
      self:addHotbarSlot(i, i)
   end

   wndMgr:destroyWindow(self.wnd:getChild("ExampleSlot"))

   self:clearHotbar()
   self:updateHotbarButtonsNames()

   getScene():subscribeOnLocationEnter(function()
      local player = getMC()
      if player then getMC():getInventory():subscribeOnChange(partial(self.updateAllHotbarItems, self)) end
   end)
end

function CHotbarUI:addHotbarSlot(index, suffix)
   if suffix == 10 then suffix = 0 end
   local exSlot = self.wnd:getChild("ExampleSlot")
   local slot = exSlot:clone(true)
   slot:setVisible(true)
   slot:setName("Slot" .. suffix)
   self.wnd:addChild(slot)

   if suffix == "Q" then
      slot:setProperty("VerticalAlignment", "Top")
      slot:setMargin(CEGUI.UBox(CEGUI.UDim(0, 0), CEGUI.UDim(0, 0), CEGUI.UDim(0, 0), CEGUI.UDim(0.005, 0)))
   end

   slot:setWidth(CEGUI.UDim(self.slotWidth, 0)) --Height is set by aspect ratio

   slot:getChild("SlotID"):setText(suffix)

   local newSlot = {}
   newSlot.slot       = slot:getChild("DragContainer")
   newSlot.image      = slot:getChild("DragContainer/ItemImage")
   newSlot.equipped   = slot:getChild("DragContainer/ItemImage/Equipped")
   newSlot.selected   = slot:getChild("DragContainer/ItemImage/Selected")
   newSlot.counter    = slot:getChild("DragContainer/ItemImage/Counter")

   GUIUtils.widgetSubscribeEventProtected(newSlot.slot, "DragDropItemDropped", partial(self.onDragAndDropHotbar, self))
   GUIUtils.widgetSubscribeEventProtected(newSlot.slot, "MouseClick",          partial(self.onHotbarSlotClick, self))

   newSlot.slot:setUserString("inventoryName", "Hotbar")
   newSlot.slot:setUserString("slotID", tostring(index))

   self.slots[index] = newSlot
   return newSlot
end

function CHotbarUI:clearHotbar()
   for i=1,#self.slots do
      self:clearHotbarSlot(i)
   end
end

--Preserve the 11th slot for equipped gadget auto assign in CMainCharacter.OnInventoryChange
function CHotbarUI:isSlotLocked(index)
   return index == 11
end

function CHotbarUI:updateHotbarButtonsNames()
   if isMainMenu() then return end
   for i=1,9 do
      local slotIdWnd = self.wnd:getChild("Slot"..i.."/SlotID")
      local keyName = getButtonCurrentKeyName("HOTBAR"..i)
      slotIdWnd:setText(keyName)
   end
   local slotIdWnd = self.wnd:getChild("Slot0/SlotID")
   local keyName = getButtonCurrentKeyName("HOTBAR0")
   slotIdWnd:setText(keyName)

   slotIdWnd = self.wnd:getChild("SlotQ/SlotID")
   keyName = getButtonCurrentKeyName("HOTBARQ")
   slotIdWnd:setText(keyName)
end

function CHotbarUI:clearHotbarSlot(index)
   local hotbarSlot = self.slots[index]
   hotbarSlot.slot:setUserString("itemID", "")
   hotbarSlot.slot:setProperty("DraggingEnabled", "false")
   hotbarSlot.image:setProperty("Image", "")
   hotbarSlot.counter:setText("")
end

function CHotbarUI:setItemToHotbar(index, item)
   local hotbarSlot = self.slots[index]
   if not hotbarSlot then return end
   if item then
      if self:isSlotLocked(index) and (item:getAttireType() ~= "gadget" or not item:isEquipped()) then
         gameplayUI:showInfoTextEx("The quick slot is locked for an equipped gadget", "minor", "")
         return
      end
      hotbarSlot.slot:setUserString("itemID", tostring(item:getId()))
      if not self:isSlotLocked(index) then
         hotbarSlot.slot:setProperty("DraggingEnabled", "true")
      end
      hotbarSlot.image:setProperty("Image", "gameplay/" .. item.icon)
      local count = ""
      if item:getCount() > 1 then count = tostring(item:getCount()) end
      hotbarSlot.counter:setText(count)
   else
      self:clearHotbarSlot(index)
   end
end

function CHotbarUI:setItemToHotbarByName(index, itemName)
   local item = getMC():getInventory():getItemByName(itemName)
   self:setItemToHotbar(index, item)
end

function CHotbarUI:setItemToHotbarById(index, itemId)
   local item = getMC():getInventory():getItemById(itemId)
   self:setItemToHotbar(index, item)
end

function CHotbarUI:updateAllHotbarItems()
   for i=1,#self.slots do
      self:updateHotbarItemByIndex(i)
   end
end

function CHotbarUI:updateHotbarItemByIndex(index)
   self:updateHotbarSlot(self.slots[index])
end

function CHotbarUI:updateHotbarSlot(hotbarSlot)
   if not hotbarSlot then return end
   local slotID = self:getHotbarWndIndex(hotbarSlot.slot)
   local item = self:getHotbarItemInSlot(slotID)
   self:setItemToHotbar(slotID, item)
end

function CHotbarUI:getItemHotbarSlot(item)
   for index in ipairs(self.slots) do
      if item.id == self:getHotbarItemIdInSlot(index) then
         return index
      end
   end
end

function CHotbarUI:getHotbarItemInSlot(index)
   return getMC():getInventory():getItemById(self:getHotbarItemIdInSlot(index))
end

function CHotbarUI:getHotbarItemIdInSlot(index)
   return tonumber(self.slots[index].slot:getUserString("itemID"))
end

function CHotbarUI:getHotbarWndIndex(wnd)
   return tonumber(wnd:getUserString("slotID"))
end


--Callbacks
function CHotbarUI:onHotbarSlotClick(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local slotID = self:getHotbarWndIndex(click_args.window)
   if click_args.button == CEGUI.RightButton and not self:isSlotLocked(slotID) then
      local item = self:getHotbarItemInSlot(slotID)
      if not item then return end
      gameplayUI.popupMenuUI.item = slotID
      gameplayUI.popupMenuUI:setup({"clear slot"})
      gameplayUI.popupMenuUI.wnd:setPosition(CEGUI.UVector2(CEGUI.UDim(0,click_args.position.x), CEGUI.UDim(0,click_args.position.y)))
   end
end

function CHotbarUI:onDragAndDropHotbar(args)
   if gameplayUI.tradingUI:isVisible() then return end
   local player = getMC()
   local dd_args = CEGUI.toDragDropEventArgs(args)
   local sourceInventoryName = dd_args.dragDropItem:getUserString("inventoryName")
   if not sourceInventoryName then return end

   local itemID = tonumber(dd_args.dragDropItem:getUserString("itemID"))
   local pInventory = player:getInventory()
   local item
   if sourceInventoryName == "inventoryContainer" or sourceInventoryName == "inventoryTurret" then
      item = player:getTargetInventory():getItemById(itemID)
      item = player:getTargetInventory():giveItemTo(item, player:getInventory(), item:getCount())
   else
      item = pInventory:getItemById(tonumber(dd_args.dragDropItem:getUserString("itemID")))
   end

   local slotID = self:getHotbarWndIndex(dd_args.dragDropItem)
   local targetID = self:getHotbarWndIndex(dd_args.window)
   local targetItem = self:getHotbarItemInSlot(targetID)

   if sourceInventoryName == "Hotbar" then
      --Swaps items but Will clear the slot if item is nil
      self:setItemToHotbar(slotID, targetItem)
   end

   self:setItemToHotbar(targetID, item)
end


return CHotbarUI
