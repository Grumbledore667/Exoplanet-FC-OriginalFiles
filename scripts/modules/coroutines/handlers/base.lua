local oo = require "loop.simple"
local hierarchy = require "loop.hierarchy"

---@class CEventHandler
local CEventHandler = oo.class{
   __new = hierarchy.creator,
}

function CEventHandler:init()
end

function CEventHandler:checkEventMatch(event)
end

function CEventHandler:destroy()
end

return CEventHandler
