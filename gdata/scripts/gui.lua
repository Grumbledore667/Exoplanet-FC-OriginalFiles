dofile("./gdata/scripts/modules/ui/menu/menuUtils.lua")

local oo            = require "loop"
local WeatherSystem = (require "environment.weather").WeatherSystem
local Weather       = (require "environment.weatherEffects")
local SkySystem     = (require "environment.sky").SkySystem
local guiSystem     = CEGUI.System:getSingleton()
local guiContext    = guiSystem:getDefaultGUIContext()
local schemeMgr     = CEGUI.SchemeManager:getSingleton()
local wndMgr        = CEGUI.WindowManager:getSingleton()
local imgMgr        = CEGUI.ImageManager:getSingleton()
local animMgr       = CEGUI.AnimationManager:getSingleton()
local MiscLabels    = require "miscLabels"
local GUIUtils      = require "ui.utils"

local f = require "fun"
local partial = f.partial

local i18n          = require "i18n"

local hlp = require "helpers"

local console       = require "ui.console"
local options       = require "ui.menu.options"

local gamePaused  = false

--New modules split
local CCharacterUI  = require "ui.character"
local CHudUI        = require "ui.hud"
local CTradingUI    = require "ui.trading"
local CDebugUI      = require "ui.debug"
local CMapUI         = require "ui.map"
local CJournalUI    = require "ui.journal"
local CHotbarUI     = require "ui.hotbar"
local CCombLockUI   = require "ui.combLock"
local CMessageUI    = require "ui.message"
local CDrawingUI    = require "ui.drawing"
local CDialogUI     = require "ui.dialog"
local CItemInfoUI   = require "ui.iteminfo"
local TerminalUI    = require "ui.terminal"
local CHelpInfoUI   = require "ui.helpInfo"
local CWaitingUI    = require "ui.waiting"
local CTravelUI      = require "ui.travel"
local CPopupMenuUI  = require "ui.popupMenu"
local CRestHintUI   = require "ui.restHint"
local CSubtitlesUI  = require "ui.subtitles"
local CItemDelimiterUI = require "ui.itemDelimiter"
local CNotificationsUI = require "ui.notifications"
local CAnnoyingHintUI = require "ui.annoyingHint"
local CBillboardUI    = require "ui.billboard"
local CInteractProgressUI = require "ui.interactProgress"
local COverlaysUI         = require "ui.overlays"
local CStylesEditorUI    = require "ui.stylesEditor"
local CMapVisualizerUI   = require "ui.mapVisualizer"
local ImmersiveUI = require "ui.immersiveUI"
local CCraftUI       = require "ui.craft"
local CGameplayMenuUI = require "ui.gameplayMenu"


-------------------------------------------------------------------------------
-- Gameplay UI
-------------------------------------------------------------------------------
gameplayUI =
{
   wndGameplay     = nil,
   wndPause        = nil,
   wndPauseMain    = nil,
   wndSaveLoad     = nil,
   wndConsole      = nil,

   fadeToBlackSequence = false,
   shiftPressed     = false,
   bugHintTimer     = nil,

   worseColor = "FFce1124",
   betterColor = "FF1ece53",
   whiteColor = "FFFFFFFF",
   worseColorTag = "[colour='FFce1124']",
   betterColorTag = "[colour='FF1ece53']",
   whiteTag = "[colour='FFFFFFFF']",

   qualityColors = {
      [1] = "FF888888",
      [2] = "FF32CD32",
      [3] = "FFFF8C00",
      [4] = "FFA808A8",
   },

   qualityTags = {
      [1] = "[colour='FF888888']",
      [2] = "[colour='FF32CD32']",
      [3] = "[colour='FFFF8C00']",
      [4] = "[colour='FFA808A8']",
   },

   damageColorTags = {
      physical = "[colour='FFCEC4AE']",
      fire     = "[colour='FFFF6347']",
      energy   = "[colour='FF1E90FF']",
      poison   = "[colour='FF36B052']",
   },

   interactiveWindows = {},
   callbacks = {}, --For a engine crash workaround with global callbacks in character.lua
}

function gameplayUI:init()
   animMgr:loadAnimationsFromXML("generic.xml")
   GUIUtils.widgetSubscribeEventProtected(self.wndGameplay, "DragDropItemDropped", cbDragAndDropGameplayScreen)

   --New modules init
   self.inventoryPlayer = require "ui.inventoryPlayerUI"
   self.inventoryPlayer:init()
   self.inventoryContainer = require "ui.inventoryContainerUI"
   self.inventoryContainer:init()
   self.inventoryTurret = require "ui.inventoryTurretUI"
   self.inventoryTurret:init()

   self.tradingUI = CTradingUI()
   self.tradingUI:init()

   self.journalUI = CJournalUI()
   self.journalUI:init()

   self.characterUI = CCharacterUI()
   self.characterUI:init()

   self.mapUI = CMapUI()
   self.mapUI:init()

   self.debugUI = CDebugUI()
   self.debugUI:init()

   self.craftUI = CCraftUI()
   self.craftUI:init()

   self.hotbarUI = CHotbarUI()
   self.hotbarUI:init()

   self.hudUI = CHudUI()
   self.hudUI:init()

   self.combLockUI = CCombLockUI()
   self.combLockUI:init()

   self.messageUI = CMessageUI()
   self.messageUI:init()

   self.drawingUI = CDrawingUI()
   self.drawingUI:init()

   self.dialogUI = CDialogUI()
   self.dialogUI:init()

   self.itemDelimiterUI = CItemDelimiterUI()
   self.itemDelimiterUI:init()

   self.itemInfoUI = CItemInfoUI()
   self.itemInfoUI:init()

   TerminalUI.init()

   self.helpInfoUI = CHelpInfoUI()
   self.helpInfoUI:init()

   self.waitingUI = CWaitingUI()
   self.waitingUI:init()

   self.travelUI = CTravelUI()
   self.travelUI:init()

   self.popupMenuUI = CPopupMenuUI()
   self.popupMenuUI:init()

   self.restHintUI = CRestHintUI()
   self.restHintUI:init()

   self.subtitlesUI = CSubtitlesUI()
   self.subtitlesUI:init()

   self.notificationsUI = CNotificationsUI()
   self.notificationsUI:init()

   self.annoyingHintUI = CAnnoyingHintUI()
   self.annoyingHintUI:init()

   self.billboardUI = CBillboardUI()
   self.billboardUI:init()

   self.interactProgressUI = CInteractProgressUI()
   self.interactProgressUI:init()


   self.gameplayMenuUI = CGameplayMenuUI()
   self.gameplayMenuUI:init()

   self.overlaysUI = COverlaysUI()
   self.overlaysUI:init()

   ImmersiveUI.init()

   --Init on demand
   self.mapVisualizerUI = CMapVisualizerUI()
   GUIUtils.widgetSubscribeEventProtected(self.mapUI.wnd:getChild("VisualizerButton"), "Clicked", partial(self.mapVisualizerUI.onMapVisualizerButtonClick, self.mapVisualizerUI))

   self.stylesEditorUI = CStylesEditorUI()

   GUIUtils.translateAllWindowsText()

   GUIUtils.widgetSubscribeEventProtected(self.wndGameplay, "KeyDown", cbGameplayKeyDown)
   GUIUtils.widgetSubscribeEventProtected(self.wndGameplay, "KeyUp", cbGameplayKeyUp)
   self.wndGameplay:activate()
   self:setCursorVisible(false)

   local delay = 1
   local fade = 1.5
   if isEditor() or isDebug() then
      delay, fade = 0, 0
   end
   runTimer(delay, nil, function()
      gameplayUI.overlaysUI:triggerOverlay("black", fade, false)
   end, false)
end

function gameplayUI:deinit()
end

function gameplayUI:setCursorVisible(state)
   if state then
      TerminalUI.hideCursor()
      blockUserControl()
   elseif not getGlobalParam("inScene") then
      gameplayUI:resetCursorPos()
      resetCursorPos()
      returnUserControl()
   end
   guiContext:getMouseCursor():setVisible(state)
end

function gameplayUI:isCursorVisible()
   return guiContext:getMouseCursor():isVisible()
end

function gameplayUI:onInteractiveWindowHide()
   if guiContext:getRootWindow() == self.wndGameplay and not GUIUtils.interactiveWindowsVisible() then
      self:setCursorVisible(false)
   end
end

--TODO:FIXME: Figure out why engine resetCursorPos() has some kind of delay and does not work reliably with the GUI cursor.
function gameplayUI:resetCursorPos()
   local screenSize = self.wndGameplay:getPixelSize()
   local pos = CEGUI.Vector2f(screenSize.width/2,screenSize.height/2)
   guiContext:getMouseCursor():setPosition(pos)
end

function gameplayUI:canInteract()
   return (not gameplayUI.inventoryPlayer:isVisible() and
           not TerminalUI.isCursorVisible() and
           not gameplayUI.journalUI:isVisible() and
           not gameplayUI.travelUI:isVisible() and
           not gameplayUI.dialogUI:isVisible() and
           not gameplayUI.tradingUI:isVisible() and
           not gameplayUI.combLockUI:isVisible())
end

-------------------------------------------------------------------------------
-- Console
-------------------------------------------------------------------------------

function gameplayUI:showConsole()
   console.resetHistoryScrollID()
   guiContext:setRootWindow(self.wndConsole)
   self.wndConsole:setVisible(true)
   self.wndConsole:getChild("Command"):activate()
   getScene():pauseGame(true)

   gameplayUI:setCursorVisible(true)
end

function gameplayUI:hideConsole()
   self.wndConsole:getChild("Command"):setText("")
   self.wndConsole:setVisible(false)
   guiContext:setRootWindow(gameplayUI.wndGameplay)
   getScene():pauseGame(false)

   gameplayUI:onInteractiveWindowHide()
end

function gameplayUI:isConsoleVisible()
   return self.wndConsole:isVisible()
end

function gameplayUI:isGameplayRootWindow()
   return guiContext:getRootWindow() == self.wndGameplay
end

function hideConsole()
   gameplayUI:hideConsole()
end


function runConsoleCommand()
   if console.selectAutoCompleteItem() then return end
   if not console.runConsoleCommand() then
      gameplayUI:hideConsole()
   end
end

function gameplayUI:getParentAtIdx(wnd, index)
   local original = wnd
   while wnd and index > 0 do
      wnd = wnd:getParent()
      index = index - 1
   end
   return wnd
end

function gameplayUI:startFadeToBlackSequence(fadeInTime, pauseTime, fadeOutTime, callbacks)
   gameplayUI.overlaysUI:startFadeToBlackSequence(fadeInTime, pauseTime, fadeOutTime, callbacks)
end

function gameplayUI:retainPositionInsideDisplay(position, window)
   window:setPosition(position)
   local wndSize = window:getPixelSize()
   local wndClipRect = window:getHitTestRect()

   local clippedWidth = wndSize.width - wndClipRect:getWidth()
   if wndClipRect:getPosition().x == 0 then
      clippedWidth = clippedWidth * (-1)
   end
   local clippedHeight = wndSize.height - wndClipRect:getHeight()
   if wndClipRect:getPosition().y == 0 then
      clippedHeight = clippedHeight * (-1)
   end

   window:setPosition(CEGUI.UVector2(CEGUI.UDim(position.x.scale, position.x.offset-clippedWidth), CEGUI.UDim(position.y.scale, position.y.offset-clippedHeight)))
end

--One-time animations should be destroyed with delay and not in the callback or often it crashes the system
function gameplayUI:destroyAnimationInstanceSafe(instance, subConnection)
   runTimer(0, nil, function()
      if subConnection then
         subConnection:disconnect()
      end
      if instance then
         animMgr:destroyAnimationInstance(instance)
      end
   end, false)
end

function gameplayUI:startBugHint()
   local btn = getButtonCurrentKeyName("ACTIVATE")

   gameplayUI.billboardUI:setup("Bug control", string.format("Press '%s' to pick up items\nHold '%s' to shut down chip", btn, btn))
   self.bugHintTimer = runTimer(5, nil, function()
      gameplayUI.billboardUI:show(false)
      self.bugHintTimer = runTimer(20, nil, function()
         self:startBugHint()
      end, false)
   end, false)
end

function gameplayUI:stopBugHint()
   if self.bugHintTimer then
      gameplayUI.billboardUI:show(false)
      self.bugHintTimer:stop()
      self.bugHintTimer = nil
   end
end

function gameplayUI:showQuestStartInfo(text)
   getPlayer():playSoundScheduled("quest_start.wav", 10)
   self:showInfoTextEx(text, "major", "")
end

function gameplayUI:showQuestUpdateInfo(text)
   getPlayer():playSoundScheduled("quest_update.wav", 10)
   self:showInfoTextEx(text, "major", "")
end

function gameplayUI:showQuestLogUpdateInfo(text)
   getPlayer():playSoundScheduled("journal_update.wav", 10)
   self:showInfoTextEx(text, "major", "")
end

function gameplayUI:showQuestStopInfo(text)
   getPlayer():playSoundScheduled("quest_complete.wav", 10)
   self:showInfoTextEx(text, "major", "")
end

function gameplayUI:showInventoryPickInfo(text)
   getPlayer():playSound("inventory_pick.wav")
   self:showInfoTextEx(text, "minor", "")
end

function gameplayUI:showInventoryDropInfo(text)
   getPlayer():playSound("inventory_drop.wav")
   self:showInfoTextEx(text, "minor", "")
end

function gameplayUI:showInfoText(text)
   gameplayUI:showInfoTextEx(text)
end

function gameplayUI:showInfoTextEx(text, importance, sound)
   log("notification: " .. (text or "nil"))
   importance = importance or "minor"
   sound = sound or "quest_update.wav"
   local task = { ["text"] = text, ["sound"] = sound }
   gameplayUI.notificationsUI:addInfoTask(task, importance)
end

function gameplayUI:setFocusObj(obj)
   local curObj = self.hudUI.focus.currentObj
   if curObj == obj then
      return
   end
   if curObj then
      if curObj.OnFocusEnd then
         curObj:OnFocusEnd(getPlayer())
      end
      if curObj.unsubscribeOnDestroy then
         curObj:unsubscribeOnDestroy(self.hudUI.focus.onDestroyCallback)
         self.hudUI.focus.onDestroyCallback = nil
      end
   end
   self.hudUI.focus.currentObj = obj
   self.hudUI.focus.interactLabelTime = getGameTime()
   self.hudUI.focus.interactLabel:setVisible(false)
   if obj then
      if obj.OnFocusBegin then
         obj:OnFocusBegin(getPlayer())
      end
      if obj.subscribeOnDestroy then
         self.hudUI.focus.onDestroyCallback = obj:subscribeOnDestroy(self.setFocusObj, self)
      else
         local name, class = hlp.getNameAndClass(obj)
         log(string.format("WARNING: focused object named %s of class %s doesn't have subscribeOnDestroy method", name, class))
      end
   end

   --Set visibility and `RenderingStarted` subsscription will trigger an update by itself
   self.hudUI.focus.label:setVisible(true)
end

function gameplayUI:getFocusObj()
   return self.hudUI.focus.currentObj
end

function gameplayUI:bonusTableToString(bonusTable)
   local str = ""
   if bonusTable then
      for statName, value in pairs(bonusTable) do
         local bonusLabel = MiscLabels.getBonusLabel(statName)
         if value > 0 then
            bonusLabel = bonusLabel .. gameplayUI.betterColorTag .. " +" .. value
         elseif value == 0 then
            bonusLabel = bonusLabel .. " " .. value
         else
            bonusLabel = bonusLabel .. gameplayUI.worseColorTag .. " -" .. value
         end
         str = str .. "\n" .. bonusLabel .. gameplayUI.whiteTag
      end
   end
   return str
end

function gameplayUI:closeUI(exceptionsTable)
   if gameplayUI.terminal.activeTerminal then
      gameplayUI.terminal.activeTerminal:deactivate()
   end

   for wnd in pairs(GUIUtils.interactiveWindows) do
      if not exceptionsTable or not exceptionsTable[wnd] then
         wnd:setVisible(false) --Since setVisible(false) will trigger proper onHide event
      end
   end
end

function gameplayUI:setTextWndSelected(wnd, state, selectedColour)
   if wnd then
      selectedColour = selectedColour or "FF34d4ec"
      local defaultColour = GUIUtils.getWindowUserStringSafe(wnd, "defaultColour") or "FFFFFFFF"
      if state and wnd:getProperty("TextColours") ~= selectedColour then
         wnd:setUserString("defaultColour", wnd:getProperty("TextColours"))
         wnd:setProperty("TextColours", selectedColour)
      else
         wnd:setProperty("TextColours", defaultColour)
      end
   end
end

function gameplayUI:editBoxHasFocus(args)
   return gameplayUI.stylesEditorUI:editBoxHasFocus() or self.itemDelimiterUI:editBoxHasFocus()
end

function gameplayUI.onEditBoxKeyDown(args)
   local keyArgs = CEGUI.toKeyEventArgs(args)
   local editBox = keyArgs.window
   local caretPos = editBox:getCaretIndex()
   local txt = editBox:getText()

   if keyArgs.scancode == 75 then -- LEFT
      if caretPos > 0 then
         editBox:setCaretIndex(caretPos - 1)
      end
      return true
   elseif keyArgs.scancode == 77 then -- RIGHT
      editBox:setCaretIndex(caretPos + 1)
      return true
   elseif keyArgs.scancode == 71 then -- HOME
      editBox:setCaretIndex(0)
      return true
   elseif keyArgs.scancode == 14 then -- BACKSPACE
      local index = caretPos
      local sStart = (editBox:getSelectionLength() > 0 and editBox:getSelectionStartIndex()) or (index - 1)
      local sEnd = (editBox:getSelectionLength() > 0 and editBox:getSelectionEndIndex() + 1) or (index + 1)
      editBox:setText(string.sub(txt, 1, sStart) .. string.sub(txt, sEnd))
      editBox:setCaretIndex(sStart)
      return true
   elseif keyArgs.scancode == 83 then -- DELETE
      local index = caretPos + 1
      local sStart = (editBox:getSelectionLength() > 0 and editBox:getSelectionStartIndex()) or (index - 1)
      local sEnd = (editBox:getSelectionLength() > 0 and editBox:getSelectionEndIndex() + 1) or (index + 1)
      editBox:setText(string.sub(txt, 1, sStart) .. string.sub(txt, sEnd))
      editBox:setCaretIndex(sStart)
      return true
   end
end

-------------------------------------------------------------------------------
-- Events
-------------------------------------------------------------------------------
function OnInit()
   TPrint("gameplayUI.OnInit\n")
   local deb = require "global.debug"
   deb.initAfterCEGUI()

   for _, stringTable in ipairs(require "strings") do
      i18n.load(stringTable)
   end
   i18n.setLocale("en")

   CEGUI.SchemeManager:getSingleton():createFromFile("TaharezLook.scheme")
   guiContext:setDefaultFont("venus rising rg-10")
   guiContext:getMouseCursor():setDefaultImage("TaharezLook/MouseArrow")

   trackStop()

   gameplayUI.wndGameplay  = wndMgr:loadLayoutFromFile("gameplay.layout")
   gameplayUI.wndPause     = wndMgr:loadLayoutFromFile("pause_menu.layout")
   gameplayUI.wndPause:getChild("Version"):setProperty("Text", versionStr)
   gameplayUI.wndPauseMain = gameplayUI.wndPause:getChild("Main")
   gameplayUI.wndSaveLoad  = wndMgr:loadLayoutFromFile("save_load_menu.layout")
   gameplayUI.wndSaveLoad:getChild("Version"):setProperty("Text", versionStr)

   options:init()
   options.backMenu = gameplayUI.wndPause
   gameplayUI.wndOptions   = options:getWnd()

   -- CONSOLE START
   console:init()
   gameplayUI.wndConsole   = console:getWnd()
   GUIUtils.widgetSubscribeEventProtected(gameplayUI.wndConsole:getChild("Command"), "TextAccepted", runConsoleCommand)
   GUIUtils.widgetSubscribeEventProtected(gameplayUI.wndConsole:getChild("Command"), "CharacterKey", console.cbConsoleCharacter)
   GUIUtils.widgetSubscribeEventProtected(gameplayUI.wndConsole:getChild("Command"), "KeyDown", console.cbConsoleCommandKeyDown)
   GUIUtils.widgetSubscribeEventProtected(gameplayUI.wndConsole:getChild("Command"), "KeyUp", console.cbConsoleCommandKeyUp)
   -- CONSOLE END
   guiContext:setDefaultTooltipType("TaharezLook/Tooltip")

   if questSystem then
      questSystem:init()
   end

   gameplayUI:init()
   TerminalUI.init()

   GUIUtils.widgetSubscribeEventProtected(gameplayUI.wndPauseMain:getChild("ResumeButton"), "Clicked", continueGame)
   GUIUtils.widgetSubscribeEventProtected(gameplayUI.wndPauseMain:getChild("OptionsButton"), "Clicked", optionsMenu)
   GUIUtils.widgetSubscribeEventProtected(gameplayUI.wndPauseMain:getChild("SaveLoadButton"), "Clicked", saveGameMenu)
   GUIUtils.widgetSubscribeEventProtected(gameplayUI.wndPauseMain:getChild("HelpButton"), "Clicked", helpMenu)
   GUIUtils.widgetSubscribeEventProtected(gameplayUI.wndPauseMain:getChild("MenuButton"), "Clicked", quitToMenu)
   GUIUtils.widgetSubscribeEventProtected(gameplayUI.wndPauseMain:getChild("QuitButton"), "Clicked", quitToDesktop)

   GUIUtils.widgetSubscribeEventProtected(gameplayUI.wndSaveLoad:getChild("LoadButton"), "Clicked", loadGameState)
   --GUIUtils.widgetSubscribeEventProtected(gameplayUI.wndSaveLoad:getChild("Savegames"), "MouseDoubleClick", saveGameState)
   GUIUtils.widgetSubscribeEventProtected(gameplayUI.wndSaveLoad:getChild("Savegames"), "MouseClick", fillSaveName)
   GUIUtils.widgetSubscribeEventProtected(gameplayUI.wndSaveLoad:getChild("SaveButton"), "Clicked", saveGameState)
   GUIUtils.widgetSubscribeEventProtected(gameplayUI.wndSaveLoad:getChild("DeleteButton"), "Clicked", deleteGameState)
   GUIUtils.widgetSubscribeEventProtected(gameplayUI.wndSaveLoad:getChild("BackButton"), "Clicked", backToPauseMenu)
end

function OnDeinit()
   TPrint("OnDeinit\n")
   gameplayUI:deinit()
   commitPersistentTable()
end

function OnLostFocus()
   if guiContext:getRootWindow() and guiContext:getRootWindow():getName() == gameplayUI.wndGameplay:getName() then
      if getPlayer() and getPlayer().resetButtons then
         getPlayer():resetButtons()
      end
      pauseGame({})
   end
end

-- only gets called in client, not in editor
function OnKeyPress(key)
   if key == getButtonCode("ESCAPE") then
      if GUIUtils.tryDestroyDynamicWindows() or GUIUtils.tryCloseInteractiveWindow() then return end

      if guiContext:getRootWindow() and
              guiContext:getRootWindow():getName() == gameplayUI.wndOptions:getName() then
         options.optionsToMenu()
      elseif guiContext:getRootWindow() and
              guiContext:getRootWindow():getName() == gameplayUI.wndSaveLoad:getName() then
         backToPauseMenu()
      else
         checkPause()
      end
   end
   if not gameplayUI:isGameplayRootWindow() or gameplayUI:editBoxHasFocus() then
      return
   end

   if isDebug("keys") then
      if key == 190 then
         WeatherSystem:changeTimeRate( 5.0)
         SkySystem:changeTimeRate    ( 0.01)
      end
      if key == 188 then
         WeatherSystem:changeTimeRate(-5.0)
         SkySystem:changeTimeRate    (-0.01)
      end
   end
   if key == getButtonCode("TOGGLEUI") then
      if gameplayUI.wndGameplay:isVisible() then
         gameplayUI.wndGameplay:hide()
      else
         gameplayUI.wndGameplay:show()
         gameplayUI.wndGameplay:activate()
      end

   elseif key == getButtonCode("LEFT") and gameplayUI.gameplayMenuUI:isVisible() then
      gameplayUI.gameplayMenuUI:scrollTabs(false)
   elseif key == getButtonCode("RIGHT") and gameplayUI.gameplayMenuUI:isVisible() then
      gameplayUI.gameplayMenuUI:scrollTabs(true)
   end
end

-------------------------------------------------------------------------------
-- Global funcs
-------------------------------------------------------------------------------
function initLocationEnterUI()
   if getPlayer() then
      guiContext:setRootWindow(gameplayUI.wndGameplay)
   end
end

function checkPause()
   if (guiContext:getRootWindow() and
        guiContext:getRootWindow():getName() ~= gameplayUI.wndPause:getName() and
        guiContext:getRootWindow():getName() ~= gameplayUI.wndGameplay:getName() or
        gameplayUI.debugUI:isVisible()) then
      return
   end

   if gamePaused then
      continueGame({})
   else
      pauseGame({})
   end
end

function pauseGame(args)
   getScene():pauseGame(true)
   guiContext:setRootWindow(gameplayUI.wndPause)

   gamePaused = true

   gameplayUI:setCursorVisible(true)
end

function continueGame(args)
   gameplayUI.helpInfoUI:show(false)
   getScene():pauseGame(false)
   guiContext:setRootWindow(gameplayUI.wndGameplay)

   gamePaused = false

   gameplayUI:onInteractiveWindowHide()
end

function optionsMenu(args)
   options:updateOptions()
   guiContext:setRootWindow(gameplayUI.wndOptions)
end

function quitToDesktop(args)
   confirmMessage(gameplayUI.wndPause, function() exitGame() end)
--[[
   -- restart level
   reloadLocation()

   guiContext:setRootWindow(gameplayUI.wndGameplay)
   gameplayUI:showCursor(false)

   gamePaused = false
   ]]
end

function helpMenu(args)
   log(gameplayUI.helpInfoUI:isVisible())
   gameplayUI.helpInfoUI:show(not gameplayUI.helpInfoUI:isVisible())
end

function quitToMenu(args)
   confirmMessage(gameplayUI.wndPause, function()
      getScene():tryAutoSave()
      exitLocation()
   end)
end

function backToPauseMenu(args)
   guiContext:setRootWindow(gameplayUI.wndPause)
end

function saveGameMenu(args)
   SavegamesListBox = CEGUI.toListbox(gameplayUI.wndSaveLoad:getChild("Savegames"))
   initSavegamesList(SavegamesListBox)

   guiContext:setRootWindow(gameplayUI.wndSaveLoad)
   if isSavingEnabled() then
      gameplayUI.wndSaveLoad:getChild("SaveButton"):setProperty("Disabled", "false")
   else
      gameplayUI.wndSaveLoad:getChild("SaveButton"):setProperty("Disabled", "true")
   end
end

function fillSaveName(args)
   local item = SavegamesListBox:getFirstSelectedItem()

   if item ~= nil then
      gameplayUI.wndSaveLoad:getChild("SaveName"):setText(gSavegames[item:getID()].name)
   end
end

function loadGameState(args)
   local item = SavegamesListBox:getFirstSelectedItem()
   if item then
      loadSaveVersionCheck(item:getID())
   end
end

function saveGameState(args)
   local text = gameplayUI.wndSaveLoad:getChild("SaveName"):getText()
   if text == "" then
      local item = SavegamesListBox:getFirstSelectedItem()
      if item ~= nil then
         text = gSavegames[item:getID()].name
      else
         text = "default"
      end
   end

   local function createSave()
      saveGameSafe(text)
      gameplayUI.wndSaveLoad:getChild("SaveName"):setText("")
      initSavegamesList(SavegamesListBox) -- reinit list
   end

   if hasSaveItemByName(text) then
      confirmMessage(gameplayUI.wndSaveLoad, createSave)
   else
      createSave()
   end
end

function deleteGameState(args)
   local item = SavegamesListBox:getFirstSelectedItem()

   if item ~= nil then
      confirmMessage(gameplayUI.wndSaveLoad, function()
         deleteGame(gSavegames[item:getID()].name)
         initSavegamesList(SavegamesListBox) -- reinit list
      end)
   end
end

-------------------------------------------------------------------------------
-- Callbacks
-------------------------------------------------------------------------------
function cbGameplayKeyDown(args)
   local keyArgs = CEGUI.toKeyEventArgs(args)
   if keyArgs.scancode == virtualKeyToScanCode(16) then -- PC_SHIFT
      gameplayUI.shiftPressed = true
      return true
   end
   return false
end

function cbGameplayKeyUp(args)
   local keyArgs = CEGUI.toKeyEventArgs(args)
   if keyArgs.scancode == virtualKeyToScanCode(16) then -- PC_SHIFT
      gameplayUI.shiftPressed = false
      return true
   end
   return false
end

function cbDragAndDropGameplayScreen(args)
   local dd_args = CEGUI.toDragDropEventArgs(args)
   local sourceInventoryName = dd_args.dragDropItem:getUserString("inventoryName")
   if sourceInventoryName == "Hotbar" then
      local slotID = gameplayUI.hotbarUI:getHotbarWndIndex(dd_args.dragDropItem)
      gameplayUI.hotbarUI:clearHotbarSlot(slotID)
   elseif sourceInventoryName == "CharacterWindow" then
      local slotName = dd_args.dragDropItem:getParent():getName()
      local slotID = slotName
      if slotName:find("slot") then
         slotID = slotID:gsub("slot", "")
         slotID = tonumber(slotID)
      end
      local pInventory = getMC():getInventory()
      local item = pInventory:getSlotItem(slotID)
      if not item then return end

      if slotID == 1 or item:isAttire() then
         getMC():unequipItem(item)
      else
         pInventory:removeItemFromFastAccess(slotID)
         pInventory:unequipSlot(slotID)
      end
   end
end

function cbWindowScrollWheel(args)
   local me_args = args:toMouseEventArgs()
   local scroll_pos = me_args.window:getProperty("VertScrollPosition")
   if me_args.wheelChange > 0 then
      scroll_pos = scroll_pos - 0.1
   else
      scroll_pos = scroll_pos + 0.1
   end
   scroll_pos = math.max(0, math.min(1.0, scroll_pos))
   me_args.window:setProperty("VertScrollPosition", scroll_pos)
end
