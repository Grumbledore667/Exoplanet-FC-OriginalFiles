local oo = require "loop.simple"
local ItemsData = (require "itemsData")

local tablex = require "pl.tablex"

local hlp = require "helpers"

local CItemsManager = oo.class({
   idGenerator     = 0,
   aliveItemsCount = 0,
   aliveItemsMax   = 3,
})

function CItemsManager:init()
   self.items = {}
   self.slots = {}
   self.mainInventoryUI = false
end

function CItemsManager:genId()
   self.idGenerator = self.idGenerator + 1
   return self.idGenerator
end

function CItemsManager:getItemsCount()
   return #self.items
end

-- inventory
function CItemsManager:setMainInventoryUI( state )
   self.mainInventoryUI = state
   if state then
      self.aliveItemsMax = 3
   else
      self.aliveItemsMax = 25
   end
end

function CItemsManager:showInventory( state )
   if ( state == true ) then
      if ( self.mainInventoryUI == true ) then
         gameplayUI:setupInventory( self.items )
      elseif not self.inventoryType or self.inventoryType == "container" then
         gameplayUI:setupInventory2( self.items )
      elseif self.inventoryType and self.inventoryType == "turret" then
         gameplayUI:setupInventoryTurret( self.items )
      end
   end

   if ( self.mainInventoryUI == true ) then
      gameplayUI:showInventory( state )
   elseif not self.inventoryType or self.inventoryType == "container" then
      gameplayUI:showInventory2( state )
      if ( self.owner.getLabel ) then
         gameplayUI:setupInventoryTitle2( self.owner:getLabel() )
      end
   elseif self.inventoryType and self.inventoryType == "turret" then
      gameplayUI:showInventoryTurret( state )
   end
end


function CItemsManager:updateInventoryUI()
   if gameplayUI:isInventoryVisible() and not gameplayUI:isTradeVisible() then
      if self.mainInventoryUI then
         self:showInventory( gameplayUI:isInventoryVisible() ) -- refresh inventory look
         gameplayUI:setupCharacterWindow()
      elseif not self.inventoryType or self.inventoryType == "container" then
         self:showInventory( gameplayUI:isInventory2Visible() ) -- refresh inventory look
      elseif self.inventoryType and self.inventoryType == "turret" then
         self:showInventory( gameplayUI:isInventoryTurretVisible() ) -- refresh inventory look
      end
      if gameplayUI:isCraftVisible() then
         gameplayUI:setupCraft()
      end
   end

   if self.mainInventoryUI and getDefaultPlayer() then
      getDefaultPlayer():updateAmmoGui()
      self:updateItemsAlive()
   end
end

function CItemsManager:updateItemsAlive()
   self.aliveItemsCount = 0

   for i=1,#self.items do
      local item = self.items[i]
      if ItemsData.isItemAlive( item:getItemName() ) then
         self.aliveItemsCount = self.aliveItemsCount + item.count
      end
   end
end

function CItemsManager:isItemsAliveLimit()
   if self.owner and self.owner.trader then
      return false
   end
   return self.aliveItemsCount >= self.aliveItemsMax
end

-- items
function CItemsManager:serialize()
   local result = {}
   local empty = true
   for i=1,#self.items do
      if ( not self.items[i].params ) then
         table.insert(result, {name=self.items[i].name, count=self.items[i].count, magazine=self.items[i].magazine})
         empty = false
      end
   end
   if empty then
      return nil
   else
      return result
   end
end

function CItemsManager:deserialize(items)
   if items then
      local function loadItem(itemTable)
         local name = itemTable.name

         if not ItemsData.ItemsInfo[name] then return end

         local count = itemTable.count
         local magazine = itemTable.magazine
         local existing = self:getItemByName(name)
         if existing then
            existing.count = existing.count + count
         else
            local class = ItemsData.getItemClass(name)
            local obj
            if self:isWeapon(name) and ItemsData.getCreateModel(name) ~= false or ItemsData.getCreateModel(name) then
               obj = hlp.safeCreateItemWithModel(name, class)
            else
               obj = hlp.safeCreateItemWithoutModel(name, class)
            end

            if obj then
               obj:OnPick( self.owner )
               obj.id      = self:genId()
               obj.equipped = false
               obj.count   = count
               obj.magazine = magazine

               if ( ItemsData.ItemsInfo[ obj.name ] ) then
                  obj.icon = ItemsData.ItemsInfo[ obj.name ].icon
               end

               self.items[#self.items+1] = obj

               obj:setObject( self.owner )
               if self.owner == getPlayer() then
                  obj:setPlayerMode(true)
               end
               obj:setCollisionCharactersRoot( false, false )
               obj:setDynamicRoot( false )
               obj:hide()
            end
         end
      end
      for k,v in pairs(items) do
         if pcall(loadItem, v) then
         else
            log("ERROR ON DESERIALIZE OF ITEMTABLE")
            log(v)
         end
      end
   end
end

function CItemsManager:addItem( itemName )
   if ( ItemsData.isItemAlive(itemName) and self:isItemsAliveLimit() ) then
      return nil
   end

   local found = nil
   for i=1,#self.items do
      if ( self.items[i].name == itemName and not self.items[i].params ) then
         found = self.items[i]
         break
      end
   end

   if ( found ) then
      found.count = found.count + 1

      if ( self.mainInventoryUI == true ) then
         questSystem:fireEvent( "get", found.name )
      end

      self:updateActiveSlotItem( "add", found )

      if ( ItemsData.isItemAlive(found.name) ) then
         self.aliveItemsCount = self.aliveItemsCount + 1
      end
      self:updateInventoryUI()
      return found
   end

   if not ItemsData.isCorrectItemName(itemName) or
      not ItemsData.hasItemsInfo(itemName) then
      log("ERROR: item name " .. tostring(itemName) .. " doesn't exist")
      return nil
   end

   return self:addItemWithClass( itemName, ItemsData.getItemClass(itemName) )
end

function CItemsManager:addItemWithClass( itemName, className )
   if ( ItemsData.isItemAlive(itemName) and self:isItemsAliveLimit() ) then
      return nil
   end

   local entity
   if self:isWeapon(itemName) and ItemsData.getCreateModel(itemName) ~= false or ItemsData.getCreateModel(itemName) then
      entity = hlp.safeCreateItemWithModel(itemName, className)
   else
      entity = hlp.safeCreateItemWithoutModel(itemName, className)
   end

   return self:addItemObj( entity )
end

function CItemsManager:addItemObj( obj )
   if ( not obj ) then
      return nil
   end

   if ( ItemsData.isItemAlive(obj:getItemName()) and self:isItemsAliveLimit() ) then
      --getScene():destroyEntity( obj )
      return nil
   end

   local found = nil
   for i=1,#self.items do
      if ( self.items[i].name == obj.name and not self.items[i].params and not obj.params ) then
         found = self.items[i]
         break
      end
   end

   obj:OnPick( self.owner )

   if ( found ) then
      if ( obj.count ) then
         found.count = found.count + obj.count
      else
         found.count = found.count + 1
      end
      getScene():destroyEntity( obj )
      obj = found
   else
      obj.id      = self:genId()
      obj.equipped = false
      obj.count   = obj.count or 1

      if ( ItemsData.ItemsInfo[ obj.name ] ) then
         obj.icon = ItemsData.ItemsInfo[ obj.name ].icon
      end

      self.items[#self.items+1] = obj

      obj:setPlayerMode(false)
      obj:setObject( self.owner )
      if self.owner == getPlayer() then
         obj:setPlayerMode(true)
      end
      --log("setObject = " .. tostring(self.owner))

      obj:setCollisionCharactersRoot( false, false )
      obj:setDynamicRoot( false )
      obj:hide()
   end

   if ( self.mainInventoryUI == true ) then
      questSystem:fireEvent( "get", obj.name )
   end

   self:updateActiveSlotItem( "add", obj )

   self:updateInventoryUI()
   return obj
end

function CItemsManager:dropItem( itemId )
   local item = self:getItemById( itemId )

   if ( not item ) then
      return nil
   end

   if ( item.count == 1 ) then
      for key, val in pairs(self.slots) do
         if ( item == val ) then
            self:unequipSlot( key )
            break
         end
      end

      item:setCollisionCharactersRoot( true, true )
      item:setDynamicRoot( true )
      item:show()

      self:clearFromHotbar( item.id )
      table.remove( self.items, self:getItemIndex(item.id) )

      self:updateActiveSlotItem( "remove", item )

      item:OnDrop  ( self.owner )
      item:setObject( nil )

      return item
   else
      --gen and drop item
      item.count = item.count - 1
      local tmpItem = getScene():createEntity( item.name, ItemsData.getItemClass(item.name) )

      for i=1,#self.items do
         if ( self.items[i].name == item.name and self.items[i].equipped ) then
            tmpItem:setPose( self.items[i]:getPose() )
            break
         end
      end

      tmpItem.equipped = false
      tmpItem.count   = 1

      if ( ItemsData.ItemsInfo[ tmpItem.name ] ) then
         tmpItem.icon = ItemsData.ItemsInfo[ tmpItem.name ].icon
      end

      self:updateActiveSlotItem( "remove", item )

      tmpItem:OnPick  ( self.owner )
      tmpItem:setObject( self.owner )
      tmpItem:OnDrop  ( self.owner )
      tmpItem:setObject( nil )

      return tmpItem
   end
end

function CItemsManager:removeAllItems()
   -- set all item counts to 1 (otherwise destroyItem just decrements the count)
   -- and create a table of all item ids
   local itemIds = tablex.imap(function(v) v.count = 1; return v.id end, self.items)
   for _, id in ipairs(itemIds) do
      if not self:destroyItem(id) then
         -- either we're getting paranoid or something went very, very wrong
         local name, class = hlp.getNameAndClass(self.owner)
         log(string.format("ERROR: CItemsManager of object %s with class %s tried destroying item with id %s which doesn't exist"), name, class, tostring(id))
      end
   end
   -- there is no need to updateInventoryUI (it's called in destroyItem)
   -- or set self.items = {} (all items should be destroyed)
end

function CItemsManager:dropItemFromSlot( slotId )
   if ( self.slots[slotId] ) then
      self:dropItem( self.slots[slotId].id )
   end
end

function CItemsManager:updateActiveSlotItem( action, item )
   local slotItem = self:getSlotItem( self.owner:getWeaponSlot() )

   if ( slotItem ) then
      slotItem:OnOwnerUpdate( action, item )
   end
end

function CItemsManager:setToHotbarByName( hotbarIndex, itemName )
   self:setToHotbar( hotbarIndex, self:getItemByName(itemName) )
end

function CItemsManager:setToHotbar( hotbarIndex, item )
   gameplayUI:setItemToHotbar( hotbarIndex, item )
end

function CItemsManager:clearFromHotbar( itemId )
   if ( self.mainInventoryUI ~= true ) then
      return
   end

   local item   = self:getItemById( itemId )
   local analog = nil

   for i=1,#self.items do
      if ( self.items[i].id ~= itemId and self.items[i].name == item.name ) then
         analog = self.items[i]
      end
   end

   for i=1,#gameplayUI.hotbar.slots do
      if gameplayUI:getHotbarItemIdInSlot( i ) == itemId then
         self:setToHotbar( i, analog )
      end
   end
end

function CItemsManager:clearFromSlots( itemToClear )
   for key, item in pairs(self.slots) do
      if ( item == itemToClear ) then
         self:unequipSlot( key )
      end
   end

   if ( self.owner.setButtonNotify ) then
      self.owner:setButtonNotify( "changeWeapon", false )
   end
end

function CItemsManager:equipSlotWithItem( slotId, itemId, silent )
   local item = self:getItemById( itemId )

   if ( not slotId or not item or self.slots[slotId] == item ) then
      return false
   end

   self:unequipSlot( slotId )
   self.slots[slotId] = item
   item.equipped = true
   if type(slotId) == "number" then
      item:getPose():setParent( self.owner:getBonePose( "item_slot" .. slotId ) )
      item:getPose():resetLocalPose()

      item:setCollisionCharactersRoot( false, false )
      item:setDynamicRoot( false )
      item:show()
   else
      if item:isAccessory() then
         self.owner:setupAccessory( item:getAttachments() )
      end
      self.owner:updateAttire()
   end

   if not silent then
      if not item:getSounds() or item:getSounds() and not item:getSounds().equip then
         self.owner:playSound("ammunition_2.wav")
      end
   end

   item:OnEquip( slotId )

   --slot->setUserPhysGroup( slot->getInitialPhysGroup() | PhysUserGameGroup );
   self.owner:OnChangeItem( slotId, item )

   if self.mainInventoryUI then
      gameplayUI:setupCharacterWindow()
      self:updateInventoryUI()
   end

   return true
end

function CItemsManager:unequipSlot( slotId, silent )
   if ( not slotId ) then
      return
   end

   if ( self.owner == getDefaultPlayer() and slotId == self.owner:getWeaponSlot() ) then
      gameplayUI:setItemIcon( "Hand" )
   end

   local item = self.slots[slotId]
   self.slots[slotId] = nil

   if ( item ) then
      item.equipped = false
      if type(slotId) == "number" then
         item:getPose():resetParent()
         item:hide()
      else
         if item:isAccessory() then
            self.owner:removeAccessory( item:getAttachments() )
            if self.owner == getPlayer() and item:getAttireType() == "hat" then
               self.owner:wearHair()
            end
         end
         self.owner:updateAttire()
      end
      if not silent then
         if item:getSounds() and item:getSounds().unequip then
            item:OnUnequip( slotId )
         else
            self.owner:playSound("ammunition_3.wav")
         end
      end
      if self.mainInventoryUI then
         self:updateInventoryUI()
         gameplayUI:setupCharacterWindow()
      end
   end
end

function CItemsManager:getSlotItem( slotId )
   return self.slots[slotId]
end

function CItemsManager:getSlotAnimationSet( slotId )
   local item = self.slots[slotId]

   if ( item ) then
      return ItemsData.getItemAnimations( item:getItemName() )
   else
      return ""
   end
end

function CItemsManager:decomposeItem( itemId )
   log( "CItemsManager:decomposeItem: " .. itemId )

   local itemObj = self:getItemById( itemId )

   if ( not itemObj ) then
      return
   end

   local decomposeList = ItemsData.ItemsDecompose[itemObj.name]

   if ( decomposeList ) then
      for key, item in pairs(decomposeList) do
         self:addItem( item )
      end
      self:destroyItem( itemId )
   end
end

function CItemsManager:checkComposeItem( listIds )
   log( "CItemsManager:checkComposeItem" )

   if ( not listIds ) then
      return nil
   end

   local listNames = {}

   for i=1,#listIds do
      listNames[#listNames+1] = self:getItemById( listIds[i] ).name
   end

   for i=1,#ItemsData.ItemsCompose do
      if ( listIsList(ItemsData.ItemsCompose[i].recipe, listNames) == true ) then
         return ItemsData.ItemsCompose[i].item
      end
   end

   return nil
end

function CItemsManager:composeItem( listIds )
   if ( not listIds ) then
      return nil
   end

   local itemName = self:checkComposeItem( listIds )

   if ( itemName ) then
      log( "CItemsManager:composeItem: " .. itemName )

      for i=1,#listIds do
         self:destroyItem( listIds[i] )
      end

      return self:addItem( itemName )
   end
end

function CItemsManager:destroyItemByName( itemName )
   local item = self:getItemByName( itemName )

   if ( item ) then
      return self:destroyItem( item.id )
   end
   return false
end

function CItemsManager:destroyItem( itemId )
   local item = self:getItemById( itemId )

   if ( not item ) then
      return false
   end

   if ( item.count <= 1 ) then
      self:updateActiveSlotItem( "remove", item )

      getScene():destroyEntity( item )

      self:clearFromSlots ( item )
      if self.mainInventoryUI then
         self:clearFromHotbar( itemId )
         gameplayUI:removeItemFromFastAccess( item )
      end
      table.remove( self.items, self:getItemIndex(itemId) )
   else
      item.count = item.count - 1
   end

   self:updateInventoryUI()

   return true
end

-- utils
function CItemsManager:getItemsByName( itemName )
   if ( not itemName ) then
      return nil
   end

   local items = {}

   for key, item in pairs(self.items) do
      if ( item.name == itemName ) then
         table.insert(items, item)
      end
   end

   if (table.getn(items) == 0) then
      return nil
   end

   return items
end

function CItemsManager:getItemByName( itemName )
   if ( not itemName ) then
      return nil
   end

   for i=1,#self.items do
      if ( self.items[i].name == itemName ) then
         return self.items[i]
      end
   end

   return nil
end

function CItemsManager:getItemById( itemId )
   for i=1,#self.items do
      if ( self.items[i].id == itemId ) then
         return self.items[i]
      end
   end
   return nil
end

function CItemsManager:getItemByIndex( itemIndex )
   return self.items[itemIndex]
end

function CItemsManager:getItemIndex( itemId )
   for i=1,#self.items do
      if ( self.items[i].id == itemId ) then
         return i
      end
   end
   return nil
end

function CItemsManager:setItemParams( itemId, params )
   local item = self:getItemById( itemId )
   if ( item ) then
      item.params = params
   end
end

function CItemsManager:getItemParams( itemId )
   local item = self:getItemById( itemId )
   if ( item ) then
      return item.params
   end
   return nil
end

function CItemsManager:getUnequippedItemByName( itemName )
   for key, item in pairs(self.items) do
      if ( item.name == itemName and item.equipped == false ) then
         return item
      end
   end
   return nil
end

function CItemsManager:getequippedItemByName( itemName )
   for key, item in pairs(self.items) do
      if ( item.name == itemName and item.equipped == true ) then
         return item
      end
   end
   return nil
end

function CItemsManager:getItemId( name )
   for key, item in pairs(self.items) do
      if ( item.name == name ) then
         return item.id
      end
   end
   return nil
end

function CItemsManager:isMeleeWeapon( itemName )
   if ( not itemName ) then return false end
   return string.find(itemName, "%.wpn") ~= nil
end

function CItemsManager:isRangeWeapon( itemName )
   if ( not itemName ) then return false end
   return string.find(itemName, "%.gun") ~= nil
end

function CItemsManager:isWeapon( itemName )
   return (string.find(itemName, "%.gun") ~= nil) or (string.find(itemName, "%.wpn") ~= nil)
end

function CItemsManager:isItem( itemName )
   if ( not itemName ) then return false end
   return string.find(itemName, "%.itm") ~= nil
end

function CItemsManager:getSlotCoolDown( slotId )
   local item = self.slots[slotId]

   if ( item ) then
      return item:getCooldown()
   end

   return 0
end

return {CItemsManager=CItemsManager}
