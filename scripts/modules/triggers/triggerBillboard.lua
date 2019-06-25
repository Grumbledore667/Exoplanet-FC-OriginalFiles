local oo = require "loop.simple"
local CTrigger = (require "trigger").CTrigger

---@class CTriggerBillboard : CTrigger
local CTriggerBillboard = oo.class({}, CTrigger)

function CTriggerBillboard:loadParameters()
   CTrigger.loadParameters(self)

   self.title         = loadParam(self, "title", "ololo")
   self.contents      = loadParam(self, "contents" , "lorem ipsum mother fucker")
   self.onetime       = loadParam(self, "onetime" , false)
   self.hideAfter     = loadParam(self, "hideAfter" , 10)
end

function CTriggerBillboard:OnCreate()
   CTrigger.OnCreate(self)
end

function CTriggerBillboard:OnEnter(char)
   CTrigger.OnEnter(self, char)

   if self:isEnabled() and char == getPlayer() then
      gameplayUI.billboardUI:setup(self.title, self.contents, self.hideAfter)
   end
end

function CTriggerBillboard:OnLeave(char)
   CTrigger.OnLeave(self, char)

   if self:isEnabled() and char == getPlayer() then
      if self.onetime then
         self:disable()
      end
      if self.hideAfter == 0  then
         gameplayUI.billboardUI:show(false)
      end
   end
end

return {CTriggerBillboard=CTriggerBillboard}
