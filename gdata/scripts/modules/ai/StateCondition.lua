local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Node = require "ai.Node"
local NodeState = require "ai.NodeState"

---@class ai.StateCondition : ai.Node
local StateCondition = oo.class({
   className = className,
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
   if result then
      return NodeState.SUCCESS
   else
      return NodeState.FAILURE
   end
end

return StateCondition
