local oo = require "loop.simple"
local _rootRigid = (require "roots")._rootRigid

---@class CTurretMedium : shRigidEntity
local CTurretMedium = oo.class({}, _rootRigid)

local TS_TARGET_STANDBY  = 0
local TS_TARGET_DETECTED = 1
local TS_TARGET_SCANNING = 2
local TS_TARGET_SUCCESS  = 3
local TS_TARGET_FAIL     = 4

local gTurretGuiContext = nil
local gTurretGuiWnd     = nil

function CTurretMedium:OnCreate()
   self.interactor = self:createAspect("interactor")
   self.interactor:setObject(self)
   self.scanDist = 2000
   self.interactor:setTriggerRadius(self.scanDist)
   self.interactor:getPose():setParent(self:getPose())
   self.interactor:getPose():resetLocalPose()
   self.interactor:setTriggerActive(true)

   self.sounds = {}
   self.sounds.move = self:createAspect("Play_def_turret_medium_rotate")
   self.sounds.move:setDistance(5000)
   self.sounds.move:getPose():setParent(self:getPose())
   self.sounds.move:getPose():resetLocalPose()

   self.rigid = self

   self.rigid:getMeshByName("locator001"):getPose():setParent(self.rigid:getMeshByName("base_small001"):getPose())
   self.rigid:getMeshByName("base_small001"):getPose():setParent(self.rigid:getMeshByName("base_big001"):getPose())

   self.rigid:getMeshByName("base_big001"):getPose():setLocalRot({y=0})
   self.rigid:getMeshByName("base_small001"):getPose():setLocalRot({x=0})

   self.lasers = {}
   self.lasers.green = self:createAspect("laser_green.sbg")
   self.lasers.green:getPose():setParent(self.rigid:getMeshByName("base_small001"):getPose())
   self.lasers.green:getPose():resetLocalPose()
   self.lasers.green:getPose():setLocalPos({x=-12,y=-18,z=-33})
   self.lasers.green:getPose():setLocalScale({x=0.5,y=1,z=2.0})
   self.lasers.green:playAnimation("scan", true)
   self.lasers.green:setAnimationSpeed(2.0)
   self.lasers.green:setVisible(false)
   self.lasers.green:setMaterials("lazer_scanner")

   self.moving = false
   self.state  = TS_TARGET_STANDBY

   self.objectsToActivate   = loadParamObjects(self, "objectsToActivate", nil)

   self:initTerminal()
end

function CTurretMedium:OnDestroy()
end

function CTurretMedium:initTerminal()
   if not gTurretGuiContext then
      gTurretGuiContext = createGUIContext("turret.layout", "turret.gui", false)

      gTurretGuiContext:setDefaultFont("venus rising rg-14")

      gTurretGuiWnd = gTurretGuiContext:getRootWindow()
   end

   self.terminalHologram = self:createAspect("turret_hologram.sbg")

   self.terminalHologram:getPose():setParent(self.rigid:getMeshByName("base_small001"):getPose())
   self.terminalHologram:getPose():resetLocalPose()
   self.terminalHologram:getPose():setLocalPos({y=-50,z=-200})
   self.terminalHologram:getPose():setLocalScale({x=0.9,y=0.9,z=0.9})

   if loadParam(self, "hologramFlipped", false) then
      self.terminalHologram:getPose():setLocalRot({z=180})
   end

   self.terminalHologram:setTexture(0, "turret.gui")
   self.terminalHologram:setMaterials("hologram")

   self.terminalOmni = self:createAspect("omni")
   self.terminalOmni:getPose():setParent(self.terminalHologram:getPose())
   self.terminalOmni:getPose():resetLocalPose()
   self.terminalOmni:setColor({r=0.5,g=0.9,b=0.9})
   self.terminalOmni:setRadius(250)
   self.terminalOmni:setIntensity(0.3)

   self:hideTerminal()
end

function CTurretMedium:showTerminal()
   gTurretGuiContext:setRootWindow(gTurretGuiWnd)
   self.terminalHologram:setVisible(true)
   self.terminalOmni:setVisible(true)
end

function CTurretMedium:hideTerminal()
   self.terminalOmni:setVisible(false)
   self.terminalHologram:setVisible(false)
   gTurretGuiContext:setRootWindow(nil)
end

function CTurretMedium:setTerminalText(text)
   gTurretGuiWnd:getChild("Text"):setText(text)
end

function CTurretMedium:OnInteractTriggerBegin(obj)
   if obj == getMC() and not objInDist(obj:getPose():getPos(), self:getPose():getPos(), self.scanDist) then
      return
   end

   self.target = obj

   if not self.trackTimer then
      self.trackTimer = runTimer(0.025, self, self.trackTarget, true)
   end

   self:showTerminal()
   self:setTerminalText("Target Detected")

   self.state = TS_TARGET_DETECTED
end

function CTurretMedium:OnInteractTriggerEnd(obj)
   self.target = nil
end

function CTurretMedium:scanTarget()
   self:setTerminalText("Scanning Target...")

   self.state = TS_TARGET_SCANNING

   self.lasers.green:setVisible(true)

   runTimer(2, self, self.targetSuccess, false)
end

function CTurretMedium:targetSuccess()
   if self.target then
      self.state = TS_TARGET_SUCCESS

      self.lasers.green:setVisible(false)

      self:setTerminalText("Target Type: Human")

      runTimer(2, self, function (self)
         self:setTerminalText("Access Granted")
         runTimer(2, self, function (self)
            self:setTerminalText("Welcome to Outpost 74")
            if self.objectsToActivate then for i=1,#self.objectsToActivate do self.objectsToActivate[i]:activate(self) end end
            runTimer(2, self, function (self) self.target = nil end, false)
         end, false)
      end, false)
   end
end

function CTurretMedium:getTargetDir()
   if self.target then
      return vec3Normalize(vec3Sub(self.target:getPose():getPos(),self.rigid:getMeshByName("base_small001"):getPose():getPos()))
   else
      return self:getDefaultDir()
   end
end

function CTurretMedium:getDefaultDir()
   return vec3RotateQuat({x=0,y=0,z=-1}, self:getPose():getRotQuat())
end

function CTurretMedium:trackTarget()
   local targetDir = self:getTargetDir()

   if not self.prevTargetDir then
      self.prevTargetDir = self:getDefaultDir()
   end

   local offsetDir = vec3Normalize(vec3Sub(targetDir, self.prevTargetDir))
   local resultDir = vec3Normalize(vec3Add(self.prevTargetDir, vec3Mul(offsetDir, 1.0 * getFrameTime())))

   --log("dist=" .. getDistance(resultDir, targetDir))
   if dotProduct(offsetDir, vec3Normalize(vec3Sub(targetDir, resultDir))) < 0 or getDistance(resultDir, targetDir) < 0.001 then
      resultDir = targetDir

      if getDistance(resultDir, self.prevTargetDir) > 0.000001 then
         if not self.moving then
            self.moving = true
            self.sounds.move:play()
            --log("play--")
         end
      else
         if self.moving then
            self.moving = false
            self.sounds.move:stop()

            if not self.target then
               self.trackTimer:stop()
               self.trackTimer = nil

               self:hideTerminal()
            end
            --log("stop--")
         end
      end
   else
      if not self.moving then
         self.moving = true
         self.sounds.move:play()
         --log("play--")
      end
   end

   if not self.moving then
      return
   end

   if self.state == TS_TARGET_DETECTED and getAngleUnsigned(resultDir, targetDir) < 5 then
      self:scanTarget()
   end

   local localDir      = vec3RotateQuat(resultDir, quatInverse(self:getPose():getRotQuat()))
   local targetDirFlat = vec3Normalize({x=localDir.x,y=0,z=localDir.z})
   local rightDir      = crossProduct({y=1}, localDir)

   local angleHor = getAngle({x=0,y=0,z=-1}, targetDirFlat, {x=0,y=1,z=0})
   local angleVer = getAngle(localDir, targetDirFlat, rightDir)

   self.rigid:getMeshByName("base_big001"):getPose():setLocalRot({y=angleHor})
   self.rigid:getMeshByName("base_small001"):getPose():setLocalRot({x=angleVer})

   self.prevTargetDir = resultDir
end

function CTurretMedium:getLabel()
   return "Turret Medium"
end

return {CTurretMedium=CTurretMedium}
