local animations = {
   idle = {
      default = {"idle"},
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
assignEvent "attack"      "attack_1_start"  {0}
assignEvent "attack_2"    "attack_2_start"  {0}
assignEvent "eat"         "eat"     {0}
assignEvent "hurt"        "hurt"    {0}

assignEvent "run"         "step1"   {20} "step2" {24} "step3" {34}
assignEvent "walk"        "step1"   {10} "step2" {35}
assignEvent "walk_back"   "step1"   {6}  "step2" {29}
assignEvent "walk_fast"   "step1"   {8}  "step2" {20}

-- assign sounds to events here
event "attack_1_start"  {getSoundTable "arphant.attack"}
event "attack_2_start"  {getSoundTable "arphant.idle_1"}
event "eat"             {getSoundTable "arphant.eat"}
event "hurt"            {getSoundTable "arphant.hurt"}
eventUnassigned "step_dirt" {getSoundTable "arphant.step_dirt"}
eventUnassigned "step_metal" {getSoundTable "arphant.step_dirt"}
eventUnassigned "death" {getSoundTable "arphant.death"}

-- set sound parameters here
soundTable "arphant.attack"      {distance = 4000, channel = 0, priority = 1}
soundTable "arphant.idle_1"      {distance = 4000, channel = 0, priority = 1}
soundTable "arphant.eat"         {distance = 4000, channel = 0, priority = 2}
soundTable "arphant.hurt"        {distance = 4000, channel = 0, priority = 2}
soundTable "arphant.death"       {distance = 4000, channel = 0, priority = 10}
soundTable "arphant.step_dirt"   {distance = 8000, channel = 1, priority = 1}

local data = {}

data.animations      = animations
data.animationEvents = animationEvents
data.events          = events
data.sounds          = sounds

return data
