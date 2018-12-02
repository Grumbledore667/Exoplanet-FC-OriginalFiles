local animations = {
   idle = {
      default = {"idle","idle_2"},
   },
   walk = {
      back = {
         default = "walk_back",
      },
      front = {
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
      back = {
         default = "run_back",
      },
      front = {
         default = "run_front",
      },
      left = {
         default = "run_left",
      },
      right = {
         default = "run_right",
      },
   },
   turn = {
      left = {
         step    = "turn_left",
         quarter = "turn_left_90",
         full    = "turn_left_180",
      },
      right = {
         step    = "turn_right",
         quarter = "turn_right_90",
         full    = "turn_right_180",
      },
   },
   talk = {
      default = {"idle_talk_1", "idle_talk_2"},
   },
}

local EventsGenerator = require "eventsGenerator"
local generator = EventsGenerator()
-- data
local animationEvents, events, sounds = generator.animationEvents, generator.events, generator.sounds
-- dsl functions
local assignEvent, event, eventUnassigned, sound = generator.assignEvent, generator.event, generator.eventUnassigned, generator.sound
local soundTable, getSoundTable = generator.soundTable, generator.getSoundTable



local data = {}

data.animations      = animations
data.animationEvents = animationEvents
data.events          = events
data.sounds          = sounds

return data
