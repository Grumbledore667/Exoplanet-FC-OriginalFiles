local tablex = require "pl.tablex"

local t = {
   restBuff = {
      saved = false,
      label = "Resting",
      statBonuses = {
         staminaRegenFlat = 10,
         healthRegenMult = 1,
      },
   },
   sleepBuff = {
      saved = false,
      label = "Sleeping",
      statBonuses = {
         staminaRegenFlat = 10,
         sleepRegenFlat = 10,
      },
   },
}

local function getEffect(name)
   return t[name] and tablex.deepcopy(t[name]) or {}
end

return {getEffect=getEffect}
