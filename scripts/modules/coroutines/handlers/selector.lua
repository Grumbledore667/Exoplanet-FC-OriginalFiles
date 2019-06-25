local oo = require "loop.simple"
local CEventHandler = require "coroutines.handlers.base"

---@class CSelectorEventHandler : CEventHandler
local CSelectorEventHandler = oo.class({}, CEventHandler)

function CSelectorEventHandler:__init(...)
   self.handlers = table.pack(...)
end

function CSelectorEventHandler:init(func)
   for _, handler in ipairs(self.handlers) do
      handler:init(func)
   end
end

function CSelectorEventHandler:checkEventMatch(event)
   for _, handler in ipairs(self.handlers) do
      if handler:checkEventMatch(event) then
         return true
      end
   end
   return false
end

function CSelectorEventHandler:destroy()
   for _, handler in ipairs(self.handlers) do
      handler:destroy()
   end
end

return CSelectorEventHandler
