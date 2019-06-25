local oo = require "loop.simple"
local CStatusEffectBase = (require "statusEffects.statusEffectBase")

local CKnockout = oo.class({}, CStatusEffectBase)

function CKnockout:onInit()
   self.owner.owner:setState("knockout", true)
end

function CKnockout:onDestroy()
   CStatusEffectBase.onDestroy(self)

   self.owner.owner:setState("knockout", false)
end

return CKnockout
