local oo = require "loop.simple"
local CEventHandler = require "coroutines.handlers.base"

---@class CAnimationEventHandler : CEventHandler
local CAnimationEventHandler = oo.class({}, CEventHandler)

function CAnimationEventHandler:__init(animationsManager, animation, event, eventType)
   self.animationsManager = animationsManager
   self.animation = animation
   self.event = event
   self.eventType = eventType
end

function CAnimationEventHandler:init(func)
   self.callbackObj = self.animationsManager:addAnimationCallback(self.animation, self.event, self.eventType, func, self)
end

function CAnimationEventHandler:checkEventMatch(event)
   return self == event
end

function CAnimationEventHandler:destroy()
   self.animationsManager:removeAnimationCallback(self.animation, self.callbackObj)
   self.callbackObj = nil
end

return CAnimationEventHandler
