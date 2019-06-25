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

-- assign events to animations here
assignEvent "attack"      "attack_1_start" {0} "attack" {15,20}
assignEvent "attack_2"    "attack_2_start" {0} "attack" {15,20}
assignEvent "idle"        "idle_1"         {0}
assignEvent "idle_2"      "idle_2"         {0}
assignEvent "turn_left"   "turn"           {0}
assignEvent "turn_right"  "turn"           {0}
assignEvent "walk"        "walk"           {0}
assignEvent "run"         "run"            {0}
assignEvent "hurt"        "hurt"           {0}
assignEvent "eat"         "eat"            {0}

event "attack_1_start" {"Play_hornhog_attack_1"}
event "attack_2_start" {"Play_hornhog_attack_2"}
event "idle_1"         {"Play_hornhog_idle_1"}
event "idle_2"         {"Play_hornhog_idle_2"}
event "turn"           {"Play_hornhog_turn"}
event "walk"           {"Play_hornhog_walk"}
event "run"            {"Play_hornhog_run"}
event "hurt"           {"Play_hornhog_hurt"}
event "eat"            {"Play_hornhog_eat"}
eventUnassigned "death" {"Play_hornhog_death"}

sound "Play_hornhog_idle_1"    {distance = 2000, channel = 0, priority = 1}
sound "Play_hornhog_idle_2"    {distance = 2000, channel = 0, priority = 1}
sound "Play_hornhog_turn"      {distance = 2000, channel = 0, priority = 1}
sound "Play_hornhog_walk"      {distance = 2000, channel = 0, priority = 1}
sound "Play_hornhog_run"       {distance = 2000, channel = 0, priority = 1}
sound "Play_hornhog_attack_1"  {distance = 2000, channel = 0, priority = 2}
sound "Play_hornhog_attack_2"  {distance = 2000, channel = 0, priority = 2}
sound "Play_hornhog_eat"       {distance = 2000, channel = 0, priority = 2}
sound "Play_hornhog_death"     {distance = 2000, channel = 0, priority = 10}
sound "Play_hornhog_hurt"      {distance = 2000, channel = 1, priority = 1}

local data = {}

data.animations      = animations
data.animationEvents = animationEvents
data.events          = events
data.sounds          = sounds

return data
