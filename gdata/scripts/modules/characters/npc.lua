local oo            = require "loop.simple"
local CCharacter    = (require "character").CCharacter
local CTalker       = (require "characters.talker").CTalker
local CEventManager = (require "notificationCenter2").CNotificationCenter

local ai            = require "ai"

local CNPC = oo.class({}, CCharacter)

function CNPC:OnCreate()
   CCharacter.OnCreate(self)
   self:loadParameters()
   self:initSenses()

   self:setRole(ROLE_NPC_FRIEND)

   self.eventManager = CEventManager{owner=self}
   self.eventManager:init()

   self:createTree()
end

function CNPC:initSenses()
   self.senseScheduler:addPlayerDetectSense()
   self.senseScheduler:addDistanceSense("playerInDialogDistance", "player", "dialogInitiatorDist")
end

function CNPC:loadParameters()
   self.parameters.dialogInitiatorDist = 300

   local dialogName = loadParam(self, "dialog", "")
   local uniqueName = string.format("%s_%s", self:getName(), dialogName)
   self.dialog = dialogSystem:createDialog(dialogName, uniqueName)
   self:setDialogInitiator(true)

   self:setPatrolLoop(true)
   self.nextPatrolPoint = 0
   runTimer(0, nil, function()
      self:setPatrolRoute("Trigger_0,Trigger_1")
      self:setPatrolActive(true)
   end, false)

   self.animations = self:initAnimations()

   runTimer(0, self, self.initDialog, false)

   self.senseScheduler:setFeelRadius(loadParamNumber(self, "feelRadiusCutoff", 10000))
end

function CNPC:setPatrolRoute(waypoints)
   self.patrolPoints = loadParamObjects(self, "patrolPoints", waypoints)
   self.nextPatrolPoint = #self.patrolPoints
   if #self.patrolPoints > 0 then
      self.nextPatrolPoint = 1
   end
end

function CNPC:setPatrolActive(value)
   self:setState("patrolActive", value)
end

function CNPC:setPatrolLoop(value)
   self.patrolLoop = value
end

function CNPC:resetSpeed()
   self:setMoveSpeed(0)
   self:setOrientationSpeed(0)
end

function CNPC:runToSetWp_start()
   self:setTarget(self:getBBVar("nextWaypoint"))
   self:setMoveSpeed(200)
   self:setOrientationSpeed(200)
   self.animationsManager:loopAnimation(self.animations.walk.front.default)
end

function CNPC:advanceWp_start()
   self.nextPatrolPoint = self.nextPatrolPoint + 1
   if self.nextPatrolPoint > #self.patrolPoints then
      if not self.patrolLoop then
         self.nextPatrolPoint = 0
      else
         self.nextPatrolPoint = 1
      end
   end
end

function CNPC:initAnimations()
   -- temporary table for abori
   return {
      idle = {
         default = {"idle.caf","idle_2.caf","idle_3.caf","idle_4.caf","idle_5.caf",},
      },
      walk = {
         front = {
            default = "walk_front.caf",
         },
      },
      turn = {
         left = {
            step    = "turn_left.caf",
            quarter = "turn_left_90.caf",
            full    = "turn_left_180.caf",
         },
         right = {
            step    = "turn_right.caf",
            quarter = "turn_right_90.caf",
            full    = "turn_right_180.caf",
         },
      },
      talk = {
         default = "idle_talk.caf",
      },
      hit = {
         default = "hit__default.caf",
      },
      die = {
         default = "death.caf",
      },
   }
end

function CNPC:initDialog()
   if self.dialog then
      self.dialog.actors[1] = getPlayer()

      self.dialogActors = loadParamObjects(self, "dialogActors", nil)

      if not self.dialogActors or #self.dialogActors == 0 then
         self.dialog.actors[2] = self
      else
         for _, actor in pairs(self.dialogActors) do
            table.insert(self.dialog.actors, actor)
         end
      end
   end
end

function CNPC:startTalk(char)
   return true
end

function CNPC:stopTalk(char)
   self.animationsManager:stopAnimation(self.animations.talk.default)
end

function CNPC:onStartMessage()
   self.animationsManager:playAnimation(self.animations.talk.default, true)
end

function CNPC:onStopMessage()

end

function CNPC:onStopDialog()
   runTimer(0, nil, function()
      dialogSystem:stopDialog( self.dialog )
   end, false)
   self:setState("inDialog", false)
   self:setDialogInitiator(false)
end

function CNPC:setupTimers(freq)
   self:stopTimers()

   self.senseScheduler.timer = runTimer(freq, self.senseScheduler, self.senseScheduler.OnIdle, true)
   self.behaviorTreeTimer    = runTimer(freq, nil, function ()
      if self.BT then
         self.BT:tick()
         self.eventManager:removeNotifications()
      end
   end, true)
end

function CNPC:stopTimers()
   CCharacter.stopTimers(self)

   if self.behaviorTreeTimer then
      self.behaviorTreeTimer:stop()
      self.behaviorTreeTimer = nil
   end
end

function CNPC:createTree()
   self.BT = ai.utils.loadTree("ai.trees.npc", self)
   self.BT:setBlackboard(self.blackboard)
end

function CNPC:setTargetObjPlayer_start()
   self:setBBVar("targetObj", getPlayer())
end

function CNPC:faceObject_start()
   local side, angle
   local speed = 100
   local extent = "quarter"

   local targetObj = self:getBBVar("targetObj")

   if targetObj then
      angle = getTargetAngle(self, targetObj:getPose():getPos())
   else
      angle = self:getBBVar("orientAngle") - self:getOrientationFull()
   end

   if math.abs(angle) > 90 then
      extent = "full"
      speed = 200
   elseif math.abs(angle) > 45 then
      speed = 150
   end

   if angle > 0 then
      side = "left"
   else
      side = "right"
   end

   self:setOrientationSpeed(speed)
   if targetObj then
      self:setTarget(targetObj)
   else
      self:setOrientationFull(self:getBBVar("orientAngle"))
   end
   if extent ~= "full" then
      self.animationsManager:loopAnimation(self.animations.turn[side][extent])
   end
   self.animationsManager:playAnimation(self.animations.turn[side][extent])
end

function CNPC:faceObject_running()
   local remainingAngle
   local targetObj = self:getBBVar("targetObj")
   if not targetObj then
      remainingAngle = math.abs(self:getOrientation() - self:getBBVar("orientAngle"))
      return remainingAngle > 0
   else
      remainingAngle = getTargetAngle(self, targetObj:getPose():getPos())
      return math.abs(remainingAngle) > 10
   end
end

function CNPC:faceObject_finish()
   self:setOrientationSpeed(0)
   self:resetTarget()
   self.animationsManager:loopAnimation(self.animations.idle.default[1])
end

function CNPC:talkToPlayer_start()
   getPlayer():startTalk(self)
   self:setState("talkRequest", false)
   self:setState("inDialog", true)
end

function CNPC:inDialog_start()
   dialogSystem:playDialog( self.dialog )
end

function CNPC:isDialogInitiator()
   return self.dialogInitiator
end

function CNPC:setDialogInitiator(value)
   self.dialogInitiator = value
end

function CNPC:getType()
   return "activator"
end

function CNPC:activate()
   -- self:setState("startWalking", true)
   self:setState("talkRequest", true)
end

return {
   CNPC=CNPC,
}
