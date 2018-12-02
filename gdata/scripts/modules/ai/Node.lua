local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local hierarchy = require "loop.hierarchy"
local NodeState = require "ai.NodeState"

---@class ai.Node
---@field root ai.BehaviorTree
---@field name string
---@field className string
local Node = oo.class{
   name = nil,
   className = className,
   __new = hierarchy.mutator, -- calls __init methods from top parent to child
}

function Node:__init()
   if not self.name then
      log("WARNING: BT Node name not set")
   end
end

function Node:setRoot(root)
   self.root = root
end

function Node:getBBValue(key)
   return self.root.blackboard[key]
end

function Node:setBBValue(key, value)
   self.root.blackboard[key] = value
end

function Node:addGuard(guard)
   self.guard = guard
end

function Node:start()
end

function Node:running()
end

function Node:finish()
end

function Node:preUpdate()
   local item = {
      name = self.name,
      className = self.className,
   }
   if self.root and self.root ~= self then
      local history = self.root.history
      table.insert(history, item)
      item._indent = history._indent
      history._indent = history._indent + 1
      item.guard = history._guard
   end
   return item
end

function Node:postUpdate(item)
   item.status = self.status
   if self.root and self.root ~= self then
      self.root.history._indent = item._indent
   end
end

function Node:preGuard()
   if self.root and self.root ~= self then
      self.root.history._guard = true
   end
end

function Node:postGuard()
   if self.root and self.root ~= self then
      self.root.history._guard = false
   end
end

function Node:checkGuard()
   if not self.guard then
      return true
   end

   self:preGuard()
   if not self.guard:checkGuard() then
      self:postGuard()
      return false
   end

   self.guard:reset()
   local guardState = self.guard:update()
   self:postGuard()
   if guardState == NodeState.SUCCESS then
      return true
   elseif guardState == NodeState.FAILURE then
      return false
   else
      error("AI: Guard can't be non-atomic")
   end
end

function Node:update()
   local item = self:preUpdate()

   if self.status ~= NodeState.RUNNING then
      if not self:checkGuard() then
         self.status = NodeState.FAILURE
         self:postUpdate(item)
         return self.status
      end
      self:start()
   end
   self.status = self:running()

   if self.status ~= NodeState.RUNNING then
      self:finish()
   end
   self:postUpdate(item)
   return self.status
end

function Node:reset()
   if self.status == NodeState.RUNNING then
      self:finish()
   end
   self.status = nil
end

return Node
