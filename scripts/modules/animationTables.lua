local tablex = require "pl.tablex"

local tables = {}

tables.human_male  = require "animationTables.human_male"
tables.abori       = require "animationTables.abori"
tables.space_biker = require "animationTables.space_biker"
tables.hulk        = require "animationTables.hulk"
tables.killerbug   = require "animationTables.killerbug"
tables.crucas      = require "animationTables.crucas"
tables.kabarog     = require "animationTables.kabarog"
tables.arphant     = require "animationTables.arphant"
tables.drone       = require "animationTables.drone"
tables.mainCharacter = require "animationTables.mainCharacter"

local api = {}

function api.getTable(name)
   return tables[name] and tablex.deepcopy(tables[name]) or {animations = {}, animationEvents = {}, events = {}, sounds = {}}
end

function api.getAnimations(name)
   return api.getTable(name).animations
end

return api
