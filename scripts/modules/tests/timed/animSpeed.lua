local coroutines = require "coroutines"
local coroutineManager = coroutines.getDefaultManager()
local coro = coroutines.helpers

local hlp = require "helpers"

local test = require "gambiarra"
local testingHelpers = require "testingHelpers"

-- luacheck: read globals ok spy eq

testingHelpers.assureLog()

-- setting up basic test events handler
test(testingHelpers.getEventsHandlerSimpleLogger(_G.log))

--[[
   WARNING: This test must run at setGameSpeed(1) to pass measurements!
]]

local function myLog(message)
   --log(message)
end
local function myLogF(stringToFormat, ...)
   myLog(string.format(stringToFormat, ...))
end

local function animStop(character)
   character.animationsManager:stopActionsAndCycles(0)
   coro.wait(0)
end
local function corotest(name, fn, async)
   local co = coroutineManager:createCoroutine(fn)
   test(name, function(next) coroutineManager:executeRoutine(co, next) end, async)
end

local function eqapprox(t1, t2, epsilon)
   return math.abs(t1-t2) <= epsilon
end

local function measureAnimEventTimes(character, anim, event, playFunction, args)
   args = args or {}
   local results = {}

   do
      local timer
      animStop(character)
      timer = runTimer(math.huge)
      playFunction(character, anim, unpack(args))

      coro.waitAnimationEventIn(character, anim, event)
      results[1] = timer:getTimeDuration()
      timer:stop()
      animStop(character)
   end
   coro.wait(0)
   do
      local timer
      animStop(character)
      timer = runTimer(math.huge)
      playFunction(character, anim, unpack(args))

      coro.waitAnimationEventOut(character, anim, event)
      results[2] = timer:getTimeDuration()
      timer:stop()
      animStop(character)
   end

   coro.wait(0)
   return results
end

local function measureAnimDuration(character, anim)
   local timer, result
   animStop(character)
   timer = runTimer(math.huge)
   character:playAction(anim, 0, 0, 1, false, 1)

   coro.waitAnimationEnd(character, anim)
   result = timer:getTimeDuration()

   animStop(character)
   coro.wait(0)
   timer:stop()
   return result
end

corotest("shCharacter::playAction speed parameter * animEvents", function(next)
   myLog("starting test shCharacter::playAction speed parameter * animEvents")
   local timeErrorMargin = (1/30)*4
   local frmTime = 1/30
   local c = hlp.safeCreateEntity("human_male.cfg", "CCharacter")
   coro.wait(0)

   local anim = "drink_short"
   local animDuration = measureAnimDuration(c, anim)-- c:getAnimDuration(anim)
   local eventName = "whalala"
   local defInTime =  animDuration * 0.3
   local defOutTime = animDuration * 0.9
   local test2good = {true}
   local result = {}
   local animStarter = function (character, animation, speed)
      local result = character:playAction(animation, 0, 0, 1, false, speed)
      character.animationsManager:animLogger(result, animation)
      test2good[1] = test2good[1] and speed == character:getActionSpeed(animation)
   end

   myLogF("expected anim duration %f", animDuration)

   c:addAnimationEvent(anim, eventName, (defInTime/frmTime), (defOutTime/frmTime))

   for _, speed in ipairs{0.5, 0.25, 1, 3, 10} do
      result[speed] = measureAnimEventTimes(c, anim, eventName, animStarter, {speed})
   end

   c:removeAnimationEvent(anim, eventName)

   ok(test2good[1], "getActionSpeed works with playAction speed param")
   myLogF("expected time in: %f, out: %f", defInTime, defOutTime)

   local allgood = true
   for speed, vals in pairs(result) do
      local inTime, outTime = unpack(vals)
      allgood = (allgood and eqapprox(defInTime /speed, inTime,  timeErrorMargin / math.min(1, speed))
                         and eqapprox(defOutTime/speed, outTime, timeErrorMargin / math.min(1, speed)))
      myLogF("at speed %f times {in: %f, out: %f}",
                       speed,          inTime,  outTime)
      myLogF("  (expected times {in: %f, out: %f})",
                         defInTime /speed,      defOutTime/speed)
   end
   ok(allgood, "animation events firing faster/slower when higher/lower animspeed set (action animation)")

   hlp.safeDestroyEntity(c)
   coro.wait(0)
   next()
end, true)

corotest("shCharacter::setActionSpeed * animEvents", function(next)
   myLog("starting test shCharacter::setActionSpeed * animEvents")
   local timeErrorMargin= (1/30)*4
   local frmTime = 1/30
   local c = hlp.safeCreateEntity("human_male.cfg", "CCharacter")
   coro.wait(0)

   local anim = "drink_short"
   local animDuration = measureAnimDuration(c, anim)
   local eventName = "whalala"
   local defInTime =  animDuration * 0.3
   local defOutTime = animDuration * 0.9
   local result = {}
   local test2good = {true}
   local animStarter = function (character, animation, speed)
      local result = character:playAction(animation, 0, 0, 1, false, 0.1)
      character.animationsManager:animLogger(result, animation)
      character:setActionSpeed(animation, speed)
      test2good[1] = test2good[1] and speed == character:getActionSpeed(animation)
   end

   c:addAnimationEvent(anim, eventName, (defInTime/frmTime), (defOutTime/frmTime))

   for _, val in ipairs{1, 0.25, 2, 3} do
      result[val] = measureAnimEventTimes(c, anim, eventName, animStarter, {val})
   end

   c:removeAnimationEvent(anim, eventName)

   ok(test2good[1], "getActionSpeed works with setActionSpeed")
   myLogF("default time in: %f, out: %f", defInTime, defOutTime)
   local allgood = true
   for speed, vals in pairs(result) do
      local inTime, outTime = unpack(vals)
      allgood = (allgood and eqapprox(defInTime /speed, inTime,  timeErrorMargin / math.min(1, speed))
                         and eqapprox(defOutTime/speed, outTime, timeErrorMargin / math.min(1, speed)))
      myLogF("at speed %f times {in: %f, out: %f}",
                       speed,          inTime,  outTime)
      myLogF("  (expected times {in: %f, out: %f})",
                         defInTime /speed,      defOutTime/speed)
   end
   ok(allgood, "animation events firing faster/slower when higher/lower animspeed set")

   hlp.safeDestroyEntity(c)
   coro.wait(0)
   next()
end, true)

corotest("character anim speed", function(next)
   myLog("starting test character anim speed")
   local c = hlp.safeCreateEntity("human_male.cfg", "CCharacter")
   coro.wait(0)

   local timeErrorMargin = (1/30)*4 --4 frames

   local anim, expectedDuration, results

   local function animStarter(character, animation)
      local result = character:playAction(animation, 0, 0, 1, false, 1)
      character.animationsManager:animLogger(result, animation)
   end
   anim = "drink_short"
   expectedDuration = measureAnimDuration(c, anim) --c:getAnimDuration(anim)
   results = {}

   myLogF("default anim. duration is %f", expectedDuration)


   for _, val in ipairs{1, 0.25, 2} do
      c:setAnimSpeed(val)
      results[val] = measureAnimDuration(c, anim)
   end

   local allgood = true
   for speed, duration in pairs(results) do
      allgood = allgood and eqapprox(expectedDuration/speed, duration, timeErrorMargin)

      myLogF("at speed %f duration is %f, expected %f",
                       speed,         duration,    expectedDuration/speed)
   end
   ok(allgood, "actions animation duration is properly affected by character:setAnimSpeed")

   hlp.safeDestroyEntity(c)
   coro.wait(0)

   myLog("completed test character anim speed")
   next()
end, true)

corotest("character anim speed * animEvents", function(next)
   myLog("starting test character anim speed * animEvents")
   local timeErrorMargin = (1/30)*4
   local frmTime = 1/30
   local c = hlp.safeCreateEntity("human_male.cfg", "CCharacter")
   coro.wait(0)

   myLog("start action test in character anim speed * animEvents" )
   local anim = "drink_short"
   local expectedDuration = c:getAnimDuration(anim)
   local eventName = "whalala"
   local defInTime =  expectedDuration * 0.3
   local defOutTime = expectedDuration * 0.9
   local results = {}
   local animStarter = function (character, animation)
      local result = character:playAction(animation, 0, 0, 1, false, 1)
      character.animationsManager:animLogger(result, animation)
   end

   c:addAnimationEvent(anim, eventName, (defInTime/frmTime), (defOutTime/frmTime))


   for _, val in ipairs{1, 0.25, 2} do
      c:setAnimSpeed(val)
      results[val] = measureAnimEventTimes(c, anim, eventName, animStarter)
   end

   c:removeAnimationEvent(anim, eventName)

   local allgood = true
   for speed, vals in ipairs(results) do
      local inTime, outTime = unpack(vals)
      allgood = (allgood and eqapprox(defInTime /speed, inTime,  timeErrorMargin)
                         and eqapprox(defOutTime/speed, outTime, timeErrorMargin))
   end
   ok(allgood, "animation events firing faster/slower when higher/lower animspeed set (action animation)")

   myLog("start cycle test in character anim speed * animEvents" )

   anim = "idle"
   expectedDuration = c:getAnimDuration(anim)
   eventName = "whalala"
   defInTime =  expectedDuration * 0.3
   defOutTime = expectedDuration * 0.9
   results = {}
   animStarter = function (character, animation)
      local result = character:playCycle(animation, 0, 1, 1)
      character.animationsManager:animLogger(result, animation)
   end
   c:addAnimationEvent(anim, eventName, (defInTime/frmTime), (defOutTime/frmTime))


   c:setAnimSpeed(0.25)
   results[0.25] = measureAnimEventTimes(c, anim, eventName, animStarter)
   c:setAnimSpeed(1)
   results[1] = measureAnimEventTimes(c, anim, eventName, animStarter)
   c:setAnimSpeed(2)
   results[2] = measureAnimEventTimes(c, anim, eventName, animStarter)

   c:removeAnimationEvent(anim, eventName)

   myLogF("default time in: %f, out: %f", defInTime, defOutTime)
   allgood = true
   for speed, vals in ipairs(results) do
      local inTime, outTime = unpack(vals)
      allgood = (allgood and eqapprox(defInTime /speed, inTime,  timeErrorMargin)
                         and eqapprox(defOutTime/speed, outTime, timeErrorMargin))
   end
   ok(allgood, "animation events firing faster/slower when higher/lower animspeed set (cycle animation)")

   hlp.safeDestroyEntity(c)
   coro.wait(0)
   next()
end, true)


corotest("shCharacter::setActionSpeed in the middle of playing this action", function(next)
   myLog("starting test shCharacter::setActionSpeed in the middle of playing this action")
   local timeErrorMargin = (1/30)*6
   local c = hlp.safeCreateEntity("human_male.cfg", "CCharacter")
   coro.wait(0)

   local anim = "drink_short"
   local expectedDuration = measureAnimDuration(c, anim)-- c:getAnimDuration(anim)
   local animStarter = function (character, animation)
      local result = character:playAction(animation, 0, 0, 1, false, 1)
      character.animationsManager:animLogger(result, animation)
   end

   local timer
   local result

   animStop(c)
   timer = runTimer(math.huge)
   animStarter(c, anim)
   runTimer(expectedDuration/3, nil, function()
      c:setActionSpeed(anim, 2)
   end)
   coro.waitAnimationEnd(c, anim)
   result = timer:getTimeDuration()

   myLogF("default anim duration: %f", expectedDuration)
   myLogF("measured duration with messing: %f, expected: %f", result, expectedDuration * 2/3)
   ok( eqapprox(result, expectedDuration * 2/3, timeErrorMargin),
       "setActionSpeed in middle of playing action affects animation playing time correctly"
   )

   timer:stop()
   hlp.safeDestroyEntity(c)
   coro.wait(0)
   next()
end, true)
