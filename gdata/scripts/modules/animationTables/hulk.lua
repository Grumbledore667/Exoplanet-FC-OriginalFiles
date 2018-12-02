--[[
unused as of yet
idle_aggr
]]

local animations = {
   idle = {
      default = {"idle","idle_2"},
      attack = {
         default = "",
         boxing = { "melee_idle_1", "melee_idle_2", },
      },
   },
   walk = {
      front = {
         default = "walk_front",
      },
      back = {
         default = "walk_back",
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
         default = "run",
      },
      back = {
         default = "run",
         -- default = "run_back",
      },
      left = {
         default = "run",
         -- default = "run_left",
      },
      right = {
         default = "run",
         -- default = "run_right",
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
      default = "talk",
   },
   hit = {
      default = "hit__front",
      front = {
         default = "hit__front",
      },
      back = {
         default = "hit__back",
      },
      left = {
         default = "hit__left",
      },
      right = {
         default = "hit__right",
      },
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
local soundTable, getSoundTable = generator.soundTable, generator.getSoundTable

-- assign events to animations here
--Combat
assignEvent "melee_idle_1"   "attack" {10,13} "attack2" {16,20}
assignEvent "melee_idle_2"   "attack" {16,19}

--Movement
assignEvent "walk_front"     "step1" {15} "step2" {35}
assignEvent "walk_back"      "step1" {15} "step2" {35}
assignEvent "walk_right"     "step1" {15} "step2" {35}
assignEvent "walk_left"      "step1" {15} "step2" {35}
assignEvent "run"            "step1" {15} "step2" {35}


-- assign sounds to events here
eventUnassigned "step_dirt"    {getSoundTable "shared.step_dirt"}
eventUnassigned "step_metal"   {getSoundTable "shared.step_metal"}

-- set sound parameters here
soundTable "shared.step_dirt"     {distance = 1500, channel = 5, priority= 1}
soundTable "shared.step_metal"    {distance = 1500, channel = 5, priority= 1}

local data = {}

data.animations      = animations
data.animationEvents = animationEvents
data.events          = events
data.sounds          = sounds

return data
