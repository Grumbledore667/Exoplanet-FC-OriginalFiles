local oo = require "loop.simple"
local CEventHandler = require "coroutines.handlers.base"

---@class CTriggerEventHandler : CEventHandler
local CTriggerEventHandler = oo.class({}, CEventHandler)

function CTriggerEventHandler:__init(event, trigger)
   self.trigger = trigger
   self.event = event
end

function CTriggerEventHandler:checkEventMatch(event)
   return event.event == self.event and event.obj == self.trigger
end

return CTriggerEventHandler
