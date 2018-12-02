local oo = require "loop.simple"

local CCamera = oo.class()

function CCamera:OnAnimationStop(animationName)
end

function CCamera:OnBlendInStop()
end

function CCamera:OnBlendOutStart()
end

function CCamera:OnDisable()
end

function CCamera:OnEnable()
end

return {CCamera=CCamera}
