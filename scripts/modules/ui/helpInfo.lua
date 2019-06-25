local oo = require "loop.simple"

local Template = (require "pl.text").Template
local i18n = require "i18n"
local orderedPairs = require "orderedPairs".orderedPairs

local CBaseModule = require "ui.baseModule"

---@class CHelpInfoUI : CBaseModule
local CHelpInfoUI = oo.class({
   layoutName = nil,
}, CBaseModule)

function CHelpInfoUI:init()
   self.wnd = CEGUI.WindowManager:getSingleton():loadLayoutFromFile("help.layout")
   gameplayUI.wndPause:addChild(self.wnd)

   CBaseModule.init(self)
end

function CHelpInfoUI:onShow()
   CBaseModule.onShow(self)

   self:updateHelpInfo()
end

function CHelpInfoUI:updateHelpInfo()
   local text = i18n"help_screen.keys"
   text = Template(text):safe_substitute(function(val)
      return getButtonCurrentKeyName(string.upper(val))
   end)

   local tips = {}
   local tipsKeys = i18n"loading_screen.tips_keys"
   local tipsRest = i18n"loading_screen.tips_rest"

   local function formatColoredKeybinds(tip)
      return Template(tip):safe_substitute(function(val)
         return string.format("[colour='ffffffff']%s[colour='ffcccccc']", getButtonCurrentKeyName(string.upper(val)))
      end)
   end
   for _, tip in orderedPairs(tipsKeys) do
      tip = formatColoredKeybinds(tip)
      tip = string.format("      •   %s", tip)
      table.insert(tips, tip)
   end
   for _, tip in orderedPairs(tipsRest) do
      tip = string.format("      •   %s", tip)
      table.insert(tips, tip)
   end

   text = text .. table.concat(tips, '\n')

   self.wnd:getChild("Text"):setText(text)
end

return CHelpInfoUI
