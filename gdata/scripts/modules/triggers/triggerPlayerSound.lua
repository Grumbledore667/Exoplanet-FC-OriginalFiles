local oo = require "loop.simple"
local CTrigger = (require "trigger").CTrigger

---@class CTriggerPlayerSound : CTrigger
local CTriggerPlayerSound = oo.class({}, CTrigger)

function CTriggerPlayerSound:loadParameters()
   CTrigger.loadParameters(self)
   self.soundName = loadParam(self, "soundName", nil)
end

function CTriggerPlayerSound:OnEnter(char)
   if (self.byPlayer and char ~= getPlayer()) or (not self.byPlayer and char == getPlayer()) then
      return
   end

   CTrigger.OnEnter(self, char)
   if not self:isEnabled() or not self.soundName then return end

   getPlayer():playSound(self.soundName)
end

function CTriggerPlayerSound:OnLeave(char)
   if (self.byPlayer and char ~= getPlayer()) or (not self.byPlayer and char == getPlayer()) then
      return
   end

   CTrigger.OnLeave(self, char)
   if not self:isEnabled() then return end

   self:disable()
end

return {CTriggerPlayerSound=CTriggerPlayerSound}
