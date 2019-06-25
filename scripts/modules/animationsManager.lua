local oo = require "loop.simple"
local tablex = require "pl.tablex"
local AnimationTables

local members =
{
   owner = nil,
   animationCallbacks = nil,
   currentAnimations = nil,
   cachedEvents = nil,
}

---@class CAnimationsManager
local CAnimationsManager = oo.class(members)

function CAnimationsManager:init()
   AnimationTables = require "animationTables"
   self.animationCallbacks = {}
   self.currentAnimations = {}
   self.cachedEvents = {}

   local prefabName = string.gsub(self.owner:getPrefabName(), ".cfg$", "")
   self.animationData = AnimationTables.getTable(prefabName)

   if self.owner:getScriptClass() == "CMainCharacter" then
      local mainCharData = AnimationTables.getTable("mainCharacter")
      self.animationData.animations      = tablex.merge(self.animationData.animations, mainCharData.animations, true)
      self.animationData.animationEvents = tablex.merge(self.animationData.animationEvents, mainCharData.animationEvents, true)
      self.animationData.events          = tablex.merge(self.animationData.events, mainCharData.events, true)
      self.animationData.sounds          = tablex.merge(self.animationData.sounds, mainCharData.sounds, true)
   end

   for animation,events in pairs(self.animationData.animationEvents) do
      for eventName,frames in pairs(events) do
         local result = self.owner:addAnimationEvent(animation, eventName, frames[1], frames[2])
         self:animLogger(result, animation, "register an event for")
      end
   end
end

function CAnimationsManager:animLogger(result, animation, actionString)
   actionString = actionString or "execute"
   local prefabName = string.gsub(self.owner:getPrefabName(), ".cfg$", "")

   if not animation then
      local err = "WARNING: %s(%s) has tried to %s nil as animation"
      log(string.format(err, tostring(self.owner), prefabName, actionString))
      log(debug.traceback())
   elseif not result then
      local err = "WARNING: %s(%s) has tried to %s non-existing animation '%s'"
      log(string.format(err, tostring(self.owner), prefabName, actionString, animation))
      log(debug.traceback())
   end
end

function CAnimationsManager:getAnimations()
   return self.animationData.animations
end

function CAnimationsManager:getAnimationEvents(animation)
   return self.animationData.animationEvents[animation]
end

function CAnimationsManager:getEventSounds(event)
   return self.animationData.events[event] and self.animationData.events[event].frameIn
end

function CAnimationsManager:getAnimationSoundParams(name)
   return self.animationData.sounds[name]
end

function CAnimationsManager:getAnimationDefaultDelay(animation)
   if not animation then return 0 end
   local animDuration = self.owner:getAnimDuration(animation)
   local delay
   if animDuration > 2 then
      delay = 0.4
   elseif animDuration > 1 then
      delay = animDuration * 0.2
   else
      delay = animDuration * 0.1
   end
   return delay
end

---Cache current action's events for coro handlers to check in case events come on the same frame.
---Engine is expected to keep order.
function CAnimationsManager:cacheActionEvent(animation, event, eventType)
   if self.currentAnimations[animation] then --currentAnimations only consists of actions
      if not self.cachedEvents[animation] then self.cachedEvents[animation] = {} end
      if event then
         if not self.cachedEvents[animation][event] then self.cachedEvents[animation][event] = {} end
         self.cachedEvents[animation][event][eventType] = true
      else
         self.cachedEvents[animation][eventType] = true
      end
   end
end

function CAnimationsManager:isEventCached(animation, event, eventType)
   local cache = self.cachedEvents[animation]
   if cache then
      if event then
         return cache[event] and cache[event][eventType] == true
      else
         return cache[eventType] == true
      end
   end
   return false
end

function CAnimationsManager:OnAnimationStop(animation)
   self:cacheActionEvent(animation, nil, "onAnimationStop")

   self:performAnimationCallbacks(animation, nil, "onAnimationStop")

   self.currentAnimations[animation] = nil
end

function CAnimationsManager:OnAnimationEventIn(animation, event)
   self:cacheActionEvent(animation, event, "onAnimationEventIn")

   if self.owner.soundManager then
      self.owner.soundManager:OnAnimationEventIn(animation, event)
   end
   self:performAnimationCallbacks(animation, event, "onAnimationEventIn")
end

function CAnimationsManager:OnAnimationEventOut(animation, event)
   self:cacheActionEvent(animation, event, "onAnimationEventOut")

   if self.owner.soundManager then
      self.owner.soundManager:OnAnimationEventOut(animation, event)
   end
   self:performAnimationCallbacks(animation, event, "onAnimationEventOut")
end

function CAnimationsManager:playAction(animation, delayIn, delayOut, autoLock, speed)
   local result
   if animation then
      local defaultDelay = self:getAnimationDefaultDelay(animation)
      delayIn = delayIn or defaultDelay
      delayOut = delayOut or defaultDelay
      autoLock = autoLock or false
      speed = speed or 1
      result = self.owner:playAction(animation, delayIn, delayOut, 1, autoLock, speed)
      if result then
         self.currentAnimations[animation] = true
         self.cachedEvents[animation] = nil
      end
   end
   self:animLogger(result, animation)
   return result
end

function CAnimationsManager:playActionExclusively(...)
   if next(self.currentAnimations) then
      return false
   end
   return self:playAction(...)
end

function CAnimationsManager:playCycle(animation, delay, speed)
   local result
   if animation then
      delay = delay or 0.5
      speed = speed or 1
      result = self.owner:playCycle(animation, delay, 1, speed)
   end
   self:animLogger(result, animation)
   return result
end

function CAnimationsManager:stopAction(animation)
   local result
   if animation then
      result = self.owner:stopAction(animation)
      self.currentAnimations[animation] = nil
   end
   self:animLogger(result, animation, "stop")
   return result
end

function CAnimationsManager:stopCycle(animation, delay)
   local result
   if animation then
      result = self.owner:stopCycle(animation, delay or 0.5)
   end
   self:animLogger(result, animation, "stop")
   return result
end

function CAnimationsManager:stopActionOrCycle(animation, delay)
   local resultAction
   local resultCycle
   if animation then
      resultAction = self:stopAction(animation)
      resultCycle = self:stopCycle(animation, delay)
   end
   self:animLogger(resultAction or resultCycle, animation, "stop")
   return resultAction or resultCycle
end

function CAnimationsManager:stopActionsAndCycles(delay)
   self.owner:stopActions()
   self.owner:stopCycles(delay or 0.5)
   self.currentAnimations = {}
end

---@deprecated
function CAnimationsManager:loopAnimation(animation)
   return self:playCycle(animation, 0.5)
end

---@deprecated
function CAnimationsManager:loopAnimationDelay(...)
   return self:playCycle(...)
end

---@deprecated
function CAnimationsManager:playAnimation(animation, exclusively)
   if exclusively and next(self.currentAnimations) then
      return
   end

   if not exclusively then
      self:playAction(animation)
   else
      self:playActionExclusively(animation)
   end
end

---@deprecated
function CAnimationsManager:playAnimationWithLock(animation)
   return self:playAction(animation, nil, nil, true)
end

---@deprecated
function CAnimationsManager:stopAnimation(animation)
   return self:stopActionOrCycle(animation)
end

---@deprecated
function CAnimationsManager:stopAnimations()
   return self:stopActionsAndCycles()
end
-- deprecated end --

function CAnimationsManager:iterCallbacks(animation)
   return ipairs(tablex.copy(self.animationCallbacks[animation] or {}))
end

local function callbackMatches(callback, event, eventType)
   if ((callback.event == event) or (callback.event == nil))
      and (callback.eventType == eventType) then
      return true
   else
      return false
   end
end

function CAnimationsManager:performAnimationCallbacks(animation, event, eventType)
   if not self.animationCallbacks[animation] then
      return
   end
   for _, callback in self:iterCallbacks(animation) do
      if callbackMatches(callback, event, eventType) then
         callback.func(unpack(callback.args))
         self.owner.notificationCenter:postNotification(eventType)
      end
   end
   if eventType == "onAnimationStop" then
      self:clearCallbacks(animation)
   end
end

local function compareCallbacks(callback1, callback2)
   if callback1.eventType ~= callback2.eventType then
      return false
   elseif callback1.func ~= callback2.func then
      return false
   elseif callback1.event ~= callback2.event then
      return false
   elseif #(callback1.args) ~= #(callback2.args) then
      return false
   else
      for i = 1,#(callback1.args) do
         if callback1.args[i] ~= callback2.args[i] then
            return false
         end
      end
      return true
   end
end

function CAnimationsManager:addAnimationCallback(animation, event, eventType, func, ...)
   if func == nil then
      log("CAnimationsManager::addAnimationCallback - func is " .. tostring(func))
   end
   local args = table.pack(...)
   local animationCallback     = {}
   animationCallback.args      = args
   animationCallback.func      = func
   animationCallback.event     = event
   animationCallback.eventType = eventType or "onAnimationStop"

   if not self.animationCallbacks[animation] then
      self.animationCallbacks[animation] = {}
   end
   for _, existingCallback in self:iterCallbacks(animation) do
      if compareCallbacks(existingCallback, animationCallback) then
         return
      end
   end
   table.insert(self.animationCallbacks[animation], animationCallback)
   return animationCallback
end

function CAnimationsManager:removeAnimationCallback(animation, callbackObj)
   for index, callback in self:iterCallbacks(animation) do
      if callback == callbackObj then
         table.remove(self.animationCallbacks[animation], index)
         return
      end
   end
end

function CAnimationsManager:clearAllCallbacks()
   self.animationCallbacks = {}
end

function CAnimationsManager:clearCallbacks(animation)
   if animation then self.animationCallbacks[animation] = nil end
end

function CAnimationsManager:subscribeAnimationEnd(animation, callback, ...)
   return self:addAnimationCallback(animation, nil, "onAnimationStop", callback, ...)
end

function CAnimationsManager:subscribeAnimationEventIn(animation, event, callback, ...)
   return self:addAnimationCallback(animation, event, "onAnimationEventIn", callback, ...)
end

function CAnimationsManager:subscribeAnimationEventOut(animation, event, callback, ...)
   return self:addAnimationCallback(animation, event, "onAnimationEventOut", callback, ...)
end

return {CAnimationsManager=CAnimationsManager}
