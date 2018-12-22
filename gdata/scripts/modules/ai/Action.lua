local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Node = require "ai.Node"
local NodeState = require "ai.NodeState"

---@class ai.Action : ai.Node
---@field public entity CNPC | CCharacter
local Action = oo.class({
   entity           = nil,
   start_function   = nil,
   running_function = nil,
   finish_function  = nil,
   className = className,
}, Node)

function Action:__init()
   if not self.entity then
      log(string.format("WARNING: BT Action '%s' entity not set", tostring(self.name)))
   end

   if self.running_function == true then
      self.running_function = (require "ai").utils.running_state
   elseif not self.running_function then -- nil or false
      self.running_function = (require "ai").utils.not_running_state
   end
end

function Action:start()
   if self.start_function then
      self.start_function(self.entity)
   end
end

function Action:running()
   if not self.running_function(self.entity) then
      return NodeState.SUCCESS
   else
      return NodeState.RUNNING
   end
end

function Action:finish()
   if self.finished or self.status == nil then
      return
   end
   if self.finish_function then
      self.finish_function(self.entity)
   end
   self.finished = true
end

function Action:reset()
   Node.reset(self)
   self.finished = nil
end

return Action
