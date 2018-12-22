local oo = require "loop.simple"
local CNPC = (require "characters.npc").CNPC

---@class CBandit : CNPC
local CBandit = oo.class({}, CNPC)

function CBandit:initSenses()
   CNPC.initSenses(self)
   self.senseScheduler:addEnemyDetectSense()
   self.senseScheduler:addSense("enemyClose", false, self.senseScheduler, self.senseScheduler.checkClose)
   self.senseScheduler:addSense("enemyFront", false, self.senseScheduler, self.senseScheduler.checkFront)
end

function CBandit:getDefaultParametersBeforeNpcData()
   local parameters = CNPC.getDefaultParametersBeforeNpcData(self)
   parameters.tree = "ai.trees.bandit"
   parameters.guild = "GLD_NPC_ENEMY"
   parameters.immortality = false
   parameters.customLabel = "Bandit"
   parameters.dialog = false
   return parameters
end

function CBandit:OnHit(params)
   local player = getMC()
   local charAttacker = params.impactor:getObject()
   if charAttacker == player and not self:isEnemy(player) then
      self:setAttitudeToMainCharacter("ENEMY")
      questSystem:fireEvent("turnAggressive", self:getName(), self)
   end
   CNPC.OnHit(self, params)
end

return {CBandit=CBandit}
