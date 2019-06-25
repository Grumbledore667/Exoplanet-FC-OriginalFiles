local tablex = require "pl.tablex"
local keyCodes = require "global.keyScanCodes"
local deb = require "global.debug"

local KEYSMAP_VERSION = 1

local keys = {}

local keysMap = {
   --MOVEMENT
   FORWARD            = {default = 17}, --PC_W
   BACK               = {default = 31}, --PC_S
   LEFT               = {default = 30}, --PC_A
   RIGHT              = {default = 32}, --PC_D
   SPRINT             = {default = 42}, --PC_LSHIFT
   WALK               = {default = 56}, --PC_LALT
   JUMP               = {default = 57}, --PC_SPACE

   --GAMEPLAY
   ATTACK             = {default = 238},  --PC L_MOUSE
   AIM                = {default = 240},  --PC R_MOUSE
   RELOAD             = {default = 19}, --PC_R
   ACTIVATE           = {default = 18}, --PC_E
   HOLSTER            = {default = 35}, --PC_H
   PREVIOUS           = {default = 44}, --PC_Z

   --HOTBAR
   HOTBARQ            = {default = 16}, --PC_Q
   HOTBAR1            = {default = 2}, --1
   HOTBAR2            = {default = 3}, --2
   HOTBAR3            = {default = 4}, --3
   HOTBAR4            = {default = 5}, --4
   HOTBAR5            = {default = 6}, --5
   HOTBAR6            = {default = 7}, --6
   HOTBAR7            = {default = 8}, --7
   HOTBAR8            = {default = 9}, --8
   HOTBAR9            = {default = 10}, --9
   HOTBAR0            = {default = 11}, --0

   --CAMERA
   CAMUP              = {default = 201}, --PC_PAGEUP
   CAMDOWN            = {default = 209}, --PC_PAGEDOWN
   CAMVIEW            = {default = 47}, --PC_V

   --UI
   CRAFT              = {default = 25}, --PC_P
   INVENTORY          = {default = 23}, --PC_I
   INVENTORYALT       = {default = 15},  --PC_TAB
   JOURNAL            = {default = 36}, --PC_J
   MAP                = {default = 50}, --PC_M
   TIMESKIP           = {default = 20}, --PC_T
   TOGGLEUI           = {default = 45}, --PC_X

   --ETC
   ESCAPE             = {default = 1}, --PC_ESC
   ENTER              = {default = 28}, --PC_ENTER
   CONSOLE            = {default = 41}, --PC_TILDE
   SAVE               = {default = 63}, --PC_F5
   LOAD               = {default = 67}, --PC_F9
   FEEDBACK           = {default = 59}, --PC_F1

   --Debug
   COMMA              = {default = 51}, --,
   PERIOD             = {default = 52}, --.
   K                  = {default = 37}, --PC_K
   F8                 = {default = 66}, --PC_F8
   CONTROL            = {default = 29}, --PC_CTRL
   ALT                = {default = 56}, --PC_LAlt
   LSHIFT             = {default = 42}, --PC_LShift
   CAPSLOCK           = {default = 58}, --PC_CAPSLOCK
   RESTING            = {default = 21}, --PC_Y
   GODMODE            = {default = 49}, --PC_N
   NPCEDITOR          = {default = 48}, --PC_B
}

local bannedList = { 219, 220, 63, 67, 88, 59 } -- lwin, rwin, f5, f9 and f12
local systemKeysList = {"PREVIOUS", "ESCAPE", "ENTER", "CONSOLE", "SAVE", "LOAD", "FEEDBACK",
                        "GODMODE", "CAPSLOCK", "NPCEDITOR", "RESTING", "CONTROL", "ALT", "LSHIFT", "F8", "K", "COMMA", "PERIOD"}

function keys.init()
   for _,v in pairs(keysMap) do
      v.code = v.default
      v.state = false
      v.waitDouble = false
      v.doubleTap = false
   end

   local env = {}
   local status = deb.loadTableFromFile(getDocumentsFolder() .. "\\keysMap.lua", env)
   if not status then
      log("Loading: no keysMap.lua file, keys set to default")
      return
   end


   local sourceTable = env.keysMap or env --Supports old keysMap format
   local version = sourceTable["_version"]
   sourceTable["_version"] = nil
   if sourceTable ~= nil then
      for name in pairs(keysMap) do
         if not keys.isButtonSystem(name) then --Old maps contain system keys - ignore them
            if version == KEYSMAP_VERSION then
               if type(sourceTable[name]) == "table" then
                  keysMap[name].code = sourceTable[name].code
               elseif type(sourceTable[name]) == "number" then
                  keysMap[name].code = sourceTable[name]
               elseif sourceTable[name] == "nil" then
                  keysMap[name].code = nil
               end
            else --Convert old virtualKey maps
               if type(sourceTable[name]) == "table" then
                  keysMap[name].code = virtualKeyToScanCode(sourceTable[name].code)
               elseif type(sourceTable[name]) == "number" then
                  keysMap[name].code = virtualKeyToScanCode(sourceTable[name])
               elseif sourceTable[name] == "nil" then
                  keysMap[name].code = nil
               end
            end
         end
      end
   end
   keys.saveKeysMap()
end

function keys.isButtonSystem(buttonName)
   if tablex.search(systemKeysList, buttonName) then
      return true
   end
end

function keys.isKeyBanned(buttonName)
   if tablex.search(bannedList, buttonName) then
      return true
   end
end

function keys.setButtonCode(button, code)
   if button and code then
      --Nullify occupied buttons except system and inventory ones, cause they can be same
      for _,buttonName in pairs(keys.getButtonsNamesByCode(code)) do
         if not keys.isButtonSystem(buttonName)
            and not (button == "INVENTORY" and buttonName == "INVENTORYALT")
            and not (button == "INVENTORYALT" and buttonName == "INVENTORY") then
            keysMap[buttonName].code = nil
         end
      end

      keysMap[button].code = code
      --Softly restore defaults
      keys.restoreDefaultKeys(false)
   end
end

function keys.getButtonCode(button)
   if button and keysMap[button] then
      return keysMap[button].code
   end
   return nil
end

function keys.getButtonsNamesByCode(code)
   local buttonsNames = {}
   for buttonName,v in pairs(keysMap) do
      if v.code == code then
         table.insert(buttonsNames, buttonName)
      end
   end
   return buttonsNames
end

function keys.setButton(button, value)
   local buttons = {button}
   if type(button) == "number" then
      buttons = keys.getButtonsNamesByCode(button)
   end
   for _,button in ipairs(buttons) do
      if button and keysMap[button] then
         if value ~= keysMap[button].state then
            getPlayer().notificationCenter:postNotification("onChangeButtonState")
         end

         keysMap[button].state = value
         if value then
            --Activate double taps for those who wait
            if keysMap[button].waitDouble then
               keysMap[button].doubleTap = true
               runTimer(0.1, nil, function() --Deactivate double tap after time
                  keysMap[button].doubleTap = false
               end, false)
            else
               --Catch double taps
               keysMap[button].waitDouble = true
               runTimer(0.2, nil, function() --Catch second tap during some time
                  keysMap[button].waitDouble = false
               end, false)
            end
         else
            --Deactivate double tap also upon button release
            keysMap[button].doubleTap = false
         end
      end
   end
end

function keys.getButton(button)
   if type(button) == "number" then
      button = keys.getButtonsNamesByCode(button)[1]
   end
   if button and keysMap[button] then
      return keysMap[button].state
   end
end

function keys.getButtonDoubleTap(button)
   if type(button) == "number" then
      button = keys.getButtonsNamesByCode(button)[1]
   end
   if button and keysMap[button] then
      return keysMap[button].doubleTap
   end
end

function keys.resetButtonsWaitDouble(exceptCode)
   for buttonName,v in pairs(keysMap) do
      if exceptCode ~= v.code then
         keysMap[buttonName].waitDouble = false
      end
   end
end

function keys.restoreDefaultKeys(force)
   for _,v in pairs(keysMap) do
      if force then
         v.code = v.default
      --softly restore defaults of unassigned buttons if their defaults are not occupied by gameplay keys
      elseif not v.code then
         local defaultOccupiedBy = tablex.pairmap(function(_, buttonName)
            if not keys.isButtonSystem(buttonName) then return buttonName end
         end, keys.getButtonsNamesByCode(v.default))
         if #defaultOccupiedBy == 0 then
            v.code = v.default
         end
      end
   end
end

function keys.getButtonCurrentKeyName(button)
   return tablex.search(keyCodes, keys.getButtonCode(button)) or "UNASSIGNED"
end

function keys.getKeysMap()
   return keysMap
end

function keys.saveKeysMap()
   local t = {_version = 1}
   for name,v in pairs(keysMap) do
      if not keys.isButtonSystem(name) then
         t[name] = v.code or "nil" --allows to distinguish whether the key was removed by player or wasn't added to the keysMap yet
      end
   end
   deb.dumpTableToFile(t, getDocumentsFolder() .. "\\keysMap.lua", false)
end

return keys
