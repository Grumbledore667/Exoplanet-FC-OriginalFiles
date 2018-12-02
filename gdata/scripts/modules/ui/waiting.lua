local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local SkySystem  = (require "environment.sky").SkySystem
local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CWaitingUI : CBaseModule
local CWaitingUI = oo.class({
   layoutName = "waiting.layout",
   initAsInteractive = true,
   initPlayerControlled = true,
}, CBaseModule)

--Methods
function CWaitingUI:init()
   CBaseModule.init(self)

   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("morning"  ), "MouseClick", partial(self.onWaitStart, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("afternoon"), "MouseClick", partial(self.onWaitStart, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("night"    ), "MouseClick", partial(self.onWaitStart, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("midnight" ), "MouseClick", partial(self.onWaitStart, self))
end

function CWaitingUI:onShow()
   CBaseModule.onShow(self)

   gameplayUI.mapUI:show(false)
end

function CWaitingUI:onHide()
   CBaseModule.onHide(self)

   local player = getMC()
   if player:getState("sleepAtBed") and not player:getState("sleeping") and player.bedObject then
      player.bedObject:deactivate(player)
   end
end

function CWaitingUI:isWaitingMode()
   return self.waitMode
end

function CWaitingUI:onWaitStart(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local dayState = click_args.window:getName()
   log("Start Wait " .. dayState)
   local hoursToSkip = SkySystem:getTimeLeftToDayState(dayState)
   local player = getMC()
   player:onSleepStart()
   gameplayUI:startFadeToBlackSequence(1, 1, 1, {
      onPause = {["func"] = partial(SkySystem.fastForwardTime, SkySystem), ["args"] = {hoursToSkip}},
      onFadeOutEnd = {["func"] = partial(player.onSleepStop, player)}
   })
end

return CWaitingUI
