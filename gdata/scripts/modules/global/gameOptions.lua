local pprint = require "pprint"

local gameOptions = {}
local options = {
   tutorial = true,
   immersiveUI = true,
   autoReload = true,
}

function gameOptions.init()
   local chunk, err = loadfile(getDocumentsFolder() .. "\\gameOptions.lua")
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

   if env.gameOptions ~= nil then
      for name, value in pairs(env.gameOptions) do
         if options[name] == nil then
            log(string.format("Warning: unrecognized option '%s' in gameOptions.lua", name))
         elseif value == true then
            options[name] = true
         elseif value == false then
            options[name] = false
         end
      end
   end
end

function gameOptions.setGameOption( name, value )
   options[name] = value
end

function gameOptions.getGameOption( name )
   return options[name]
end

function gameOptions.getGameOptions()
   return options
end

function gameOptions.saveGameOptions()
   local formatted = pprint.pformat(options)
   local file, err = io.open(getDocumentsFolder() .. "\\gameOptions.lua", "w")
   if file then
      file:write("gameOptions = " .. formatted, "\n")
      file:close()
   else
      log(err)
   end
end

return gameOptions
