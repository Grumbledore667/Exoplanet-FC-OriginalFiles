local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local tablex = require "pl.tablex"

local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CGameplayMenuUI : CBaseModule
local CGameplayMenuUI = oo.class({
   layoutName = "gameplayMenu.layout",
   initAsInteractive = true,
   initPlayerControlled = true,
}, CBaseModule)


function CGameplayMenuUI:init()
   CBaseModule.init(self)

   self.currentTab = "Inventory"
   self.prevTab = nil
   self.currentTabID = 1

   self.tabOrder = {
      "Inventory",
      "Crafting",
      "Journal",
      "Map",
   }

   self.tabKeys = {
      Inventory = {"INVENTORY", "INVENTORYALT"},
      Crafting = {"CRAFT"},
      Journal = {"JOURNAL"},
      Map = {"MAP"},
   }

   self.tabs = {
      Inventory = {gameplayUI.inventoryPlayer, gameplayUI.characterUI},
      Crafting = {gameplayUI.craftUI},
      Journal = {gameplayUI.journalUI},
      Map = {gameplayUI.mapUI},
   }

   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("InventoryButton"), "Clicked", partial(self.onTabClicked, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("CraftingButton"), "Clicked", partial(self.onTabClicked, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("JournalButton"), "Clicked", partial(self.onTabClicked, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("MapButton"), "Clicked", partial(self.onTabClicked, self))
end

function CGameplayMenuUI:updateTabButtonsNames()
   for tabName, buttonNames in pairs(self.tabKeys) do
      local button = self.wnd:getChild(tabName .. "Button")
      local text = GUIUtils.getWindowTranslationText(button)
      local keyNames = tablex.map(getButtonCurrentKeyName, buttonNames)
      text = string.format("%s %s(%s", text, "[font='DejaVuSans-10']", keyNames[1])
      for i=2, #keyNames do
         text = string.format("%s or %s", text, keyNames[i])
      end
      text = string.format("%s)", text)
      button:setText(text)
   end
end

function CGameplayMenuUI:onShow()
   CBaseModule.onShow(self)

   self:updateTabButtonsNames()
end

function CGameplayMenuUI:onHide()
   CBaseModule.onHide(self)

   for _, modules in pairs(self.tabs) do
      for _, module in pairs(modules) do
         module:show(false)
      end
   end
end

function CGameplayMenuUI:toggleTab(tabName)
   local state = true

   --If the menu is visible or any of desired modules are already visible - close them
   if self:isVisible() then
      for _, module in pairs(self.tabs[tabName]) do
         if module:isVisible() then
            state = false
         end
      end
   end

   if state then
      if self:showTab(tabName) then
         self:show(true)
      end
   else
      self:show(false)
   end
end

function CGameplayMenuUI:showTab(tabName)
   --Show first - to avoid triggering tryHide inside onHide of the modules
   for _, module in pairs(self.tabs[tabName]) do
      --Make sure all modules return bool
      if not module:show(true) then
         --Close any linked modules that got opened before the fail
         for _, module in pairs(self.tabs[tabName]) do
            module:show(false)
         end
         return false
      end
   end
   if tabName == "Inventory" then
      gameplayUI.journalUI:show(false)
      gameplayUI.mapUI:show(false)
   elseif tabName == "Crafting" then
      gameplayUI.journalUI:show(false)
      gameplayUI.mapUI:show(false)
      gameplayUI.inventoryContainer:show(false)
      gameplayUI.inventoryTurret:show(false)
   elseif tabName == "Journal" then
      gameplayUI.craftUI:show(false)
      gameplayUI.mapUI:show(false)
      gameplayUI.inventoryContainer:show(false)
      gameplayUI.inventoryTurret:show(false)
   elseif tabName == "Map" then
      gameplayUI.inventoryPlayer:show(false) --Auto closes container inventory and character UI
      gameplayUI.craftUI:show(false)
      gameplayUI.journalUI:show(false)
   end

   self.prevTab = self.currentTab
   self.wnd:getChild(self.prevTab .. "Button"):setProperty("Disabled", "false")

   self.currentTab = tabName
   self.currentTabID = tablex.find(self.tabOrder, tabName)
   self.wnd:getChild(tabName .. "Button"):setProperty("Disabled", "true")
   return true
end

--Called in modules' onHide
function CGameplayMenuUI:onHideTab(tabName)
   self.wnd:getChild(tabName .. "Button"):setProperty("Disabled", "false")

   for _, modules in pairs(self.tabs) do
      for _, module in pairs(modules) do
         --If any modules are still visible - do not close the menu
         if module:isVisible() then
            --If it was the currentTab that got closed - jump back to the previous one
            if self.currentTab == tabName then
               self.currentTab = self.prevTab
               self.currentTabID = tablex.find(self.tabOrder, self.prevTab)
               self.wnd:getChild(self.prevTab .. "Button"):setProperty("Disabled", "true")
            end
            return
         end
      end
   end
   --Hide if no modules are visible
   self:show(false)
end

function CGameplayMenuUI:onTabClicked(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local tabName = string.gsub(click_args.window:getName(), "Button", "")
   self:showTab(tabName)
end

function CGameplayMenuUI:scrollTabs(direction)
   if direction then
      self.currentTabID = self.currentTabID + 1
   else
      self.currentTabID = self.currentTabID - 1
   end

   if self.currentTabID < 1 then
      self.currentTabID = #self.tabOrder
   elseif self.currentTabID > #self.tabOrder then
      self.currentTabID = 1
   end
   self:showTab(self.tabOrder[self.currentTabID])
end

return CGameplayMenuUI