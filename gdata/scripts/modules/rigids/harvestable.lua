local oo = require "loop.simple"
local ItemsData = (require "itemsData")

local hlp = require "helpers"

local CHarvestable = oo.class({})

local CBloodRoot = oo.class({}, CHarvestable)
local CKTharsianAloe = oo.class({}, CHarvestable)
local CStygmyanGoldenApple = oo.class({}, CHarvestable)
local CMelon = oo.class({}, CHarvestable)
local CBluethorn = oo.class({}, CHarvestable)

function CBluethorn:OnCreate()
   CHarvestable.OnCreate(self)
   self.interactor:setTriggerRadius(200)
end

function CBluethorn:getAsItem()
   local count = 0
   while count < 4 do
      local fruit = self:getReadyFruit()
      if fruit then
         self:cutFruit( fruit )
         count = count + 1
      else
         break
      end
   end

   local item = hlp.safeCreateItemWithoutModel( self.itemName, ItemsData.getItemClass(self.itemName) )

   if ( item ) then
      item:setVisible( false )
      if count > 0 then
         item.count = count
      end
      return item
   else
      log( "Can't create " .. self.itemName )
      return nil
   end
end

function CHarvestable:OnCreate()
   self.growTimerStep = 0.5
   if not isDebug("plants") then
      self.growTimerStep = 25 -- ~1.25 realtime hours
   end

   self.interactor = self:createAspect( "interactor" )
   self.interactor:setObject( self )
   self.interactor:setRaycastRadius( 100 )
   self.interactor:getPose():setParent( self:getPose() )
   self.interactor:getPose():resetLocalPose()
   self.interactor:getPose():setLocalPos( {x=0,y=0,z=0} )
   self.interactor:setRaycastActive( true )

   self.itemName = loadParam(self, "item", "")

   self.fruits = {}

   for i=1,10 do
      local meshGreen = self:getMeshByName( "fruit_green_" .. tostring(i) )
      local meshRipe  = self:getMeshByName( "fruit_ripe_" .. tostring(i) )

      if ( meshGreen and meshRipe ) then
         local fruit = {}
         fruit.green = meshGreen
         fruit.ripe  = meshRipe
         fruit.ready = true

         fruit.green:setVisible( false )

         self.fruits[#self.fruits + 1] = fruit
      else
         break
      end
   end

   self:addMaterial( "highlight" )
   self:setMaterialVisible( "highlight", false )
end

function CHarvestable:OnFocusBegin(obj)
   self:stopHighlightTimer()
   self:setMaterialVisible( "highlight", true )
end

function CHarvestable:OnFocusEnd(obj)
   self:stopHighlightTimer()
   self:setMaterialVisible( "highlight", false )
end

function CHarvestable:OnInteractHighlightBegin( obj )
   self:stopHighlightTimer()

   self.highlightTimer = runTimer( 2, self,
      function (obj)
         obj:setMaterialVisible( "highlight", false )
         obj.highlightTimer = nil
      end, false )

   self:setMaterialVisible( "highlight", true )
end

function CHarvestable:stopHighlightTimer()
   if ( self.highlightTimer ) then
      self.highlightTimer:stop()
      self.highlightTimer = nil
   end
end

function CHarvestable:getType()
   return "pickup"
end

function CHarvestable:getLabel()
   return ItemsData.getItemLabel( self.itemName )
end

function CHarvestable:getInteractLabel()
   return "harvest"
end

function CHarvestable:getReadyCount()
   local count = 0

   for i=1,#self.fruits do
      if ( self.fruits[i].ready ) then
         count = count + 1
      end
   end

   return count
end

function CHarvestable:getReadyFruit()
   local fruit = nil

   for i=1,#self.fruits do
      if ( self.fruits[i].ready ) then
         fruit = self.fruits[i]
         break
      end
   end

   return fruit
end

function CHarvestable:cutFruit( fruit )
   if fruit then
      fruit.scale = 0.1
      fruit.green:getPose():setScale( {x=fruit.scale,y=fruit.scale,z=fruit.scale} )
      fruit.green:setVisible( true )
      fruit.ripe:setVisible ( false )
      fruit.ready = false
   end

   if ( not self.growTimer ) then
      self.growTimer = runTimer( self.growTimerStep, self, self.stepRipeFruit, true )
   end

   if ( not self:getReadyFruit() ) then
      self.interactor:setRaycastActive( false )
   end
end

function CHarvestable:stepRipeFruit()
   local readyCount = 0

   for i=1,#self.fruits do
      local fruit = self.fruits[i]

      if ( not fruit.ready ) then
         fruit.scale = fruit.scale + 0.005

         if ( fruit.scale >= 1.0 ) then
            self:ripeFruit( fruit )
            readyCount = readyCount + 1
         else
            fruit.green:getPose():setScale( {x=fruit.scale,y=fruit.scale,z=fruit.scale} )
         end
      end
   end

   if ( readyCount == #self.fruits ) then
      self.growTimer:stop()
      self.growTimer = nil
   end
end

function CHarvestable:ripeFruit( fruit )
   fruit.green:setVisible( false )
   fruit.ripe:setVisible ( true )
   fruit.ready = true

   self.interactor:setRaycastActive( true )
end

function CHarvestable:getAsItem()
   self:cutFruit( self:getReadyFruit() )

   local item = hlp.safeCreateItemWithoutModel( self.itemName, ItemsData.getItemClass(self.itemName) )

   if ( item ) then
      item:setVisible( false )
      return item
   else
      log( "Can't create " .. self.itemName )
      return nil
   end
end

function CHarvestable:getInteractTime( interactType )
   return 0
end

function CHarvestable:getLootTable()
   local t = {}
   t[self.itemName] = #self.fruits
   return t
end

function CHarvestable:OnSaveState(state)
   local fruits = {}
   for k,v in pairs(self.fruits) do
      local fruit = {
         green = v.green:getVisible(),
         ripe  = v.ripe:getVisible(),
         ready = v.ready,
         scale = v.scale or 1,
      }
      table.insert(fruits, fruit)
   end
   state.fruits = fruits
   state.interactor = self.interactor:getRaycastActive()
end

function CHarvestable:OnLoadState(state)
   if state.interactor then
      self.interactor:setRaycastActive(true)
   else
      self.interactor:setRaycastActive(false)
   end

   if state.fruits and self.fruits then
      for i=1,#self.fruits do
         local fruit = self.fruits[i]
         fruit.ready = state.fruits[i].ready
         fruit.green:setVisible(state.fruits[i].green)
         fruit.ripe:setVisible(state.fruits[i].ripe)
         fruit.scale = state.fruits[i].scale
         fruit.green:getPose():setScale( {x=fruit.scale,y=fruit.scale,z=fruit.scale} )
      end
      self.growTimer = runTimer( self.growTimerStep, self, self.stepRipeFruit, true )
   end
   self:setMaterialVisible( "highlight", false )
end

return {
   CHarvestable=CHarvestable,
   CBloodRoot=CBloodRoot,
   CKTharsianAloe=CKTharsianAloe,
   CStygmyanGoldenApple=CStygmyanGoldenApple,
   CMelon=CMelon,
   CBluethorn=CBluethorn,
}
