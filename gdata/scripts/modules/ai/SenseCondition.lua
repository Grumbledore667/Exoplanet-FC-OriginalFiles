local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Node = require "ai.Node"
local NodeState = require "ai.NodeState"

---@class ai.SenseCondition : ai.Node
local SenseCondition = oo.class({
   senseName = nil,
   className = className,
}, Node)

function SenseCondition:__init()
   if not self.senseName then
      log(string.format("WARNING: BT SenseCondition '%s' senseName not set", tostring(self.name)))
   end
end

function SenseCondition:condition(entity)
   return entity.senseScheduler:getSense(self.senseName)
end

function SenseCondition:running()
   local result = self:condition(self.entity)
   if result then
      return NodeState.SUCCESS
   else
      return NodeState.FAILURE
   end
end

return SenseCondition
