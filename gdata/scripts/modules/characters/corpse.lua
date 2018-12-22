local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CTalker = (require "characters.talker").CTalker
local CActionsScheduler = (require "actionsScheduler").CActionsScheduler
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local ItemsData = (require "itemsData")
local ObjectsLabels = (require "objectsLabels")

local CCorpse = oo.class( {}, CTalker )

function CCorpse:loadParameters()
   self.death_animation = loadParam( self, "death_animation", "death.caf" )
   -- self:setMaxHealthCount(100)
   -- self:setHealthCount(100)
   -- self:setRole(ROLE_NPC_FRIEND)
   -- self.senseScheduler:setFeelRadius( loadParamNumber(self, "viewRange", 3000) )

   -- if self:getName() == "revolver" then
   --    self.weapon = "revolver.gun"
   -- else
   --    self.weapon = "machete.wpn"
   -- end
   -- local item = self.itemsManager:addItem(self.weapon)
   -- self.itemsManager:equipSlotWithItem(1, item.id)
end

function CCorpse:OnCreate()
   CTalker.OnCreate( self )

   CCorpse.loadParameters( self )
   self.animationsManager:playAnimationWithLock( self.death_animation )
   self.interactor:setTriggerActive(false)
   self:setCollision(false)
   self:setMassCoeff(0)
   self:setFeelVisible(false)
   -- self:subscribeOnDeath(self.OnDeath, self)
end

-- function CCorpse:hit( damage )
--    CCharacter.hit(self, damage)
-- end

function CCorpse:OnDeath( self )
   self.interactor:setTriggerActive(false)
end

return {CCorpse=CCorpse}
