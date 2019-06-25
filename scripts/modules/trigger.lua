local oo = require "loop.simple"
local _rootTrigger = (require "roots")._rootTrigger

---@class CTrigger : shTrigger
local CTrigger = oo.class({}, _rootTrigger)

function CTrigger:loadParameters()
   self.byPlayer = loadParam(self, "byPlayer", false)
   self.enabled  = loadParam(self, "enabled" , true)
end

function CTrigger:OnCreate()
   self.byPlayer = false
   self.enabled  = true
   self.chars    = {}
   self.charsAux = {}

   self:loadParameters()
end

function CTrigger:OnDestroy()
end

function CTrigger:OnEnter(char)
   if (self.byPlayer and char ~= getPlayer()) or (not self.byPlayer and char == getPlayer()) then
      return false
   end

   if self.enabled then
      self.chars[char] = true
      questSystem:fireEvent("trigger_in", self:getName(), self)
      return true
   else
      self.charsAux[char] = true
   end
   return false
end

function CTrigger:OnLeave(char)
   if (self.byPlayer and char ~= getPlayer()) or (not self.byPlayer and char == getPlayer()) then
      return false
   end

   if self.enabled then
      self.chars[char] = nil
      questSystem:fireEvent("trigger_out", self:getName(), self)
      return true
   else
      self.charsAux[char] = nil
   end
   return false
end

function CTrigger:enable()
   if self.enabled then
      return
   end

   self.enabled = true --Enable before calling OnEnter

   --OnEnter for every char inside
   for char in pairs(self.charsAux) do
      self:OnEnter(char)
   end

   self.charsAux = {}
end

function CTrigger:disable()
   if not self.enabled then
      return
   end

   --OnLeave for every char inside and move them in charsAux
   for char in pairs(self.chars) do
      self.charsAux[char] = true
      self:OnLeave(char)
   end

   self.enabled = false --Disable after calling OnLeave
end

function CTrigger:isEnabled()
   return self.enabled
end

function CTrigger:OnSaveState(state)
   state.enabled = self:isEnabled()
   state.chars = {}
   for char in pairs(self.chars) do
      if char:isManaged() then
         table.insert(state.chars, char:getName())
      end
   end

   state.charsAux = {}
   for char in pairs(self.charsAux) do
      if char:isManaged() then
         table.insert(state.charsAux, char:getName())
      end
   end
end

function CTrigger:OnLoadState(state)
   if state.enabled == true then
      self:enable()
   elseif state.enabled == false then
      self:disable()
   end

   if state.chars then
      for _, charName in pairs(state.chars) do
         local char = getObj(charName)
         if char then
            self.chars[char] = true
         end
      end
   end

   if state.charsAux then
      for _, charName in pairs(state.charsAux) do
         local char = getObj(charName)
         if char then
            self.charsAux[char] = true
         end
      end
   end
end

return {CTrigger=CTrigger}
