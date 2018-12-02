local oo = require "loop.simple"
local CEventHandler = require "coroutines.handlers.base"

---@class CTimerEventHandler : CEventHandler
local CTimerEventHandler = oo.class({}, CEventHandler)

function CTimerEventHandler:__init(time)
   self.time = time
end

function CTimerEventHandler:init(func)
   self.timer = runTimerAdv(self.time, false, func, self)
end

function CTimerEventHandler:checkEventMatch(event)
   return self == event
end

function CTimerEventHandler:destroy()
   if self.timer then
      self.timer:stop()
      self.timer = nil
   end
end

return CTimerEventHandler
