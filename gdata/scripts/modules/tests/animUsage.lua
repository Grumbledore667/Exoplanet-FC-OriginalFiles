local AnimationTables

local hlp = require "helpers"
local pretty = require "pl.pretty"
local tablex = require "pl.tablex"

local test = require "gambiarra"
local testingHelpers = require "testingHelpers"

-- luacheck: read globals ok spy eq
testingHelpers.assureLog()

-- setting up basic test events handler
test(testingHelpers.getEventsHandlerSimpleLogger(_G.log))

local function getAnimationsList(prefabName)
   --If the prefab from animal folder or people
   local animalsMap = tablex.index_map(getFolderElements("\\gdata\\characters\\animals\\*", true, false))
   local peopleMap = tablex.index_map(getFolderElements("\\gdata\\characters\\people\\*", true, false))

   local t
   if animalsMap[prefabName] then
      t = animalsMap[prefabName] and getFolderElements("\\gdata\\characters\\animals\\" .. prefabName .. "\\*.caf", false, true)
   elseif peopleMap[prefabName] then
      t = peopleMap[prefabName] and getFolderElements("\\gdata\\characters\\people\\" .. prefabName .. "\\*.caf", false, true)
   end
   return t
end


test("Presence in animationTables", function()
   AnimationTables = require "animationTables"
   local tablesList = getFolderElements("\\gdata\\scripts\\modules\\animationTables\\*.lua", false, true)
   for _, fileName in pairs(tablesList) do
      local missing = 0
      local prefabName = string.gsub(fileName, ".lua$", "")
      local animationsList = getAnimationsList(prefabName)
      if animationsList and #animationsList > 0 then
         log("---PRESENCE TEST: '" .. prefabName .. "'---")
         local animationTable = AnimationTables.getTable(prefabName).animations

         for _, fileName in pairs(animationsList) do
            local animName = string.gsub(fileName, ".caf$", "")
            if not tablex.search(animationTable, animName) then
               missing = missing + 1
               log(animName)
            end
         end
         log("---PRESENCE TEST: '" .. prefabName .. "' DONE. " .. missing .. " missing animations!---")
      else
         log("---PRESENCE TEST: '" .. prefabName .. "' - SKIPPED---")
      end
   end
end)


test("Deprecated animation names", function()
   AnimationTables = require "animationTables"
   local tablesList = getFolderElements("\\gdata\\scripts\\modules\\animationTables\\*.lua", false, true)
   for _, fileName in pairs(tablesList) do
      local deprecated = 0
      local prefabName = string.gsub(fileName, ".lua$", "")
      local animationsList = getAnimationsList(prefabName)

      if animationsList and #animationsList > 0 then
         log("---ACTUALITY TEST: '" .. prefabName .. "'---")
         local animationTable = AnimationTables.getTable(prefabName).animations
         local animationsMap = tablex.index_map(tablex.imap(function(value)
            value = string.lower(value)
            return string.gsub(value, ".caf$", "")
         end, animationsList))
         ---Recursive function that searches the animationTable for unexisting animations
         local function isAnimationDeprecated(value)
            if type(value) == "table" then
               for k,v in pairs(value) do
                  isAnimationDeprecated(v)
               end
            elseif type(value) == "string" then
               if value ~= "" and not animationsMap[value] then
                  deprecated = deprecated + 1
                  log(value)
               end
            end
         end
         isAnimationDeprecated(animationTable)

         log("---ACTUALITY TEST: '" .. prefabName .. "' DONE. " .. deprecated .. " deprecated animations!---")
      else
         log("---ACTUALITY TEST: '" .. prefabName .. "' - SKIPPED---")
      end
   end
end)