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
   jump = {
      default = "jump_front"
   },
   attack = {
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
local soundTable, getSoundTable = generator.soundTable, generator.getSoundTable

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
event "attack_start" {getSoundTable "killerbug.attack"}
event "idle"         {getSoundTable "killerbug.idle_1"}
event "walk"         {getSoundTable "killerbug.walk"}
event "threat"       {getSoundTable "killerbug.threat"}
event "hurt"         {getSoundTable "killerbug.hurt"}
eventUnassigned "death" {getSoundTable "killerbug.death", "body_damage1.wav"}

-- set sound parameters here
soundTable "killerbug.idle_1"   {distance = 1500, channel = 0, priority = 1}
soundTable "killerbug.walk"     {distance = 1500, channel = 0, priority = 1}
soundTable "killerbug.attack"   {distance = 1750, channel = 0, priority = 2}
soundTable "killerbug.threat"   {distance = 1750, channel = 0, priority = 2}
soundTable "killerbug.hurt"     {distance = 1750, channel = 0, priority = 2}
soundTable "killerbug.death"    {distance = 1750, channel = 0, priority = 10}
sound      "body_damage1.wav"   {distance = 250,  channel = 1, priority = 1}

local data = {}

data.animations      = animations
data.animationEvents = animationEvents
data.events          = events
data.sounds          = sounds

return data
