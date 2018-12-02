local tablex = require "pl.tablex"

local tables = {}

tables.shared = require "soundTables.shared"
tables.crucas = require "soundTables.crucas"
tables.kabarog = require "soundTables.kabarog"
tables.killerbug = require "soundTables.killerbug"
tables.arphant = require "soundTables.arphant"
tables.human_male = require "soundTables.human_male"
tables.mainCharacter = require "soundTables.mainCharacter"
-- tables.abori       = require "soundTables.abori"
-- tables.space_biker = require "soundTables.space_biker"
-- tables.hulk        = require "soundTables.hulk"

local function getTable(name)
   return tables[name] and tablex.deepcopy(tables[name]) or {}
end

return {getTable=getTable}
