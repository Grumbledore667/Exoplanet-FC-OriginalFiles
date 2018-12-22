local oo = require "loop.simple"
local CItem = (require "items.item").CItem
local ItemsData = (require "itemsData")

local CBugItem = oo.class({}, CItem)

function CBugItem:OnCreate()
   CItem.OnCreate( self )
end

function CBugItem:setClassParams( params )
   CItem.setClassParams( self, params )

   if ( params and params.imposters ) then
      self.imposters = params.imposters
   end
end

function CBugItem:OnEquip( slotId )
   CItem.OnEquip( self, slotId )

   if ( slotId == self:getObject():getWeaponSlot() ) then
      if ( self.imposters and self.imposters.hand ) then
         self.bugChar = getScene():createEntity( self.imposters.hand, self.imposters.handClass )

         if self:getObject().addInstallation and self.bugChar.setInstaller then
            self:getObject():addInstallation(self.bugChar)
            self.bugChar:setInstaller(self:getObject())
         end

         self.bugChar:OnCaught( self:getPose():getParent() )

         self:hide()
      end
   end
end

function CBugItem:OnUnequip( slotId )
   CItem.OnUnequip( self, slotId )

   if ( self.bugChar ) then
      getScene():destroyEntity( self.bugChar )
      self.bugChar = nil
   end
end

function CBugItem:OnActivate()
   if ( self.bugChar and self.name ~= "bug_chipped.itm" ) then
      gameplayUI:showInventoryDropInfo( self:getLabel() .. " was removed from Inventory" )
      self.bugChar:OnFree( self:getObject():getPose() )
      self.bugChar:push  ( self:getObject():getCamera():getDir(), 15000, 1 )
      self.bugChar = nil

      if ( self.owner ) then
         self.owner.owner:holsterWeapon()
      end

      self:destroy()
   elseif ( self.bugChar and self.name == "bug_chipped.itm" ) then
      self.owner.owner:interactObject( "drop", self, nil )
   end
end

function CBugItem:OnAltActivate()
   if ( not self.bugChar and self.imposters and self.imposters.hand ) then
      self.bugChar = getScene():createEntity( self.imposters.hand, self.imposters.handClass )
      self.bugChar:setPose( self:getObject():getPose() )

      local dir = self:getObject():getCamera():getDir()
      dir.y = 0.5
      self.bugChar:getPose():setPos( vec3Add(self:getObject():getPose():getPos(), vec3Mul(vec3Normalize(dir), 100)) )
      self.bugChar:disablePickupItem()
   end

   if ( self.bugChar ) then
      self:getObject():startControlObject( self.bugChar, self.imposters.control, "CMainCharacterBug", {height=50,dist=100,offset=0,fov=85} )
      self.bugChar = nil
   end
end

function CBugItem:hasAltActivation()
   if self.name == "bug_chipped.itm" then
      return true
   end
   return false
end

function CBugItem:isInstallable()
   if self.name == "bug_chipped.itm" then
      return true
   end
   return false
end

function CBugItem:getInteractTime( interactType )
   if ( interactType == "drop" ) then
      return 1
   end

   return 0
end

return {CBugItem=CBugItem}
