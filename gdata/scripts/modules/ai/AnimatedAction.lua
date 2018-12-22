local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Action = require "ai.Action"
local NodeState = require "ai.NodeState"

---@class ai.AnimatedAction : ai.Action
---@field public entity CNPC | CCharacter
local AnimatedAction = oo.class({
   animation = nil,
   className = className,
}, Action)

function AnimatedAction:__init()
   if not self.animation then
      log(string.format("WARNING: BT AnimatedAction '%s' animation not set", tostring(self.name)))
   end
end

function AnimatedAction:start()
   self.callbackObj = self.entity.animationsManager:subscribeAnimationEnd(self.animation,
      function() self.stopEventArrived = true end)
   Action.start(self)
end

function AnimatedAction:hasAnimationStopEvent()
   return self.stopEventArrived
end

function AnimatedAction:running()
   if self:hasAnimationStopEvent() then
      return NodeState.SUCCESS
   else
      return NodeState.RUNNING
   end
end

function AnimatedAction:finish()
   if not self.finished then
      self.entity.animationsManager:removeAnimationCallback(self.animation, self.callbackObj)
      self.callbackObj = nil
      self.stopEventArrived = false
   end
   Action.finish(self)
end

return AnimatedAction
