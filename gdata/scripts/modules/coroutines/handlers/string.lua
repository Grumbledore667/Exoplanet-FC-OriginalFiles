local oo = require "loop.simple"
local CEventHandler = require "coroutines.handlers.base"

---@class CStringEventHandler : CEventHandler
local CStringEventHandler = oo.class({}, CEventHandler)

function CStringEventHandler:__init(eventString)
   self.eventString = eventString
end

function CStringEventHandler:checkEventMatch(event)
   return event == self.eventString
end

return CStringEventHandler
