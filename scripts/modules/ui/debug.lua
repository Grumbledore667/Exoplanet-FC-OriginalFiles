local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CDebugUI : CBaseModule
local CDebugUI = oo.class({
   layoutName = "debug.layout",
   initAsInteractive = true,
   initPlayerControlled = true,
}, CBaseModule)

--Methods
function CDebugUI:init()
   CBaseModule.init(self)

   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("Save"), "MouseClick", partial(self.onSaveDebug, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("debugMode"), "MouseClick", partial(self.onDebugMode, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("godMode"), "MouseClick", partial(self.onDebugGodMode, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("godSpeed"), "MouseClick", partial(self.onDebugGodSpeed, self))
   local options = { "dialogSkip", "dialogDebug", "inventory", "keys", "fastLoot", "quest", "plants", }
   for _, option in pairs(options) do
      GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild(option), "MouseClick", partial(self.onDebugCheckbox, self))
   end
end

function CDebugUI:onShow()
   CBaseModule.onShow(self)

   self:setupDebugGui()
   runTimer(0, nil, function() getScene():pauseGame(true) end, false)
end

function CDebugUI:onHide()
   CBaseModule.onHide(self)

   getScene():pauseGame(false)
end

function CDebugUI:setupDebugGui()
   local debugMode, debugOptions = getDebugMode()
   self.wnd:getChild("debugMode"):setProperty("Selected", tostring(debugMode))
   self.wnd:getChild("godMode"):setProperty("Selected", tostring(getPlayer().god_mode))
   self.wnd:getChild("godSpeed"):setProperty("Selected", tostring(getPlayer().super_speed))
   for option, value in pairs(debugOptions) do
      local checkbox = self.wnd:getChild(option)
      if checkbox then
         checkbox:setProperty("Selected", tostring(value))
      end
   end
end


--Callbacks
function CDebugUI:onSaveDebug(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      gameplayUI:showInfoTextEx("Debug Options Saved", "major", "")
      saveDebug()
   end
end

function CDebugUI:onDebugMode(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local value = string.lower(click_args.window:getProperty("Selected")) == "true"
   setDebugMode(value)
   local options = { "dialogSkip", "dialogDebug", "inventory", "keys", "fastLoot", "quest", "plants", }
   for _, option in pairs(options) do
      self.wnd:getChild(option):setProperty("Disabled", tostring(not value))
   end
   gameplayUI:showInfoTextEx("Debug Mode set " .. tostring(value), "major", "")
end

function CDebugUI:onDebugGodMode(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local value = string.lower(click_args.window:getProperty("Selected")) == "true"
   getPlayer().god_mode = value
   gameplayUI:showInfoTextEx("God Mode set " .. tostring(value), "major", "")
end

function CDebugUI:onDebugGodSpeed(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local value = string.lower(click_args.window:getProperty("Selected")) == "true"
   getPlayer().super_speed = value
   gameplayUI:showInfoTextEx("Super Speed set " .. tostring(value), "major", "")
end

function CDebugUI:onDebugCheckbox(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local option = click_args.window:getName()
   local value = string.lower(click_args.window:getProperty("Selected")) == "true"
   setDebugMode(option, value)
   gameplayUI:showInfoTextEx(option .. " set " .. tostring(value), "major", "")
end

return CDebugUI
