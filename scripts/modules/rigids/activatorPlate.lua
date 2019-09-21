local oo = require "loop.simple"
local CActivator = require "rigids.activator".CActivator

---@class CActivatorPlate : CActivator
local CActivatorPlate = oo.class({}, CActivator)

function CActivatorPlate:OnCreate(params)
   CActivator.OnCreate(self, params)

   self.toggle = loadParam(self, "toggle", false)

   self.interactor:setRaycastActive(false)
   self.interactor:setTriggerActive(true)
   self.interactor:setTriggerRadius(42 * self:getPose():getScale().x)
   self.chars = {}

   self:subscribeAnimationStop(self.onAnimStop, self)
end

function CActivatorPlate:enable()
   self.enabled = true
   self.interactor:setTriggerActive(true)
end

function CActivatorPlate:disable()
   self.enabled = false
   self.interactor:setTriggerActive(false)
end

function CActivatorPlate:OnInteractTriggerBegin(char)
   if not next(self.chars) then
      self:playAnimation("down", false)
      self.animationInProgress = "down"
   end
   self.chars[char] = true
end

function CActivatorPlate:OnInteractTriggerEnd(char)
   self.chars[char] = nil
   if not next(self.chars) then
      self:playAnimation("up", false)
      self.animationInProgress = "up"
   end
end

function CActivatorPlate:onAnimStop()
   if self.animationInProgress == "down" and self.enabled then
      self:activate()
   end
   self.animationInProgress = nil
end

function CActivatorPlate:activate(char)
   local activation
   if self.toggle then
      activation = not self.activated
   else
      activation = true
   end

   if activation then
      CActivator.activate(self, char)
   else
      CActivator.activateReverse(self, char)
   end
end

return {CActivatorPlate=CActivatorPlate}
