local coroutines = require "coroutines"
local coroutineManager = coroutines.getDefaultManager()
local coro = coroutines.helpers
local CAnimationsManager = (require "animationsManager").CAnimationsManager

local hlp = require "helpers"
local pretty = require "pl.pretty"
local tablex = require "pl.tablex"

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

local function removeAnimationEvents(char, animation)
   for event in pairs(char.animationsManager:getAnimationEvents(animation)) do
      char:removeAnimationEvent(animation, event)
   end
end

local function setupEventsSet(char)
   char:addAnimationEvent("dig_delve_right", "dig_sound", 10, 10)
   char:addAnimationEvent("dig_delve_right", "dust", 30, 30)
   char:addAnimationEvent("dig_delve_right", "dig", 50, 50)
   char:addAnimationEvent("dig_delve_right", "morph_out", 80, 80)
   char:addAnimationEvent("dig_delve_right", "end", 98, 98)
   char:addAnimationEvent("pickaxe_front", "end", 50, 50)
end

corotest("playCycle 1", function(next)
   local targetOrder = {
      [1] = "dig_sound",
      [2] = "dust",
      [3] = "dig",
      [4] = "morph_out",
      [5] = "end",
   }
   local order = {}
   local human = hlp.safeCreateEntity("human_male.cfg", "CCharacter")
   removeAnimationEvents(human, "dig_delve_right")
   setupEventsSet(human)

   human.animationsManager:playCycle("dig_delve_right")

   function human.animationsManager:OnAnimationEventIn(animation, event)
      CAnimationsManager.OnAnimationEventIn(human.animationsManager, animation, event) -- Call original
      if animation == "dig_delve_right" then
         table.insert(order, event)
      end
      if event == "end" then
         log("===================")
         ok(eq(targetOrder, order), "single cycle fires all events in correct order")
         log(pretty.write(order))
         log("===================")

         human.animationsManager:stopActionsAndCycles(0)
         hlp.safeDestroyEntity(human)
         next()
      end
   end
end, true)

corotest("playCycle 2", function(next)
   local targetOrder = {
      [1] = "dig_sound",
      [2] = "dust",
      [3] = "dig",
      [4] = "morph_out",
   }
   local order = {}
   local human = hlp.safeCreateEntity("human_male.cfg", "CCharacter")
   removeAnimationEvents(human, "dig_delve_right")
   removeAnimationEvents(human, "pickaxe_front")
   setupEventsSet(human)

   human.animationsManager:playCycle("dig_delve_right")

   function human.animationsManager:OnAnimationEventIn(animation, event)
      CAnimationsManager.OnAnimationEventIn(human.animationsManager, animation, event) -- Call original
      if animation == "dig_delve_right" then
         table.insert(order, event)
      end
      if animation == "dig_delve_right" and event == "morph_out" then
         human.animationsManager:playCycle("pickaxe_front", 1)
      elseif animation == "pickaxe_front" and event == "end" then
         log("===================")
         ok(eq(targetOrder, order), "1s morph into another animation should escape further events")
         log(pretty.write(order))
         log("===================")

         human.animationsManager:stopActionsAndCycles(0)
         hlp.safeDestroyEntity(human)
         next()
      end
   end
end, true)

corotest("playCycle 2.5", function(next)
   local targetOrder = {
      [1] = "dig_sound",
      [2] = "dust",
      [3] = "dig",
      [4] = "morph_out",
   }
   local order = {}
   local human = hlp.safeCreateEntity("human_male.cfg", "CCharacter")
   removeAnimationEvents(human, "dig_delve_right")
   removeAnimationEvents(human, "pickaxe_front")
   setupEventsSet(human)

   human.animationsManager:playCycle("dig_delve_right")

   function human.animationsManager:OnAnimationEventIn(animation, event)
      CAnimationsManager.OnAnimationEventIn(human.animationsManager, animation, event) -- Call original
      if animation == "dig_delve_right" then
         table.insert(order, event)
      end
      if animation == "dig_delve_right" and event == "morph_out" then
         human.animationsManager:playCycle("pickaxe_front", 0)
      elseif animation == "pickaxe_front" and event == "end" then
         log("===================")
         ok(eq(targetOrder, order), "0s morph into another animation should escape further events")
         log(pretty.write(order))
         log("===================")

         human.animationsManager:stopActionsAndCycles(0)
         hlp.safeDestroyEntity(human)
         next()
      end
   end
end, true)

corotest("playCycle 3", function(next)
   local targetOrder = {
      [1] = "dig_sound",
      [2] = "dust",
      [3] = "dig",
      [4] = "morph_out",
   }
   local order = {}
   local human = hlp.safeCreateEntity("human_male.cfg", "CCharacter")
   removeAnimationEvents(human, "dig_delve_right")
   removeAnimationEvents(human, "pickaxe_front")
   setupEventsSet(human)

   human.animationsManager:playCycle("dig_delve_right")

   function human.animationsManager:OnAnimationEventIn(animation, event)
      CAnimationsManager.OnAnimationEventIn(human.animationsManager, animation, event) -- Call original
      if animation == "dig_delve_right" then
         table.insert(order, event)
      end
      if animation == "dig_delve_right" and event == "morph_out" then
         human.animationsManager:stopCycle("dig_delve_right", 1)
         human.animationsManager:playCycle("pickaxe_front")
      elseif animation == "pickaxe_front" and event == "end" then
         log("===================")
         ok(eq(targetOrder, order), "stopping the cycle with '1s' delay (before playing another anim) should escape further events")
         log(pretty.write(order))
         log("===================")

         human.animationsManager:stopActionsAndCycles(0)
         hlp.safeDestroyEntity(human)
         next()
      end
   end
end, true)

corotest("playCycle 3.5", function(next)
   local targetOrder = {
      [1] = "dig_sound",
      [2] = "dust",
      [3] = "dig",
      [4] = "morph_out",
   }
   local order = {}
   local human = hlp.safeCreateEntity("human_male.cfg", "CCharacter")
   removeAnimationEvents(human, "dig_delve_right")
   removeAnimationEvents(human, "pickaxe_front")
   setupEventsSet(human)

   human.animationsManager:playCycle("dig_delve_right")

   function human.animationsManager:OnAnimationEventIn(animation, event)
      CAnimationsManager.OnAnimationEventIn(human.animationsManager, animation, event) -- Call original
      if animation == "dig_delve_right" then
         table.insert(order, event)
      end
      if animation == "dig_delve_right" and event == "morph_out" then
         human.animationsManager:stopCycle("dig_delve_right", 0)
         human.animationsManager:playCycle("pickaxe_front")
      elseif animation == "pickaxe_front" and event == "end" then
         log("===================")
         ok(eq(targetOrder, order), "stopping the cycle with '0s' delay (before playing another anim) should escape further events")
         log(pretty.write(order))
         log("===================")

         human.animationsManager:stopActionsAndCycles(0)
         hlp.safeDestroyEntity(human)
         next()
      end
   end
end, true)

corotest("playCycle 4", function(next)
   local targetOrder = {
      [1] = "dig_sound",
      [2] = "dust",
      [3] = "dig",
      [4] = "morph_out",
   }
   local order = {}
   local human = hlp.safeCreateEntity("human_male.cfg", "CCharacter")
   removeAnimationEvents(human, "dig_delve_right")
   setupEventsSet(human)

   human.animationsManager:playCycle("dig_delve_right")

   function human.animationsManager:OnAnimationEventIn(animation, event)
      CAnimationsManager.OnAnimationEventIn(human.animationsManager, animation, event) -- Call original
      if animation == "dig_delve_right" then
         table.insert(order, event)
      end
      if animation == "dig_delve_right" and event == "morph_out" then
         human.animationsManager:stopCycle("dig_delve_right", 1)
      end
   end

   coro.wait(4)

   log("===================")
   ok(eq(targetOrder, order), "stopping the cycle with 1s delay should escape further events")
   log(pretty.write(order))
   log("===================")

   human.animationsManager:stopActionsAndCycles(0)
   hlp.safeDestroyEntity(human)

   next()
end, true)

corotest("playCycle 4.5", function(next)
   local targetOrder = {
      [1] = "dig_sound",
      [2] = "dust",
      [3] = "dig",
      [4] = "morph_out",
   }
   local order = {}
   local human = hlp.safeCreateEntity("human_male.cfg", "CCharacter")
   removeAnimationEvents(human, "dig_delve_right")
   setupEventsSet(human)

   human.animationsManager:playCycle("dig_delve_right")

   function human.animationsManager:OnAnimationEventIn(animation, event)
      CAnimationsManager.OnAnimationEventIn(human.animationsManager, animation, event) -- Call original
      if animation == "dig_delve_right" then
         table.insert(order, event)
      end
      if animation == "dig_delve_right" and event == "morph_out" then
         human.animationsManager:stopCycle("dig_delve_right", 0)
      end
   end

   coro.wait(4)

   log("===================")
   ok(eq(targetOrder, order), "stopping the cycle with 0s delay should escape further events")
   log(pretty.write(order))
   log("===================")

   human.animationsManager:stopActionsAndCycles(0)
   hlp.safeDestroyEntity(human)

   next()
end, true)


corotest("playCycle 5", function(next)
   local caught = false
   local catch = function() caught = true end
   local human = hlp.safeCreateEntity("human_male.cfg", "CCharacter")
   removeAnimationEvents(human, "dig_delve_right")
   setupEventsSet(human)

   human.animationsManager:playCycle("dig_delve_right")

   function human.animationsManager:OnAnimationEventIn(animation, event)
      CAnimationsManager.OnAnimationEventIn(human.animationsManager, animation, event) -- Call original
      if animation == "dig_delve_right" and event == "morph_out" then
         human.animationsManager:stopCycle("dig_delve_right")
      end
   end
   function human.animationsManager:OnAnimationStop(animation)
      CAnimationsManager.OnAnimationStop(human.animationsManager, animation) -- Call original
      catch()
   end

   coro.wait(4)

   log("===================")
   ok(eq(caught, true), "stopping the cycle fires 'OnAnimationStop'")
   log("===================")

   human.animationsManager:stopActionsAndCycles(0)
   hlp.safeDestroyEntity(human)

   next()
end, true)