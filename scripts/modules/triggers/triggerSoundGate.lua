local oo = require "loop.simple"
local CTriggerDirectional = (require "triggers.triggerDirectional").CTriggerDirectional

---@class CTriggerSoundGate : CTriggerDirectional
local CTriggerSoundGate = oo.class({}, CTriggerDirectional)

function CTriggerSoundGate:loadParameters()
   CTriggerDirectional.loadParameters(self)
   self.positiveTheme = loadParam(self, "positiveTheme", nil)
   self.negativeTheme = loadParam(self, "negativeTheme", nil)
   self.positiveAmbient = loadParam(self, "positiveAmbient", nil)
   self.negativeAmbient = loadParam(self, "negativeAmbient", nil)
   self.byPlayer = true
end

--Ambient works for player entities and music - only for MC
function CTriggerSoundGate:OnLeavePositive(char)
   if self.positiveTheme and char == getMC() then
      getScene().m_musicManager:playThemeDelayed(self.positiveTheme, 1, 5)
   end
   if self.positiveAmbient then
      getScene():playAmbient(self.positiveAmbient, char)
   end
end

function CTriggerSoundGate:OnLeaveNegative(char)
   if self.negativeTheme and char == getMC() then
      getScene().m_musicManager:playThemeDelayed(self.negativeTheme, 1, 5)
   end
   if self.negativeAmbient then
      getScene():playAmbient(self.negativeAmbient, char)
   end
end

return {CTriggerSoundGate=CTriggerSoundGate}
