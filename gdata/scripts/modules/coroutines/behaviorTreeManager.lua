local oo = require "loop.simple"
local NodeState = require "ai.NodeState"

local CCoroutineManager = require "coroutines.manager"

local CBTCoroutineManager = oo.class({}, CCoroutineManager)

function CBTCoroutineManager:__init(name, owner)
   CCoroutineManager.__init(self, name)
   self.owner = owner
   self.routineActions = {}
end

function CBTCoroutineManager:registerAction(routine, action)
   if not routine then return end
   self.routineActions[routine] = action
end

function CBTCoroutineManager:getAction(routine)
   return self.routineActions[routine]
end

function CBTCoroutineManager:handleRunningCoroutineResult(routine, handler)
   self:addEventHandler(routine, handler)
   self:getAction(routine).result = NodeState.RUNNING
end

function CBTCoroutineManager:handleDeadCoroutineResult(routine, ...)
   self:getAction(routine).result = NodeState.SUCCESS
end

return CBTCoroutineManager
