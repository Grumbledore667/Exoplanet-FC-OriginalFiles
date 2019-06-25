local tablex = require "pl.tablex"
local Data = require "npcDataTables"

local api = {
   debugDataReload = false
}

function api.getDataFor(charname)
   if not charname then return end

   local data = api.getAllData()

   return tablex.deepcopy(data[charname])
end

function api.getAllData()
   --Always reload the file incase it needs to be edited by a developer, but only after the scene is loaded
   if isDebug() and api.debugDataReload then
      package.loaded["npcDataTables"] = nil
      local reloadedData = require("npcDataTables")
      Data = reloadedData
   end
   return Data
end

function api.setDebugDataReload(state)
   api.debugDataReload = state
end

return api
