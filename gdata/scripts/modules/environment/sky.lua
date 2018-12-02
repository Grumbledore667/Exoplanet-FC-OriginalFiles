local tablex = require "pl.tablex"
local CTime

local HOURS_PER_DAY = 24
local DEFAULT_DAY_HOUR = 12 --High noon
local TIME_SCALE = 20 --Times faster than real (1 in-game hour = 3 real minutes)

local SkySystem =
   {
      timeRate     = 1,                          --separate speed param

      dayStates = {
         morning   = {hour = 5,  started = false},
         afternoon = {hour = 12, started = false},
         night     = {hour = 18, started = false},
         midnight  = {hour = 0,  started = false}
      },

      dayState = "midnight",

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
         factor    = 0,
      },

      subscribersDayTime = {},
      subscribersDayStateChange = {},
      subscribersFastForwardTime = {},
      subscribersFastForwardTimeEnd = {},

      sky =
      {
         name  = "sky_desert_night.sbg",
         rigid = nil,
      },
   }

function SkySystem:init()
   CTime = (require "helpers").CTime

   self.timePassed = CTime(DEFAULT_DAY_HOUR * 3600, "gSecond")

   self.sky.rigid = getScene():createEntity(self.sky.name, "")
   self.sky.rigid:setMaterials("sky")
   self.sky.rigid:setReflected(true)

   self.sun.rigid = getScene():createEntity(self.sun.name, "")
   if self.sun.rigid then
      if self.sun.texture   ~= "" then self.sun.rigid:setTexture  (0, self.sun.texture) end
      if self.sun.materials ~= "" then self.sun.rigid:setMaterials(self.sun.materials ) end
      self.sun.rigid:setVisible(true)
      self.sun.rigid:setReflected(true)
      self.sun.subRigid = self.sun.rigid:getMeshByName(self.sun.meshName)
   end

   self.moon2.rigid = getScene():createEntity(self.moon2.name, "")
   if self.moon2.rigid then
      if self.moon2.texture   ~= "" then self.moon2.rigid:setTexture  (0, self.moon2.texture) end
      if self.moon2.materials ~= "" then self.moon2.rigid:setMaterials(self.moon2.materials ) end
      self.moon2.rigid:setVisible(true)
      self.moon2.rigid:setReflected(true)
      self.moon2.rigid:getPose():setScale({x=5.0,y=5.0,z=5.0})
      self.moon2.subRigid = self.moon2.rigid:getMeshByName(self.moon2.meshName)
   end

   self.moon.rigid = getScene():createEntity(self.moon.name, "")
   if self.moon.rigid then
      if self.moon.texture   ~= "" then self.moon.rigid:setTexture  (0, self.moon.texture) end
      if self.moon.materials ~= "" then self.moon.rigid:setMaterials(self.moon.materials ) end
      self.moon.rigid:setVisible(true)
      self.moon.rigid:setReflected(true)
      --self.moon.rigid:getPose():setScale({x=5.0,y=5.0,z=5.0})
      self.moon.subRigid = self.moon.rigid:getMeshByName(self.moon.meshName)
   end
end

function SkySystem:setAtmosphereLow(color)
   self.atmosphereLow = color
   self.sky.rigid:setMaterialParam("paramAtmosphereLow" , self.atmosphereLow)

   self.sun.rigid:setMaterialParam  ("paramAtmosphereLow" , self.atmosphereLow)
   self.moon.rigid:setMaterialParam ("paramAtmosphereLow" , self.atmosphereLow)
   self.moon2.rigid:setMaterialParam("paramAtmosphereLow" , self.atmosphereLow)
end

function SkySystem:setAtmosphereHigh(color)
   self.atmosphereHigh = color
   self.sky.rigid:setMaterialParam("paramAtmosphereHigh", self.atmosphereHigh)

   self.sun.rigid:setMaterialParam  ("paramAtmosphereHigh" , self.atmosphereHigh)
   self.moon.rigid:setMaterialParam ("paramAtmosphereHigh" , self.atmosphereHigh)
   self.moon2.rigid:setMaterialParam("paramAtmosphereHigh" , self.atmosphereHigh)
end

function SkySystem:update(dt)
   local secondsPassed = TIME_SCALE * dt * self.timeRate
   self.timePassed:inc(secondsPassed)

   self:updateSky()
   self:updateSun()
   self:updateMoon()
   self:updateMoon2()
end

function SkySystem:updateSky()
   local currentHour = self:getCurrentHour()
   if currentHour >= self:getDayStateHour("midnight") and currentHour < self:getDayStateHour("morning") then
      self:updateDayState("midnight")
   elseif currentHour >= self:getDayStateHour("morning") and currentHour < self:getDayStateHour("afternoon") then
      self:updateDayState("morning")
   elseif currentHour >= self:getDayStateHour("afternoon") and currentHour < self:getDayStateHour("night") then
      self:updateDayState("afternoon")
   elseif currentHour >= self:getDayStateHour("night") or currentHour < self:getDayStateHour("morning") then
      self:updateDayState("night")
   end
   --Call date subscribers (one-time)
   --And other repeating subs while altering their targetTime
   for _,callback in ipairs(self.subscribersDayTime) do
      if self:getTimePassed():getAs("gSecond") >= callback.targetTime:getAs("gSecond") then
         if not callback.repeatEvery then
            self:unsubscribeDayTime(callback)
         end
         callback.func(unpack(callback.args))
         if callback.repeatEvery then
            callback.targetTime:inc(CTime(1, callback.repeatEvery))
         end
      end
   end
end

function SkySystem:updateSun()
   if not self.sun.rigid then return end
   local pose = self.sun.rigid:getPose()
   local angle = -90 + 360 * (self:getDaySecondsPassed() / self:getSecondsPerDay())
   self.sun.factor = math.sin( math.rad(angle))

   pose:setRot({x=0, y=-20, z=angle})
   --pose:setRot({x=0, y=70, z=angle})
end

function SkySystem:updateMoon()
   if not self.moon.rigid then return end

   local pose = self.moon.rigid:getPose()

   local rotSpeed = 1.5 --1.5 faster than the sun
   local angle = -180 + 360 * (self.timePassed / self:getSecondsPerDay()) * rotSpeed
   self.moon.factor = math.sin( math.rad(angle))

   local euler  = { x=45, y=0, z=angle-60 }
   local objPos = vec3RotateEuler({x=250,y=0,z=0}, euler)
   --objPos = vec3RotateEuler(objPos, { x=0, y=0, z=30 })

   pose:setPos(objPos)
   pose:setRot({ x=-angle*0.8, y=0, z=0 })

   local sunDir  = vec3Normalize(self.sun.subRigid:getPose():getPos() )
   local moonDir = vec3Normalize(self.moon.subRigid:getPose():getPos())

   --local horizontFactor = clamp(dotProduct({x=0,y=-1,z=0}, sunDir), 0, 1)
   --local factor = mixF(1.0-(dotProduct(sunDir, moonDir)*0.5+0.5), 1.0, horizontFactor)
   local factor = 1.0-(dotProduct(sunDir, moonDir)*0.5+0.5)
   factor = factor * factor

   self.moon.rigid:setMaterialParam("paramSunDir", sunDir)

   self.moon.factor = math.min(self.moon.factor, factor)
end

function SkySystem:updateMoon2()
   if not self.moon2.rigid then return end

   local pose = self.moon2.rigid:getPose()

   local rotSpeed = 0.8 --slower than the sun
   local angle = -180 + 360 * (self.timePassed / self:getSecondsPerDay()) * rotSpeed
   self.moon.factor = math.sin( math.rad(angle))

   local euler  = { x=70, y=0, z=angle+10 }
   local objPos = vec3RotateEuler({x=400,y=0,z=0}, euler)
   --objPos = vec3RotateEuler(objPos, { x=0, y=0, z=70 })

   pose:setPos(objPos)
   pose:setRot({ x=-angle*0.5, y=0, z=0 })

   local sunDir  = vec3Normalize(self.sun.subRigid:getPose():getPos() )
   local moonDir = vec3Normalize(self.moon2.subRigid:getPose():getPos())

   --local horizontFactor = clamp(dotProduct({x=0,y=-1,z=0}, sunDir), 0, 1)
   --local factor = mixF(1.0-(dotProduct(sunDir, moonDir)*0.5+0.5), 1.0, horizontFactor)
   local factor = 1.0-(dotProduct(sunDir, moonDir)*0.5+0.5)
   factor = factor * factor

   self.moon2.rigid:setMaterialParam("paramSunDir", sunDir)

   self.moon2.factor = math.min(self.moon2.factor, factor)
end

function SkySystem:subscribeDayHour(hour, repeatEvery, func, ...)
   --Means we can't schedule this event today
   local timeUnit = CTime(hour, "gHour")
   if self:hasDayTimePassed(timeUnit) then
      timeUnit:inc(self:getHoursPerDay())
   end
   self:subscribeTimePassed(timeUnit, repeatEvery, func, ...)
end

function SkySystem:subscribeTimePassed(timeUnit, repeatEvery, func, ...)
   timeUnit = CTime(self:getTimePassed() + timeUnit, "gSecond")
   return self:subscribeDayTime(timeUnit, repeatEvery, func, ...)
end

function SkySystem:subscribeDayTime(timeUnit, repeatEvery, func, ...)
   if self:hasDatePassed(timeUnit) then return end
   local callback = { ["func"] = func, ["targetTime"] = timeUnit, ["repeatEvery"] = repeatEvery, ["args"] = table.pack(...) }
   table.insert(self.subscribersDayTime, callback)
   return callback
end

function SkySystem:unsubscribeDayTime(callback)
   if not callback then return end
   for i, v in ipairs(self.subscribersDayTime) do
      if v == callback then
         table.remove(self.subscribersDayTime, i)
         break
      end
   end
end

--A special way to subscribe to all/single dayState changes
function SkySystem:subscribeDayStateChange(dayState, func, ...)
   local callback = { ["func"] = func, ["dayState"] = dayState, ["args"] = table.pack(...) }
   table.insert(self.subscribersDayStateChange, callback)
   return callback
end

function SkySystem:unsubscribeDayStateChange(callback)
   if not callback then return end
   for i, v in ipairs(self.subscribersDayStateChange) do
      if v == callback then
         table.remove(self.subscribersDayStateChange, i)
         break
      end
   end
end

function SkySystem:subscribeFastForwardTime(func, ...)
   local callback = { ["func"] = func, ["args"] = table.pack(...) }
   table.insert(self.subscribersFastForwardTime, callback)
   return callback
end

function SkySystem:unsubscribeFastForwardTime(callback)
   if not callback then return end
   for i, v in ipairs(self.subscribersFastForwardTime) do
      if v == callback then
         table.remove(self.subscribersFastForwardTime, i)
         break
      end
   end
end

function SkySystem:subscribeFastForwardTimeEnd(func, ...)
   local callback = { ["func"] = func, ["args"] = table.pack(...) }
   table.insert(self.subscribersFastForwardTimeEnd, callback)
   return callback
end

function SkySystem:unsubscribeFastForwardTimeEnd(callback)
   if not callback then return end
   for i, v in ipairs(self.subscribersFastForwardTimeEnd) do
      if v == callback then
         table.remove(self.subscribersFastForwardTimeEnd, i)
         break
      end
   end
end

function SkySystem:isDay()
   return self:getDayState() == "morning" or self:getDayState() == "afternoon"
end

function SkySystem:isNight()
   return self:getDayState() == "night" or self:getDayState() == "midnight"
end

function SkySystem:getSunPos()
   return vec3Normalize(self.sun.subRigid:getPose():getPos())
end

function SkySystem:getMoonPos()
   return vec3Normalize(self.moon.subRigid:getPose():getPos())
end

function SkySystem:getSunFactor()
   return clamp(self.sun.factor, 0, 1)
end

function SkySystem:getMoonFactor()
   return clamp(self.moon.factor, 0, 1)
end

function SkySystem:isSunVisible()
   local sunAngle = SkySystem.sun.rigid:getPose():getRot().z
   return sunAngle < -160 or sunAngle > -10
end

function SkySystem:getTimePassed()
   return self.timePassed
end

function SkySystem:hasDayTimePassed(timeUnit)
   return self:getDaySecondsPassed() >= timeUnit:getAs("gSecond")
end

function SkySystem:hasDatePassed(timeUnit)
   return self:getTimePassed():getAs("gSecond") >= timeUnit:getAs("gSecond")
end

function SkySystem:getTimeScale()
   return TIME_SCALE
end

function SkySystem:getHoursPerDay()
   return HOURS_PER_DAY
end

function SkySystem:getSecondsPerDay()
   return self:getHoursPerDay() * 3600
end

function SkySystem:getCurrentDay()
   return math.floor(self:getTimePassed():getAs("gDay"))
end

function SkySystem:getDaySecondsPassed()
   return self:getTimePassed() - CTime.convert(self:getCurrentDay(), "gDay", "gSecond")
end

function SkySystem:getDayStateTimePassed()
   local secondsPassed = self:getDaySecondsPassed() - CTime.convert(self:getDayStateHour(self:getDayState()), "gHour", "gSecond")
   return CTime(secondsPassed, "gSecond")
end

function SkySystem:getCurrentHour()
   return math.floor(CTime.convert(self:getDaySecondsPassed(), "gSecond", "gHour"))
end

function SkySystem:getCurrentMinute()
   return math.floor(CTime.convert(self:getDaySecondsPassed() - self:getCurrentHour() * 3600, "gSecond", "gMinute"))
end

function SkySystem:getCurrentSecond()
   return self:getDaySecondsPassed() - self:getCurrentHour() * 3600 - self:getCurrentMinute() * 60
end

function SkySystem:getDateString()
   return string.format("Day %d - %02d:%02d:%02d", self:getCurrentDay(), self:getCurrentHour(), self:getCurrentMinute(), self:getCurrentSecond())
end

function SkySystem:getDayState()
   return self.dayState
end

function SkySystem:getPrevDayState()
   local dayState = self:getDayState()
   if dayState == "morning" then
      return "midnight"
   elseif dayState == "afternoon" then
      return "morning"
   elseif dayState == "night" then
      return "afternoon"
   elseif dayState == "midnight" then
      return "night"
   end
end

function SkySystem:updateDayState(dayState)
   self.previousDayState = self:getDayState()
   self.dayState = dayState
   if self.previousDayState ~= self.dayState or (self.preFFDay and self.preFFDay ~= self:getCurrentDay()) then
      log("SkySystem: " .. dayState .. " started")
      for _,callback in ipairs(self.subscribersDayStateChange) do
         if callback.dayState == self:getDayState() or callback.dayState == "all" then
            callback.func(self:getDayState(), unpack(callback.args))
         end
      end
   end
end

function SkySystem:getDayStateHour(dayState)
   return self.dayStates[dayState].hour
end

function SkySystem:getTimeLeftToDayState(dayState)
   local dayStateHour = CTime(self:getDayStateHour(dayState), "gHour")
   local timeUnit = CTime(self:getCurrentDay(), "gDay")
   timeUnit:inc(dayStateHour)
   if self:hasDatePassed(timeUnit) then
      timeUnit:inc(1)
   end
   return self:getTimeLeftTo(timeUnit)
end

function SkySystem:getTimeLeftTo(timeUnit)
   if self:hasDatePassed(timeUnit) then return CTime(0, "gSecond") end
   return CTime(timeUnit - self:getTimePassed(), timeUnit.timeType)
end

function SkySystem:getTimeRate()
   return self.timeRate
end

function SkySystem:changeTimeRate(value)
   self.timeRate = self.timeRate + value
end

function SkySystem:fastForwardTime(timeUnit)
   log("SkySystem:fastForwardTime - " .. timeUnit:getAs("gHour") .. " hours")
   self.preFFDay = self:getCurrentDay()
   self.timePassed:inc(timeUnit:getAs("gSecond"))
   self:update(0)

   local event = {elapsed = timeUnit}
   for _,callback in ipairs(self.subscribersFastForwardTime) do
      callback.func(event, unpack(callback.args))
   end
   for _,callback in ipairs(self.subscribersFastForwardTimeEnd) do
      callback.func(event, unpack(callback.args))
   end
   self.preFFDay = nil
   log("SkySystem: " .. self:getDateString())
end

-- manual use
function SkySystem:OnSaveState(state)
   state.timePassed  = self.timePassed:getAs("gSecond")

   state.atmLow  = self.atmosphereLow
   state.atmHigh = self.atmosphereHigh
end

function SkySystem:OnLoadState(state)
   if state == nil then return end

   if self.timePassed then
      self.timePassed  = CTime(state.timePassed, "gSecond")
      self:update(0)
      local WeatherSystem = require "environment.weather".WeatherSystem
      WeatherSystem:onFastForwardTime()
      log("SkySystem: Loaded " .. self:getDateString())
   end

   if state.atmLow then
      self.atmosphereLow = tablex.deepcopy(state.atmLow)
   end
   if state.atmHigh then
      self.atmosphereHigh = tablex.deepcopy(state.atmHigh)
   end
end

return {SkySystem=SkySystem}
