local random = require "random"

local test = require "gambiarra"
local testingHelpers = require "testingHelpers"

-- luacheck: read globals ok spy eq

testingHelpers.assureLog()

-- setting up basic test events handler
test(testingHelpers.getEventsHandlerSimpleLogger(_G.log))

local vec3New = _G.vec3New
if not vec3New then
   local gfuncs = testingHelpers.sandboxedRequire "global.globalFunctions"
   vec3New = gfuncs.vec3New
end
local shuffle = random.shuffle

test("vec3New test", function()
   ok(eq(vec3New(), {x=0,y=0,z=0}), "no arguments produces 0,0,0")
   ok(eq(vec3New(1), {x=1,y=0,z=0}), "first argument is x: 1,0,0")
   ok(eq(vec3New(1, 2), {x=1,y=2,z=0}), "second argument is y: 1,2,0")
   ok(eq(vec3New(1, 2, 3), {x=1,y=2,z=3}), "third argument is z: 1,2,3")
   ok(not eq(vec3New(1, 2, 3), vec3New(2,3,1)), "argument order matters")
   ok(eq(vec3New{}, {x=0,y=0,z=0}), "empty table produces 0,0,0")
   ok(eq(vec3New{1}, {x=1,y=0,z=0}), "indexed table first arg is x 1,0,0")
   ok(eq(vec3New{1,2}, {x=1,y=2,z=0}), "indexed table second arg is y 1,2,0")
   ok(eq(vec3New{1,2,3}, {x=1,y=2,z=3}), "indexed table third arg is z 1,2,3")
   ok(not eq(vec3New{1,2,3}, vec3New{3,2,1}), "indexed table arg order matters")
   ok(eq(vec3New{x=1}, {x=1,y=0,z=0}), "mapped table with x key produces 1,0,0")
   ok(eq(vec3New{y=1}, {x=0,y=1,z=0}), "mapped table with y key produces 0,1,0")
   ok(eq(vec3New{z=1}, {x=0,y=0,z=1}), "mapped table with z key produces 0,0,1")
   ok(eq(vec3New{x=1,z=2}, vec3New{z=2,x=1}), "mapped table with key order doesn't matter")
   ok(eq(vec3New{y=3,x=1,z=2}, vec3New{y=3,z=2,x=1}), "mapped table with key order doesn't matter")
   ok(eq(vec3New{1,2,3}, vec3New(1,2,3)), "args and indexed table follow same rules")
end)

test("shuffle test", function()
   ok(eq(shuffle{}, {}), "handles empty tables")
   ok(eq(shuffle{1}, {1}), "handles tables with one element")
   ok(eq(shuffle{a=11, 1}, {1}), "ignores named elements in tables")
   ok(eq(shuffle{[-1]=1,[1]=2,[3]=3}, {2}), "ignores irregular indices and holes")
end)


local resultGroups = {
   ["1"] = {
      "object_2",
      "object_3",
      "object_5",
      "object_15",
   },
   ["2"] = {
      "object_2",
      "object_5",
      "object_15",
   },
}

local objectGroups = {
   ["1"] = {
      "object_15",
      "object_2",
      "object_5",
      "object_3",
   },
   ["2"] = {
      "object_2",
      "object_3l",
      "object_5",
      "object_15",
      "object",
   },
}

local objectsInGroupEnv = {}
setmetatable(objectsInGroupEnv, {__index=_G})
objectsInGroupEnv.getObjectsInGroup = function(groupName)
   return objectGroups[groupName]
end

test("getObjectsInGroupOrdered test", function()
   local spylog, restorelog = testingHelpers.spylogReplace(spy)
   setfenv(getObjectsInGroupOrdered, objectsInGroupEnv)
   ok(eq(getObjectsInGroupOrdered("1", true), resultGroups["1"]), "properly orders a table")
   ok(eq(getObjectsInGroupOrdered("2", false), resultGroups["2"]), "skips bad object names and properly orders the rest")
   setfenv(getObjectsInGroupOrdered, _G)
   restorelog()

   local expected = {
      { "WARNING: getObjectsInGroupOrdered skipped a non-pattern named object: object_3l" },
      { "WARNING: getObjectsInGroupOrdered skipped a non-pattern named object: object" },
   }
   ok(eq(spylog.called[1], expected[1]), "raises a warning for 'object_3l'")
   ok(eq(spylog.called[2], expected[2]), "raises a warning for 'object'")
end)