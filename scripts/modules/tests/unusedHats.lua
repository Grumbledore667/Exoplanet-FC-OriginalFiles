local hlp = require "helpers"
local pretty = require "pl.pretty"
local tablex = require "pl.tablex"

local test = require "gambiarra"
local testingHelpers = require "testingHelpers"

-- luacheck: read globals ok spy eq
testingHelpers.assureLog()

-- setting up basic test events handler
test(testingHelpers.getEventsHandlerSimpleLogger(_G.log))


test("Unused human hats", function()
   local amount = 0
   local posX = 0
   local posZ = 0
   local ItemsInfo = require "itemsData".ItemsInfo
   local hats = getFolderElements("\\gdata\\objects\\hats\\*.sbg", false, true)
   hats = tablex.filter(hats, function(v)
      return not string.find(v, "^hair") and not string.find(v, "^abori_") and not string.find(v, "^hulk_")
   end)
   for _,prefabName in ipairs(hats) do
      if not tablex.search(ItemsInfo, prefabName) then
         local dummy = getScene():createEntity("human_male.cfg", "CCharacter")
         dummy:getPose():setPos(vec3New(posX, 0, posZ))
         dummy:setupAppearance("human_male_naked")
         dummy.getLabel = function()
            return prefabName
         end
         local hat = getScene():createEntity(prefabName, "")
         hat:getPose():setParent(dummy:getBonePose("head_slot"))
         hat:getPose():resetLocalPose()
         posX = posX + 250
         if posX > 1250 then
            posX = 0
            posZ = posZ + 250
         end
         amount = amount + 1
      end
   end
   log("Unused human hats: " .. amount)
end)
