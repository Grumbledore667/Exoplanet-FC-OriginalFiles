local charactersGroup = (require "characters.charactersGroup")
local ItemsData = (require "itemsData")
local ItemsLists = (require "itemsLists")
local classManager = (require "global.classManager")

local stringx = require "pl.stringx"
local List = require "pl.List"

-- const
FRIEND  = charactersGroup.FRIEND
ENEMY   = charactersGroup.ENEMY
NEUTRAL = charactersGroup.NEUTRAL
IGNOR   = charactersGroup.IGNOR

ROLE_PLAYER     = charactersGroup.ROLE_PLAYER
ROLE_NPC_ENEMY  = charactersGroup.ROLE_NPC_ENEMY
ROLE_NPC_FRIEND = charactersGroup.ROLE_NPC_FRIEND
ROLE_NPC_AGR    = charactersGroup.ROLE_NPC_AGR
ROLE_INSECT     = charactersGroup.ROLE_INSECT
ROLE_ANIMAL     = charactersGroup.ROLE_ANIMAL
ROLE_PLANT      = charactersGroup.ROLE_PLANT
ROLE_TURRET     = charactersGroup.ROLE_TURRET
ROLE_SHARK      = charactersGroup.ROLE_SHARK

PC_B = 66
PC_K = 75
PC_L = 76
PC_SEMICOLON = 186
PC_F1 = 112
PC_F5 = 116
PC_F6 = 117
PC_F9 = 120

-- global vars

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
   local player = getPlayer()
   return not isEditor() and player and player:getScriptClass() == "CMainCharacter"
      and not player:getState("talk") and not player:getState("resting") and not player:getState("dead")
      and not gameplayUI.fadeToBlackSequence
      and not getGlobalParam("inScene")
end

function localPointToWorld(vec3Point, transform)
   return vec3Add(vec3RotateQuat(vec3Point, transform:getRotQuat()), transform:getPos())
end

function worldPointToLocal(vec3Point, transform)
   return vec3RotateQuat(vec3Sub(vec3Point, transform:getPos()), transform:getRotQuat())
end

function objInDistDelta( objPos, targetPos, p1, p2 )
   if ( not objPos or not targetPos ) then
      return false
   end

   local range = getDistance( objPos, targetPos )

   return range > p1 and range < p2
end


function objInDist( objPos, targetPos, dist )
   if ( not objPos or not targetPos ) then
      return false
   end

   return getDistance( objPos, targetPos ) < dist
end


function inAngle( obj, targetPos, angle )
   local result = checkPointInSector(obj:getPose():getPos(), obj:getDir(), targetPos, angle, 10000)
   if (result) then
   -- log("success angle: " .. tostring(angle))
   end
   return result
end


function inSector( obj, targetPos, dist, angle )
   return inAngle( obj, targetPos, angle ) and objInDist( obj:getPose():getPos(), targetPos, dist )
end


function getTargetAngle( obj, targetPos )
   return obj:getTargetAngle( targetPos, true )
end

function getTargetAngleDir( obj, targetPos )
   if ( not obj or not targetPos ) then
      return 0
   end

   return obj:getTargetAngle( targetPos, false )
end

function getWords( str )
   local tab = {}
   for w in string.gfind(str, "[%w_.:]+") do
      table.insert(tab, w)
   end
   return tab
end


function loadParam( obj, paramName, defaultValue )
   if ( obj.parameters ~= nil and obj.parameters[paramName] ~= nil and obj.parameters[paramName] ~= "" ) then
      return obj.parameters[paramName]
   end
   return defaultValue
end


function loadParamNumber( obj, paramName, defaultValue )
   local res = tonumber(loadParam(obj, paramName, defaultValue))
   if ( res ) then
      return res
   end
   return defaultValue
end

function loadParamObjects( obj, paramName, defaultValue )
   local tab = loadParam( obj, paramName, defaultValue )

   if ( tab ) then
      tab = getWords(tab)
      local res = {}
      for key in pairs(tab) do
         local object = getObj(tab[key])
         --log( "+" .. tostring(object) )
         if ( object ) then
            res[#res+1] = object
         end
      end

      return res
   end

   return {}
end

function loadParamStrings( obj, paramName, defaultValue )
   local tab = loadParam( obj, paramName, nil )
   if ( tab ) then
      tab = getWords(tab)
      return tab
   end
   return defaultValue
end

function loadParamVec3( obj, paramName, defaultValue )
   local str = loadParam( obj, paramName, nil )
   if ( str ) then
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
   local strings = loadParamStrings(obj, paramName, nil)
   if strings then
      -- expand item lists
      local lists = ""
      for _, s in pairs( strings ) do
         local lst = ItemsLists.getItemsList(s)
         if type(lst) == "string" then
            lists = lists .. "," .. lst
         end
      end

      strings = List(strings)
      strings:extend(stringx.split(lists, ","))

      local items = {}
      local n = 0
      for i, v in ipairs(strings) do
         if ItemsData.isCorrectItemName(v) and ItemsData.ItemsInfo[v] then
            if items[v] == nil and (strings[i+1] == nil or tonumber(strings[i+1]) == nil) then
               items[v] = 1
               n = n + 1
            elseif items[v] == nil and strings[i+1] ~= nil and tonumber(strings[i+1]) ~= nil then
               items[v] = 0
               n = n + 1
            elseif items[v] ~= nil and (strings[i+1] == nil or tonumber(strings[i+1]) == nil) then
               items[v] = items[v] + 1
            end
         elseif tonumber(v) ~= nil then
            local count = math.floor(tonumber(v))
            if strings[i-1] ~= nil and items[strings[i-1]] ~= nil then
               if strings[i+1] ~= nil and tonumber(strings[i+1]) ~= nil then --Means next thing also is a number
                  local nextNumber = math.floor(tonumber(strings[i+1]))
                  count = math.random(count,nextNumber)
               end
               items[strings[i-1]] = items[strings[i-1]] + count
            end
         end
      end
      if n > 0 then
         return items
      end
   end
   return defaultValue
end

function loadParamItemCountsGuessModelSingleItem(obj, paramName, defaultValue)
   local items = loadParamItemCounts(obj, paramName, defaultValue)
   local itemName
   local itemCount = 1
   for name, count in pairs( items ) do
      itemName = name
      itemCount = count
      break
   end
   local autoItem = ItemsLists.getItemForModel(obj:getPrefabName())
   if (not itemName or itemName == "") and not autoItem then
      log(string.format("WARNING: %s %s couldn't guess item from model", obj:getScriptClass(), obj:getName()))
   end
   if (not itemName or itemName == "") and autoItem then
      itemName = autoItem
   end
   return itemName, itemCount
end

function compareObjectTables( tab1, tab2 )
   if ( not tab1 or not tab2 ) then
      return false
   end
   for key1 in pairs(tab1) do
      for key2 in pairs(tab2) do
         if ( tab1[key1] == tab2[key2] ) then
            return true
         end
      end
   end
   return false
end

function getClearName( name )
   return string.gsub(name, "%.[%w]+$", "")
end

function getClosestObject( obj, objects )
   if (table.getn(objects) == 0) then
      return nil
   end

   local index   = 1
   local target  = objects[index]
   local minDist = getDistance( obj:getPose():getPos(), target:getPose():getPos() )

   for key, value in pairs(objects) do
      local dist = getDistance( obj:getPose():getPos(), value:getPose():getPos() )
      if ( dist < minDist ) then
         minDist = dist
         index   = key
      end
   end

   return objects[index]
end

function getClosestObjectInView( obj, objects, angle )
   if (table.getn(objects) == 0) then
      return nil
   end

   local index   = 1
   local minDist = getDistance( obj:getPose():getPos(), objects[index]:getPose():getPos() )
   local found   = false

   --   for key, value in pairs(objects) do
   --    if ( inAngle( obj, value:getPose():getPos(), angle ) == true ) then
   --       minDist = getDistance( obj:getPose():getPos(), value:getPose():getPos() )
   --       index   = key
   --         found   = true
   --         break
   --    end
   -- end

   for key, value in pairs(objects) do
      local dist = getDistance( obj:getPose():getPos(), value:getPose():getPos() )
      if ( inAngle( obj, value:getPose():getPos(), angle ) == true) then
         if (dist <= minDist) then
            minDist = dist
            index   = key
            found   = true
            -- log("found angle " .. tostring(angle) .. " char: " .. value:getLabel())
         end
      end
   end

   if ( not found ) then
      --return getClosestObject( obj, objects )
      return nil
   end

   return objects[index]
end

--timer function for flickering omnis
function omniFlicker( params )
   local pulseSpeed = (math.sin( getGameTime()*5 ) * 0.5 + 0.5) * 10 + 20
   local intensity = clamp( params.intensity - vec3Length(getScene():getEnvirState():getDiffuse()), 0.5, params.intensity )
   intensity = (0.7 + 2 * math.sin(getGameTime() * pulseSpeed * 1.5) * 0.1) * intensity
   params.omni:setIntensity( intensity )
end

------------------------------------------------------------------------------------------------------------------------
currentScene = nil
defaultPlayer               = nil
defaultPlayerCameraHeight   = 160
defaultPlayerCameraOffset   = 53
defaultPlayerCameraDistance = 170
defaultPlayerCameraFov      = 75

function getObj( name, silent )
   local obj = classManager.objTable[name]
   if obj then
      return obj
   elseif not silent then
      log("ERROR: Object named " .. name .. " not found!")
   end
   return nil
end

-- scene
function setScene( scene )
   currentScene = scene
end

function getScene()
   return currentScene
end

-- player
function setDefaultPlayer( player )
   defaultPlayer = player
end

function getDefaultPlayer()
   return defaultPlayer
end

-- camera parameters
function setDefaultPlayerCameraHeight( value )
   defaultPlayerCameraHeight = value
end

function getDefaultPlayerCameraHeight()
   return defaultPlayerCameraHeight
end

function setDefaultPlayerCameraOffset( value )
   defaultPlayerCameraOffset = value
end

function getDefaultPlayerCameraOffset()
   return defaultPlayerCameraOffset
end

function setDefaultPlayerCameraDistance( value )
   defaultPlayerCameraDistance = value
end

function getDefaultPlayerCameraDistance()
   return defaultPlayerCameraDistance
end

function setDefaultPlayerCameraFov( value )
   defaultPlayerCameraFov = value
end

function getDefaultPlayerCameraFov()
   return defaultPlayerCameraFov
end

-- table utils
function tableSize( table )
   if ( not table ) then
      return 0
   end

   local size = 0

   for key in pairs(table) do
      size = size + 1
   end

   return size
end

function tableDeepCopy( source, destiny )
   if source then
      if not destiny then destiny = {} end
      for field, value in pairs(source) do
         if type(value)=="table" then
            rawset(destiny, field, tableDeepCopy(value))
         else
            rawset(destiny, field, value)
         end
      end
   end
   return destiny
end

function pairsByKeys(t, f)
   local a = {}
   for n in pairs(t) do table.insert(a, n) end
   table.sort(a, f)
   local i = 0      -- iterator variable
   local iter = function ()   -- iterator function
      i = i + 1
      if a[i] == nil then return nil
      else return a[i], t[a[i]]
      end
   end
   return iter
end

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

function table_concat(t1,t2)
   for i=1,#t2 do
      t1[#t1+1] = t2[i]
   end
   return t1
end

function getKeyByValue( tab, value )
   for key in pairs(tab) do
      if (tab[key] == value) then
         return key
      end
   end
   return nil
end

function getIndexByKey( tab, key )
   local index = 1
   for k in pairs(tab) do
      if ( k == key ) then
         return index
      end
      index = index + 1
   end
   return nil
end

function getIndexByValue( tab, value )
   local index = 1
   for k in pairs(tab) do
      if ( tab[k] == value ) then
         return index
      end
      index = index + 1
   end
   return nil
end

function inList( list, value )
   for k,v in pairs(list) do
      if ( v == value ) then
         return true
      end
   end

   return false
end

function listInList( list, value )
   if ( table.getn(list) == 0 or table.getn(value) == 0 ) then
      return false
   end

   for k,v in pairs(value) do
      if ( inList(list, v) == false ) then
         return false
      end
   end

   return true
end

function listIsList( list, value )
   if ( table.getn(list) ~= table.getn(value) ) then
      return false
   end

   return listInList( list, value )
end

function mergeArrays(...)
   local resultArray = {}

   for k,v in ipairs(arg) do
      for i=1,#v do resultArray[#resultArray+1] = v[i] end
   end

   return resultArray
end

-------------------------------------------------------------------------------
-- math
-------------------------------------------------------------------------------
function scaleVal( val, cur, max )
   return math.floor((cur * val) / max)
end

function scaleFloatVal( val, cur, max )
   return (cur * val) / max
end

function scaleValueFloat( value, current, max )
   return (value * current) / max
end

function scaleValue( value, current, max )
   return math.floor(scaleValueFloat(value, current, max))
end

function rand( max )
   -- returned [0, max]
   return math.random() * max
end

function randChoice( list )
   return list[math.random(#list)]
end

function round( val, digits )
  local mult = 10^(digits or 0)
  return math.floor(val * mult + 0.5) / mult
end

function sign( val )
   if ( val < 0 ) then
      return -1
   end

   return 1
end

function clamp( val, minf, maxf )
   if val < minf then return minf
   elseif val > maxf then return maxf end
   return val
end

function vec3Clamp( val, minf, maxf )
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

function vecMix( v1, v2, factor )
   local res = {}
   for k in pairs(v1) do res[k] = v1[k] * (1.0-factor) + v2[k] * factor end
   return res
end

function mixF( v1, v2, factor )
   return v1 * (1.0-factor) + v2 * factor
end

function vecInvert( v1 )
   local res = {}
   for k in pairs(v1) do res[k] = -v1[k]end
   return res
end
