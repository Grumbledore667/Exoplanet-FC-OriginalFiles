local oo = require "loop.simple"
local CTrigger = (require "trigger").CTrigger

---@class CTriggerActivator : CTrigger
local CTriggerActivator = oo.class({}, CTrigger)

function CTriggerActivator:loadParameters()
   CTrigger.loadParameters(self)

   self.invertAction = loadParam(self, "invertAction", false)

end

function CTriggerActivator:OnCreate()
   CTrigger.OnCreate(self)

   getScene():subscribeOnLocationEnter(self.loadNamedObjectParams, self)
end

function CTriggerActivator:loadNamedObjectParams()
   self.objectsToActivate   = loadParamObjects(self, "objectsToActivate")
   self.objectsToDeactivate = loadParamObjects(self, "objectsToDeactivate")
   self.objectsToEnable     = loadParamObjects(self, "objectsToEnable")
   self.objectsToDisable    = loadParamObjects(self, "objectsToDisable")
   self.collisionsToEnable  = loadParamObjects(self, "collisionsToEnable")
   self.collisionsToDisable = loadParamObjects(self, "collisionsToDisable")
end

function CTriggerActivator:OnEnter(char)
   if (self.byPlayer and char ~= getPlayer()) or (not self.byPlayer and char == getPlayer()) then
      return
   end

   CTrigger.OnEnter(self, char)
   if not self:isEnabled() then
      return
   end

   if not self.invertAction then
      self:turnObjectsOn()
   else
      self:turnObjectsOff()
   end
end

function CTriggerActivator:OnLeave(char)
   if (self.byPlayer and char ~= getPlayer()) or (not self.byPlayer and char == getPlayer()) then
      return
   end

   CTrigger.OnLeave(self, char)
   if not self:isEnabled() then
      return
   end

   if self.invertAction then
      self:turnObjectsOn()
   else
      self:turnObjectsOff()
   end
end

function CTriggerActivator:turnObjectsOn()
   for _, object in ipairs(self.objectsToActivate) do
      object:activate(self)
   end
   for _, object in ipairs(self.objectsToEnable) do
      object:enable()
   end
   for _, object in ipairs(self.collisionsToEnable) do
      enableObjectCollisions(object:getName())
   end
end

function CTriggerActivator:turnObjectsOff()
   for _, object in ipairs(self.objectsToDeactivate) do
      object:deactivate(self)
   end
   for _, object in ipairs(self.objectsToDisable) do
      object:disable()
   end
   for _, object in ipairs(self.collisionsToDisable) do
      disableObjectCollisions(object:getName())
   end
end

return {CTriggerActivator=CTriggerActivator}
