local animations = {
   idle = {
      default = "idle",
   },
   walk = {
      front = {
         default = "walk_front",
      },
      back = {
         default = "walk_front",
      },
      left = {
         default = "walk_left",
      },
      right = {
         default = "walk_right",
      },
   },
   run = {
      front = {
         default = "run_front",
      },
      back = {
         default = "run_front",
      },
      left = {
         default = "run_left",
      },
      right = {
         default = "run_right",
      },
   },
   sprint = {
      front = {
         default = "run_front",
      }
   },
   jump = {
      default = "jump_front"
   },
   attack = {
      default = "suck"
   },
   attackAlt = {
      default = "suck"
   },
   hit = {
      default = "hit",
   },
   release = {
      default = "idle",
   },
   die = {
      default = "death",
   },
}

local EventsGenerator = require "eventsGenerator"
local generator = EventsGenerator()
-- data
local animationEvents, events, sounds = generator.animationEvents, generator.events, generator.sounds
-- dsl functions
local assignEvent, event, eventUnassigned, sound = generator.assignEvent, generator.event, generator.eventUnassigned, generator.sound

-- assign events to animations here
assignEvent "suck"       "attack_start" {0} "attack" {0}
assignEvent "jump_ready" "threat" {0}
assignEvent "idle"       "idle"   {0}
assignEvent "walk_front" "walk"   {0}
assignEvent "walk_left"  "walk"   {0}
assignEvent "walk_right" "walk"   {0}
assignEvent "run_front"  "walk"   {0}
assignEvent "run_left"   "walk"   {0}
assignEvent "run_right"  "walk"   {0}
assignEvent "escaping"   "threat" {0}
assignEvent "hit"        "hurt"   {0}

-- assign sounds to events here
event "attack_start" {"Play_bug_attack"}
event "idle"         {"Play_bug_live"}
event "walk"         {"Play_bug_walk"}
event "threat"       {"Play_bug_warn"}
event "hurt"         {"Play_bug_hit"}
eventUnassigned "death" {"Play_bug_death", "Play_body_damage1"}

-- set sound parameters here
sound "Play_bug_live"     {distance = 1500, channel = 0, priority = 1}
sound "Play_bug_walk"     {distance = 1500, channel = 0, priority = 1}
sound "Play_bug_attack"   {distance = 1750, channel = 0, priority = 2}
sound "Play_bug_warn"     {distance = 1750, channel = 0, priority = 2}
sound "Play_bug_hit"      {distance = 1750, channel = 0, priority = 2}
sound "Play_bug_death"    {distance = 1750, channel = 0, priority = 10}
sound "Play_body_damage1" {distance = 250,  channel = 1, priority = 1}

local data = {}

data.animations      = animations
data.animationEvents = animationEvents
data.events          = events
data.sounds          = sounds

return data
