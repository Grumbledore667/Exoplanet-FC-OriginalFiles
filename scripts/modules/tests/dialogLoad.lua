local test = require "gambiarra"
local testingHelpers = require "testingHelpers"

-- luacheck: read globals ok spy eq

testingHelpers.assureLog()
testingHelpers.assureMockRng()

local deb = require "global.debug"
local tablex = require "pl.tablex"

-- setting up basic test events handler
local tools = {}
test(testingHelpers.getEventsHandlerSimpleLogger(_G.log), tools)

local function callCount(spiedFunction)
   return spiedFunction.called and #spiedFunction.called or 0
end

local ds = _G.dialogSystem
if not ds then
   local env = setmetatable({}, {__index=_G})
   assert(deb.loadTableFromFile("./gdata/scripts/dialog.lua", env))
   ds = env.dialogSystem
end

local function nodeCounter(root)
   local toProcess = {root}
   local visited = {}
   local count = 0

   while #toProcess > 0 do
      local current = table.remove(toProcess)
      if not visited[current] then
         visited[current] = true
         count = count + 1
         for _, child in pairs(current.messages) do
            table.insert(toProcess, child)
         end
      end
   end
   return count
end

test("simple switch", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy
   local messages = require "tests.data.dialogLoadSwitch"
   ok(tablex.size(messages) == 4, "Load 4 nodes")

   local root = ds:restoreConnections(messages)
   ok(root.text == "root", "Root is root")
   ok(#root.messages == 2, "Root has 2 messages")
   ok(nodeCounter(root) == 3, "Total 3 nodes including root")
   ok(root.messages[1].text == "message 1", "Correct first message")
   ok(root.messages[2].text == "message 2", "Correct second message")
end)

test("simple switch cycle", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy
   local messages = require "tests.data.dialogLoadSwitchCycle"
   ok(tablex.size(messages) == 4, "Load 4 nodes")

   local root = ds:restoreConnections(messages)
   ok(root.text == "root", "Root is root")
   ok(#root.messages == 2, "Root has 2 messages")
   ok(nodeCounter(root) == 3, "Total 3 nodes including root")
   ok(root.messages[1].text == "message 1", "Correct first message")
   ok(root.messages[2].text == "message 2", "Correct second message")
   local message1 = root.messages[1]
   ok(#message1.messages == 2, "first message has 2 children")
   ok(message1.messages[1] == message1, "first message points to itself")
end)

test("guide node", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy
   local messages = require "tests.data.dialogLoadGuideNode"
   ok(tablex.size(messages) == 5, "Load 5 nodes")

   local root = ds:restoreConnections(messages)
   ok(root.text == "root", "Root is root")
   ok(#root.messages == 2, "Root has 2 messages")
   ok(nodeCounter(root) == 3, "Total 3 nodes including root")
   ok(root.messages[1].text == "message 1", "Correct first message")
   ok(root.messages[2].text == "message 2", "Correct second message")
   local message1 = root.messages[1]
   ok(#message1.messages == 2, "first message has 2 children")
   ok(message1.messages[1] == message1, "first message points to itself")
end)

test("10 consecutive guide nodes", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy
   local messages = require "tests.data.dialogLoadGuideNodes10"
   ok(tablex.size(messages) == 14, "Load 14 nodes")

   local root = ds:restoreConnections(messages)
   ok(nodeCounter(root) == 3, "Total 3 nodes including root")
   ok(root.messages[1].text == "message 1", "Correct first message")
   ok(root.messages[2].text == "message 2", "Correct second message")
   local message1 = root.messages[1]
   local message2 = root.messages[2]
   ok(message1.messages[1] == message2, "first message points to second")
end)

test("nested switches", function()
   local ok, eq, spy = tools.ok, tools.eq, tools.spy
   local messages = require "tests.data.dialogLoadNestedSwitches"
   ok(tablex.size(messages) == 9, "Load 9 nodes")

   local root = ds:restoreConnections(messages)
   ok(nodeCounter(root) == 5, "Total 5 nodes including root")
   ok(root.messages[1].text == "message 1", "Correct first message")
   ok(root.messages[2].text == "message 2", "Correct second message")
   ok(root.messages[3].text == "message 3", "Correct third message")
   ok(root.messages[4].text == "message 4", "Correct fourth message")
end)
