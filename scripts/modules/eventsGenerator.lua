local stringx = require "pl.stringx"
local tablex = require "pl.tablex"
local f = require "fun"

local function EventsGenerator()
   local animationEvents = {}
   local events = {}
   local sounds = {}

   local function addEventToAnimation(animation, eventName, data)
      animation = string.lower(animation)
      eventName = string.lower(eventName)
      animationEvents[animation] = animationEvents[animation] or {}
      animationEvents[animation][eventName] = data
   end

   local function assignEvent(animation)
      local function eventSetter(eventName)
         local function frameSetter(frames)
            local inFrame, outFrame = unpack(frames)
            outFrame = outFrame or inFrame

            if type(animation) ~= 'string' or animation == "" then
               local err = "ERROR: can't add event '%s': animation name must be non-empty string"
               log(string.format(err, tostring(eventName)))
               return eventSetter
            end

            if type(eventName) ~= 'string' or eventName == "" then
               local err = "ERROR: can't add event to '%s': event name must be non-empty string"
               log(string.format(err, tostring(animation)))
               return eventSetter
            end

            if not inFrame or not outFrame then
               local err = "ERROR: can't add event '%s' to '%s': unspecified frame"
               log(string.format(err, tostring(eventName), tostring(animation)))
               return eventSetter
            end

            if inFrame < 0 or outFrame < 0 then
               local err = "ERROR: can't add event '%s' to '%s': negative frame"
               log(string.format(err, tostring(eventName), tostring(animation)))
               return eventSetter
            end

            addEventToAnimation(animation, eventName, {inFrame, outFrame})
            return eventSetter
         end
         return frameSetter
      end
      return eventSetter
   end

   local function findEvent(eventName)
      for _, eventList in pairs(animationEvents) do
         if eventList[eventName] then
            return eventList[eventName]
         end
      end
   end

   -- on error return a function that ignores any arguments
   local function nop()
      return nop
   end

   local function event(eventName, allowUnused)
      if type(eventName) ~= 'string' or eventName == "" then
         local err = "ERROR: event definition must use a non-empty string for event name"
         log(err)
         return nop
      end
      eventName = string.lower(eventName)
      if events[eventName] then
         local err = "ERROR: event '%s' already defined"
         log(string.format(err, tostring(eventName)))
         return nop
      end
      local function frame(list)
         if not findEvent(eventName) and not allowUnused then
            local err = "ERROR: declaring unused event '%s'"
            log(string.format(err, tostring(eventName)))
            return nop
         end
         if type(list) ~= 'table' then
            local err = "ERROR: event '%s' must use tables for frameIn/Out events"
            log(string.format(err, tostring(eventName)))
            return nop
         end
         if events[eventName] then
            events[eventName].frameOut = list
            return nop
         else
            events[eventName] = {}
            if next(list) then
               events[eventName].frameIn = tablex.copy(list)
            end
            return frame
         end
      end
      return frame
   end

   local function eventUnassigned(eventName)
      return event(eventName, true)
   end

   local function checkParameters(entity, name, parameters)
      if type(parameters) ~= 'table' then
         local err = "ERROR: %s '%s' must use a table for parameters"
         log(string.format(err, entity, name))
         return false
      end
      if not parameters.distance or not parameters.channel or not parameters.priority then
         local err = "ERROR: %s '%s' parameters must include distance, channel and priority"
         log(string.format(err, entity, name))
         return false
      end
      for _,v in pairs(parameters) do
         if type(v) ~= 'number' then
            local err = "ERROR: %s '%s' parameters must be all integers"
            log(string.format(err, entity, name))
            return false
         end
      end
      return true
   end

   local function sound(soundName)
      if type(soundName) ~= 'string' or soundName == "" then
         local err = "ERROR: sound declarations must use non-empty strings"
         log(err)
         return nop
      end
      --Wwise requires to have 'Play_' prefix
      --soundName = string.lower(soundName)
      return function (parameters)
         if checkParameters("sound", soundName, parameters) then
            sounds[soundName] = parameters
         end
      end
   end

   return {
      -- dsl
      assignEvent=assignEvent,
      event=event,
      eventUnassigned=eventUnassigned,
      sound=sound,

      -- data
      animationEvents=animationEvents,
      events=events,
      sounds=sounds,
   }
end

return EventsGenerator
