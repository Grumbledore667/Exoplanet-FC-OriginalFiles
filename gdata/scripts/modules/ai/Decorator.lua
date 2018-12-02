local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Node = require "ai.Node"

---@class ai.Decorator : ai.Node
---@field child ai.Node
local Decorator = oo.class({
   child = nil,
   className = className,
}, Node)

function Decorator:__init()
   if not self._preinit and not self.child then
      log(string.format("WARNING: BT Decorator '%s' child not set", tostring(self.name)))
   end
end

function Decorator:finish()
   self.child:finish()
   Node.finish(self)
end

function Decorator:reset()
   self.status = nil
   self.child:reset()
end

return Decorator
