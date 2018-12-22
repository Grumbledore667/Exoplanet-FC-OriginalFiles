local oo = require "loop.simple"
local Node = require "ai.Node"
local NodeState = require "ai.NodeState"

local ConditionNode = oo.class({
   entity = nil,
   condition = nil,
}, Node)

function ConditionNode:__init()
   if not self.condition then
      log(string.format("WARNING: BT ConditionNode '%s' condition not set", tostring(self.name)))
   end
end

function ConditionNode:running()
   local result = self.condition(self.entity)
   if (result) then
      return NodeState.SUCCESS
   else
      return NodeState.FAILURE
   end
end

return ConditionNode
