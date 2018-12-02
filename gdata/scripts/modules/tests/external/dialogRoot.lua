-- this test checks if previously generated root nodes found by old
-- dialog function restoreConnections actually match root nodes
-- found by current (modified) version of restoreConnections
-- for same dialogs, to make sure changes to this function didn't break things
local function eqRoots(t1, t2)
   for k1, v1 in pairs(t1) do
      local v2 = t2[k1]
      if v2 then
         if v1.ID ~= v2.ID then
            log(string.format("ERROR: dialog %s root differs", k1))
            return false
         end
      end
   end
   return true
end

local test = require "gambiarra"
local testingHelpers = require "testingHelpers"

-- luacheck: read globals ok spy eq

testingHelpers.assureLog()

-- setting up basic test events handler
test(testingHelpers.getEventsHandlerSimpleLogger(_G.log))

--[[
   WARNING: This test currently uses io.popen in "utils.dumpRootMessage" which runs os terminal commands
]]

local existingData = require "tests.external.dialogRootTestData"
local getRootMessages = require "utils.dumpRootMessage"

test("dialog roots", function()
   ok(eqRoots(existingData, getRootMessages()), "root IDs are same")
end)
