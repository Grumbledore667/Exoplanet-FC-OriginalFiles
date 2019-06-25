local GUIUtils = require "ui.utils"

local api = {
   elements = {
      playerStatus = {timer = nil, showCondition = nil, wnd = nil, animation = nil, visibility = true},
      enemyStatus  = {timer = nil, showCondition = nil, wnd = nil, animation = nil, visibility = true},
      weapon       = {timer = nil, showCondition = nil, wnd = nil, animation = nil, visibility = true},
   }
}

local HIDE_DELAY = 5

function api.init()
   api.elements.playerStatus.wnd = gameplayUI.hudUI.status.wnd
   api.elements.enemyStatus.wnd = gameplayUI.hudUI.enemyStatus.wnd
   api.elements.weapon.wnd = gameplayUI.hudUI.weapon.wnd
   getScene():subscribeOnLocationEnter(api.onOptionUpdate)
end

--Mandatory immersification during cutscenes, talking and etc
function api.showGameplayUI(state)
   if state then
      gameplayUI.hudUI.aim.wnd:setVisible(true)
      gameplayUI.hotbarUI:show(true)
      --Update special elements - the ones that might need to be shown again
      for name in pairs(api.elements) do
         if api.elements[name].showCondition then
            api.triggerUI(name)
         end
      end
   else
      gameplayUI:closeUI({[gameplayUI.dialogUI.wnd] = true})
      for name in pairs(api.elements) do
         if api.elements[name].timer then
            api.elements[name].timer:stop()
            api.elements[name].timer = nil
         end
         if api.elements[name].animation then
            api.elements[name].animation:stop()
         end
         api.elements[name].wnd:setVisible(false)
         api.elements[name].visibility = false
      end
      gameplayUI.hudUI.aim.wnd:setVisible(false)
      gameplayUI.hotbarUI:show(false)
   end
end

function api.elements.playerStatus.showCondition()
   local player = getPlayer()
   return player:getStatPercent("health") ~= 100 or player:getStatPercent("stamina") ~= 100 or player:getStatPercent("energy") ~= 100
end

function api.triggerUI(name)
   if not getGameOption("immersiveUI") or getGlobalParam("inScene") or not getPlayer() or getPlayer():getState("talk") then return end
   --The action for special elements is decided upon the condition
   if api.elements[name].showCondition then
      if api.elements[name].showCondition() then
         api.immersiveUIShow(name)
      else
         api.immersiveUIDelayedHide(name, HIDE_DELAY)
      end
   else --Simple elements are shown upon trigger and later hidden with delay
      api.immersiveUIShow(name)
      api.immersiveUIDelayedHide(name, HIDE_DELAY)
   end
end

function api.immersiveUIShow(name)
   if api.elements[name].timer then
      api.elements[name].timer:stop()
      api.elements[name].timer = nil
   end
   if not api.elements[name].visibility then
      if api.elements[name].animation then
         api.elements[name].animation:stop()
      end
      api.elements[name].animation = GUIUtils.fadeInWindow(api.elements[name].wnd, 0.1, function() api.elements[name].animation = nil end)
      api.elements[name].visibility = true
   end
end

function api.immersiveUIDelayedHide(name, delay)
   if not api.elements[name].timer then
      api.elements[name].timer = runTimer(delay, nil, function()
         if api.elements[name].visibility then
            if api.elements[name].animation then
               api.elements[name].animation:stop()
            end
            api.elements[name].animation = GUIUtils.fadeOutWindow(api.elements[name].wnd, 1, function() api.elements[name].animation = nil end)
            api.elements[name].visibility = false
         end
      end, false)
   end
end

function api.onOptionUpdate()
   if getGameOption("immersiveUI") then
      api.triggerUI("playerStatus")
      api.triggerUI("weapon")
   else
      api.immersiveUIShow("playerStatus")
      api.immersiveUIShow("weapon")
   end
end

return api
