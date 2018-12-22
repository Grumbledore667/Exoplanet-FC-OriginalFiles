local tablex = require "pl.tablex"
local stringx = require "pl.stringx"
local persistence = require "persistence"
local stringio = require "pl.stringio"

local persistentTable = {}

local api = {}

function api.init()
   api.fetchPersistentTable()
end

function api.addToPersistentTable(tablePath, data)
   if type(tablePath) ~= "string" then return end
   local keysList = stringx.split(tablePath)
   local t = persistentTable
   for index,keyName in ipairs(keysList) do
      if index < #keysList then --dig into the table
         if type(t[keyName]) ~= "table" then
            t[keyName] = {}
         end
         t = t[keyName]
      else --save the data
         if type(data) == "table" then
            t[keyName] = tablex.deepcopy(data)
         else
            t[keyName] = data
         end
      end
   end
end

function api.setPersistentTable(t)
   persistentTable = t
end

function api.getPersistentTable()
   return persistentTable
end

function api.fetchPersistentTable()
   local pt
   local persistentString = getPersistentData()
   if persistentString and persistentString ~= "" then
      local f, err = loadstring(persistentString, "getPersistentData string")
      if err then
         log(err)
         return
      end

      pt = f()
   end
   if type(pt) == "table" then
      api.setPersistentTable(pt)
   end
end

--Updates the lua table from persistent string on simulations END
function api.commitPersistentTable()
   local str = stringio.create()
   persistence.store(str, persistentTable)
   setPersistentData(str:value())
end

return api
