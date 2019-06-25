local oo = require "loop.simple"
local _rootCharacter = (require "roots")._rootCharacter

local random = require "random"


---@class CCloth : shCharacter
local CCloth = oo.class({}, _rootCharacter)

function CCloth:OnCreate()
   self:setCollisionCharacters(false)
   self:setMassCoeff(0)
   self:setFeelVisible(false)
   self:stopCycles(0)
   runTimer(random.random(), self, self.startAnimation, false)
end

function CCloth:startAnimation()
   self:playCycle("start", 0, 1, 1)
end

function CCloth:OnDestroy()
end

return {CCloth=CCloth}
