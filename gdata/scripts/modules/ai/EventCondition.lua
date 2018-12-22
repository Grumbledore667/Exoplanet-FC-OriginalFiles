local oo = require "loop.simple"
local ConditionNode = require "ai.ConditionNode"
local NodeState = require "ai.NodeState"

local EventCondition = oo.class({
   eventName = nil,
}, ConditionNode)

function EventCondition:__init()
   if not self.eventName then
      log(string.format("WARNING: BT EventCondition '%s' eventName not set", tostring(self.name)))
   end
end


function EventCondition:hasEventAndItMatches()
   local char = self.entity
   for _, event in char.eventManager:iter() do
      if event.name == self.eventName and self.condition(char, event.data) then
         char.eventManager:purgeConsumedNotifications()
         return true
      end
   end
   return false
end

function EventCondition:running()
   if self:hasEventAndItMatches() then
      return NodeState.SUCCESS
   else
      return NodeState.FAILURE
   end
end

return EventCondition
