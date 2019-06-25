local oo = require "loop.simple"
local _rootRigid = (require "roots")._rootRigid
local tablex = require "pl.tablex"
local SpawnLists = require "spawnList"

---@class CSpawn : shRigidEntity
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
}, _rootRigid)

local CSpawnBugs, CSpawnGreenBugs, CSpawnKabarogs = CSpawn, CSpawn, CSpawn

function CSpawn:OnCreate()
   self:loadParameters()
end

function CSpawn:loadParameters()
   self.characterType  = loadParam      (self, "type"  , "")
   self.characterClass = loadParam      (self, "class" , "")
   self.spawnRate      = loadParamNumber(self, "spawnRate",  1)
   self.spawnTimeMax   = loadParamNumber(self, "spawnTimeMax",  1)
   self.spawnCountMax  = loadParamNumber(self, "spawnCountMax", 1)
   self.aliveCountMax  = loadParamNumber(self, "aliveCountMax", 1)

   self.spawnListName = loadParam(self, "spawnListName", self:getName())
   local spawnList = SpawnLists[self.spawnListName]
   if spawnList then
      self.characterType  = spawnList.characterType or self.characterType
      self.characterClass = spawnList.characterClass or self.characterClass
      self.spawnRate      = spawnList.spawnRate or self.spawnRate
      self.spawnTimeMax   = spawnList.spawnTimeMax or self.spawnTimeMax
      self.spawnCountMax  = spawnList.spawnCountMax or self.spawnCountMax
      self.aliveCountMax  = spawnList.aliveCountMax or self.aliveCountMax
   end

   getScene():subscribeOnFirstFrame(function()
      if not getScene():isLoadedGame() and not self.spawnDist then
         if spawnList and spawnList.active or loadParam(self, "active", true) then
            self:activate(nil)
         end
      end
   end)

   self.charactersSpawned = {}
end

function CSpawn:activate(obj)
   if self.active then
      return false
   end

   self.active = true

   self.spawnTimer  = runTimer(self.spawnRate, self, self.spawn, false)
   self.updateTimer = runTimer(1, self, self.update, true)

   return true
end

function CSpawn:deactivate(obj)
   if not self.active then
      return false
   end

   if self.spawnTimer then
      self.spawnTimer:stop()
      self.spawnTimer = nil
   end

   if self.updateTimer then
      self.updateTimer:stop()
      self.updateTimer = nil
   end

   self.active     = false
   self.spawnTime  = 0
   self.spawnCount = 0

   for i=1,#self.charactersSpawned do
      self.charactersSpawned[i].installer = nil

      self.charactersSpawned[i]:getInventory():destroyAllItems()

      getScene():destroyEntity(self.charactersSpawned[i])
   end

   self.charactersSpawned = {}

   return true
end

function CSpawn:update()
   self.spawnTime = self.spawnTime + 1
end

function CSpawn:spawnEntity(params)
   params = params or {}
   params.installer = self
   local obj = getScene():createEntity(self.characterType, self.characterClass, params)

   if not obj then
      log("Can't spawn: " .. self.characterType .. " with class: '" .. self.characterClass .. "'")
      return
   end

   obj:getPose():setPos(self:getPose():getPos())
   obj:setSpawnPos     (self:getPose():getPos())
   obj:setSpawn        (self)
   obj:setOrientationGlobal(getAnglesFromQuat(self:getPose():getRotQuat()).y)
   obj:subscribeOnDeath(self.OnCharDeath, self)

   return obj
end

function CSpawn:spawn()
   if self:isSpawningComplete() or not self.characterType or not self.characterClass then
      self.updateTimer:stop()
      return
   end

   if self:getAliveCount() >= self.aliveCountMax then
      self.spawnTimer = runTimer(self.spawnRate/2, self, self.spawn, false)
      return
   end

   local obj = self:spawnEntity()
   if not obj then
      return
   end

   self.charactersSpawned[#self.charactersSpawned + 1] = obj

   self.spawnCount = self.spawnCount + 1
   self.spawnTimer = runTimer(self.spawnRate, self, self.spawn, false)
end

function CSpawn:OnCharDeath(obj)
   for i=1,#self.charactersSpawned do
      if self.charactersSpawned[i] == obj then
         -- table.remove(self.charactersSpawned, i)
         questSystem:fireEvent("dead", self:getName(), obj)
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
   local index = tablex.find(self.charactersSpawned, obj)
   if not index then
      table.insert(self.charactersSpawned, obj)
      if obj.subscribeOnDestroy then
         obj:subscribeOnDestroy(self.removeInstallation, self, obj)
      else
         log("ERROR: obj doesn't have subscribeOnDestroy method")
         log(debug.traceback())
      end
   end
end

function CSpawn:removeInstallation(obj)
   local index = tablex.find(self.charactersSpawned, obj)
   if index then
      table.remove(self.charactersSpawned, index)
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
   for k,char in pairs(self.charactersSpawned) do
      if char.OnSaveState and char.setInstaller then
         local save_state = {}
         --Only save spaned chars - others are saved by engine
         --Only save dead - atm there's no way to load ai state
         if char:getState("dead") then
            local anim = char:getActiveAction()
            save_state.actionAnimation = anim
            save_state.actionAnimationTime = char:getActionTime(anim)
         end
         char:OnSaveState(save_state)
         table.insert(inst, save_state)
      end
   end
   if #inst then
      state.charactersSpawned = inst
   end
end

function CSpawn:OnLoadState(state)
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
         local obj = self:spawnEntity()
         if obj then
            if obj.OnLoadState then
               self:addInstallation(obj)
               obj:OnLoadState(v)
               if v.actionAnimation then --Load it after the death functions are called
                  obj:setActionTime(v.actionAnimation, v.actionAnimationTime)
               end
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
}
