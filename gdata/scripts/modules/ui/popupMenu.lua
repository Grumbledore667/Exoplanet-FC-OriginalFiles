local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local ItemsData = (require "itemsData")
local ItemsDataRecipes = require "ItemsDataRecipes"
local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CPopupMenuUI : CBaseModule
local CPopupMenuUI = oo.class({
   layoutName = nil,
   windowName = nil,
}, CBaseModule)

--Methods
function CPopupMenuUI:init()
   self.slots = {}

   self.wnd = CEGUI.toPopupMenu(gameplayUI.wndGameplay:createChild("TaharezLook/PopupMenu", "PopupMenu"))
   self.wnd:setProperty("ItemSpacing",       "2"    )
   self.wnd:setProperty("ClippedByParent",   "false")
   self.wnd:setProperty("AutoResizeEnabled", "true" )
   self.wnd:setProperty("AlwaysOnTop",       "true" )

   CBaseModule.init(self)

   GUIUtils.widgetSubscribeEventProtected(self.wnd, "Deactivated", partial(self.onDeactivated, self))
end

function CPopupMenuUI:addPopupMenuItem()
   local item = CEGUI.toMenuItem(self.wnd:createChild("TaharezLook/MenuItem", "Item" .. tostring(#self.slots)))

   item:setProperty("DestroyedByParent", "false")
   item:setProperty("Font", "venus rising rg-5")
   GUIUtils.widgetSubscribeEventProtected(item, "MouseButtonUp", partial(self.onPopupMenuClick, self))

   self.slots[#self.slots+1] = item
end

function CPopupMenuUI:setup(list)
   self.wnd:resetList()

   local itemIndex = 0

   for i=1,#list do
      if itemIndex == #self.slots then
         self:addPopupMenuItem()
      end

      self.slots[itemIndex+1]:setText(list[i])
      self.wnd:addItem(self.slots[itemIndex+1])

      itemIndex = itemIndex + 1
   end

   if itemIndex > 0 then
      self:show(true)
      self.wnd:activate()
   else
      self:show(false)
   end
end

function CPopupMenuUI:OnPopupInventoryOpen(item)
   local player = getMC()
   local itemName = item:getItemName()
   log("OnPopupInventoryOpen: " .. itemName)

   self.item = item
   local popupMenuOptions = {}

   if item:isEquipable() and not player:getState("resting") then
      if player:getInventory():getSlotItem(item:getAttireType()) == item
         or player:getWeaponSlotItem() == item then
         table.insert(popupMenuOptions, "unequip")
      else
         table.insert(popupMenuOptions, "equip")
      end
   end

   if ItemsDataRecipes.isItemDecomposable(itemName) then
      table.insert(popupMenuOptions, "decompose")
   end

   if ItemsData.isItemCookable(itemName) and player:getState("resting") then
      table.insert(popupMenuOptions, "cook")
   end

   if item:isConsumable() or ItemsData.isItemPermaBuff(item.name) or ItemsData.isItemUsable(item.name) then
      table.insert(popupMenuOptions, "use")
   end

   if item.isInstallable and item:isInstallable() and not player:getState("resting") then
      table.insert(popupMenuOptions, "install")
   end

   if item:isItemContainer() then
      if item:isLocked() then
         table.insert(popupMenuOptions, "try code")
         table.insert(popupMenuOptions, "break lock")
      elseif not item:isEmpty() then
         table.insert(popupMenuOptions, "open")
      end
   end

   if item:isMessage() then
      table.insert(popupMenuOptions, "read")
   end

   if item:isDrawing() or item:isMap() then
      table.insert(popupMenuOptions, "view")
   end

   self:setup(popupMenuOptions)
end

function CPopupMenuUI:OnPopupInventoryClick(text)
   log("OnPopupInventoryClick: " .. text)
   local player = getMC()
   if player:getState("blockItemUse") then return end

   local option = text

   if option == "equip" then
      player:equipItem(self.item)
   elseif option == "unequip" then
      player:unequipItem(self.item)
   elseif option == "decompose" then
      player:getInventory():decomposeItem(self.item:getId())
   elseif option == "cook" then
      if self.item:getCount() > 1 then
         gameplayUI.itemDelimiterUI:setup(self.item, "cook")
         gameplayUI.itemDelimiterUI:show(true)
      else
         player:setState("cooking", true)
      end
      player.cookItem = self.item
   elseif option == "cook_multi" then
      player:setState("cooking", true)
   elseif option == "use" then
      player:useItem(self.item)
   elseif option == "install" then
      player:interactObject("drop", self.item, nil)
   elseif option == "read" then
      player:useItem(self.item)
   elseif option == "try code" or option == "open" then
      self.item:OnActivate()
   elseif option == "break lock" then
      self.item:OnAltActivate()
   elseif option == "view" then
      player:useItem(self.item)
   elseif option == "clear slot" then
      gameplayUI.hotbarUI:clearHotbarSlot(self.item)
   elseif option == "teleport" then
      player:getPose():setPos(self.obj:getPose():getPos())
      gameplayUI.mapUI:show(false)
   elseif option == "edit inventory" then
      player:interactObject("activate", self.obj, nil)
      gameplayUI.mapUI:show(false)
   end
end


--Callbacks
function CPopupMenuUI:onDeactivated(args)
   if not CEGUI then return end
   self:show(false)
end

function CPopupMenuUI:onPopupMenuClick(args)
   local me_args = CEGUI.toMouseEventArgs(args)

   if me_args.button == CEGUI.LeftButton then
      self:OnPopupInventoryClick(me_args.window:getText())
      self.wnd:setVisible(false)
   end
end

return CPopupMenuUI
