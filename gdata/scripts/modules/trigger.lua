local oo = require "loop.simple"

local CTrigger = oo.class({})

function CTrigger:loadParameters()
   self.byPlayer = loadParam( self, "byPlayer", false )
   self.enabled  = loadParam( self, "enabled" , true )
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

function CTrigger:OnEnter( char )
   if ( self.byPlayer and char ~= getPlayer() ) or ( not self.byPlayer and char == getPlayer() ) then
      return
   end

   if ( self.enabled ) then
      self.chars[#self.chars+1] = char
      questSystem:fireEvent("trigger_in", self:getName(), self)
   else
      self.charsAux[#self.charsAux+1] = char
   end
end

function CTrigger:OnLeave( char )
   if ( self.enabled ) then
      local new = {}
      for k,v in pairs(self.chars) do
         if v ~= char then
            table.insert(new, v)
         end
      end
      self.chars = new
      questSystem:fireEvent("trigger_out", self:getName(), self)
   else
      local new = {}
      for k,v in pairs(self.charsAux) do
         if v ~= char then
            table.insert(new, v)
         end
      end
      self.charsAux = new
   end
end

function CTrigger:enable()
   if ( self.enabled ) then
      return
   end

   self.enabled = true

   for i=1,#self.charsAux do
      self:OnEnter( self.charsAux[i] )
   end

   self.charsAux = {}
end

function CTrigger:disable()
   if ( not self.enabled ) then
      return
   end

   for i=1,#self.chars do
      self.charsAux[#self.charsAux+1] = self.chars[i]
   end

   for i=1,#self.charsAux do
      self:OnLeave( self.charsAux[i] )
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
      chars[v:getName()] = true
   end
   state.chars = {}
   for k,v in pairs(chars) do
      table.insert(state.chars, k)
   end

   local charsAux = {}
   for k,v in pairs(self.charsAux) do
      charsAux[v:getName()] = true
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
