local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"

local SkySystem = (require "environment.sky").SkySystem

local CBaseModule = require "ui.baseModule"

---@class CSubtitlesUI : CBaseModule
local CSubtitlesUI = oo.class({
   layoutName = "gameplay/subtitles.layout",
}, CBaseModule)

--Methods
function CSubtitlesUI:init()
   CBaseModule.init(self)

   self.textWnd = self.wnd:getChild("Text")
   self.taskList = {}
   self.originalYPosScale = self.wnd:getYPosition().scale
end

function CSubtitlesUI:addSubtitle(text, duration, obj, forced)
   if not text or not duration then return end

   local task = { text = text, duration = duration }
   if obj then
      task.text = obj:getLabel() .. ": " .. text
   end
   for _, taskTable in pairs(self.taskList) do
      if taskTable.text == task.text then
         return --Do not stack similar subs
      end
   end
   if forced then
      self.taskList = {}
      self:show(false)
   end

   table.insert(self.taskList, task)
   self:show(true)
end

function CSubtitlesUI:onShow()
   self.wnd:setSize(self.wnd:getMaxSize())

   self.textWnd:setText(self.taskList[1].text)

   self.wnd:setWidth(self.wnd:getMaxSize().width)
   local pixelPadding = getScreenSize().y * 0.01
   GUIUtils.adjustWindowWidthForTextChildren(self.wnd, pixelPadding, self.textWnd)
   GUIUtils.adjustWindowHeightForTextChildren(self.wnd, pixelPadding, self.textWnd)

   self.subTimer = runTimer(self.taskList[1].duration, false, partial(self.show, self), false)
   self.subCallback = SkySystem:subscribeFastForwardTime(partial(self.onFastForwardTime, self))
end

function CSubtitlesUI:onHide()
   if self.subTimer then self.subTimer:stop() end
   self.subTimer = nil
   table.remove(self.taskList, 1)
   if #self.taskList > 0 then
      self:show(true)
   else
      SkySystem:unsubscribeFastForwardTime(self.subCallback)
   end
end

function CSubtitlesUI:onDialogStart()
    --since "VerticalAlignment" "Bottom" is enabled for subtitles
   local yPosScale = -(1 - gameplayUI.dialogUI.wnd:getChild("BottomLine"):getYPosition().scale)
   self.wnd:setYPosition(CEGUI.UDim(yPosScale, -10))
end

function CSubtitlesUI:onDialogEnd()
   self.wnd:setYPosition(CEGUI.UDim(self.originalYPosScale, 0))
end

function CSubtitlesUI:onFastForwardTime(event, ...)
   self.taskList = {}
   self:show(false)
end

return CSubtitlesUI
