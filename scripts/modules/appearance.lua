local tablex = require "pl.tablex"
local Data = require "appearanceStyles"

local api = {
   debugDataReload = false
}

function api.getStyleFor(styleName, char)
   if not styleName or not char then return end
   styleName = string.lower(styleName)
   local prefabStripped = string.gsub(char:getPrefabName(), ".cfg$", "")

   local data = api.getAllData()

   return data[prefabStripped] and tablex.deepcopy(data[prefabStripped][styleName])
end

function api.getDefaultStyleFor(char)
   local prefabStripped = string.gsub(char:getPrefabName(), ".cfg$", "")
   local data = api.getAllData()
   return data[prefabStripped] and tablex.deepcopy(data[prefabStripped][prefabStripped])
end

function api.getAllData()
   --Always reload the file incase it needs to be edited by a developer, but only after the scene is loaded
   if isDebug() and api.debugDataReload then
      package.loaded["appearanceStyles"] = nil
      local reloadedData = require("appearanceStyles")
      Data = reloadedData
   end
   return Data
end

function api.setDebugDataReload(state)
   api.debugDataReload = state
end

return api