local oo = require "loop.simple"

local CSpawn = oo.class({
   characterType     = "",
   characterClass    = "",
   charactersSpawned = nil,

   active            = false,
   spawnRate         = 1,
   spawnTimeMax      = 1,
   spawnCountMax     = 1,
   aliveCountMax     = 1,

   spawnTime         = 0,
   spawnCount        = 0,

   spawnTimer        = nil,
})

local CSpawnBugs = oo.class({}, CSpawn)
local CSpawnGreenBugs = oo.class({}, CSpawn)
local CSpawnKabarogs = oo.class({}, CSpawn)
local CSpawnDustSharks = oo.class({}, CSpawn)

function CSpawn:OnCreate()
   self:loadParameters()
end

function CSpawn:loadParameters()
   self.characterType  = loadParam      ( self, "type"  , "" )
   self.characterClass = loadParam      ( self, "class" , "" )
   self.spawnRate      = loadParamNumber( self, "spawnRate",  1 )
   self.spawnTimeMax   = loadParamNumber( self, "spawnTimeMax",  1 )
   self.spawnCountMax  = loadParamNumber( self, "spawnCountMax", 1 )
   self.aliveCountMax  = loadParamNumber( self, "aliveCountMax", 1 )

   -- try to load spawnList, and if it has errors loudly complain in logs
   local spawnList = loadrequire("spawnList", true) or {}

   self.spawnListName = loadParam(self, "spawnListName", self:getName())
   if spawnList[self.spawnListName] then
      self.characterType  = spawnList[self.spawnListName].characterType or self.characterType
      self.characterClass = spawnList[self.spawnListName].characterClass or self.characterClass
      self.spawnRate      = spawnList[self.spawnListName].spawnRate or self.spawnRate
      self.spawnTimeMax   = spawnList[self.spawnListName].spawnTimeMax or self.spawnTimeMax
      self.spawnCountMax  = spawnList[self.spawnListName].spawnCountMax or self.spawnCountMax
      self.aliveCountMax  = spawnList[self.spawnListName].aliveCountMax or self.aliveCountMax
   end

   runTimer(0, self, function (self)
      if not self.loading and not self.spawnDist then
         if spawnList[self.spawnListName] and spawnList[self.spawnListName].active or loadParam( self, "active", true ) then
            self:activate( nil )
         end
      end
   end, false)

   self.charactersSpawned = {}
end

function CSpawn:OnDestroy()
   self:deactivate( nil )
end

function CSpawn:activate( obj )
   if ( self.active ) then
      return false
   end

   self.active = true

   self.spawnTimer  = runTimer( self.spawnRate, self, self.spawn, false )
   self.updateTimer = runTimer( 1, self, self.update, true )

   return true
end

function CSpawn:deactivate( obj )
   if ( not self.active ) then
      return false
   end

   if ( self.spawnTimer ) then
      self.spawnTimer:stop()
      self.spawnTimer = nil
   end

   if ( self.updateTimer ) then
      self.updateTimer:stop()
      self.updateTimer = nil
   end

   self.active     = false
   self.spawnTime  = 0
   self.spawnCount = 0

   for i=1,#self.charactersSpawned do
      self.charactersSpawned[i].installer = nil

      self.charactersSpawned[i].itemsManager:removeAllItems()

      getScene():destroyEntity( self.charactersSpawned[i] )
   end

   self.charactersSpawned = {}

   return true
end

function CSpawn:update()
   self.spawnTime = self.spawnTime + 1
end

function CSpawn:spawn()
   if ( self:isSpawningComplete() or not self.characterType or not self.characterClass ) then
      self.updateTimer:stop()
      return
   end

   if ( self:getAliveCount() >= self.aliveCountMax ) then
      self.spawnTimer = runTimer( self.spawnRate/2, self, self.spawn, false )
      return
   end

   local obj = getScene():createEntity( self.characterType, self.characterClass )

   if ( not obj ) then
      log( "Can't spawn: " .. self.characterType .. " with class: '" .. self.characterClass .. "'" )
      return
   end

   obj:setPose         ( self:getPose() )
   obj:setSpawnPos     ( self:getPose():getPos() )
   obj:setSpawn        ( self )
   obj:subscribeOnDeath( self.OnCharDeath, self )
   if obj.setInstaller then
      obj:setInstaller(self)
   end

   self.charactersSpawned[#self.charactersSpawned + 1] = obj

   self.spawnCount = self.spawnCount + 1
   self.spawnTimer = runTimer( self.spawnRate, self, self.spawn, false )
end

function CSpawn:OnCharDeath( obj )
   for i=1,#self.charactersSpawned do
      if ( self.charactersSpawned[i] == obj ) then
         -- table.remove( self.charactersSpawned, i )
         questSystem:fireEvent( "dead", self:getName(), obj )
         --log("-----")
         break
      end
   end
end

function CSpawn:isSpawningComplete()
   return self.spawnCount >= self.spawnCountMax or self.spawnTime > self.spawnTimeMax
end

function CSpawn:getAliveCount()
   local living = 0
   for k,v in pairs(self.charactersSpawned) do
      if not v:getState("dead") then
         living = living + 1
      end
   end
   return living
end

function CSpawn:addInstallation(obj)
   local found = false
   for k,v in pairs(self.charactersSpawned) do
      if v == obj then
         found = true
         break
      end
   end

   if not found then
      self.charactersSpawned[#self.charactersSpawned + 1] = obj
   end
end

function CSpawn:removeInstallation(obj)
   for i=1,#self.charactersSpawned do
      if ( self.charactersSpawned[i] == obj ) then
         table.remove( self.charactersSpawned, i )
         break
      end
   end
end

function CSpawn:OnSaveState(state)
   state.active = self.active
   if self.spawnTimer then
      state.spawnTimerLeft = self.spawnTimer:getTimeLeft()
   end
   if self.updateTimer then
      state.updateTimerLeft = self.updateTimer:getTimeLeft()
   end
   state.characterType = self.characterType
   state.characterClass = self.characterClass
   state.spawnRate = self.spawnRate
   state.spawnCountMax = self.spawnCountMax
   state.aliveCountMax = self.aliveCountMax
   state.spawnTime = self.spawnTime
   state.spawnTimeMax = self.spawnTimeMax
   state.spawnCount = self.spawnCount

   -- spawned chars
   local inst = {}
   local any_inst = false
   for k,v in pairs(self.charactersSpawned) do
      if v.OnSaveState and v.setInstaller then
         local save_state = {}
         v:OnSaveState(save_state)
         table.insert(inst, save_state)
         any_inst = true
      end
   end
   if any_inst then
      state.charactersSpawned = inst
   end
end

function CSpawn:OnLoadState(state)
   self.loading = true
   self.active = state.active
   if state.spawnTimerLeft then
      self.spawnTimer = runTimer(state.spawnTimerLeft, self, self.spawn, false)
   end
   if state.updateTimerLeft then
      self.updateTimer = runTimer(state.updateTimerLeft, self, self.update, false)
   end
   local vars = {
      "characterType",
      "characterClass",
      "spawnRate",
      "spawnTime",
      "spawnTimeMax",
      "spawnCountMax" ,
      "aliveCountMax" ,
      "spawnCount",
   }
   for k,v in pairs(vars) do
      if state[v] ~= nil then
         self[v] = state[v]
      end
   end

   -- spawned chars
   if state.charactersSpawned then
      for k,v in pairs(state.charactersSpawned) do
         local obj = getScene():createEntity(self.characterType, self.characterClass)
         if obj then
            if obj.OnLoadState then
               obj:setPose         ( self:getPose() )
               obj:setSpawnPos     ( self:getPose():getPos() )
               obj:setSpawn        ( self )
               obj:subscribeOnDeath( self.OnCharDeath, self )
               if obj.setInstaller then
                  obj:setInstaller(self)
               end
               self:addInstallation(obj)
               obj:OnLoadState(v)
            else
               getScene():destroyEntity(obj)
            end
         end
      end
   end
end

return {
   CSpawn=CSpawn,
   CSpawnBugs=CSpawnBugs,
   CSpawnGreenBugs=CSpawnGreenBugs,
   CSpawnKabarogs=CSpawnKabarogs,
   CSpawnDustSharks=CSpawnDustSharks,
}
