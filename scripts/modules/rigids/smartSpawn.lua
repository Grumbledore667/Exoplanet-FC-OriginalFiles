local oo = require "loop.simple"
local tablex = require "pl.tablex"
local CSpawn = (require "rigids.spawn").CSpawn
local SpawnLists = require "spawnList"

local members = {
   spawnDist = 10000,
   savedState = nil,
   firstSpawn = true,
}

---@class CSmartSpawn : CSpawn
local CSmartSpawn = oo.class(members, CSpawn)

local function nilIfEmpty(t)
   if t == nil or next(t) == nil then
      return nil
   else
      return t
   end
end

function CSmartSpawn:OnCreate()
   CSpawn.OnCreate(self)

   self.spawnDist = loadParamNumber(self, "spawnDist", 10000)
   -- loadParamItemCounts never returns nil!
   self.lootItems = nilIfEmpty(loadParamItemCounts(self, "lootItems", nil))
   self.weapons   = nilIfEmpty(loadParamStrings(self, "weapons", nil))
   self.styles    = nilIfEmpty(loadParamStrings(self, "styles", nil))

   local spawnList = SpawnLists[self.spawnListName]

   self.parametersRest = {}
   if spawnList then
      self.healthMax        = spawnList.healthMax or self.healthMax
      self.walkSpeed        = spawnList.walkSpeed
      self.runSpeed         = spawnList.runSpeed
      self.energyMax        = spawnList.energyMax
      self.spawnDist        = spawnList.spawnDist or self.spawnDist
      self.lootItems        = spawnList.lootItems or self.lootItems
      self.weapons          = spawnList.weapons   or self.weapons
      self.styles           = spawnList.styles    or self.styles
      self.customLabel      = spawnList.customLabel
      self.zoneSize         = spawnList.zoneSize
      self.viewDist         = spawnList.viewDist
      self.feelRadiusCutoff = spawnList.feelRadiusCutoff
      self.blockChirping    = spawnList.blockChirping
      self.attackDist       = spawnList.attackDist
      self.weaponDamage     = spawnList.weaponDamage
      for _, key in ipairs{"patrolPoints", "patrolAllowed", "patrolLoop"} do
         self.parametersRest[key] = spawnList[key]
      end
   end

   self.interactor = self:createAspect("interactor")
   self.interactor:setObject(self)
   self.interactor:setTriggerRadius(self.spawnDist)
   self.interactor:getPose():setParent(self:getPose())
   self.interactor:getPose():resetLocalPose()
   self.interactor:setTriggerActive(true)
end

function CSmartSpawn:OnInteractTriggerBegin(obj)
   local spawnList = SpawnLists[self.spawnListName]

   if (spawnList and spawnList.active) or loadParam(self, "active", true) then
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

function CSmartSpawn:spawnEntity(params)
   if not params then
      params = {
         lootItems = self.lootItems,
         weapons = self.weapons,
         styles = self.styles,

         customLabel = self.customLabel,
         zoneSize = self.zoneSize,
         viewDist = self.viewDist,
         feelRadiusCutoff = self.feelRadiusCutoff,
         blockChirping = self.blockChirping,

         attackDist = self.attackDist,
         energyMax = self.energyMax,
         healthMax = self.healthMax,
         walkSpeed = self.walkSpeed,
         runSpeed = self.runSpeed,
         weaponDamage = self.weaponDamage,
      }
      for key, value in pairs(self.parametersRest) do
         params[key] = value
      end
      if not next(params) then
         params = nil
      end
   end

   return CSpawn.spawnEntity(self, params)
end

function CSmartSpawn:getLootTable()
   local t = {}
   if self.lootItems then
      t = tablex.deepcopy(self.lootItems)
   end
   if self.weapons then
      for _,itemName in pairs(self.weapons) do
         t[itemName] = (t[itemName] or 0) + 1
      end
   end
   return t
end

function CSmartSpawn:OnSaveState(state)
   CSpawn.OnSaveState(self, state)
   state.spawnDist = self.spawnDist
   state.firstSpawn = self.firstSpawn
end

function CSmartSpawn:OnLoadState(state)
   CSpawn.OnLoadState(self, state)
   self.spawnDist = state.spawnDist
   self.firstSpawn = state.firstSpawn
end

return {CSmartSpawn=CSmartSpawn}
