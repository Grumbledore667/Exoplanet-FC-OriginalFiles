local hlp = require "helpers"
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

local MOVE_AND_ORIENTATE_MIN_TIME = 0.1
local TIME = MOVE_AND_ORIENTATE_MIN_TIME + 0.01

test("moveAndOrientate most basic move", function(next)
   local c = hlp.safeCreateEntity("dummy.cfg", "CCharacter")

   c:moveAndOrientate(vec3New{x=100}, c:getDir(), 0)

   runTimerAdv(TIME, false, function()
      ok(eqapprox(c:getPose():getPos(), vec3New{x=100}, 0.01), "x is now 100")
      hlp.safeDestroyEntity(c)
      next()
   end)

end, true)

-- an example of test working with timers
test("moveAndOrientate most basic orient", function(next)
   local c = hlp.safeCreateEntity("dummy.cfg", "CCharacter")
   -- make sure dummy won't rotate to origin as soon as moveAndOrientate stops
   c:setOrientationSpeed(0)

   c:moveAndOrientate(vec3Zero(), vec3New{z=1}, 0)

   runTimerAdv(TIME, false, function()
      ok(eqapprox(c:getDir(), vec3New{z=1}, 0.01), "dir z is now 1")
      hlp.safeDestroyEntity(c)
      next()
   end)

end, true)

corotest("moveAndOrientate moves", function(next)
   local c = hlp.safeCreateEntity("dummy.cfg", "CCharacter")

   ok(not eq(c.stopMoveAndOrientate, nil), "stopMoveAndOrientate method is present")
   ok(eqapprox(c:getPose():getPos(), vec3Zero()), "pos vec3 is at 0,0,0")

   c:moveAndOrientate(vec3New{x=100}, c:getDir(), 0)
   coro.waitCharacterEvent(c, "OnMoveAndOrientateStop")

   ok(true, "OnMoveAndOrientateStop method is called")
   ok(eqapprox(c:getPose():getPos(), vec3New{x=100}, 0.01), "x is now 100")

   hlp.safeDestroyEntity(c)

   next()
end, true)

corotest("moveAndOrientate orients", function(next)
   local c = hlp.safeCreateEntity("dummy.cfg", "CCharacter")
   c:setOrientationSpeed(0)

   ok(eqapprox(c:getDir(), vec3New{z=-1}, 0.01), "dir z is -1")
   c:moveAndOrientate(vec3Zero(), vec3New{z=1}, 0)
   coro.waitCharacterEvent(c, "OnMoveAndOrientateStop")

   ok(true, "OnMoveAndOrientateStop method is called")
   ok(eqapprox(c:getDir(), vec3New{z=1}, 0.01), "dir z is now 1")

   hlp.safeDestroyEntity(c)

   next()
end, true)

-- stopMoveAndOrientate fires event immediately, so waitCharacterEvent on next line
-- is going to miss the event, therefore don't use coroutines and test using
-- plain old callbacks and timers
test("stopMoveAndOrientate fires stop event", function(next)
   local c = hlp.safeCreateEntity("dummy.cfg", "CCharacter")
   c:setOrientationSpeed(0)
   runTimerAdv(0, false, function()
      ok(eqapprox(c:getDir(), vec3New{z=-1}, 0.01), "dir z is -1")
      c:moveAndOrientate(vec3Zero(), vec3New{z=1}, 0)
      c.eventManager:subscribeToEvent("OnMoveAndOrientateStop", function()
         ok(true, "OnMoveAndOrientateStop method is called")

         hlp.safeDestroyEntity(c)
         next()
      end)
      c:stopMoveAndOrientate()
   end)
end, true)

test("can start moveAndOrientate from stop event", function(next)
   local c = hlp.safeCreateEntity("dummy.cfg", "CCharacter")
   c:setOrientationSpeed(0)
   runTimerAdv(0, false, function()
      ok(eqapprox(c:getDir(), vec3New{z=-1}, 0.01), "dir z is -1")
      c:moveAndOrientate(vec3Zero(), vec3New{z=1}, 1)
      local callbackObj
      callbackObj = c.eventManager:subscribeToEvent("OnMoveAndOrientateStop", function()
         ok(true, "first OnMoveAndOrientateStop callback is called")
         ok(not eqapprox(c:getDir(), vec3New{z=1}, 0.01), "dir z is not yet 1")
         c.eventManager:unsubscribeFromEvent("OnMoveAndOrientateStop", callbackObj)

         local secondCallbackObj
         secondCallbackObj = c.eventManager:subscribeToEvent("OnMoveAndOrientateStop", function()
            ok(true, "second OnMoveAndOrientateStop callback is called")
            ok(eqapprox(c:getDir(), vec3New{z=1}, 0.01), "now dir z is 1")
            c.eventManager:unsubscribeFromEvent("OnMoveAndOrientateStop", secondCallbackObj)

            hlp.safeDestroyEntity(c)
            next()
         end)
         c:moveAndOrientate(vec3Zero(), vec3New{z=1}, 0)
      end)
      c:stopMoveAndOrientate()
   end)
end, true)

corotest("moveAndOrientate chain", function(next)
   local c = hlp.safeCreateEntity("dummy.cfg", "CCharacter")
   c:setOrientationSpeed(0)

   c:moveAndOrientate(vec3New{y=100}, vec3New{z=1}, 0)
   coro.waitCharacterEvent(c, "OnMoveAndOrientateStop")

   ok(eqapprox(c:getPose():getPos(), vec3New{y=100}), "pos vec3 is at 0,100,0")
   ok(eqapprox(c:getDir(), vec3New{z=1}, 0.01), "dir z is now 1")

   c:moveAndOrientate(vec3New{y=100,z=100}, vec3New{x=1}, 0)
   coro.waitCharacterEvent(c, "OnMoveAndOrientateStop")

   ok(eqapprox(c:getPose():getPos(), vec3New{y=100,z=100}), "pos vec3 is at 0,100,100")
   ok(eqapprox(c:getDir(), vec3New{x=1}, 0.01), "dir x is now 1")

   hlp.safeDestroyEntity(c)

   next()
end, true)
