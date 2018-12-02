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
event "attack_start" {getSoundTable "greenbug.attack"}
event "idle"         {getSoundTable "greenbug.idle_1"}
event "walk"         {getSoundTable "greenbug.walk"}
event "threat"       {getSoundTable "greenbug.threat"}
event "hurt"         {getSoundTable "greenbug.hurt"}
eventUnassigned "death" {getSoundTable "greenbug.death", "body_damage1.wav"}

-- set sound parameters here
soundTable "greenbug.idle_1"   {distance = 1500, channel = 0, priority = 1}
soundTable "greenbug.walk"     {distance = 1500, channel = 0, priority = 1}
soundTable "greenbug.attack"   {distance = 1750, channel = 0, priority = 2}
soundTable "greenbug.threat"   {distance = 1750, channel = 0, priority = 2}
soundTable "greenbug.hurt"     {distance = 1750, channel = 0, priority = 2}
soundTable "greenbug.death"    {distance = 1750, channel = 0, priority = 10}
sound      "body_damage1.wav"  {distance = 250,  channel = 1, priority = 1}

local data = {}

data.animations      = animations
data.animationEvents = animationEvents
data.events          = events
data.sounds          = sounds

return data
