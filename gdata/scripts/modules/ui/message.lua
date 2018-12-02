local oo = require "loop.simple"

local GUIUtils = require "ui.utils"

local ItemsData = require "itemsData"

local CBaseModule = require "ui.baseModule"

---@class CMessageUI : CBaseModule
local CMessageUI = oo.class({
   layoutName = "message.layout",
   initAsInteractive = true,
   initPlayerControlled = true,
}, CBaseModule)


--Methods
function CMessageUI:init()
   CBaseModule.init(self)
   self.textWnd = self.wnd:getChild("Contents")
end

function CMessageUI:showItem(state, itemName)
   self:show(state)

   if state and itemName then
      local message = ItemsData.getItemMessage(itemName)

      if message.eng.title and message.eng.title ~= "" then
         self.wnd:setText(message.eng.title)
      else
         self.wnd:setText("Message")
      end
      self.textWnd:setText(message.eng.contents)
      GUIUtils.adjustWindowHeightForTextChildren(self.wnd, getScreenSize().y * 0.04, self.textWnd)
   end
end

function CMessageUI:showText(state, title, text)
   self:show(state)

   if title and title ~= "" then
      self.wnd:setText(title)
   else
      self.wnd:setText("Message")
   end
   self.textWnd:setText(text)
   GUIUtils.adjustWindowHeightForTextChildren(self.wnd, getScreenSize().y * 0.04, self.textWnd)
end

return CMessageUI
