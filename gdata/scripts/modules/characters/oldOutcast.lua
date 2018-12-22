local oo = require "loop.simple"
local CTalker = (require "characters.talker").CTalker

local COldOutcast = oo.class( {}, CTalker )

function COldOutcast:OnCreate()
   CTalker.OnCreate( self, char )
   self:setFeelRadius( 600 )
   self.dialogState = "subtitles"
   self.subtitles = {"Ugh... Oh..."}
end

function COldOutcast:startTalk( char )
   questSystem:fireEvent( "talk_start", self:getName(), self )
   return CTalker.startTalk( self, char )
end

function COldOutcast:patrol_()
   return self:getState("patrol") and self:getState("waitsPlayer") and not self:fear_() and not self:getState("pausePatrol") and self:getState("nearPlayer")
end

function COldOutcast:fear_()
   return #self.senseScheduler.enemies > 0 or #self.senseScheduler.ignores > 0
end

function COldOutcast:doFear( char )
   return self:isEnemy( char ) or self:isIgnore( char )
end

function COldOutcast:OnFeelIn( char )
   if not char:getState("dead") then
      CTalker.OnFeelIn( self, char )
      if char == getDefaultPlayer() then
         self:setState("nearPlayer", true)
      end
      if self:getState("waitsPlayer") then
         if self:doFear( char ) then
            self:patrol_stop()
            self.idleAnimation = "fear"
            self:idle_start()
            gameplayUI:addSubtitle("Aaah!", 1, self)
            self.subtitles = {"Don't let them get me!"}
         elseif char == getDefaultPlayer() then
            if not self:fear_() and not self:getState("pausePatrol") then
               self.idleAnimation = "idle"
               self:startMoveNextPoint()
               self.subtitles = {"We've gotta keep moving, huma."}
            end
         end
      end
   end
end

function COldOutcast:OnFeelOut( char )
   CTalker.OnFeelOut( self, char )
   if char == getDefaultPlayer() then
      self:setState("nearPlayer", false)
   end
   if self:getState("waitsPlayer") then
      if self:doFear( char ) then
         if not self:fear_() then
            self.idleAnimation = "idle"
            if self:getState("nearPlayer") then
               self:startMoveNextPoint()
            end
         end
      elseif char == getDefaultPlayer() then
         self:patrol_stop()
      end
   end
end

function COldOutcast:pausePatrol( time )
   self:setState("pausePatrol", true)
   self:patrol_stop()
   runTimer(time, nil, function()
      self:setState("pausePatrol", false)
      if not self:fear_() and self:getState("nearPlayer") then
         self:startMoveNextPoint()
      end
   end, false)
end

function COldOutcast:getLabel()
   return "Old Outcast"
end

function COldOutcast:OnSaveState( state )
   CTalker.OnSaveState( self, state )
   state.waitsPlayer = self:getState("waitsPlayer")
   state.pausePatrol = self:getState("pausePatrol")
end

function COldOutcast:OnLoadState( state )
   CTalker.OnLoadState( self, state )
   self:setState("waitsPlayer", state.waitsPlayer)
   self:setState("pausePatrol", state.pausePatrol)
end

return {COldOutcast=COldOutcast}
