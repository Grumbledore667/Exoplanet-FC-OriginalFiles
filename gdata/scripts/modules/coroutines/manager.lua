local oo = require "loop.simple"
local hierarchy = require "loop.hierarchy"

local tablex = require "pl.tablex"

local f = require "fun"
local partial = f.partial

local CTimerEventHandler = require "coroutines.handlers.timer"

local CCoroutineManager = oo.class{
   __new = hierarchy.creator,
}

function CCoroutineManager:__init(name)
   self.name = name or "unnamed"
   self.routines = {}
   self.routineEvents = {}
end

function CCoroutineManager:_eventTableCheck(routine)
   if routine and not self.routineEvents[routine] then
      self.routineEvents[routine] = {}
   end
end

function CCoroutineManager:removeAllEventHandlers(routine)
   self:_eventTableCheck(routine)
   for _, handler in self:iterHandlers(routine) do
      handler:destroy()
   end
   self.routineEvents[routine] = nil
end

function CCoroutineManager:removeEventHandler(routine, handler)
   local index = tablex.find(self.routineEvents[routine], handler)
   handler:destroy()
   table.remove(self.routineEvents[routine], index)
end

function CCoroutineManager:addEventHandler(routine, eventHandler)
   self:_eventTableCheck(routine)
   table.insert(self.routineEvents[routine], eventHandler)
end

function CCoroutineManager:removeCoroutine(routine)
   if coroutine.running() == routine then
      error("cannot remove currently running coroutine")
   elseif coroutine.status(routine) == "running" then
      error("cannot remove running coroutine")
   end
   local index = tablex.find(self.routines, routine)
   if index then
      table.remove(self.routines, index)
      self:removeAllEventHandlers(routine)
   end
end

function CCoroutineManager:getEventHandler(routine, event)
   for _, handler in self:iterHandlers(routine) do
      if handler:checkEventMatch(event) then
         return handler
      end
   end
end

function CCoroutineManager:iter()
   return ipairs(tablex.copy(self.routines))
end

function CCoroutineManager:iterHandlers(routine)
   self:_eventTableCheck(routine)
   return ipairs(tablex.copy(self.routineEvents[routine] or {}))
end

function CCoroutineManager:_stepRoutine(routine, ...)
   return coroutine.resume(routine, ...)
end

function CCoroutineManager:stepRoutineAndGetArgs(routine, ...)
   return table.pack(self:_stepRoutine(routine, ...))
end

-- receives ... after routine, name args as needed
function CCoroutineManager:handleRunningCoroutineResult(routine, handler)
   handler:init(partial(self.coWorker, self))
   self:addEventHandler(routine, handler)
end

-- receives ... after routine, name args as needed
function CCoroutineManager:handleDeadCoroutineResult(routine)
   self:removeCoroutine(routine)
end

function CCoroutineManager:executeRoutine(routine, event)
   local args = self:stepRoutineAndGetArgs(routine, event)
   local ok, err = args[1], args[2]
   if ok and coroutine.status(routine) ~= "dead" then
      self:handleRunningCoroutineResult(routine, select(2, unpack(args)))
   else
      self:handleDeadCoroutineResult(routine, select(2, unpack(args)))
   end
   if not ok then
      log(string.format("ERROR: CCoroutineManager %s: error during coroutine execution:", self.name))
      log(err)
   end
end

function CCoroutineManager:executeRoutineIfMatched(routine, event)
   local handler = self:getEventHandler(routine, event)
   if handler then
      self:removeEventHandler(routine, handler)
      self:executeRoutine(routine, event)
   end
end

function CCoroutineManager:coWorker(event)
   for _, co in self:iter() do
      self:executeRoutineIfMatched(co, event)
   end
end

function CCoroutineManager:createCoroutine(func, env)
   if env then
      setfenv(func, env)
   end
   local co = coroutine.create(func)
   table.insert(self.routines, co)

   return co
end

function CCoroutineManager:runTimerCo(fn)
   local co = self:createCoroutine(fn)
   local handler = CTimerEventHandler(0)
   handler:init(partial(self.coWorker, self))
   self:addEventHandler(co, handler)
   return {
      stop = function()
         self:removeCoroutine(co)
      end
   }
end

return CCoroutineManager
