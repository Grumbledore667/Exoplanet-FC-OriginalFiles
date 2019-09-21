local ItemsLists = (require "itemsLists")
local classManager = (require "global.classManager")

local stringx = require "pl.stringx"
local tablex = require "pl.tablex"

PC_B = 66
PC_K = 75
PC_L = 76
PC_SEMICOLON = 186
PC_F1 = 112
PC_F5 = 116
PC_F6 = 117
PC_F8 = 119
PC_F9 = 120

---like regular require but always reloads module from disk
function rerequire(modname)
   if package.loaded[modname] then
      package.loaded[modname] = nil
   end
   return require(modname)
end

-- try to require a problem module and if it fails, don't raise errors or wreak havoc
function loadrequire(module, loud)
   local function requiref()
      return require(module)
   end
   local noerror = function(code)
      -- TPrint("lol")
      return code
   end
   if not loud then
      noerror = nil
   end
   -- use xpcall with a nil instead of error handling function
   -- to suppress missing module error message in the log
   local ok, err = xpcall(requiref, noerror)
   if ok then
      return err
   else
      return nil
   end
end

function isSavingEnabled()
   local player = getMC()
   return not isEditor() and player and getPlayer() == player
      and not player:getState("talk") and not player:getState("resting") and not player:getState("dead")
      and not player:getState("climbing_ladder") and not player:getState("climbing_ladder_down") and not player:getState("bed_resting")
      and not gameplayUI.fadeToBlackSequence
      and not getGlobalParam("inScene")
end

function localPointToWorld(vec3Point, transform)
   return vec3Add(vec3RotateQuat(vec3Point, transform:getRotQuat()), transform:getPos())
end

function worldPointToLocal(vec3Point, transform)
   return vec3RotateQuat(vec3Sub(vec3Point, transform:getPos()), transform:getRotQuat())
end

function objInDistDelta(objPos, targetPos, p1, p2)
   if not objPos or not targetPos then
      return false
   end

   local range = getDistance(objPos, targetPos)

   return range > p1 and range < p2
end


function objInDist(objPos, targetPos, dist)
   if not objPos or not targetPos then
      return false
   end

   return getDistance(objPos, targetPos) < dist
end


function inAngle(obj, targetPos, angle)
   local result = checkPointInSector(obj:getPose():getPos(), obj:getDir(), targetPos, angle, 10000)
   if result then
   -- log("success angle: " .. tostring(angle))
   end
   return result
end


function inSector(obj, targetPos, dist, angle)
   return inAngle(obj, targetPos, angle) and objInDist(obj:getPose():getPos(), targetPos, dist)
end


function getTargetAngle(obj, targetPos)
   return obj:getTargetAngle(targetPos, true)
end

function getTargetAngleFlat(obj, targetPos)
   return getTargetAngle(obj, vec3Add(vec3Mul(targetPos, {x=1, y=0, z=1}), {y=obj:getPose():getPos().y}))
end

function getTargetAngleDir(obj, targetPos)
   if not obj or not targetPos then
      return 0
   end

   return obj:getTargetAngle(targetPos, false)
end

function getWords(str)
   local tab = {}
   for w in string.gfind(str, "[%w_.:]+") do
      table.insert(tab, w)
   end
   return tab
end

function unpackObjectsString(str)
   local t = {}
   for _, name in ipairs(getWords(str)) do
      local obj = getObj(name)
      if obj then
         table.insert(t, obj)
      end
   end
   return t
end

function loadParam(obj, paramName, defaultValue)
   if obj.parameters ~= nil and obj.parameters[paramName] ~= nil and obj.parameters[paramName] ~= "" then
      return obj.parameters[paramName]
   end
   return defaultValue
end


function loadParamNumber(obj, paramName, defaultValue)
   local res = tonumber(loadParam(obj, paramName, defaultValue))
   if res then
      return res
   end
   return defaultValue
end

-- always returns a table
function loadParamObjects(obj, paramName, defaultValue)
   local str = loadParam(obj, paramName, defaultValue)

   if str then
      return unpackObjectsString(str)
   end
   return {}
end

function loadParamStrings(obj, paramName, defaultValue)
   local tab = loadParam(obj, paramName, nil)
   if tab then
      tab = getWords(tab)
      return tab
   end
   return defaultValue
end

function loadParamVec3(obj, paramName, defaultValue)
   local str = loadParam(obj, paramName, nil)
   if str then
      local tab = {}
      for val in str:gfind("-?%d+") do
         table.insert(tab, tonumber(val))
      end
      tab = { x = tab[1], y = tab[2], z = tab[3], }
      return tab
   end
   return defaultValue
end

function loadParamItemCounts(obj, paramName, defaultValue)
   local param = loadParam(obj, paramName, "")
   if not stringx.endswith(param, ',') then
      param = param .. ','
   end

   local items = {}
   for name, count in string.gmatch(param, "([%w_]+%.[%a]+),?%s*(%d*),") do
      if name ~= "" then
         items[name] = tonumber(count) or 1
      end
   end

   if next(items) == nil then
      items = defaultValue
   end
   return items
end

function loadAndGuessItemParam(obj, paramName, defaultValue)
   local items = loadParamItemCounts(obj, paramName, defaultValue)
   local itemName, itemCount = next(items)

   local autoItem = ItemsLists.getItemForModel(obj:getPrefabName())
   if (not itemName or itemName == "") and not autoItem then
      log(string.format("WARNING: %s %s couldn't guess item from model", obj:getScriptClass(), obj:getName()))
   end
   if (not itemName or itemName == "") and autoItem then
      itemName = autoItem
   end
   return itemName, itemCount or 1
end

function compareObjectTables(tab1, tab2)
   if not tab1 or not tab2 then
      return false
   end
   for key1 in pairs(tab1) do
      for key2 in pairs(tab2) do
         if tab1[key1] == tab2[key2] then
            return true
         end
      end
   end
   return false
end

function getClearName(name)
   return string.gsub(name, "%.[%w]+$", "")
end

function getClosestObject(obj, objects)
   if #objects == 0 then
      return nil
   end

   local index   = 1
   local target  = objects[index]
   local minDist = getDistance(obj:getPose():getPos(), target:getPose():getPos())

   for key, value in pairs(objects) do
      local dist = getDistance(obj:getPose():getPos(), value:getPose():getPos())
      if dist < minDist then
         minDist = dist
         index   = key
      end
   end

   return objects[index]
end

function getClosestObjectInView(obj, objects, angle)
   if #objects == 0 then
      return nil
   end

   local index   = 1
   local minDist = getDistance(obj:getPose():getPos(), objects[index]:getPose():getPos())
   local found   = false

   --   for key, value in pairs(objects) do
   --    if (inAngle(obj, value:getPose():getPos(), angle) == true) then
   --       minDist = getDistance(obj:getPose():getPos(), value:getPose():getPos())
   --       index   = key
   --         found   = true
   --         break
   --    end
   -- end

   for key, value in pairs(objects) do
      local dist = getDistance(obj:getPose():getPos(), value:getPose():getPos())
      if inAngle(obj, value:getPose():getPos(), angle) == true then
         if dist <= minDist then
            minDist = dist
            index   = key
            found   = true
            -- log("found angle " .. tostring(angle) .. " char: " .. value:getLabel())
         end
      end
   end

   if not found then
      --return getClosestObject(obj, objects)
      return nil
   end

   return objects[index]
end

--timer function for flickering omnis
function omniFlicker(params)
   local pulseSpeed = (math.sin(getGameTime()*5) * 0.5 + 0.5) * 10 + 20
   local intensity = clamp(params.intensity - vec3Length(getScene():getEnvirState():getDiffuse()), 0.5, params.intensity)
   intensity = (0.7 + 2 * math.sin(getGameTime() * pulseSpeed * 1.5) * 0.1) * intensity
   params.omni:setIntensity(intensity)
end

------------------------------------------------------------------------------------------------------------------------
local currentScene
local mainCharacter
local defaultPlayerCameraHeight   = 160
local defaultPlayerCameraOffset   = 53
local defaultPlayerCameraDistance = 170
local defaultPlayerCameraFov      = 75

function getObj(name, silent)
   local obj = classManager.objTable[name]
   if obj then
      return obj
   elseif not silent then
      log("ERROR: Object named " .. name .. " not found!")
   end
   return nil
end

-- scene
function setScene(scene)
   currentScene = scene
end

---@return CScene
function getScene()
   return currentScene
end

-- player
function setMC(obj)
   mainCharacter = obj
end

---@return CMainCharacter
function getMC()
   return mainCharacter
end

-- camera parameters
function setDefaultPlayerCameraHeight(value)
   defaultPlayerCameraHeight = value
end

function getDefaultPlayerCameraHeight()
   return defaultPlayerCameraHeight
end

function setDefaultPlayerCameraOffset(value)
   defaultPlayerCameraOffset = value
end

function getDefaultPlayerCameraOffset()
   return defaultPlayerCameraOffset
end

function setDefaultPlayerCameraDistance(value)
   defaultPlayerCameraDistance = value
end

function getDefaultPlayerCameraDistance()
   return defaultPlayerCameraDistance
end

function setDefaultPlayerCameraFov(value)
   defaultPlayerCameraFov = value
end

function getDefaultPlayerCameraFov()
   return defaultPlayerCameraFov
end

-- table utils

-- instead of tableSize use tablex.size
-- instead of tableDeepCopy use tablex.deepcopy

-- instead of pairsByKeys use "orderedPairs" module

function nestTable(tbl, maxLen, maxLenFirst)
   maxLenFirst = math.max(maxLenFirst or maxLen, maxLen)
   local result = {}
   local tmp = {}
   for i=1,#tbl do
      table.insert(tmp, tbl[i])
      if i == maxLenFirst or i == #tbl or (i > maxLenFirst and (i-maxLenFirst) % maxLen == 0) then
         table.insert(result, tmp)
         tmp = {}
      end
   end
   return result
end

function getKeyByValue(tab, value)
   for key in pairs(tab) do
      if tab[key] == value then
         return key
      end
   end
   return nil
end

function getIndexByKey(tab, key)
   local index = 1
   for k in pairs(tab) do
      if k == key then
         return index
      end
      index = index + 1
   end
   return nil
end

function getIndexByValue(tab, value)
   local index = 1
   for k in pairs(tab) do
      if tab[k] == value then
         return index
      end
      index = index + 1
   end
   return nil
end

function inList(list, value)
   for k,v in pairs(list) do
      if v == value then
         return true
      end
   end

   return false
end

function mergeArrays(...)
   local resultArray = {}

   for _,v in ipairs{...} do
      for i=1,#v do resultArray[#resultArray+1] = v[i] end
   end

   return resultArray
end

-------------------------------------------------------------------------------
-- math
-------------------------------------------------------------------------------

--- construct a zero-length vector
---@return vec3
function vec3Zero()
   return {x=0,y=0,z=0}
end

---@return vec3
function vec3New(x, y, z)
   if type(x) == 'table' then
      if #x > 0 then
         x, y, z = unpack(x)
      else
         x, y, z = x.x, x.y, x.z
      end
   end
   return {x=x or 0,y=y or 0,z=z or 0}
end

function scaleVal(val, cur, max)
   return math.floor((cur * val) / max)
end

function scaleFloatVal(val, cur, max)
   return (cur * val) / max
end

function scaleValueFloat(value, current, max)
   return (value * current) / max
end

function scaleValue(value, current, max)
   return math.floor(scaleValueFloat(value, current, max))
end

function round(val, digits)
  local mult = 10^(digits or 0)
  return math.floor(val * mult + 0.5) / mult
end

function sign(val)
   if val < 0 then
      return -1
   end

   return 1
end

function clamp(val, minf, maxf)
   if val < minf then return minf
   elseif val > maxf then return maxf end
   return val
end

---@param val vec3
---@param minf number | vec3
---@param maxf number | vec3
---@return vec3
function vec3Clamp(val, minf, maxf)
   local res = {}
   local min = minf
   local max = minf
   for k in pairs(val) do
      if type(minf) == "table" then
         min = minf[k]
      end

      if type(maxf) == "table" then
         max = maxf[k]
      end

      res[k] = clamp(val[k], min, max)
   end
   return res
end

function vecMix(v1, v2, factor)
   local res = {}
   for k in pairs(v1) do res[k] = v1[k] * (1.0-factor) + v2[k] * factor end
   return res
end

function mixF(v1, v2, factor)
   return v1 * (1.0-factor) + v2 * factor
end

function vecInvert(v1)
   local res = {}
   for k in pairs(v1) do res[k] = -v1[k]end
   return res
end
