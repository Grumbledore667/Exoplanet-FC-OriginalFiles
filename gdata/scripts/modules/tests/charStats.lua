local CCharacterStatModified = require "characterStatModified"
local CCharacterStatSimple = require "characterStatSimple"
local CCharacterStatModifier = require "characterStatModifier"

local coroutines = require "coroutines"
local coroutineManager = coroutines.getDefaultManager()
local coro = coroutines.helpers

local tablex = require "pl.tablex"

local function eqapprox(t1, t2, epsilon)
   return tablex.deepcompare(t1, t2, true, epsilon)
end

local test = require "gambiarra"
local testingHelpers = require "testingHelpers"


-- luacheck: read globals ok spy eq
testingHelpers.assureLog()

-- setting up basic test events handler
test(testingHelpers.getEventsHandlerSimpleLogger(_G.log))

local function corotest(name, fn, async)
   local co = coroutineManager:createCoroutine(fn)
   test(name, function(next) coroutineManager:executeRoutine(co, next) end, async)
end

test("stats test", function()
   local stat
   local statMax
   local modFlat
   local modPercent
   stat = CCharacterStatSimple{value = 350, max = 300}
   ok(eq(stat:getValue(true), 350), "'getValue(true)' can get an unclamped value if the stat wasn't yet clamped")
   ok(eq(stat:getValue(), 300), "'getValue()' will return a clamped value")
   ok(eq(stat:getValue(true), 300), "'getValue(true)' will return a clamped value if the stat was already clamped")

   stat = CCharacterStatSimple{value = 350, min = 0, max = 300}
   ok(eq(stat:getPercent(), 100), "'getPercent()' clamps the value")
   stat = CCharacterStatSimple{value = 0, min = -100, max = 100}
   ok(eq(stat:getPercent(), 50), "'getPercent()' properly calculates percents from a stat with negative min")
   stat = CCharacterStatSimple{value = -75, min = -100, max = -50}
   ok(eq(stat:getPercent(), 50), "'getPercent()' properly calculates percents from a stat with both negative min and max")

   statMax = CCharacterStatModified{baseValue = 300}
   stat = CCharacterStatSimple{value = 350, max = statMax}
   ok(eq(stat:getValue(), statMax:getValue()), "can set a stat as a min/max of another and it will get clamped to that")

   --Modifiers
   modFlat = CCharacterStatModifier{value = 10}
   statMax:addModifier(modFlat)
   ok(eq(statMax:getValue(), 310), "'flat' modifier properly changes the stat's value")

   statMax:removeModifier(modFlat)
   ok(eq(statMax:getValue(), 300), "removing a 'Flat' modifier properly changes the stat's value")

   modPercent = CCharacterStatModifier{value = 3.5, type = "Mult"}
   statMax:addModifier(modPercent)
   ok(eq(statMax:getValue(), 300 + 300 * 3.5), "'Mult' modifier properly changes the stat's value")

   statMax:removeModifier(modPercent)
   ok(eq(statMax:getValue(), 300), "removing a 'Mult' modifier properly changes the stat's value")

   statMax:addModifier(modFlat)
   statMax:addModifier(modPercent)
   ok(eq(statMax:getValue(), 310 + 310 * 3.5), "adding both types of modifiers properly changes the stat's value")
end)


corotest("stats regen test", function(next)
   local statMax = CCharacterStatModified{baseValue = 300}
   local statRegen = CCharacterStatModified{baseValue = 5}
   local stat = CCharacterStatSimple{value = 150, max = statMax, regen = statRegen}

   coro.wait(0.5)

   local timePassed = 0

   local regenTimer
   regenTimer = runTimerAdv(0, true, function(ok)
      local frameTime = getFrameTime()
      timePassed = timePassed + frameTime
      stat:regenTick(frameTime)
      if eqapprox(stat:getValue(), 157.5, 0.01) then
         ok(eqapprox(timePassed, 1.5, 0.01), "after 1.5 seconds a stat with a regen stat attached (baseValue of 5) regenerated 7.5 points")
      elseif eqapprox(stat:getValue(), 160, 0.01) then
         ok(eqapprox(timePassed, 2, 0.01), "after 2 seconds a stat with a regen stat attached (baseValue of 5) regenerated 10 points")
      elseif timePassed > 2.1 then
         regenTimer:stop()
         log("stats regen test: END")
         next()
      end
   end, ok)
end, true)