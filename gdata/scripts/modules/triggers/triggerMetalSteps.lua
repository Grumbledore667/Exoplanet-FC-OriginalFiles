local oo = require "loop.simple"
local CTrigger = (require "trigger").CTrigger

---@class CTriggerMetalSteps : CTrigger
local CTriggerMetalSteps = oo.class({}, CTrigger)

function CTriggerMetalSteps:loadParameters()
   self.byPlayer = true
   self.enabled  = true
   self.metalSteps = true
end

function CTriggerMetalSteps:OnCreate()
   CTrigger.OnCreate(self)
   self:loadParameters()
end

return {CTriggerMetalSteps=CTriggerMetalSteps}
