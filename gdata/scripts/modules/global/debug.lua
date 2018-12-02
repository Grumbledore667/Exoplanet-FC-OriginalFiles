local inspect = require "inspect"
local pretty = require "pl.pretty"
local utils = require "pl.utils"

local deb = {}

deb.versionStr = "Alersteam ( Early Access Alpha build 0.26.0 )"
deb.versionInt = 10
deb.pcallProtection = true

deb.inspectOptions = {depth=2}

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
   local env = {}
   local status = deb.loadTableFromFile(getDocumentsFolder() .. "\\debugOptions.lua", env)
   if not status then
      deb.log("Loading: no debugOptions.lua file, debug mode set to default")
      return
   end

   if env.debugMode ~= nil and env.debugOptions ~= nil then
      if env.debugMode == true then
         debugMode = true
         deb.log("Debug Mode: enabled")
      elseif env.debugMode == false then
         debugMode = false
         deb.log("Debug Mode: disabled")
      end

      for name, value in pairs(env.debugOptions) do
         if debugOptions[name] == nil then
            deb.log(string.format("Warning: unrecognized option '%s' in debugOptions.lua", name))
         else
            if value == true then
               debugOptions[name] = true
               if debugMode then
                  deb.log("Debug option: '" .. name .. "' - enabled")
               end
            elseif value == false then
               debugOptions[name] = false
               if debugMode then
                  deb.log("Debug option: '" .. name .. "' - disabled")
               end
            end
         end
      end
   end
end

function deb.loadTableFromFile(path, env)
   local chunk, err = loadfile(path)
   if not chunk then return chunk, err end
   if env then
      setfenv(chunk, env)
   end
   return pcall(chunk)
end

function deb.dumpTableToFile(t, path, requirable, comment)
   --deb.log("Dumping a table to " .. path)
   local data = ""
   comment = comment and string.format("--[[\n%s\n]] \n\n", tostring(comment)) or ""
   if requirable then
      data = string.format("%sreturn %s", comment, pretty.write(t, nil, false))
   else
      data = comment
      for key, chunk in pairs(t) do
         data = string.format("%s%s = %s \n", data, key, pretty.write(chunk, nil, false))
      end
   end

   utils.writefile(path, data)
end

function deb.loadEngineUserdataTypes()
   local registry = debug.getregistry()
   -- initialized in RegisterGlobalFuncs (except shEmitter)
   local typeNames = {
      --[[
         shEmitter is initialized at a much later stage, after CEGUI and
         before getScene():OnLocationEnter() event, at the object creation stage:
         1. sounds
         2. emitters <--- here!
         3. items
         ...everything else

         skip pretty-printing the engine class name altogether since we don't have
         a guaranteed point in time to register it in the engineTypes table
         before any in-script OnCreate method is fired.
      --]]
      --"shEmitter",
      "shCameraAnimated",
      "shTransformActor",
      "shRigidMeshActor",
      "shRigidEntity",
      "shEventTimer",
      "shEnvirNode",
      "Sound",
      "shLightOmni",
      "shTrigger",
      "shPlayerInteractor",
      "shGeometry",
   }
   local collected = {}
   for _, name in ipairs(typeNames) do
      local engineType = registry[name]
      if engineType then
         collected[engineType] = name
      else
         local template = "WARNING: logger hardcoded engine type '%s' no longer exists in Lua's registry! The type will appear as userdata in logs."
         deb.log(string.format(template, name))
      end
   end
   deb.engineTypes = collected
end

local function isCEGUIType(typeString)
   local ceguiType = false
   local sub = string.sub(typeString, 1, 5)
   if sub == "CEGUI" then
      ceguiType = true
   else
      sub = string.sub(typeString, 1, 11)
      if sub == "const CEGUI" then
         ceguiType = true
      end
   end
   return ceguiType
end

local function process(item)
   if type(item) == 'userdata' then
      local toluaType = ""
      if tolua and tolua.type then
         toluaType = tolua.type(item)
      end
      if isCEGUIType(toluaType) then
         local ceguiType = string.sub(toluaType, 8) -- everything after CEGUI::
         local converter = deb.ceguiTypes[ceguiType]
         if converter then
            return string.format("<%s>%s", toluaType, converter(deb.pHelper, item))
         else
            return string.format("<%s>", toluaType)
         end
      elseif deb.engineTypes then
         local mt = getmetatable(item)
         if mt then
            local engineTypeStr = deb.engineTypes[mt]
            if engineTypeStr then
               return string.format("<%s>", engineTypeStr)
            end
         end
      end
   end
   return item
end

function deb.initAfterCEGUI()
   (require "ui.utils").init()
   local pHelper = CEGUI.PropertyHelper
   deb.pHelper = pHelper
   deb.ceguiTypes = {
      Size_float_    = pHelper.sizeToString,
      Vector2_float_ = pHelper.vector2ToString,
      Rect_float_    = pHelper.rectToString,
      Image          = pHelper.imageToString,
      Colour         = pHelper.colourToString,
      ColourRect     = pHelper.colourRectToString,
      UDim           = pHelper.udimToString,
      UVector2       = pHelper.uvector2ToString,
      USize          = pHelper.usizeToString,
      URect          = pHelper.urectToString,
      AspectMode     = pHelper.aspectModeToString,
   }

   deb.inspectOptions.process = process
end

function deb.clear()
   TClear()
end

function deb.log(var, options)
   if type(var) == "string" then
      TPrint(var .. "\n")
   else
      TPrint(inspect(var, options or deb.inspectOptions) .. "\n")
   end
end

function deb.isDebug(option)
   if option == nil then
      return debugMode
   else
      return debugMode and debugOptions[option]
   end
end

---turn various debug options on and off.
---true or false in option argument will turn debug mode on or off.
---"all" option toggles all options and the debug mode itself.
---@overload fun(option:boolean)
---@param option string
---@param value boolean
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
   local comment = table.concat({
      "dialogSkip   -- fast-forward dialogs by hitting space",
      "dialogDebug  -- show dialog debug options, if it exists",
      "inventory    -- add cheat inventory on start",
      "keys         -- additional keys like N (godmode) or Y (waiting)",
      "             -- or ,. (daytime speed) or B (style editor)",
      "fastLoot     -- instant item pick up",
      "quest        -- quest speed ups or convenience",
      "             -- for quests that check for that variable.",
      "plants       -- faster plant growth"
   }, "\n")
   deb.dumpTableToFile({debugMode = debugMode, debugOptions = debugOptions}, getDocumentsFolder() .. "\\debugOptions.lua", false, comment)
end

local poseMethods = {
   "getPos",
   "getRot",
   "getScale",
   "getLocalPos",
   "getLocalRot",
   "getLocalScale",
   -- "getParent",
   "getRotQuat",
   "getLocalRotQuat",
}

local mhuge = math.huge
local function isNaN(num)
   return num ~= num or num == mhuge or num == -mhuge
end
deb.isNaN = isNaN

local function _find_nan (t,value,tables)
   for k,v in pairs(t) do
      if isNaN(v) then return k end
   end
   if t.getPose and t.__object then
      local pose = t:getPose()
      for _, method in ipairs(poseMethods) do
         if pose and pose[method] then
            for k, v in pairs(pose[method](pose) or {}) do
               if isNaN(v) then return "getPose():"..method.."()."..k end
            end
         end
      end
   end
   for k,v in pairs(t) do
      if not tables[v] and type(v) == 'table' then
         tables[v] = true
         local res = _find_nan(v,value,tables)
         if res then
            res = tostring(res)
            if type(k) ~= 'string' then
               return '['..k..']'..res
            else
               return k..'.'..res
            end
         end
      end
   end
end

--- find a NaN value in a table by recursive search.
-- @tab t the table
-- @param value - ignored
-- @array[opt] exclude any tables to avoid searching
-- @usage search(_G,{package.path}) == 'math.sin'
-- @return a fieldspec, e.g. 'a.b' or 'math.sin'
function deb.searchNan (t,value,exclude)
   local tables = {[t]=true}
   if exclude then
      for _,v in pairs(exclude) do tables[v] = true end
   end
   return _find_nan(t,value,tables)
end

return deb
