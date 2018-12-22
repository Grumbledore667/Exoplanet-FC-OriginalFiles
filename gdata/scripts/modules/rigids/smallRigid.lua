local oo = require "loop.simple"
local ItemsData = (require "itemsData")

local hlp = require "helpers"

local CSmallRigid = oo.class({
   package = false,
   activated = false,
})

function CSmallRigid:OnCreate()
   self.itemName, self.itemCount = loadParamItemCountsGuessModelSingleItem(self, "itemName", {})
   self.interactor = self:createAspect( "interactor" )
   self.interactor:setObject( self )
   self.interactor:setTriggerRadius( 100 )
   self.interactor:setRaycastRadius( 100 )
   self.interactor:getPose():setParent( self:getPose() )
   self.interactor:getPose():resetLocalPose()
   if self.itemName and self.itemName ~= "" and ItemsData.isCorrectItemName(self.itemName) then
      self.interactor:setTriggerActive( true )
      self.interactor:setRaycastActive( true )
   else
      self.interactor:setTriggerActive( false )
      self.interactor:setRaycastActive( false )
   end
   if ( self.isMaterialHelper and not self:isMaterialHelper() ) then
      self:addMaterial( "highlight" )
      self:setMaterialVisible( "highlight", false )
   end
end

function CSmallRigid:OnInteractTriggerBegin( obj )
   if ( obj == getDefaultPlayer() ) then
      return
   end

   self:stopHighlightTimer()

   if ( self.setMaterialVisible ) then
      self:setMaterialVisible( "highlight", true )
   end

   gameplayUI:setFocusObj(self)
end

function CSmallRigid:OnInteractTriggerEnd( obj )
   if ( obj == getDefaultPlayer() ) then
      return
   end

   if ( self.setMaterialVisible ) then
      self:setMaterialVisible( "highlight", false )
   end

   if not self.package then
      self:setCollisionCharacters( true, false )
   end
   gameplayUI:setFocusObj(nil)
end

function CSmallRigid:OnFocusBegin( obj )
   self:stopHighlightTimer()

   if ( self.setMaterialVisible ) then
      self:setMaterialVisible( "highlight", true )
   end
end

function CSmallRigid:OnFocusEnd( obj )
   if ( self.setMaterialVisible ) then
      self:setMaterialVisible( "highlight", false )
   end
end

function CSmallRigid:OnInteractHighlightBegin( obj )
   if not self.setMaterialVisible then
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

function CSmallRigid:stopHighlightTimer()
   if ( self.highlightTimer ) then
      self.highlightTimer:stop()
      self.highlightTimer = nil
   end
end

function CSmallRigid:getAsItem()
   local item = hlp.safeCreateItemWithoutModel(self.itemName, ItemsData.getItemClass(self.itemName))

   if item then
      item:setVisible(false)
      self.activated = true

      self:setVisible( false )
      self:setCollisionObjects( false )

      self.interactor:setTriggerActive( false )
      self.interactor:setRaycastActive( false )

      return item
   else
      return nil
   end
end

function CSmallRigid:getLabel()
   return ItemsData.getItemLabel( self.itemName )
end

function CSmallRigid:getLabelPos()
   if getPlayer().ownerPlayer then
      return vec3Add(self:getPose():getPos(), {y=10})
   end
   return vec3Add(self:getPose():getPos(), {y=50})
end

function CSmallRigid:getInteractLabel()
   return "pick up"
end

function CSmallRigid:getType()
   return "pickup"
end

function CSmallRigid:OnSaveState(state)
   state.activated = self.activated
end

function CSmallRigid:OnLoadState(state)
   if state.activated ~= nil then
      self.activated = state.activated
   end
   if self.activated then
      self:setVisible( false )
      self.interactor:setTriggerActive( false )
      self.interactor:setRaycastActive( false )
      self:setCollisionObjects(false)

      self:setMaterialVisible( "highlight", false )
   end
end

return {CSmallRigid=CSmallRigid}
