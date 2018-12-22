local oo = require "loop.simple"
local Node = require "ai.Node"

local Decorator = oo.class({
   child = nil,
}, Node)

function Decorator:__init()
   if not self._preinit and not self.child then
      log(string.format("WARNING: BT Decorator '%s' child not set", tostring(self.name)))
   end
end


function Decorator:reset()
   self.status = nil
   self.child:reset()
end

return Decorator
