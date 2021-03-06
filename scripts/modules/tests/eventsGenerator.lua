local EventsGenerator = require "eventsGenerator"

local test = require "gambiarra"
local testingHelpers = require "testingHelpers"

-- luacheck: read globals ok spy eq

testingHelpers.assureLog()

-- setting up basic test events handler
test(testingHelpers.getEventsHandlerSimpleLogger(_G.log))


local animationEvents, events, sounds, assignEvent, event, eventUnassigned, sound
local function setup()
   local aboriGen = EventsGenerator()
   -- data
   animationEvents, events, sounds = aboriGen.animationEvents, aboriGen.events, aboriGen.sounds
   -- dsl functions
   assignEvent, event, eventUnassigned, sound = aboriGen.assignEvent, aboriGen.event, aboriGen.eventUnassigned, aboriGen.sound
end

local function assigntest(name, f, async)
   -- we need to reset data tables before each test
   setup()
   test(name, f, async)
end

local eventtest = assigntest
local soundtest = assigntest

assigntest("single event assignment", function()
   assignEvent "melee_idle_1h_weapon_1" "attack" {19, 21}
   local result = {
      ["melee_idle_1h_weapon_1"] = {
         attack = {19, 21}
      }
   }
   ok(eq(animationEvents, result), "one animation, one event, in and out frames")
end)

assigntest("different assignment", function()
   assignEvent "melee_idle_1h_weapon_2" "attack" {17, 20}
   local result = {
      ["melee_idle_1h_weapon_2"] = {
         attack = {17, 20}
      }
   }
   ok(eq(animationEvents, result), "one animation, one event, in and out frames")
end)

assigntest("multiple assignments", function()
   assignEvent "melee_idle_1h_weapon_1" "attack" {19, 21}
   assignEvent "melee_idle_1h_weapon_2" "attack" {17, 20}
   local result = {
      ["melee_idle_1h_weapon_1"] = {
         attack = {19, 21}
      },
      ["melee_idle_1h_weapon_2"] = {
         attack = {17, 20}
      }
   }
   ok(eq(animationEvents, result), "two animations, two events")
end)

assigntest("can be called more than once for animation", function()
   assignEvent "melee_idle_1h_weapon_1" "attack" {19, 21}
   assignEvent "melee_idle_1h_weapon_1" "attack_end" {17, 20}
   local result = {
      ["melee_idle_1h_weapon_1"] = {
         attack = {19, 21},
         attack_end = {17, 20}
      },
   }
   ok(eq(animationEvents, result), "one animation, two events")
end)

assigntest("can assign single frame", function()
   assignEvent "melee_idle_1h_weapon_2" "attack_end" {25}
   local result = {
      ["melee_idle_1h_weapon_2"] = {
         attack_end = {25, 25},
      }
   }
   ok(eq(animationEvents, result), "same in and out frame")
end)

assigntest("multiple events per line", function()
   assignEvent "melee_idle_1h_weapon_2" "attack" {17, 20} "attack_end" {25}
   local result = {
      ["melee_idle_1h_weapon_2"] = {
         attack = {17, 20},
         attack_end = {25, 25},
      }
   }
   ok(eq(animationEvents, result), "one animation, two events")
end)

assigntest("triple event assignment per line", function()
   assignEvent "sit_swift_smoke" "smoking_draw" {57} "smoking_blow" {93} "smoke" {93, 158}
   local result = {
      ["sit_swift_smoke"] = {
         smoking_draw = {57, 57},
         smoking_blow = {93, 93},
         smoke = {93, 158},
      }
   }
   ok(eq(animationEvents, result), "one animation, three events")
end)

assigntest("logs correct errors", function()
   local spylog, restorelog = testingHelpers.spylogReplace(spy)
   assignEvent "sit_swift_smoke" "smoking_draw" {-1}
   assignEvent "sit_swift_smoke" "smoking_blow" {}
   assignEvent "sit_swift_smoke" "" {1}
   assignEvent "sit_swift_smoke" {"smoking_blow"} {1}
   assignEvent "" "smoking_draw" {1}
   assignEvent {} "smoking_draw" {1}
   restorelog()
   local expected = {
      {"ERROR: can't add event 'smoking_draw' to 'sit_swift_smoke': negative frame"},
      {"ERROR: can't add event 'smoking_blow' to 'sit_swift_smoke': unspecified frame"},
      {"ERROR: can't add event to 'sit_swift_smoke': event name must be non-empty string"},
      {"ERROR: can't add event to 'sit_swift_smoke': event name must be non-empty string"},
      {"ERROR: can't add event 'smoking_draw': animation name must be non-empty string"},
      {"ERROR: can't add event 'smoking_draw': animation name must be non-empty string"},
   }
   ok(eq(#spylog.called, 6), "6 error logs")
   ok(eq(spylog.called[1], expected[1]), "error on negative frame")
   ok(eq(spylog.called[2], expected[2]), "error on no frame")
   ok(eq(spylog.called[3], expected[3]), "error on empty string event name")
   ok(eq(spylog.called[4], expected[4]), "error on event different type")
   ok(eq(spylog.called[5], expected[5]), "error on animation empty string")
   ok(eq(spylog.called[6], expected[6]), "error on animation different type")
end)

assigntest("frame errors don't break the chain", function()
   local _, restorelog = testingHelpers.spylogReplace(spy)
   assignEvent "sit_swift_smoke" "smoking_draw" {-1} "smoking_blow" {} "smoking2" {1}
   restorelog()
   local expected = {
      ["sit_swift_smoke"] = {
         smoking2 = {1, 1},
      }
   }
   ok(eq(animationEvents, expected), "correct events after failed are assigned")
end)

eventtest("can specify one sound for event with frameIn", function()
   assignEvent "blabla" "attack" {0}
   event "attack" {"Play_bug_attack"}
   local result = {
      attack = {
         frameIn = {"Play_bug_attack"}
      }
   }
   ok(eq(events, result), "single sound in event and a frameIn")
end)

eventtest("strings are lowercased", function()
   assignEvent "melee_idle_1h_weapon_2" "ATTACK" {17, 20}
   assignEvent "MELEE_IDLE_1H_WEAPON_2" "AtTacK2" {17, 20}
   event "ATTAck" {"Play_bug_attack"}
   local result = {
      ["melee_idle_1h_weapon_2"] = {
         attack = {17, 20},
         attack2 = {17, 20}
      }
   }
   ok(eq(animationEvents, result), "animation event names")
   ok(eq(events, {
      attack = {
         frameIn = {"Play_bug_attack"}
      }
   }), "event definitions names")
end)

eventtest("can't specify sounds for events that aren't assigned to animations", function()
   local spylog, restorelog = testingHelpers.spylogReplace(spy)
   event "attack" {"Play_bug_attack"}
   restorelog()
   local expected = {
      {"ERROR: declaring unused event 'attack'"},
   }
   ok(eq(spylog.called[1], expected[1]), "error is logged for unassigned events")
end)

eventtest("eventUnassigned can specify sounds for events that aren't assigned to animations", function()
   eventUnassigned "step" {"Play_step_dirt_1"}
   ok(eq(events, {step={frameIn={"Play_step_dirt_1"}}}), "eventUnassigned set an unassigned event")
end)

eventtest("can't define event multiple times", function()
   local spylog, restorelog = testingHelpers.spylogReplace(spy)
   assignEvent "blabla" "attack" {0}
   event "attack" {"Play_bug_attack"}
   event "attack" {"Play_bug_attack"}
   restorelog()
   local expected = {
      {"ERROR: event 'attack' already defined"},
   }
   ok(eq(spylog.called[1], expected[1]), "error is logged for duplicate event definition")
end)

eventtest("event name definition must be a non-empty string", function()
   local spylog, restorelog = testingHelpers.spylogReplace(spy)
   assignEvent "blabla" "attack" {0}
   event "" {"Play_bug_attack"}
   event {} {"Play_bug_attack"}
   restorelog()
   local expected = {
      {"ERROR: event definition must use a non-empty string for event name"},
      {"ERROR: event definition must use a non-empty string for event name"},
   }
   ok(eq(spylog.called[1], expected[1]), "error is logged for empty string")
   ok(eq(spylog.called[2], expected[2]), "error is logged for not string")
end)

eventtest("event frameIn and frameOut must receive tables", function()
   local spylog, restorelog = testingHelpers.spylogReplace(spy)
   assignEvent "blabla" "attack" {0}
   event "attack" ""
   restorelog()
   local expected = {
      {"ERROR: event 'attack' must use tables for frameIn/Out events"},
   }
   ok(eq(spylog.called[1], expected[1]), "error is logged for non-tables")
end)

soundtest("sound saved with params", function()
   assignEvent "bla" "attack" {0}
   event "attack" {"Play_bug_attack"}
   sound "Play_bug_attack" {distance=4000; channel=0; priority=0}
   ok(eq(sounds, {["Play_bug_attack"]={distance=4000,channel=0,priority=0}}), "params stored")
end)

soundtest("wav filenames converted to lowercase", function()
   assignEvent "bla" "attack" {0}
   event "attack" {"Play_bug_attack"}
   sound "Play_bug_attack" {distance=4000; channel=0; priority=0}
   ok(eq(sounds, {["Play_bug_attack"]={distance=4000,channel=0,priority=0}}), "wave names lowered")
end)

soundtest("sound error handling", function()
   local spylog, restorelog = testingHelpers.spylogReplace(spy)
   assignEvent "bla" "attack" {0}
   event "attack" {"Play_bug_attack"}
   sound "" {distance=4000; channel=0; priority=0}
   sound {} {distance=4000; channel=0; priority=0}
   sound "Play_bug_attack" "{distance=4000; channel=0; priority=0}"
   sound "Play_bug_attack" {channel=0; priority=0}
   sound "Play_bug_attack" {distance=4000; priority=0}
   sound "Play_bug_attack" {distance=4000; channel=0}
   sound "Play_bug_attack" {distance="4000"; channel=0; priority=0}
   sound "Play_bug_attack" {distance=4000; channel="0"; priority=0}
   sound "Play_bug_attack" {distance=4000; channel=0; priority="0"}

   restorelog()
   local expected = {
      {"ERROR: sound declarations must use non-empty strings"},
      {"ERROR: sound declarations must use non-empty strings"},
      {"ERROR: sound 'Play_bug_attack' must use a table for parameters"},
      {"ERROR: sound 'Play_bug_attack' parameters must include distance, channel and priority"},
      {"ERROR: sound 'Play_bug_attack' parameters must include distance, channel and priority"},
      {"ERROR: sound 'Play_bug_attack' parameters must include distance, channel and priority"},
      {"ERROR: sound 'Play_bug_attack' parameters must be all integers"},
   }
   ok(eq(spylog.called[1], expected[1]), "error is logged for empty strings")
   ok(eq(spylog.called[2], expected[2]), "error is logged for non-strings")
   ok(eq(spylog.called[3], expected[3]), "sound parameters is a table")
   ok(eq(spylog.called[4], expected[4]), "sound parameters has distance")
   ok(eq(spylog.called[5], expected[5]), "sound parameters has channel")
   ok(eq(spylog.called[6], expected[6]), "sound parameters has priority")
   ok(eq({
      spylog.called[7],
      spylog.called[8],
      spylog.called[9],
   }, {
      expected[7],
      expected[7],
      expected[7],
   }), "sound parameters must be integers")
end)
