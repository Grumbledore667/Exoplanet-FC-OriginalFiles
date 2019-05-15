local stringx = require "pl.stringx"
local className = select(3, stringx.rpartition((...), '.'))

local oo = require "loop.simple"
local Node = require "ai.Node"
local NodeState = require "ai.NodeState"

---@class ai.ReactiveGuard : ai.Node
local ReactiveGuard = oo.class({
className = className,
}, Node)


function ReactiveGuard:running()
   local guardedName = self.guardedName

   local req = self:getBBVar("_request")

   if req and req[guardedName] then
      if req[guardedName] == "start" then
         self:setBBVar(guardedName, true)
         return NodeState.SUCCESS
      elseif req[guardedName] == "stop" then
         self:setBBVar(guardedName, false)
      end
   elseif self:getBBVar(guardedName) then
      return NodeState.SUCCESS
   end

   return NodeState.FAILURE
end

function ReactiveGuard:onGuardedFinish(guarded)
   self:setBBVar(self.guardedName, false)
end

return ReactiveGuard
