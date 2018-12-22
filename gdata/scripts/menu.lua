package.path = package.path .. ';./gdata/scripts/modules/?.lua;./gdata/scripts/modules/?/init.lua'
package.cpath = package.cpath .. ';./gdata/scripts/modules/?.dll'

dofile("./gdata/scripts/modules/menuUtils.lua")

local Backers = require "support"
local console = require "console"
local options = require "options"
local deb     = require "global.debug"
local keys    = require "global.keys"
local gameOptions = require "global.gameOptions"

_G.clear      = deb.clear
_G.log        = deb.log
_G.versionStr = deb.versionStr
_G.versionInt = deb.versionInt

deb.init()
_G.isDebug    = deb.isDebug

TPrint("Loading: keys.lua\n")
keys.init()

_G.setButtonCode           = keys.setButtonCode
_G.getButtonCode           = keys.getButtonCode
_G.getKeysMap              = keys.getKeysMap
_G.saveKeysMap             = keys.saveKeysMap
_G.restoreDefaultKeys      = keys.restoreDefaultKeys
_G.getButtonCurrentKeyName = keys.getButtonCurrentKeyName

TPrint("Loading: gameOptions.lua\n")
gameOptions.init()

_G.setGameOption = gameOptions.setGameOption
_G.getGameOption = gameOptions.getGameOption
_G.getGameOptions = gameOptions.getGameOptions

local guiContext = CEGUI.System:getSingleton():getDefaultGUIContext()
local wndMgr     = CEGUI.WindowManager:getSingleton()

local function runConsoleCommand()
   console:getWnd():hide()
   console.runConsoleCommand()
   console:getWnd():getChild("Command"):setText("")
end

local function cbKeyDown( args )
   local keyArgs = CEGUI.toKeyEventArgs( args )
   if ( keyArgs.scancode == 41) then -- `(~)
      if not console:getWnd():isVisible() then
         console:getWnd():show()
         console:getWnd():getChild("Command"):activate()
      else
         console:getWnd():hide()
      end
      return true
   elseif ( keyArgs.scancode == 1 and console:getWnd():isVisible()) then -- escape
      console:getWnd():hide()
      return true
   end
   return false
end

function OnInit()
   wndMainMenu = wndMgr:loadLayoutFromFile( "main_menu.layout" )
   wndMainMenu:getChild("Version"):setProperty("Text", versionStr)
   wndMainMenu:subscribeEvent( "KeyDown", cbMainMenuKeyDown )

   wndLoadMenu = wndMgr:loadLayoutFromFile( "save_load_menu.layout" )
   wndLoadMenu:getChild("Version"):setProperty("Text", versionStr)
   wndLoadMenu:subscribeEvent( "KeyDown", cbLoadMenuKeyDown )

   wndCredits = wndMgr:loadLayoutFromFile( "credits.layout" )
   wndCredits:getChild("Version"):setProperty("Text", versionStr)
   wndCredits:subscribeEvent( "KeyDown", cbCreditsKeyDown )

   options:init()
   options.backMenu = wndMainMenu

   console:init()
   wndMainMenu:addChild(console:getWnd())
   console:getWnd():hide()
   console:getWnd():getChild( "Command" ):subscribeEvent( "KeyDown", console.cbConsoleCommandKeyDown )
   console:getWnd():getChild( "Command" ):subscribeEvent( "KeyUp", console.cbConsoleCommandKeyUp )
   console:getWnd():getChild( "Command" ):subscribeEvent( "TextAccepted", runConsoleCommand )
   wndMainMenu:subscribeEvent( "KeyDown", cbKeyDown )

   local scrSize = getScreenSize()

   if ( scrSize.x/scrSize.y < 1.5 ) then
      wndMainMenu:getChild( "Background" ):setProperty( "Image", "menu_background/4x3" )
      wndLoadMenu:getChild( "Background" ):setProperty( "Image", "menu_background/4x3" )
      options.wnd:getChild( "Background" ):setProperty( "Image", "menu_background/4x3" )
      wndCredits:getChild( "Background" ):setProperty( "Image", "menu_background/4x3" )
   else
      wndMainMenu:getChild( "Background" ):setProperty( "Image", "menu_background/16x9" )
      wndLoadMenu:getChild( "Background" ):setProperty( "Image", "menu_background/16x9" )
      options.wnd:getChild( "Background" ):setProperty( "Image", "menu_background/16x9" )
      wndCredits:getChild( "Background" ):setProperty( "Image", "menu_background/16x9" )
   end

   guiContext:setRootWindow( wndMainMenu )
   guiContext:getMouseCursor():show()

   wndMainMenu:getChild( "ButtonNew" ):subscribeEvent( "Clicked", newLevel )
   wndMainMenu:getChild( "ButtonContinue" ):subscribeEvent( "Clicked", loadLastGameState )
   wndMainMenu:getChild( "ButtonLoad" ):subscribeEvent( "Clicked", loadMenu )
   wndMainMenu:getChild( "ButtonOptions" ):subscribeEvent( "Clicked", optionsMenu )
   wndMainMenu:getChild( "ButtonCredits" ):subscribeEvent( "Clicked", showCredits )
   wndMainMenu:getChild( "ButtonQuit" ):subscribeEvent( "Clicked", quitGame )

   wndLoadMenu:getChild( "Save" ):hide()
   wndLoadMenu:getChild( "SaveName" ):hide()
   wndLoadMenu:getChild( "SaveNameBG" ):hide()
   wndLoadMenu:getChild( "Load/Button" ):subscribeEvent( "Clicked", loadGameState )
   wndLoadMenu:getChild( "Delete/Button" ):subscribeEvent( "Clicked", deleteGameState )
   wndLoadMenu:getChild( "Back/Button" ):subscribeEvent( "Clicked", mainMain )

   wndCredits:getChild( "Back/Button" ):subscribeEvent( "Clicked", mainMain )

   initSavegames()
   wndLoadMenu:getChild( "Savegames" ):subscribeEvent( "MouseDoubleClick", loadGameState )

   trackPlay( "menu.ogg", 0 )
   wndMainMenu:activate()
end

function initSavegames()
   SavegamesListBox = CEGUI.toListbox( wndLoadMenu:getChild( "Savegames" ) )
   initSavegamesList( SavegamesListBox )

   wndMainMenu:getChild( "ButtonContinue" ):setProperty( "Disabled", tostring(#gSavegames == 0) )
end

function mainMain( args )
   creditsAnimation = nil
   guiContext:setRootWindow( wndMainMenu )
end

function loadMenu( args )
   initSavegames()
   guiContext:setRootWindow( wndLoadMenu )
   wndLoadMenu:moveToFront()
end

function optionsMenu( args )
   options:updateOptions()
   guiContext:setRootWindow( options.wnd )
   options.wnd:moveToFront()
end

function showCredits( args )
   local text = "\n\n\n\n\n\n\n\n\n\n[image-size='w:626 h:380'][image='game_logo/LogoName']\n\n\n\n\n\n\n\n\n\n"

   for i=1,#Backers do
      text = text .. Backers[i].title .. "\n"

      for j=1,#Backers[i].list do
         text = text .. Backers[i].list[j] .. "\n"
      end

      text = text .. "\n\n\n"
   end

   for i=1,100 do
      text = text .. "\n"
   end

   local textWnd = wndCredits:getChild( "BlackBack/Text" )
   textWnd:setText( text )
   guiContext:setRootWindow( wndCredits )
   wndCredits:moveToFront()

   creditsAnimation = { wnd = textWnd, offset = -50 }
end

function newLevel( args )
   trackPlay("loadingscreen_1.ogg", 0)
   changeLocation( "\\levels\\WindscreamCanyon\\Windscream_Canyon.swz" )
end

function loadGameState( args )
   local item = SavegamesListBox:getFirstSelectedItem()
   if item then
      loadSaveVersionCheck( item:getID() )
   end
end

function deleteGameState( args )
   local item = SavegamesListBox:getFirstSelectedItem()

   if ( item ~= nil ) then
      confirmMessage( wndLoadMenu, function()
         deleteGame( gSavegames[item:getID()].name )
         initSavegames()
      end )
   end
end

function loadLastGameState( args )
   loadSaveVersionCheck( getLastSaveID() )
end

function quitGame( args )
   confirmMessage( wndMainMenu, function() exitGame() end )
end

function OnUpdate( timeDelta )
   if ( creditsAnimation ) then
      creditsAnimation.wnd:setProperty( "VertScrollPosition", tostring(creditsAnimation.offset) )
      creditsAnimation.offset = creditsAnimation.offset + timeDelta * 50.0
   end
end

function cbMainMenuKeyDown( args )
   local keyArgs = CEGUI.toKeyEventArgs( args )
   local virtualKeyCode = scanCodeToVirtualKey(keyArgs.scancode, false)
   if virtualKeyCode == getButtonCode( "ESCAPE" ) then
      if tryDestroyDynamicWindows() then return end

      if not console:getWnd():isVisible() then
         quitGame( args )
      end
   end
end

function cbLoadMenuKeyDown( args )
   local keyArgs = CEGUI.toKeyEventArgs( args )
   local virtualKeyCode = scanCodeToVirtualKey(keyArgs.scancode, false)
   if virtualKeyCode == getButtonCode( "ESCAPE" ) then
      if tryDestroyDynamicWindows() then return end

      if not console:getWnd():isVisible() then
         mainMain( args )
      end
   end
end

function cbCreditsKeyDown( args )
   local keyArgs = CEGUI.toKeyEventArgs( args )
   local virtualKeyCode = scanCodeToVirtualKey(keyArgs.scancode, false)
   if virtualKeyCode == getButtonCode( "ESCAPE" ) then
      mainMain( args )
   end
end

OnInit()
