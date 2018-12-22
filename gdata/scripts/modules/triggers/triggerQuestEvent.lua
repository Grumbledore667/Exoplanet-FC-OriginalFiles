local oo = require "loop.simple"
local CTrigger = (require "trigger").CTrigger

local CTriggerQuestEvent = oo.class({}, CTrigger)

function CTriggerQuestEvent:loadParameters()
   CTrigger.loadParameters( self )

   self.oneTime = loadParam( self, "oneTime", false )

   self.eventType   = loadParam( self, "eventType", "activate" )
end

function CTriggerQuestEvent:OnCreate()
   CTrigger.OnCreate( self )
end

function CTriggerQuestEvent:OnEnter( char )
   if ( self.byPlayer and char ~= getPlayer() ) or ( not self.byPlayer and char == getPlayer() ) then
      return
   end

   CTrigger.OnEnter( self, char )
   if not self:isEnabled() then
      return
   end

   questSystem:fireEvent( self.eventType, self:getName(), self )

   if self.oneTime then
      self:disable()
   end
end

return {CTriggerQuestEvent=CTriggerQuestEvent}
