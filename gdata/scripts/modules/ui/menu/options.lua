local wndMgr = CEGUI.WindowManager:getSingleton()
local guiContext = CEGUI.System:getSingleton():getDefaultGUIContext()
local gameOptions = require "global.gameOptions"
local GUIUtils = require "ui.utils"
local Keys = require "global.keys"

local stringx = require "pl.stringx"
local i18n = require "i18n"

local options =
{
   backMenu = nil,
   wnd = nil,
   TabSystemWnd = nil,
   TabKeysWnd = nil,
   TabGameWnd = nil,
   saveButton = nil,

   musicVolumeScrollbar = nil,
   viewDistanceScrollbar = nil,
   mouseSensitivityScrollbar = nil,
   mouseSensitivityValue = nil,
   fovScrollbar = nil,
   fovLabel = nil,
   tripleBufferingCheckbox = nil,
   invertYAxisCheckbox = nil,
   resolutionCombobox = nil,
   fullscreenCheckbox = nil,
   shadowsScrollbar = nil,
   shadowsValue = nil,
   texturesScrollbar = nil,
   texturesValue = nil,

   keyButtonInFocus = nil,
   keyAssignOverlay = nil,

   immersiveUICheckbox = nil,
   tutorialCheckbox = nil,

   fonts = {},
}

function options:init()
   self.wnd = wndMgr:loadLayoutFromFile("options_menu.layout")
   self.wnd:getChild("Version"):setProperty("Text", versionStr)
   GUIUtils.widgetSubscribeEventProtected(self.wnd, "KeyDown", cbKeyDown)
   GUIUtils.widgetSubscribeEventProtected(self.wnd, "MouseButtonDown", cbMouseButtonDown)

   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("BackButton"), "Clicked", optionsToMenu)
   self.saveButton = self.wnd:getChild("SaveButton")
   GUIUtils.widgetSubscribeEventProtected(self.saveButton, "Clicked", saveOptionsConfig)

   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("TabSystemButton"), "Clicked", cbTabClick)
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("TabKeysButton"), "Clicked", cbTabClick)
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("TabGameButton"), "Clicked", cbTabClick)

   --System
   self.wnd:addChild(wndMgr:loadLayoutFromFile("options_system.layout"))
   self.TabSystemWnd = self.wnd:getChild("System")

   self.musicVolumeScrollbar = CEGUI.toScrollbar(self.wnd:getChild("System/Audio/MusicVolume/Scrollbar"))
   GUIUtils.widgetSubscribeEventProtected(self.musicVolumeScrollbar, "ScrollPositionChanged", cbMusicVolumeChanged)

   self.soundsVolumeScrollbar = CEGUI.toScrollbar(self.wnd:getChild("System/Audio/SoundsVolume/Scrollbar"))
   GUIUtils.widgetSubscribeEventProtected(self.soundsVolumeScrollbar, "ScrollPositionChanged", cbSoundsVolumeChanged)

   self.viewDistanceScrollbar = CEGUI.toScrollbar(self.wnd:getChild("System/Graphics/ViewDistance/Scrollbar"))
   GUIUtils.widgetSubscribeEventProtected(self.viewDistanceScrollbar, "ScrollPositionChanged", cbViewDistanceChanged)

   self.mouseSensitivityScrollbar = CEGUI.toScrollbar(self.wnd:getChild("System/Input/MouseSensitivity/Scrollbar"))
   GUIUtils.widgetSubscribeEventProtected(self.mouseSensitivityScrollbar, "ScrollPositionChanged", cbMouseSensitivityChanged)
   self.mouseSensitivityValue = self.wnd:getChild("System/Input/MouseSensitivity/Value")

   self.fovScrollbar = CEGUI.toScrollbar(self.wnd:getChild("System/Graphics/FOV/Scrollbar"))
   GUIUtils.widgetSubscribeEventProtected(self.fovScrollbar, "ScrollPositionChanged", cbFOVChanged)
   self.fovValue = self.wnd:getChild("System/Graphics/FOV/Value")

   self.tripleBufferingCheckbox = self.wnd:getChild("System/Graphics/TripleBuffering/Checkbox")
   GUIUtils.widgetSubscribeEventProtected(self.tripleBufferingCheckbox, "MouseButtonUp", cbTripleBufferingChanged)

   self.resolutionCombobox = CEGUI.toCombobox(self.wnd:getChild("System/Graphics/Resolution/Combobox"))
   GUIUtils.widgetSubscribeEventProtected(self.resolutionCombobox, "ListSelectionAccepted", cbResolutionChanged)
   initResolutionsCombobox(self.resolutionCombobox)

   self.fullscreenCheckbox = self.wnd:getChild("System/Graphics/Fullscreen/Checkbox")
   GUIUtils.widgetSubscribeEventProtected(self.fullscreenCheckbox, "MouseButtonUp", cbFullscreenChanged)

   self.shadowsScrollbar = CEGUI.toScrollbar(self.wnd:getChild("System/Graphics/Shadows/Scrollbar"))
   GUIUtils.widgetSubscribeEventProtected(self.shadowsScrollbar, "ScrollPositionChanged", cbShadowsChanged)
   self.shadowsValue = self.wnd:getChild("System/Graphics/Shadows/Value")

   self.texturesScrollbar = CEGUI.toScrollbar(self.wnd:getChild("System/Graphics/Textures/Scrollbar"))
   GUIUtils.widgetSubscribeEventProtected(self.texturesScrollbar, "ScrollPositionChanged", cbTexturesChanged)
   self.texturesValue = self.wnd:getChild("System/Graphics/Textures/Value")

   self.invertYAxisCheckbox = self.wnd:getChild("System/Input/InvertY/Checkbox")
   GUIUtils.widgetSubscribeEventProtected(self.invertYAxisCheckbox, "MouseButtonUp", cbInvertYAxisChanged)

   --Keys
   self.wnd:addChild(wndMgr:loadLayoutFromFile("options_keys.layout"))
   self.TabKeysWnd = self.wnd:getChild("Keys")
   self.TabKeysWnd:setVisible(false)

   self.keyAssignOverlay = self.TabKeysWnd:getChild("Overlay")

   for buttonName,_ in pairs(Keys.getKeysMap()) do
      if not Keys.isButtonSystem(buttonName) then
         local wnd = self.TabKeysWnd:getChild(buttonName .. "/Button")
         if wnd then
            GUIUtils.widgetSubscribeEventProtected(wnd, "Clicked", cbKeyButtonClick)
         end
      end
   end

   GUIUtils.widgetSubscribeEventProtected(self.TabKeysWnd:getChild("RestoreDefaultKeysButton"), "Clicked", cbRestoreDefaultKeys)

   --Game
   self.wnd:addChild(wndMgr:loadLayoutFromFile("options_game.layout"))
   self.TabGameWnd = self.wnd:getChild("Game")
   self.TabGameWnd:setVisible(false)

   local tab = self.wnd:getChild("Game/Options")
   for optionName in pairs(getGameOptions()) do
      local wnd = tab:isChild(optionName) and tab:getChild(optionName)
      if wnd then
         if wnd:isChild("Checkbox") then
            GUIUtils.widgetSubscribeEventProtected(wnd:getChild("Checkbox"), "MouseButtonUp", cbGameOptionCheckboxChanged)
         end
         if wnd:isChild("Scrollbar") then
            GUIUtils.widgetSubscribeEventProtected(wnd:getChild("Scrollbar"), "ScrollPositionChanged", cbGameOptionScrollPositionChanged)
         end
      end
   end

   self:updateOptions()
end

function options:getWnd()
   return options.wnd
end

function options:updateOptions()
   self.musicVolumeScrollbar:setProperty("ScrollPosition", getTrackVolume())
   self.soundsVolumeScrollbar:setProperty("ScrollPosition", getSoundsVolume())
   self.viewDistanceScrollbar:setProperty("ScrollPosition", getViewDistance())
   local pos = math.max(math.min((getPlayerFov() - 45) / 45.0, 1.0), 0)
   self.fovScrollbar:setProperty("ScrollPosition", pos)
   self.fovValue:setText(tostring(math.floor(getPlayerFov())))
   local sensPos = math.max(math.min((getMouseSensitivity() - 1) / 9.0, 1.0), 0)
   self.mouseSensitivityScrollbar:setProperty("ScrollPosition", sensPos)
   self.mouseSensitivityValue:setText(string.format("%.1f", getMouseSensitivity()))
   self.tripleBufferingCheckbox:setProperty("Selected", tostring(getTripleBuffering()))
   self.invertYAxisCheckbox:setProperty("Selected", tostring(getMouseYInvert()))

   local currentResolution = getGameResolution()
   self.resolutionCombobox:setText(tostring(currentResolution.width) .. " x " .. currentResolution.height)

   self.fullscreenCheckbox:setProperty("Selected", tostring(getFullscreen()))

   local shadowsPos = math.max(math.min((getShadowQuality() - 1) / 2, 1.0), 0)
   self.shadowsScrollbar:setProperty("ScrollPosition", shadowsPos)
   self.shadowsValue:setText(i18n("menu.system.labels.shadow_quality." .. getShadowQuality()))

   local texturesPos = math.abs(getTextureLodBias()) / 2
   self.texturesScrollbar:setProperty("ScrollPosition", texturesPos)
   self.texturesValue:setText(string.format("%.1f", getTextureLodBias()))

   self:diselectKeyButton()
   for buttonName in pairs(Keys.getKeysMap()) do
      if not Keys.isButtonSystem(buttonName) then
         local buttonWnd = self.TabKeysWnd:getChild(buttonName .. "/Button")
         local keyName = getButtonCurrentKeyName(buttonName)
         if buttonWnd then
            buttonWnd:setText(keyName)
         end
      end
   end

   if not isMainMenu() then
      if gameplayUI.hotbarUI then
         gameplayUI.hotbarUI:updateHotbarButtonsNames()
      end
      if gameplayUI.gameplayMenuUI then
         gameplayUI.gameplayMenuUI:updateTabButtonsNames()
      end
   end

   local tab = self.wnd:getChild("Game/Options")
   for optionName,data in pairs(getGameOptions()) do
      local wnd = tab:isChild(optionName) and tab:getChild(optionName)
      if wnd then
         local state = getGameOption(optionName)
         if wnd:isChild("Checkbox") then
            wnd:getChild("Checkbox"):setProperty("Selected", tostring(state))
         end
         if wnd:isChild("Value") then
            wnd:getChild("Value"):setText(data.current)
         end
         if wnd:isChild("Scrollbar") then
            wnd:getChild("Scrollbar"):setProperty("ScrollPosition", (data.current - data.min) / (data.max - data.min))
         end
      end
   end

   self.saveButton:setProperty("Disabled", "true")
end

function options:diselectKeyButton()
   self.keyButtonInFocus = nil
   self.keyAssignOverlay:setVisible(false)
end

function optionsToMenu(args)
   loadConfig()
   options.saveButton:setProperty("Disabled", "true")
   guiContext:setRootWindow(options.backMenu)
   gameOptions.init()
end

function saveOptionsConfig(args)
   saveConfig()
   options.saveButton:setProperty("Disabled", "true")
   if options.backMenu:getName() == "PauseMenu" then --Means we are in game
      setDefaultPlayerCameraFov(getPlayerFov())
   end
   gameOptions.saveGameOptions()
end


function cbMusicVolumeChanged(args)
   trackVolume(options.musicVolumeScrollbar:getScrollPosition())
   options.saveButton:setProperty("Disabled", "false")
end

function cbSoundsVolumeChanged(args)
   setSoundsVolume(options.soundsVolumeScrollbar:getScrollPosition())
   options.saveButton:setProperty("Disabled", "false")
end

function cbViewDistanceChanged(args)
   setViewDistance(options.viewDistanceScrollbar:getScrollPosition())
   options.saveButton:setProperty("Disabled", "false")
end

function cbMouseSensitivityChanged(args)
   local s = (options.mouseSensitivityScrollbar:getScrollPosition() * 9) + 1
   options.mouseSensitivityValue:setText(string.format("%.1f", s))
   setMouseSensitivity(s)
   options.saveButton:setProperty("Disabled", "false")
end

function cbFOVChanged(args)
   local fov = math.floor((options.fovScrollbar:getScrollPosition() * 45) + 45.5)
   if options.fovValue then
      options.fovValue:setText(tostring(fov))
   end

   setPlayerFov(fov)
   options.saveButton:setProperty("Disabled", "false")
end

function cbTripleBufferingChanged(args)
   local click_args = args:toMouseEventArgs()
   local value = string.lower(click_args.window:getProperty("Selected")) == "true"
   if getTripleBuffering() ~= value then
      options.saveButton:setProperty("Disabled", "false")
   end
   setTripleBuffering(value)
end

function cbResolutionChanged(args)
   local item = options.resolutionCombobox:getSelectedItem()
   setGameResolution(gResolutions[item:getID()].resolution)
   do
      local size = getScreenSize()
      CEGUI.System:getSingleton():notifyDisplaySizeChanged(CEGUI.Sizef(size.x, size.y))
   end
   options.saveButton:setProperty("Disabled", "false")

   if not isMainMenu() then
      runTimer(0, nil, function()
         gameplayUI.dialogUI:onResolutionChanged()
      end, false)
   end
end

function cbFullscreenChanged(args)
   local click_args = args:toMouseEventArgs()
   local value = string.lower(click_args.window:getProperty("Selected")) == "true"
   if getFullscreen() ~= value then
      options.saveButton:setProperty("Disabled", "false")
   end
   setFullscreen(value)
end

function cbShadowsChanged(args)
   local shadowsNumber = math.floor((options.shadowsScrollbar:getScrollPosition() * 2) + 1.5)
   local text = i18n("menu.system.labels.shadow_quality." .. shadowsNumber)

   if options.shadowsValue and options.shadowsValue:getText() ~= text then
      options.shadowsValue:setText(text)
      setShadowQuality(shadowsNumber)
      options.saveButton:setProperty("Disabled", "false")
   end
end

function cbTexturesChanged(args)
   local textures = -options.texturesScrollbar:getScrollPosition() * 2

   if options.texturesValue and options.texturesValue:getText() ~= tostring(textures) then
      options.texturesValue:setText(string.format("%.1f", textures))
      setTextureLodBias(textures)
      options.saveButton:setProperty("Disabled", "false")
   end
end

function cbInvertYAxisChanged(args)
   local click_args = args:toMouseEventArgs()
   local value = string.lower(click_args.window:getProperty("Selected")) == "true"
   if getMouseYInvert() ~= value then
      options.saveButton:setProperty("Disabled", "false")
   end
   setMouseYInvert(value)
end

--Game
function cbGameOptionCheckboxChanged(args)
   local click_args = args:toMouseEventArgs()
   if click_args.button ~= CEGUI.LeftButton then return end
   local optionName = click_args.window:getParent():getName()
   local value = string.lower(click_args.window:getProperty("Selected")) == "true"
   if value ~= getGameOption(optionName) then
      options.saveButton:setProperty("Disabled", "false")
   end
   setGameOption(optionName, value)
end

function cbGameOptionScrollPositionChanged(args)
   local click_args = args:toMouseEventArgs()
   local wnd = CEGUI.toScrollbar(click_args.window)
   local parent = click_args.window:getParent()
   local optionName = parent:getName()
   local optionData = gameOptions.getGameOptionData(optionName)

   local value = optionData.min + math.floor(wnd:getScrollPosition() * (optionData.max - optionData.min) + 0.5)
   if parent:isChild("Value") then
      parent:getChild("Value"):setText(value)
   end
   setGameOption(optionName, value)
   options.saveButton:setProperty("Disabled", "false")
end

function cbTabClick(args)
   local we_args = args:toWindowEventArgs()
   local tabName = string.gsub(we_args.window:getName(), "Button", "")
   options.TabSystemWnd:setVisible(false)
   options.TabKeysWnd:setVisible(false)
   options.TabGameWnd:setVisible(false)

   options.wnd:getChild("TabSystemButton"):setProperty("Disabled", "false")
   options.wnd:getChild("TabKeysButton"):setProperty("Disabled", "false")
   options.wnd:getChild("TabGameButton"):setProperty("Disabled", "false")

   options[tabName .. "Wnd"]:setVisible(true)
   we_args.window:setProperty("Disabled", "true")
   if tabName == "TabKeys" then
      options.wnd:getChild("SaveButton"):setVisible(false)
   else
      options.wnd:getChild("SaveButton"):setVisible(true)
   end
   options:diselectKeyButton()
end

function cbKeyButtonClick(args)
   local we_args = args:toWindowEventArgs()

   options.keyButtonInFocus = we_args.window
   options.keyAssignOverlay:setVisible(true)
   options.keyAssignOverlay:moveToFront()
end

function cbKeyDown(args)
   local keyArgs = CEGUI.toKeyEventArgs(args)
   if Keys.isKeyBanned(keyArgs.scancode) then return end
   local virtualKeyCode = scanCodeToVirtualKey(keyArgs.scancode, false)
   if virtualKeyCode then
      if options.keyAssignOverlay:isVisible() and options.keyButtonInFocus then
         if virtualKeyCode == getButtonCode("ESCAPE") then
            options:diselectKeyButton()
         else
            local buttonName = options.keyButtonInFocus:getParent():getName()
            Keys.setButtonCode(buttonName, virtualKeyCode)
            options:updateOptions()
            Keys.saveKeysMap()
         end
      else
         if virtualKeyCode == getButtonCode("ESCAPE") then
            optionsToMenu()
         end
      end
   end
end


local function ceguiMouseCodeToVirtualMouse(code)
   local map = {
      [0] = 1,
      [1] = 2,
      [2] = 4,
      [3] = 5,
      [4] = 6,
   }
   return map[code]
end

function cbMouseButtonDown(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local mouseCode = ceguiMouseCodeToVirtualMouse(click_args.button)
   if mouseCode and options.keyAssignOverlay:isVisible() and options.keyButtonInFocus then
      local buttonName = options.keyButtonInFocus:getParent():getName()
      Keys.setButtonCode(buttonName, mouseCode)
      options:updateOptions()
      Keys.saveKeysMap()
   end
end

function cbRestoreDefaultKeys(args)
   Keys.restoreDefaultKeys(true)
   options:updateOptions()
   Keys.saveKeysMap()
end

options.optionsToMenu = optionsToMenu

return options
