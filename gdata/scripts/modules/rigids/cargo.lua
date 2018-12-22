local oo = require "loop.simple"
local _rootRigid = (require "roots")._rootRigid

---@class CCargo : shRigidEntity
local CCargo = oo.class({}, _rootRigid)

function CCargo:OnCreate()
   self.interactor = self:createAspect("interactor")
   self.interactor:setObject(self)
   self.interactor:setRaycastRadius(150.0)
   self.interactor:getPose():setParent(self:getPose())
   self.interactor:getPose():resetLocalPose()
   local pos = self:getMeshByName("door_left"):getPose():getLocalPos()
   pos.x = pos.x + 165
   self.interactor:getPose():setLocalPos(pos)
   self.interactor:setRaycastActive(true)

   if not self:check_name() then
      self.interactor:setRaycastActive(false)
   end

   self.opened    = false
   self.lock_opened = false
   self.opening = false
   self.closing = false

   self.animateTimer = nil
   self.degrees_left = 0

   self:show_lock_meshes()
end

function CCargo:check_name()
   local good = {
      "container_blue_6_doors.sbg",
      "container_grey_6_doors.sbg",
      "container_red_6_doors.sbg",
      "container_yellow_6_doors.sbg",
      "t2_container.sbg",
      "t1_container.sbg",
   }
   local n = self:getPrefabName()
   for k,v in pairs(good) do
      if n == v then
         return true
      end
   end
   return false
end

function CCargo:show_lock_meshes()
   if not self:check_name() then return end
   if self.lock_opened then
      self:getMeshByName("open"):setVisible(true)
      self:getMeshByName("locked"):setVisible(false)
   else
      self:getMeshByName("open"):setVisible(false)
      self:getMeshByName("locked"):setVisible(true)
   end
end

function CCargo:OnDestroy()
end

function CCargo:OnInteractBegin(obj)
end

function CCargo:OnInteractEnd(obj)
end

function CCargo:animating()
   return self.opening or self.closing
end

function CCargo:animation()
   if self.opened then
      return
   end

   if not self:check_name() then return end
   if self.opening then
      if self.degrees_left > 0 then
         self.degrees_left = self.degrees_left - 2
      else
         self.degrees_left = 0
         self.animateTimer:stop()
         self.animateTimer = nil
         self.opening = false
         self.opened = true
         log("door opened")
         --self:setDynamic(true)
         --self:setCollisionCharacters(true, false)
         return
      end
      self:getMeshByName("door_left"):getPose():setLocalRot({y=160 - self.degrees_left})
      self:getMeshByName("open"):getPose():setLocalRot({y=160 - self.degrees_left})
      self:getMeshByName("locked"):getPose():setLocalRot({y=160 - self.degrees_left})
      self:getMeshByName("door_right"):getPose():setLocalRot({y=self.degrees_left - 160})
   elseif self.closing then
      if self.degrees_left > 0 then
         self.degrees_left = self.degrees_left - 2
      else
         self.degrees_left = 0
         self.animateTimer:stop()
         self.animateTimer = nil
         self.closing = false
         self.opened = false
      end
      self:getMeshByName("door_left"):getPose():setLocalRot({y=self.degrees_left})
      self:getMeshByName("open"):getPose():setLocalRot({y=self.degrees_left})
      self:getMeshByName("locked"):getPose():setLocalRot({y=self.degrees_left})
      self:getMeshByName("door_right"):getPose():setLocalRot({y=-self.degrees_left})
   end
end

function CCargo:activate(obj)
   if not self:check_name() then return end
   if self.lock_opened then
      if self:animating() then
         return false
      end

      -- self.animating = true
      if not self.opened then
         self.opening = true
         self.degrees_left = 160
         self.animateTimer = runTimer(0.025, self, self.animation, true)
      else
         self.closing = true
         self.degrees_left = 160
         self.animateTimer = runTimer(0.025, self, self.animation, true)
      end
   else
      self.lock_opened = true
      self:show_lock_meshes()
   end
   return true
end

function CCargo:deactivate(obj)
   return true
end

function CCargo:closeDoor()
   if not self:check_name() then return end
   if not self.opened or self:animating() then
      return false
   end

   self.animating = true

   self.opened = false
   return true
end

function CCargo:getType()
   return "activator"
end

function CCargo:getLabel()
   local label = "Cargo container"
   if not self.lock_opened then label = label.. " (locked)" end
   return label
end

function CCargo:getLabelPos()
   local pos = self.interactor:getPose():getPos()
   return pos
end

function CCargo:getInteractLabel()
   if not self.lock_opened then
      return "unlock"
   elseif self.opened then
      return "close"
   else
      return "open"
   end
end

function CCargo:OnSaveState(state)
   state.lock_opened = self.lock_opened
   state.opened = (self.opening or self.opened) and not self.closing
end

function CCargo:OnLoadState(state)
   if state.lock_opened ~= nil then
      self.lock_opened = state.lock_opened
   end
   if state.opened ~= nil then
      self.opened = state.opened
   end
   self:show_lock_meshes()
   if not self:check_name() then return end
   if self.opened then
      self:getMeshByName("door_left"):getPose():setLocalRot({y=160})
      self:getMeshByName("open"):getPose():setLocalRot({y=160})
      self:getMeshByName("locked"):getPose():setLocalRot({y=160})
      self:getMeshByName("door_right"):getPose():setLocalRot({y=-160})
   else
      self:getMeshByName("door_left"):getPose():setLocalRot({y=0})
      self:getMeshByName("open"):getPose():setLocalRot({y=0})
      self:getMeshByName("locked"):getPose():setLocalRot({y=0})
      self:getMeshByName("door_right"):getPose():setLocalRot({y=0})
   end
end

return {CCargo=CCargo}
