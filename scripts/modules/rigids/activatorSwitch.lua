local oo = require "loop.simple"
local CActivator = require "rigids.activator".CActivator

---@class CActivatorSwitch : CActivator
local CActivatorSwitch = oo.class({}, CActivator)

function CActivatorSwitch:OnCreate(params)
   CActivator.OnCreate(self, params)

   self.jammed = loadParam(self, "jammed", false)
end

function CActivatorSwitch:preActivate(char)
   if self.jammed then
      if self.activated then
         self:playAnimation("close_fail", false)
      else
         self:playAnimation("open_fail", false)
      end
      return
   end
   local prefabName = self:getPrefabName()
   if prefabName == "button_stone_1.sbg" or prefabName == "button_stone_2.sbg" or prefabName == "button_stone_3.sbg" then
      self:playAnimation("press_hard", false)
   elseif prefabName == "button_tech.sbg" then
      self:playAnimation("press_fist", false)
   else
      if self.activated then
         self:playAnimation("close", false)
      else
         self:playAnimation("open", false)
      end
   end
end

function CActivatorSwitch:activate(char)
   if self.jammed then return end

   if not self.activated then
      CActivator.activate(self, char)
   else
      CActivator.activateReverse(self, char)
   end
end

function CActivatorSwitch:getInteractData(char)
   local prefabName = self:getPrefabName()
   local data = CActivator.getInteractData(self, char)

   if prefabName == "lever_wall.sbg" then
      data.animations.activate = self.activated and "idle_lever_front_off" or "idle_lever_front_on"
      if self.jammed then
         data.animations.activate = data.animations.activate .. "_fail"
      end
   elseif prefabName == "lever_ground.sbg" then
      data.holster = true
      data.animations.activate = self.activated and "idle_lever_down_off" or "idle_lever_down_on"
      if self.jammed then
         data.animations.activate = data.animations.activate .. "_fail"
      end
   elseif prefabName == "button_tech.sbg" then
      data.animations.activate = "idle_button_press_fist"
   elseif prefabName == "button_stone_1.sbg" or prefabName == "button_stone_2.sbg" or prefabName == "button_stone_3.sbg" then
      data.animations.activate = "idle_button_press_hard"
   elseif prefabName == "abori_lock.sbg" then
      data.holster = true
      data.animations.activate = self.activated and "idle_abori_lock_close" or "idle_abori_lock_open"
   end
   return data
end

return {CActivatorSwitch=CActivatorSwitch}
