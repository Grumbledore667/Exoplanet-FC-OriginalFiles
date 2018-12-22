local oo = require "loop.simple"
local Node = require "ai.Node"
local NodeState = require "ai.NodeState"

local Succeeder = oo.class({}, Node)

function Succeeder:running()
   return NodeState.SUCCESS
end

return Succeeder
