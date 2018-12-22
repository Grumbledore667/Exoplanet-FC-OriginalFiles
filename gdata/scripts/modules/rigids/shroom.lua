local oo = require "loop.simple"

local hlp = require "helpers"
local ItemsData = (require "itemsData")
local CShroom = oo.class({})

function CShroom:OnCreate()
   self.growTimerStep = 0.1
   if not isDebug("plants") then
      self.growTimerStep = 25
   end

   self.itemName = "shroom_grenade.itm"

   self.interactor = self:createAspect( "interactor" )
   self.interactor:setObject( self )
   self.interactor:setRaycastRadius( 100 )
   self.interactor:getPose():setParent( self:getPose() )
   self.interactor:getPose():resetLocalPose()
   self.interactor:getPose():setLocalPos( {x=0,y=0,z=0} )
   self.interactor:setRaycastActive( false )

   self.broken = false
   local cageBrokenName = self:getPrefabName():gsub(".sbg", "_broken.sbg")
   self.cageBroken = getScene():createEntity( cageBrokenName, "")
   self.cageBroken:setPose( self:getPose() )
   self.cageBroken:setVisible( false )

   self.fruit = {}
   self.fruit.ready = true
   self.fruit.entity = getScene():createEntity( "shroom_grenade.sbg", "")
   self.fruit.entity:setPose( self:getPose() )
   self.fruit.scale = self:getPose():getScale()

   self.fruit.entity:addMaterial( "highlight" )
   self.fruit.entity:setMaterialVisible( "highlight", false )

   self.sounds = {}
   self.sounds.broken = self:createAspect( "shroom_cage_crash.wav" )
   self.sounds.broken:getPose():setParent( self:getPose() )
   self.sounds.broken:getPose():resetLocalPose()
   self.sounds.broken:setLoop( false )
   self.sounds.broken:setDistance( 3000 )

   self:setCollisionCharacters( false, false )
end

function CShroom:OnFocusBegin(obj)
   self:stopHighlightTimer()
   self.fruit.entity:setMaterialVisible( "highlight", true )
end

function CShroom:OnFocusEnd(obj)
   self:stopHighlightTimer()
   self.fruit.entity:setMaterialVisible( "highlight", false )
end

function CShroom:OnInteractHighlightBegin( obj )
   self:stopHighlightTimer()

   self.highlightTimer = runTimer( 2, self,
      function( self )
         self.fruit.entity:setMaterialVisible( "highlight", false )
         self.highlightTimer = nil
      end, false )

   self.fruit.entity:setMaterialVisible( "highlight", true )
end

function CShroom:stopHighlightTimer()
   if ( self.highlightTimer ) then
      self.highlightTimer:stop()
      self.highlightTimer = nil
   end
end

function CShroom:OnHit( params )
   if not self.broken then
      self.broken = true
      self:setVisible( false )
      self.cageBroken:setVisible( true )
      self.interactor:setRaycastActive( true )
      self.sounds.broken:play()
   end
end

function CShroom:getType()
   return "pickup"
end

function CShroom:getLabel()
   return "Stink Shroom"
end

function CShroom:getInteractLabel()
   return "pick up"
end

function CShroom:cutFruit()
   self.fruit.scale = { x = 0.05, y = 0.05, z = 0.05, }
   self.fruit.ready = false
   self.fruit.entity:getPose():setScale( {x=self.fruit.scale,y=self.fruit.scale,z=self.fruit.scale} )

   if ( not self.growTimer ) then
      self.growTimer = runTimer( self.growTimerStep, self, self.stepRipeFruit, true )
   end

   self.interactor:setRaycastActive( false )
end

function CShroom:stepRipeFruit()
   local targetScale = self:getPose():getScale()
   self.fruit.scale.x = self.fruit.scale.x + targetScale.x * 0.005
   self.fruit.scale.y = self.fruit.scale.y + targetScale.y * 0.005
   self.fruit.scale.z = self.fruit.scale.z + targetScale.z * 0.005

   if self.fruit.scale.y >= self:getPose():getScale().y then
      self.fruit.ready = true
      self.growTimer:stop()
      self.growTimer = nil

      self.broken = false
      self:setVisible( true )
      self.cageBroken:setVisible( false )
   else
      self.fruit.entity:getPose():setScale( { x=self.fruit.scale.x, y=self.fruit.scale.y, z=self.fruit.scale.z } )
   end
end

function CShroom:getAsItem()
   self:cutFruit()

   local item = hlp.safeCreateItemWithoutModel( self.itemName, ItemsData.getItemClass(self.itemName) )

   if ( item ) then
      item:setVisible( false )
      return item
   else
      log( "Can't create " .. self.itemName )
      return nil
   end
end

function CShroom:getInteractTime( interactType )
   return 1
end

function CShroom:getLootTable()
   return { [self.itemName] = 1 }
end

function CShroom:OnSaveState(state)
   state.fruit = {}
   state.fruit.ready = self.fruit.ready
   state.fruit.scale = self.fruit.scale
   state.interactor = self.interactor:getRaycastActive()
   state.broken = self.broken
end

function CShroom:OnLoadState(state)
   if state.interactor then
      self.interactor:setRaycastActive(true)
   else
      self.interactor:setRaycastActive(false)
   end

   if state.fruit then
      self.fruit.ready = state.fruit.ready
      self.fruit.scale = state.fruit.scale
      self.fruit.entity:getPose():setScale( { x=self.fruit.scale.x, y=self.fruit.scale.y, z=self.fruit.scale.z } )
      self.growTimer = runTimer( self.growTimerStep, self, self.stepRipeFruit, true )
   end

   self.broken = state.broken
   if self.broken then
      self:setVisible( self.fruit.ready )
      self.cageBroken:setVisible( not self.fruit.ready )
      if self.fruit.ready then
         self.interactor:setRaycastActive( true )
      end
   end
   self.fruit.entity:setMaterialVisible( "highlight", false )
end

return {
   CShroom=CShroom,
}
