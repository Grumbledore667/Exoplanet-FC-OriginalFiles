local oo = require "loop.simple"
local CEventHandler = require "coroutines.handlers.base"

---@class CQuestEventHandler : CEventHandler
local CQuestEventHandler = oo.class({}, CEventHandler)

local function cbQuestEvent(event_name, target_name, target_obj, func)
   local eventData = {}
   eventData.type = "questEvent"
   eventData.event_name = event_name
   eventData.target_name = target_name
   eventData.target_obj = target_obj

   func(eventData)
end

function CQuestEventHandler:__init(event_name, target_name, target_obj)
   self.event = {
      event_name = event_name,
      target_name = target_name,
      target_obj = target_obj,
   }
end

function CQuestEventHandler:init(func)
   self.callbackObj = questSystem:subscribeEvent(self.event.event_name, cbQuestEvent, func)
end

function CQuestEventHandler:checkEventMatch(event)
   if event.type ~= "questEvent" then
      return false
   end
   if self.event.event_name ~= event.event_name then
      return false
   end
   if self.event.target_name and self.event.target_name ~= event.target_name then
      return false
   end
   if self.event.target_obj and self.event.target_obj ~= event.target_obj then
      return false
   end
   return true
end

function CQuestEventHandler:destroy()
   questSystem:unsubscribeEvent(self.event.event_name, self.callbackObj)
   self.callbackObj = nil
end

return CQuestEventHandler
