local oo = require "loop.base"
local tablex = require "pl.tablex"

---@class CTimer
local CTimer = oo.class()

function CTimer:__new(seconds, repeating, callback, ...)
   self = oo.rawnew(self)
   self.timeAmount = seconds
   self.timeElapsed = 0
   self.loopTimeAmount = 0
   self.loopTimeElapsed = 0

   if type(repeating) == "number" then
      if repeating > 0 then
         self.loopTimeAmount = repeating
         self.loop = true
      else
         self.loop = false
      end
   else
      self.loop = repeating
   end
   self.callback = callback
   self.args = table.pack(...)
   self.fired = false
   self.firing = false
   return self
end

function CTimer:update(dt)
   if self.fired then
      return
   end

   self.timeElapsed = self.timeElapsed + dt

   if self.timeElapsed > self.timeAmount then
      self:fire()
   end

   if self.loop and self.loopTimeAmount > 0 then
      self.loopTimeElapsed = self.loopTimeElapsed + dt
      if self.loopTimeElapsed > self.loopTimeAmount then
         self:fire()
         self:stop()
      end
   end
end

function CTimer:fire()
   self.firing = true

   if self.callback then
      local ok = pcall(self.callback, unpack(self.args))
      if not ok then
         log("ERROR: above is the traceback of failed timer. Below is timer origin traceback.")
         log(self.origin)
      end
   end

   if self.loop then
      -- TODO: self.timeElapsed -= self.timeAmount should increase precision
      self.timeElapsed = 0
   else
      self.fired = true
   end

   self.firing = false
end

function CTimer:stop()
   self.fired = true
end

function CTimer:getTimeLeft()
   return math.max(0, self:getTimeAmount() - self:getTimeDuration())
end

---@return number @time elapsed since timer start till this moment
function CTimer:getTimeDuration()
   if self.loopTimeAmount > 0 then
      return self.loopTimeElapsed
   else
      return self.timeElapsed
   end
end

function CTimer:getTimeAmount()
   if self.loopTimeAmount > 0 then
      return self.loopTimeAmount
   else
      return self.timeAmount
   end
end

---@class CTimerManager
local CTimerManager = oo.class()

function CTimerManager:__new()
   self = oo.rawnew(self)
   self.timers = {}
   return self
end

function CTimerManager:clearTimers()
   self.timers = {}
end

function CTimerManager:updateTimers(dt)
   for _, timer in ipairs(tablex.copy(self.timers)) do
      timer:update(dt)
   end
   self.timers = tablex.filter(self.timers, function(t) return not t.fired end)
end

function CTimerManager:_postInit(timer)
   timer.origin = debug.traceback()
   table.insert(self.timers, timer)
   return timer
end

--- runTimer using legacy argument format
---@param seconds number
---@param obj any
---@param func function @callback function
---@param repeating number | boolean
---@return CTimer
function CTimerManager:runTimerLegacyFormat(seconds, obj, func, repeating)
   local timer = CTimer(seconds, repeating, func, obj)
   return self:_postInit(timer)
end

--- runTimer new format with optional variable callback arguments at the end
---@param seconds number
---@param repeating number | boolean
---@param func function @callback function
---@param ... any @callback function arguments
---@return CTimer
function CTimerManager:runTimer(seconds, repeating, func, ...)
   local timer = CTimer(seconds, repeating, func, ...)
   return self:_postInit(timer)
end

local timer = {
   CTimer = CTimer,
   CTimerManager = CTimerManager,
}

local defaultTimerManager = CTimerManager()

function timer.getDefaultTimerManager()
   return defaultTimerManager
end

--- runTimer with default timer manager using legacy argument format
---@param seconds number
---@param obj any
---@param func function @callback function
---@param repeating number | boolean
---@return CTimer
function timer.runTimerLegacyFormat(seconds, obj, func, repeating)
   return timer.getDefaultTimerManager():runTimerLegacyFormat(seconds, obj, func, repeating)
end

--- runTimer with default timer manager, using new format
--- with optional variable callback arguments at the end
---@param seconds number
---@param repeating number | boolean
---@param func function @callback function
---@param ... any @callback function arguments
---@return CTimer
function timer.runTimer(seconds, repeating, func, ...)
   return timer.getDefaultTimerManager():runTimer(seconds, repeating, func, ...)
end

return timer
