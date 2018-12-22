local oo = require "loop.simple"
local _rootRigid = (require "roots")._rootRigid
local TerminalUI = require "ui.terminal"
local GUIUtils = require "ui.utils"

local terminalsActiveCount = 0

---@class CTerminal : shRigidEntity
local CTerminal = oo.class({}, _rootRigid)

function CTerminal:OnCreate()
   self.interactorRaycast = self:createAspect("interactor")
   self.interactorRaycast:setObject(self)
   self.interactorRaycast:setRaycastRadius(200.0)
   self.interactorRaycast:getPose():setParent(self:getPose())
   self.interactorRaycast:getPose():resetLocalPose()
   self.interactorRaycast:getPose():setLocalPos({x=0,y=150,z=-100})
   self.interactorRaycast:setRaycastActive(true)

   self.interactorTrigger = self:createAspect("interactor")
   self.interactorTrigger:setObject(self)
   self.interactorTrigger:setTriggerRadius(300.0)
   self.interactorTrigger:getPose():setParent(self:getPose())
   self.interactorTrigger:getPose():resetLocalPose()
   self.interactorTrigger:getPose():setLocalPos({x=0,y=0,z=-100})
   self.interactorTrigger:setTriggerActive(true)

   self.sounds = {}

   self.activated = false

   self:setMaterials("hologram_animated")
end

function CTerminal:OnDestroy()
end

function CTerminal:OnInteractTriggerBegin(obj)
   if self.menuTimer then
      return
   end

   if self.saverTimer then
      self.saverTimer:stop()
      self.saverTimer = nil
      return
   end

   self.menuTimer = runTimer(0.1, self, self.showMenu, false)
end

function CTerminal:OnInteractTriggerEnd(obj)
   self:deactivate()
   if self.saverTimer then
      return
   end

   if self.menuTimer then
      self.menuTimer:stop()
      self.menuTimer = nil
      return
   end

   self.saverTimer = runTimer(4.0, self, self.showSaver, false)
end

function CTerminal:isActivated()
   return self.activated
end

function CTerminal:activate(obj)
   if self.menuTimer or self.activated then
      return false
   end

   terminalsActiveCount = terminalsActiveCount + 1
   gameplayUI.terminal.activeTerminal = self

   TerminalUI.showCursor()
   gameplayUI:setCursorVisible(false)
   blockUserControl()
   resetCursorPos()

   self.activated = true
   return true
end

function CTerminal:deactivate(obj)
   if not self.activated then
      return false
   end

   terminalsActiveCount = terminalsActiveCount - 1

   if TerminalUI.isCursorVisible() and terminalsActiveCount == 0 then
      TerminalUI.hideCursor()
      if GUIUtils.interactiveWindowsVisible() then
         gameplayUI:setCursorVisible(true)
      else
         returnUserControl()
      end
      gameplayUI.terminal.activeTerminal = nil
   end

   self.activated = false
   return true
end

function CTerminal:showSaver()
   if self.activated then
      self:deactivate(getPlayer())
   end
   if terminalsActiveCount == 0 then
      TerminalUI.hideMenu()
   end
   self:setTexture(0, "")
   self:setMaterials("hologram_animated")
   self.saverTimer = nil
end

function CTerminal:showMenu()
   TerminalUI.showInitTab()
   self:setTexture(0, "terminal.gui")
   self:setMaterials("hologram")
   self.menuTimer = nil

   if not self.sounds.welcome then
      self.sounds.welcome = self:createAspect("term_welcome.wav")
      self.sounds.welcome:setPose(self:getPose())
      self.sounds.welcome:setLoop(false)
   end

   self.sounds.welcome:play()
end

function CTerminal:clickElement()
   if not self.sounds.click then
      self.sounds.click = self:createAspect("term_click.wav")
      self.sounds.click:setPose(self:getPose())
      self.sounds.click:setLoop(false)
   end

   self.sounds.click:play()
end

function CTerminal:acceptElement()
   if not self.sounds.accept then
      self.sounds.accept = self:createAspect("term_accept.wav")
      self.sounds.accept:setPose(self:getPose())
      self.sounds.accept:setLoop(false)
   end

   self.sounds.accept:play()
end

function CTerminal:denyElement()
   if not self.sounds.denied then
      self.sounds.denied = self:createAspect("term_denied.wav")
      self.sounds.denied:setPose(self:getPose())
      self.sounds.denied:setLoop(false)
   end

   self.sounds.denied:play()
end

function CTerminal:getType()
   return "activator"
end

function CTerminal:getLabel()
   return "BHT Terminal"
end

function CTerminal:getLabelPos()
   local pos = self:getPose():getPos()
   pos.y = pos.y + 300
   return pos
end

function CTerminal:getInteractLabel()
   return "use"
end

return {CTerminal=CTerminal}
