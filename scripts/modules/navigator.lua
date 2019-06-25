local oo = require "loop.simple"
local f = require "fun"
local partial = f.partial
local hlp = require "helpers"
local CTime = hlp.CTime
local tablex = require "pl.tablex"

local SkySystem = (require "environment.sky").SkySystem
local coro = require "coroutines.helpers"

---@class CNavigator
local CNavigator = oo.class({
   owner = nil,
})

function CNavigator:__new(members)
   self = oo.rawnew(self, members)
   self.patrolAllowed = true
   self.patrolPaused = false
   self.patrolLoop = false
   self.runPatrol = false
   self.patrolConvoyObj = nil
   self.convoyDistance = 500
   self.patrolPoints = nil
   self.nextWPID = 0
   self.routeReset = false
   self.subscribeToFFTime = false
   return self
end

function CNavigator:loadOwnerParameters()
   self:setPatrolAllowed(loadParam(self.owner, "patrolAllowed", self.patrolAllowed))
   self:setPatrolPaused(loadParam(self.owner, "patrolPaused", self.patrolPaused))
   self:setPatrolLoop(loadParam(self.owner, "patrolLoop", self.patrolLoop))
   self:setPatrolConvoyObj(loadParam(self.owner, "patrolConvoyObj", nil))
   self:setPatrolRoute(loadParam(self.owner, "patrolPoints", nil))
   self.subscribeToFFTime = loadParam(self.owner, "subscribeToFFTime", self.subscribeToFFTime)
end

--Setters
function CNavigator:setPatrolAllowed(value)
   self.patrolAllowed = value
end

function CNavigator:setPatrolLoop(value)
   self.patrolLoop = value
end

function CNavigator:setPatrolConvoyObj(obj)
   self.patrolConvoyObj = obj
end

function CNavigator:setPatrolPaused(value)
   self.patrolPaused = value
end

function CNavigator:setRunPatrol(value)
   self.runPatrol = value
end

--Methods
---@param waypoints string | table
function CNavigator:setPatrolRoute(waypoints)
   if not waypoints then return end

   local newWaypoints
   if type(waypoints) == "string" then
      newWaypoints = unpackObjectsString(waypoints)
   elseif type(waypoints) == "table" then
      newWaypoints = waypoints
   end
   self.nextWPID = 0

   --Start patrol
   if #newWaypoints > 0 then
      self.nextWPID = 1
   end

   --Skip if a part of patrol coroutine waits for triggerIn - it's no longer relevant
   if self.owner:getState("patrol") then
      self.routeReset = true
   end
   self.patrolPoints = newWaypoints
end

---@param timeUnit CTime | number number is considered as game seconds
function CNavigator:pausePatrol(timeUnit)
   self:setPatrolPaused(true)
   self.pausePatrolCallback = SkySystem:subscribeTimePassed(timeUnit, false, self.resumePatrol, self)
end

function CNavigator:resumePatrol()
   self:setPatrolPaused(false)
   SkySystem:unsubscribeDayTime(self.pausePatrolCallback)
   self.pausePatrolCallback = nil
end

--AI methods
function CNavigator:patrol_running()
   self.owner:setState("patrol", true)
   if self.subscribeToFFTime then
      self.ffPatrolCallback = SkySystem:subscribeFastForwardTime(partial(self.onFastForwardTimePatrol, self))
   end

   repeat
      self.routeReset = false

      local nextwp = self.patrolPoints[self.nextWPID]
      self.owner:setTarget(nextwp)
      local speed = self.owner:getWalkSpeed()
      local moveAnimation = self.owner:getAnimationFor("walk")
      if self.runPatrol then
         speed = self.owner:getRunSpeed()
         moveAnimation = self.owner:getAnimationFor("run")
      end
      self.owner:setMoveSpeed(speed)
      self.owner:setOrientationSpeed(self.owner.parameters.orientationSpeed)
      self.owner.animationsManager:playCycle(moveAnimation)

      if self.owner.subscribeToStepEvents then
         self.owner:subscribeToStepEvents(moveAnimation)
      end

      coro.waitTriggerIn(self.owner, nextwp)

      --Ignore wp advance if patrol route was reset while waiting for triggerIn
      if not self.routeReset then
         self:advanceWp()
      end
   until self.nextWPID == 0
end

function CNavigator:patrol_finish()
   self.owner:setState("patrol", false)
   self.owner:resetTarget()
   self.owner:resetSpeed()
   SkySystem:unsubscribeFastForwardTime(self.ffPatrolCallback)
   self.ffPatrolCallback = nil
end

function CNavigator:advanceWp()
   self.nextWPID = self.nextWPID + 1
   if self.nextWPID > #self.patrolPoints then
      if self.patrolLoop then
         self.nextWPID = 1 --Loop
      else
         self.nextWPID = 0 --End patrol
      end
   end
end

--Fast forward methods
function CNavigator:getPatrolDistance()
   if self.nextWPID == 0 then return 0 end
   local dist = 0
   for i=self.nextWPID, #self.patrolPoints do
      local prevWP = self.patrolPoints[i-1]
      if self.nextWPID == i then prevWP = self.owner end
      dist = dist + getDistance(prevWP:getPose():getPos(), self.patrolPoints[i]:getPose():getPos())
   end
   return dist
end

function CNavigator:getPatrolLapDistance()
   if self.nextWPID == 0 or #self.patrolPoints <= 1 then return 0 end
   local dist = self:getPatrolDistance()
   dist = dist + getDistance(self.patrolPoints[#self.patrolPoints]:getPose():getPos(), self.patrolPoints[1]:getPose():getPos())
   return dist
end

function CNavigator:onFastForwardTimePatrol(event, ...)
   if self.nextWPID == 0 then return end
   local speed = (self.runPatrol and self.owner:getRunSpeed()) or self.owner:getWalkSpeed()
   local totalDist = event.elapsed:getAs("rSecond") * speed
   local targetWPIndex

   local prevWP = self.owner --Start from the npc itself
   for i=self.nextWPID, #self.patrolPoints do
      local delta = getDistance(prevWP:getPose():getPos(), self.patrolPoints[i]:getPose():getPos())
      --log("FROM " .. prevWP:getName() .. " TO " .. self.patrolPoints[i]:getName() .. " - " .. delta)
      totalDist = totalDist - delta
      if totalDist <= 0 then
         break
      end
      targetWPIndex = i
      prevWP = self.patrolPoints[i]
   end

   if self.patrolLoop then
      totalDist = math.fmod(totalDist, self:getPatrolLapDistance()) --Remove unneccessary looping
      if totalDist > 0 then
         prevWP = self.patrolPoints[#self.patrolPoints] --Start from the end WP
         for i=1, #self.patrolPoints do
            local delta = getDistance(prevWP:getPose():getPos(), self.patrolPoints[i]:getPose():getPos())
            totalDist = totalDist - delta
            if totalDist <= 0 then
               break
            end
            targetWPIndex = i
            prevWP = self.patrolPoints[i]
         end
      end
   end

   if targetWPIndex and prevWP ~= self then
      self.nextWPID = targetWPIndex
      self.owner:getPose():setPos(self.patrolPoints[targetWPIndex]:getPose():getPos())
      self:advanceWp()
      self.owner.BT:reset()
   end
end

--Save/load
function CNavigator:OnSaveState(ownerState)
   local state = {}

   state.patrolAllowed = self.patrolAllowed
   state.patrolLoop = self.patrolLoop
   if self.patrolConvoyObj then
      state.patrolConvoyObj = self.patrolConvoyObj:getName()
   end
   state.patrolPaused = self.patrolPaused
   state.runPatrol = self.runPatrol
   if self.patrolPoints then
      state.patrolPoints = table.concat(tablex.map_named_method("getName", self.patrolPoints), ",")
   end
   state.nextWPID = self.nextWPID
   if self.pausePatrolCallback then
      state.pausePatrolCallbackTime = self.pausePatrolCallback.targetTime:getAs("gSecond")
   end

   ownerState.navigator = state
end

function CNavigator:OnLoadState(ownerState)
   local state = ownerState.navigator
   if state then
      getScene():subscribeOnLocationEnter(function()
         self:setPatrolAllowed(state.patrolAllowed)
         self:setPatrolLoop(state.patrolLoop)
         if state.patrolConvoyObj then
            self:setPatrolConvoyObj(getObj(state.patrolConvoyObj))
         end
         self:setPatrolPaused(state.patrolPaused)
         self:setRunPatrol(state.runPatrol)
         self:setPatrolRoute(state.patrolPoints)
         self.nextWPID = state.nextWPID
         if state.pausePatrolCallbackTime then
            self.pausePatrolCallback = SkySystem:subscribeDayTime(CTime(state.pausePatrolCallbackTime, "gSecond"), false, self.resumePatrol, self)
         end
      end)
   end
end

return CNavigator