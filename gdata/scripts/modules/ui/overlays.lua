local oo = require "loop.simple"

local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class COverlaysUI : CBaseModule
local COverlaysUI = oo.class({
   layoutName = "gameplay/overlays.layout",
   initVisible = true,
}, CBaseModule)

--Methods
function COverlaysUI:init()
   CBaseModule.init(self)

   self.black = {wnd = self.wnd:getChild("Black"), state = false}
end

function COverlaysUI:triggerOverlay(stringName, time, state)
   self[stringName].state = state
   if self[stringName].state then
      self[stringName].wnd:setAlpha(0.01)
      GUIUtils.fadeInWindow(self[stringName].wnd, time)
   else
      GUIUtils.fadeOutWindow(self[stringName].wnd, time)
   end
end

function COverlaysUI:startFadeToBlackSequence(fadeInTime, pauseTime, fadeOutTime, callbacks)
   callbacks = callbacks or {}
   gameplayUI.fadeToBlackSequence = true

   local function onFadeOutEnd()
      gameplayUI.fadeToBlackSequence = false
      if callbacks.onFadeOutEnd then callbacks.onFadeOutEnd.func(unpack(callbacks.onFadeOutEnd.args or {})) end
   end

   local function onFadeOutStart()
      if callbacks.onFadeOutStart then callbacks.onFadeOutStart.func(unpack(callbacks.onFadeOutStart.args or {})) end
      GUIUtils.fadeOutWindow(self.black.wnd, fadeOutTime, onFadeOutEnd)
   end

   local function onPause()
      if callbacks.onPause then callbacks.onPause.func(unpack(callbacks.onPause.args or {})) end
      runTimer(pauseTime, nil, onFadeOutStart, false)
   end

   GUIUtils.fadeInWindow(self.black.wnd, fadeInTime, onPause)
end


return COverlaysUI
