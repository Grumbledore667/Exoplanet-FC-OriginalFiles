local oo = require "loop.simple"
local Action = require "ai.Action"
local NodeState = require "ai.NodeState"

local AnimatedAction = oo.class({
   animation = nil,
}, Action)

function AnimatedAction:__init()
   if not self.animation then
      log(string.format("WARNING: BT AnimatedAction '%s' animation not set", tostring(self.name)))
   end
end


function AnimatedAction:hasAnimationStopEvent()
   local char = self.entity
   for _, event in char.eventManager:iter() do
      if event.name == "onAnimationStop" and event.data.animation == self.animation then
         event.consumed = true
         char.eventManager:purgeConsumedNotifications()
         return true
      end
   end
   return false
end

function AnimatedAction:running()
   if self:hasAnimationStopEvent() then
      return NodeState.SUCCESS
   else
      return NodeState.RUNNING
   end
end

return AnimatedAction
