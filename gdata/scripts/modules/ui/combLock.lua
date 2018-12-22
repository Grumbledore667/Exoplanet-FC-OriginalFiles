local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CCombLockUI : CBaseModule
local CCombLockUI = oo.class({
   layoutName = "gameplay/combLock.layout",
   initAsInteractive = true,
   initPlayerControlled = true,
}, CBaseModule)

--Methods
function CCombLockUI:init()
   CBaseModule.init(self)

   self.editbox = self.wnd:getChild("Tab/Editbox")
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("Apply"), "MouseClick", partial(self.onCombLockApply, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("Cancel"), "MouseClick", partial(self.onCombLockCancel, self))

   for i=0,9 do
      GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("Tab/"..i), "MouseClick", partial(self.onCombLockButtonClick, self))
   end

   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("Tab/Backspace"), "MouseClick", partial(self.onCombLockBackspace, self))
end

function CCombLockUI:onShow()
   CBaseModule.onShow(self)

   self.editbox:setText("")
end

function CCombLockUI:onHide()
   CBaseModule.onHide(self)

   if getPlayer().interactTarget then
      getPlayer().interactTarget:deactivate(getPlayer())
   end
end

--Callbacks
function CCombLockUI:onCombLockBackspace(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      local str = self.editbox:getText()
      self.editbox:setText(string.sub(str,1,str:len()-1))
   end
end

function CCombLockUI:onCombLockButtonClick(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      local str = self.editbox:getText()
      if str:len() < 4 then
         self.editbox:setText(str .. click_args.window:getText())
      end
   end
end

function CCombLockUI:onCombLockApply(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      getPlayer().interactTarget:tryCode(self.editbox:getText())
   end
end

function CCombLockUI:onCombLockCancel(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      self:show(false)
   end
end

return CCombLockUI