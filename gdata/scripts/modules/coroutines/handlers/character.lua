local oo = require "loop.simple"
local CEventHandler = require "coroutines.handlers.base"

---@class CCharacterEventHandler : CEventHandler
local CCharacterEventHandler = oo.class({}, CEventHandler)

function CCharacterEventHandler:__init(eventManager, eventName)
   self.eventManager = eventManager
   self.eventName = eventName
end

function CCharacterEventHandler:init(func)
   local function cb()
      func(self)
   end
   self.callbackObj = self.eventManager:subscribeToEvent(self.eventName, cb)
end

function CCharacterEventHandler:checkEventMatch(event)
   return self == event
end

function CCharacterEventHandler:destroy()
   self.eventManager:unsubscribeFromEvent(self.eventName, self.callbackObj)
   self.callbackObj = nil
end

return CCharacterEventHandler
