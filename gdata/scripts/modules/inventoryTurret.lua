local oo = require "loop.simple"
local ItemsData = require "itemsData"
local CInventorySlotted = require "inventorySlotted"

---@class CInventoryTurret : CInventorySlotted
local CInventoryTurret = oo.class({}, CInventorySlotted)

function CInventoryTurret:canStoreItems(itemName, count)
   local gun = self:getOwner():getWeaponSlotItem()
   if ItemsData.isItemRangedWeapon(itemName) then
      if not gun then
         count = 1
      else
         count = 0
      end
   elseif itemName:find("ammo") then
      if gun and gun:isAmmoCompatible(itemName) then
         return count
      else
         count = 0
      end
   else
      count = 0
   end
   return count
end

return CInventoryTurret
