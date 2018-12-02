local oo = require "loop.simple"

local CAction = oo.class({})

function CAction:start()
end

function CAction:stop()
end

function CAction:pause()
end

function CAction:resume()
end

function CAction:cancel()
end

-- Observers define in what situations we need restart action if it is already run
-- if there are no observers then the action isn't restarted
-- if action observes a notification and it is posted then the action is restarted
-- in short, this function's better name is RestartOnNotification
function CAction:allowRestartOnEvent(observer)
   if not self.observers then
      self.observers = {}
   end
   self.observers[observer] = true
end


local function makeCallable(obj, func)
   local mt = {}
   mt.__call = func
   setmetatable(obj, mt)
end

local members = {
   loopTimer = nil,
   currentAction = nil,
}
local CActionSequence = oo.class(members)

local function start(self, owner)
   self = self.real_self
   local first = self:getNextAction()
   if first ~= nil then
      self.currentAction = first
      first.start(owner)
      local delay = first.loopDelay or 1
      self.loopTimer = runTimer(delay, {self=self, owner=owner}, CActionSequence.loopChecker, true)
   end
end
-- black voodoo magic that allows the function start (which is actually a table)
-- to acquire reference to its CActionSequence instance (self)
-- and pass through the CCharacter reference (owner)

local function stop(self, owner)
   self = self.real_self
   if self.currentAction then
      self:stopLoopTimer()
      self.currentAction.stop(owner)
   end
   self:resetActions()
end

function CActionSequence:__new(data)
   -- self is the class
   local obj = oo.rawnew(self, data)
   obj.actions = {}
   obj.start = {}
   obj.stop = {}

   obj.start.real_self = obj
   obj.stop.real_self = obj

   makeCallable(obj.start, start)
   makeCallable(obj.stop, stop)

   return obj
end

function CActionSequence:addAction(action)
   action.finished = false
   table.insert(self.actions, action)
end

function CActionSequence:getNextAction()
   for k, v in pairs(self.actions) do
      if v.finished == false then
         return v
      end
   end
end

function CActionSequence:resetActions()
   for k, v in pairs(self.actions) do
      v.finished = false
   end
end

-- special function called by runTimer, that's why the . and not :
function CActionSequence.loopChecker(data)
   local self = data.self -- CActionSequence instance
   local owner = data.owner -- CCharacter or derived class that owns the actions
   local actionFinished = self.currentAction.loop(owner)
   if actionFinished == true then
      if self.currentAction.stop then
         self.currentAction.stop(owner)
      end
      self.currentAction.finished = true
      local next = self:getNextAction()
      if next ~= nil then
         next.start(owner)
         local delay = next.loopDelay or 1
         self:stopLoopTimer()
         self.loopTimer = runTimer(delay, {self=self, owner=owner}, CActionSequence.loopChecker, true)
      else
         self:stopLoopTimer()
      end
      self.currentAction = next
   end
end

function CActionSequence:stopLoopTimer()
   if self.loopTimer then
      self.loopTimer:stop()
      self.loopTimer = nil
   end
end

return {
   CAction=CAction,
   CActionSequence=CActionSequence,
}
