local oo = require "loop.simple"

local CCamera = oo.class()


function CCamera:OnEnable()
end

function CCamera:OnDisable()
end

function CCamera:OnAnimationStop(animName)
end

function CCamera:OnBlendInStop()
end

function CCamera:OnBlendOutStart()
end

function CCamera:onSkip()
end

return {CCamera=CCamera}
