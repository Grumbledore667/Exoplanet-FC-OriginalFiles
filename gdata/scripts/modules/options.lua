local wndMgr = CEGUI.WindowManager:getSingleton()
local guiContext = CEGUI.System:getSingleton():getDefaultGUIContext()
local tablex = require "pl.tablex"
local gameOptions = require "global.gameOptions"

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
   keysBlacklist = { 91, 92, 93, 63, 67, 88 }, -- lwim, rwin, select, f5, f9 and f12
   dontSubscribeButtons = { "GODMODE", "CAPSLOCK", "STYLES", "RESTING", "PREVIOUS", "CONTROL", "ESCAPE" },

   immersiveUICheckbox = nil,
   tutorialCheckbox = nil,
}

function options:init()
   self.wnd = wndMgr:loadLayoutFromFile( "options_menu.layout" )
   self.wnd:getChild("Version"):setProperty("Text", versionStr)
   self.wnd:subscribeEvent( "KeyDown", cbKeyDown )
   self.wnd:subscribeEvent( "MouseButtonDown", cbMouseButtonDown )

   self.wnd:getChild( "Back/Button" ):subscribeEvent( "Clicked", optionsToMenu )
   self.saveButton = self.wnd:getChild( "Save/Button" )
   self.saveButton:subscribeEvent( "Clicked", saveOptionsConfig )

   self.wnd:getChild( "TabSystemButton" ):subscribeEvent( "Clicked", cbTabClick )
   self.wnd:getChild( "TabKeysButton" ):subscribeEvent( "Clicked", cbTabClick )
   self.wnd:getChild( "TabGameButton" ):subscribeEvent( "Clicked", cbTabClick )

   --System
   self.wnd:addChild( wndMgr:loadLayoutFromFile( "options_system.layout" ) )
   self.TabSystemWnd = self.wnd:getChild( "System" )

   self.musicVolumeScrollbar = CEGUI.toScrollbar( self.wnd:getChild( "System/MusicNSound/MusicVolume/Scrollbar" ) )
   self.musicVolumeScrollbar:subscribeEvent( "ScrollPositionChanged", cbMusicVolumeChanged )

   self.viewDistanceScrollbar = CEGUI.toScrollbar( self.wnd:getChild( "System/Graphics/ViewDistance/Scrollbar" ) )
   self.viewDistanceScrollbar:subscribeEvent( "ScrollPositionChanged", cbViewDistanceChanged )

   self.mouseSensitivityScrollbar = CEGUI.toScrollbar( self.wnd:getChild( "System/Input/MouseSensitivity/Scrollbar" ) )
   self.mouseSensitivityScrollbar:subscribeEvent( "ScrollPositionChanged", cbMouseSensitivityChanged )
   self.mouseSensitivityValue = self.wnd:getChild( "System/Input/MouseSensitivity/Value" )

   self.fovScrollbar = CEGUI.toScrollbar( self.wnd:getChild( "System/Graphics/FOV/Scrollbar" ) )
   self.fovScrollbar:subscribeEvent( "ScrollPositionChanged", cbFOVChanged )
   self.fovValue = self.wnd:getChild( "System/Graphics/FOV/Value" )

   self.tripleBufferingCheckbox = self.wnd:getChild( "System/Graphics/TripleBuffering/Checkbox" )
   self.tripleBufferingCheckbox:subscribeEvent( "MouseClick", cbTripleBufferingChanged )

   self.resolutionCombobox = CEGUI.toCombobox( self.wnd:getChild( "System/Graphics/Resolution/Combobox" ) )
   self.resolutionCombobox:subscribeEvent( "ListSelectionAccepted", cbResolutionChanged )
   initResolutionsCombobox( self.resolutionCombobox )

   self.fullscreenCheckbox = self.wnd:getChild( "System/Graphics/Fullscreen/Checkbox" )
   self.fullscreenCheckbox:subscribeEvent( "MouseClick", cbFullscreenChanged )

   self.shadowsScrollbar = CEGUI.toScrollbar( self.wnd:getChild( "System/Graphics/Shadows/Scrollbar" ) )
   self.shadowsScrollbar:subscribeEvent( "ScrollPositionChanged", cbShadowsChanged )
   self.shadowsValue = self.wnd:getChild( "System/Graphics/Shadows/Value" )

   self.texturesScrollbar = CEGUI.toScrollbar( self.wnd:getChild( "System/Graphics/Textures/Scrollbar" ) )
   self.texturesScrollbar:subscribeEvent( "ScrollPositionChanged", cbTexturesChanged )
   self.texturesValue = self.wnd:getChild( "System/Graphics/Textures/Value" )

   self.invertYAxisCheckbox = self.wnd:getChild( "System/Input/InvertY/Checkbox" )
   self.invertYAxisCheckbox:subscribeEvent( "MouseClick", cbInvertYAxisChanged )

   --Keys
   self.wnd:addChild( wndMgr:loadLayoutFromFile( "options_keys.layout" ) )
   self.TabKeysWnd = self.wnd:getChild( "Keys" )
   self.TabKeysWnd:setVisible( false )

   self.keyAssignOverlay = self.TabKeysWnd:getChild("Overlay")

   for buttonName,_ in pairs( getKeysMap() ) do
      if not tablex.search( self.dontSubscribeButtons, buttonName ) then
         local wnd = self.TabKeysWnd:getChild(buttonName .. "/Button")
         if wnd then
            wnd:subscribeEvent("Clicked", cbKeyButtonClick)
         end
      end
   end

   self.TabKeysWnd:getChild("RestoreDefaultKeys/Button"):subscribeEvent( "Clicked", cbRestoreDefaultKeys )

   --Game
   self.wnd:addChild( wndMgr:loadLayoutFromFile( "options_game.layout" ) )
   self.TabGameWnd = self.wnd:getChild( "Game" )
   self.TabGameWnd:setVisible( false )

   self.immersiveUICheckbox = self.wnd:getChild( "Game/Options/immersiveUI/Checkbox" )
   self.immersiveUICheckbox:subscribeEvent( "MouseClick", cbGameOptionCheckboxChanged )

   self.tutorialCheckbox = self.wnd:getChild( "Game/Options/tutorial/Checkbox" )
   self.tutorialCheckbox:subscribeEvent( "MouseClick", cbGameOptionCheckboxChanged )

   self.autoReloadCheckbox = self.wnd:getChild( "Game/Options/autoReload/Checkbox" )
   self.autoReloadCheckbox:subscribeEvent( "MouseClick", cbGameOptionCheckboxChanged )

   self:updateOptions()
end

function options:getWnd()
   return options.wnd
end

function options:updateOptions()
   self.musicVolumeScrollbar:setProperty("ScrollPosition", getTrackVolume())
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
   self.resolutionCombobox:setText( tostring(currentResolution.width) .. " x " .. currentResolution.height )

   self.fullscreenCheckbox:setProperty( "Selected", tostring(getFullscreen()) )

   local shadowsPos = math.max(math.min(( getShadowQuality() - 1 ) / 2, 1.0), 0)
   self.shadowsScrollbar:setProperty("ScrollPosition", shadowsPos)
   local shadowsStrings = { [1] = "Low", [2] = "Medium", [3] = "High", }
   self.shadowsValue:setText(shadowsStrings[getShadowQuality()])

   local texturesPos = math.abs(getTextureLodBias()) / 2
   self.texturesScrollbar:setProperty("ScrollPosition", texturesPos)
   self.texturesValue:setText(string.format("%.1f", getTextureLodBias()))

   self.saveButton:setProperty( "Disabled", "true" )

   self:diselectKeyButton()

   for buttonName in pairs(getKeysMap()) do
      if not tablex.search( self.dontSubscribeButtons, buttonName ) then
         local buttonWnd = self.TabKeysWnd:getChild( buttonName .. "/Button" )
         local keyName = getButtonCurrentKeyName( buttonName )
         if buttonWnd then
            buttonWnd:setText( keyName )
         end
      end
   end

   for optionName,val in pairs(getGameOptions()) do
      self[optionName .. "Checkbox"]:setProperty("Selected", tostring(val))
   end
end

function options:diselectKeyButton()
   self.keyButtonInFocus = nil
   self.keyAssignOverlay:setVisible( false )
end

function optionsToMenu( args )
   loadConfig()
   options.saveButton:setProperty( "Disabled", "true" )
   guiContext:setRootWindow( options.backMenu )
   gameOptions.init()
end

function saveOptionsConfig( args )
   saveConfig()
   options.saveButton:setProperty( "Disabled", "true" )
   if options.backMenu:getName() == "PauseMenu" then --Means we are in game
      setDefaultPlayerCameraFov(getPlayerFov())
   end
   gameOptions.saveGameOptions()
end


function cbMusicVolumeChanged( args )
   trackVolume( options.musicVolumeScrollbar:getScrollPosition() )
   options.saveButton:setProperty( "Disabled", "false" )
end

function cbViewDistanceChanged( args )
   setViewDistance( options.viewDistanceScrollbar:getScrollPosition() )
   options.saveButton:setProperty( "Disabled", "false" )
end

function cbMouseSensitivityChanged( args )
   local s = (options.mouseSensitivityScrollbar:getScrollPosition() * 9) + 1
   options.mouseSensitivityValue:setText(string.format("%.1f", s))
   setMouseSensitivity( s )
   options.saveButton:setProperty( "Disabled", "false" )
end

function cbFOVChanged( args )
   local fov = math.floor((options.fovScrollbar:getScrollPosition() * 45) + 45.5)
   if options.fovValue then
      options.fovValue:setText(tostring(fov))
   end

   setPlayerFov(fov)
   options.saveButton:setProperty( "Disabled", "false" )
end

function cbTripleBufferingChanged( args )
   setTripleBuffering( string.lower(options.tripleBufferingCheckbox:getProperty("Selected")) == "true" )
   options.saveButton:setProperty( "Disabled", "false" )
end

function cbResolutionChanged( args )
   local item = options.resolutionCombobox:getSelectedItem()
   setGameResolution( gResolutions[item:getID()].resolution )
   options.saveButton:setProperty( "Disabled", "false" )
end

function cbFullscreenChanged( args )
   setFullscreen( string.lower(options.fullscreenCheckbox:getProperty("Selected")) == "true" )
   options.saveButton:setProperty( "Disabled", "false" )
end

function cbShadowsChanged( args )
   local shadowsNumber = math.floor( (options.shadowsScrollbar:getScrollPosition() * 2) + 1.5 )
   local shadowsStrings = { [1] = "Low", [2] = "Medium", [3] = "High", }

   if options.shadowsValue and options.shadowsValue:getText() ~= shadowsStrings[shadowsNumber] then
      options.shadowsValue:setText(shadowsStrings[shadowsNumber])
      setShadowQuality( shadowsNumber )
      options.saveButton:setProperty( "Disabled", "false" )
   end
end

function cbTexturesChanged( args )
   local textures = -options.texturesScrollbar:getScrollPosition() * 2

   if options.texturesValue and options.texturesValue:getText() ~= tostring(textures) then
      options.texturesValue:setText(string.format("%.1f", textures))
      setTextureLodBias( textures )
      options.saveButton:setProperty( "Disabled", "false" )
   end
end

function cbInvertYAxisChanged( args )
   setMouseYInvert( string.lower(options.invertYAxisCheckbox:getProperty("Selected")) == "true" )
   options.saveButton:setProperty( "Disabled", "false" )
end

--Game
function cbGameOptionCheckboxChanged( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button ~= CEGUI.LeftButton then return end
   local name = click_args.window:getParent():getName()
   local value = click_args.window:getProperty("Selected") == "true"
   setGameOption( name, value )
   options.saveButton:setProperty( "Disabled", "false" )

   if name == "immersiveUI" and not value then
      gameplayUI:immersiveUIShow( "status" )
      gameplayUI:immersiveUIShow( "ammo" )
   end
end


function cbTabClick( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   local tabName = string.gsub(click_args.window:getName(), "Button", "")
   options.TabSystemWnd:setVisible( false )
   options.TabKeysWnd:setVisible( false )
   options.TabGameWnd:setVisible( false )

   options.wnd:getChild( "TabSystemButton" ):setProperty( "Disabled", "false" )
   options.wnd:getChild( "TabKeysButton" ):setProperty( "Disabled", "false" )
   options.wnd:getChild( "TabGameButton" ):setProperty( "Disabled", "false" )

   options[tabName .. "Wnd"]:setVisible( true )
   click_args.window:setProperty( "Disabled", "true" )
   if tabName == "TabKeys" then
      options.wnd:getChild("Save"):setVisible( false )
   else
      options.wnd:getChild("Save"):setVisible( true )
   end
   options:diselectKeyButton()
end

function cbKeyButtonClick( args )
   local click_args = CEGUI.toMouseEventArgs( args )

   options.keyButtonInFocus = click_args.window
   options.keyAssignOverlay:setVisible( true )
   options.keyAssignOverlay:moveToFront()
end

function cbKeyDown( args )
   local keyArgs = CEGUI.toKeyEventArgs( args )
   if tablex.search(options.keysBlacklist, keyArgs.scancode) then return end
   local virtualKeyCode = scanCodeToVirtualKey(keyArgs.scancode, false)
   if virtualKeyCode then
      if options.keyAssignOverlay:isVisible() and options.keyButtonInFocus then
         if virtualKeyCode == getButtonCode( "ESCAPE" ) then
            options:diselectKeyButton()
         else
            local buttonName = options.keyButtonInFocus:getParent():getName()
            setButtonCode( buttonName, virtualKeyCode )
            options:updateOptions()
            saveKeysMap()
         end
      else
         if virtualKeyCode == getButtonCode( "ESCAPE" ) then
            optionsToMenu()
         end
      end
   end
end

function cbMouseButtonDown( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   if options.keyAssignOverlay:isVisible() and options.keyButtonInFocus then
      local buttonName = options.keyButtonInFocus:getParent():getName()
      local virtualKeyCode = click_args.button + 1

      setButtonCode( buttonName, virtualKeyCode )
      options:updateOptions()
      saveKeysMap()
   end
end

function cbRestoreDefaultKeys( args )
   restoreDefaultKeys( true )
   options:updateOptions()
   saveKeysMap()
end

options.optionsToMenu = optionsToMenu

return options
