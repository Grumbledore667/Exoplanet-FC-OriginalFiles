local oo = require "loop.simple"
local CPlayList = (require "scenes.playList").CPlayList

local CMusicManager = oo.class(
   {
      m_scene = nil,
      m_playList = nil,
      m_volume = 0.5,
      m_movieVolume = 0.01,
      m_curTrack = nil,
      m_curTheme = nil,
      m_battleTheme = false,
      m_defaultTheme = nil,

      m_shuffle = false,
      m_playedTracks = nil,

      m_muteMusicTimer = nil,
      m_movieMusic = false,
   }
)

function CMusicManager:init()
   self.m_volume = getMusicVolume()
   self:initPlayList(CPlayList)
   self:setVolume(self.m_volume)
   self.m_playedTracks = {}
end

function CMusicManager:setDefaultTheme(themeName)

   if self.m_defaultTheme ~= themeName then
      self.m_defaultTheme = themeName

      if not self.m_battleTheme then
         self:playTheme(self.m_defaultTheme)
      end
   end

end

function CMusicManager:playBattleTheme()
   if not self.m_battleTheme then
      self.m_battleTheme = true
      self:playTheme("battle")
   end
end

function CMusicManager:stopBattleTheme()
   if self.m_battleTheme then
      self.m_battleTheme = false
      self:playTheme(self.m_defaultTheme)
   end
end

function CMusicManager:getThemeEventName(themeName)
   return self.m_playList[themeName]
end

function CMusicManager:playDefaultTheme(fadeInTime)
   local default = self:getDefaultTheme()
   if self:getCurrentTheme() == default then return end
   self:playTheme(default, fadeInTime)
end

function CMusicManager:playDefaultThemeDelayed(fadeInTime, delay)
   self:playThemeDelayed(self:getDefaultTheme(), fadeInTime, delay)
end

function CMusicManager:playTheme(themeName, fadeInTime)
   if not themeName then return end

   local trackName = self:getThemeEventName(themeName)

   if not trackName then return end

   fadeInTime = fadeInTime or 1

   self.m_curTheme = themeName
   self.m_curTrack = trackName
   trackPlay(self.m_curTrack, fadeInTime)
   log("play track: " .. self.m_curTrack)
end

function CMusicManager:playThemeDelayed(themeName, fadeInTime, delay)
   if self.themeDelayTimer then self.themeDelayTimer:stop() end

   self.delayedTheme = themeName

   self.themeDelayTimer = runTimer(delay, nil, function()
      if self:getCurrentTheme() == self.delayedTheme then return end
      self:playTheme(self.delayedTheme, fadeInTime)
      self.delayedTheme = nil
      self.themeDelayTimer = nil
   end, false)
end

function CMusicManager:initPlayList(playList)
   self.m_playList = playList
end

function CMusicManager:setVolume(value)
   if isDebug() then
      value = 0
   end
   self.m_volume = value
   setMusicVolume(self.m_volume)
end

function CMusicManager:playMovieVolume(value)
   if value then
      setMusicVolume(self.m_movieVolume)
   else
      setMusicVolume(self.m_volume)
   end
   self.m_movieMusic = value
end

function CMusicManager:muteMusicByTimer(volume, time)
   setMusicVolume(volume)

   if self.m_muteMusicTimer ~= nil then
      self.m_muteMusicTimer:stop()
      self.m_muteMusicTimer = nil
   end

   self.m_muteMusicTimer = runTimer(time, self, self.endMuteMusic, false)
end

function CMusicManager:endMuteMusic()
   self.m_muteMusicTimer = nil

   if not self.m_movieMusic then
      setMusicVolume(self.m_volume)
   end
end

function CMusicManager:setShuffle(value)
   self.m_shuffle = value
end

function CMusicManager:stopMusic()
   if self.m_curTrack ~= nil then
      trackStop()
      self.m_curTrack = nil
   end
end

--[[
function CMusicManager:pauseMusic()
	if (self.m_curTrack ~= nil) then
		trackPause(true)
	end
end


function CMusicManager:resumeMusic()
	if (self.m_curTrack ~= nil) then
		trackPause(false)
	end
end
]]

function CMusicManager:getCurrentTheme()
   return self.m_curTheme
end

function CMusicManager:getDefaultTheme()
   return self.m_defaultTheme
end

function CMusicManager:OnTrackEnd()
   --self:playTheme(self.m_curTheme) --looped and shuffled in wwise
end

function CMusicManager:OnSaveState(state)
   state.curTheme = self.delayedTheme or self:getCurrentTheme()
end

function CMusicManager:OnLoadState(state)
   local theme = state.delayedTheme or state.curTheme
   if theme ~= self.m_curTheme then
      self:playTheme(theme, 0)
   end
end

return {CMusicManager=CMusicManager}
