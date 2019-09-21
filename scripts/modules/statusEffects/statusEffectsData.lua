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
   electricShock = {
      damageType = "energy",
      changeStats = {health = -30},
      duration = 10,
      refresh = true,
      sounds = {{name = "Play_scamp_22_shock_discharge", distance = 1500}},
      particles = {{name = "electro_touch.sps", bones = {"Spine", "Bone002"}}},
   }
}

local function getEffect(name)
   return t[name] and tablex.deepcopy(t[name]) or {}
end

return {getEffect=getEffect}
