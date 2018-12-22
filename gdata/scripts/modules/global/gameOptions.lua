local ImmersiveUI = require "ui.immersiveUI"
local deb = require "global.debug"

local gameOptions = {}
local options = {
   tutorial          = {default = true,  current = true},
   immersiveUI       = {default = true,  current = true},
   autoReload        = {default = true,  current = true},
   cameraShake       = {default = true,  current = true},
   autoDialogAdvance = {default = false, current = false},
   dialogSpeed       = {default = 35,    current = 35, min = 10, max = 120},
}

function gameOptions.init()
   local env = {}
   local status = deb.loadTableFromFile(getDocumentsFolder() .. "\\gameOptions.lua", env)
   if not status then
      log("Loading: no gameOptions.lua file, options set to default")
   end

   --Supports old gameOptions format
   local sourceTable = env.gameOptions or env
   for name in pairs(options) do
      if sourceTable[name] ~= nil then
         gameOptions.setGameOption(name, sourceTable[name])
      end
   end
end

function gameOptions.setGameOption(name, value)
   options[name].current = value
end

function gameOptions.getGameOptionData(name)
   return options[name]
end

function gameOptions.getGameOption(name)
   return options[name].current
end

function gameOptions.getGameOptionDefault(name)
   return options[name].default
end

function gameOptions.getGameOptions()
   return options
end

function gameOptions.saveGameOptions()
   if not isMainMenu() then
      ImmersiveUI.onOptionUpdate()
      gameplayUI.annoyingHintUI:onOptionUpdate()
   end
   local state = {}
   for optionName in pairs(options) do
      state[optionName] = gameOptions.getGameOption(optionName)
   end
   deb.dumpTableToFile(state, getDocumentsFolder() .. "\\gameOptions.lua", false)
end

return gameOptions
