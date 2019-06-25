local oo = require "loop.simple"
local CInventoryBase = require "inventoryBase"

---@class CInventorySlotted : CInventoryBase
---@field slots (CItem | CWeapon | CGun)[]
local CInventorySlotted = oo.class({}, CInventoryBase)

function CInventorySlotted:init(owner)
   CInventoryBase.init(self, owner)
   self.slots = {}
end

function CInventorySlotted:getWeaponSlot()
   if self:getOwner().getWeaponSlot then
      return self:getOwner():getWeaponSlot()
   else
      return 1
   end
end

function CInventorySlotted:dismissItem(item, silent)
   if item and item:isEquipable() then
      self:unequipSlot(item:getEquippedSlot(), silent)
   end
   CInventoryBase.dismissItem(self, item)
end

--These two have silent arg for silencing the sound FX, but not the event
function CInventorySlotted:equipSlotWithItem(slotId, itemId, silent, noEvent)
   local item = self:getItemById(itemId)

   if not slotId or not item or self:getSlotItem(slotId) == item then
      return false
   end

   self:unequipSlot(item:getEquippedSlot(), true, false)
   self:unequipSlot(slotId, true, false)
   self:getSlots()[slotId] = item
   item.equippedSlot = slotId

   if not noEvent then
      self:OnChange({eventType="ItemEquipped", slotId = slotId, item = item, silent = silent})
      item:OnEquip(slotId, silent)
   end
   return item
end

---unequip character slot
---@param slotId number
---@param silent boolean @optional, mutes unequip sound if true
---@param noEvent boolean @optional, skip firing unequip event if true
---@return CItem
function CInventorySlotted:unequipSlot(slotId, silent, noEvent)
   if not slotId then return end

   local item = self:getSlotItem(slotId)
   self:getSlots()[slotId] = nil

   if item then
      item.equippedSlot = nil
      if not noEvent then
         self:OnChange({eventType="ItemUnequipped", slotId = slotId, item = item, silent = silent})
         item:OnUnequip(slotId, silent)
      end
   end
   return item
end

function CInventorySlotted:getSlots()
   return self.slots
end

function CInventorySlotted:getSlotItem(slotId)
   return self:getSlots()[slotId]
end

function CInventorySlotted:getSlotAnimationSet(slotId)
   local item = self:getSlotItem(slotId)
   return (item and item:getAnimations()) or ""
end

function CInventorySlotted:getWeaponSlotAnimationSet(slotId)
   return self:getSlotAnimationSet(self:getWeaponSlot())
end


function CInventorySlotted:getItemState(item)
   local state = CInventoryBase.getItemState(self, item)
   state.equippedSlot = item:getEquippedSlot()
   return state
end

function CInventorySlotted:loadItemState(itemTable)
   local item = CInventoryBase.loadItemState(self, itemTable)
   if item and itemTable.equippedSlot and item:isEquipable() then
      self:equipSlotWithItem(itemTable.equippedSlot, item:getId(), true)
   end
   return item
end

return CInventorySlotted
