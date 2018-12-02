local oo = require "loop.simple"
local CItemsManager = (require "itemsManager").CItemsManager
local ItemsData = (require "itemsData")

local CInventory = oo.class({})

function CInventory:init( creator )
   getmetatable(self)["__tostring"] = function(t) return "CInventory" end

   self.owner = creator

   if ( self.owner.isMaterialHelper and not self.owner:isMaterialHelper() ) then
      self.owner:addMaterial( "highlight" )
      self.owner:setMaterialVisible( "highlight", false )
   end

   self.interactor = self.owner:createAspect( "interactor" )
   self.interactor:setObject( self )
   self.interactor:setRaycastRadius( 150 )
   self.interactor:getPose():setParent( self.owner:getPose() )
   self.interactor:getPose():resetLocalPose()
   self.interactor:getPose():setLocalPos( {x=0,y=0,z=0} )
   self.interactor:setTriggerActive( false )
   self.interactor:setRaycastActive( true )

   self.itemsManager = CItemsManager{ owner = self }
   self.itemsManager:init()
   self.itemsManager:setMainInventoryUI( false )

   self.activated = false

   self.itemsNames = nil
end

function CInventory:deinit()
end

function CInventory:setActive( state )
   self.interactor:setRaycastActive( state )
end

function CInventory:getActive()
   return self.interactor:getRaycastActive()
end

function CInventory:setRadius( radius )
   self.interactor:setRaycastRadius( radius )
end

function CInventory:getRadius()
   return self.interactor:getRaycastRadius()
end

function CInventory:addItems( list )
   self.itemsNames = list

   if ( self.itemsNames ) then
      for i=1,#self.itemsNames do
         --log( "item = " .. self.itemsNames[i] )
         self.itemsManager:addItem( self.itemsNames[i] )
      end
   end
end

function CInventory:getItemsCount()
   return self.itemsManager:getItemsCount()
end

function CInventory:isActivated()
   return self.activated
end

function CInventory:activate( obj )
   if ( obj.exchangeStart ) then
      self.itemsManager:showInventory( true )
      obj:exchangeStart( self )
   end

   if ( self.owner.activate ) then
      if ( self.owner:activate(obj) ) then
         self.activated = true
         return true
      else
         return false
      end
   end

   self.activated = true

   return true
end

function CInventory:deactivate( obj )
   self.itemsManager:showInventory( false )

   if ( obj.exchangeStop ) then
      obj:exchangeStop()
   end

   if ( self.owner.deactivate ) then
      if ( self.owner:deactivate(obj) ) then
         self.activated = false
         return true
      else
         return false
      end
   end

   self.activated = false

   return true
end

function CInventory:OnInteractHighlightBegin( obj )
   if ( not self.owner.setMaterialVisible or self:getItemsCount() == 0) then
      return
   end

   self:stopHighlightTimer()

   self.highlightTimer = runTimer( 2, self,
      function (self)
         self.owner:setMaterialVisible( "highlight", false )
         self.highlightTimer = nil
      end, false )

   self.owner:setMaterialVisible( "highlight", true )
end

function CInventory:OnFocusBegin( obj )
   if ( self.owner.setMaterialVisible ) then
      self.owner:setMaterialVisible( "highlight", true )
   end
   self:stopHighlightTimer()
end

function CInventory:OnFocusEnd( obj )
   if ( self.owner.setMaterialVisible ) then
      self.owner:setMaterialVisible( "highlight", false )
   end
   self:stopHighlightTimer()
end

function CInventory:stopHighlightTimer()
   if ( self.highlightTimer ) then
      self.highlightTimer:stop()
      self.highlightTimer = nil
   end
end

function CInventory:addItem( itemName )
   return self.itemsManager:addItem( itemName )
end

function CInventory:destroyItemByName( itemName )
   local item = self.itemsManager:getItemByName( itemName )
   if ( item ) then
      return self:destroyItem( item.id )
   end
   return false
end

function CInventory:destroyItem( itemId )
   local item = self.itemsManager:getItemById( itemId )
   if ( item ) then
      local res = self.itemsManager:destroyItem( itemId )
      if ( self.owner.OnLostItem ) then
         self.owner:OnLostItem()
      end
      return res
   end
   return false
end

function CInventory:giveItem( itemId, char, count )
   local myItem = self.itemsManager:getItemById( itemId )
   local foundItem = char.itemsManager:getItemByName( myItem.name )
   local item   = char:addItem( myItem.name )

   if ( item ) then
      if ItemsData.isItemAlive(item.name) then
         if char.itemsManager.aliveItemsCount + count - 1 >= char.itemsManager.aliveItemsMax then
            count = char.itemsManager.aliveItemsMax - char.itemsManager.aliveItemsCount + 1
         end
      end

      myItem:changeCount( -(count) )

      item:changeCount( count - 1 )
      self.itemsManager:updateInventoryUI()
      char.itemsManager:updateInventoryUI()
      if not foundItem then
         item.magazine = myItem.magazine
         item.params = tableDeepCopy( myItem.params )
      end

      if self.owner.OnLostItem then
         self.owner:OnLostItem()
      end
      return item
   end
   return nil
end

function CInventory:takeItemFrom( itemId, char, count )
   return char:giveItem( itemId, self, count )
end

function CInventory:getItemParams( itemId )
   return self.itemsManager:getItemParams( itemId )
end

function CInventory:getWeaponSlot()
   if ( self.owner.getWeaponSlot ) then
      return self.owner:getWeaponSlot()
   else
      return 0
   end
end

function CInventory:getPose()
   return self.owner:getPose()
end

function CInventory:getType()
   return "activator"
end

function CInventory:getName()
   return self.owner:getName()
end

function CInventory:getLabelPos()
   if ( self.owner.getLabelPos ) then
      return self.owner:getLabelPos()
   end
   local pos = self:getPose():getPos()
   pos.y = pos.y + 100
   return pos
end

function CInventory:getLabel()
   if ( self.owner.getLabel ) then
      return self.owner:getLabel()
   end

   return self:getName()
end

function CInventory:getInteractLabel()
   if ( self.owner.getInteractLabel ) then
      return self.owner:getInteractLabel()
   end

   return "interact"
end

return {CInventory=CInventory}
