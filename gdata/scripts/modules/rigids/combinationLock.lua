local oo = require "loop.simple"
local CDoor = (require "rigids.door").CDoor

local tablex = require "pl.tablex"

local CCombinationLock = oo.class({unlocked=false}, CDoor)

function CCombinationLock:OnCreate()
   CDoor.OnCreate(self)
   self.code = loadParam(self, "code", "0000")
   self.lockObject = loadParamObjects(self, "lockObjectName", "")[1]
   if self.lockObject then
      local prefab = self.lockObject:getPrefabName()
      if tablex.find({"electronic_lock.sbg", "electronic_lock_stand.sbg"}, prefab) == nil then
         log("WARNING: Lock object of " .. self:getName() .. " has a wrong prefab")
         self.lockObject = nil
      else
         local o = self.lockObject
         local open, locked = o:getMeshByName("open"), o:getMeshByName("locked")
         if open == nil or locked == nil then
            log("WARNING: specified prefab in " .. o:getName() .. " doesn't have submesh 'open' or 'locked'")
            self.lockObject = nil
         end
      end
      self:show_lock_meshes()
   else
      log("WARNING: Lock object of " .. self:getName() .. " des not exist")
   end
end

function CCombinationLock:show_lock_meshes()
   if not self.lockObject then return end
   if self.unlocked then
      self.lockObject:getMeshByName("open"):setVisible(true)
      self.lockObject:getMeshByName("locked"):setVisible(false)
   else
      self.lockObject:getMeshByName("open"):setVisible(false)
      self.lockObject:getMeshByName("locked"):setVisible(true)
   end
end

function CCombinationLock:startTalk( char )
   self.talkChar = char
   gameplayUI:showCombLock( true )
   return true
end

function CCombinationLock:stopTalk( char )
   self.talkChar = nil
end

function CCombinationLock:tryCode( strCode )
   if self.code == strCode then
      questSystem:fireEvent( "code_accepted", self:getName(), self )
      self.unlocked = true
      self.talkChar:stopTalk( self )
      gameplayUI:showCombLock( false )
      gameplayUI:showInfoTextEx( "Access granted. Unlocking", "minor", "" )
      self:show_lock_meshes()
   else
      questSystem:fireEvent( "code_denied", self:getName(), self )
      gameplayUI:showInfoTextEx( "Access denied", "minor", "" )
   end
end

function CCombinationLock:getType()
   return self.unlocked and "activator"  or "talker"
end

function CCombinationLock:getLabel()
   return self.unlocked and "Combination Unlocked Door" or "Combination Locked Door"
end

function CCombinationLock:OnSaveState(state)
   CDoor.OnSaveState(self, state)
   state.unlocked = self.unlocked
end

function CCombinationLock:OnLoadState(state)
   CDoor.OnLoadState(self, state)
   self.unlocked = state.unlocked
   self:show_lock_meshes()
end

return {CCombinationLock=CCombinationLock}
