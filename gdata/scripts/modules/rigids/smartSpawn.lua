local oo = require "loop.simple"
local tablex = require "pl.tablex"
local CSpawn = (require "rigids.spawn").CSpawn

local members = {
   spawnDist = 10000,
   savedState = nil,
   firstSpawn = true,
}
local CSmartSpawn = oo.class(members, CSpawn)

function CSmartSpawn:OnCreate()
   CSpawn.OnCreate(self)

   self.spawnDist = loadParamNumber(self, "spawnDist", 10000)
   self.lootItems = loadParamItemCounts(self, "lootItems", nil)
   self.weapons   = loadParamStrings(self, "weapons", nil)
   self.styles    = loadParamStrings(self, "styles", nil)

   -- try to load spawnList, and if it has errors loudly complain in logs
   local spawnList = loadrequire("spawnList", true) or {}

   if spawnList[self.spawnListName] then
      self.healthMax      = spawnList[self.spawnListName].healthMax or self.healthMax
      self.energyMax      = spawnList[self.spawnListName].energyMax
      self.spawnDist      = spawnList[self.spawnListName].spawnDist or self.spawnDist
      self.lootItems      = spawnList[self.spawnListName].lootItems or self.lootItems
      self.weapons        = spawnList[self.spawnListName].weapons   or self.weapons
      self.styles         = spawnList[self.spawnListName].styles    or self.styles
      self.customLabel    = spawnList[self.spawnListName].customLabel
      self.zoneSize       = spawnList[self.spawnListName].zoneSize
      self.viewDist       = spawnList[self.spawnListName].viewDist
      self.attackDist     = spawnList[self.spawnListName].attackDist
   end

   self.interactor = self:createAspect("interactor")
   self.interactor:setObject(self)
   self.interactor:setTriggerRadius(self.spawnDist)
   self.interactor:getPose():setParent(self:getPose())
   self.interactor:getPose():resetLocalPose()
   self.interactor:setTriggerActive(true)
end

function CSmartSpawn:OnInteractTriggerBegin(obj)
   -- try to load spawnList, and if it has errors loudly complain in logs
   local spawnList = loadrequire("spawnList", true) or {}

   if (spawnList[self.spawnListName] and spawnList[self.spawnListName].active) or loadParam( self, "active", true ) then
      if obj == getPlayer() and objInDist(obj:getPose():getPos(), self:getPose():getPos(), self.spawnDist) then
         if self.firstSpawn then -- first time spawning
            self:activate()
            self.firstSpawn = false
         end
      end
   end
end

function CSmartSpawn:OnInteractTriggerEnd(obj)
end

function CSmartSpawn:spawn()
   if ( self:isSpawningComplete() ) then
      return
   end
   CSpawn.spawn( self )
   local char = self.charactersSpawned[#self.charactersSpawned]
   if char and char.initWithParams then
      local params = {  lootItems = self.lootItems, weapons = self.weapons, styles = self.styles,
                        customLabel = self.customLabel, zoneSize = self.zoneSize, viewDist = self.viewDist,
                        attackDist = self.attackDist, energyMax = self.energyMax, healthMax = self.healthMax }
      char:initWithParams( params )
   end
end

function CSmartSpawn:getLootTable()
   local t = {}
   if self.lootItems then
      t = tablex.deepcopy( self.lootItems )
   end
   if self.weapons then
      for _,itemName in pairs(self.weapons) do
         t[itemName] = ( t[itemName] or 0 ) + 1
      end
   end
   return t
end

function CSmartSpawn:OnSaveState(state)
   CSpawn.OnSaveState( self, state )
   state.spawnDist = self.spawnDist
   state.firstSpawn = self.firstSpawn
end

function CSmartSpawn:OnLoadState(state)
   CSpawn.OnLoadState( self, state )
   self.spawnDist = state.spawnDist
   self.firstSpawn = state.firstSpawn
end

return {CSmartSpawn=CSmartSpawn}
