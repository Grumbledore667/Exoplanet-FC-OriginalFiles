local oo = require "loop.simple"

local CCloth = oo.class({})

function CCloth:OnCreate()
   self:setCollision(false)
   self:setMassCoeff(0)
   self:setFeelVisible(false)
   runTimer(rand(1), self, self.startAnimation, false)
end

function CCloth:startAnimation()
   self:execAnimState("start.caf", 0.5)
end

function CCloth:OnDestroy()
end

return {CCloth=CCloth}
