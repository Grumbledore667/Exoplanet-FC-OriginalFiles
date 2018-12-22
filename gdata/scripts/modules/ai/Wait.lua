local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Node = require "ai.Node"
local NodeState = require "ai.NodeState"

---@class ai.Wait : ai.Node
local Wait = oo.class({
   seconds = nil,
   className = className,
}, Node)

function Wait:__init()
   if not self.seconds then
      log(string.format("WARNING: BT Wait '%s' seconds not set", tostring(self.name)))
   end
end

function Wait:start()
   self.timer = runTimer(self.seconds, nil, nil, false)
end

function Wait:running()
   if self.timer:getTimeLeft() > 0 then
      return NodeState.RUNNING
   end
   return NodeState.SUCCESS
end

function Wait:reset()
   Node.reset(self)
   if self.timer then
      self.timer:stop()
      self.timer = nil
   end
end

return Wait
