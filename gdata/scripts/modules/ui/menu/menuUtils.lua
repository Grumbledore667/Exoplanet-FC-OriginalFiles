local getSavegameParam = (require "global.savegames").getSavegameParam
local loadGameState = (require "global.savegames").loadGameState
local guiContext = CEGUI.System:getSingleton():getDefaultGUIContext()
local wndMgr = CEGUI.WindowManager:getSingleton()

local GUIUtils = require "ui.utils"


gSavegames = nil
gResolutions = nil

function isMainMenu()
   return mainMenuParam == true
end

function hasSaveItemByName(saveName)
   for _,saveItem in pairs(gSavegames) do
      if saveName == saveItem["name"] then
         return true
      end
   end
   return false
end

function initSavegamesList(listBox)
   listBox = CEGUI.toListbox(listBox)
   listBox:resetList()

   local filesList = getSavegamesElements("\\*.sav", false, true)

   gSavegames = {}

   local function saveHasMinimalMetadata(savename)
      local path = string.format("%s\\%s.sav", getSavegamesFolder(), tostring(savename))
      local state = loadGameState(path)
      return state and state.Version and state.Time and state.TimeLabel
   end

   for i=1,#filesList do
      local savename = string.gsub(filesList[i], "%.%w+$", "")
      if saveHasMinimalMetadata(savename) then
         table.insert(gSavegames, addSavegameItem(savename))
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

function addSavegameItem(text)
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

   local item = CEGUI.createListboxTextItem(label)

   item:setTextColours(ListItemColour)
   item:setSelectionColours(ListItemSelectedColour)
   item:setSelectionBrushImage("TaharezLook/TextSelectionBrush")
   item:setFont("dialog-14")

   return { ["item"] = item, ["name"] = text, ["time"] = getSavegameParam(text, "Time"), version = version }
end

function initResolutionsCombobox(comboBox)
   comboBox:resetList()

   local currentResolution = getGameResolution()
   comboBox:setText(tostring(currentResolution.width) .. " x " .. currentResolution.height)

   local coreResolutions = getScreenResolutions()
   gResolutions = {}

   for _, res in ipairs(coreResolutions) do
      table.insert(gResolutions, addResolutionItem(res))
   end

   for i, v in ipairs(gResolutions) do
      v.item:setID(i)
      comboBox:addItem(v.item)
   end
end

function addResolutionItem(resolution)
   local label = tostring(resolution.width) .. " x " .. resolution.height
   local item = CEGUI.createListboxTextItem(label)

   return { ["item"] = item, ["label"] = label, ["resolution"] = { width = resolution.width, height = resolution.height,  }, }
end

local function destroyDynamicWindow(wnd)
   GUIUtils.setWindowInteractive(wnd, false, false)
   wndMgr:destroyWindow(wnd)
   if not isMainMenu() then gameplayUI:onInteractiveWindowHide() end
end

function confirmMessage(rootWnd, cbYes, cbNo, question)
   if GUIUtils.getDynamicWindowSafe("Confirmation") then return end
   local wnd = wndMgr:loadLayoutFromFile("confirmation.layout")
   rootWnd:addChild(wnd)
   wnd:activate()
   if question and type(question) == "string" then
      wnd:getChild("Header/StaticText"):setText(question)
   end
   GUIUtils.widgetSubscribeEventProtected(wnd, "KeyDown", cbConfirmationKey)

   GUIUtils.setWindowInteractive(wnd, true, true)
   if not isMainMenu() then gameplayUI:setCursorVisible(true) end

   cbConfirmationYes = function()
      if cbYes then cbYes() end
      destroyDynamicWindow(wnd)
   end

   GUIUtils.translateWindowText(wnd:getChild("YesButton"))
   GUIUtils.widgetSubscribeEventProtected(wnd:getChild("YesButton"), "Clicked", cbConfirmationYes)

   cbConfirmationNo = function()
      if cbNo then cbNo() end
      destroyDynamicWindow(wnd)
   end

   GUIUtils.translateWindowText(wnd:getChild("NoButton"))
   GUIUtils.widgetSubscribeEventProtected(wnd:getChild("NoButton"), "Clicked", cbConfirmationNo)
end

function cbConfirmationKey(args)
   local keyArgs = CEGUI.toKeyEventArgs(args)
   if keyArgs.scancode == virtualKeyToScanCode(getButtonCode("ESCAPE")) then -- ESC
      cbConfirmationNo()
   elseif keyArgs.scancode == virtualKeyToScanCode(getButtonCode("ENTER")) then -- ENTER
      cbConfirmationYes()
   end
end

function warningMessage(text)
   if GUIUtils.getDynamicWindowSafe("WarningMessage") then return end
   local rootWnd = guiContext:getRootWindow()
   local wnd = wndMgr:loadLayoutFromFile("warning_message.layout")
   rootWnd:addChild(wnd)
   wnd:activate()

   GUIUtils.setWindowInteractive(wnd, true, true)
   if not isMainMenu() then gameplayUI:setCursorVisible(true) end

   wnd:getChild("Text"):setText(text)

   local function cbOkay()
      destroyDynamicWindow(wnd)
   end

   GUIUtils.translateWindowText(wnd:getChild("OkayButton"))
   GUIUtils.widgetSubscribeEventProtected(wnd:getChild("OkayButton"), "Clicked", cbOkay)

   GUIUtils.widgetSubscribeEventProtected(wnd, "CloseClicked", cbOkay)
   return wnd
end

local debugWidgets = {}
local mouseLeftButton = false
local moveDelta
function debugwidget(func, updateRate, ...)
   if not isMainMenu() and pcall(func, ...) then
      updateRate = updateRate or 0.1
      local wndID = #debugWidgets + 1
      local wnd = wndMgr:loadLayoutFromFile("debugWidget.layout")
      wnd:setName("DebugWidget" .. wndID)
      gameplayUI.wndGameplay:addChild(wnd)
      local yoffset = (wnd:getHeight().offset + 3) * (wndID - 1)
      local wndPos = wnd:getPosition()
      wndPos = CEGUI.UVector2(CEGUI.UDim(wndPos.x.scale, wndPos.x.offset), CEGUI.UDim(wndPos.y.scale, wndPos.y.offset - yoffset))
      gameplayUI:retainPositionInsideDisplay(wndPos, wnd)

      local function update(...)
         local text = tostring(func(...)) or "nil"
         wnd:getChild("FrameWindow/Text"):setText(text)
         wnd:setHeight(CEGUI.UDim(0, math.max(wnd:getPixelSize().height, wnd:getChild("FrameWindow/Text"):getProperty("VertExtent") * 1.1)))
         wnd:setWidth(CEGUI.UDim(0, math.max(wnd:getPixelSize().width, wnd:getChild("FrameWindow/Text"):getProperty("HorzExtent") * 1.1)))
         if not mouseLeftButton then
            gameplayUI:retainPositionInsideDisplay(wnd:getPosition(), wnd)
         end
      end

      update(...)
      local timer = runTimerAdv(updateRate, true, update, ...)

      local function onClick(args)
         local click_args = CEGUI.toMouseEventArgs(args)
         if click_args.button == CEGUI.LeftButton then
            mouseLeftButton = true
         end
      end
      local function onRelease(args)
         local click_args = CEGUI.toMouseEventArgs(args)
         if click_args.button == CEGUI.LeftButton then
            mouseLeftButton = false
            local pos = wnd:getPosition()
            pos = CEGUI.UVector2(CEGUI.UDim(pos.x.scale, pos.x.offset + moveDelta.x), CEGUI.UDim(pos.y.scale, pos.y.offset + moveDelta.y))
            runTimer(0, nil, function() --Delay because drag window wants to return to old pos.
               gameplayUI:retainPositionInsideDisplay(pos, wnd)
            end, false)
         end
      end
      local function onHover()
         wnd:setAlpha(0.6)
         wnd:getChild("CloseButton"):setVisible(true)
      end
      local function onLeave()
         wnd:setAlpha(0.4)
         wnd:getChild("CloseButton"):setVisible(false)
         mouseLeftButton = false
      end
      local function onMove(args)
         local click_args = CEGUI.toMouseEventArgs(args)
         if mouseLeftButton then
            moveDelta = CEGUI.Vector2f(click_args.moveDelta.x, click_args.moveDelta.y)
         end
      end
      local running = true
      local function onClose()
         running = false
         timer:stop()
         wndMgr:destroyWindow(wnd)
         table.remove(debugWidgets, wndID)
      end
      GUIUtils.widgetSubscribeEventProtected(wnd, "MouseButtonDown", onClick)
      GUIUtils.widgetSubscribeEventProtected(wnd, "MouseButtonUp", onRelease)
      GUIUtils.widgetSubscribeEventProtected(wnd, "MouseEntersArea", onHover)
      GUIUtils.widgetSubscribeEventProtected(wnd, "MouseLeavesArea", onLeave)
      GUIUtils.widgetSubscribeEventProtected(wnd, "MouseMove", onMove)
      GUIUtils.widgetSubscribeEventProtected(wnd:getChild("CloseButton"), "Clicked", onClose)

      table.insert(debugWidgets, {wnd = wnd, timer = timer})
      return function() return running end
   else
      log("ERROR: could not run assigned function")
      return function() return false end
   end
end

function debugwidgetPos(widgetID, x, y)
   if debugWidgets[widgetID] then
      debugWidgets[widgetID].wnd:setPosition(CEGUI.UVector2(CEGUI.UDim(x, 0), CEGUI.UDim(y, 0)))
   end
end

function getSaveIDByName(saveName)
   for saveID, save in pairs(gSavegames) do
      if save.name == saveName then
         return saveID
      end
   end
end

function getLastSaveID()
   local lastTime  = 0
   local lastIndex = 1

   for i=1,#gSavegames do
      if gSavegames[i].time > lastTime then
         lastTime  = gSavegames[i].time
         lastIndex = i
      end
   end
   return lastIndex
end

function loadSaveVersionCheck(saveID, quickload)
   if not saveID or not gSavegames[saveID] then return end
   local rootWnd = guiContext:getRootWindow()

   local versionDelta = versionInt - gSavegames[saveID].version

   --Debug mode allows you to load any old saves as they are
   if isDebug() and versionDelta > 0 then
      local wnd = warningMessage("This save's version is older than current. \nLoad anyway?")
      if not wnd then return end
      local function cbOkay()
         loadGameSafe(gSavegames[saveID].name)
      end
      GUIUtils.widgetSubscribeEventProtected(wnd:getChild("OkayButton"), "Clicked", cbOkay)

   --Users can't load saves made before previous update
   elseif versionDelta > 1 then
      warningMessage("This save's version is too old to be loaded. \nPlease, choose a newer one or start a new game.")

   --While loading a save from the previous update users can only load stuff optionally
   elseif versionDelta == 1 and not GUIUtils.getDynamicWindowSafe("OptionalLoading") then
      local wnd = wndMgr:loadLayoutFromFile("optional_loading.layout")
      rootWnd:addChild(wnd)
      wnd:activate()

      GUIUtils.setWindowInteractive(wnd, true, true)
      if not isMainMenu() then gameplayUI:setCursorVisible(true) end

      local function cbOptionalLoad()
         local options = {}
         for _,paramName in pairs({ "playerPosition", "level", "attributePoints", "inventory", "fastTravel" }) do
            local state = wnd:getChild(paramName .. "/Checkbox"):getProperty("Selected") == "true"
            options[paramName] = state
         end
         options.saveName = gSavegames[saveID].name

         addToPersistentTable("optionalLoading", options)
         commitPersistentTable()

         destroyDynamicWindow(wnd)

         changeLocation("\\levels\\WindscreamCanyon\\Windscream_Canyon.swz")
      end

      GUIUtils.translateWindowText(wnd:getChild("LoadButton"))
      GUIUtils.widgetSubscribeEventProtected(wnd:getChild("LoadButton"), "Clicked", cbOptionalLoad)

      --disable attribute points checkbox alongside the level checkbox
      local function cbLevelCheckboxChanged(args)
         local click_args = CEGUI.toMouseEventArgs(args)
         if click_args.button == CEGUI.LeftButton then
            local state = wnd:getChild("level/Checkbox"):getProperty("Selected") == "true"
            if not state then
               wnd:getChild("attributePoints/Checkbox"):setProperty("Selected", "false")
            end
            wnd:getChild("attributePoints/Checkbox"):setProperty("Disabled", tostring(not state))
         end
      end
      GUIUtils.widgetSubscribeEventProtected(wnd:getChild("level/Checkbox"), "MouseClick", cbLevelCheckboxChanged)

      local function cbCancel()
         destroyDynamicWindow(wnd)
      end

      GUIUtils.translateWindowText(wnd:getChild("CancelButton"))
      GUIUtils.widgetSubscribeEventProtected(wnd:getChild("CancelButton"), "Clicked", cbCancel)

      GUIUtils.widgetSubscribeEventProtected(wnd, "CloseClicked", cbCancel)

   --Loading during gameplay while Jack is alive will summon a confirmation window
   elseif not isMainMenu() and not quickload and getMC() and not getMC():getState("dead") then
      confirmMessage(rootWnd, function()
         loadGameSafe(gSavegames[saveID].name)
      end, nil, "Load this save")
   else
      loadGameSafe(gSavegames[saveID].name)
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
   if not name or not loadGame(name) then
      log(string.format("ERROR: Couldn't load game %s", tostring(name)))
   else
      addToPersistentTable("isLoadedGame", true)
      commitPersistentTable()
   end
end

function saveGameSafe(name)
   log(string.format("INFO: saving %s", tostring(name)))
   if not name or not saveGame(name) then
      log(string.format("ERROR: Couldn't save game %s", tostring(name)))
   end
end
