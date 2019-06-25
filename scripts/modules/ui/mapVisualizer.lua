local oo = require "loop.simple"

local wndMgr
local f = require "fun"
local partial = f.partial

local tablex = require "pl.tablex"
local GUIUtils = require "ui.utils"
local ClassManager = require "global.classManager"
local ItemsData = require "itemsData"

local CBaseModule = require "ui.baseModule"

---@class CMapVisualizerUI : CBaseModule
local CMapVisualizerUI = oo.class({
   initAsInteractive = true,
   initPlayerControlled = true,
}, CBaseModule)

--Methods
function CMapVisualizerUI:init()
   wndMgr = CEGUI.WindowManager:getSingleton()
   self.itemsIcons = {}
   self.objIcons = {}

   self.itemsWnd = gameplayUI.mapUI.wnd:createChild("TaharezLook/ScrollablePane", "VisualizerItemsList")
   self.itemsWnd:setProperty("AlwaysOnTop", "true")
   self.itemsWnd:setProperty("Area", "{{0.83,0},{0,0},{0.99,0},{0.5,0}}")
   self.itemsWnd:setVisible(false)
   self.classesWnd = gameplayUI.mapUI.wnd:createChild("TaharezLook/ScrollablePane", "VisualizerClassesList")
   self.classesWnd:setText("Classes")
   self.classesWnd:setProperty("AlwaysOnTop", "true")
   self.classesWnd:setProperty("Area", "{{0.65,0},{0,0},{0.82,0},{0.5,0}}")
   self.classesWnd:setVisible(false)

   local i = 0
   for className,objTable in tablex.sort(ClassManager.objByClassesTable) do
      if className ~= "CMainCharacter" then
         self.objIcons[className] = {}
         local label = wndMgr:createWindow("TaharezLook/StaticText", className)
         label:setProperty("Area", "{{0,0},{0,0},{1,0},{0.05,0}}")
         label:setProperty("FrameEnabled", "false")
         label:setProperty("Font", "dialog-8")
         label:setProperty("MouseInputPropagationEnabled", "true")
         label:setProperty("TextColours", "FFFFFFFF")
         label:setText(string.format(" %s (%d)", className, #objTable))
         local pos = CEGUI.UVector2(CEGUI.UDim(0,0), CEGUI.UDim(0,19*(i-1)))
         label:setPosition(pos)
         GUIUtils.widgetSubscribeEventProtected(label, "MouseClick", partial(self.onMapVisualizerClassClick, self))
         self.classesWnd:addChild(label)
         i = i + 1

         local class = ClassManager.getClass(className)
         if class and class.getLootTable then
            local checkbox = wndMgr:createWindow("TaharezLook/Checkbox", "Checkbox")
            checkbox:setProperty("Area", "{{0.9,0},{0,0},{1,0},{1,0}}")
            checkbox:setProperty("MouseInputPropagationEnabled", "false")
            checkbox:setProperty("Selected", "true")
            GUIUtils.widgetSubscribeEventProtected(checkbox, "MouseClick", partial(self.onMapVisualizerClassCheckboxClick, self))
            label:addChild(checkbox)
         end
      end
   end

   i = 0
   local itemsTable = tablex.sort(ItemsData.ItemsInfo)
   for itemName,_ in itemsTable do
      self.itemsIcons[itemName] = {}
      local itemLabel = wndMgr:createWindow("TaharezLook/StaticText", itemName)
      itemLabel:setProperty("Area", "{{0,0},{0,0},{1,0},{0.05,0}}")
      itemLabel:setProperty("FrameEnabled", "false")
      itemLabel:setProperty("Font", "dialog-8")
      itemLabel:setProperty("MouseInputPropagationEnabled", "true")
      itemLabel:setProperty("TextColours", "FFFFFFFF")
      local _, totalCount = self:getItemsFromClasses(itemName)
      itemLabel:setText(string.format(" %s (%d)", itemName, totalCount))
      local pos = CEGUI.UVector2(CEGUI.UDim(0,0), CEGUI.UDim(0,19*(i-1)))
      itemLabel:setPosition(pos)
      GUIUtils.widgetSubscribeEventProtected(itemLabel, "MouseClick", partial(self.onMapVisualizerItemsClick, self))
      self.itemsWnd:addChild(itemLabel)
      i = i + 1
   end
end

function CMapVisualizerUI:getItemsFromClasses(itemName)
   local items = {}
   local totalCount = 0
   for className in pairs(ClassManager.classTable) do
      local classWnd = self.classesWnd:getChild(className)
      if classWnd and classWnd:getChild("Checkbox") and classWnd:getChild("Checkbox"):getProperty("Selected") == "true" then
         local objTable = ClassManager.getAllByClassName(className)
         if objTable then
            for i=1,#objTable do
               local obj = objTable[i]
               local loot = obj:getLootTable()
               if loot and loot[itemName] then
                  table.insert(items, { count = loot[itemName], obj = obj })
                  totalCount = totalCount + loot[itemName]
               end
            end
         end
      end
   end
   return items, totalCount
end

function CMapVisualizerUI:showItemsOnMap(itemName, state)
   if state then
      --Place items on map
      local items, totalCount = self:getItemsFromClasses(itemName)

      local text = " " .. itemName .. " (" .. totalCount .. ")"
      self.itemsWnd:getChild(itemName):setText(text)

      for i=1,#items do
         local hint = string.format("[font='dialog-10']%s (%d)\n%s", ItemsData.getItemLabel(itemName), items[i].count, items[i].obj:getName())
         local image = gameplayUI.mapUI:mapAddIconUnscaled(itemName..i, "gameplay/" .. ItemsData.getItemIcon(itemName), 0.04, items[i].obj:getPose():getPos(), hint)
         local counter = image:createChild("TaharezLook/StaticText", "Counter")
         counter:setText(tostring(items[i].count))
         counter:setProperty("Area", "{{0,0},{0.6,0},{1,0},{1,0}}")
         counter:setProperty("Font", "dialog-10")
         counter:setProperty("FrameEnabled", "false")
         counter:setProperty("BackgroundEnabled", "false")
         counter:setProperty("MousePassThroughEnabled", "true")
         counter:setProperty("MouseInputPropagationEnabled", "true")
         GUIUtils.widgetSubscribeEventProtected(image, "MouseClick", partial(self.onMapVisualizedIconClick, self))
         image:setUserString("objectName", items[i].obj:getName())
         table.insert(self.itemsIcons[itemName], image)
      end
   else
      for _,iconWnd in ipairs(self.itemsIcons[itemName]) do
         iconWnd:setVisible(false)
         wndMgr:destroyWindow(iconWnd)
      end
      self.itemsIcons[itemName] = {}
   end
end

function CMapVisualizerUI:showObjsOnMap(className, state)
   if state then
      for i=1,#ClassManager.objByClassesTable[className] do
         local obj = ClassManager.objByClassesTable[className][i]
         local name = obj:getName()
         local tip = string.format("%s \n%s", name, className)
         local windowName = name
         if gameplayUI.mapUI.mapImage:isChild(name) then
            windowName = name .. "_" .. i
         end
         local window = gameplayUI.mapUI:mapAddIconUnscaled(windowName, "gameplay/Empty", 0.04, obj:getPose():getPos(), tip)
         GUIUtils.widgetSubscribeEventProtected(window, "MouseClick", partial(self.onMapVisualizedIconClick, self))
         window:setUserString("objectName", obj:getName())
         local label = window:createChild("TaharezLook/StaticText", "Label")
         label:setText(string.sub(className, 2, 2))
         label:setProperty("Area", "{{0,0},{0,0},{1,0},{1,0}}")
         label:setProperty("Font", "decor-8")
         label:setProperty("FrameEnabled", "false")
         label:setProperty("BackgroundEnabled", "false")
         label:setProperty("HorzFormatting", "CentreAligned")
         label:setProperty("MousePassThroughEnabled", "true")
         table.insert(self.objIcons[className], window)
      end
   else
      for _,iconWnd in ipairs(self.objIcons[className]) do
         iconWnd:setVisible(false)
         wndMgr:destroyWindow(iconWnd)
      end
      self.objIcons[className] = {}
   end
end

--Callbacks
function CMapVisualizerUI:onMapVisualizerButtonClick(args)
   --Init item visualizer only now to not affect non-debug game loading
   if not self.itemsWnd then self:init() end

   self.itemsWnd:setVisible(not self.itemsWnd:isVisible())
   self.classesWnd:setVisible(not self.classesWnd:isVisible())
   if self.itemsWnd:isVisible() then
      self.itemsWnd:moveToFront()
      self.classesWnd:moveToFront()
   end
end

function CMapVisualizerUI:onMapVisualizerClassClick(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      local className = click_args.window:getName()
      if click_args.window:getID() == 0 then
         click_args.window:setID(1)
         self:showObjsOnMap(className, true)
         self.classesWnd:getChild(className):setProperty("TextColours", "FF34d4ec")
      else
         click_args.window:setID(0)
         self:showObjsOnMap(className, false)
         self.classesWnd:getChild(className):setProperty("TextColours", "FFFFFFFF")
      end
   end
end

function CMapVisualizerUI:onMapVisualizerItemsClick(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      local itemName = click_args.window:getName()
      if click_args.window:getID() == 0 then
         click_args.window:setID(1)
         self:showItemsOnMap(itemName, true)
         self.itemsWnd:getChild(itemName):setProperty("TextColours", "FF34d4ec")
      else
         click_args.window:setID(0)
         self:showItemsOnMap(itemName, false)
         self.itemsWnd:getChild(itemName):setProperty("TextColours", "FFFFFFFF")
      end
   end
end

function CMapVisualizerUI:onMapVisualizerClassCheckboxClick(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      local className = click_args.window:getParent():getName()
      local state = click_args.window:getProperty("Selected") == "true"

      for name,class in pairs(ClassManager.classTable) do
         if ClassManager.getClass(className) == oo.getsuper(class) then
            self.classesWnd:getChild(name .. "/Checkbox"):setProperty("Selected", tostring(state))
         end
      end

      for itemName,_ in pairs(ItemsData.ItemsInfo) do
         --Refresh icons
         if self.itemsWnd:getChild(itemName):getID() == 1 then
            self:showItemsOnMap(itemName, false)
            self:showItemsOnMap(itemName, true)
         else --Only refresh Total counts
            local _, totalCount = self:getItemsFromClasses(itemName)
            self.itemsWnd:getChild(itemName):setText(string.format(" %s (%d)", itemName, totalCount))
         end
      end
   end
end

function CMapVisualizerUI:onMapVisualizedIconClick(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local player = getMC()
   if click_args.button == CEGUI.LeftButton then
      log(click_args.window:getProperty("TooltipText"):gsub("%[font=.-%]", ""))
   elseif click_args.button == CEGUI.RightButton then
      local obj = getObj(click_args.window:getUserString("objectName"))
      local optionsList = {}
      optionsList["teleport"] = {func = function()
         player:getPose():setPos(obj:getPose():getPos())
         gameplayUI.mapUI:show(false)
      end}
      if obj:getScriptClass() == "CContainer" then
         optionsList["edit inventory"] = {func = function()
            player:interactObject("activate", obj, nil)
            gameplayUI.mapUI:show(false)
         end}
      end
      gameplayUI.popupMenuUI:setup(optionsList)
   end
end

return CMapVisualizerUI
