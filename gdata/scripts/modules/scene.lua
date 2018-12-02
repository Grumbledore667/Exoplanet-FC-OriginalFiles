local oo = require "loop.simple"

local CScene = oo.class({})

function CScene:OnLocationInit()

end

function CScene:OnLocationEnter()

end

function CScene:OnLocationExit()

end

function CScene:OnSkipMovie()

end

function CScene:OnControlDown(code)

end

function CScene:OnControlUp(code)

end

function CScene:OnBreakBrush(brush)

end

function CScene:OnCreateBrush(brushName)
end

return {CScene=CScene}
