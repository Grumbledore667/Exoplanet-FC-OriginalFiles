local oo = require "loop.simple"
local Decorator = require "ai.Decorator"
local NodeState = require "ai.NodeState"

local TimeLimiter = oo.class({
   seconds = nil,
}, Decorator)

function TimeLimiter:__init()
   if not self.seconds then
      log(string.format("WARNING: BT TimeLimiter '%s' seconds not set", tostring(self.name)))
   end
end


function TimeLimiter:start()
   self.timer = runTimer(self.seconds, nil, nil, false)
end

function TimeLimiter:running()
   if self.timer:getTimeLeft() > 0 then
      return self.child:update()
   end
   self.child:finish()
   return NodeState.SUCCESS
end

function TimeLimiter:reset()
   Decorator.reset(self)
   if self.timer then
      self.timer:stop()
      self.timer = nil
   end
end

return TimeLimiter
