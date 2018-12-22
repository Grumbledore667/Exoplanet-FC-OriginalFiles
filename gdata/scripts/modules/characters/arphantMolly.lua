local oo = require "loop.simple"
local CNPC = (require "characters.npc").CNPC
local SkySystem = (require "environment.sky").SkySystem
local f = require "fun"
local partial = f.partial

local coro = require "coroutines.helpers"

---@class CArphantMolly : CNPC
local CArphantMolly = oo.class({}, CNPC)

function CArphantMolly:getDefaultParameters()
   local parameters = CNPC.getDefaultParameters(self)
   parameters.defaultAnimation = "sleep_idle"
   parameters.patrolAllowed = false
   parameters.healthMax = 2000
   return parameters
end

function CArphantMolly:OnCreate()
   CNPC.OnCreate(self)
   self.interactor:getPose():setParent(self:findBonePose("Head"))
   self.interactor:getPose():resetLocalPos()
   self.interactor:setTriggerRadius(350)
   self.interactor:setTriggerActive(true)
   self.interactor:setRaycastRadius(450)
   self.interactor:setRaycastActive(true)
end

function CArphantMolly:patrol_running()
   self:setBBVar("runPatrol", true)
   if self.nextPatrolPoint == 1 then
      self.animationsManager:playCycle("idle")
      self.animationsManager:playAction("sleep_back")
      coro.waitAnimationEnd(self, "sleep_back")
   end
   self.ffPatrolCallback = SkySystem:subscribeFastForwardTime(partial(self.onFastForwardTimePatrol, self))
   CNPC.patrol_running(self)
end

function CArphantMolly:subscribeToStepEvents(anim)
   self.animationsManager:subscribeAnimationEventIn(anim, "step1", self.onStepEventIn, self)
   self.animationsManager:subscribeAnimationEventIn(anim, "step2", self.onStepEventIn, self)
   self.animationsManager:subscribeAnimationEventIn(anim, "step3", self.onStepEventIn, self)
end

function CArphantMolly:initAnimations()
   if self:getPrefabName() == "arphant.cfg" then
      return {
         idle = {
            default = {"idle"},
         },
         walk = {
            front = {
               default = "walk",
               fast = "walk_fast",
            },
         },
         run = {
            front = {
               default = "run",
            },
         },
         talk = {
            default = {"idle"},
         },
      }
   end
end

function CArphantMolly:getWalkSpeed()
   return 150
end

function CArphantMolly:getRunSpeed()
   return 400
end

function CArphantMolly:OnSaveState(state)
   CNPC.OnSaveState(self, state)
   state.defaultAnimation = self.defaultAnimation
end

function CArphantMolly:OnLoadState(state)
   CNPC.OnLoadState(self, state)
   self.defaultAnimation = state.defaultAnimation
end

return {CArphantMolly=CArphantMolly}
