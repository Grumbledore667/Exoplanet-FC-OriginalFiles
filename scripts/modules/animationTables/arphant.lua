local animations = {
   idle = {
      default = "idle",
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
         quarter = "turn_left",
         full    = "turn_left",
      },
      right = {
         step    = "turn_right",
         quarter = "turn_right",
         full    = "turn_right",
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
assignEvent "attack"      "attack_1_start"  {0} "attack"  {30, 40}
assignEvent "attack_2"    "attack_2_start"  {0} "attack"  {70, 80}
assignEvent "eat"         "eat"     {0}
assignEvent "hurt"        "hurt"    {0}

assignEvent "run"         "step1"   {20} "step2" {24} "step3" {34}
assignEvent "walk"        "step1"   {10} "step2" {35}
assignEvent "walk_back"   "step1"   {6}  "step2" {29}
assignEvent "walk_fast"   "step1"   {8}  "step2" {20}

-- assign sounds to events here
event "attack_1_start"       {"Play_arphant_attack"}
event "attack_2_start"       {"Play_arphant_idle"}
event "eat"                  {"Play_arphant_eat"}
event "hurt"                 {"Play_arphant_hurt"}
eventUnassigned "step_dirt"  {"Play_arphant_step_dirt"}
eventUnassigned "step_metal" {"Play_arphant_step_dirt"}
eventUnassigned "death"      {"Play_arphant_death"}

-- set sound parameters here
sound "Play_arphant_attack"      {distance = 4000, channel = 0, priority = 1}
sound "Play_arphant_idle"        {distance = 4000, channel = 0, priority = 1}
sound "Play_arphant_eat"         {distance = 4000, channel = 0, priority = 2}
sound "Play_arphant_hurt"        {distance = 4000, channel = 0, priority = 2}
sound "Play_arphant_death"       {distance = 4000, channel = 0, priority = 10}
sound "Play_arphant_step_dirt"   {distance = 8000, channel = 1, priority = 1}

local data = {}

data.animations      = animations
data.animationEvents = animationEvents
data.events          = events
data.sounds          = sounds

return data
