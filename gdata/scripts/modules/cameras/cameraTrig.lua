local oo = require "loop.simple"
local CCamera = (require "cameras.cameraBase").CCamera


local CCameraTrig = oo.class(
   {
      m_trig = nil,
      m_animName = nil,
      m_muteMusic = false,
      m_smoothIn = false,
      m_smoothOut = false,
      m_wideScreenHeight = 150,
      m_timeIn = 0,
      m_timeOut = 0,
   }, CCamera)

function CCameraTrig:activateByTrigger(trig)
   self.m_trig = trig
   self.m_animName = loadParam(self, "animName", nil)
   self.m_muteMusic = loadParam(self, "muteMusic", self.m_muteMusic)
   self.m_smoothIn = loadParam(self, "smoothIn", self.m_smoothIn)
   self.m_smoothOut = loadParam(self, "smoothOut", self.m_smoothOut)
   if (not self.m_animName) then
      return
   end

   local camIn  = nil
   local camOut = getPlayer():getCamera()

   if (self.m_smoothIn) then
      self.m_timeIn = 1.0
      camIn = getPlayer():getCamera()
   end

   if (self.m_smoothOut) then
      self.m_timeOut = 1.0
   end

   getScene().m_camManager:setCurCam( self )
   self:execAnim(self.m_animName, camIn, camOut, self.m_timeIn, self.m_timeOut)
   self:wideScreen(self.m_timeIn, self.m_wideScreenHeight)
   blockUserControl()
   if (self.m_muteMusic) then
      getScene().m_musicManager:playMovieVolume(true)
   end
end

function CCameraTrig:OnBlendInStop()
end

function CCameraTrig:OnBlendOutStart()
   self:wideScreen(self.m_timeOut, -self.m_wideScreenHeight)
end

function CCameraTrig:OnAnimationStop(animName)
   CCamera.OnAnimationStop(self, animName)
   local trig = self.m_trig
   if (trig ~= nil) then
      trig.onAnimationStop(trig)
   end
   local playerCam = getPlayer():getCamera()
   getScene().m_camManager:setCurCam( playerCam )
   returnUserControl()
   if (self.m_muteMusic) then
      getScene().m_musicManager:playMovieVolume(false)
   end
end

function CCameraTrig:onSkip()
   self:stopAnim( getPlayer():getCamera(), 0)
   self:OnAnimationStop(nil)
end

return {CCameraTrig=CCameraTrig}
