local oo = require "loop.simple"
local ItemsData = (require "itemsData")
local ItemsLists = require "itemsLists"

local ItemsManager = require "itemsManager".CItemsManager

local hlp     = require "helpers"

local CItemGenerator = oo.class({
   item = nil,
})

function CItemGenerator:OnCreate()
   self.itemName, self.itemCount = loadParamItemCountsGuessModelSingleItem(self, "itemName", {})
   self.hideSource     = loadParam( self, "hideSource", true )
   self.meshRaycast    = loadParam( self, "meshRaycast", false )
   self.interactHeight = loadParamNumber( self, "interactHeight", 0 )
   self.raycastRadius  = loadParamNumber( self, "raycastRadius", 50 )
   self.interactTime   = loadParamNumber( self, "interactTime", 0 )

   self.interactor = self:createAspect( "interactor" )
   self.interactor:setObject( self )
   self.interactor:setTriggerActive( false )
   self.interactor:setRaycastRadius( self.raycastRadius )
   self.interactor:getPose():setParent( self:getPose() )
   self.interactor:getPose():resetLocalPose()
   self.interactor:getPose():setLocalPos( {x=0,y=self.interactHeight,z=0} )
   if self.itemName and self.itemName ~= "" and ItemsData.isCorrectItemName(self.itemName) then
      self.interactor:setRaycastActive( true )
      if self.meshRaycast then
         self.interactor:setRaycastTarget(self:getPose())
      end
   end

   if ( self.isMaterialHelper and not self:isMaterialHelper() ) then
      self:addMaterial( "highlight" )
      self:setMaterialVisible( "highlight", false )
   end
end

function CItemGenerator:OnFocusBegin( obj )
   self.interacting = true

   self:stopHighlightTimer()

   if ( self.setMaterialVisible ) then
      self:setMaterialVisible( "highlight", true )
   end
end

function CItemGenerator:OnFocusEnd( obj )
   self.interacting = false

   if ( self.setMaterialVisible ) then
      self:setMaterialVisible( "highlight", false )
   end
end

function CItemGenerator:OnInteractHighlightBegin( obj )
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

function CItemGenerator:stopHighlightTimer()
   if ( self.highlightTimer ) then
      self.highlightTimer:stop()
      self.highlightTimer = nil
   end
end

function CItemGenerator:getAsItem()
   local className = ItemsData.getItemClass(self.itemName)
   local item
   -- TODO:FIXME: make this function available in ItemsData or something
   if ItemsManager.isWeapon(nil, self.itemName) and ItemsData.getCreateModel(self.itemName) ~= false or ItemsData.getCreateModel(self.itemName) then
      item = hlp.safeCreateItemWithModel(self.itemName, className)
   else
      item = hlp.safeCreateItemWithoutModel(self.itemName, className)
   end

   if ( item ) then
      if self.itemCount > 1 then
         item.count = self.itemCount
      end
      item:setVisible( false )
      if self.hideSource then
         self:setVisible( false )
         self.interactor:setRaycastActive( false )
      end
      return item
   else
      log( "Can't create " .. self.itemName )
      return nil
   end
end

function CItemGenerator:getLabel()
   return ItemsData.getItemLabel( self.itemName )
end

function CItemGenerator:getLabelPos()
   return vec3Add(self:getPose():getPos(), {y=65})
end

function CItemGenerator:getInteractLabel()
   return "pick up"
end

function CItemGenerator:getType()
   return "pickup"
end

function CItemGenerator:getInteractTime( interactType )
   return self.interactTime
end

function CItemGenerator:getLootTable()
   local t = {}
   t[self.itemName] = self.itemCount
   return t
end

function CItemGenerator:OnSaveState(state)
   state.visible = self:getVisible()
   state.interactor = self.interactor:getRaycastActive()
end

function CItemGenerator:OnLoadState(state)
   if state.visible then
      self:setVisible(true)
   else
      self:setVisible(false)
   end
   if state.interactor ~= nil then
      self.interactor:setRaycastActive(state.interactor)
   end
   self:setMaterialVisible("highlight", false)
end

return {CItemGenerator=CItemGenerator}
