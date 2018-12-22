local getSavegameParam = (require "global.savegames").getSavegameParam
local loadGameState = (require "global.savegames").loadGameState
local guiContext = CEGUI.System:getSingleton():getDefaultGUIContext()
local wndMgr = CEGUI.WindowManager:getSingleton()

local persistence = require "persistence"
local stringio = require "pl.stringio"

gSavegames = nil
gResolutions = nil

local dynamicWindowsIDs = { WarningMessage = 1001, OptionalLoading = 1002 }

function getDynamicWindowID( wndName )
   return dynamicWindowsIDs[wndName]
end

function getDynamicWindowSafe( wndName )
   local rootWnd = guiContext:getRootWindow()
   local ID = getDynamicWindowID( wndName )
   if rootWnd and ID and rootWnd:isChild( ID ) then
      return rootWnd:getChild( wndName )
   end
end

function tryDestroyDynamicWindows()
   local stopPropagation = false
   for wndName in pairs(dynamicWindowsIDs) do
      local wnd = getDynamicWindowSafe( wndName )
      if wnd then
         wndMgr:destroyWindow( wnd )
         stopPropagation = true
      end
   end
   return stopPropagation
end

function initSavegamesList( listBox )
   listBox:resetList()

   local filesList = getSavegamesElements( "\\*.sav", false, true )

   gSavegames = {}

   local function saveHasMinimalMetadata(savename)
      local path = string.format("%s\\%s.sav", getSavegamesFolder(), tostring(savename))
      local state = loadGameState(path)
      return state and state.Version and state.Time and state.TimeLabel
   end

   for i=1,#filesList do
      local savename = string.gsub(filesList[i], "%.%w+$", "")
      if saveHasMinimalMetadata(savename) then
         table.insert(gSavegames, addSavegameItem( savename ))
      else
         log(string.format("ERROR: savegame %s doesn't have necessary metadata. Corrupt save?", tostring(savename)))
      end
   end
   table.sort(gSavegames, function (a, b) return a.time > b.time end)

   for i, v in ipairs(gSavegames) do
      v.item:setID(i)
      listBox:addItem(v.item)
   end
end

function addSavegameItem( text )
   local ListItemColour = CEGUI.Colour:new_local(1.0,1.0,1.0,1.0)
   local ListItemSelectedColour = CEGUI.Colour:new_local(1.0,1.0,1.0,0.8)

   local font = CEGUI.FontManager:getSingleton():get("dialog-14")
   local textLen = 300 - font:getTextExtent(text)
   local spaceLen = font:getTextExtent(" ")
   local spaces = math.ceil(textLen/spaceLen)
   if spaces < 1 then spaces = 1 end

   local label = text
   label = label .. string.rep(" ", spaces).. "[colour='FF888888']" .. getSavegameParam(text, "TimeLabel")
   local version = getSavegameParam(text, "Version") or 1
   label = label .. "               Version: " .. version

   local item = CEGUI.createListboxTextItem( label )

   item:setTextColours(ListItemColour)
   item:setSelectionColours(ListItemSelectedColour)
   item:setSelectionBrushImage("TaharezLook/TextSelectionBrush")
   item:setFont( "dialog-14" )

   return { ["item"] = item, ["name"] = text, ["time"] = getSavegameParam(text, "Time"), version = version }
end

function initResolutionsCombobox( comboBox )
   comboBox:resetList()

   local currentResolution = getGameResolution()
   comboBox:setText( tostring(currentResolution.width) .. " x " .. currentResolution.height )

   local coreResolutions = getScreenResolutions()
   gResolutions = {}

   for _, res in ipairs(coreResolutions) do
      table.insert(gResolutions, addResolutionItem( res ))
   end

   for i, v in ipairs(gResolutions) do
      v.item:setID(i)
      comboBox:addItem(v.item)
   end
end

function addResolutionItem( resolution )
   local label = tostring(resolution.width) .. " x " .. resolution.height
   local item = CEGUI.createListboxTextItem( label )

   return { ["item"] = item, ["label"] = label, ["resolution"] = { width = resolution.width, height = resolution.height,  }, }
end

function confirmMessage( rootWnd, cbYes, cbNo, question )
   local wndConfirmation = wndMgr:loadLayoutFromFile( "confirmation.layout" )
   if question and type(question) == "string" then
      wndConfirmation:getChild("Header/StaticText"):setText(question)
   end
   wndConfirmation:subscribeEvent( "KeyDown", cbConfirmationKey )

   if ( not rootWnd:getChild( "Confirmation" ) ) then
      rootWnd:addChild( wndConfirmation )
      wndConfirmation:activate()
   end

   cbConfirmationYes = function()
      if cbYes then cbYes() end
      rootWnd:removeChild( wndConfirmation )
      wndMgr:destroyWindow( wndConfirmation )
   end

   wndConfirmation:getChild( "Yes/Button" ):subscribeEvent( "Clicked", cbConfirmationYes )

   cbConfirmationNo = function()
      if cbNo then cbNo() end
      rootWnd:removeChild( wndConfirmation )
      wndMgr:destroyWindow( wndConfirmation )
   end

   wndConfirmation:getChild( "No/Button" ):subscribeEvent( "Clicked", cbConfirmationNo )
end

function cbConfirmationKey( args )
   local keyArgs = CEGUI.toKeyEventArgs( args )
   if ( keyArgs.scancode == virtualKeyToScanCode(27)) then -- ESC
      cbConfirmationNo()
   end
end

function warningMessage( text )
   local rootWnd = guiContext:getRootWindow()

   if gameplayUI and rootWnd == gameplayUI.wndGameplay then
      gameplayUI:resetCursorPos()
      gameplayUI:showCursor()
      setUserControl( false )
   end

   local wnd = getDynamicWindowSafe( "WarningMessage" )
   if not wnd then
      wnd = wndMgr:loadLayoutFromFile( "warning_message.layout" )
      wnd:setID( getDynamicWindowID( "WarningMessage" ) )
      rootWnd:addChild( wnd )
   end

   wnd:getChild("Text"):setText( text )
   wnd:activate()

   local function cbOkay()
      wndMgr:destroyWindow( wnd )
   end
   wnd:getChild( "OkayButton" ):subscribeEvent( "Clicked", cbOkay )

   wnd:subscribeEvent( "CloseClicked", cbOkay )
   return wnd
end

function getLastSaveID()
   local lastTime  = 0
   local lastIndex = 1

   for i=1,#gSavegames do
      if ( gSavegames[i].time > lastTime ) then
         lastTime  = gSavegames[i].time
         lastIndex = i
      end
   end
   return lastIndex
end

function loadSaveVersionCheck( saveID )
   local rootWnd = guiContext:getRootWindow()

   local versionDelta = versionInt - gSavegames[saveID].version

   if isDebug() and versionDelta > 0 then
      local wnd = warningMessage( "This save's version is older than current. \nLoad anyway?" )
      local function cbOkay()
         wndMgr:destroyWindow( wnd )
         loadGameSafe( gSavegames[saveID].name )
      end
      wnd:getChild( "OkayButton" ):subscribeEvent( "Clicked", cbOkay )

   elseif versionDelta > 1 then
      warningMessage( "This save's version is too old to be loaded. \nPlease, choose a newer one or start a new game." )

   elseif versionDelta == 1 then
      if gameplayUI and rootWnd == gameplayUI.wndGameplay then
         gameplayUI:resetCursorPos()
         gameplayUI:showCursor()
         setUserControl( false )
      end

      local wnd = getDynamicWindowSafe( "OptionalLoading" )
      if not wnd then
         wnd = wndMgr:loadLayoutFromFile( "optional_loading.layout" )
         wnd:setID( getDynamicWindowID( "OptionalLoading" ) )
         rootWnd:addChild( wnd )
      end
      wnd:activate()

      local function cbOptionalLoad()
         local options = {}
         for _,paramName in pairs({ "playerPosition", "level", "attributePoints", "inventory", "fastTravel" }) do
            local state = wnd:getChild( paramName .. "/Checkbox" ):getProperty("Selected") == "true"
            options[paramName] = state
         end
         options.saveName = gSavegames[saveID].name

         local str = stringio.create()
         persistence.store( str, options )
         setPersistentData( str:value() )

         wndMgr:destroyWindow( wnd )
         changeLocation( "\\levels\\WindscreamCanyon\\Windscream_Canyon.swz" )
      end
      wnd:getChild( "LoadButton" ):subscribeEvent( "Clicked", cbOptionalLoad )

      --disable attribute points checkbox alongside the level checkbox
      local function cbLevelCheckboxChanged( args )
         local click_args = CEGUI.toMouseEventArgs( args )
         if click_args.button == CEGUI.LeftButton then
            local state = wnd:getChild( "level/Checkbox" ):getProperty("Selected") == "true"
            if not state then
               wnd:getChild( "attributePoints/Checkbox" ):setProperty("Selected", "false")
            end
            wnd:getChild( "attributePoints/Checkbox" ):setProperty("Disabled", tostring(not state))
         end
      end
      wnd:getChild( "level/Checkbox" ):subscribeEvent( "MouseClick", cbLevelCheckboxChanged )

      local function cbCancel()
         wndMgr:destroyWindow( wnd )
      end
      wnd:getChild( "CancelButton" ):subscribeEvent( "Clicked", cbCancel )

      wnd:subscribeEvent( "CloseClicked", cbCancel )

   else
      loadGameSafe( gSavegames[saveID].name )
   end
end

function loadGameSafe(name)
   log(string.format("INFO: loading %s", tostring(name)))

   if name then
      local saveVersion = 0
      for _,save in pairs(gSavegames) do
         if save.name == name then
            saveVersion = save.version
            break
         end
      end
      log("INFO: save version = " .. tostring(saveVersion) .. ", current version = " .. tostring(versionInt))
   end
   if not name or not loadGame( name ) then
      log(string.format("ERROR: Couldn't load game %s", tostring(name)))
   end
end

function saveGameSafe(name)
   log(string.format("INFO: saving %s", tostring(name)))
   if not name or not saveGame( name ) then
      log(string.format("ERROR: Couldn't save game %s", tostring(name)))
   end
end
