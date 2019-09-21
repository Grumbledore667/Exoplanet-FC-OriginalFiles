local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local CLockable = require "mixins.lockable"
local CDestroyable = require "mixins.destroyable"

local tablex = require "pl.tablex"

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

   self.sounds = {}
   self.sounds.open = self:createAspect("Play_door_slide_open")
   self.sounds.open:getPose():setParent(self:getPose())
   self.sounds.open:getPose():setLocalPos({x=0,y=0,z=-150})
   self.sounds.open:getPose():resetLocalPose()

   self:subscribeAnimationStop(self.animStop, self)

   self.disableOnOpen = loadParam(self, "disableOnOpen", false)
   getScene():subscribeOnLocationEnter(self.onLocationEnter, self)
end

function CDoor:onLocationEnter()
   self.guardedBy = tablex.index_map(loadParamObjects(self, "guardedBy"))
end

function CDoor:OnInteractTriggerEnd(char)
   if not self.enabled then return end

   if self.opened and not self.animating then
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

function CDoor:enable()
   CLockable.enable(self)

   self.interactor:setTriggerActive(true)
end

function CDoor:disable()
   CLockable.disable(self)

   self.interactor:setTriggerActive(false)
end

function CDoor:activate(char)
   if not self:isLocked() then
      self.animating = true
      if self.opened then
         self:close()
      else
         self:open()
      end
   end
end

function CDoor:open()
   if self.opened then return end
   self.opened = true
   self:playAnimation("open", false)
   self.sounds.open:play()
   if self.disableOnOpen then
      self:disable()
   end
end

function CDoor:close()
   if not self.opened then return end
   self.opened = false
   self:playAnimation("close", false)
   self.sounds.open:play()
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
   elseif self:isGuarded() then
      return "unauthorized_access"
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

function CDoor:isGuarded()
   for char in pairs(self.guardedBy) do
      if not char:getState("dead") and not char:getState("knockout") then
         if getDistance(self:getPose():getPos(), char:getPose():getPos()) > 700 then
            log(string.format("WARNING: '%s' is probably too far to be guarding '%s' of class 'CDoor'", char:getName(), self:getName()))
         end
         return true
      end
   end
   return false
end

function CDoor:setGuardedBy(obj, state)
   if state then
      self.guardedBy[obj] = true
   else
      self.guardedBy[obj] = nil
   end
end

function CDoor:OnSaveState(state)
   CLockable.OnSaveState(self, state)
   state.opened = self.opened
   if next(self.guardedBy) then
      state.guardedBy = {}
      for char in pairs(self.guardedBy) do
         table.insert(state.guardedBy, char:getName())
      end
   end
end

function CDoor:OnLoadState(state)
   CLockable.OnLoadState(self, state)
   if state.opened then
      self.opened = state.opened
   end
   self.guardedBy = {}
   if state.guardedBy then
      for _,name in pairs(state.guardedBy) do
         local char = getObj(name)
         if char then
            self:setGuardedBy(char, true)
         end
      end
   end
end

return {CDoor=CDoor}
