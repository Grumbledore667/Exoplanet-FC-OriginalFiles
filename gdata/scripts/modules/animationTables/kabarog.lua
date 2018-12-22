local animations = {
   idle = {
      default = {"idle", "idle_2"},
      attack = {
         default = {"attack", "attack_2"},
      },
   },
   walk = {
      front = {
         default = "walk",
      },
      back = {
         default = "walk_back",
      },
   },
   run = {
      front = {
         default = "run",
      },
   },
   turn = {
      left = {
         step    = "turn_left",
      },
      right = {
         step    = "turn_right",
      },
   },
   hit = {
      default = "hurt",
   },
   eat = {
      default = "eat",
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
assignEvent "attack"      "attack_1_start" {0} "attack" {15,20}
assignEvent "attack_2"    "attack_2_start" {0} "attack" {15,20}
assignEvent "idle"        "idle_1"         {0}
assignEvent "walk"        "walk"           {0}
assignEvent "run"         "run"            {0}
assignEvent "hurt"        "hurt"           {0}
assignEvent "eat"         "eat"            {0}

event "attack_1_start" {getSoundTable "kabarog.attack_1"}
event "attack_2_start" {getSoundTable "kabarog.attack_2"}
event "idle_1"         {getSoundTable "kabarog.idle_1"}
event "walk"           {getSoundTable "kabarog.walk"}
event "run"            {getSoundTable "kabarog.run"}
event "hurt"           {getSoundTable "kabarog.hurt"}
event "eat"            {getSoundTable "kabarog.eat"}
eventUnassigned "death" {getSoundTable "kabarog.death"}

soundTable "kabarog.idle_1"    {distance = 2000, channel = 0, priority = 1}
soundTable "kabarog.walk"      {distance = 2000, channel = 0, priority = 1}
soundTable "kabarog.run"       {distance = 2000, channel = 0, priority = 1}
soundTable "kabarog.attack_1"  {distance = 2000, channel = 0, priority = 2}
soundTable "kabarog.attack_2"  {distance = 2000, channel = 0, priority = 2}
soundTable "kabarog.eat"       {distance = 2000, channel = 0, priority = 2}
soundTable "kabarog.death"     {distance = 2000, channel = 0, priority = 10}
soundTable "kabarog.hurt"      {distance = 2000, channel = 1, priority = 1}

local data = {}

data.animations      = animations
data.animationEvents = animationEvents
data.events          = events
data.sounds          = sounds

return data
