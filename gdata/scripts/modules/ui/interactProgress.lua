local oo = require "loop.simple"

local CBaseModule = require "ui.baseModule"

---@class CInteractProgressUI : CBaseModule
local CInteractProgressUI = oo.class({
   layoutName = "interact_progress.layout",
}, CBaseModule)

--Methods
function CInteractProgressUI:init()
   CBaseModule.init(self)

   self.bar = CEGUI.toProgressBar(self.wnd:getChild("Bar"))
   self.textWnd = self.wnd:getChild("Text")
end

function CInteractProgressUI:setup(text, time)
   self.textWnd:setText(text .. "...")
   self:show(true)

   self.timer = runTimerExt(time * 0.05, self, self.interactProgressStep, time)
end

function CInteractProgressUI:interactProgressStep()
   if not self.timer then self:show(false) return end

   self.bar:setProgress(self.timer:getTimeDuration() / (self.timer:getTimeAmount() * 0.9))

   if self.timer:getTimeLeft() == 0 then
      self:show(false)
   end
end

function CInteractProgressUI:onShow()
   self.bar:setProgress(0)
   self:stopTimer()
end

function CInteractProgressUI:onHide()
   self:stopTimer()
end

function CInteractProgressUI:stopTimer()
   if self.timer then
      self.timer:stop()
      self.timer = nil
   end
end

return CInteractProgressUI
