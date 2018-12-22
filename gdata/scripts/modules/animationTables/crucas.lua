local animations = {
   idle = {
      default = {"idle_1", "idle_2", "idle_3"},
      attack = {
         default = {"attack"},
      },
   },
   walk = {
      front = {
         default = "walk",
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
   threat = {
      default = "threat",
   },
   hurt = {
      default = "hit__hurt",
   },
   eat = {
      default = "eat",
   },
   death = {
      default = "die",
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
assignEvent "attack"     "attack_start" {0} "attack" {11,14}
assignEvent "idle_1"     "idle_1"  {0}
assignEvent "idle_2"     "idle_2"  {0}
assignEvent "idle_3"     "idle_3"  {0}
assignEvent "eat"        "eat"     {0}
assignEvent "turn_left"  "turn"    {0}
assignEvent "turn_right" "turn"    {0}
assignEvent "walk"       "walk"    {0}
assignEvent "run"        "run"     {0}
assignEvent "threat"     "threat"  {0}
assignEvent "hit__hurt"  "hurt"    {0}

event "attack_start" {getSoundTable "crucas.attack"}
event "idle_1"       {getSoundTable "crucas.idle_1"}
event "idle_2"       {getSoundTable "crucas.idle_2"}
event "idle_3"       {getSoundTable "crucas.idle_3"}
event "eat"          {getSoundTable "crucas.eat"}
event "turn"         {getSoundTable "crucas.turn"}
event "walk"         {getSoundTable "crucas.walk"}
event "run"          {getSoundTable "crucas.run"}
event "threat"       {getSoundTable "crucas.threat"}
event "hurt"         {getSoundTable "crucas.hurt"}
eventUnassigned "death" {getSoundTable "crucas.death"}

soundTable "crucas.idle_1"  {distance = 2000, channel = 0, priority = 1}
soundTable "crucas.idle_2"  {distance = 2000, channel = 0, priority = 1}
soundTable "crucas.idle_3"  {distance = 2000, channel = 0, priority = 1}
soundTable "crucas.turn"    {distance = 2000, channel = 0, priority = 1}
soundTable "crucas.walk"    {distance = 2000, channel = 0, priority = 1}
soundTable "crucas.run"     {distance = 2000, channel = 0, priority = 1}
soundTable "crucas.eat"     {distance = 2000, channel = 0, priority = 2}
soundTable "crucas.threat"  {distance = 2000, channel = 0, priority = 2}
soundTable "crucas.attack"  {distance = 2000, channel = 0, priority = 2}
soundTable "crucas.death"   {distance = 2000, channel = 0, priority = 10}
soundTable "crucas.hurt"    {distance = 2000, channel = 1, priority = 1}

local data = {}

data.animations      = animations
data.animationEvents = animationEvents
data.events          = events
data.sounds          = sounds

return data
