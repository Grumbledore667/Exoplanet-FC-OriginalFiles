local oo = require "loop.simple"
local CTalker = (require "characters.talker").CTalker
local CActionsScheduler = (require "actionsScheduler").CActionsScheduler
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local ObjectsLabels = (require "objectsLabels")
local random = require "random"

---@class CDrone : CTalker
local CDrone = oo.class({}, CTalker)

function CDrone:OnCreate()
   CTalker.OnCreate(self)

   self:setMassCoeff(0)

   self.lasers = {}
   self.lasers.green = self:createAspect("laser_green.sbg")
   self.lasers.green:getPose():setParent(self:getBonePose("eye_slot"))
   self.lasers.green:getPose():resetLocalPose()
   self.lasers.green:getPose():setLocalRot({x=-25})
   --self.lasers.green:getPose():setLocalPos({x=-12,y=-18,z=-33})
   --self.lasers.green:getPose():setLocalScale({x=0.75,y=1,z=1.0})
   self.lasers.green:playAnimation("scan", true)
   self.lasers.green:setAnimationSpeed(2.0)
   self.lasers.green:setVisible(false)
   self.lasers.green:setMaterials("lazer_scanner")

   self.lasers.repair = self:createAspect("laser_repair.sbg")
   self.lasers.repair:getPose():setParent(self:getBonePose("gun_slot_up"))
   self.lasers.repair:getPose():resetLocalPose()
   self.lasers.repair:getPose():setLocalPos({z=-50})
   self.lasers.repair:getPose():setLocalScale({x=3,y=3,z=100})
   self.lasers.repair:setMaterials("spark_add")
   self.lasers.repair:setVisible(false)

   self.fx = {}
   self.fx.sparks = self:createAspect("sparks.sps")
   self.fx.sparks:getPose():setParent(self:getBonePose("gun_slot_up"))
   self.fx.sparks:getPose():resetLocalPose()
   self.fx.sparks:getPose():setLocalPos({z=-100})
   self.fx.sparks:setVisible(true)
   self.fx.sparks:disable()

   self.fx.omni = self:createAspect("omni")
   self.fx.omni:getPose():setParent(self:getBonePose("gun_slot_up"))
   self.fx.omni:getPose():resetLocalPose()
   self.fx.omni:setColor({r=0.9,g=0.8,b=0.6})
   self.fx.omni:setRadius(300)
   self.fx.omni:setIntensity(2)
   self.fx.omni:setVisible(false)

   self.senseScheduler:setFeelRadius(1000)
   self.parameters.viewAngle = 110
   self.patrolSpeed = 300
   self.repairTargetDist = 100

   getScene():subscribeOnLocationEnter(self.loadNamedObjectParams, self)
end

function CDrone:loadNamedObjectParams()
   self.repairTarget = loadParamObjects(self, "repairTarget")[1]
end

function CDrone:OnIdle()
   if self.canRepair and not self:getState("patrol") then
      self.lasers.green:setVisible(false)
      self.fx.omni:setVisible(true)
      self.lasers.repair:setVisible(true)

      local sparksPose = self.fx.sparks:getPose()

      local sparksDir    = vec3Normalize(vec3Sub(sparksPose:getPos(), sparksPose:getParent():getPos()))
      local sparkDirFlat = vec3Normalize({ x = sparksDir.x, y=0, z=sparksDir.z })

      local lazerLength = self.repairTargetDist * (1.0 + 1.0 - dotProduct(sparkDirFlat, sparksDir))

      sparksPose:setLocalPos({z=-lazerLength})
      self.fx.omni:getPose():setLocalPos({z=-lazerLength + 40})

      self.lasers.repair:getPose():setLocalPos({z=-lazerLength * 0.5})
      self.lasers.repair:getPose():setLocalScale({x=3,y=3,z=lazerLength})

      if not self.fx.omniTimer then
         self.fx.omniTimer = runTimer(0.08, self, function (self) self.fx.omni:setIntensity(0.5 + random.random() * 2) end, true)
      end

   else
      CTalker.OnIdle(self)
      self.lasers.green:setVisible(self.senseScheduler:getClosestCharacter() ~= nil)
   end
end

function CDrone:idle_start()
   CTalker.idle_start(self)

   if self.repairTarget then
      local v1 = self.repairTarget:getPose():getPos()
      local v2 = self:getBonePose("gun_slot_up"):getPos()
      v1.y = v2.y

      self.repairTargetDist = getDistance(v1, v2)
      self.canRepair        = self.repairTargetDist < 300

      if self.canRepair then
         self.animationsManager:playCycle("repair")
         self.fx.sparks:enable()
      end
   end
end

function CDrone:idle_stop()
   CTalker.idle_stop(self)
end

return {CDrone=CDrone}
