local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Node = require "ai.Node"
local Composite = require "ai.Composite"
local NodeState = require "ai.NodeState"

---@class ai.Parallel : ai.Composite
local Parallel = oo.class({
   className = className,
}, Composite)

function Parallel:start()
   Composite.start(self)
   self.currentIndex = 0
   self.noRunningTasks = true
end

-- 'resume' restarts finished children, 'join' does not
-- 'sequence' fails with first failed child and succeeds when all children returned success
-- 'selector' succeeds with first success and fails when all failed
-- both selector and sequence reset all children when finished

function Parallel:running()
   self.noRunningTasks = true
   local childResult
   local helperResult

   for i, child in ipairs(self.children) do
      self.currentIndex = i
      if self.orchestrator == "resume" then
         if child.status ~= NodeState.RUNNING and child.status ~= nil then
            child:reset()
         end
         childResult = child:update()
         helperResult = nil
         if childResult == NodeState.SUCCESS then
            helperResult = self:onChildSuccess()
         elseif childResult == NodeState.FAILURE then
            helperResult = self:onChildFailure()
         elseif childResult == NodeState.RUNNING then
            self.noRunningTasks = false
         end
         if helperResult ~= nil then
            self:resetChildren()
            if helperResult then
               return NodeState.SUCCESS
            else
               return NodeState.FAILURE
            end
         end
      elseif self.orchestrator == "join" then
         childResult = nil
         helperResult = nil
         if child.status ~= NodeState.SUCCESS and child.status ~= NodeState.FAILURE then
            childResult = child:update()
         end
         if childResult == NodeState.SUCCESS then
            helperResult = self:onChildSuccess()
         elseif childResult == NodeState.FAILURE then
            helperResult = self:onChildFailure()
         elseif childResult == NodeState.RUNNING then
            self.noRunningTasks = false
         end
         if helperResult ~= nil then
            self:resetChildren()
            if helperResult then
               return NodeState.SUCCESS
            else
               return NodeState.FAILURE
            end
         end
      end
   end
   return NodeState.RUNNING
end

function Parallel:onChildSuccess()
   if self.policy == "sequence" then
      if self.orchestrator == "join" then
         if self.noRunningTasks and self.children[#self.children].status == NodeState.SUCCESS then
            return true
         end
         return nil
      elseif self.orchestrator == "resume" then
         if self.noRunningTasks and self.currentIndex == #self.children then
            return true
         end
         return nil
      end
   elseif self.policy == "selector" then
      return true
   end
end

function Parallel:onChildFailure()
   if self.policy == "sequence" then
      return false
   elseif self.policy == "selector" then
      if self.noRunningTasks and self.currentIndex == #self.children then
         return false
      end
      return nil
   end
end

function Parallel:reset()
   Composite.reset(self)
   self.noRunningTasks = true
end

return Parallel
