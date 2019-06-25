local oo = require "loop.simple"
local CInteractable = require "mixins.interactable"
local ItemsData = require "itemsData"

local CLockable = oo.class({locked = false}, CInteractable)

function CLockable:OnCreate(params)
   params = params or {}
   CInteractable.OnCreate(self)
   self.code = params.code or loadParam(self, "code", nil) or nil
   self.keyItems = loadParamStrings(self, "keyItems", {})
   if #self.keyItems > 0 or (type(self.code) == "string" and self.code ~= "") then
      self:setLockState(true)
   else
      self:setLockState(false)
   end
end

function CLockable:setLockState(state)
   self.locked = state
   self:updateLockMeshes()
end

function CLockable:setCode(strCode)
   if type(strCode) == "string" and strCode ~= "" then
      self.code = strCode
      self:setLockState(true)
   else
      self:setLockState(false)
   end
end

function CLockable:tryCode(strCode, silent)
   if self.code == strCode then
      self:setLockState(false)
      if not silent then
         gameplayUI:showInfoTextEx("Access granted", "minor", "")
         questSystem:fireEvent("code_accepted", self:getName(), strCode)
      end
   else
      if not silent then
         gameplayUI:showInfoTextEx("Access denied", "minor", "")
         questSystem:fireEvent("code_denied", self:getName(), strCode)
      end
   end
   return not self:isLocked()
end

function CLockable:updateLockMeshes()
   local meshOpen = self:getMeshByName("open")
   local meshLocked = self:getMeshByName("locked")
   if meshOpen then
      meshOpen:setVisible(not self:isLocked())
   end
   if meshLocked then
      meshLocked:setVisible(self:isLocked())
   end
end

function CLockable:characterHasKey(char)
   for _,itemName in ipairs(self.keyItems) do
      if hasObjItem(itemName, char) then return itemName end
   end
   return false
end

function CLockable:isLocked()
   return self.locked
end

function CLockable:getLabel()
   local label = ""
   if self:isLocked() then
      label = "Locked " .. label
   end
   return label
end

function CLockable:getInteractLabel(char)
   local label = ""
   if self:isLocked() then
      label = "enter code"
   end
   return label
end

function CLockable:getInteractType(char)
   return "lockable"
end

function CLockable:isInteractionLingering(char)
   if self.code then
      return true
   end
   return false
end

function CLockable:OnSaveState(state)
   state.locked = self:isLocked()
end

function CLockable:OnLoadState(state)
   self:setLockState(state.locked)
end

return CLockable
