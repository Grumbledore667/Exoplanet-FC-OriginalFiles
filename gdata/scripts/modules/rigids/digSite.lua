local oo = require "loop.simple"
local hlp = require "helpers"
local tablex = require "pl.tablex"
local ItemsLists = (require "itemsLists")
local ObjectsLabels = (require "objectsLabels")

local CDigSite = oo.class({})

function CDigSite:OnCreate()
   self.meshRaycast = loadParam(self, "meshRaycast", true)

   self.label = loadParam(self, "label", "")
   self.containerModel = loadParam(self, "containerModel", "")
   self.lootItems = loadParamItemCounts(self, "lootItems", {})
   self.position = loadParamVec3(self, "position", {x=0,y=0,z=0})
   self.rotation = loadParamVec3(self, "rotation", {x=0,y=0,z=0})

   self.digsToOpen = math.floor(loadParamNumber(self, "digsToOpen", 2))
   self.digsDone = 0

   self.interactor = self:createAspect( "interactor" )
   self.interactor:setObject( self )
   self.interactor:setRaycastRadius( 150 )
   self.interactor:getPose():setParent( self:getPose() )
   self.interactor:getPose():resetLocalPose()
   self.interactor:getPose():setLocalPos( {x=0,y=100,z=0} )
   self.interactor:setRaycastActive( true )
   if self.meshRaycast then
      self.interactor:setRaycastTarget( self:getPose() )
   end

   if ( self.isMaterialHelper and not self:isMaterialHelper() ) then
      self:addMaterial( "highlight" )
      self:setMaterialVisible( "highlight", false )
   end

   self.spawnedItems = {}
   self.spawnedContainer = nil
end

function CDigSite:activate( char )
   if char.itemsManager:getItemByName( "shovel.wpn" ) then
      char:startDigging( self )
   else
      gameplayUI:showInfoTextEx( "I need a shovel to dig here", "minor", "" )
   end
end

function CDigSite:getActivationsLeft()
   return self.digsToOpen - self.digsDone
end

function CDigSite:onDigDone()
   self.digsDone = self.digsDone + 1
   if self:getActivationsLeft() <= 0 then
      self.active = false
      self.interactor:setRaycastActive( false )
      self:showLoot()
   end
end

function CDigSite:showLoot()
   self:setVisible(false)
   self:setCollisionCharacters( false, false )
   self:setCollisionObjects( false )

   local pos = vec3Add( self.position, self:getPose():getPos() )

   if self.containerModel ~= "" then
      self.spawnedContainer = hlp.safeCreateEntity(self.containerModel, "CContainer")

      self.spawnedContainer:getPose():setPos( pos )
      self.spawnedContainer:getPose():setRot( self.rotation )

      for name, count in pairs(self.lootItems) do
         for i=1, count do
            self.spawnedContainer.inventory:addItem(name)
         end
      end
   else
      for name, count in pairs(self.lootItems) do
         local model = ItemsLists.getModelForItem(name)
         if model then
            local obj = hlp.safeCreateEntity(model, "CItemGenerator")
            obj.itemName = name
            obj.itemCount = count
            obj:getPose():setPos( pos )
            obj:getPose():setRot( self.rotation )
            self.spawnedItems[#self.spawnedItems + 1] = obj
         end
      end
   end
end

function CDigSite:OnInteractHighlightBegin( obj )
   if ( not self.setMaterialVisible or self.interacting ) then
      return
   end

   self:stopHighlightTimer()

   self.highlightTimer = runTimer( 2, self,
      function (obj)
         obj:setMaterialVisible( "highlight", false )
         obj.highlightTimer = nil
      end, false )

   self:setMaterialVisible( "highlight", true )
end

function CDigSite:stopHighlightTimer()
   if ( self.highlightTimer ) then
      self.highlightTimer:stop()
      self.highlightTimer = nil
   end
end

function CDigSite:getType()
   return "activator"
end

function CDigSite:getLabel()
   --check if label id exists
   local label = ObjectsLabels.getLabel( self.label )
   --if not, then take it literally
   if label == "" then
      label = self.label
   end
   --if empty, then lookup object name
   if label == "" then
      label = ObjectsLabels.getLabel( self:getName() )
   end
   --resort to default label
   if label == "" then
      label = "Digging Site"
   end
   return label
end

function CDigSite:getLabelPos()
   return vec3Add(self.interactor:getPose():getPos(), {y=75})
end

function CDigSite:getInteractLabel()
   return "dig"
end

function CDigSite:isOpen()
   return self.digsDone >= self.digsToOpen
end

function CDigSite:getLootTable()
   local t = tablex.deepcopy( self.lootItems )
   return t
end

function CDigSite:OnSaveState(state)
   state.interactor = self.interactor:getRaycastActive()
   state.digsDone = self.digsDone

   -- spawned items and containers
   state.spawnedItems = {}
   for _, obj in pairs(self.spawnedItems) do
      if obj:getVisible() then
         state.spawnedItems[obj.itemName] = obj.itemCount
      end
   end

   if self.spawnedContainer then
      state.containerInventory = self.spawnedContainer.inventory.itemsManager:serialize()
   end
end

function CDigSite:OnLoadState(state)
   if state.interactor then
      self.interactor:setRaycastActive(true)
   else
      self.interactor:setRaycastActive(false)
   end
   self.digsDone = state.digsDone

   if self:isOpen() then
      local pos = vec3Add( self.position, self:getPose():getPos() )
      if self.containerModel ~= "" then
         self.spawnedContainer = hlp.safeCreateEntity(self.containerModel, "CContainer")

         self.spawnedContainer:getPose():setPos( pos )
         self.spawnedContainer:getPose():setRot( self.rotation )

         self.spawnedContainer.inventory.itemsManager:deserialize( state.containerInventory )
      else
         for name, count in pairs(state.spawnedItems) do
            local model = ItemsLists.getModelForItem(name)
            if model then
               local obj = hlp.safeCreateEntity(model, "CItemGenerator")
               obj.itemName = name
               obj.itemCount = count
               obj:getPose():setPos( pos )
               obj:getPose():setRot( self.rotation )
               self.spawnedItems[#self.spawnedItems + 1] = obj
            end
         end
      end
   end
end

return {CDigSite=CDigSite}
