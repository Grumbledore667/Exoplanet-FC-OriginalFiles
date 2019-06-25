local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial
local tablex = require "pl.tablex"

local ItemsData = (require "itemsData")
local ItemsDataRecipes = require "ItemsDataRecipes"
local GUIUtils = require "ui.utils"

local guiContext

local CBaseModule = require "ui.baseModule"

---@class CPopupMenuUI : CBaseModule
local CPopupMenuUI = oo.class({
   layoutName = nil,
   windowName = nil,
}, CBaseModule)

--Methods
function CPopupMenuUI:init()
   guiContext = CEGUI.System:getSingleton():getDefaultGUIContext()

   self.wnd = CEGUI.toPopupMenu(gameplayUI.wndGameplay:createChild("TaharezLook/PopupMenu", "PopupMenu"))
   self.wnd:setProperty("ItemSpacing", "2")
   self.wnd:setProperty("ClippedByParent", "false")
   self.wnd:setProperty("AutoResizeEnabled", "true")
   self.wnd:setProperty("AlwaysOnTop", "true")

   CBaseModule.init(self)

   GUIUtils.widgetSubscribeEventProtected(self.wnd, "Deactivated", partial(self.onDeactivated, self))
end

function CPopupMenuUI:setup(callbacks)
   local empty = true
   self.wnd:resetList()

   for optionText, callback in tablex.sort(callbacks) do
      local item = CEGUI.toMenuItem(self.wnd:createChild("TaharezLook/MenuItem", ""))
      item:setProperty("Font", "venus rising rg-5")
      item:setText(optionText)
      GUIUtils.widgetSubscribeEventProtected(item, "MouseButtonUp", partial(self.onPopupMenuClick, self))
      self.wnd:addItem(item)
      empty = false
   end

   if empty then return end

   self.callbacks = callbacks

   local cursorPos = guiContext:getMouseCursor():getPosition()
   local pos = CEGUI.UVector2(CEGUI.UDim(0, cursorPos.x), CEGUI.UDim(0, cursorPos.y))
   gameplayUI:retainPositionInsideDisplay(pos, self.wnd)

   self:show(true)
   self.wnd:activate()
end

function CPopupMenuUI:setupItemPopupMenu(item)
   local player = getMC()
   local itemName = item:getItemName()

   self.item = item
   local popupMenuOptions = {}

   if item:isEquipable() and not player:getState("resting") then
      if item:isEquipped() then
         popupMenuOptions["unequip"] = {func = player.unequipItem, args = {player, self.item}}
      else
         popupMenuOptions["equip"] = {func = player.equipItem, args = {player, self.item}}
      end
   end

   if ItemsDataRecipes.isItemDecomposable(itemName) then
      popupMenuOptions["decompose"] = {func = player.inventory.decomposeItem, args = {player.inventory, self.item}}
   end

   if ItemsData.isItemCookable(itemName) and player:getState("resting") then
      popupMenuOptions["cook"] = {func = function()
         if self.item:getCount() > 1 then
            gameplayUI.itemDelimiterUI:setup(self.item, "cook")
            gameplayUI.itemDelimiterUI:show(true)
         else
            player:setState("cooking", true)
         end
         player.cookItem = self.item
      end}
   end

   if item:isConsumable() or ItemsData.isItemPermaBuff(item.name) or ItemsData.isItemUsable(item.name) then
      popupMenuOptions["use"] = {func = player.useItem, args = {player, self.item}}
   end

   if item:isMessage() then
      popupMenuOptions["read"] = {func = player.useItem, args = {player, self.item}}
   end

   if item:isDrawing() or item:isMap() then
      popupMenuOptions["view"] = {func = player.useItem, args = {player, self.item}}
   end

   if item.isInstallable and item:isInstallable() and not player:getState("resting") then
      popupMenuOptions["install"] = {func = player.interactObject, args = {player, "drop", self.item}}
   end

   if item:isItemContainer() then
      if item:isLocked() then
         popupMenuOptions["try code"] = {func = self.item.OnActivate, args = {self.item}}
         popupMenuOptions["break lock"] = {func = self.item.OnAltActivate, args = {self.item}}
      elseif not item:isEmpty() then
         popupMenuOptions["open"] = {func = self.item.OnActivate, args = {self.item}}
      end
   end

   self:setup(popupMenuOptions)
end

--Callbacks
function CPopupMenuUI:onDeactivated(args)
   if not CEGUI then return end
   self:show(false)
end

function CPopupMenuUI:onPopupMenuClick(args)
   local me_args = CEGUI.toMouseEventArgs(args)

   if me_args.button == CEGUI.LeftButton then
      local optionText = me_args.window:getText()
      local func = self.callbacks[optionText].func
      local cbArgs = self.callbacks[optionText].args or {}

      func(unpack(cbArgs))

      self:show(false)
      self.callbacks = nil
      self.wnd:resetList()
   end
end

return CPopupMenuUI
