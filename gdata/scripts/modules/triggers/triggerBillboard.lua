local oo = require "loop.simple"
local CTrigger = (require "trigger").CTrigger

local CTriggerBillboard = oo.class({}, CTrigger)

function CTriggerBillboard:loadParameters()
   CTrigger.loadParameters( self )

   self.title         = loadParam( self, "title", "ololo" )
   self.contents      = loadParam( self, "contents" , "lorem ipsum mother fucker")
   self.onetime       = loadParam( self, "onetime" , false)
   self.hideAfter     = loadParam( self, "hideAfter" , 10)
end

function CTriggerBillboard:OnCreate()
   CTrigger.OnCreate( self )
end

function CTriggerBillboard:OnEnter( char )
   CTrigger.OnEnter( self, char )
   if string.lower(self:getName()):find("tutorial") and not getGameOption("tutorial") then return end

   if self:isEnabled() and char == getPlayer() then
      gameplayUI:setupBillboard(self.title, self.contents)
      if self.hideAfter ~= 0 then
         if gameplayUI.hideTimer then
            gameplayUI.hideTimer:stop()
         end
         gameplayUI.hideTimer = runTimer(self.hideAfter, self,
            function(self, char)
               gameplayUI:hideBillboard()
               gameplayUI.hideTimer = nil
            end, false)
      end
   end
end

function CTriggerBillboard:OnLeave( char )
   CTrigger.OnLeave( self, char )

   if self:isEnabled() and char == getPlayer() then
      if self.onetime then
         self:disable()
      end
      if self.hideAfter == 0  then
         gameplayUI:hideBillboard()
      end
   end
end

return {CTriggerBillboard=CTriggerBillboard}
