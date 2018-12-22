-- optionally load ItemsData
-- this if for main menu, as it doesn't know about script modules locations yet
-- it's a copy of the one in globalFunctions, without loud option so as to not require
-- any additional modules here
local function loadrequire(module)
   local function requiref()
      return require(module)
   end
   local function noerror(code)
      -- TPrint("lol")
   end
   -- use xpcall with a nil instead of error handling function
   -- to suppress missing module error message in the log
   local res, err = xpcall(requiref, nil)
   if res then
      return err
   else
      return nil
   end
end

local ItemsData = require "itemsData"
local stringx   = require "pl.stringx"
local tablex    = require "pl.tablex"
local List      = require "pl.List"

local wndMgr = CEGUI.WindowManager:getSingleton()

local console = {
   wnd = nil,
   ctrl = false,
}

local consoleCommands = {}
local commandHistory = {}

function console:init()
   self.wnd = wndMgr:loadLayoutFromFile( "console.layout" )
end

function console:getWnd()
   return self.wnd
end

local function appendCommandToConsoleHistory(str)
   table.insert(commandHistory, str)
end

local function getLastConsoleCommand()
   return commandHistory[#commandHistory]
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

local function executeConsoleCommand(cmd, arguments)
   cmd = consoleCommands[cmd]
   cleanUpArguments(cmd)
   processArguments(cmd, arguments)
   cmd()
end

local function getAllLevels()
   local searchPath = "\\levels\\"

   local results = {}
   local function worker(path)
      for _,name in pairs(getFolderElements(path .. "*", true, true)) do
         if not stringx.endswith(name, ".swz") then
            worker(path .. name .. "\\")
         else
            table.insert(results, {path=path, filename=name})
         end
      end
   end

   worker(searchPath)
   return results
end

local function makeConsoleHistoryItem(text)
   local item = CEGUI.createListboxTextItem(text)
   local item_color = CEGUI.Colour:new_local(1.0,1.0,1.0,1.0)
   item:setFont( "monospace-10" )
   item:setTextColours( item_color )
   return item
end

local function appendLineToConsoleHistory(text)
   local history = CEGUI.toListbox( console:getWnd():getChild( "History" ) )
   local item = makeConsoleHistoryItem(text)
   history:addItem(item)
   local scroll = CEGUI.toScrollbar( console:getWnd():getChild("History"):getChild("__auto_vscrollbar__") )
   scroll:setScrollPosition(scroll:getDocumentSize() - scroll:getPageSize())
end

local conLog = appendLineToConsoleHistory

local function consoleWrapper(cmd)
   local chunk, err = loadstring(cmd, "console command")
   if not chunk then
      log("ERROR: incorrect Lua statement")
      log(err)
      log("   " .. cmd)
      conLog("ERROR: incorrect Lua statement")
      conLog(err)
      conLog("   " .. cmd)
      return
   end

   local status
   status, err = pcall(chunk)
   if not status then
      log("ERROR: error during Lua statement execution")
      log(err)
      log("   " .. cmd)
      conLog("ERROR: error during Lua statement execution")
      conLog(err)
      conLog("   " .. cmd)
   end
end

local function processCommandString(cmd)
   local command, arguments
   local args = {}
   for w in string.gfind(cmd, "[%w_.\\]+") do
      table.insert(args, w)
   end
   if args[1] and console.isConsoleCmd(args[1]) then
      command = args[1]
      arguments = {}
      for i = 2, #args do
         arguments[i-1] = args[i]
      end
   end
   return command, arguments
end

local function runConsoleCommand()
   local cmd = console:getWnd():getChild("Command"):getText()
   if not cmd or cmd == "" then
      return
   end

   conLog(cmd) -- console window history
   console.appendCommandToConsoleHistory(cmd) -- console internal history

   if isEditor() then
      log(cmd)
   end
   local command, arguments = processCommandString(cmd)
   if command then
      console.executeConsoleCommand(string.lower(command), arguments)
   else
      conLog("ERROR: Could not find command \"" .. cmd .. "\"")
      conLog("   trying to execute as Lua statement")
      consoleWrapper(cmd)
   end
end

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

local function completeArgument(matches, caseSensitive)
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

local function buildCmd(command, arguments, finalArg)
   local commandWnd = CEGUI.toEditbox(console:getWnd():getChild("Command"))
   local tmp = command
   arguments = arguments or {}

   for i=1, #arguments - 1 do
      tmp = tmp .. " " .. arguments[i]
   end
   tmp = tmp .. " " .. finalArg

   if #arguments == 0 then -- command autocomplete
      tmp = finalArg
   end
   commandWnd:setText(tmp)
   commandWnd:setCaretIndex(#tmp)
end

local function autocompleteHelper(command, arguments, matches, message)
   if #matches == 1 then
      buildCmd(command, arguments, matches[1])
   elseif #matches > 1 then
      buildCmd(command, arguments, completeArgument(matches))
      conLog(message)
      for _, name in ipairs(matches) do
         conLog(" " .. name)
      end
   end
end

local function handleTabCompletion()
   local commandWnd = CEGUI.toEditbox(console:getWnd():getChild("Command"))
   local cmd = commandWnd:getText()
   if not cmd or cmd == "" then
      return
   end

   local command, arguments = processCommandString(cmd)
   if not command and cmd then
      local incomplete = cmd
      local commandList = tablex.keys(consoleCommands)
      local matches = findMatches(incomplete, commandList)
      autocompleteHelper(cmd, arguments, matches, "command name suggestions:")
      return
   end
   if not command or not arguments or #arguments == 0 then
      return
   end

   if command == "world" then
      local incomplete = arguments[#arguments]
      local levels = getAllLevels()
      local levelNames = {}
      for _, entry in ipairs(levels) do
         table.insert(levelNames, entry.filename)
      end
      local matches = findMatches(incomplete, levelNames)
      autocompleteHelper(command, arguments, matches, "level name suggestions:")

   elseif tablex.find({"aitp", "additemtoplayer"}, command) ~= nil then
      local incomplete = arguments[#arguments]
      local items = tablex.keys(ItemsData.ItemsInfo)
      local matches = findMatches(incomplete, items)

      autocompleteHelper(command, arguments, matches, "item name suggestions:")
   end
end

local cmdAddExpToPlayer = {
   name = "addexptoplayer",
   shortName = "exp",
   help = "Adds a specified amount of exp to player",
   arguments = {
      {name = "experienceCount", valueType = "number", valueMin = 1, valueMax = 10000, optional = true, defaultValue = 1, description = "How much exp to add"},
   },
   func = function(self)
      if self.experienceCount then
         getPlayer():addExp( self.experienceCount )
      end
   end,
}
declareConsoleCommand(cmdAddExpToPlayer)

local cmdAddLevelsToPlayer = {
   name = "addlevelstoplayer",
   shortName = "lvl",
   help = "Adds a specified amount of levels to player",
   arguments = {
      {name = "lvlCount", valueType = "number", valueMin = 1, valueMax = 100, optional = true, defaultValue = 1, description = "How many levels to add"},
   },
   func = function(self)
      if self.lvlCount then
         getPlayer():addLevels( self.lvlCount )
      end
   end,
}
declareConsoleCommand(cmdAddLevelsToPlayer)

local function levenshtein(str1, str2)
   local len1 = string.len(str1)
   local len2 = string.len(str2)
   local matrix = {}
   local cost = 0

   -- quick cut-offs to save time
   if (len1 == 0) then
      return len2
   elseif (len2 == 0) then
      return len1
   elseif (str1 == str2) then
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
         if (str1:byte(i) == str2:byte(j)) then
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
         extra .. ".gun",
         extra .. ".wpn",
         extra .. ".itm",
      }

      for _, variant in ipairs( permutations ) do
         if ItemsData.hasItemsInfo(variant) then
            return variant
         end
      end
   end
   return nil
end

local function getClosestItemNames(name, limit)
   limit = math.max(limit or 5, 1)
   local data = ItemsData.ItemsInfo
   local distances = {}
   for realName in pairs(data) do
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
   for _, entry in ipairs( suggestions ) do
      if entry.distance <= maxDistance then
         return entry.name
      end
   end
   return nil
end

local function cbConsoleCommandKeyDown( args )
   local keyArgs = CEGUI.toKeyEventArgs( args )
   local cmd = CEGUI.toEditbox(console:getWnd():getChild("Command"))
   local caretPos = cmd:getCaretIndex()

   if ( keyArgs.scancode == 15) then -- TAB
      handleTabCompletion()
      return true
   elseif ( keyArgs.scancode == 29) then -- CTRL
      console.ctrl = true
      return true
   elseif ( keyArgs.scancode == 57 and keyArgs.sysKeys == 8) then -- CTRL+SPACE
      handleTabCompletion()
      return true
   elseif ( keyArgs.scancode == 72) then -- UP
      local lastCmd = console.getLastConsoleCommand()
      if lastCmd then
         cmd:setText(lastCmd)
         cmd:setCaretIndex(#lastCmd)
      end
      return true
   elseif ( keyArgs.scancode == 75) then -- LEFT
      if caretPos > 0 then
         cmd:setCaretIndex(caretPos - 1)
      end
      return true
   elseif ( keyArgs.scancode == 77) then -- RIGHT
      cmd:setCaretIndex(caretPos + 1)
      return true
   elseif ( keyArgs.scancode == 71) then -- HOME
      cmd:setCaretIndex(0)
      return true
   elseif ( keyArgs.scancode == 79) then -- END
      cmd:setCaretIndex(#(cmd:getText()))
      return true
   elseif ( keyArgs.scancode == 83) then -- DELETE
      local txt = cmd:getText()
      local index = caretPos + 1
      cmd:setText(string.sub(txt, 1, index-1) .. string.sub(txt, index+1))
      return true
   end
   return false
end

local function cbConsoleCommandKeyUp( args )
   local keyArgs = CEGUI.toKeyEventArgs( args )
   if keyArgs.scancode == 29 then -- CTRL
      console.ctrl = false
      return true
   end
   return false
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

local cmdAddItemsToPlayer = {
   name = "additemtoplayer",
   shortName = "aitp",
   help = "Adds a specified amount of items to player",
   arguments = {
      {name = "itemName", valueType = "string", description = "Item name e.g. meat.itm, machete.wpn etc",},
      {name = "itemCount", valueType = "number", valueMin = 1, valueMax = 10000, optional = true, defaultValue = 1, description = "How many items to add"},
   },
   func = function(self)
      local name = guessFullItemName(self.itemName) or guessFullItemNameEx(self.itemName)
      if name and name ~= self.itemName then
         conLog("INFO: guessing item " .. tostring(self.itemName) .. " is really " .. name)
      end
      local item = addItemsToPlayer(name, self.itemCount)
      if not item then
         conLog("ERROR: could not add item " .. tostring(self.itemName))
         conLog("  items with similar names:")
         for _, entry in ipairs(getClosestItemNames(self.itemName)) do
            conLog("    " .. tostring(entry.name))
         end
      end
   end,
}
declareConsoleCommand(cmdAddItemsToPlayer)

local cmdAddMoneyToPlayer = {
   name = "addmoneytoplayer",
   shortName = "amtp",
   help = "Adds a specified amount of antigravium shards to player",
   arguments = {
      {name = "itemCount", valueType = "number", valueMin = 1, valueMax = 100000, description = "How much money to add"},
   },
   func = function(self)
      if self.itemCount then
         addItemsToPlayer("antigravium_shards.itm", self.itemCount)
      end
   end,
}
declareConsoleCommand(cmdAddMoneyToPlayer)

local cmdToggleGodMode = {
   name = "togglegodmode",
   shortName = "tgm",
   help = "toggles god mode on and off",
   func = function(self)
      getPlayer().god_mode = not getPlayer().god_mode
      gameplayUI:setupDebugGui()
   end,
}
declareConsoleCommand(cmdToggleGodMode)

local cmdToggleSuperSpeed = {
   name = "togglesuperspeed",
   shortName = "tss",
   help = "toggles super speed on and off",
   func = function(self)
      getPlayer().super_speed = not getPlayer().super_speed
      gameplayUI:setupDebugGui()
   end,
}
declareConsoleCommand(cmdToggleSuperSpeed)

local cmdQuitGame = {
   name = "quitgame",
   shortName = "qqq",
   help = "quits game instantly",
   func = function(self)
      exitGame()
   end,
}
declareConsoleCommand(cmdQuitGame)

local cmdCheatInventory = {
   name = "cheatinventory",
   shortName = "ci",
   help = "adds lots of items for debugging",
   func = function(self)
      getPlayer():obtainCheatInventory()
   end,
}
declareConsoleCommand(cmdCheatInventory)

local cmdToggleDebugMode = {
   name = "toggledebugmode",
   shortName = "tdm",
   help = "toggles debug features on and off",
   func = function(self)
      setDebugMode(not isDebug())
      local txt
      if isDebug() then
         txt = "on"
      else
         txt = "off"
      end
      gameplayUI:showInfoTextEx("DEBUG mode " .. txt, "major", "")
      gameplayUI:setupDebugGui()
   end,
}
declareConsoleCommand(cmdToggleDebugMode)


local cmdDebugModeGui = {
   name = "debugmodegui",
   shortName = "dmgui",
   help = "Shows a window with debug options",
   func = function(self)
      gameplayUI:showDebugGui(true)
   end,
}
declareConsoleCommand(cmdDebugModeGui)

declareConsoleCommand({
   name = "setdebugmode",
   help = "sets debug features on and off",
   arguments = {
      {name = "option", valueType = "string", description = "debug feature name"},
      {name = "value", valueType = "bool", optional = true, description = "true or false"},
   },
   func = function(self)
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
})

local cmdWorld = {
   name = "world",
   help = "loads a specified world",
   arguments = {
      {name = "name", valueType = "string", description = "level path without .swz e.g. blank or features_test\\CCloth",},
   },
   func = function(self)
      if self.name then
         local levels = getAllLevels()
         for _, entry in ipairs(levels) do
            if entry.filename == self.name then
               changeLocation( entry.path .. entry.filename )
               return
            end
         end
         for _, entry in ipairs(levels) do
            if string.find( entry.filename, self.name ) then
               changeLocation( entry.path .. entry.filename )
            end
         end
      end
   end,
}
declareConsoleCommand(cmdWorld)

local cmdFireQuestEvent = {
   name = "firequestevent",
   help = "sends a quest event",
   arguments = {
      {name = "eventName", valueType = "string", description = "event name",},
      {name = "targetName", valueType = "string", optional = true, description = "target object name",},
   },
   func = function(self)
      questSystem:fireEvent(self.eventName, self.targetName, nil)
   end,
}
declareConsoleCommand(cmdFireQuestEvent)

local cmdStartQuest = {
   name = "startquest",
   help = "starts a quest",
   arguments = {
      {name = "questName", valueType = "string", description = "quest name",},
   },
   func = function(self)
      if not isQuestActive(self.questName) then
         local quest = getQuest(self.questName)
         if quest then
            quest:start()
         end
      end
   end,
}
declareConsoleCommand(cmdStartQuest)

local cmdSetQuestParam = {
   name = "setquestparam",
   help = "changes value of a quest variable",
   arguments = {
      {name = "questName", valueType = "string", description = "quest name",},
      {name = "paramName", valueType = "string", description = "param name",},
      {name = "paramValue", valueType = "string", description = "param value",},
   },
   func = function(self)
      if tonumber(self.paramValue) ~= nil then
         self.paramValue = tonumber(self.paramValue)
      elseif string.lower(self.paramValue) == "true" then
         self.paramValue = true
      elseif string.lower(self.paramValue) == "false" then
         self.paramValue = false
      end
      setQuestParam(self.questName, self.paramName, self.paramValue)
   end,
}
declareConsoleCommand(cmdSetQuestParam)

local cmdSetDialogParam = {
   name = "setdialogparam",
   help = "changes value of a dialog variable",
   arguments = {
      {name = "dialogName", valueType = "string", description = "dialog name",},
      {name = "paramName", valueType = "string", description = "param name",},
      {name = "paramValue", valueType = "string", description = "param value",},
   },
   func = function(self)
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
declareConsoleCommand(cmdSetDialogParam)

local cmdSetGlobalParam = {
   name = "setglobalparam",
   help = "changes value of a global variable",
   arguments = {
      {name = "paramName", valueType = "string", description = "param name",},
      {name = "paramValue", valueType = "string", description = "param value",},
   },
   func = function(self)
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
declareConsoleCommand(cmdSetGlobalParam)

declareConsoleCommand{
   name = "getglobalparam",
   help = "prints value of a global variable",
   arguments = {
      {name = "paramName", valueType = "string", description = "param name",},
   },
   func = function(self)
      local param = tostring(getGlobalParam(self.paramName))
      log(param)
      conLog(param)
   end,
}
declareConsoleCommand{
   name = "restart",
   help = "restarts current level",
   func = function(self)
      reloadLocation()
   end,
}

local cmdHelp = {
   name = "help",
   help = "lists commands",
   func = function(self)
      for k, v in pairs(consoleCommands) do
         if k ~= v.meta.shortName then
            local cmdString = v.meta.name
            if getMaxArguments(v) > 0 then
               for _, a in pairs(v.meta.arguments) do
                  if a.optional then
                     cmdString = cmdString .. " \\[" .. a.name .. "]"
                  else
                     cmdString = cmdString .. " " .. a.name
                  end
               end
            end

            conLog(cmdString)
            if v.meta.shortName then
               conLog("   short name: " .. v.meta.shortName)
            end
            conLog("  " .. v.meta.help)
         end
      end
   end,
}
declareConsoleCommand(cmdHelp)

declareConsoleCommand({
   name = "showfps",
   help = "shows and hides fps counter",
   func = function(self)
      if gameplayUI:isFPSVisible() then
         gameplayUI:hideFPS()
      else
         gameplayUI:showFPS()
      end
   end
})

declareConsoleCommand({
   name = "showtravelmenu",
   shortName = "ft",
   help = "show fast travel menu",
   func = function(self)
      gameplayUI:setupTravel()
   end
})

declareConsoleCommand({
   name = "fasterthanlight",
   shortName = "ftl",
   help = "activate all fast travel destinations",
   func = function (self)
      local t = getGlobalParam("fast_travel_destinations")
      if t then
         for k in pairs(t) do
            getObj(k):register(true)
         end
         setGlobalParam("fast_travel_all_destinations_activated", true)
      end
   end
})

declareConsoleCommand({
   name = "fov",
   help = "sets field of view",
   arguments = {
      {name = "degrees", valueType = "number", valueMin = 1, valueMax = 200, optional = true, defaultValue = 75, description = "field of view degrees"},
   },
   func = function(self)
      setDefaultPlayerCameraFov(self.degrees)
   end
})

declareConsoleCommand({
   name = "goto",
   help = "go to objects location",
   arguments = {
      {name = "objName", valueType = "string", description = "name of the object"},
   },
   func = function(self)
      local obj = getObj(self.objName)
      local p = getPlayer()
      if obj and p then
         p:getPose():setPos(obj:getPose():getPos())
      end
   end
})

declareConsoleCommand({
   name = "setneed",
   help = "sets player need",
   arguments = {
      {name = "need", valueType = "string", description = "name of the stat need to change e.g. food, water, sleep"},
      {name = "amount", valueType = "number", description = "value to change the stat to"},
   },
   func = function(self)
      local p = getPlayer()
      if p and self.amount and self.amount >= 0 then
         local methods = {
            food  = p.setFoodCount,
            water = p.setWaterCount,
            sleep = p.setSleepCount,
         }
         if methods[self.need] then
            methods[self.need](p, self.amount)
         end
      end
   end
})

if ItemsData then
   declareConsoleCommand({
      name = "addhats",
      help = "add hats to inventory",
      func = function(self)
         local p = getPlayer()
         if p then
            for name, info in pairs( ItemsData.ItemsInfo ) do
               if info.attireType and info.attireType == "hat" then
                  p:obtainItem(name, 1)
               end
            end
         end
      end
   })
end

-- TODO:FIXME: use __story_data.(globals/quests/dialogs) global var to reset the flags
declareConsoleCommand({
   name = "resetdialog",
   help = "resets dialog first time flags",
   arguments = {
      {name = "name", valueType = "string", description = "dialog unique name (ex: zak_zak)"},
   },
   func = function(self)
      local hlp = require "helpers"
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
         if not _G.__story_data then
            _G.__story_data = {}
         end
         if not _G.__story_data.dialogs then
            _G.__story_data.dialogs = {}
         end
         _G.__story_data.dialogs[self.name] = {}
      end
   end
})

console.appendCommandToConsoleHistory = appendCommandToConsoleHistory
console.conLog = conLog
console.getLastConsoleCommand = getLastConsoleCommand
console.isConsoleCmd = isConsoleCmd
console.executeConsoleCommand = executeConsoleCommand
console.runConsoleCommand = runConsoleCommand
console.cbConsoleCommandKeyDown = cbConsoleCommandKeyDown
console.cbConsoleCommandKeyUp = cbConsoleCommandKeyUp
console.cbConsoleCharacter = cbConsoleCharacter

return console
