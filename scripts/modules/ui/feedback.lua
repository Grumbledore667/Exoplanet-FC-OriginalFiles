local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CFeedbackUI : CBaseModule
local CFeedbackUI = oo.class({
   layoutName = "feedback.layout",
   initAsInteractive = true,
   initPlayerControlled = true,
}, CBaseModule)

--Methods
function CFeedbackUI:init()
   CBaseModule.init(self)

   self.editbox = CEGUI.toEditbox(self.wnd:getChild("Editbox"))
   self.emailEditbox = CEGUI.toEditbox(self.wnd:getChild("EmailEditbox"))
   self.charCountLabel = self.wnd:getChild("CharCountLabel")
   self.submitButton = self.wnd:getChild("SubmitButton")
   GUIUtils.widgetSubscribeEventProtected(self.editbox, "TextChanged", partial(self.updateCharCount, self))

   self.tagCheckboxes = {self.wnd:getChild("GeneralCheckbox"), self.wnd:getChild("BugCheckbox"), self.wnd:getChild("FramerateCheckbox")}
   self.rateButtons = {self.wnd:getChild("VeryBadButton"), self.wnd:getChild("BadButton"), self.wnd:getChild("GoodButton"), self.wnd:getChild("VeryGoodButton")}
   for _, radioButton in ipairs(self.rateButtons) do
      GUIUtils.widgetSubscribeEventProtected(radioButton, "Clicked", partial(self.onSubmitClicked, self))
   end
end

function CFeedbackUI:onShow()
   CBaseModule.onShow(self)

   getScene():pauseGame(true)
   self:setup()
end

function CFeedbackUI:onHide()
   CBaseModule.onHide(self)

   getScene():pauseGame(false)
end

function CFeedbackUI:setup()
   self.editbox:setText("")
   self:updateCharCount()
end

function CFeedbackUI:editBoxHasFocus()
   return self.editbox:hasInputFocus() or self.emailEditbox:hasInputFocus()
end

function CFeedbackUI:updateCharCount()
   --Because simple string.len counts bytes, and not exactly characters, which does not work for russian and etc
   local processedText = GUIUtils.UTF8ToCharArray(self.editbox:getText())
   local count = string.format("%d/200", #processedText - 1)
   self.charCountLabel:setText(count)
end

local ratings = {
   ["very good"] = "vg",
   ["good"] = "g",
   ["bad"] = "b",
   ["very bad"] = "vb",
}

--Callbacks
function CFeedbackUI:onSubmitClicked(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local text = self.editbox:getText()

   local email = self.emailEditbox:getText()
   if email ~= "" then
      email = string.format("[mail:%s]\n", email)
   end

   local info = ""
   for _, checkbox in ipairs(self.tagCheckboxes) do
      if checkbox:getProperty("Selected") == "true" then
         info = info .. string.format("[tag:%s]\n", string.lower(checkbox:getText()))
      end
   end
   local ratindStr = ratings[string.lower(click_args.window:getText())]
   info = info .. string.format("[rating:%s]", ratindStr)

   --Add position
   local player = getMC()
   if player then
      local pos = player:getPose():getPos()
      info = info .. string.format("\n[position:x=%d, y=%d, z=%d]", pos.x, pos.y, pos.z)
   end

   text = string.format("%s%s%s", text, email, info)

   self:show(false)
   log("FeedbackUI: report has been triggered")
   log(text)
   runTimer(0.05, nil, function()
      getScene():setReportDescription(text)
      getScene():sendReport()
   end, false)
end

return CFeedbackUI
