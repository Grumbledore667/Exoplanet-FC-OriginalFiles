local ItemsData    = require "itemsData"
local ItemsDataRecipes = require "ItemsDataRecipes"
local TemplateInfo = require "itemsTemplates"
local SkySystem = (require "environment.sky").SkySystem
local stringx   = require "pl.stringx"
local tablex    = require "pl.tablex"
local List      = require "pl.List"

local hlp = require "helpers"
local f = require "fun"
local partial = f.partial
local classManager = require "global.classManager"
local GUIUtils = require "ui.utils"
local deb = require "global.debug"

local wndMgr = CEGUI.WindowManager:getSingleton()

local console = {
   wnd = nil,
   ctrl = false,
}

local consoleCommands = {}
local commandHistory
local onCommandBoxChanged
local onAutocompleteSelection
local selectedAutocompleteItem
local historyScroll
local historyScrollID = 0
local autocompleteScrollID = 0
local autocompleteItemsList = {}
local COMMAND_HISTORY_LIMIT = 20

local ERROR_COLOR = "FFFF5500"
local CONLOG_OUTPUT_COLOR = "FFFFD800"

function console:init()
   local status, loadedHistory = deb.loadTableFromFile(getDocumentsFolder() .. "\\commandHistory.lua")
   if status then
      commandHistory = loadedHistory
   else
      commandHistory = {}
   end

   self.wnd = wndMgr:loadLayoutFromFile("console.layout")
   self.wnd:setVisible(false)
   self.history = self.wnd:getChild("History")
   self.autocompleteList = CEGUI.toListbox(self.wnd:getChild("AutocompleteList"))
   self.cmdBox = self.wnd:getChild("Command"):toEditbox()
   GUIUtils.widgetSubscribeEventProtected(self.cmdBox, "TextChanged", onCommandBoxChanged)
   GUIUtils.widgetSubscribeEventProtected(self.autocompleteList, "SelectionChanged", onAutocompleteSelection)
   self:setHistoryScrollState(false)

   if gameplayUI then
      GUIUtils.setWindowInteractive(self.wnd, true, true)
   end

   GUIUtils.widgetSubscribeEventProtected(self.wnd, "Hidden", partial(self.onHide, self))
end

function console:getWnd()
   return self.wnd
end

function console:onHide()
   if not isMainMenu() then gameplayUI:hideConsole() end
end

function console:setHistoryScrollState(state)
   historyScroll = state
   if state then
      self.autocompleteList:setAlpha(0.45)
   else
      self.autocompleteList:setAlpha(0.75)
   end
end

function console:setCVAR(value)
   self.CVAR = value
end

function console:getCVAR()
   return self.CVAR
end

local function resetHistoryScrollID()
   historyScrollID = 0
end

local function resetAutocompleteScrollID()
   autocompleteScrollID = 0
end

local function appendCommandToConsoleHistory(str)
   if commandHistory[#commandHistory] == str then return end
   if #commandHistory >= COMMAND_HISTORY_LIMIT then table.remove(commandHistory, 1) end
   table.insert(commandHistory, str)
   deb.dumpTableToFile(commandHistory, getDocumentsFolder() .. "\\commandHistory.lua", true)
   resetHistoryScrollID()
end

local function getHistoryCommandAtID(ID)
   return commandHistory[ID]
end

local function isConsoleCmd(cmd)
   for k in pairs(consoleCommands) do
      if string.lower(k) == string.lower(cmd) then
         return true
      end
   end
   return false
end

local function declareConsoleCommand(command)
   local mt = {}
   mt.__call = command.func
   local cmdFunctor = {meta = command}
   setmetatable(cmdFunctor, mt)
   consoleCommands[command.name] = cmdFunctor
   if command.shortName then
      consoleCommands[command.shortName] = cmdFunctor
   end
end

local function getMinArguments(cmd)
   local count = 0
   if cmd.meta.arguments then
      for _, argData in pairs(cmd.meta.arguments) do
         if not argData.optional then
            count = count + 1
         end
      end
   end
   return count
end

local function getMaxArguments(cmd)
   if cmd.meta.arguments then
      return #cmd.meta.arguments
   else
      return 0
   end
end

local function processSingleArgument(argument, meta)
   local result
   if meta.valueType == "string" then
      result = argument
   elseif meta.valueType == "number" then
      result = tonumber(argument)
      if meta.minValue then
         result = math.max(meta.minValue, result)
      end
      if meta.maxValue then
         result = math.min(meta.maxValue, result)
      end
   elseif meta.valueType == "bool" then
      if argument == "true" then
         result = true
      elseif argument == "false" then
         result = false
      end
   elseif meta.valueType == "objectName" then
      result = getObj(argument)
   end
   return result
end

local function processArguments(cmd, arguments)
   local minCount = getMinArguments(cmd)
   local maxCount = getMaxArguments(cmd)

   -- for commands with arguments
   if maxCount > 0 then
      -- too much arguments
      if #arguments > maxCount then
         return
      end

      -- not enough arguments
      if #arguments < minCount then
         return
      end
      -- set default values to optional parameters
      for _, argData in pairs(cmd.meta.arguments) do
         if argData.optional and argData.defaultValue ~= nil then
            cmd[argData.name] = argData.defaultValue
         end
      end
      for i,v in ipairs(arguments) do
         local arg = processSingleArgument(v, cmd.meta.arguments[i])
         -- incorrect argument
         if arg == nil then
            return
         end
         cmd[cmd.meta.arguments[i].name] = arg
      end
   end
end

local function cleanUpArguments(cmd)
   if getMaxArguments(cmd) > 0 then
      for _, argument in ipairs(cmd.meta.arguments) do
         cmd[argument.name] = nil
      end
   end
end

local function makeConsoleHistoryItem(text)
   local item = CEGUI.createListboxTextItem(text)
   local item_color = CEGUI.Colour:new_local(1.0,1.0,1.0,1.0)
   item:setFont("monospace-10")
   item:setTextColours(item_color)
   return item
end

--- appends text to console history
---@param text string
local function clog(text)
   local history = CEGUI.toListbox(console:getWnd():getChild("History"))
   local item = makeConsoleHistoryItem(text)
   history:addItem(item)
   local scroll = CEGUI.toScrollbar(console.history:getChild("__auto_vscrollbar__"))
   scroll:setScrollPosition(scroll:getDocumentSize() - scroll:getPageSize())
end

local function clogf(formatstring, ...)
   clog(string.format(formatstring, ...))
end

local function clogOut(text)
   clogf("[colour='%s']%s", CONLOG_OUTPUT_COLOR, string.gsub(text, "%[", "\\["))
end

local function clogOutf(formatstring, ...)
   clogOut(string.format(formatstring, ...))
end

local function clogError(text)
   clogf("[colour='%s']%s", ERROR_COLOR, string.gsub(text, "%[", "\\["))
end

local function clogErrorf(formatstring, ...)
   clogError(string.format(formatstring, ...))
end


local function executeConsoleCommand(commandString, arguments)
   local cmd = consoleCommands[commandString]
   cleanUpArguments(cmd)
   processArguments(cmd, arguments)
   local ok, err = pcall(cmd)
   if not ok then
      clogErrorf("ERROR: error during console command '%s' execution:\n  %s", commandString, err)
      return false
   else
      return cmd.meta.hidesConsole
   end
end

local function getAllLevels()
   local searchPath = "\\levels\\"

   local results = {}
   local function worker(path)
      for _,name in pairs(getFolderElements(path .. "*", true, true)) do
         if not stringx.endswith(name, ".swz") then
            worker(path .. name .. "\\")
         else
            table.insert(results, {path=path, filename=string.sub(name, 1, -5)})
         end
      end
   end

   worker(searchPath)
   return results
end

local function consoleWrapper(cmd, printResult)
   local chunk, err = loadstring(cmd, "console command")
   if not chunk then
      log("ERROR: incorrect Lua statement")
      log(err)
      log("   " .. cmd)
      clogErrorf("ERROR: incorrect Lua statement\n%s\n    %s", err, cmd)
      return
   end

   setfenv(chunk, setmetatable({CVAR=console.CVAR}, {__index=_G, __newindex=_G}))
   local values = table.pack(pcall(chunk))
   local status = table.remove(values, 1)
   values.n = values.n - 1
   if not status then
      err = values[1]
      log("ERROR: error during Lua statement execution")
      log(err)
      log("   " .. cmd)
      clogErrorf("ERROR: error during Lua statement execution\n%s\n   %s", err, cmd)
   elseif printResult then
      local inspect = require "inspect"
      local inspectOptions = require "global.debug".inspectOptions
      local inspectedResults = {}
      for i = 1, values.n do
         table.insert(inspectedResults, inspect(values[i], inspectOptions))
      end
      local concatenated = table.concat(inspectedResults, ', ')
      log(concatenated)
      clogOut(concatenated)
   end
end

local function processCommandString(cmd)
   local command
   local commandRaw, argumentsRaw = unpack(stringx.split(cmd, " ", 2))
   local arguments = {}
   for w in string.gfind(argumentsRaw or "", "[%w_.\\]+") do
      table.insert(arguments, w)
   end
   if commandRaw and console.isConsoleCmd(commandRaw) then
      command = commandRaw
   end
   return command, arguments
end

--- get command text from widget, process it and run either as a console command
--- or as a plain lua string.
---@return boolean @true if console should stay displayed
local function runConsoleCommand()
   local cmd = console.cmdBox:getText()
   if not cmd or cmd == "" then
      return
   end

   clog(string.gsub(cmd, "%[", "\\[")) -- console window history
   console.appendCommandToConsoleHistory(cmd) -- console internal history

   log("Console: " .. cmd)
   local command, arguments = processCommandString(cmd)
   local hidesConsole = false
   if command then
      hidesConsole = console.executeConsoleCommand(string.lower(command), arguments)
   else
      local printResult = false
      if stringx.startswith(cmd, '=') then
         printResult = true
         cmd = string.format("return %s", string.sub(cmd, 2))
      else
         clogOut("Command not found, executing as Lua statement")
      end
      consoleWrapper(cmd, printResult)
   end
   console.cmdBox:setText("")
   return not command or not hidesConsole
end

---------------------------------------------------
-- Autocompletion
---------------------------------------------------
local function findMatches(incomplete, entries, caseSensitive)
   local matches = {}
   for _, name in ipairs(entries) do
      if caseSensitive then
         if stringx.startswith(name, incomplete) then
            table.insert(matches, name)
         end
      else
         if stringx.startswith(string.lower(name), string.lower(incomplete)) then
            table.insert(matches, name)
         end
      end
   end
   return matches
end

local function findMatchesForCmd()
   local cmd = console.cmdBox:getText()
   local matches = {}
   local words = stringx.split(cmd)
   if #words == 1 then
      local incomplete = cmd
      local commandList = tablex.keys(consoleCommands)
      matches = findMatches(incomplete, commandList)
      return matches
   end

   local command, arguments = processCommandString(cmd)
   if not command or not arguments or #arguments == 0 then
      return matches
   end

   local incomplete = arguments[#arguments]
   local commandData = consoleCommands[command] and consoleCommands[command].meta
   if commandData and commandData.get_matches and #arguments == 1 then
      matches = findMatches(incomplete, commandData.get_matches())
   end
   return matches
end

local function compileAutoCompleteList(matches)
   selectedAutocompleteItem = nil
   resetAutocompleteScrollID()
   local listbox = console.autocompleteList
   listbox:resetList()
   autocompleteItemsList = {}

   local count = 0
   for _, text in tablex.sortv(matches) do
      count = count + 1
      local item = CEGUI.createListboxTextItem(text)
      item:setFont("monospace-10")
      item:setTextColours(CEGUI.Colour:new_local(1.0,1.0,1.0,1.0))
      listbox:addItem(item)
      table.insert(autocompleteItemsList, item)
      if count > 200 then break end
   end
   CEGUI.toScrollbar(console.autocompleteList:getChild("__auto_vscrollbar__")):setScrollPosition(0)
   local wndWidth = math.max(listbox:getWidestItemWidth()+40, 100)
   local wndHeight = math.max(listbox:getTotalItemsHeight()+40, 50)
   listbox:setWidth(CEGUI.UDim(0,wndWidth))
   listbox:setHeight(CEGUI.UDim(0,wndHeight))
end

local function autocompleteCmd(text)
   if not text then return end
   text = text:gsub("%[colour=.-%]", "")
   local cmd = console.cmdBox:getText()
   local words = stringx.split(cmd)
   local newCmd = ""
   if #words == 1 then
      newCmd = text
   else
      for i,word in ipairs(words) do
         if i == 1 then
            newCmd = word
         elseif i > 1 and i < #words then
            newCmd = newCmd .. " " .. word
         elseif i == #words then
            newCmd = newCmd .. " " .. text
         end
      end
   end
   console.cmdBox:setText(newCmd)
   console.cmdBox:setCaretIndex(newCmd:len())
   console.cmdBox:activate()
end

local function highlightAutocompleteItemAt(ID)
   local prevItem = autocompleteItemsList[ID-1]
   if prevItem then
      local text = prevItem:getText():gsub("%[colour=.-%]", "")
      prevItem:setText(text)
   end
   local item = autocompleteItemsList[ID]
   if item then
      local text = "[colour='FF34d4ec']" .. item:getText()
      item:setText(text)
   end
   selectedAutocompleteItem = item
   local nextItem = autocompleteItemsList[ID+1]
   if nextItem then
      local text = nextItem:getText():gsub("%[colour=.-%]", "")
      nextItem:setText(text)
   end
   console.autocompleteList:handleUpdatedItemData()
end

local function scrollAutocomplete(delta)
   autocompleteScrollID = math.min(console.autocompleteList:getItemCount(), math.max(0, autocompleteScrollID + delta))
   highlightAutocompleteItemAt(autocompleteScrollID)
end

local function scrollHistory(delta)
   historyScrollID = math.min(#commandHistory, math.max(0, historyScrollID + delta))
   local command = getHistoryCommandAtID(1 + #commandHistory - historyScrollID)
   if command then
      console.cmdBox:setText(command)
      console.cmdBox:setCaretIndex(#command)
   elseif historyScrollID == 0 then
      console.cmdBox:setText("")
   end
end

local function selectAutoCompleteItem()
   local cmd = selectedAutocompleteItem and selectedAutocompleteItem:getText()
   if cmd then
      autocompleteCmd(cmd)
      return true
   end
   return false
end

local function completeArgument(matches, caseSensitive)
   if #matches == 0 then return end
   -- find longest identical substring
   -- {
   --    "abb",
   --    "abcd",
   --    "abcdef",
   -- }
   -- in this case it's "ab"
   local function strToTable(s)
      local t = {}
      if not caseSensitive then
         s = string.lower(s)
      end
      for c in s:gmatch"." do
         table.insert(t, c)
      end
      return t
   end
   local matrix = tablex.zip(unpack(tablex.map(strToTable, matches)))
   -- the above transposes a table of strings {"abb","abcd","abcdef"} to
   -- a table of tables of characters {{'a','a','a'},{'b','b','b'},{'b','c','c'}}
   local index = 1
   -- find last index with equal characters in all matches
   for i, slice in ipairs(matrix) do
      -- are all of the characters in the table same?
      if List.count(slice, slice[1]) == #slice then
         index = i
      else
         break
      end
   end
   return string.sub(matches[1], 1, index)
end

function onAutocompleteSelection(args)
   autocompleteCmd(console.autocompleteList:getFirstSelectedItem():getText())
   console.autocompleteList:clearAllSelections()
end

function onCommandBoxChanged(args)
   local cmd = console.cmdBox:getText()
   if not cmd or cmd == "" then
      console.autocompleteList:setVisible(false)
      resetHistoryScrollID()
      return
   else
      console.autocompleteList:setVisible(true)
   end

   compileAutoCompleteList(findMatchesForCmd())
end

local function levenshtein(str1, str2)
   local len1 = string.len(str1)
   local len2 = string.len(str2)
   local matrix = {}
   local cost = 0

   -- quick cut-offs to save time
   if len1 == 0 then
      return len2
   elseif len2 == 0 then
      return len1
   elseif str1 == str2 then
      return 0
   end

   -- initialise the base matrix values
   for i = 0, len1, 1 do
      matrix[i] = {}
      matrix[i][0] = i
   end
   for j = 0, len2, 1 do
      matrix[0][j] = j
   end

   -- actual Levenshtein algorithm
   for i = 1, len1, 1 do
      for j = 1, len2, 1 do
         if str1:byte(i) == str2:byte(j) then
            cost = 0
         else
            cost = 1
         end

         matrix[i][j] = math.min(matrix[i-1][j] + 1, matrix[i][j-1] + 1, matrix[i-1][j-1] + cost)
      end
   end

   -- return the last value - this is the Levenshtein distance
   return matrix[len1][len2]
end

local function guessFullItemName(name)
   if ItemsData and type(name) == "string" then
      local extra = stringx.rpartition(name, '.')
      local permutations = {
         name,
         name .. ".gun",
         name .. ".wpn",
         name .. ".itm",
         name .. ".tmpl",
         extra .. ".gun",
         extra .. ".wpn",
         extra .. ".itm",
         extra .. ".tmpl",
      }

      for _, variant in ipairs(permutations) do
         if ItemsData.hasItemsInfo(variant) then
            return variant
         elseif ItemsData.getItemTemplate(variant) then
            return variant
         end
      end
   end
   return nil
end

local function getClosestItemNames(name, limit)
   limit = math.max(limit or 5, 1)
   local data1 = ItemsData.ItemsInfo
   local data2 = TemplateInfo
   local distances = {}
   for realName in pairs(data1) do
      local entry = {
         name = realName,
         distance = levenshtein(stringx.rpartition(name, '.'), stringx.rpartition(realName, '.')),
      }
      table.insert(distances, entry)
   end
   for realName in pairs(data2) do
      local entry = {
         name = realName,
         distance = levenshtein(stringx.rpartition(name, '.'), stringx.rpartition(realName, '.')),
      }
      table.insert(distances, entry)
   end

   local sortedTrimmedEntries = {}
   local i = 1
   for index in tablex.sortv(distances, function(v1, v2) return v1.distance < v2.distance end) do
      -- limit 5 entries
      if i > limit then
         break
      end
      table.insert(sortedTrimmedEntries, distances[index])
      i = i + 1
   end
   return sortedTrimmedEntries
end

local function guessFullItemNameEx(name, maxDistance)
   maxDistance = maxDistance or (math.ceil(#name / 4))

   local suggestions = getClosestItemNames(name, 1)
   for _, entry in ipairs(suggestions) do
      if entry.distance <= maxDistance then
         return entry.name
      end
   end
   return nil
end

local function cbConsoleCommandKeyDown(args)
   local keyArgs = CEGUI.toKeyEventArgs(args)

   if keyArgs.scancode == 15 then -- TAB
      autocompleteCmd(completeArgument(findMatchesForCmd()))
      return true
   elseif keyArgs.scancode == 29 then -- CTRL
      console.ctrl = true
      return true
   elseif keyArgs.scancode == 57 and keyArgs.sysKeys == 8 then -- SPACE+CTRL
      autocompleteCmd(completeArgument(findMatchesForCmd()))
      return true
   elseif keyArgs.scancode == 200 then -- UP
      if autocompleteScrollID == 0 then
         console:setHistoryScrollState(true)
      end
      if not historyScroll then -- CTRL
         scrollAutocomplete(-1)
      else
         scrollHistory(1)
      end
      return true
   elseif keyArgs.scancode == 208 then -- DOWN
      if not historyScroll then -- CTRL
         scrollAutocomplete(1)
      else
         scrollHistory(-1)
      end
      return true
   end

   console:setHistoryScrollState(false)

   return false
end

local function cbConsoleCommandKeyUp(args)
   local keyArgs = CEGUI.toKeyEventArgs(args)
   if keyArgs.scancode == 29 then -- CTRL
      console.ctrl = false
      return true
   end
   return false
end

local function cbConsoleMouseClick(args)
   args = args:toMouseEventArgs()
   local screenSize = getScreenSize()
   local x, y = args.position.x / screenSize.x, (screenSize.y - args.position.y) / screenSize.y
   local mouseCursorPosition = vec3New(x, y)
   local obj = raycastCharacterOnScreen(mouseCursorPosition, true)
   local isChar = true
   if not obj then
      isChar = false
      obj = raycastRigidOnScreen(mouseCursorPosition)
   end
   local name, class = hlp.getNameAndClass(obj)
   console:setCVAR(obj)
   if isChar then
      clogf("Stored in CVAR: character '%s', class '%s'", name, class)
   elseif obj then
      clogf("Stored in CVAR: rigid '%s', class '%s'", name, class)
   else
      clog("Stored in CVAR: nil")
   end
   return true
end

local function cbConsoleCharacter(args)
   local keyArgs = CEGUI.toKeyEventArgs(args)
   if string.char(keyArgs.codepoint) == ' ' and console.ctrl then -- CTRL+SPACE
      return true
   elseif string.char(keyArgs.codepoint) == '\t' then -- TAB
      return true
   end
   return false
end

local function isPlayerPresent()
   return getPlayer() ~= nil
end


declareConsoleCommand{
   name = "addexptoplayer",
   shortName = "exp",
   help = "Adds a specified amount of exp to player",
   arguments = {
      {name = "experienceCount", valueType = "number", valueMin = 1, valueMax = 10000, optional = true, defaultValue = 1, description = "How much exp to add"},
   },
   func = function(self)
      if isMainMenu() or not isPlayerPresent() then return end
      if self.experienceCount then
         getMC():addExp(self.experienceCount)
      end
   end,
}

declareConsoleCommand{
   name = "addlevelstoplayer",
   shortName = "lvl",
   help = "Adds a specified amount of levels to player",
   arguments = {
      {name = "lvlCount", valueType = "number", valueMin = 1, valueMax = 100, optional = true, defaultValue = 1, description = "How many levels to add"},
   },
   func = function(self)
      if isMainMenu() or not isPlayerPresent() then return end
      if self.lvlCount then
         runTimer(0, nil, function()
            getMC():addLevels(self.lvlCount)
         end, false)
      end
   end,
}

declareConsoleCommand{
   name = "date",
   help = "Logs the current date string from SkySystem",
   func = function(self)
      runTimer(0, nil, function()
         log(SkySystem:getDateString())
      end,false)
   end,
}

declareConsoleCommand{
   name = "fastforward",
   shortName = "ff",
   help = "Fast forwards time by hours and calls needed events",
   hidesConsole = true,
   arguments = {
      {name = "hours", valueType = "number", description = "How many hours to skip",},
   },
   func = function(self)
      runTimer(0, nil, function()
         SkySystem:fastForwardTime(hlp.CTime(self.hours, "gHour"))
      end,false)
   end,
}

declareConsoleCommand{
   name = "additemtoplayer",
   shortName = "aitp",
   help = "Adds a specified amount of items to player",
   arguments = {
      {name = "itemName", valueType = "string", description = "Item name e.g. meat.itm, machete.wpn etc",},
      {name = "itemCount", valueType = "number", valueMin = 1, valueMax = 10000, optional = true, defaultValue = 1, description = "How many items to add"},
      {name = "itemQuality", valueType = "number", defaultValue = nil, optional = true, description = "Quality of item"},
   },
   func = function(self)
      if isMainMenu() or not isPlayerPresent() then return end
      local name = guessFullItemName(self.itemName) or guessFullItemNameEx(self.itemName)
      if name and name ~= self.itemName then
         clogOutf("INFO: guessing item %s is really %s", tostring(self.itemName), name)
      end
      local item = addItemToPlayer(name, self.itemCount, self.itemQuality)
      if item and item.magazineMax then
         item.magazine = item.magazineMax
         for _, ammoItemName in pairs(item:getCompatibleAmmo()) do
            addItemToPlayer(ammoItemName, item.magazineMax)
         end
      end
      if not item then
         clogErrorf("ERROR: could not add item %s", tostring(self.itemName))
      end
   end,
   get_matches = function()
      return tablex.keys(tablex.merge(ItemsData.ItemsInfo, TemplateInfo, true))
   end
}

declareConsoleCommand{
   name = "addmoneytoplayer",
   shortName = "amtp",
   help = "Adds a specified amount of antigravium shards to player",
   arguments = {
      {name = "itemCount", valueType = "number", valueMin = 1, valueMax = 100000, description = "How much money to add"},
   },
   func = function(self)
      if isMainMenu() or not isPlayerPresent() then return end
      if self.itemCount then
         addItemToPlayer("antigravium_shards.itm", self.itemCount)
      end
   end,
}

declareConsoleCommand{
   name = "togglegodmode",
   shortName = "tgm",
   help = "toggles god mode on and off",
   func = function(self)
      if isMainMenu() or not isPlayerPresent() then return end
      getPlayer().god_mode = not getPlayer().god_mode
      gameplayUI.debugUI:setupDebugGui()
   end,
}

declareConsoleCommand{
   name = "togglesuperspeed",
   shortName = "tss",
   help = "toggles super speed on and off",
   func = function(self)
      if isMainMenu() or not isPlayerPresent() then return end
      getPlayer().super_speed = not getPlayer().super_speed
      gameplayUI.debugUI:setupDebugGui()
   end,
}

declareConsoleCommand{
   name = "quitgame",
   shortName = "qqq",
   help = "quits game instantly",
   func = function(self)
      exitGame()
   end,
}

declareConsoleCommand{
   name = "cheatinventory",
   shortName = "ci",
   help = "adds lots of items for debugging",
   arguments = {
      {name = "param", valueType = "string", optional = true, description = "To only add all versions of specified items"},
   },
   func = function(self)
      if isMainMenu() or not isPlayerPresent() then return end
      if self.param == "wpns" then
         for itemName in pairs(ItemsData.ItemsInfo) do
            if ItemsData.isItemWeapon(itemName) and itemName ~= "hand_to_hand.itm" and itemName ~= "abori_gun_mortar.gun" then
               for i=1,4 do
                  getMC():getInventory():addItem(itemName, 1, i)
               end
            end
         end
      elseif not self.param then
         getMC():obtainCheatInventory(nil)
      end
   end,
}

declareConsoleCommand{
   name = "cheatcontainer",
   shortName = "cc",
   help = "spawns a container with all weapons for debugging",
   func = function(self)
      if isMainMenu() or not isPlayerPresent() then return end
      local dir = getPlayer():getDir()
      local pos = getPlayer():getPose():getPos()
      pos = vec3Add(pos, vec3Mul({x=dir.x,y=0,z=dir.z},100))
      local container = hlp.safeCreateEntity("barrel_empty.sbg", "CContainer", {})
      container:setCollisionRaycast(false)
      container:setCollisionObjects(false)
      container:setCollisionCharacters(false, false)
      container:getPose():setPos(pos)
      for itemName in pairs(ItemsData.ItemsInfo) do
         if ItemsData.isItemWeapon(itemName) and itemName ~= "hand_to_hand.itm" and itemName ~= "abori_gun_mortar.gun" then
            for i=1,4 do
               container:getInventory():addItem(itemName, 1, i)
            end
         end
      end
   end,
}

declareConsoleCommand{
   name = "learnAllRecipes",
   shortName = "lar",
   help = "learns all crafting recipes",
   hidesConsole = true,
   func = function(self)
      if isMainMenu() or not isPlayerPresent() then return end
      for recipeName in pairs(ItemsDataRecipes.getComposeList()) do
         if not ItemsDataRecipes.isRecipeLearned(recipeName) then
            learnRecipe(recipeName, true)
         end
      end
   end,
}

declareConsoleCommand{
   name = "toggledebugmode",
   shortName = "tdm",
   help = "toggles debug features on and off",
   func = function(self)
      if isMainMenu() then return end
      setDebugMode(not isDebug())
      local txt
      if isDebug() then
         txt = "on"
      else
         txt = "off"
      end
      gameplayUI:showInfoTextEx("DEBUG mode " .. txt, "major", "")
      gameplayUI.debugUI:setupDebugGui()
   end,
}


declareConsoleCommand{
   name = "debugmodegui",
   shortName = "dmgui",
   help = "Shows a window with debug options",
   hidesConsole = true,
   func = function(self)
      if isMainMenu() then return end
      gameplayUI.debugUI:show(true)
   end,
}

declareConsoleCommand{
   name = "setdebugmode",
   help = "sets debug features on and off",
   arguments = {
      {name = "option", valueType = "string", description = "debug feature name"},
      {name = "value", valueType = "bool", optional = true, description = "true or false"},
   },
   func = function(self)
      if isMainMenu() then return end
      if self.option == nil then
         return
      end

      local txt
      if self.option == "true" then
         self.option = true
         txt = "on"
      elseif self.option == "false" then
         self.option = false
         txt = "off"
      else
         txt = self.option .. " " .. tostring(self.value)
      end
      setDebugMode(self.option, self.value)
      gameplayUI:showInfoTextEx("DEBUG mode " .. txt, "major", "")
   end,
}

declareConsoleCommand{
   name = "world",
   help = "loads a specified world",
   arguments = {
      {name = "name", valueType = "string", description = "level path without .swz e.g. blank or features_test\\CCloth",},
   },
   func = function(self)
      if self.name then
         commitPersistentTable()
         local levels = getAllLevels()
         for _, entry in ipairs(levels) do
            if entry.filename == self.name then
               changeLocation(string.format("%s%s.swz", entry.path, entry.filename))
               return
            end
         end
      end
   end,
   get_matches = function()
      local levels = getAllLevels()
      local levelNames = {}
      for _, entry in ipairs(levels) do
         table.insert(levelNames, entry.filename)
      end
      return levelNames
   end
}

declareConsoleCommand{
   name = "firequestevent",
   help = "sends a quest event",
   arguments = {
      {name = "eventName", valueType = "string", description = "event name",},
      {name = "targetName", valueType = "string", optional = true, description = "target object name",},
   },
   func = function(self)
      if isMainMenu() then return end
      questSystem:fireEvent(self.eventName, self.targetName, nil)
   end,
}

local function questNameMatches()
   local questNames = {}
   for name in pairs(quests or {}) do
      table.insert(questNames, name)
   end
   return questNames
end

declareConsoleCommand{
   name = "startquest",
   help = "starts a quest",
   arguments = {
      {name = "questName", valueType = "string", description = "quest name",},
   },
   func = function(self)
      if isMainMenu() then return end
      if not isQuestActive(self.questName) then
         local quest = getQuest(self.questName)
         if quest then
            quest:start()
         end
      end
   end,
   get_matches = questNameMatches,
}

declareConsoleCommand{
   name = "setquestparam",
   help = "changes value of a quest variable",
   arguments = {
      {name = "questName", valueType = "string", description = "quest name",},
      {name = "paramName", valueType = "string", description = "param name",},
      {name = "paramValue", valueType = "string", description = "param value",},
   },
   func = function(self)
      if isMainMenu() then return end
      if tonumber(self.paramValue) ~= nil then
         self.paramValue = tonumber(self.paramValue)
      elseif string.lower(self.paramValue) == "true" then
         self.paramValue = true
      elseif string.lower(self.paramValue) == "false" then
         self.paramValue = false
      end
      setQuestParam(self.questName, self.paramName, self.paramValue)
   end,
   get_matches = questNameMatches,
}

declareConsoleCommand{
   name = "setdialogparam",
   help = "changes value of a dialog variable",
   arguments = {
      {name = "dialogName", valueType = "string", description = "dialog name",},
      {name = "paramName", valueType = "string", description = "param name",},
      {name = "paramValue", valueType = "string", description = "param value",},
   },
   func = function(self)
      if isMainMenu() then return end
      if tonumber(self.paramValue) ~= nil then
         self.paramValue = tonumber(self.paramValue)
      elseif string.lower(self.paramValue) == "true" then
         self.paramValue = true
      elseif string.lower(self.paramValue) == "false" then
         self.paramValue = false
      end
      setDialogParam(self.dialogName, self.paramName, self.paramValue)
   end,
}

declareConsoleCommand{
   name = "setglobalparam",
   help = "changes value of a global variable",
   arguments = {
      {name = "paramName", valueType = "string", description = "param name",},
      {name = "paramValue", valueType = "string", description = "param value",},
   },
   func = function(self)
      if isMainMenu() then return end
      if tonumber(self.paramValue) ~= nil then
         self.paramValue = tonumber(self.paramValue)
      elseif string.lower(self.paramValue) == "true" then
         self.paramValue = true
      elseif string.lower(self.paramValue) == "false" then
         self.paramValue = false
      end
      setGlobalParam(self.paramName, self.paramValue)
   end,
}

declareConsoleCommand{
   name = "getglobalparam",
   help = "prints value of a global variable",
   arguments = {
      {name = "paramName", valueType = "string", description = "param name",},
   },
   func = function(self)
      if isMainMenu() then return end
      local param = tostring(getGlobalParam(self.paramName))
      log(param)
      clogOut(param)
   end,
}
declareConsoleCommand{
   name = "restart",
   help = "restarts current level",
   func = function(self)
      if isMainMenu() then return end
      reloadLocation()
   end,
}

declareConsoleCommand{
   name = "help",
   help = "lists commands",
   func = function(self)
      for k, v in pairs(consoleCommands) do
         if k ~= v.meta.shortName then
            local cmdString = v.meta.name
            if getMaxArguments(v) > 0 then
               for _, a in pairs(v.meta.arguments) do
                  if a.optional then
                     cmdString = cmdString .. " [" .. a.name .. "]"
                  else
                     cmdString = cmdString .. " " .. a.name
                  end
               end
            end

            clogOut(cmdString)
            if v.meta.shortName then
               clogOutf("  short name: %s", v.meta.shortName)
            end
            clogOutf("  %s", tostring(v.meta.help))
         end
      end
   end,
}

declareConsoleCommand{
   name = "showfps",
   help = "shows and hides fps counter",
   func = function(self)
      if isMainMenu() then return end
      gameplayUI.hudUI:showFPS(not gameplayUI.hudUI:isFPSVisible())
   end
}

declareConsoleCommand{
   name = "showtravelmenu",
   shortName = "ft",
   help = "show fast travel menu",
   hidesConsole = true,
   func = function(self)
      if isMainMenu() or not isPlayerPresent() then return end
      gameplayUI.travelUI:setupTravel()
   end
}

declareConsoleCommand{
   name = "fasterthanlight",
   shortName = "ftl",
   help = "activate all fast travel destinations",
   func = function (self)
      if isMainMenu() or not isPlayerPresent() then return end
      local t = getGlobalParam("fast_travel_destinations")
      if t then
         for k in pairs(t) do
            getObj(k):discover()
         end
         setGlobalParam("fast_travel_all_destinations_activated", true)
      end
   end
}

declareConsoleCommand{
   name = "fov",
   help = "sets field of view",
   arguments = {
      {name = "degrees", valueType = "number", valueMin = 1, valueMax = 200, optional = true, defaultValue = 75, description = "field of view degrees"},
   },
   func = function(self)
      if isMainMenu() then return end
      setDefaultPlayerCameraFov(self.degrees)
   end
}

declareConsoleCommand{
   name = "setstat",
   help = "change character's stat count",
   arguments = {
      {name = "objName", valueType = "string", description = "name of the object"},
      {name = "statName", valueType = "string", description = "name of the stat"},
      {name = "value", valueType = "number", description = "value to change the stat to"},
   },
   func = function(self)
      if self.objName and self.statName and self.value then
         local obj = getObj(self.objName)
         obj:setStatCount(self.statName, self.value)
      end
   end,
   get_matches = function()
      local objNames = {}
      for name in pairs(classManager.objTable) do
         table.insert(objNames, name)
      end
      return objNames
   end
}

declareConsoleCommand{
   name = "goto",
   help = "go to objects location",
   arguments = {
      {name = "objName", valueType = "string", optional = true, description = "name of the object"},
   },
   func = function(self)
      if isMainMenu() or not isPlayerPresent() then return end
      local p = getPlayer()
      if self.objName then
         local obj = getObj(self.objName)
         if obj and p then
            p:getPose():setPos(obj:getPose():getPos())
         end
      else
         local rigid = raycastRigidOnScreen({x=0.5,y=0.5})
         if rigid then
            local pos = rigid:getPose():getPos()
            p:getPose():setPos(pos)
         end
      end
   end,
   get_matches = function()
      local objNames = {}
      for name in pairs(classManager.objTable) do
         table.insert(objNames, name)
      end
      return objNames
   end
}

declareConsoleCommand{
   name = "kill",
   help = "kills character object stored in CVAR instantly",
   func = function(self)
      if isMainMenu() or not isPlayerPresent() then return end
      ---@type CCharacter | CNPC
      local obj = console:getCVAR()
      if hlp.isOperable(obj) and hlp.isCharacter(obj) then
         local name = obj:getDescriptiveName()
         local message = string.format("Killing %s", name)
         clog(message)
         log(message)
         obj:die()
      end
   end,
}

declareConsoleCommand{
   name = "resetai",
   help = "resets ai behavior tree of the character stored in CVAR",
   func = function(self)
      if isMainMenu() or not isPlayerPresent() then return end
      ---@type CCharacter | CNPC
      local obj = console:getCVAR()
      if hlp.isOperable(obj) and hlp.isCharacter(obj) and obj.BT then
         local name = obj:getDescriptiveName()
         local message = string.format("Reset ai of %s", name)
         clog(message)
         log(message)
         obj.BT:reset()
      end
   end,
}

declareConsoleCommand {
   name = "setgamespeed",
   shortName = "sgs",
   help = "sets game speed",
   arguments = {
      {name = "multiplier", valueType = "number", optional = true, defaultValue = 1, description = "ticks per frame"},
   },
   func = function(self)
      if isMainMenu() then return end
      if getGameSpeed() == 1 and self.multiplier == 1 then
         setGameSpeed(5)
      else
         setGameSpeed(self.multiplier)
      end
   end
}

declareConsoleCommand{
   name = "setneed",
   help = "sets player need",
   arguments = {
      {name = "need", valueType = "string", description = "name of the stat need to change e.g. food, water, sleep"},
      {name = "amount", valueType = "number", description = "value to change the stat to"},
   },
   func = function(self)
      if isMainMenu() or not isPlayerPresent() then return end
      local p = getMC()
      if p and self.amount and self.amount >= 0 then
         local methods = {
            food = p.setFoodCount,
            water = p.setWaterCount,
            sleep = p.setSleepCount,
         }
         if methods[self.need] then
            methods[self.need](p, self.amount)
         end
      end
   end
}

local function padString(s, padding)
   return string.rep(' ', padding) .. s
end

local taid_running = function() return false end
declareConsoleCommand {
   name = "turnonaidebuginfo",
   shortName = "taid",
   help = "shows focused character's last ai tick execution history as an onscreen widget (BTree only)",
   func = function(self)
      if isMainMenu() or taid_running() then
         return
      end
      local NodeState = require "ai.NodeState"
      local tags = {
         [NodeState.SUCCESS] = "[colour='FF00FF00']",
         [NodeState.FAILURE] = "[colour='FFFF0000']",
         [NodeState.RUNNING] = "[colour='FFFFFF00']",
      }
      local function isCorrectCharacter(char)
         if char and hlp.isCharacter(char) and char.BT and char.BT.history then
            return true
         else
            return false
         end
      end
      local CVAR = console:getCVAR()
      local CVARChar = isCorrectCharacter(CVAR) and CVAR
      taid_running = debugwidget(function()
         local char = CVARChar
         if not isCorrectCharacter(char) then
            char = raycastCharacterOnScreen(vec3New{x=0.5, y=0.5}, false)
         end
         if isCorrectCharacter(char) then
            local nodes = {}
            local template = "[colour='FFFFFFFF']%s %s => %s%s"
            local history = char.BT.history
            local maxClassName = 1
            local maxName = 1
            for _, item in ipairs(history) do
               maxClassName = math.max(#item.className + item._indent, maxClassName)
               maxName = math.max(#item.name, maxName)
            end
            for _, item in ipairs(history) do
               local indent = item._indent
               local className = item.className
               if item.guard then
                  className = '{'..className..'}'
               end
               className = stringx.ljust(padString(className, indent), maxClassName+2)
               local name = stringx.ljust(item.name, maxName)
               table.insert(nodes, string.format(template, className, name, tags[item.status], item.status[1]))
            end
            return table.concat(nodes, '\n')
         end
         return "no char"
      end)
   end
}

if ItemsData then
   declareConsoleCommand{
      name = "addhats",
      help = "add hats to inventory",
      func = function(self)
         if isMainMenu() or not isPlayerPresent() then return end
         local player = getMC()
         if player then
            for name, info in pairs(ItemsData.ItemsInfo) do
               if info.attireType and info.attireType == "hat" then
                  player:getInventory():addItem(name, 1)
               end
            end
         end
      end
   }
end

declareConsoleCommand{
   name = "test",
   help = "testing stuff",
   hidesConsole = true,
   arguments = {
      {name = "testName", valueType = "string", description = "filename of the test in modules/tests directory"},
   },
   func = function(self)
      if isMainMenu() or not self.testName then return end
      local path
      if stringx.endswith(self.testName, ".lua") then
         path = "./gdata/scripts/modules/tests/" .. self.testName
      else
         path = "./gdata/scripts/modules/tests/" .. self.testName .. ".lua"
      end
      runTimerAdv(0, false, dofile, path)
   end,
   get_matches = function()
      return getFolderElements("./gdata/scripts/modules/tests/*.lua", false, true)
   end
}

declareConsoleCommand{
   name = "testrunner",
   help = "batch tests",
   hidesConsole = true,
   arguments = {
      {name = "testSet", valueType = "string", optional = true, defaultValue = "all", description = "choose test set to run: minimal, debug or all"},
   },
   func = function(self)
      if isMainMenu() or not isPlayerPresent() then return end
      local runner = require "testRunner"
      runner(self.testSet)
   end,
   get_matches = function()
      return {"minimal", "debug", "all"}
   end
}

declareConsoleCommand {
   name = "resetdialog",
   help = "resets dialog first time flags",
   arguments = {
      {name = "name", valueType = "string", description = "dialog unique name (ex: zak_zak)"},
   },
   func = function(self)
      if isMainMenu() then return end
      if not self.name then
         local obj = gameplayUI:getFocusObj()
         if obj and hlp.isCharacter(obj) then
            local name = obj:getName()
            local dialogName = loadParam(obj, "dialog", "")
            if name ~= "" and dialogName ~= "" then
               self.name = name .. '_' .. dialogName
            end
         end
      end
      if self.name then
         local allDialogData = getDialogParams()
         if allDialogData[self.name] then
            allDialogData[self.name] = {}
         end
      end
   end
}

console.appendCommandToConsoleHistory = appendCommandToConsoleHistory
console.resetHistoryScrollID = resetHistoryScrollID
console.selectAutoCompleteItem = selectAutoCompleteItem
console.conLog = clog
console.isConsoleCmd = isConsoleCmd
console.executeConsoleCommand = executeConsoleCommand
console.runConsoleCommand = runConsoleCommand
console.cbConsoleCommandKeyDown = cbConsoleCommandKeyDown
console.cbConsoleCommandKeyUp = cbConsoleCommandKeyUp
console.cbConsoleCharacter = cbConsoleCharacter
console.cbConsoleMouseClick = cbConsoleMouseClick

return console
