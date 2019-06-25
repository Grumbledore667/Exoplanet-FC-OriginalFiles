local oo = require "loop.simple"
local CNPC = (require "characters.npc").CNPC

---@class COldOutcast : CNPC
local COldOutcast = oo.class({}, CNPC)

function COldOutcast:initSenses()
   CNPC.initSenses(self)
   self.senseScheduler:addEnemyDetectSense()
end

return {COldOutcast=COldOutcast}
