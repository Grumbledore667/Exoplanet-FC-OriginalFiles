local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CBillboardUI : CBaseModule
local CBillboardUI = oo.class({
   layoutName = "billboard.layout",
}, CBaseModule)

--Methods
function CBillboardUI:init()
   CBaseModule.init(self)

   self.title = self.wnd:getChild("Title")
   self.contents = self.wnd:getChild("Contents")
   self.contentsBack = self.wnd:getChild("ContentsBack")
end

function CBillboardUI:setup(title, text, time)
   if not self.title then return end

   self.contents:setText(text or "")

   self.title:setText(title)

   --Set size to max so word wrapping children could extend if they need
   self.wnd:setSize(self.wnd:getMaxSize())

   --Set width to the max between children as the layout is vertical
   GUIUtils.adjustWindowWidthForMaxTextChild(self.wnd, getScreenSize().y * 0.05, self.title, self.contents)

   --Set height according to the pixel extent of the children
   GUIUtils.adjustWindowHeightForTextChildren(self.wnd, 0, self.title, self.contents)

   --Set height of the children in relative scale and position them properly
   GUIUtils.adjustWindowHeightToVertExtent(self.title)
   GUIUtils.adjustWindowHeightToVertExtent(self.contents)
   GUIUtils.positionWindowRelativeTo(self.contents, self.title, "bottom")
   GUIUtils.positionWindowRelativeTo(self.contentsBack, self.title, "bottom")

   if self.hideTimer then
      self.hideTimer:stop()
   end
   if time and time ~= 0 then
      self.hideTimer = runTimer(time, false, partial(self.show, self), false)
   end
   self:show(true)
end

return CBillboardUI
