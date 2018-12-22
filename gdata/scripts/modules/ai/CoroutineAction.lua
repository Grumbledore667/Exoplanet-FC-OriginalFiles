local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Node = require "ai.Node"
local NodeState = require "ai.NodeState"
local Action = require "ai.Action"

---@class ai.CoroutineAction : ai.Node
---@field public entity CNPC | CCharacter @TODO:FIXME: replace with CMob for monsters when it's available
local CoroutineAction = oo.class({
   className = className,
}, Node)

function CoroutineAction:__init()
   if not self.entity then
      log(string.format("WARNING: BT CoroutineAction '%s' entity not set", tostring(self.name)))
   end
   self.eventQueue = {}
   self.eventArrived = nil
end

function CoroutineAction:getCoroutineManager()
   return self.root.coroutineManager
end

function CoroutineAction:stepRoutine(...)
   return coroutine.resume(self.routine, ...)
end

function CoroutineAction:stepRoutineArgs(...)
   return table.pack(self:stepRoutine(...))
end

function CoroutineAction:createRoutine()
   return coroutine.create(self.running_function)
end

function CoroutineAction:runRoutine(...)
   local function notificationPoster(handler)
      self.entity.eventManager:postEvent("coroutineEvent", handler)
      if self.handler and self.handler:checkEventMatch(handler) then
         self.eventArrived = handler
         self.root:tick()
      end
   end

   local result
   local args = self:stepRoutineArgs(...)
   local ok = args[1]
   if ok and coroutine.status(self.routine) ~= "dead" then
      self.handler = args[2]
      self.handler:init(notificationPoster)
      result = NodeState.RUNNING
   else
      if self.handler then
         self.handler:destroy()
      end
      result = NodeState.SUCCESS
   end
   if not ok then
      local err = args[2]
      log(err)
   end
   return result
end

function CoroutineAction:start()
   local function eventInserter(_, data)
      table.insert(self.eventQueue, data)
   end
   self.eventCallback = self.entity.eventManager:subscribeToEvent("coroutineEvent", eventInserter)
   Node.start(self)
end

function CoroutineAction:running()
   if not self.routine then
      self.routine = self:createRoutine()
      -- first execution sends self.entity to self argument of running_function
      return self:runRoutine(self.entity)
   elseif self.eventArrived then
      local event = self.eventArrived
      self.eventArrived = nil
      return self:runRoutine(event)
   else
      for _, event in ipairs(self.eventQueue) do
         if self.handler:checkEventMatch(event) then
            self.eventQueue = {}
            return self:runRoutine(event)
         end
      end
      self.eventQueue = {}
   end
   return NodeState.RUNNING
end

function CoroutineAction:finish()
   if self.finished or self.status == nil then
      return
   end
   if self.finish_function then
      self.finish_function(self.entity)
   end
   self.entity.eventManager:unsubscribeFromEvent("coroutineEvent", self.eventCallback)
   self.eventCallback = nil
   self.eventQueue = {}
   self.eventArrived = nil
   self.routine = nil
   self.handler = nil
   self.finished = true
end

function CoroutineAction:reset()
   Action.reset(self)
   self.result = nil
end

return CoroutineAction
