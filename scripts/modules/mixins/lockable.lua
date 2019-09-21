local oo = require "loop.simple"
local CInteractable = require "mixins.interactable"
local ItemsData = require "itemsData"

local CLockable = oo.class({locked = false}, CInteractable)

local LOCK_HP_BY_LEVELS = {
   [1] = 25,
   [2] = 50,
   [3] = 75,
   [4] = 100,
   [5] = 150
}

function CLockable:OnCreate(params)
   params = params or {}
   CInteractable.OnCreate(self)
   self.lockType = loadParam(self, "lockType", "unlocked")
   self.lockLevel = loadParam(self, "lockLevel", 1)
   self.code = params.code or loadParam(self, "code", nil)
   self.keyItems = loadParamStrings(self, "keyItems", {})
   if self.lockType ~= "unlocked" or self.code then
      self:setLockState(true)
   else
      self:setLockState(false)
   end

   --Only allow key or quest items in keyItems param
   for _, itemName in ipairs(self.keyItems) do
      if not ItemsData.isItemKey(itemName) and not ItemsData.isItemQuestItem(itemName) then
         log(string.format("ERROR: lockable object '%s' has bad a keyItem '%s' (only keys and quest items allowed)", self:getName(), itemName))
      end
   end
end

function CLockable:setLockState(state)
   self.locked = state
   self:updateLockMeshes()
   if state then
      self.lockPoints = self:getLockInitialPoints()
   end
end

function CLockable:setCode(strCode)
   if type(strCode) == "string" and strCode ~= "" then
      self.code = strCode
      self:setLockState(true)
   else
      self:setLockState(false)
   end
end

function CLockable:getLockType()
   return self.lockType
end

function CLockable:setLockType(value)
   self.lockType = value
end

function CLockable:getLockLevel()
   return self.lockLevel
end

function CLockable:setLockLevel(value)
   self.lockLevel = value
end

function CLockable:getLockPoints()
   return self.lockPoints
end

function CLockable:getLockInitialPoints()
   return LOCK_HP_BY_LEVELS[self.lockLevel]
end

function CLockable:pickLock(item, char)
   if not item then return end

   self.lockPoints = math.max(self.lockPoints - item:getLockDamage(), 0)
   questSystem:fireEvent("lockpick_used", self:getName(), self)
   if self.lockPoints <= 0 then
      self:setLockState(false)
      questSystem:fireEvent("lock_picked", self:getName(), self)
      gameplayUI:showInfoTextEx("Lock picked", "minor", "")
      char:interactStop()
   end
   item:destroy()
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
      if char.inventory:getItemByName(itemName) then return itemName end
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
      label = "try lock"
   end
   return label
end

function CLockable:getInteractType(char)
   return "lockable"
end

function CLockable:isInteractionLingering(char)
   if self.code or self.lockPoints then
      return true
   end
   return false
end

function CLockable:OnSaveState(state)
   CInteractable.OnSaveState(self, state)

   state.locked = self:isLocked()
   state.lockPoints = self.lockPoints
end

function CLockable:OnLoadState(state)
   CInteractable.OnLoadState(self, state)

   self:setLockState(state.locked)
   self.lockPoints = state.lockPoints
end

return CLockable
