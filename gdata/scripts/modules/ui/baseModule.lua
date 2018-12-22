local oo = require "loop.simple"

local wndMgr
local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"

---@class CBaseModule
local CBaseModule = oo.class({
   layoutName = nil,
   wnd = nil,
   windowName = nil,
   initPlayerControlled = false,
   initAsInteractive = false,
   initVisible = false,
   initParent = nil,
})

function CBaseModule:init()
   wndMgr = CEGUI.WindowManager:getSingleton()

   if self.layoutName then
      self.wnd = wndMgr:loadLayoutFromFile(self.layoutName)
      if self.windowName then
         self.wnd:setName(self.windowName)
      end
      self.initParent = self.initParent or gameplayUI.wndGameplay
      self.initParent:addChild(self.wnd)
   end
   self.wnd:setVisible(self.initVisible)

   GUIUtils.widgetSubscribeEventProtected(self.wnd, "Shown", partial(self.onShow, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd, "Hidden", partial(self.onHide, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd, "CloseClicked", partial(self.onClose, self))
   if self.initAsInteractive then GUIUtils.setWindowInteractive(self.wnd, true, self.initPlayerControlled) end
end

function CBaseModule:isVisible()
   return self.wnd and self.wnd:isVisible()
end

function CBaseModule:show(state)
   self.wnd:setVisible(state)
   return true
end

--Fired right after setVisible via subscription
function CBaseModule:onShow()
   if GUIUtils.isWindowInteractive(self.wnd) then
      gameplayUI:setCursorVisible(true)
      self.wnd:activate()
   end
end

function CBaseModule:onHide()
   if GUIUtils.isWindowInteractive(self.wnd) then
      gameplayUI:onInteractiveWindowHide()
   end
end

function CBaseModule:onClose()
   self:show(false)
end

function CBaseModule:setup()
end

return CBaseModule
