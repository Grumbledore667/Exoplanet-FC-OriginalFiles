local oo = require "loop.multiple"
local ItemsData = (require "itemsData")
local tablex = require "pl.tablex"

local CItem = (require "items.item").CItem
local CLockable = require "mixins.lockable"

local CItemContainer = oo.class({empty = false, broken = false}, CItem, CLockable)

function CItemContainer:OnCreate(params)
   params = params or {}
   CItem.OnCreate(self, params)
   self:setCode(params.code or ItemsData.getContainerCode(self:getItemName()))
   self.parameters.lootItems = ItemsData.getContainedItems(self:getItemName())
   self.lootItems = params.lootItems or loadParamItemCounts(self, "lootItems", {})
   self.keyItems = loadParamStrings(self, "keyItems", {})
end

function CItemContainer:setLootItems(t)
   self.lootItems = tablex.deepcopy(t)
end

--TODO: think of adding a small inventory later
function CItemContainer:OnActivate()
   if self:isLocked() then
      CLockable.activate(self, self.owner.owner)
   elseif not self:isEmpty() then
      for itemName,count in pairs(self.lootItems) do
         addItemToObj(itemName, self.owner.owner, count)
      end
      self.empty = true
   else
      gameplayUI:showInfoTextEx("Empty", "minor", "")
   end
end

function CItemContainer:OnAltActivate()
   if not self:isEmpty() then
      for itemName,count in pairs(self.lootItems) do
         addItemToObj(itemName, self.owner.owner, count)
      end
      self.locked = false
      self.broken = true
      self.empty = true
   end
end

function CItemContainer:isEmpty()
   return self.empty
end

function CItemContainer:isBroken()
   return self.broken
end

function CItemContainer:getLabel()
   local label = CItem.getLabel(self)
   local lockedStr = " (locked)"
   local emptyStr = " (empty)"
   local brokenStr = " (broken)"
   if self:isLocked() then
      return label .. lockedStr
   elseif self:isEmpty() and self:isBroken() then
      return label .. string.sub(emptyStr, 1, emptyStr:len()-1) .. "/" ..  string.sub(brokenStr, 3, brokenStr:len())
   elseif self:isEmpty() then
      return label .. emptyStr
   elseif self:isBroken() then
      return label .. brokenStr
   end
   return label
end

function CItemContainer:getLootTable()
   if self:isEmpty() then return end
   return tablex.deepcopy(self.lootItems)
end


return {CItemContainer=CItemContainer}
