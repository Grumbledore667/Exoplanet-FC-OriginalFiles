local oo = require "loop.simple"
local ItemsData = (require "itemsData")
local Weather = (require "environment.weatherEffects")
local WeatherSystem = (require "environment.weather").WeatherSystem

local hlp = require "helpers"

local CBeacon = oo.class({
   animations =
   {
      legs =
      {
         open  = "Legs_Open",
         close = "Legs_Close",
      },
      lamp =
      {
         open  = "Lamp_Open",
         close = "Lamp_Close",
      },
      battaries =
      {
         open  = "Battaries_Open",
         close = "Battaries_Close",
      },
   },

   soundNames =
   {
      lamp =
      {
         open  = "beacon_lamp_open.wav",
         close = "beacon_lamp_close.wav",
      },
      battaries =
      {
         open  = "beacon_battary_open.wav",
         close = "beacon_battary_close.wav",
      },
   },

   lampMesh = nil,

   animRevert = nil,
   animNext   = nil,

   soundRevert = nil,
   soundNext   = nil,

   daytimeState = nil,

   canChangeState = true,
   waitingState   = nil,

   installer = nil,
})

function CBeacon:initWithParams( params )
   if ( not params ) then
      --log( "CBeacon:initWithParams - no params" )
      self.itemName = "beacon.itm"

      self.interactor = self:createAspect( "interactor" )
      self.interactor:setObject( self )
      self.interactor:setRaycastRadius( 100.0 )
      self.interactor:getPose():setParent( self:getPose() )
      self.interactor:getPose():resetLocalPose()
      self.interactor:getPose():setLocalPos( {x=0,y=50,z=0} )
      self.interactor:setRaycastActive( true )
   end

   if ( not self.omni ) then
      self.omni = self:createAspect( "omni" )
      self.omni:getPose():setParent( self:getPose() )
      self.omni:getPose():resetLocalPose()
      self.omni:getPose():setLocalPos( {x=0,y=300,z=0} )
      self.omni:setColor( {r=0.5,g=0.5,b=0.5} )
      self.omni:setRadius ( 1000 )
      self.omni:setVisible( false )
   end

   if ( not self.lampMesh ) then
      self.lampMesh = self:getMeshByName( "lights" )
      self.lampMesh:setMaterials( "solid_ns_mono" )
   end

   if ( not self.collision ) then
      self.collision = getScene():createEntity( "collision_box.sbg", "" )
      self.collision:getPose():setParent( self:getPose() )
      self.collision:getPose():resetLocalPose()
      self.collision:getPose():setLocalScale( {x=0.1,y=2.0,z=0.1} )
   end

   if ( not self.sounds ) then
      local instances = {}

      self.sounds = { lamp = {}, battaries = {}, }

      self.sounds.lamp.open = self:createAspect( self.soundNames.lamp.open )
      instances[#instances+1] = self.sounds.lamp.open

      self.sounds.lamp.close = self:createAspect( self.soundNames.lamp.close )
      instances[#instances+1] = self.sounds.lamp.close

      self.sounds.battaries.open = self:createAspect( self.soundNames.battaries.open )
      instances[#instances+1] = self.sounds.battaries.open

      self.sounds.battaries.close = self:createAspect( self.soundNames.battaries.close )
      instances[#instances+1] = self.sounds.battaries.close

      for i=1,#instances do
         instances[i]:getPose():setParent( self:getPose() )
         instances[i]:getPose():resetLocalPose()
         instances[i]:getPose():setLocalPos( {x=0,y=100,z=0} )
         instances[i]:setLoop( false )
         instances[i]:setDistance( 1500 )
      end
   end
end

function CBeacon:OnCreate()
   --log( "CBeacon:OnCreate" )

   self:initWithParams( nil )

   WeatherSystem:subscribeDaytimeChange( self.switchDayState, self )
   self:subscribeAnimationStop( self.animStop, self )
   self:switchDayState( WeatherSystem.activeTags.timeState )
   self:playAnimation ( self.animations.legs.open, false )
end

function CBeacon:OnDestroy()
   WeatherSystem:unsubscribeDaytimeChange( self.switchDayState, self )

   --log( "CBeacon:OnDestroy" )
   getScene():destroyEntity( self.collision )

   if self.installer then
      self.installer:removeInstallation(self)
   end
end

function CBeacon:switchDayState( state )
   --log( "CBeacon:switchDayState" )

   if ( not state ) then
      return
   end

   if ( (self.daytimeState == Weather.DT_MORNING or self.daytimeState == Weather.DT_AFTERNOON) and
      (state == Weather.DT_MORNING or state == Weather.DT_AFTERNOON) ) then
      return
   end

   if ( (self.daytimeState == Weather.DT_EVENING or self.daytimeState == Weather.DT_MIDNIGHT) and
      (state == Weather.DT_EVENING or state == Weather.DT_MIDNIGHT) ) then
      return
   end

   if ( not self.canChangeState ) then
      self.waitingState = state
      return
   end

   self.daytimeState = state

   if ( self.animRevert ) then
      runTimer( 1 + rand(1), self, self.revertAnim, false )
   else
      runTimer( 1 + rand(1), self, self.switchDayAnim, false )
   end

   self.canChangeState = false
end

function CBeacon:revertAnim()
   self.soundRevert:play()

   self:playAnimation( self.animRevert, false )

   if ( self.animRevert == self.animations.lamp.close ) then
      self.omni:setVisible( false )
      self.lampMesh:setMaterials( "solid_ns_mono" )
   end
end

function CBeacon:switchDayAnim()
   if ( self.daytimeState == Weather.DT_MORNING or self.daytimeState == Weather.DT_AFTERNOON ) then
      self.soundNext   = self.sounds.battaries.open
      self.soundRevert = self.sounds.battaries.close

      self.animNext   = self.animations.battaries.open
      self.animRevert = self.animations.battaries.close
   else
      self.soundNext   = self.sounds.lamp.open
      self.soundRevert = self.sounds.lamp.close

      self.animNext   = self.animations.lamp.open
      self.animRevert = self.animations.lamp.close
   end
   self.soundNext:play()
   self:playAnimation( self.animNext, false )
end

function CBeacon:animStop( name )
   if ( self.animRevert and self.animRevert == name ) then
      self.animRevert = nil
      self:switchDayAnim()
   end

   if ( name == self.animations.lamp.open ) then
      self.omni:setVisible( true )
      self.lampMesh:setMaterials( "default_ns_mono_glow" )

      self.canChangeState = true

      if ( self.waitingState ) then
         self:switchDayState( self.waitingState )
         self.waitingState = nil
      end
   end

   if ( name == self.animations.battaries.open ) then
      self.canChangeState = true

      if ( self.waitingState ) then
         self:switchDayState( self.waitingState )
         self.waitingState = nil
      end
   end
end

function CBeacon:getType()
   return "pickup"
end

function CBeacon:getLabel()
   return "'Sunflower' lamp"
end

function CBeacon:getLabelPos()
   return vec3Add(self:getPose():getPos(), {y=175})
end

function CBeacon:getInteractLabel()
   return "deinstall"
end

function CBeacon:getInteractTime( interactType )
   return 1
end

function CBeacon:getAsItem()
   local item = hlp.safeCreateItemWithModel( self.itemName, ItemsData.getItemClass(self.itemName) )

   if ( item ) then
      getScene():destroyEntity( self )
      item:setVisible( false )
      return item
   else
      log( "Can't create " .. self.itemName )
      return nil
   end
end

function CBeacon:setInstaller(obj)
   self.installer = obj
end

function CBeacon:OnSaveState(state)
   if self.installer then
      local pos = self:getPose():getPos()
      state.pos = {x=pos.x, y=pos.y, z=pos.z}
   end
end

function CBeacon:OnLoadState(state)
   if self.installer then
      if state.pos then
         self:getPose():setPos(state.pos)
      end
   end
end

return {CBeacon=CBeacon}
