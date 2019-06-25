local oo = require "loop.simple"

local tablex = require "pl.tablex"

---@class CEventManager
local CEventManager = oo.class()

function CEventManager:__new()
   self = oo.rawnew(self)
   self.events = {}
   return self
end

function CEventManager:postEvent(eventName, data)
   self:performCallbacks(eventName, data)
end

function CEventManager:subscribeToEvent(eventName, func, ...)
   local callback = {}
   callback.func = func
   callback.args = table.pack(...)
   self.events[eventName] = self.events[eventName] or {}
   table.insert(self.events[eventName], callback)
   return callback
end

function CEventManager:unsubscribeFromEvent(eventName, callback)
   if self.events[eventName] then
      local index = tablex.find(self.events[eventName], callback)
      if index then
         table.remove(self.events[eventName], index)
      end
   end
end

function CEventManager:performCallbacks(eventName, data)
   if self.events[eventName] then
      local callbackList = tablex.copy(self.events[eventName])
      for _, callback in ipairs(callbackList) do
         callback.func(eventName, data, unpack(callback.args))
      end
   end
end

return CEventManager
