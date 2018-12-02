local oo = require "loop.simple"
local CTriggerDirectional = (require "triggers.triggerDirectional").CTriggerDirectional

---@class CTriggerMusicChange : CTriggerDirectional
local CTriggerMusicChange = oo.class({}, CTriggerDirectional)

function CTriggerMusicChange:loadParameters()
   CTriggerDirectional.loadParameters(self)
   self.themeName = loadParam(self, "themeName", nil)
end

function CTriggerMusicChange:OnLeavePositive(char)
   if char ~= getMC() then return end
   getScene().m_musicManager:playThemeDelayed(self.themeName, 1, 5)
end

function CTriggerMusicChange:OnLeaveNegative(char)
   if char ~= getMC() then return end
   getScene().m_musicManager:playDefaultThemeDelayed(1, 5)
end

return {CTriggerMusicChange=CTriggerMusicChange}
