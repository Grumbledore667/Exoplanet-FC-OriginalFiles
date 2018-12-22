local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Node = require "ai.Node"
local NodeState = require "ai.NodeState"

---@class ai.Failer : ai.Node
local Failer = oo.class({
   className = className,
}, Node)

function Failer:running()
   return NodeState.FAILURE
end

return Failer
