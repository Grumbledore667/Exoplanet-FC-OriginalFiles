local oo = require "loop.simple"
local CInventorySlotted = require "inventorySlotted"
local ItemsData = require "itemsData"

---@class CInventoryPlayer : CInventorySlotted
local CInventoryPlayer = oo.class({}, CInventorySlotted)

function CInventoryPlayer:init(owner)
   CInventorySlotted.init(self, owner)
   self.limits = { alive = 3 }
   self.fastAccessSlots = {}
   self.fastAccessSlotsFilter = {[5] = "melee_low", [6] = "pistol"}
end

function CInventoryPlayer:dismissItem(item, silent)
   if item and item:isEquipable() then
      if item.magazine then
         item.magazine = 0
      end
      self:removeItemFromFastAccess(item:getFastAccessSlot())
      if item == self.owner.lastWeapon then
         self.owner.lastWeapon = nil
      end
   end
   CInventorySlotted.dismissItem(self, item, silent)
end

function CInventoryPlayer:addItem(itemName, count, quality, silent, noEvent)
   if not itemName then return nil end
   local item = CInventorySlotted.addItem(self, itemName, count, quality, silent, noEvent)
   --Offload ammo
   if item and item.magazine then
      local ammoName = item:getCompatibleAmmo()[1]
      addItemToPlayer(ammoName, item.magazine)
   end
   return item
end

function CInventoryPlayer:addItemObj(item, silent, noEvent)
   if not item then return nil end
   item = CInventorySlotted.addItemObj(self, item, silent, noEvent)
   --Offload ammo
   if item and item.magazine then
      local ammoName = item:getCompatibleAmmo()[1]
      addItemToPlayer(ammoName, item.magazine)
   end
   return item
end

function CInventoryPlayer:finalizeItem(item, count)
   CInventorySlotted.finalizeItem(self, item, count)
   item:setPlayerMode(true)
end

function CInventoryPlayer:setItemToFastAccess(slotId, itemId)
   if not slotId then return end
   local weaponSlotId = self.owner.parameters.weaponSlotId
   local item = self:getItemById(itemId)
   if item then
      if self.fastAccessSlotsFilter[slotId] == item:getAnimations() or not self.fastAccessSlotsFilter[slotId] then
         local currentSlot = item:getFastAccessSlot()
         if currentSlot then
            self:removeItemFromFastAccess(currentSlot)
         end
         if self:getSlotItem(weaponSlotId) == item then
            self:removeItemFromFastAccess(weaponSlotId)
         end
         if self.fastAccessSlots[slotId] then
            self:removeItemFromFastAccess(slotId)
         end
         self.fastAccessSlots[slotId] = item
         self.fastAccessSlots[slotId].fastAccessSlot = slotId
         return true
      else
         gameplayUI:showInfoTextEx("Right hip is for pistols and left is for one-handed weapons.", "minor", "")
      end
   end
   return false
end

function CInventoryPlayer:autoAssignFastAccessSlot(itemId, override)
   local item = self:getItemById(itemId)
   if not item then return end
   local autoFastSlot = getKeyByValue(self.fastAccessSlotsFilter, item:getAnimations())
   if not autoFastSlot and item:getItemName() ~= "hand_to_hand.wpn" then
      if self.fastAccessSlots[3] and not self.fastAccessSlots[4] then
         autoFastSlot = 4
      else
         autoFastSlot = 3
      end
   end
   if autoFastSlot and (not self.fastAccessSlots[autoFastSlot] or override) then
      self:setItemToFastAccess(autoFastSlot, itemId)
      return autoFastSlot
   end
end

function CInventoryPlayer:removeItemFromFastAccess(slotId)
   if not slotId then return end
   local item = self.fastAccessSlots[slotId]
   if item then
      item.fastAccessSlot = nil
   end
   self.fastAccessSlots[slotId] = nil
end

function CInventoryPlayer:getItemState(item)
   local state = CInventorySlotted.getItemState(self, item)
   state.hotbarID = gameplayUI.hotbarUI:getItemHotbarSlot(item)
   state.fastAccessSlot = item:getFastAccessSlot()
   return state
end

function CInventoryPlayer:loadItemState(itemTable)
   local item = CInventorySlotted.loadItemState(self, itemTable)
   if item and itemTable.hotbarID then
      gameplayUI.hotbarUI:setItemToHotbar(itemTable.hotbarID, item)
   end
   if itemTable.fastAccessSlot then
      self.fastAccessSlots[itemTable.fastAccessSlot] = item
      item.fastAccessSlot = itemTable.fastAccessSlot
   end
   return item
end

return CInventoryPlayer
