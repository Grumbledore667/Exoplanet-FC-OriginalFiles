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

function CDoor:OnInteractTriggerEnd(obj)
   if self.disableOnOpen then
      return
   elseif not self:closeDoor() then
      runTimer(1, self, self.closeDoor, false)
   end
end

function CDoor:OnFocusEnd(obj)
   CLockable.OnFocusEnd(self, obj)
   if self.opened and not objInDist(obj:getPose():getPos(), self:getPose():getPos(), self.interactor:getTriggerRadius()) then
      self:OnInteractTriggerEnd(obj)
   end
end

function CDoor:animStop()
   self.animating = false
end

function CDoor:activate(obj)
   if self.animating then return false end

   if self:isLocked() then
      CLockable.activate(self, obj)
   elseif self.opened then
      self:closeDoor()
   else
      self.opened = true
      self.animating = true
      self:playAnimation("open", false)
      self.sounds.open:play()
      if self.disableOnOpen then
         self.interactor:setTriggerActive(false)
      end
   end

   return true
end

function CDoor:deactivate(obj)
   if self.locked then
      CLockable.deactivate(self, obj)
   end
   return true
end

function CDoor:closeDoor()
   if not self.opened or self.animating then return false end

   self.opened = false
   self.animating = true
   self:playAnimation("close", false)

   self.sounds.open:play()

   return true
end

function CDoor:tryCode(strCode)
   if CLockable.tryCode(self, strCode) then
      self:activate()
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
