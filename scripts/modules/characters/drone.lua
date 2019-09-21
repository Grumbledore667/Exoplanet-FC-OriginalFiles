local oo = require "loop.simple"
local CNavigator = require "navigator"
local CCharacter = (require "character").CCharacter
local CNPC = (require "characters.npc").CNPC

local random = require "random"
local ai = require "ai"

---@class CDrone : CCharacter
local CDrone = oo.class({}, CCharacter)

function CDrone:OnCreate(params)
   CCharacter.OnCreate(self, params)

   self:initPrefabs()
   self:initFX()

   self.repairTargetDist = 100
   self:setMassCoeff(0)

   local tree = loadParam(self, "tree", "ai.trees.drone")
   self:createTree(tree)
end

function CDrone:init()
   self.navigator = CNavigator{owner = self}

   CCharacter.init(self)
end

function CDrone:getDefaultParametersBeforeNpcData()
   local parameters = CCharacter.getDefaultParameters(self)
   parameters.orientationSpeed = 120
   parameters.viewAngle = 110
   parameters.feelRadiusCutoff = 1000
   return parameters
end

function CDrone:getDefaultParameters()
   return CNPC.getDefaultParameters(self)
end

function CDrone:loadParameters()
   CCharacter.loadParameters(self)

   self.senseScheduler:setFeelRadius(loadParamNumber(self, "feelRadiusCutoff"))

   getScene():subscribeOnLocationEnter(self.navigator.loadOwnerParameters, self.navigator)
   getScene():subscribeOnLocationEnter(function()
      self.repairTarget = loadParamObjects(self, "repairTarget")[1]
   end)
end

function CDrone:setupTimers(freq)
   self:stopTimers()

   self.senseScheduler.timer = runTimer(freq, self.senseScheduler, self.senseScheduler.OnIdle, true)
   self.behaviorTreeTimer    = runTimer(freq, self, ai.utils.ticker, true)
end

function CDrone:stopTimers()
   CCharacter.stopTimers(self)

   if self.behaviorTreeTimer then
      self.behaviorTreeTimer:stop()
      self.behaviorTreeTimer = nil
   end
end

function CDrone:initFX()
   if not self.fx then
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
   end
end

function CDrone:initPrefabs()
   if not self.lasers then
      self.lasers = {}
      self.lasers.green = self:createAspect("laser_green.sbg")
      self.lasers.green:getPose():setParent(self:getBonePose("eye_slot"))
      self.lasers.green:getPose():resetLocalPose()
      self.lasers.green:getPose():setLocalRot({x=-25})
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
   end
end

function CDrone:getWalkSpeed()
   return 300
end

function CDrone:getRunSpeed()
   return 400
end

function CDrone:getLabel()
   return "Drone"
end

function CDrone:getAnimationFor(eventName)
   if eventName == "idle" then
      return self.animations.idle.default
   elseif eventName == "walk" then
      return self.animations.walk.front.default
   elseif eventName == "run" then
      return self.animations.walk.front.default
   elseif eventName == "repair" then
      return self.animations.idle.repair
   end
end

function CDrone:OnIdle()
   CCharacter.OnIdle(self)
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
      self.lasers.green:setVisible(self.senseScheduler:getClosestCharacter() ~= nil)
   end
end

function CDrone:idle_start()
   self.animationsManager:playCycle(self:getAnimationFor("idle"))
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

function CDrone:OnSaveState(state)
   CCharacter.OnSaveState(self, state)

   self.navigator:OnSaveState(state)
end

function CDrone:OnLoadState(state)
   CCharacter.OnLoadState(self, state)

   self.navigator:OnLoadState(state)
end

return {CDrone=CDrone}
