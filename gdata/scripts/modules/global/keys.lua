local pprint = require "pprint"
local tablex = require "pl.tablex"
local keyCodes = require "global.keyCodes"

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
   CHARACTER          = {default = 67}, --PC_C
   INVENTORY          = {default = 73}, --PC_I
   INVENTORYALT       = {default = 9},  --PC_TAB
   JOURNAL            = {default = 74}, --PC_J
   MAP                = {default = 77}, --PC_M
   TIMESKIP           = {default = 84}, --PC_T
   TOGGLEUI           = {default = 88}, --PC_X

   --ETC
   CONTROL            = {default = 17}, --PC_CTRL
   CAPSLOCK           = {default = 20}, --PC_CAPSLOCK
   PREVIOUS           = {default = 90}, --PC_Z
   RESTING            = {default = 89}, --PC_Y
   GODMODE            = {default = 78}, --PC_N
   STYLES             = {default = 66}, --PC_B
   ESCAPE             = {default = 27}, --PC_ESC
}

function keys.init()
   for _,v in pairs(keysMap) do
      v.code = v.default
      v.state = false
      v.waitDouble = false
   end

   local chunk, err = loadfile(getDocumentsFolder() .. "\\keysMap.lua")
   if err then
      log(err)
      return
   end

   local env = {}
   setfenv(chunk, env)
   local status
   status, err = pcall(chunk)
   if not status then
      log(err)
      return
   end

   if env.keysMap and type(env.keysMap) == "table" then
      for name, v in pairs(env.keysMap) do
         if keysMap[name] == nil then
            log(string.format("WARNING: unrecognized button '%s' in keysMap.lua", name))
         else
            keysMap[name].code = v.code
         end
      end
   end
end

function keys.setButtonCode( button, code )
   if button and code then
      --Nullify occupied buttons except inventory ones, cause they can be same

      for _,buttonName in pairs( keys.getButtonsNamesByCode( code ) ) do
         if not (button == "INVENTORY" and buttonName == "INVENTORYALT")
            and not (button == "INVENTORYALT" and buttonName == "INVENTORY") then
            keysMap[buttonName].code = nil
         end
      end

      keysMap[button].code = code
      --Softly restore defaults
      restoreDefaultKeys( false )
   end
end

function keys.getButtonCode( button )
   if button and keysMap[button] then
      return keysMap[button].code
   end
   return nil
end

function keys.getButtonsNamesByCode( code )
   local buttonsNames = {}
   for buttonName,v in pairs(keysMap) do
      if v.code == code then
         table.insert(buttonsNames, buttonName)
      end
   end
   return buttonsNames
end

function keys.setButton( button, value )
   if type(button) == "number" then
      button = keys.getButtonsNamesByCode( button )[1]
   end
   if button and keysMap[button] then
      if value ~= keysMap[button].state then
         getPlayer().notificationCenter:postNotification( "onChangeButtonState" )
      end
      keysMap[button].state = value
   end
end

function keys.getButton( button )
   if type(button) == "number" then
      button = keys.getButtonsNamesByCode( button )[1]
   end
   if button and keysMap[button] then
      return keysMap[button].state
   end
end

function keys.setButtonWaitDouble( button, value )
   if type(button) == "number" then
      button = keys.getButtonsNamesByCode( button )[1]
   end
   if button and keysMap[button] then
      keysMap[button].waitDouble = value
   end
end

function keys.getButtonWaitDouble( button )
   if type(button) == "number" then
      button = keys.getButtonsNamesByCode( button )[1]
   end
   if button and keysMap[button] then
      return keysMap[button].waitDouble
   end
end

function keys.resetButtonsWaitDouble( exceptCode )
   for buttonName,v in pairs(keysMap) do
      if exceptCode ~= v.code then
         keysMap[buttonName].waitDouble = false
      end
   end
end

function keys.restoreDefaultKeys( force )
   for _,v in pairs(keysMap) do
      if force then
         v.code = v.default
      --softly restore defaults of unassigned buttons if their defaults are not occupied
      elseif not v.code and #keys.getButtonsNamesByCode( v.default ) == 0 then
         v.code = v.default
      end
   end
end

function keys.getButtonCurrentKeyName( button )
   return tablex.search( keyCodes, keys.getButtonCode( button ) ) or ""
end

function keys.getKeysMap()
   return keysMap
end

function keys.saveKeysMap()
   local t = {}
   for k,v in pairs(keysMap) do
      t[k] = { code = v.code }
   end
   t = pprint.pformat( t )

   local file, err = io.open(getDocumentsFolder() .. "\\keysMap.lua", "w")
   if file then
      file:write("keysMap = ", t)
      file:close()
   else
      log(err)
   end
end

return keys
