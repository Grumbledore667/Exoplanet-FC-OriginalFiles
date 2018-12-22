local oo = require "loop.simple"
local ItemsData = (require "itemsData")
local ItemsLists = (require "itemsLists")
local ObjectsLabels = (require "objectsLabels")
local Installation = (require "items.installation")

local CActivator = oo.class({})

function CActivator:OnCreate()
   getmetatable(self)["__tostring"] = function(t) return "activator" end

   self.enabled = true

   self.labelId      = loadParam( self, "labelId", "" )
   self.interactTime = loadParamNumber( self, "interactTime", 0 )

   self.objectsToShow = loadParamObjects( self, "objectsToShow", nil )
   self.objectsToHide = loadParamObjects( self, "objectsToHide", nil )

   self.soundsToPlay = loadParamStrings( self, "soundsToPlay", nil )
   self.soundsToStop = loadParamObjects( self, "soundsToStop", nil )

   self.emittersToStart = loadParamObjects( self, "emittersToStart", nil )
   self.emittersToStop  = loadParamObjects( self, "emittersToStop", nil )

   self.animationToPlay = loadParam( self, "animationToPlay", "" )
   self.animationCycled = loadParam( self, "animationCycled", true )

   self.activatorEnabled = loadParam( self, "activatorEnabled", true )
   self.activatorHide    = loadParam( self, "activatorHide", false )
   self.activateByPlayer = loadParam( self, "activateByPlayer", true )
   self.activateMultiple = loadParam( self, "activateMultiple", false )
   self.raycastRadius    = loadParam( self, "raycastRadius", 50 )

   self.objectsToActivate   = loadParamObjects( self, "objectsToActivate", nil )
   self.objectsToDeactivate = loadParamObjects( self, "objectsToDeactivate", nil )
   self.objectsToEnable     = loadParamObjects( self, "objectsToEnable", nil )
   self.objectsToDisable    = loadParamObjects( self, "objectsToDisable", nil )

   self.objectTypeToSpawn      = loadParam( self, "objectTypeToSpawn", nil )
   self.objectClassToSpawn      = loadParam( self, "objectClassToSpawn", nil )
   self.spawnedObjects      = {}

   self.removeItems         = loadParamItemCounts( self, "removeItems", {} )
   self.addItems            = loadParamItemCounts( self, "addItems", {} )

   self.interactor = self:createAspect( "interactor" )
   self.interactor:setObject( self )
   self.interactor:setRaycastRadius( self.raycastRadius )
   self.interactor:getPose():setParent( self:getPose() )
   self.interactor:getPose():resetLocalPose()
   self.interactor:setRaycastActive( self.activateByPlayer )

   if ( self.activatorEnabled ) then
      self:enable()
   else
      self:disable()
   end
end

function CActivator:OnDestroy()
end

function CActivator:checkRemoveItems()
   if ( self.removeItems ) then
      local hasAllItems = true
      for itemName, count in pairs(self.removeItems) do
         local item = getPlayer().itemsManager:getItemByName(itemName)
         if not item then
            gameplayUI:showInventoryDropInfo( "Missing ".. count .. " " ..  ItemsData.getItemLabel( itemName ) )
            hasAllItems = false
         elseif item.count < count then
            gameplayUI:showInventoryDropInfo( "Missing ".. (count - item.count) .. " " .. ItemsData.getItemLabel( itemName ) )
            hasAllItems = false
         end
      end

      if not hasAllItems then return false end

      for itemName, count in pairs(self.removeItems) do
         local item = getPlayer().itemsManager:getItemByName(itemName)
         if count > 1 then
            gameplayUI:showInventoryDropInfo( count .. " " .. ItemsData.getItemLabel(itemName) .. " were removed from Inventory" )
         else
            gameplayUI:showInventoryDropInfo( count .. " " .. ItemsData.getItemLabel(itemName) .. " was removed from Inventory" )
         end
         item:changeCount( -count )
      end
      getPlayer().itemsManager:updateInventoryUI()
   end
   return true
end

function CActivator:addItemsToPlayer()
   for itemName, count in pairs(self.addItems) do
      if count > 1 then
         gameplayUI:showInventoryDropInfo( count .. " " .. ItemsData.getItemLabel(itemName) .. " were added to Inventory" )
      else
         gameplayUI:showInventoryDropInfo( count .. " " .. ItemsData.getItemLabel(itemName) .. " was added to Inventory" )
      end
      local item = getPlayer():addItem( itemName )
      item:changeCount( count - 1 )
   end
   getPlayer().itemsManager:updateInventoryUI()
end

function CActivator:spawnObject()
   local entity = getScene():createEntity(self.objectTypeToSpawn, self.objectClassToSpawn)
   entity:setPose( self:getPose() )
   if entity.initWithParams then
      local item_params = nil
      for k,v in pairs(Installation.ItemRecipes) do
         for k2, v2 in pairs(v) do
            if k2 == self.objectTypeToSpawn then
               item_params = v2.params
               break
            end
         end
      end
      if item_params then
         entity:initWithParams(item_params)
      end
   end
   table.insert(self.spawnedObjects, entity)
end

function CActivator:enable()
   self.enabled = true
   self.interactor:setRaycastActive( self.enabled and self.activateByPlayer )
end

function CActivator:disable()
   self.enabled = false
   self.interactor:setRaycastActive( self.enabled )
end

function CActivator:isEnabled()
   return self.enabled
end

function CActivator:activate( obj )
   --log( "CActivator:activate" )

   if ( not self.enabled ) then
      return false
   end

   if ( not self:checkRemoveItems() ) then
      return false
   end

   questSystem:fireEvent( "activate", self:getName() )

   if ( not self.activateMultiple ) then
      self:disable()
   end

   --TODO:FIXME: This is populated before characters init, so we can't use them here.
   if ( self.objectsToShow ) then for i=1,#self.objectsToShow do self.objectsToShow[i]:setVisible( true  ) end end
   if ( self.objectsToHide ) then for i=1,#self.objectsToHide do self.objectsToHide[i]:setVisible( false ) end end

   if ( self.soundsToPlay ) then for i=1,#self.soundsToPlay do getPlayer():playSound(self.soundsToPlay[i]) end end
   if ( self.soundsToStop ) then for i=1,#self.soundsToStop do self.soundsToStop[i]:stop() end end

   if ( self.emittersToStart ) then for i=1,#self.emittersToStart do self.emittersToStart[i]:play() end end
   if ( self.emittersToStop  ) then for i=1,#self.emittersToStop  do self.emittersToStop[i]:stop()  end end

   self:playAnimation( self.animationToPlay, self.animationCycled )

   if ( self.objectsToActivate   ) then for i=1,#self.objectsToActivate   do self.objectsToActivate[i]:activate( self ) end end
   if ( self.objectsToDeactivate ) then for i=1,#self.objectsToDeactivate do self.objectsToDeactivate[i]:deactivate( self ) end end

   if ( self.objectsToEnable   ) then for i=1,#self.objectsToEnable   do self.objectsToEnable[i]:enable() end end
   if ( self.objectsToDisable  ) then for i=1,#self.objectsToDisable  do self.objectsToDisable[i]:disable() end end

   if ( self.objectTypeToSpawn and self.objectClassToSpawn ) then
      self:spawnObject()
   end

   if ( self.activatorHide ) then
      self:setVisible( false )
   end

   self:addItemsToPlayer()

   return true
end

function CActivator:getType()
   return "activator"
end

function CActivator:getLabel()
   local label = ObjectsLabels.getLabel( self.labelId )

   if label == "" then
      label = ObjectsLabels.getLabel( self:getName() )
   end

   if label == "" then
      label = ItemsLists.getLabelForModel( self:getPrefabName() )
   end

   if label == "" then
      label = self:getName()
   end

   return label
end

function CActivator:getInteractLabel()
   local label = ObjectsLabels.getInteractLabel( self.labelId )

   if ( label == "" ) then
      label = "interact"
   end

   return label
end

function CActivator:getInteractTime( interactType )
   return self.interactTime
end

function CActivator:OnSaveState(state)
   state.enabled = self.enabled
   if #self.spawnedObjects > 0 then
      state.spawned = true
   end
end

function CActivator:OnLoadState(state)
   if state.enabled then
      self:enable()
   else
      self:disable()
   end

   if state.spawned then
      self:spawnObject()
   end
end

return {CActivator=CActivator}
