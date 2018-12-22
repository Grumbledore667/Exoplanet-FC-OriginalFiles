local oo = require "loop.simple"

local CFastTravel = oo.class( {} )

function CFastTravel:loadParameters()
   self.prettyName = loadParam(self, "prettyName", self:getName())
   self.activateDistance = loadParamNumber(self, "activateDistance", 500)
   self.activated = false
end

function CFastTravel:OnCreate()
   CFastTravel.loadParameters( self )

   self.interactor = self:createAspect( "interactor" )
   self.interactor:setObject( self )
   self.interactor:setTriggerRadius( self.activateDistance )
   self.interactor:setRaycastRadius( 150 )
   self.interactor:getPose():setParent( self:getPose() )
   self.interactor:getPose():resetLocalPose()
   self.interactor:getPose():setLocalPos( {x=0,y=100,z=0} )
   self.interactor:setTriggerActive( true )
   self.interactor:setRaycastActive( true )

   if isEditor() then
      self.cube_helper = self:createAspect("dummy_item.sbg")
      local pos = localPointToWorld({x=0,y=0,z=-100}, self:getPose())
      self.cube_helper:getPose():setPos(pos)
   end

   self:register(false)
end

function CFastTravel:register(activate)
   local t = getGlobalParam("fast_travel_destinations")
   local entry = {activated=activate,prettyName=self.prettyName}
   if t then
      t[self:getName()] = entry
   else
      t = {}
      t[self:getName()] = entry
      setGlobalParam("fast_travel_destinations", t)
   end
   self.activated = activate
   if self.activated then
      gameplayUI:mapAddFastTravel( self )
   end
end

function CFastTravel:OnInteractTriggerBegin(obj)
   self:OnInteractHighlightBegin(obj)
end

function CFastTravel:OnInteractHighlightBegin(obj)
   if not self.activated and obj == getPlayer() then

      self:register(true)

      local q = getQuest("travel")
      if q then
         if not q:isStarted() then
            q:startImediate()
         end
         q:writeLog(string.format("%s", self.prettyName))
      end

      getPlayer():addExp(getGlobalParam("expDiscover"))
      gameplayUI:showInfoTextEx("Discovered " .. self.prettyName, "major", "")
   end
end

function CFastTravel:activate( obj )
   if not self.activated then
      self:register(true)
   end
   if not gameplayUI:isTravelVisible() then
      local count = 0
      for k, v in pairs(getGlobalParam("fast_travel_destinations")) do
         if v.activated then
            count = count + 1
         end
      end
      if count > 1 then
         gameplayUI:setupTravel()
      else
         gameplayUI:showInfoTextEx("I should explore more places", "minor", "")
      end
   end
end

function CFastTravel:getType()
   return "activator"
end

function CFastTravel:getLabel()
   return self.prettyName .. " Travel Marker"
end

function CFastTravel:getLabelPos()
   return vec3Add(self.interactor:getPose():getPos(), {y=75})
end

function CFastTravel:getInteractLabel()
   return "fast travel"
end

function CFastTravel:OnSaveState(state)
   state.activated = self.activated
end

function CFastTravel:OnLoadState(state)
   self.activated = state.activated
   self:register(self.activated)
end

return {CFastTravel=CFastTravel}
