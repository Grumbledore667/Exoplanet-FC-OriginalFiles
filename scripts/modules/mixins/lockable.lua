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

function CLockable:activate(obj)
   if self:isLocked() then
      local characterHasKey = self:characterHasKey(obj)
      if characterHasKey then
         gameplayUI:showInfoTextEx("Opened with " .. ItemsData.getItemLabel(characterHasKey), "minor", "")
         self:setLockState(false)
         return true
      elseif self.lockObject then
         gameplayUI:showInfoTextEx("Remotely locked", "minor", "")
         return false
      elseif self.code then
         --Save obj.interactTarget from interactStop
         runTimer(0, nil, function()
            if obj then obj.interactTarget = self end
         end, false)
         gameplayUI.combLockUI:show(true)
      else
         gameplayUI:showInfoTextEx("Locked", "minor", "")
         return false
      end
      self.activated = true
      self.interactTarget = obj
   end
   return true
end

function CLockable:deactivate(obj)
   if self:isLocked() then
      self.activated = false
      self.interactTarget = nil
      if obj then obj.interactTarget = nil end
      gameplayUI.combLockUI:show(false)
   end
   return true
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
   local activator = self.interactTarget
   if self.code == strCode then
      self:deactivate(activator)
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

function CLockable:getInteractLabel()
   local label = ""
   if self:isLocked() then
      label = "enter code"
   end
   return label
end

function CLockable:OnSaveState(state)
   state.locked = self:isLocked()
end

function CLockable:OnLoadState(state)
   self:setLockState(state.locked)
end

return CLockable
