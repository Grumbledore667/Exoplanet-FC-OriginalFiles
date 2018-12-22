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
      self.chars[#self.chars+1] = char
      questSystem:fireEvent("trigger_in", self:getName(), self)
      return true
   else
      self.charsAux[#self.charsAux+1] = char
   end
   return false
end

function CTrigger:OnLeave(char)
   if (self.byPlayer and char ~= getPlayer()) or (not self.byPlayer and char == getPlayer()) then
      return false
   end

   if self.enabled then
      local new = {}
      for k,v in pairs(self.chars) do
         if v ~= char then
            table.insert(new, v)
         end
      end
      self.chars = new
      questSystem:fireEvent("trigger_out", self:getName(), self)
      return true
   else
      local new = {}
      for k,v in pairs(self.charsAux) do
         if v ~= char then
            table.insert(new, v)
         end
      end
      self.charsAux = new
   end
   return false
end

function CTrigger:enable()
   if self.enabled then
      return
   end

   self.enabled = true

   for i=1,#self.charsAux do
      self:OnEnter(self.charsAux[i])
   end

   self.charsAux = {}
end

function CTrigger:disable()
   if not self.enabled then
      return
   end

   for i=1,#self.chars do
      self.charsAux[#self.charsAux+1] = self.chars[i]
   end

   for i=1,#self.charsAux do
      self:OnLeave(self.charsAux[i])
   end

   self.enabled = false
end

function CTrigger:isEnabled()
   return self.enabled
end

function CTrigger:OnSaveState(state)
   state.enabled = self:isEnabled()
   local chars = {}
   for k,v in pairs(self.chars) do
      if v:isManaged() then
         chars[v:getName()] = true
      end
   end
   state.chars = {}
   for k,v in pairs(chars) do
      table.insert(state.chars, k)
   end

   local charsAux = {}
   for k,v in pairs(self.charsAux) do
      if v:isManaged() then
         charsAux[v:getName()] = true
      end
   end
   state.charsAux = {}
   for k,v in pairs(charsAux) do
      table.insert(state.charsAux, k)
   end
end

function CTrigger:OnLoadState(state)
   if state.enabled == true then
      self:enable()
   elseif state.enabled == false then
      self:disable()
   end

   if state.chars then
      for k,v in pairs(state.chars) do
         if not inList(self.chars, getObj(v)) then
            table.insert(self.chars, getObj(v))
         end
      end
   end

   if state.charsAux then
      for k,v in pairs(state.charsAux) do
         if not inList(self.charsAux, getObj(v)) then
            table.insert(self.charsAux, getObj(v))
         end
      end
   end
end

return {CTrigger=CTrigger}
