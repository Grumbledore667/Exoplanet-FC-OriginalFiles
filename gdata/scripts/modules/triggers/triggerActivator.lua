local oo = require "loop.simple"
local CTrigger = (require "trigger").CTrigger

local CTriggerActivator = oo.class({}, CTrigger)

function CTriggerActivator:loadParameters()
   CTrigger.loadParameters( self )

   self.invertAction = loadParam( self, "invertAction", false )

   self.objectsToActivate   = loadParamObjects( self, "objectsToActivate", nil )
   self.objectsToDeactivate = loadParamObjects( self, "objectsToDeactivate", nil )
   self.objectsToEnable     = loadParamObjects( self, "objectsToEnable", nil )
   self.objectsToDisable    = loadParamObjects( self, "objectsToDisable", nil )
end

function CTriggerActivator:OnCreate()
   CTrigger.OnCreate( self )
end

function CTriggerActivator:OnEnter( char )
   if ( self.byPlayer and char ~= getPlayer() ) or ( not self.byPlayer and char == getPlayer() ) then
      return
   end

   CTrigger.OnEnter( self, char )
   if not self:isEnabled() then
      return
   end

   if ( not self.invertAction ) then
      if ( self.objectsToActivate ) then for i=1,#self.objectsToActivate do self.objectsToActivate[i]:activate( self ) end end
      if ( self.objectsToEnable   ) then for i=1,#self.objectsToEnable   do self.objectsToEnable[i]:enable() end end
   else
      if ( self.objectsToDeactivate ) then for i=1,#self.objectsToDeactivate do self.objectsToDeactivate[i]:deactivate( self ) end end
      if ( self.objectsToDisable    ) then for i=1,#self.objectsToDisable    do self.objectsToDisable[i]:disable() end end
   end
end

function CTriggerActivator:OnLeave( char )
   if ( self.byPlayer and char ~= getPlayer() ) or ( not self.byPlayer and char == getPlayer() ) then
      return
   end

   CTrigger.OnLeave( self, char )
   if not self:isEnabled() then
      return
   end

   if ( self.invertAction ) then
      if ( self.objectsToActivate ) then for i=1,#self.objectsToActivate do self.objectsToActivate[i]:activate( self ) end end
      if ( self.objectsToEnable   ) then for i=1,#self.objectsToEnable   do self.objectsToEnable[i]:enable() end end
   else
      if ( self.objectsToDeactivate ) then for i=1,#self.objectsToDeactivate do self.objectsToDeactivate[i]:deactivate( self ) end end
      if ( self.objectsToDisable    ) then for i=1,#self.objectsToDisable    do self.objectsToDisable[i]:disable() end end
   end
end

return {CTriggerActivator=CTriggerActivator}
