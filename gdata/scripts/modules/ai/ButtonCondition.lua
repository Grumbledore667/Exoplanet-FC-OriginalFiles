local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Node = require "ai.Node"
local NodeState = require "ai.NodeState"

---@class ai.ButtonCondition : ai.Node
local ButtonCondition = oo.class({
   className = className,
}, Node)

function ButtonCondition:__init()
   if not self.buttonName then
      log(string.format("WARNING: BT ButtonCondition '%s' buttonName not set", tostring(self.name)))
   end
end

function ButtonCondition:running()
   local result = getButton(self.buttonName)
   if result then
      return NodeState.SUCCESS
   else
      return NodeState.FAILURE
   end
end

return ButtonCondition
