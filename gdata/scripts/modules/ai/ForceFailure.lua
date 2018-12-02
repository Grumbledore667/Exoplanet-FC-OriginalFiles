local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Decorator = require "ai.Decorator"
local NodeState = require "ai.NodeState"

---@class ai.ForceFailure : ai.Decorator
local ForceFailure = oo.class({
   className = className,
}, Decorator)

function ForceFailure:running()
   local childStatus = self.child:update()
   if childStatus == NodeState.RUNNING then
      return childStatus
   end
   return NodeState.FAILURE
end

return ForceFailure
