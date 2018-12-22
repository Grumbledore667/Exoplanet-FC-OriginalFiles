local SkySystem = (require "environment.sky").SkySystem
local Weather   = (require "environment.weatherEffects")

local random = require "random"

local f = require "fun"
local partial = f.partial

local tablex = require "pl.tablex"

local WeatherSystem =
   {
      timeRate       = 1.0, -- time speed
      changeSpeed    = 0.01, -- weather change speed 100 seconds
      changeLight    = 0,
      previousData   = nil,
      activeData     = nil,
      genTimer       = nil,
      genWeatherTime = { min = 60, max = 120 },
      prevClouds     = {},

      activeTags =
      {
         dayState  = Weather.WT_DAY,
         wetState  = Weather.WT_DRY,
         windState = Weather.WT_CALM,

         timeState = Weather.DT_MORNING,
      },

      effects = Weather.Effects,
   }

function WeatherSystem:init()
   self:setWeatherTransitionTime(100)

   for i=1,#self.effects.clouds do
      local object = self.effects.clouds[i]
      if object.name ~= "" then
         object.rigid = getScene():createEntity(object.name, "")
         if object.rigid then
            object.rigid:setVisible(false)
            object.rigid:setReflected(true)
         end
      end
   end

   SkySystem:subscribeDayStateChange("all",   partial(self.onDayStateStart, self))
   SkySystem:subscribeFastForwardTime(partial(self.onFastForwardTime, self))

   local envir = getScene():getEnvirState()

   self.prevFog = {}
   self.prevFog.color   = envir:getFogColor()
   self.prevFog.near    = envir:getFogNear()
   self.prevFog.far     = envir:getFogFar()
   self.prevFog.density = envir:getFogDensity()

   --self:changeWeather()
   self:generateWeather()

   -- rewind init time for weather
   for i=0,10 do
      self:update(i)
   end
end

function WeatherSystem:changeTimeRate(delta)
   self.timeRate = self.timeRate + delta
   if self.timeRate < 1 then
      self.timeRate = 1
   end
end

function WeatherSystem:setWeatherTransitionTime(transitionTime)
   self.changeSpeed = 1 / transitionTime
end

function WeatherSystem:getWeatherTransitionTime()
   return 1 / self.changeSpeed
end

function WeatherSystem:onDayStateStart(dayState)
   if dayState == "morning" then
      self.activeTags.dayState  = Weather.WT_DAY
      self.activeTags.timeState = Weather.DT_MORNING
      self:changeWeather()
   elseif dayState == "afternoon" then
      self.activeTags.dayState  = Weather.WT_DAY
      self.activeTags.timeState = Weather.DT_AFTERNOON
   elseif dayState == "night" then
      self.activeTags.dayState  = Weather.WT_NIGHT
      self.activeTags.timeState = Weather.DT_EVENING
      self:changeWeather()
   elseif dayState == "midnight" then
      self.activeTags.dayState  = Weather.WT_NIGHT
      self.activeTags.timeState = Weather.DT_MIDNIGHT
   end
end

function WeatherSystem:onFastForwardTime(event, ...)
   --TODO:FIXME: a hack to try and change the weather and sky faster
   self:onDayStateStart(SkySystem:getPrevDayState())
   self:changeWeather()
   self:update(self:getWeatherTransitionTime())

   self:onDayStateStart(SkySystem:getDayState())
   self:update(SkySystem:getDayStateTimePassed():getAs("rSecond"))
end

function WeatherSystem:update(dt)
   local ignoreClouds = false
   if dt == self:getWeatherTransitionTime() then ignoreClouds = true end
   dt = dt * self.timeRate

   if self.activeData and self.activeData.opacity < 1 then
      self.activeData.opacity = clamp((self.activeData.opacity + self.changeSpeed * dt), 0.0, 1.0)
      --log("weather opacity = " .. tostring(self.activeData.opacity))

      if self.activeData.light then
         if self.previousData and self.previousData.light then
            self.activeData.light.ambient = vecMix(self.previousData.light.ambient, self.activeData.lightRef.ambient, self.activeData.opacity)
            self.activeData.light.ambientLow = vecMix(self.previousData.light.ambientLow, self.activeData.lightRef.ambientLow, self.activeData.opacity)
            self.activeData.light.ambientHigh = vecMix(self.previousData.light.ambientHigh, self.activeData.lightRef.ambientHigh, self.activeData.opacity)
            self.activeData.light.diffuse = vecMix(self.previousData.light.diffuse, self.activeData.lightRef.diffuse, self.activeData.opacity)
            self.activeData.light.intensity = mixF(self.previousData.light.intensity, self.activeData.lightRef.intensity, self.activeData.opacity)

            self.activeData.light.atmosphereLow  = vecMix(self.previousData.light.atmosphereLow, self.activeData.lightRef.atmosphereLow, self.activeData.opacity)
            self.activeData.light.atmosphereHigh = vecMix(self.previousData.light.atmosphereHigh, self.activeData.lightRef.atmosphereHigh, self.activeData.opacity)
            --self.activeData.light.atmosphereHigh = {r=0,g=0,b=0,a=1,}
            --self.activeData.light.atmosphereHigh = self.activeData.lightRef.atmosphereHigh
            --log("atmosphereHigh opacity " .. tostring(self.activeData.opacity))
         else
            self.activeData.light.ambient = self.activeData.lightRef.ambient
            self.activeData.light.ambientLow = self.activeData.lightRef.ambientLow
            self.activeData.light.ambientHigh = self.activeData.lightRef.ambientHigh
            self.activeData.light.diffuse = self.activeData.lightRef.diffuse
            self.activeData.light.intensity = self.activeData.lightRef.intensity

            self.activeData.light.atmosphereLow  = self.activeData.lightRef.atmosphereLow
            self.activeData.light.atmosphereHigh = self.activeData.lightRef.atmosphereHigh
         end
      end

      if self.activeData.bloom then
         if self.previousData and self.previousData.bloom then
            self.activeData.bloom.intensity = mixF(self.previousData.bloom.intensity, self.activeData.bloomRef.intensity, self.activeData.opacity)
         else
            self.activeData.bloom.intensity = self.activeData.bloomRef.intensity
         end
      end

      if self.activeData.shafts then
         if self.previousData and self.previousData.shafts then
            self.activeData.shafts.color       = vecMix(self.previousData.shafts.color,       self.activeData.shaftsRef.color,       self.activeData.opacity)
            self.activeData.shafts.intensity   = mixF  (self.previousData.shafts.intensity,   self.activeData.shaftsRef.intensity,   self.activeData.opacity)
            self.activeData.shafts.attenuation = mixF  (self.previousData.shafts.attenuation, self.activeData.shaftsRef.attenuation, self.activeData.opacity)
            self.activeData.shafts.length      = mixF  (self.previousData.shafts.length,      self.activeData.shaftsRef.length,      self.activeData.opacity)
         else
            self.activeData.shafts.color       = self.activeData.shaftsRef.color
            self.activeData.shafts.intensity   = self.activeData.shaftsRef.intensity
            self.activeData.shafts.attenuation = self.activeData.shaftsRef.attenuation
            self.activeData.shafts.length      = self.activeData.shaftsRef.length
         end
      end

      --log("clouds opacity = " .. tostring(self.activeData.clouds))
      --log("clouds opacity2 = " .. tostring(self.previousData.clouds))
      if self.activeData.clouds and self.activeData.clouds.opacity < 1.0 then
         self.activeData.clouds.opacity = self.activeData.clouds.opacity + self.changeSpeed * dt
         self.activeData.clouds.rigid:setMaterialParam("paramOpacity", self.activeData.clouds.opacity)
         --log("clouds opacity = " .. tostring(self.activeData.clouds.opacity))
      end

      if self.activeData.fog then
         if self.previousData and self.previousData.fog then
            self.activeData.fog.color   = vecMix(self.previousData.fog.color,   self.activeData.fogRef.color,   self.activeData.opacity)
            self.activeData.fog.near    = mixF  (self.previousData.fog.near,    self.activeData.fogRef.near,    self.activeData.opacity)
            self.activeData.fog.far     = mixF  (self.previousData.fog.far,     self.activeData.fogRef.far,     self.activeData.opacity)
            self.activeData.fog.density = mixF  (self.previousData.fog.density, self.activeData.fogRef.density, self.activeData.opacity)

            self.prevFog = self.activeData.fog
         else
            self.activeData.fog.color   = vecMix(self.prevFog.color,   self.activeData.fogRef.color,   self.activeData.opacity)
            self.activeData.fog.near    = mixF  (self.prevFog.near,    self.activeData.fogRef.near,    self.activeData.opacity)
            self.activeData.fog.far     = mixF  (self.prevFog.far,     self.activeData.fogRef.far,     self.activeData.opacity)
            self.activeData.fog.density = mixF  (self.prevFog.density, self.activeData.fogRef.density, self.activeData.opacity)
         end
      else
         self.activeData.fog    = self.prevFog
         self.activeData.fogRef = self.prevFog
      end

      if self.activeData.opacity >= 1 then
         self.activeData.opacity = 1
         self.previousData       = nil
      end
   end

   if not ignoreClouds then
      for i=1,#self.prevClouds do
         if self.prevClouds[i].opacity > 0 then
            self.prevClouds[i].opacity = self.prevClouds[i].opacity - self.changeSpeed * dt

            if self.prevClouds[i].opacity > 0 then
               self.prevClouds[i].rigid:setMaterialParam("paramOpacity", self.prevClouds[i].opacity)
            else
               self.prevClouds[i].rigid:setVisible(false)
               table.remove(self.prevClouds, i)
               break
            end
         end
      end
   end

   self:updateEnvirState(dt)
end

function WeatherSystem:updateEnvirState(dt)
   local envir         = getScene():getEnvirState()
   local sunFactor     = SkySystem:getSunFactor()
   local moonFactor    = SkySystem:getMoonFactor() * (1.0-sunFactor)
   local diffuseFactor = math.max(sunFactor, moonFactor)

   if not SkySystem:isSunVisible() then
      envir:setLightPos(SkySystem:getMoonPos())
      if diffuseFactor > self.changeLight then
         self.changeLight = self.changeLight + 0.25 * dt
         diffuseFactor    = self.changeLight
      end
   else
      envir:setLightPos(SkySystem:getSunPos())
      self.changeLight = 0
   end

   if self.activeData.light then
      envir:setAmbient    (self.activeData.light.ambient)
      envir:setAmbientLow (self.activeData.light.ambientLow)
      envir:setAmbientHigh(self.activeData.light.ambientHigh)
      envir:setDiffuse    (vec3Mul(self.activeData.light.diffuse, diffuseFactor))
      envir:setLightIntensity(self.activeData.light.intensity)

      SkySystem:setAtmosphereLow (self.activeData.light.atmosphereLow)
      SkySystem:setAtmosphereHigh(self.activeData.light.atmosphereHigh)
   end

   if self.activeData.bloom then
      envir:setBloomIntensity(self.activeData.bloom.intensity)
   end

   if self.activeData.shafts then
      envir:setShaftsColor      (self.activeData.shafts.color)
      envir:setShaftsIntensity  (self.activeData.shafts.intensity)
      envir:setShaftsAttenuation(self.activeData.shafts.attenuation)
      envir:setShaftsLength     (self.activeData.shafts.length)
   end

   if self.activeData.fog then
      envir:setFogColor  (self.activeData.fog.color)
      envir:setFogNear   (self.activeData.fog.near)
      envir:setFogFar    (self.activeData.fog.far)
      envir:setFogDensity(self.activeData.fog.density)
   end
end

function WeatherSystem:changeWeatherByTags(tags)
   local effectsList = { opacity = 0 }

   -- light
   local light = self:findEffects(tags, self.effects.light)
   if #light > 0 then
      effectsList.lightRef = random.choice(light)
      effectsList.light    = tablex.deepcopy(effectsList.lightRef)
   end

   -- bloom
   local bloom = self:findEffects(tags, self.effects.bloom)
   if #bloom > 0 then
      effectsList.bloomRef = random.choice(bloom)
      effectsList.bloom    = tablex.deepcopy(effectsList.bloomRef)
   end

   -- shafts
   local shafts = self:findEffects(tags, self.effects.shafts)
   if #bloom > 0 then
      effectsList.shaftsRef = random.choice(shafts)
      effectsList.shafts    = tablex.deepcopy(effectsList.shaftsRef)
   end

   -- clouds
   local clouds = self:findEffects(tags, self.effects.clouds)
   --log("clouds " .. tostring(#clouds))
   if #clouds > 0 then
      local selected = random.choice(clouds)
      if selected.rigid then
         if self.activeData and self.activeData.clouds then
            if self.activeData.clouds == selected then
               self.activeData.clouds = nil
               --log("active cloud = nil")
            end
         end

         selected.rigid:setVisible(true)
         effectsList.clouds = selected
         --log("---")
      end
   end

   if self.activeData and self.activeData.clouds then
      if self.activeData.clouds.opacity > 0 then
         self.prevClouds[#self.prevClouds+1] = self.activeData.clouds
      end
   end

   -- fog
   local fog = self:findEffects(tags, self.effects.fog)
   if #fog > 0 then
      effectsList.fogRef = random.choice(fog)
      effectsList.fog    = tablex.deepcopy(effectsList.fogRef)
   end

   self.previousData = self.activeData
   self.activeData   = effectsList
end

function WeatherSystem:generateWeather()
   self.activeTags.wetState  = random.random(Weather.WT_DRY,  Weather.WT_DUSTY)
   self.activeTags.windState = random.random(Weather.WT_CALM, Weather.WT_WINDY)

   --log("generateWeather " .. tostring(self.activeTags))

   self:changeWeather()
   self.genTimer = runTimer(random.random(self.genWeatherTime.min, self.genWeatherTime.max)/self.timeRate, self, self.generateWeather, false)
end

function WeatherSystem:changeWeather()
   local tags = {}

   for k,v in pairs(self.activeTags) do
      tags[#tags+1] = v
   end

   self:changeWeatherByTags(tags)
end

function WeatherSystem:findEffects(tags, effectsList)
   local effects = {}

   for i=1,#effectsList do
      local effectTags = effectsList[i].tags
      --log("weatherTags " .. tostring(tags))
      --log("effectTags " .. tostring(effectTags))
      local matchTags  = 0
      for j=1,#tags do
         for k=1,#effectTags do
            if tags[j] == effectTags[k] then
               matchTags = matchTags + 1
            end
         end
      end
      --log("matchTags = " .. tostring(matchTags))
      if matchTags == #tags or matchTags == #effectTags then
         effects[#effects+1] = effectsList[i]
      end
   end

   return effects
end

--manual use
-- TODO:FIXME: add saveload of prevClouds, genTimer, subscribers
function WeatherSystem:OnSaveState(state)
   state.timeRate = self.timeRate
   state.changeSpeed = self.changeSpeed
   state.changeLight = self.changeLight
   state.genWeatherTime = tablex.deepcopy(self.genWeatherTime)
   state.activeTags = tablex.deepcopy(self.activeTags)
   state.prevFog = tablex.deepcopy(self.prevFog)

   local effects = {}
   effects.light = tablex.deepcopy(self.effects.light)
   effects.bloom = tablex.deepcopy(self.effects.bloom)
   effects.shafts = tablex.deepcopy(self.effects.shafts)
   effects.fog = tablex.deepcopy(self.effects.fog)
   effects.view = tablex.deepcopy(self.effects.view)
   state.effects = effects

   if self.previousData then
      local previousData = {}
      previousData.light = tablex.deepcopy(self.previousData.light)
      previousData.bloom = tablex.deepcopy(self.previousData.bloom)
      previousData.shafts = tablex.deepcopy(self.previousData.shafts)
      previousData.fog = tablex.deepcopy(self.previousData.fog)
      previousData.view = tablex.deepcopy(self.previousData.view)
      state.previousData = previousData
   end

   if self.activeData then
      local activeData = {}
      activeData.light = tablex.deepcopy(self.activeData.light)
      activeData.bloom = tablex.deepcopy(self.activeData.bloom)
      activeData.shafts = tablex.deepcopy(self.activeData.shafts)
      activeData.fog = tablex.deepcopy(self.activeData.fog)
      activeData.view = tablex.deepcopy(self.activeData.view)
      state.activeData = activeData
   end
end

function WeatherSystem:OnLoadState(state)
   if state.timeRate ~= nil then
      self.timeRate = state.timeRate
   end
   if state.changeSpeed ~= nil then
      self.changeSpeed = state.changeSpeed
   end
   if state.changeLight ~= nil then
      self.changeLight = state.changeLight
   end
   if state.genWeatherTime then
      self.genWeatherTime = tablex.deepcopy(state.genWeatherTime)
   end
   if state.activeTags then
      self.activeTags = tablex.deepcopy(state.activeTags)
   end
   if state.prevFog then
      self.prevFog = tablex.deepcopy(state.prevFog)
   end

   if state.effects then
      if state.effects.light then
         self.effects.light = tablex.deepcopy(state.effects.light)
      end
      if state.effects.bloom then
         self.effects.bloom = tablex.deepcopy(state.effects.bloom)
      end
      if state.effects.shafts then
         self.effects.shafts = tablex.deepcopy(state.effects.shafts)
      end
      if state.effects.fog then
         self.effects.fog = tablex.deepcopy(state.effects.fog)
      end
      if state.effects.view then
         self.effects.view = tablex.deepcopy(state.effects.view)
      end
   end

   if state.previousData and self.previousData then
      if state.previousData.light then
         self.previousData.light = tablex.deepcopy(state.previousData.light)
      end
      if state.previousData.bloom then
         self.previousData.bloom = tablex.deepcopy(state.previousData.bloom)
      end
      if state.previousData.shafts then
         self.previousData.shafts = tablex.deepcopy(state.previousData.shafts)
      end
      if state.previousData.fog then
         self.previousData.fog = tablex.deepcopy(state.previousData.fog)
      end
      if state.previousData.view then
         self.previousData.view = tablex.deepcopy(state.previousData.view)
      end
   end

   if state.activeData and self.activeData then
      if state.activeData.light then
         self.activeData.light = tablex.deepcopy(state.activeData.light)
      end
      if state.activeData.bloom then
         self.activeData.bloom = tablex.deepcopy(state.activeData.bloom)
      end
      if state.activeData.shafts then
         self.activeData.shafts = tablex.deepcopy(state.activeData.shafts)
      end
      if state.activeData.fog then
         self.activeData.fog = tablex.deepcopy(state.activeData.fog)
      end
      if state.activeData.view then
         self.activeData.view = tablex.deepcopy(state.activeData.view)
      end
   end
end

return {WeatherSystem=WeatherSystem}
