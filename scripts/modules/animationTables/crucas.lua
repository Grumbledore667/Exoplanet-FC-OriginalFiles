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
assignEvent "eat"        "blood1" {10} "blood2" {20} "blood3" {30}

event "attack_start"    {"Play_crucas_attack"}
event "idle_1"          {"Play_crucas_idle_1"}
event "idle_2"          {"Play_crucas_idle_2"}
event "idle_3"          {"Play_crucas_idle_3"}
event "eat"             {"Play_crucas_eat"}
event "turn"            {"Play_crucas_turn"}
event "walk"            {"Play_crucas_walk"}
event "run"             {"Play_crucas_run"}
event "threat"          {"Play_crucas_threat"}
event "hurt"            {"Play_crucas_hurt"}
eventUnassigned "death" {"Play_crucas_die"}

sound "Play_crucas_idle_1"  {distance = 2000, channel = 0, priority = 1}
sound "Play_crucas_idle_2"  {distance = 2000, channel = 0, priority = 1}
sound "Play_crucas_idle_3"  {distance = 2000, channel = 0, priority = 1}
sound "Play_crucas_turn"    {distance = 2000, channel = 0, priority = 1}
sound "Play_crucas_walk"    {distance = 2000, channel = 0, priority = 1}
sound "Play_crucas_run"     {distance = 2000, channel = 0, priority = 1}
sound "Play_crucas_eat"     {distance = 2000, channel = 0, priority = 2}
sound "Play_crucas_threat"  {distance = 2000, channel = 0, priority = 2}
sound "Play_crucas_attack"  {distance = 2000, channel = 0, priority = 2}
sound "Play_crucas_die"     {distance = 2000, channel = 0, priority = 10}
sound "Play_crucas_hurt"    {distance = 2000, channel = 1, priority = 1}

local data = {}

data.animations      = animations
data.animationEvents = animationEvents
data.events          = events
data.sounds          = sounds

return data
