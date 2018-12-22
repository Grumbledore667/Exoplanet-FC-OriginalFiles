local tablex = require "pl.tablex"
local keyCodes = require "global.keyCodes"
local deb = require "global.debug"

local keys = {}

local keysMap = {
   --MOVEMENT
   FORWARD            = {default = 87}, --PC_W
   BACK               = {default = 83}, --PC_S
   LEFT               = {default = 65}, --PC_A
   RIGHT              = {default = 68}, --PC_D
   SPRINT             = {default = 16}, --PC_SHIFT
   WALK               = {default = 18}, --PC_ALT
   JUMP               = {default = 32}, --PC_SPACE

   --GAMEPLAY
   ATTACK             = {default = 1},  --PC L_MOUSE
   AIM                = {default = 2},  --PC R_MOUSE
   RELOAD             = {default = 82}, --PC_R
   ACTIVATE           = {default = 69}, --PC_E
   HOLSTER            = {default = 72}, --PC_H

   --HOTBAR
   HOTBARQ            = {default = 81}, --PC_Q
   HOTBAR1            = {default = 49}, --1
   HOTBAR2            = {default = 50}, --2
   HOTBAR3            = {default = 51}, --3
   HOTBAR4            = {default = 52}, --4
   HOTBAR5            = {default = 53}, --5
   HOTBAR6            = {default = 54}, --6
   HOTBAR7            = {default = 55}, --7
   HOTBAR8            = {default = 56}, --8
   HOTBAR9            = {default = 57}, --9
   HOTBAR0            = {default = 48}, --0

   --CAMERA
   CAMUP              = {default = 33}, --PC_PAGEUP
   CAMDOWN            = {default = 34}, --PC_PAGEDOWN
   CAMVIEW            = {default = 86}, --PC_V

   --UI
   CRAFT              = {default = 80}, --PC_P
   INVENTORY          = {default = 73}, --PC_I
   INVENTORYALT       = {default = 9},  --PC_TAB
   JOURNAL            = {default = 74}, --PC_J
   MAP                = {default = 77}, --PC_M
   TIMESKIP           = {default = 84}, --PC_T
   TOGGLEUI           = {default = 88}, --PC_X

   --ETC
   CONTROL            = {default = 17}, --PC_CTRL
   ALT                = {default = 18}, --PC_ALT
   CAPSLOCK           = {default = 20}, --PC_CAPSLOCK
   PREVIOUS           = {default = 90}, --PC_Z
   RESTING            = {default = 89}, --PC_Y
   GODMODE            = {default = 78}, --PC_N
   STYLESEDITOR       = {default = 66}, --PC_B
   ESCAPE             = {default = 27}, --PC_ESC
   ENTER              = {default = 13}, --PC_ENTER
}

local bannedList = { 91, 92, 93, 63, 67, 88 } -- lwim, rwin, select, f5, f9 and f12
local systemKeysList = { "GODMODE", "CAPSLOCK", "STYLESEDITOR", "RESTING", "PREVIOUS", "CONTROL", "ESCAPE", "ENTER", "ALT" }

function keys.init()
   for _,v in pairs(keysMap) do
      v.code = v.default
      v.state = false
      v.waitDouble = false
   end

   local env = {}
   local status = deb.loadTableFromFile(getDocumentsFolder() .. "\\keysMap.lua", env)
   if not status then
      log("Loading: no keysMap.lua file, keys set to default")
      return
   end

   --Supports old keysMap format
   local sourceTable = env.keysMap or env
   if sourceTable ~= nil then
      for name in pairs(keysMap) do
         if type(sourceTable[name]) == "table" then
            keysMap[name].code = sourceTable[name].code
         elseif type(sourceTable[name]) == "number" then
            keysMap[name].code = sourceTable[name]
         elseif sourceTable[name] == "nil" then
            keysMap[name].code = nil
         end
      end
   end
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

function keys.setButtonWaitDouble(button, value)
   if type(button) == "number" then
      button = keys.getButtonsNamesByCode(button)[1]
   end
   if button and keysMap[button] then
      keysMap[button].waitDouble = value
   end
end

function keys.getButtonWaitDouble(button)
   if type(button) == "number" then
      button = keys.getButtonsNamesByCode(button)[1]
   end
   if button and keysMap[button] then
      return keysMap[button].waitDouble
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
   local t = {}
   for k,v in pairs(keysMap) do
      t[k] = v.code or "nil" --allows to distinguish whether the key was removed by player or wasn't added to the keysMap yet
   end
   deb.dumpTableToFile(t, getDocumentsFolder() .. "\\keysMap.lua", false)
end

return keys
