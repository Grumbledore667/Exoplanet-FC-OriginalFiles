local oo = require "loop.simple"
local Node = require "ai.Node"
local NodeState = require "ai.NodeState"

local Failer = oo.class({}, Node)

function Failer:running()
   return NodeState.FAILURE
end

return Failer
