local oo = require "loop.simple"
local CStatusEffectBase = require "statusEffects.statusEffectBase"

local CStatusEffectsManager = oo.class({owner = nil})

function CStatusEffectsManager:init()
   self.statusEffects = {}
   self.idCounter = 0
end

function CStatusEffectsManager:genId()
   self.idCounter = self.idCounter + 1
   return self.idCounter
end

function CStatusEffectsManager:getEffectsByName( name )
   local t = {}
   for _, effect in ipairs(self.statusEffects) do
      if effect:getName() == name then
         table.insert( t, effect )
      end
   end
   return t
end

function CStatusEffectsManager:hasEffectName(name)
   return self:getEffectsByName(name)[1] ~= nil
end

function CStatusEffectsManager:removeByName( name )
   local effect = self:getEffectsByName(name)[1]
   if effect then
      self:destroyEffectByID(effect.ID)
   end
end

function CStatusEffectsManager:addStatusEffect( t )
   t = tableDeepCopy(t)
   local effect = self:getEffectsByName(t.name)[1]
   if effect then
      if t.stackable and not t.refresh then
         effect:incStackCount()
         return
      end

      if t.refresh then
         if t.stackable then
            t.stackCount = effect:getStackCount() + 1
         end
         self:destroyEffectByID( effect.ID )
      end
   end

   local statusEffect
   local loadedEffect = loadrequire("statusEffects." .. t.name, false)

   if loadedEffect then
      statusEffect = loadedEffect{ owner = self, ID = self:genId(), params = t, static = true }
   else
      statusEffect = CStatusEffectBase{ owner = self, ID = self:genId(), params = t }
   end

   statusEffect:init()
   table.insert(self.statusEffects, statusEffect)
   return statusEffect
end

function CStatusEffectsManager:getEffectByID( ID )
   for _,v in ipairs(self.statusEffects) do
      if v.ID == tonumber(ID) then
         return v
      end
   end
end

function CStatusEffectsManager:destroyEffectByID( ID )
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

function CStatusEffectsManager:changeTimeLeftByID( ID, newTime )
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
