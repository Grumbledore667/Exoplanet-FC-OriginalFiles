local oo = require "loop.simple"

local animMgr
local tablex = require "pl.tablex"
local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CDamageIndicatorUI : CBaseModule
local CDamageIndicatorUI = oo.class({
   initVisible = true,
   impactor = nil,
   attackPos = nil,
   ID = 0,
   image = "damage_indicator.png",
}, CBaseModule)

--Methods
function CDamageIndicatorUI:init()
   animMgr = CEGUI.AnimationManager:getSingleton()

   self.wnd = gameplayUI.hudUI.damageIndicatorLayout:clone()
   self.wnd:setName(self.windowName)
   gameplayUI.wndGameplay:addChild(self.wnd)

   CBaseModule.init(self)

   self.imageWindow = self.wnd:getChild("Image")
   self.imageWindow:setProperty("Image", self.image)

   self.attackPos = tablex.copy(self.impactor:getPose():getPos())
   self.attackPos.y = 0

   self.fadeInInstance = GUIUtils.fadeInWindow(self.imageWindow, 0.15, function()
      self.fadeInInstance = nil
   end)
   self:update()
   self.updateTimer = runTimer(0, self, self.update, true)
   self.destroyTimer = runTimer(2, nil, function()
      self.fadeOutInstance = GUIUtils.fadeOutWindow(self.imageWindow, 1, function()
         self.fadeOutInstance = nil
         self:destroy()
      end)
   end, false)
end

function CDamageIndicatorUI:update()
   local player = getPlayer()
   local playerPos = player:getPose():getPos()
   playerPos.y = 0
   local attackDir = vec3Normalize(vec3Sub(playerPos, self.attackPos))
   local cameraDir = player:getCamera():getDir()
   cameraDir.y = 0

   --Rotate the image container accordingly
   local quat = quatFromDirs(cameraDir, attackDir)
   self.wnd:setProperty("Rotation", "w:" .. quat.y .. " x:0 y:0 z:" .. quat.w)
end

function CDamageIndicatorUI:destroy()
   if self.fadeInInstance then
      animMgr:destroyAnimationInstance(self.fadeInInstance)
   end
   if self.fadeOutInstance then
      animMgr:destroyAnimationInstance(self.fadeOutInstance)
   end

   self.updateTimer:stop()
   self.destroyTimer:stop()
   CEGUI.WindowManager:getSingleton():destroyWindow(self.wnd)
   gameplayUI.hudUI.damageIndicatorInstances[self] = nil
end

return CDamageIndicatorUI
