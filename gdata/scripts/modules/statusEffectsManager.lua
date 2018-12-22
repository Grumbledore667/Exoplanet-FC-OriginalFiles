local oo = require "loop.simple"
local CStatusEffectBase = require "statusEffects.statusEffectBase"

local StatusEffectsData = require "statusEffects.statusEffectsData"

local tablex = require "pl.tablex"

local CStatusEffectsManager = oo.class({owner = nil})

function CStatusEffectsManager:init()
   self.statusEffects = {}
   self.idCounter = 0
end

function CStatusEffectsManager:genId()
   self.idCounter = self.idCounter + 1
   return self.idCounter
end

function CStatusEffectsManager:getEffectsByName(name)
   local t = {}
   for _, effect in ipairs(self.statusEffects) do
      if effect:getName() == name then
         table.insert(t, effect)
      end
   end
   return t
end

---@param source any
function CStatusEffectsManager:getEffectsBySource(source)
   local t = {}
   for _, effect in ipairs(self.statusEffects) do
      if source and effect.source == source then
         table.insert(t, effect)
      end
   end
   return t
end

function CStatusEffectsManager:hasEffectName(name)
   return self:getEffectsByName(name)[1] ~= nil
end

---Adds a status effect based on default params from StatusEffectsData + passed params table
---@param effectParams table
---@param source any
---@return CStatusEffectBase
function CStatusEffectsManager:addStatusEffect(effectParams, source)
   --Get default params from effects data file
   effectParams = tablex.union(StatusEffectsData.getEffect(effectParams.name), effectParams)
   local effect = self:getEffectsByName(effectParams.name)[1]
   if effect then
      if effectParams.destroyEffects then
         if effectParams.destroyEffects.name then
            for _,destroyName in ipairs(effectParams.destroyEffects.name) do
               local effectsByName = self:getEffectsByName(destroyName)
               for _,v in pairs(effectsByName) do
                  v:destroy()
               end
            end
         end
      end

      if effectParams.stackable and not effectParams.refresh then
         effect:incStackCount()
         return
      end

      if effectParams.refresh then
         if effectParams.stackable then
            effectParams.stackCount = effect:getStackCount() + 1
         end
         effect:refreshWithParams(effectParams)
         return
      end
   end

   local statusEffect
   local loadedEffect = loadrequire("statusEffects." .. effectParams.name, false)

   if loadedEffect then
      statusEffect = loadedEffect{owner = self, source = source, ID = self:genId(), params = effectParams, static = true}
   else
      statusEffect = CStatusEffectBase{owner = self, source = source, ID = self:genId(), params = effectParams}
   end

   statusEffect:init()
   table.insert(self.statusEffects, statusEffect)
   return statusEffect
end

function CStatusEffectsManager:getEffectByID(ID)
   for _,v in ipairs(self.statusEffects) do
      if v.ID == tonumber(ID) then
         return v
      end
   end
end

function CStatusEffectsManager:destroyEffectByID(ID)
   for k,v in ipairs(self.statusEffects) do
      if v.ID == tonumber(ID) then
         v:onDestroy()
         if v.timer then
            v.timer:stop()
         end
         table.remove(self.statusEffects, k)
         break
      end
   end
end

---@param source any
function CStatusEffectsManager:destroyEffectsBySource(source)
   if not source then return end
   local effects = self:getEffectsBySource(source)
   for _,effect in ipairs(effects) do
      self:destroyEffectByID(effect.ID)
   end
end

---@param name string
function CStatusEffectsManager:destroyEffectsByName(name)
   local effects = self:getEffectsByName(name)
   for _,effect in ipairs(effects) do
      self:destroyEffectByID(effect.ID)
   end
end

function CStatusEffectsManager:changeTimeLeftByID(ID, newTime)
   for _,v in ipairs(self.statusEffects) do
      if v.ID == tonumber(ID) then
         v.params.timeLeft = newTime
         break
      end
   end
end

function CStatusEffectsManager:zeroAllTimes()
   for _,v in pairs(self.statusEffects) do
      if v.params.timeLeft then
         v.params.timeLeft = 0
      end
   end
end

return CStatusEffectsManager
