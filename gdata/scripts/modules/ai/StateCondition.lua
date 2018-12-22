local oo = require "loop.simple"
local Node = require "ai.Node"
local NodeState = require "ai.NodeState"

local StateCondition = oo.class({
   stateName = nil,
}, Node)

function StateCondition:__init()
   if not self.stateName then
      log(string.format("WARNING: BT StateCondition '%s' stateName not set", tostring(self.name)))
   end
end

function StateCondition:condition(entity)
   return entity:getState(self.stateName)
end

function StateCondition:running()
   local result = self:condition(self.entity)
   if (result) then
      return NodeState.SUCCESS
   else
      return NodeState.FAILURE
   end
end

return StateCondition
