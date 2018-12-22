local oo = require "loop.simple"

local Set = require "pl.Set"
local tablex = require "pl.tablex"
local random = require "random"

---@class CDialogAnimator
local CDialogAnimator = oo.class()

function CDialogAnimator:__new()
   self = oo.rawnew(self)
   self.prefabs = {}
   self.finalized = false
   self.generators = {}
   return self
end

local EQUIVALENT_PREFABS = {
   ["abori.cfg"] = true,
   ["human_male.cfg"] = true,
}

function CDialogAnimator:registerAnimations(animations, prefabName)
   if self.finalized then
      log("ERROR: CDialogAnimator: can't register animation prefabs, already finalized!")
      return
   end
   if EQUIVALENT_PREFABS[prefabName] then
      prefabName = "shared"
   end
   local animationSet = Set(animations)
   if not self.prefabs[prefabName] then
      self.prefabs[prefabName] = animationSet
   else
      local old = self.prefabs[prefabName]
      -- throw away any extra animations so all compatible conversation members
      -- have access to the same pool
      self.prefabs[prefabName] = Set.intersection(self.prefabs[prefabName], animationSet)
      local difference = Set.symmetric_difference(old, animationSet)
      if next(difference) then
         log("WARNING: CDialogAnimator: the following animations were excluded:")
         log(require "pl.pretty".write(tablex.keys(difference)))
      end
   end
end

function CDialogAnimator:finalize()
   self.finalized = true
   for prefab, animations in pairs(self.prefabs) do
      self.generators[prefab] = random.shuffledSequenceGenerator(tablex.keys(animations))
   end
end

function CDialogAnimator:next(prefabName)
   if EQUIVALENT_PREFABS[prefabName] then
      prefabName = "shared"
   end
   if self.generators[prefabName] then
      return self.generators[prefabName]()
   end
end

return CDialogAnimator
