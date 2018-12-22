local oo = require "loop.simple"
local hierarchy = require "loop.hierarchy"
local NodeState = require "ai.NodeState"

local Node = oo.class{
   name = nil,
   __new = hierarchy.mutator, -- calls __init methods from top parent to child
}

function Node:__init()
   if not self.name then
      log("WARNING: BT Node name not set")
   end

   -- if (any) node has a custom finish function ({finish=func...} in editor)
   -- then store it into a private variable and call it in actual finish function
   -- this is to allow nodes other than Actions to call finish functions - like when
   -- when sequence is terminated midway and we need to clean up
   local finish = rawget(self, "finish")
   if finish then
      self._finish = finish
      self.finish = nil
   end
end

function Node:setBlackboard(bb)
   self.blackboard = bb
   if self.guard then
      self.guard:setBlackboard(bb)
   end
end

function Node:getBBValue(key)
   return self.blackboard[key]
end

function Node:setBBValue(key, value)
   self.blackboard[key] = value
end

function Node:addGuard(guard)
   self.guard = guard
end

function Node:start()
end

function Node:running()
end

function Node:finish()
   if self._finish then
      self._finish(self.entity)
   end
end

function Node:update()
   if self.guard then
      self.guard:reset()
      local guardState = self.guard:update()
      if guardState == NodeState.FAILURE then
         if self.status == NodeState.RUNNING then
            self:finish()
         end
         self.status = NodeState.FAILURE
         return self.status
      end
   end

   if(self.status~= NodeState.RUNNING) then
      self:start()
   end
   self.status = self:running()

   if(self.status ~= NodeState.RUNNING) then
      self:finish()
   end
   return self.status
end

function Node:reset()
   if self.status == NodeState.RUNNING then
      self:finish()
   end
   self.status = nil
end

return Node
