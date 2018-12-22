local oo = require "loop.simple"
local CTalker = (require "characters.talker").CTalker
local CActionsScheduler = (require "actionsScheduler").CActionsScheduler
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local random = require "random"

local CLemfather = oo.class({}, CTalker)

function CLemfather:loadParameters()
   CTalker.loadParameters(self)

   self.device = self:createAspect("lem_device.sbg")
   self.device:getPose():setParent(self:getBonePose("item_slot1"))
   self.device:getPose():resetLocalPose()

   self.accumulator = self:createAspect("lem_accumulator.sbg")
   self.accumulator:getPose():setParent(self:getBonePose("item_slot2"))
   self.accumulator:getPose():resetLocalPose()

   self.camera = self:createAspect("lem_camera.sbg")
   self.camera:getPose():setParent(self:getBonePose("item_slot3"))
   self.camera:getPose():resetLocalPose()

   self.hard_drives = {}

   for i=1,4 do
      self.hard_drives[#self.hard_drives + 1] = self:createAspect("lem_hard_drive.sbg")
      self.hard_drives[i]:getPose():setParent(self:getBonePose("item_slot" .. tostring(3+i)))
      self.hard_drives[i]:getPose():resetLocalPose()
   end

   self.timerTyping = nil
end

function CLemfather:OnCreate()
   CTalker.OnCreate(self)
end

function CLemfather:OnDestroy()
   CTalker.OnDestroy(self)

   self:stop_typing()
end

-- Actions

function CLemfather:addActions()
   CTalker.addActions(self)
end

-- ----------------------------- IDLE ----------------------------------------------------
function CLemfather:idle_run()
   CTalker.idle_run(self)
end

function CLemfather:idle_start()
   CTalker.idle_start(self)

   if not self.timerTyping then
      self.timerTyping = runTimer(2, self, self.idle_typing, true)
   end
end

function CLemfather:idle_stop()
   CTalker.idle_stop(self)
   self:stop_typing()
end

function CLemfather:idle_typing()
   if random.random() < 0.1 then
      self.animationsManager:loopAnimation("idle")
   else
      self.animationsManager:loopAnimation("typing_stand")
   end
end

function CLemfather:stop_typing()
   if self.timerTyping then
      self.timerTyping:stop()
      self.timerTyping = nil
   end
end

return {CLemfather=CLemfather}
