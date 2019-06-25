local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial
local GUIUtils = require "ui.utils"

local wndMgr

local CBaseModule = require "ui.baseModule"

---@class CInventoryBaseUI : CBaseModule
local CInventoryBaseUI = oo.class({
   layoutName = nil,
   initAsInteractive = true,
   windowName = nil,
   minRowCount = 2,
   rowWidth = 5,
   currentTab = nil,
   equippedOrderTable = {last_weapon = 1, weapon = 2, attire = 10, gadget = 11, accessory = 12},
   itemsOrderTable = {
      ammo = 20, weapon = 21, attire = 22, gadget = 23, accessory = 24, meds = 25, food = 26, drink = 27,
      smokable = 28, tech = 29, misc = 30, message = 31, drawing = 32, map = 33, quest = 34,
   },
   tabFilters = {
      TabAll = nil, TabWeapon = { "weapon", "ammo" }, TabAttire = { "attire", "gadget", "accessory" },
      TabFood = { "food", "drink", "smokable", "meds" }, TabQuest = { "quest" },
      TabMisc = { "tech", "misc", "message", "map", "drawing" },
   },
}, CBaseModule)

function CInventoryBaseUI:init()
   CBaseModule.init(self)

   wndMgr = CEGUI.WindowManager:getSingleton()

   self.contentPane = self.wnd:getChild("Cells")
   self.slots = {}
   self.createdRows = 0
   self.visibleRows = 0
   self.slotWidth = 1/self.rowWidth - 0.005

   self:addRows(self.minRowCount)
   self:clearSlots()

   GUIUtils.widgetSubscribeEventProtected(self.contentPane, "DragDropItemDropped", partial(self.onSlotItemDrop, self))
end

function CInventoryBaseUI:getRecommendedRowAmount(items)
   local count = (math.ceil(#items/self.rowWidth)+1) or self.minRowCount
   if count < self.minRowCount then count = self.minRowCount end
   return count
end

function CInventoryBaseUI:getVisibleSlots()
   local t = {}
   for _,slot in ipairs(self.slots) do
      if slot.container:isVisible() then
         table.insert(t, slot)
      end
   end
   return t
end

function CInventoryBaseUI:adjustRows(items)
   local needed = self:getRecommendedRowAmount(items)
   local delta = needed - self.visibleRows
   if delta > 0 then
      for i=1,delta do
         if self.createdRows > self.visibleRows then
            self:showRow(true)
         else
            self:addRow(true)
         end
      end
   elseif delta < 0 then
      self:showRows(math.abs(delta), false)
   end
   local length = self.visibleRows * self.slotPixelWidth
   self.contentPane:setProperty("ContentArea", string.format("l:0 t:0 r:0 b:%d", length))
end

function CInventoryBaseUI:addRows(count)
   for i=1,count do
      self:addRow()
   end
   self:updateContentPane()
end

function CInventoryBaseUI:addRow(update)
   for i=1,self.rowWidth do
      self:addInventorySlot()
   end
   self.createdRows = self.createdRows + 1
   self.visibleRows = self.visibleRows + 1
   if update then self:updateContentPane() end
end

function CInventoryBaseUI:showRows(count, state)
   for i=1,count do
      self:showRow(state)
   end
end

function CInventoryBaseUI:showRow(state)
   local visibleSlots = self:getVisibleSlots()
   for i=1,self.rowWidth do
      local slotID
      if state then
         slotID = #visibleSlots + i
      else
         slotID = #visibleSlots - (i-1)
      end
      self.slots[slotID].container:setVisible(state)
   end
   if state then
      self.visibleRows = self.visibleRows + 1
   else
      self.visibleRows = self.visibleRows - 1
   end
end

function CInventoryBaseUI:addInventorySlot()
   local slotGlobalID = #self.slots + 1
   local rowID = math.ceil(slotGlobalID/self.rowWidth)
   local slotRowID = slotGlobalID - (rowID-1) * self.rowWidth

   local slot
   if #self.slots == 0 then
      slot = wndMgr:loadLayoutFromFile("inventory_slot.layout")
      self.contentPane:addChild(slot)
      slot:setID(slotGlobalID)
   else
      local exSlot = self.contentPane:getChild("Slot1")
      slot = exSlot:clone(true)
      slot:setName("Slot" .. slotGlobalID)
      self.contentPane:addChild(slot)
   end

   slot:setWidth((CEGUI.UDim(self.slotWidth,0)))
   self.slotPixelWidth = slot:getPixelSize().width
   slot:setPosition(CEGUI.UVector2(CEGUI.UDim(0, self.slotPixelWidth*(slotRowID-1)), CEGUI.UDim(0, self.slotPixelWidth*(rowID-1))))

   local slotTable = {}
   slotTable.container = slot
   slotTable.slot      = slot:getChild("DragContainer")
   slotTable.image     = slot:getChild("DragContainer/ItemImage")
   slotTable.equipped  = slot:getChild("DragContainer/ItemImage/Equipped")
   slotTable.selected  = slot:getChild("DragContainer/ItemImage/Selected")
   slotTable.counter   = slot:getChild("DragContainer/ItemImage/Counter")
   slotTable.quality   = slot:getChild("DragContainer/ItemImage/Quality")

   slotTable.slot:setUserString("inventoryName", self.wnd:getName())
   slotTable.slot:setUserString("slotID", tostring(slotGlobalID))
   self:subscribeInventorySlot(slotTable.slot)

   table.insert(self.slots, slotTable)
end

function CInventoryBaseUI:subscribeInventorySlot(slotWnd)
   GUIUtils.widgetSubscribeEventProtected(slotWnd, "DragStarted",         partial(self.onSlotDragStarted, self))
   GUIUtils.widgetSubscribeEventProtected(slotWnd, "MouseClick",          partial(self.onSlotClick, self))
   GUIUtils.widgetSubscribeEventProtected(slotWnd, "MouseDoubleClick",    partial(self.onSlotDoubleClick, self))
   GUIUtils.widgetSubscribeEventProtected(slotWnd, "MouseMove",           partial(self.onSlotMouseMove, self))
   GUIUtils.widgetSubscribeEventProtected(slotWnd, "MouseEntersArea",     partial(self.onSlotMouseHover, self))
   GUIUtils.widgetSubscribeEventProtected(slotWnd, "MouseLeavesArea",     partial(self.onSlotMouseLeave, self))
   GUIUtils.widgetSubscribeEventProtected(slotWnd, "DragDropItemDropped", partial(self.onSlotItemDrop, self))
end


function CInventoryBaseUI:clearSlots()
   for _,slotTable in ipairs(self.slots) do
      self:clearSlot(slotTable)
   end
end
function CInventoryBaseUI:clearSlot(slotTable)
   slotTable.slot:setUserString ("itemID", "")
   slotTable.slot:setProperty   ("DraggingEnabled", "false")
   slotTable.image:setProperty  ("Image", "")
   slotTable.quality:setProperty("Image", "")
   slotTable.equipped:setProperty("Image", "")
   slotTable.selected:setVisible(false)
   slotTable.counter:setText    ("")
   slotTable.item = nil
end

function CInventoryBaseUI:updateContentPane()
   self.slotPixelWidth = self.slots[1].container:getPixelSize().width

   for ID, slotTable in ipairs(self.slots) do
      local rowID = math.ceil(ID/self.rowWidth)
      local slotRowID = ID - (rowID-1) * self.rowWidth
      slotTable.container:setPosition(CEGUI.UVector2(CEGUI.UDim(0, self.slotPixelWidth*(slotRowID-1)), CEGUI.UDim(0, self.slotPixelWidth*(rowID-1))))
   end
end

function CInventoryBaseUI:onShow()
   CBaseModule.onShow(self)

   self:setup()
end

function CInventoryBaseUI:onHide()
   CBaseModule.onHide(self)

   gameplayUI.popupMenuUI:show(false)
end

function CInventoryBaseUI:resetTabs()
   self.currentTab = "TabAll"
   for tabName in pairs(self.tabFilters) do
      self.wnd:getChild(tabName):setProperty("Disabled", "false")
   end
   self.wnd:getChild("TabAll"):setProperty("Disabled", "true")
end

function CInventoryBaseUI:getItemOrder(item)
   if item == getMC().lastWeapon then
      return self.equippedOrderTable.last_weapon
   elseif item:isEquipped() then
      if item:isWeapon() then
         return item:getEquippedSlot()
      else
         return self.equippedOrderTable[item:getInvCategory()]
      end
   else
      return self.itemsOrderTable[item:getInvCategory()]
   end
end

function CInventoryBaseUI:sort(a, b)
   local orderA = self:getItemOrder(a) or self.itemsOrderTable.misc
   local orderB = self:getItemOrder(b) or self.itemsOrderTable.misc
   if orderA == orderB then
     orderA = a:getItemName()
     orderB = b:getItemName()
      if orderA == orderB then
         orderA = a:getQuality()
         orderB = b:getQuality()
         return orderA > orderB
      end
   end
   return orderA < orderB
end

function CInventoryBaseUI:setup()
end

function CInventoryBaseUI:moveItem(item, count)
end


--CALLBACKS
function CInventoryBaseUI:onTabClick(args)
   local we_args = args:toWindowEventArgs()
   local name = we_args.window:getName()
   self.wnd:getChild(self.currentTab):setProperty("Disabled", "false")
   self.currentTab = name
   we_args.window:setProperty("Disabled", "true")
   self.contentPane:setProperty("VertScrollPosition", "0")
   self:setup()
end

function CInventoryBaseUI:onSlotMouseMove(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local slotID = tonumber(click_args.window:getUserString("slotID"))
   local item = self.slots[slotID].item
   if not item then
      gameplayUI.itemInfoUI:show(false)
      return false
   end

   gameplayUI.itemInfoUI:setPosition(click_args.position)
end

function CInventoryBaseUI:onSlotMouseHover(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local slotID = tonumber(click_args.window:getUserString("slotID"))
   self.slots[slotID].selected:setVisible(true)
   local item = self.slots[slotID].item
   if not item then return false end

   gameplayUI.itemInfoUI:show(true, item)
   self:onSlotMouseMove(args)
   return true
end

function CInventoryBaseUI:onSlotMouseLeave(args)
   if not CEGUI then return end
   local click_args = CEGUI.toMouseEventArgs(args)
   local slotID = tonumber(click_args.window:getUserString("slotID"))
   self.slots[slotID].selected:setVisible(false)
   gameplayUI.itemInfoUI:show(false)
   return true
end

function CInventoryBaseUI:onSlotDragStarted(args)
   gameplayUI.itemInfoUI:show(false)
end

function CInventoryBaseUI:onSlotClick(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local slotID = tonumber(click_args.window:getUserString("slotID"))
   local sourceInventoryName = click_args.window:getUserString("inventoryName")
   local item = self.slots[slotID].item
   if item then return true end
end

function CInventoryBaseUI:onSlotDoubleClick(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local slotID = tonumber(click_args.window:getUserString("slotID"))
   local item = self.slots[slotID].item
   if item then return true end
end

function CInventoryBaseUI:onSlotItemDrop(args)
   local dd_args = CEGUI.toDragDropEventArgs(args)
   local sourceInventoryName = dd_args.dragDropItem:getUserString("inventoryName")
   if sourceInventoryName == "inventoryPlayer" and self.wnd:getName() ~= sourceInventoryName then
      local item = GUIUtils.getWindowItem(dd_args.dragDropItem, getMC().inventory)
      if item and item:isQuestItem() then
         gameplayUI:showInfoTextEx("I might need that for later.", "minor", "")
         return false
      end
   end
   if sourceInventoryName and sourceInventoryName ~= self.wnd:getName() then return true end
end


return CInventoryBaseUI
