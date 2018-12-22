local defaultDayTime = 2 --in radians, 1 is morning, 2 is noon

local SkySystem =
   {
      timeElapsed    = 0,
      dayFactor      = 0, -- -1..1 range
      dayFactorPrev  = 0, -- previous update (-1..1 range)
      timeRate       = 0.002 / 20, -- time speed
      dayRad         = defaultDayTime,   -- day in radians
      transitionRate = 1.5, -- speed of transition day/night

      atmosphereLow  = {r=1,g=1,b=1,a=1,},
      atmosphereHigh = {r=0,g=0,b=0,a=1,},

      sun =
      {
         name      = "sun.sbg",
         meshName  = "sun",
         texture   = "",
         materials = "",
         rigid     = nil,
         subRigid  = nil,
         radians   = defaultDayTime,
         factor    = 0,
      },
      moon =
      {
         name      = "sky_moon.sbg",
         meshName  = "moon",
         texture   = "",
         materials = "moon",
         rigid     = nil,
         subRigid  = nil,
         radians   = defaultDayTime,
         factor    = 0,
      },
      moon2 =
      {
         name      = "sky_moon2.sbg",
         meshName  = "moon001",
         texture   = "",
         materials = "moon",
         rigid     = nil,
         subRigid  = nil,
         radians   = defaultDayTime,
         factor    = 0,
      },

      subscribersDayStart       = {},
      subscribersNightStart     = {},
      subscribersAfternoonStart = {},
      subscribersMidnightStart  = {},

      noon = false,

      sky =
      {
         name  = "sky_desert_night.sbg",
         rigid = nil,
      },
   }

function SkySystem:init()
   self.sky.rigid = getScene():createEntity( self.sky.name, "" )
   self.sky.rigid:setMaterials( "sky" )
   self.sky.rigid:setReflected( true )

   self.sun.rigid = getScene():createEntity( self.sun.name, "" )
   if ( self.sun.rigid ) then
      if self.sun.texture   ~= "" then self.sun.rigid:setTexture  ( 0, self.sun.texture ) end
      if self.sun.materials ~= "" then self.sun.rigid:setMaterials( self.sun.materials  ) end
      self.sun.rigid:setVisible( true )
      self.sun.rigid:setReflected( true )
      self.sun.subRigid = self.sun.rigid:getMeshByName( self.sun.meshName )
   end

   self.moon2.rigid = getScene():createEntity( self.moon2.name, "" )
   if ( self.moon2.rigid ) then
      if self.moon2.texture   ~= "" then self.moon2.rigid:setTexture  ( 0, self.moon2.texture ) end
      if self.moon2.materials ~= "" then self.moon2.rigid:setMaterials( self.moon2.materials  ) end
      self.moon2.rigid:setVisible( true )
      self.moon2.rigid:setReflected( true )
      self.moon2.rigid:getPose():setScale( {x=5.0,y=5.0,z=5.0} )
      self.moon2.subRigid = self.moon2.rigid:getMeshByName( self.moon2.meshName )
   end

   self.moon.rigid = getScene():createEntity( self.moon.name, "" )
   if ( self.moon.rigid ) then
      if self.moon.texture   ~= "" then self.moon.rigid:setTexture  ( 0, self.moon.texture ) end
      if self.moon.materials ~= "" then self.moon.rigid:setMaterials( self.moon.materials  ) end
      self.moon.rigid:setVisible( true )
      self.moon.rigid:setReflected( true )
      --self.moon.rigid:getPose():setScale( {x=5.0,y=5.0,z=5.0} )
      self.moon.subRigid = self.moon.rigid:getMeshByName( self.moon.meshName )
   end
end

function SkySystem:setTimeRate( rate )
   self.timeRate = rate
end

function SkySystem:changeTimeRate( delta )
   self.timeRate = self.timeRate + delta
   if ( self.timeRate < 0 ) then
      self.timeRate = 0.002
   end
end

function SkySystem:setAtmosphereLow( color )
   self.atmosphereLow = color
   self.sky.rigid:setMaterialParam( "paramAtmosphereLow" , self.atmosphereLow )

   self.sun.rigid:setMaterialParam  ( "paramAtmosphereLow" , self.atmosphereLow )
   self.moon.rigid:setMaterialParam ( "paramAtmosphereLow" , self.atmosphereLow )
   self.moon2.rigid:setMaterialParam( "paramAtmosphereLow" , self.atmosphereLow )
end

function SkySystem:setAtmosphereHigh( color )
   self.atmosphereHigh = color
   self.sky.rigid:setMaterialParam( "paramAtmosphereHigh", self.atmosphereHigh )

   self.sun.rigid:setMaterialParam  ( "paramAtmosphereHigh" , self.atmosphereHigh )
   self.moon.rigid:setMaterialParam ( "paramAtmosphereHigh" , self.atmosphereHigh )
   self.moon2.rigid:setMaterialParam( "paramAtmosphereHigh" , self.atmosphereHigh )
end

function SkySystem:updateSky()
   -- starting day
   if ( self.dayFactorPrev <= 0.0 and self.dayFactor > 0.0 ) then
      self.noon = false

      for i=1,#self.subscribersDayStart do
         local func = self.subscribersDayStart[i][1]
         local obj  = self.subscribersDayStart[i][2]
         func( obj )
      end
   end

   -- starting night
   if ( self.dayFactorPrev >= 0.0 and self.dayFactor < 0.0 ) then
      self.noon = false

      for i=1,#self.subscribersNightStart do
         local func = self.subscribersNightStart[i][1]
         local obj  = self.subscribersNightStart[i][2]
         func( obj )
      end
   end

   -- starting afternoon
   if ( self.dayFactorPrev <= 1.0 and
      self.dayFactor     < 1.0 and
      self.dayFactorPrev > self.dayFactor and
      self.dayFactor     > 0.0 and
      not self.noon ) then

      self.noon = true

      for i=1,#self.subscribersAfternoonStart do
         local func = self.subscribersAfternoonStart[i][1]
         local obj  = self.subscribersAfternoonStart[i][2]
         func( obj )
      end
   end

   -- starting midnight
   if ( self.dayFactorPrev >= -1.0 and
      self.dayFactor     > -1.0 and
      self.dayFactorPrev < self.dayFactor and
      self.dayFactor     < 0.0 and
      not self.noon ) then

      self.noon = true

      for i=1,#self.subscribersMidnightStart do
         local func = self.subscribersMidnightStart[i][1]
         local obj  = self.subscribersMidnightStart[i][2]
         func( obj )
      end
   end
end

function SkySystem:updateSun( dt )
   if ( not self.sun.rigid ) then
      return
   end

   local pose = self.sun.rigid:getPose()

   self.sun.radians        = self.sun.radians + math.pi * 2.0 * dt
   self.sun.radiansShifted = self.sun.radians - math.pi * 0.25 / self.transitionRate
   self.sun.factor         = math.sin( self.sun.radiansShifted )

   local angle = math.deg( self.sun.radiansShifted )

   pose:setRot( {x=0, y=-20, z=angle} )
   --pose:setRot( {x=0, y=70, z=angle} )
end

function SkySystem:updateMoon( dt )
   if ( not self.moon.rigid ) then
      return
   end

   local pose = self.moon.rigid:getPose()

   self.moon.radians        = self.moon.radians + math.pi * 2.0 * dt * 1.5
   self.moon.radiansShifted = self.moon.radians - math.pi * 0.25 / self.transitionRate
   self.moon.factor         = math.sin( self.moon.radiansShifted )

   local angle  = math.deg( self.moon.radiansShifted )
   local euler  = { x=45, y=0, z=angle-60 }
   local objPos = vec3RotateEuler( {x=250,y=0,z=0}, euler )
   --objPos = vec3RotateEuler( objPos, { x=0, y=0, z=30 } )

   pose:setPos( objPos )
   pose:setRot( { x=-angle*0.8, y=0, z=0 } )

   local sunDir  = vec3Normalize( self.sun.subRigid:getPose():getPos()  )
   local moonDir = vec3Normalize( self.moon.subRigid:getPose():getPos() )

   --local horizontFactor = clamp(dotProduct( {x=0,y=-1,z=0}, sunDir ), 0, 1)
   --local factor = mixF( 1.0-(dotProduct(sunDir, moonDir)*0.5+0.5), 1.0, horizontFactor )
   local factor = 1.0-(dotProduct(sunDir, moonDir)*0.5+0.5)
   factor = factor * factor

   self.moon.rigid:setMaterialParam( "paramSunDir", sunDir )

   self.moon.factor = math.min( self.moon.factor, factor )
end

function SkySystem:updateMoon2( dt )
   if ( not self.moon2.rigid ) then
      return
   end

   local pose = self.moon2.rigid:getPose()

   self.moon2.radians        = self.moon2.radians + math.pi * 2.0 * dt * 0.8
   self.moon2.radiansShifted = self.moon2.radians - math.pi * 0.25 / self.transitionRate
   self.moon2.factor         = math.sin( self.moon2.radiansShifted )

   local angle  = math.deg( self.moon2.radiansShifted )
   local euler  = { x=70, y=0, z=angle+10 }
   local objPos = vec3RotateEuler( {x=400,y=0,z=0}, euler )
   --objPos = vec3RotateEuler( objPos, { x=0, y=0, z=70 } )

   pose:setPos( objPos )
   pose:setRot( { x=-angle*0.5, y=0, z=0 } )

   local sunDir  = vec3Normalize( self.sun.subRigid:getPose():getPos()  )
   local moonDir = vec3Normalize( self.moon2.subRigid:getPose():getPos() )

   --local horizontFactor = clamp(dotProduct( {x=0,y=-1,z=0}, sunDir ), 0, 1)
   --local factor = mixF( 1.0-(dotProduct(sunDir, moonDir)*0.5+0.5), 1.0, horizontFactor )
   local factor = 1.0-(dotProduct(sunDir, moonDir)*0.5+0.5)
   factor = factor * factor

   self.moon2.rigid:setMaterialParam( "paramSunDir", sunDir )

   self.moon2.factor = math.min( self.moon2.factor, factor )
end

function SkySystem:update( dt )
   dt                 = dt * self.timeRate
   self.timeElapsed   = self.timeElapsed + dt
   self.dayRad        = self.dayRad + (math.pi * 2.0 * dt)
   self.dayFactorPrev = self.dayFactor
   self.dayFactor     = math.sin( self.dayRad )

   self:updateSky()
   self:updateSun( dt )
   self:updateMoon( dt )
   self:updateMoon2( dt )
end

function SkySystem:subscribeDayStart( func, object )
   self.subscribersDayStart[#self.subscribersDayStart+1] = {func, object}
end

function SkySystem:subscribeNightStart( func, object )
   self.subscribersNightStart[#self.subscribersNightStart+1] = {func, object}
end

function SkySystem:subscribeAfternoonStart( func, object )
   self.subscribersAfternoonStart[#self.subscribersAfternoonStart+1] = {func, object}
end

function SkySystem:subscribeMidnightStart( func, object )
   self.subscribersMidnightStart[#self.subscribersMidnightStart+1] = {func, object}
end

function SkySystem:getDayFactor()
   local factor = math.abs( self.dayFactor ) * self.transitionRate

   if ( factor > 1 ) then factor = 1 end

   if ( self.dayFactor > 0 ) then
      return factor
   else
      return 1.0-factor
   end
end

function SkySystem:getSunPos()
   return vec3Normalize( self.sun.subRigid:getPose():getPos() )
end

function SkySystem:getMoonPos()
   return vec3Normalize( self.moon.subRigid:getPose():getPos() )
end

function SkySystem:getSunFactor()
   return clamp( self.sun.factor, 0, 1 )
end

function SkySystem:getMoonFactor()
   return clamp( self.moon.factor, 0, 1 )
end

-- manual use
function SkySystem:OnSaveState(state)
   state.timeElapsed    = self.timeElapsed
   state.dayFactor      = self.dayFactor
   state.dayFactorPrev  = self.dayFactorPrev
   state.timeRate       = self.timeRate
   state.dayRad         = self.dayRad
   state.transitionRate = self.transitionRate
   state.noon           = self.noon

   state.atmLow  = self.atmosphereLow
   state.atmHigh = self.atmosphereHigh

   local sun   = {}
   local moon  = {}
   local moon2 = {}

   sun.radians   = self.sun.radians
   sun.factor    = self.sun.factor
   moon.radians  = self.moon.radians
   moon.factor   = self.moon.factor
   moon2.radians = self.moon2.radians
   moon2.factor  = self.moon2.factor

   state.sun     = sun
   state.moon    = moon
   state.moon2   = moon2
end

function SkySystem:OnLoadState(state)
   if state == nil then
      return
   end
   local vars = {
      "timeElapsed",
      "dayFactor",
      "dayFactorPrev",
      "timeRate",
      "dayRad",
      "transitionRate",
      "noon",
   }

   for k,v in pairs(vars) do
      if state[v] ~= nil then
         self[v] = state[v]
      end
   end

   if state.atmLow then
      self.atmosphereLow = tableDeepCopy(state.atmLow)
   end


   if state.atmHigh then
      self.atmosphereHigh = tableDeepCopy(state.atmHigh)
   end

   for k,v in pairs({"sun", "moon", "moon2"}) do
      if state[v] then
         self[v].radians = state[v].radians
         self[v].factor = state[v].factor
      end
   end
end

return {SkySystem=SkySystem}
