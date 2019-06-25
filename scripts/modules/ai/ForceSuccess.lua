local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Decorator = require "ai.Decorator"
local NodeState = require "ai.NodeState"

---@class ai.ForceSuccess : ai.Decorator
local ForceSuccess = oo.class({
   className = className,
}, Decorator)

function ForceSuccess:running()
   local childStatus = self.child:update()
   if childStatus == NodeState.RUNNING then
      return childStatus
   end
   return NodeState.SUCCESS
end

return ForceSuccess
