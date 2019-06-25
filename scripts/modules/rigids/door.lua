local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local CLockable = require "mixins.lockable"
local CDestroyable = require "mixins.destroyable"

---@class CDoor : shRigidEntity
local CDoor = oo.class({}, _rootRigid, CLockable, CDestroyable)

function CDoor:OnCreate()
   CLockable.OnCreate(self)
   CDestroyable.OnCreate(self)

   self.opened    = false
   self.animating = false

   self.interactor:getPose():setLocalPos({x=0,y=150,z=-150})
   self.interactor:setTriggerRadius(200.0)
   self.interactor:setRaycastRadius(100.0)
   self.interactor:setTriggerActive(true)
   self.interactor:setRaycastActive(true)

   self.sounds = {}
   self.sounds.open = self:createAspect("Play_door_slide_open")
   self.sounds.open:getPose():setParent(self:getPose())
   self.sounds.open:getPose():setLocalPos({x=0,y=0,z=-150})
   self.sounds.open:getPose():resetLocalPose()

   self:subscribeAnimationStop(self.animStop, self)

   self.disableOnOpen = loadParam(self, "disableOnOpen", false)
end

function CDoor:OnInteractTriggerEnd(char)
   if self.disableOnOpen then
      return
   elseif self.opened and not self.animating then
      self:activate(char)
   elseif self.opened and self.animating then
      if not self.timer then
         self.timer = runTimer(1, nil, function()
            self:activate(char)
            self.timer = nil
         end, false)
      end
   end
end

function CDoor:OnFocusEnd(char)
   CLockable.OnFocusEnd(self, char)

   if not objInDist(char:getPose():getPos(), self:getPose():getPos(), self.interactor:getTriggerRadius()) then
      self:OnInteractTriggerEnd(char)
   end
end

function CDoor:animStop()
   self.animating = false
end

function CDoor:activate(char)
   if not self:isLocked() then
      self.animating = true
      self.sounds.open:play()
      if self.opened then
         self:playAnimation("close", false)
      else
         self:playAnimation("open", false)
         if self.disableOnOpen then
            self.interactor:setTriggerActive(false)
         end
      end
      self.opened = not self.opened
   end
end

function CDoor:getLabel()
   local label = "Door"
   label = CLockable.getLabel(self) .. label
   return label
end

function CDoor:getInteractLabel()
   return "open"
end

function CDoor:getInteractType(char)
   if self.animating then
      return "no_interaction"
   elseif self:isLocked() then
      return CLockable.getInteractType(self, char)
   else
      return "door"
   end
end

function CDoor:isInteractionLingering(char)
   if self:isLocked() then
      return CLockable.isInteractionLingering(self, char)
   else
      return false
   end
end

function CDoor:OnSaveState(state)
   CLockable.OnSaveState(self, state)
   state.opened = self.opened
   state.interactor = self.interactor:getTriggerActive()
end

function CDoor:OnLoadState(state)
   CLockable.OnLoadState(self, state)
   if state.opened then
      self.opened = state.opened
   end
   if state.interactor == true then
      self.interactor:setTriggerActive(true)
   elseif state.interactor == false then
      self.interactor:setTriggerActive(false)
   end
end

return {CDoor=CDoor}
