local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial
local GUIUtils = require "ui.utils"

local CInventoryBaseUI = require "ui.inventoryBaseUI"
local CInventoryContainerUI = require "ui.inventoryContainerUI"

---@class CInventoryTurretUI : CInventoryContainerUI
local CInventoryTurretUI = oo.class({
   layoutName = "inventoryTurret.layout",
   windowName = "inventoryTurret",
   minRowCount = 5,
   rowWidth = 5,
   currentTab = nil,
   initPlayerControlled = true,
}, CInventoryContainerUI)

function CInventoryTurretUI:init()
   CInventoryBaseUI.init(self)

   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("TakeAll"), "Clicked", partial(self.onTakeAll, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("Deinstall"), "Clicked", partial(self.onDeinstall, self))
end

--Copy of container method without the debug feature
function CInventoryTurretUI:onShow()
   CInventoryBaseUI.onShow(self)

   if not self.wasMoved then
      GUIUtils.positionWindowRelativeTo(self.wnd, gameplayUI.inventoryPlayer.wnd, "left", getScreenSize().y * 0.02)
      self.wnd:setYPosition(gameplayUI.inventoryPlayer.wnd:getYPosition())
      self.wasMoved = false --set pos triggers the Moved event so reset it
   end

   local closeButton = self.wnd:getChild("Close")
   closeButton:setText(string.format("(%s) %s", getButtonCurrentKeyName("ACTIVATE"), GUIUtils.getWindowTranslationText(closeButton)))
   local takeButton = self.wnd:getChild("TakeAll")
   takeButton:setText(string.format("(%s) %s", getButtonCurrentKeyName("HOTBARQ"), GUIUtils.getWindowTranslationText(takeButton)))

   local container = getMC().exchangeTarget
   if container then
      self.onInventoryChangeCallback = container:getInventory():subscribeOnChange(partial(self.setup, self))
   end
end

function CInventoryTurretUI:onDeinstall()
   local player = getMC()
   local turret = player.exchangeTarget
   self:show(false)
   local item = turret:getAsItem()
   player:getInventory():addItemObj(item)
   gameplayUI:showInventoryPickInfo(item:getLabel() .. " was added to Inventory")
end


return CInventoryTurretUI
