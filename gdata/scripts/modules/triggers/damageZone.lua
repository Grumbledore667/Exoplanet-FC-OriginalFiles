local oo = require "loop.simple"
local CTrigger = (require "trigger").CTrigger

---@class CDamageZone : CTrigger
local CDamageZone = oo.class({}, CTrigger)

function CDamageZone:loadParameters()
   CTrigger.loadParameters(self)

   self.damage         = loadParamNumber(self, "damage",         0)
   self.pushForce      = loadParamNumber(self, "pushForce" ,     0)
   self.damageInterval = loadParamNumber(self, "damageInterval", 0)
end

function CDamageZone:OnCreate()
   CTrigger.OnCreate(self)
end

function CDamageZone:OnEnter(char)
   CTrigger.OnEnter(self, char)

   if #self.chars > 0 and not self.timer and self.damage > 0 then
      self.timer = runTimer(self.damageInterval, self, self.impactDamage, true)
   end
end

function CDamageZone:OnLeave(char)
   CTrigger.OnLeave(self, char)

   if #self.chars == 0 and self.timer then
      self.timer:stop()
      self.timer = nil
   end
end

function CDamageZone:impactDamage()
   for i=1,#self.chars do
      self.chars[i]:hit(self.damage, self)
      if self.pushForce > 0 then
         self.chars[i]:pushFrom(self:getPose():getPos(), self.pushForce, 0.5)
      end
   end
end

return {CDamageZone=CDamageZone}
