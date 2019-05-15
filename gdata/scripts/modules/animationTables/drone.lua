local animations = {
   idle = {
      default = "idle",
      repair = "repair",
   },
   walk = {
      front = {
         default = "move",
      },
   },
}

local EventsGenerator = require "eventsGenerator"
local generator = EventsGenerator()
-- data
local animationEvents, events, sounds = generator.animationEvents, generator.events, generator.sounds
-- dsl functions
local assignEvent, event, eventUnassigned, sound = generator.assignEvent, generator.event, generator.eventUnassigned, generator.sound

-- assign events to animations here

local data = {}

data.animations      = animations
data.animationEvents = animationEvents
data.events          = events
data.sounds          = sounds

return data
