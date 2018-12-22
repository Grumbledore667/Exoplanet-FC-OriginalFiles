local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Decorator = require "ai.Decorator"
local NodeState = require "ai.NodeState"

---@class ai.UntilFailure : ai.Decorator
local UntilFailure = oo.class({
   className = className,
}, Decorator)

function UntilFailure:running()
   local childStatus = self.child:update()
   if childStatus == NodeState.RUNNING then
      return childStatus
   end
   if childStatus == NodeState.SUCCESS then
      self.child:reset()
      return NodeState.RUNNING
   end
   return NodeState.FAILURE
end

return UntilFailure
