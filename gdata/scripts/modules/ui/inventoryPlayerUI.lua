local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial
local tablex = require "pl.tablex"
local GUIUtils = require "ui.utils"

local ItemsData = require "itemsData"

local CInventoryBaseUI = require "ui.inventoryBaseUI"

---@class CInventoryPlayerUI : CInventoryBaseUI
local CInventoryPlayerUI = oo.class({
   layoutName = "inventoryPlayer.layout",
   windowName = "inventoryPlayer",
   minRowCount = 7,
   rowWidth = 5,
   currentTab = "TabAll",
   initPlayerControlled = true,
}, CInventoryBaseUI)

function CInventoryPlayerUI:init()
   CInventoryBaseUI.init(self)

   --Create additional rows beforehand so the player doesn't lag during the first inventory use with lots of items
   self:addRows(30)
   self:showRows(30, false)

   for tabName in pairs(self.tabFilters) do
      GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild(tabName), "Clicked", partial(self.onTabClick, self))
   end
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("TabAll"), "Clicked", partial(self.onTabClick, self))
end

function CInventoryPlayerUI:onShow()
   CInventoryBaseUI.onShow(self)

   local pInventory = getMC():getInventory()
   self.onInventoryChangeCallback = pInventory:subscribeOnChange(partial(self.setup, self))
end

function CInventoryPlayerUI:onHide()
   CInventoryBaseUI.onHide(self)

   local pInventory = getMC():getInventory()
   pInventory:unsubscribeOnChange(self.onInventoryChangeCallback)
   gameplayUI.inventoryContainer:show(false)
   gameplayUI.inventoryTurret:show(false)
   gameplayUI.popupMenuUI:show(false)
   gameplayUI.characterUI:show(false)
   gameplayUI.gameplayMenuUI:onHideTab("Inventory")
end

function CInventoryPlayerUI:setup()
   local player = getMC()
   local inventory = player:getInventory()
   local items = inventory.items

   local filterTable = self.tabFilters[self.currentTab]

   self:adjustRows(items)

   self:clearSlots()

   self:updateContentPane()

   if not items then return end

   local sortedIterator = tablex.sortv(items, partial(self.sort, self))
   local index = 0
   for _,item in sortedIterator do
      if not filterTable or tablex.search(filterTable, item:getInvCategory()) then
         index = index + 1
         self.slots[index].slot:setProperty   ("DraggingEnabled", "true")
         self.slots[index].slot:setUserString ("itemID", tostring(item:getId()))
         self.slots[index].image:setProperty  ("Image", "gameplay/" .. item.icon)
         self.slots[index].quality:setProperty("Image", "gameplay/QualityMark" .. item:getQuality())
         self.slots[index].item = item
         if item:getCount() > 1 then
            self.slots[index].counter:setText(tostring(item:getCount()))
         else
            self.slots[index].counter:setText("")
         end

         if player.lastWeapon == item then
            self.slots[index].equipped:setProperty("Image", "gameplay/EquippedWeapon")
         elseif item:isEquipped() then
            self.slots[index].equipped:setProperty("Image", "gameplay/Equipped")
         end
      end
   end

   -- money show
   self.wnd:getChild("ShardsCount"):setText(inventory:getItemCountByName("antigravium_shards.itm"))
   -- alive items count
   self.wnd:getChild("BugAliveCount"):setText(inventory:getItemCountByLimitCategory("alive") .. "/" .. inventory:getItemLimit("alive"))
end

function CInventoryPlayerUI:moveItem(item, count)
   local player = getMC()
   if gameplayUI.shiftPressed then
      count = item:getCount()
   elseif not count and item:getCount() > 1 then
      gameplayUI.itemDelimiterUI:setup(item, function()
         self:moveItem(item, math.min(item:getCount(), gameplayUI.itemDelimiterUI:getCount()))
      end)
      gameplayUI.itemDelimiterUI:show(true)
      return
   end
   count = count or 1
   player:getInventory():giveItemTo(item, player.exchangeTarget:getInventory(), count)
end


--CALLBACKS
function CInventoryPlayerUI:onSlotClick(args)
   if not CInventoryBaseUI.onSlotClick(self, args) then return false end

   local click_args = CEGUI.toMouseEventArgs(args)
   local slotID = tonumber(click_args.window:getUserString("slotID"))
   local item = self.slots[slotID].item

   if click_args.button == CEGUI.RightButton then
      if item then
         gameplayUI.popupMenuUI:OnPopupInventoryOpen(item)
         local popupPos = CEGUI.UVector2(CEGUI.UDim(0,click_args.position.x), CEGUI.UDim(0,click_args.position.y))
         gameplayUI.popupMenuUI.wnd:setPosition(popupPos)
      end
   elseif click_args.button == CEGUI.LeftButton then
      if gameplayUI.inventoryContainer:isVisible() or gameplayUI.inventoryTurret:isVisible() then
         if item and item:isQuestItem() then
            gameplayUI:showInfoTextEx("I might need that for later.", "minor", "")
            return false
         end
         self:moveItem(item)
         self:onSlotMouseLeave(args)
         self:onSlotMouseHover(args)
      end
   end
end

function CInventoryPlayerUI:onSlotDoubleClick(args)
   if not CInventoryBaseUI.onSlotDoubleClick(self, args) then return false end

   local click_args = CEGUI.toMouseEventArgs(args)
   local slotID = tonumber(click_args.window:getUserString("slotID"))
   local item = self.slots[slotID].item

   if click_args.button == CEGUI.LeftButton then
      if gameplayUI.inventoryContainer:isVisible() or gameplayUI.inventoryTurret:isVisible() then return end
      getMC():useItem(item)
      self:onSlotMouseLeave(args)
      self:onSlotMouseHover(args)
   end
end

function CInventoryPlayerUI:onSlotItemDrop(args)
   if not CInventoryBaseUI.onSlotItemDrop(self, args) then return false end
   local dd_args = CEGUI.toDragDropEventArgs(args)
   local player = getMC()
   local pInventory = player:getInventory()
   local sourceInventoryName = dd_args.dragDropItem:getUserString("inventoryName")
   if sourceInventoryName == "Hotbar" then
      local slotID = gameplayUI.hotbarUI:getHotbarWndIndex(dd_args.dragDropItem)
      gameplayUI.hotbarUI:clearHotbarSlot(slotID)
   elseif sourceInventoryName == "CharacterWindow" then
      local slotName = dd_args.dragDropItem:getParent():getName()
      local slotID = slotName
      if slotName:find("slot") then
         slotID = slotID:gsub("slot", "")
         slotID = tonumber(slotID)
      end
      local item = pInventory:getSlotItem(slotID)
      if not item then return end

      if slotID == 1 then
         player:unequipItem(item)
      elseif item and item:isAttire() then
         pInventory:unequipSlot(slotID)
      else
         pInventory:removeItemFromFastAccess(slotID)
         pInventory:unequipSlot(slotID)
      end
   elseif sourceInventoryName ~= "inventoryPlayer" then
      local item = player:getTargetInventory():getItemById(tonumber(dd_args.dragDropItem:getUserString("itemID")))
      gameplayUI[sourceInventoryName]:moveItem(item)
   end
end

function CInventoryPlayerUI:onSlotMouseHover(args)
   if CInventoryBaseUI.onSlotMouseHover(self, args) then
      local click_args = CEGUI.toMouseEventArgs(args)
      local slotID = tonumber(click_args.window:getUserString("slotID"))
      local item = self.slots[slotID].item
      gameplayUI.hoveredItem = item
   end
end

function CInventoryPlayerUI:onSlotMouseLeave(args)
   CInventoryBaseUI.onSlotMouseLeave(self, args)
   gameplayUI.hoveredItem = nil
end

return CInventoryPlayerUI
