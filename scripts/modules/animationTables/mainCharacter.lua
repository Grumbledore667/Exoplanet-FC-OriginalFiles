local animations = {}

local EventsGenerator = require "eventsGenerator"
local generator = EventsGenerator()
-- data
local animationEvents, events, sounds = generator.animationEvents, generator.events, generator.sounds
-- dsl functions
local assignEvent, event, eventUnassigned, sound = generator.assignEvent, generator.event, generator.eventUnassigned, generator.sound

-- assign events to animations here
--Combat
assignEvent "hit__default"                 "hurt"         {0}
assignEvent "hit__pistol_front"            "hurt"         {0}
assignEvent "hit__pistol_left"             "hurt"         {0}
assignEvent "hit__pistol_right"            "hurt"         {0}
assignEvent "hit__pistol_back"             "hurt"         {0}
assignEvent "hit__shotgun_front"           "hurt"         {0}
assignEvent "hit__shotgun_left"            "hurt"         {0}
assignEvent "hit__shotgun_right"           "hurt"         {0}
assignEvent "hit__shotgun_back"            "hurt"         {0}
assignEvent "hit__h2h_front"            "hurt"         {0}
assignEvent "hit__h2h_left"             "hurt"         {0}
assignEvent "hit__h2h_right"            "hurt"         {0}
assignEvent "hit__h2h_back"             "hurt"         {0}


-- assign sounds to events here
event "hurt"  {"Play_main_hero_hurt"}
eventUnassigned "hurt2" {"Play_main_hero_hurt"}

-- set sound parameters here
sound "Play_main_hero_hurt"   {distance = 800, channel = 4, priority= 1}
sound "Play_step_dirt"        {distance = 500, channel = 5, priority= 1}
sound "Play_step_metal"       {distance = 500, channel = 5, priority= 1}


local data = {}

data.animations      = animations
data.animationEvents = animationEvents
data.events          = events
data.sounds          = sounds

return data
