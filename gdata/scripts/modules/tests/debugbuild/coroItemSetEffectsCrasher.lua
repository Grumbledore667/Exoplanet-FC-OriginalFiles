local CItem = require "items.item".CItem

local test = require "gambiarra"
local testingHelpers = require "testingHelpers"
local corotest = testingHelpers.corotest

local hlp = require "helpers"

-- luacheck: read globals ok spy eq

testingHelpers.assureLog()

-- setting up basic test events handler
test(testingHelpers.getEventsHandlerSimpleLogger(_G.log))

local ITEM_COUNT = 100

--[[
   WARNING: This test must be ran in debug binaries only to count as passed
]]

local items = {}
corotest("create 100 items", function()
   for i = 1, ITEM_COUNT do
      local item = hlp.safeCreateItem("revolver.gun")
      CItem.OnEquip(item, 1, true)
      table.insert(items, item)
   end
   local ok = _G.ok
   runTimerAdv(0, false, function()
      collectgarbage()
      for _, item in ipairs(items) do
         CItem.OnEquip(item, 1, true)
         hlp.safeDestroyEntity(item)
      end
      ok(true, "equipping after coroutine died and garbage collected without crashes")
   end)
end)
