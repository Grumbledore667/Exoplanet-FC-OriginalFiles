local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Node = require "ai.Node"
local NodeState = require "ai.NodeState"

---@class ai.Succeeder : ai.Node
local Succeeder = oo.class({
   className = className,
}, Node)

function Succeeder:running()
   return NodeState.SUCCESS
end

return Succeeder
