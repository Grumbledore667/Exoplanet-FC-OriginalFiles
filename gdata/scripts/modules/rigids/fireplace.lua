local oo = require "loop.simple"
local CRestCamp = (require "rigids.restCamp").CRestCamp
local ItemsData = (require "itemsData")

local CFireplace = oo.class({installer = nil}, CRestCamp)

function CFireplace:initWithParams( params )
   CRestCamp.initWithParams( self, params )

   self.damage = 8
   self.damageInterval = 0.5

   self.chars = {}

   self.distance = 40

   self.interactor:setTriggerRadius( self.distance )

   if ( not self.effects ) then
      self.effects = {}
      self.effects.fire_base = self:createAspect( "camp_fire_base.sps" )
      self.effects.fire_base:getPose():setParent( self:getPose() )
      self.effects.fire_base:getPose():resetLocalPose()
      -- self.effects.fire_base:getPose():setLocalPos( {y=-15} )
      self.effects.fire_base:getPose():setLocalScale( {x=0.9, y=0.9, z=0.9} )
      self.effects.fire_base:enable()

      self.effects.fire_main = self:createAspect( "camp_fire_main.sps" )
      self.effects.fire_main:getPose():setParent( self:getPose() )
      self.effects.fire_main:getPose():resetLocalPose()
      self.effects.fire_main:getPose():setLocalPos( {y=15} )
      self.effects.fire_main:getPose():setLocalScale( {x=0.9, y=0.9, z=0.9} )
      self.effects.fire_main:enable()

      self.effects.fire_smoke = self:createAspect( "camp_fire_smoke.sps" )
      self.effects.fire_smoke:getPose():setParent( self:getPose() )
      self.effects.fire_smoke:getPose():resetLocalPose()
      self.effects.fire_smoke:getPose():setLocalPos( {y=20} )
      self.effects.fire_smoke:getPose():setLocalScale( {x=0.9, y=0.9, z=0.9} )
      self.effects.fire_smoke:enable()

      self.effects.fire_sparks = self:createAspect( "camp_fire_sparks.sps" )
      self.effects.fire_sparks:getPose():setParent( self:getPose() )
      self.effects.fire_sparks:getPose():resetLocalPose()
      -- self.effects.fire_sparks:getPose():setLocalPos( {y=15} )
      self.effects.fire_sparks:getPose():setLocalScale( {x=0.9, y=0.9, z=0.9} )
      self.effects.fire_sparks:enable()

      self.effects.omni = self:createAspect( "omni" )
      self.effects.omni:getPose():setParent( self:getPose() )
      self.effects.omni:getPose():resetLocalPose()
      self.effects.omni:getPose():setLocalPos( {x=0,y=90,z=0} )
      self.effects.omni:setColor( {r=1.0,g=0.9,b=0.45} )
      self.effects.omni:setVisible  ( true )
      self.effects.omni:setRadius   ( 1000 )
      self.effects.omni:setIntensity( 0.6 )

      self.sounds = {}

      self.sounds.fire = self:createAspect( "fireplace.wav" )
      self.sounds.fire:setVolume  ( 3 )
      self.sounds.fire:setLoop    ( true )
      self.sounds.fire:setDistance( 600 )
      self.sounds.fire:getPose():setParent( self:getPose() )
      self.sounds.fire:getPose():resetLocalPose()
      self.sounds.fire:play()

      runTimer( 0.1, self, self.pulseOmni, true )
   end
end

function CFireplace:OnDestroy()
   if self.installer then
      self.installer:removeInstallation(self)
   end
end

function CFireplace:pulseOmni()
   local pulseSpeed = (math.sin( getGameTime()*5 ) * 0.5 + 0.5) * 10 + 20
   local intensity  = clamp( 1.0-vec3Length( getScene():getEnvirState():getDiffuse() ), 0.1, 1.0 )
   --log("i: " .. tostring(intensity))

   self.effects.omni:setIntensity( (0.7 + math.sin(getGameTime() * pulseSpeed * 1.5) * 0.1) * intensity )
end

function CFireplace:OnInteractTriggerBegin( obj )
   if objInDist(self:getPose():getPos(), obj:getPose():getPos(), self.distance) then
      self.chars[#self.chars+1] = obj
      if ( #self.chars > 0 and not self.timer and self.damage > 0 ) then
         self.timer = runTimer( self.damageInterval, self, self.impactDamage, true )
      end
   end
end

function CFireplace:OnInteractTriggerEnd( obj )
   for i=1,#self.chars do
      if ( self.chars[i] == obj ) then
         table.remove( self.chars, i )
         break
      end
   end
   if ( #self.chars == 0 and self.timer ) then
      self.timer:stop()
      self.timer = nil
   end
end

function CFireplace:impactDamage()
   for i=1,#self.chars do
      self.chars[i]:hit( self.damage, self )
   end
end

function CFireplace:setInstaller(obj)
   self.installer = obj
end

function CFireplace:getLabel()
   return "Campfire"
end

function CFireplace:OnSaveState(state)
   if self.installer then
      local pos = self:getPose():getPos()
      state.pos = {x=pos.x, y=pos.y, z=pos.z}
   end
end

function CFireplace:OnLoadState(state)
   if self.installer then
      if state.pos then
         self:getPose():setPos(state.pos)
      end
   end
end

return {CFireplace=CFireplace}
