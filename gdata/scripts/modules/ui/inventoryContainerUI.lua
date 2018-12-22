local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial
local tablex = require "pl.tablex"
local GUIUtils = require "ui.utils"

local CInventoryBaseUI = require "ui.inventoryBaseUI"

---@class CInventoryContainerUI : CInventoryBaseUI
local CInventoryContainerUI = oo.class({
   layoutName = "inventoryContainer.layout",
   windowName = "inventoryContainer",
   minRowCount = 5,
   rowWidth = 5,
   currentTab = nil,
   initPlayerControlled = true,
}, CInventoryBaseUI)

function CInventoryContainerUI:init()
   CInventoryBaseUI.init(self)

   GUIUtils.widgetSubscribeEventProtected(self.wnd, "Moved", function()
      self.wasMoved = true
   end, false)
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("Close"), "Clicked", partial(self.onClose, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("TakeAll"), "Clicked", partial(self.onTakeAll, self))
   --#DEBUG
   local function onUpdateItemsParam(args)
      local obj = getMC().exchangeTarget
      local loot = tablex.pairmap(function(k,v) return k..','..v end, obj:getLootTable())
      updateNamedObjParam(obj:getName(), "items", table.concat(loot, ','))
      gameplayUI:showInfoTextEx("Updated", "minor", "")
   end
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("UpdateItemsParam"), "Clicked", onUpdateItemsParam)
end

function CInventoryContainerUI:onShow()
   CInventoryBaseUI.onShow(self)

   gameplayUI.journalUI:show(false)
   gameplayUI.mapUI:show(false)

   if not self.wasMoved then
      GUIUtils.positionWindowRelativeTo(self.wnd, gameplayUI.inventoryPlayer.wnd, "left", getScreenSize().y * 0.02)
      self.wnd:setYPosition(gameplayUI.inventoryPlayer.wnd:getYPosition())
      self.wasMoved = false --set pos triggers the Moved event so reset it
   end

   local closeButton = self.wnd:getChild("Close")
   closeButton:setText(string.format("(%s) %s", getButtonCurrentKeyName("ACTIVATE"), GUIUtils.getWindowTranslationText(closeButton)))
   local takeButton = self.wnd:getChild("TakeAll")
   takeButton:setText(string.format("(%s) %s", getButtonCurrentKeyName("HOTBARQ"), GUIUtils.getWindowTranslationText(takeButton)))

   self.wnd:getChild("UpdateItemsParam"):setVisible(isEditor())

   local container = getMC().exchangeTarget
   if container then
      self.onInventoryChangeCallback = container:getInventory():subscribeOnChange(partial(self.setup, self))
   end
end

function CInventoryContainerUI:onHide()
   CInventoryBaseUI.onHide(self)

   local container = getMC().exchangeTarget
   if container then
      container:getInventory():unsubscribeOnChange(self.onInventoryChangeCallback)
      getMC():interactObject("deactivate", container, nil)
   end
   gameplayUI.itemDelimiterUI:show(false)

   if not gameplayUI.gameplayMenuUI:isVisible() then
      gameplayUI.inventoryPlayer:show(false)
   end
end

function CInventoryContainerUI:setupTitle(title)
   local font = "[font='decor-8']"
   self.wnd:setText(font .. title)
end

function CInventoryContainerUI:setup()
   local obj = getMC().exchangeTarget
   local containerInventory = getMC():getTargetInventory()
   if not containerInventory then return end
   local items = containerInventory:getItems()

   self:adjustRows(items)

   self:clearSlots()

   self:updateContentPane()

   local slotIndex = 1
   for _,item in pairs(items) do
      if slotIndex > #self.slots then
         break
      end
      self.slots[slotIndex].slot:setProperty   ("DraggingEnabled", "true")
      self.slots[slotIndex].image:setProperty  ("Image", "gameplay/" .. item.icon)
      self.slots[slotIndex].slot:setUserString ("itemID", tostring(item.id))
      self.slots[slotIndex].quality:setProperty("Image", "gameplay/QualityMark" .. item:getQuality())
      self.slots[slotIndex].item = item
      if item:getCount() > 1 then
         self.slots[slotIndex].counter:setText(tostring(item:getCount()))
      else
         self.slots[slotIndex].counter:setText("")
      end

      slotIndex = slotIndex + 1
   end
   self:setupTitle(obj:getLabel())
end

function CInventoryContainerUI:moveItem(item, count)
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
   player.exchangeTarget:getInventory():giveItemTo(item, player:getInventory(), count)
   if count > 1 then
      gameplayUI:showInventoryPickInfo(count .. " " .. item:getLabel() .. " were added to Inventory")
   else
      gameplayUI:showInventoryPickInfo(item:getLabel() .. " was added to Inventory")
   end
end


--CALLBACKS
function CInventoryContainerUI:onTakeAll(args)
   local player = getMC()
   local containerInventory = player:getTargetInventory()
   local itemsList = tablex.copy(containerInventory:getItems())
   for _, item in ipairs(itemsList) do
      local count = item:getCount()
      containerInventory:giveItemTo(item, player:getInventory(), count)
      if count > 1 then
         gameplayUI:showInfoTextEx(count .. " " .. item:getLabel() .. " were added to Inventory", "minor", "")
      else
         gameplayUI:showInfoTextEx(item:getLabel() .. " was added to Inventory", "minor", "")
      end
   end
   if next(itemsList) then
      getMC():playSound("inventory_pick.wav")
   end
   self:show(false)
end

function CInventoryContainerUI:onSlotClick(args)
   if not CInventoryBaseUI.onSlotClick(self, args) then return false end

   local click_args = CEGUI.toMouseEventArgs(args)
   local slotID = tonumber(click_args.window:getUserString("slotID"))
   local item = self.slots[slotID].item

   if click_args.button == CEGUI.LeftButton then
      self:moveItem(item)
      self:onSlotMouseLeave(args)
      self:onSlotMouseHover(args)
   end
end

function CInventoryContainerUI:onSlotItemDrop(args)
   if not CInventoryBaseUI.onSlotItemDrop(self, args) then return false end
   local dd_args = CEGUI.toDragDropEventArgs(args)
   local item = getMC():getInventory():getItemById(tonumber(dd_args.dragDropItem:getUserString("itemID")))
   local sourceInventoryName = dd_args.dragDropItem:getUserString("inventoryName")
   if sourceInventoryName == "CharacterWindow" or sourceInventoryName == "Hotbar" then
      gameplayUI.inventoryPlayer:moveItem(item)
   else
      gameplayUI[sourceInventoryName]:moveItem(item)
   end
end

return CInventoryContainerUI
