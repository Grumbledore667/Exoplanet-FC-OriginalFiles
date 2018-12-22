local inspect = require "inspect"
local pprint = require "pprint"

local deb = {}

deb.versionStr = "Alersteam ( Alpha build 0.20.2 )"
deb.versionInt = 4

local debugMode = false

local debugOptions = {
   dialogSkip   = true,  -- fast-forward dialogs by hitting space
   dialogDebug  = true, -- show dialog debug options, if it exists
   inventory    = false, -- add cheat inventory on start
   keys         = true,  -- additional keys like N (godmode) or Y (waiting)
                         -- or ,. (daytime speed) or B (style editor)
   fastLoot     = true,  -- instant item pick up
   quest        = true, -- quest speed ups or convenience
                         -- for quests that check for that variable.
   plants       = false, -- faster plant growth
}

function deb.init()
   -- load local config file safely with debug features here
   local chunk, err = loadfile(getDocumentsFolder() .. "\\debugOptions.lua")
   if err then
      deb.log(err)
      return
   end

   local env = {}
   setfenv(chunk, env)
   local status
   status, err = pcall(chunk)
   if not status then
      deb.log(err)
      return
   end

   if env.debugMode ~= nil and env.debugOptions ~= nil then
      if env.debugMode == true then
         debugMode = true
      elseif env.debugMode == false then
         debugMode = false
      end

      for name, value in pairs(env.debugOptions) do
         if debugOptions[name] == nil then
            deb.log(string.format("Warning: unrecognized option '%s' in debugOptions.lua", name))
         elseif value == true then
            debugOptions[name] = true
         elseif value == false then
            debugOptions[name] = false
         end
      end
   end
end

function deb.clear()
   TClear()
end

function deb.log(var, options)
   if type(var) == "string" then
      TPrint(var .. "\n")
   else
      TPrint(inspect(var, options or {depth=2}) .. "\n")
   end
end

function deb.isDebug(option)
   if option == nil then
      return debugMode
   else
      return debugMode and debugOptions[option]
   end
end

function deb.setDebugMode(option, value)
   if type(option) == "string" then
      if option == "all" then
         for name in pairs(debugOptions) do
            debugOptions[name] = value
         end
         debugMode = value
      else
         debugOptions[option] = value
      end
   else
      debugMode = option
   end
end

function deb.getDebugMode()
   return debugMode, debugOptions
end

function deb.saveDebug()
   local file, err = io.open(getDocumentsFolder() .. "\\debugOptions.lua", "w")
   if file then
      file:write("debugMode = ", tostring(debugMode), "\n\n")
      file:write("debugOptions = ", pprint.pformat(debugOptions), "\n\n")
      file:write( "--dialogSkip   -- fast-forward dialogs by hitting space\n",
                  "--dialogDebug  -- show dialog debug options, if it exists\n",
                  "--inventory    -- add cheat inventory on start\n",
                  "--keys         -- additional keys like N (godmode) or Y (waiting)\n",
                  "               -- or ,. (daytime speed) or B (style editor)\n",
                  "--fastLoot     -- instant item pick up\n",
                  "--quest        -- quest speed ups or convenience\n",
                  "               -- for quests that check for that variable.\n",
                  "--plants       -- faster plant growth", "\n\n")
      file:close()
   else
      log(err)
   end
end

return deb
