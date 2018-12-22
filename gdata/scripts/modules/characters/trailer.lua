local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CTalker = (require "characters.talker").CTalker
local CActionsScheduler = (require "actionsScheduler").CActionsScheduler
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local ItemsData = (require "itemsData")
local ObjectsLabels = (require "objectsLabels")

local CTrailerSmoker = oo.class( {}, CTalker )

function CTrailerSmoker:loadParameters()
   self.smoke_fx = self:createAspect( "koster_smoke.sps" )
   self.smoke_fx:getPose():setParent( self:getBonePose("head_slot") )
   self.smoke_fx:getPose():resetLocalPose()
   local z = -15
   local y = -15
   if self:getPrefabName() == "human_male.cfg" then
      y = -12
      z = -12
   end
   self.smoke_fx:getPose():setLocalPos( {z=z, y=y} )
   self.smoke_fx:getPose():setLocalRotQuat(quatFromEuler({x=-90}) )
   self.smoke_fx:getPose():setLocalScale( {x=0.25, y=0.25, z=0.25} )
   self.smoke_fx:enable()
   self.smoke_fx:stop()

   self.smokeAnim = loadParam(self, "smokeAnim", "idle_smoking")
end

function CTrailerSmoker:OnCreate()
   CTalker.OnCreate( self )

   CTrailerSmoker.loadParameters( self )
end

function CTrailerSmoker:addActions()
   local smoke = CAction{}
   smoke.start = self.smoke_start
   smoke.stop  = self.smoke_stop
   smoke.name  = "smoke"

   local root = CNode{}
   root:yes (self.talk_):no (smoke)

   self.actionsScheduler.root = root
end

function CTrailerSmoker:smoke_start()
   self.headLooking = false
   self.jointEntity = getScene():createEntity("joint_med.sbg", "")

   self.jointEntity:getPose():setParent(self:getBonePose("item_slot1"))
   self.jointEntity:getPose():resetLocalPose()
   -- self.jointEntity:getPose():setLocalRotQuat(quatFromEuler({x=90, y=90}) )
   -- self.jointEntity:getPose():setLocalPos    ( {z=-10} )
   self.animationsManager:loopAnimation( self.smokeAnim .. ".caf")
end

function CTrailerSmoker:smoke_stop()
   getScene():destroyEntity( self.jointEntity )
   self.jointEntity = nil
   self.animationsManager:loopAnimation( self.idleAnimation .. ".caf" )
   self.headLooking = true
end

function CTrailerSmoker:OnAnimationEventIn( animation, event )
   CCharacter.OnAnimationEventIn(animation, event)
   if event == "smoke" then
      self.smoke_fx:play()
   end
end

function CTrailerSmoker:OnAnimationEventOut( animation, event )
   CCharacter.OnAnimationEventOut(animation, event)
   if event == "smoke" then
      self.smoke_fx:stop()
   end
end


local CTrailerDrinker = oo.class( {}, CTalker )

function CTrailerDrinker:loadParameters()
end

function CTrailerDrinker:OnCreate()
   CTalker.OnCreate( self )

   CTrailerDrinker.loadParameters( self )
end

function CTrailerDrinker:addActions()
   local drink = CAction{}
   drink.start = self.drink_start
   drink.stop  = self.drink_stop
   drink.name  = "drink"

   local root = CNode{}
   root:yes (self.talk_):no (drink)

   self.actionsScheduler.root = root
end

function CTrailerDrinker:drink_start()
   self.headLooking = false
   self.drinkEntity = getScene():createEntity("bottle_whiskey.sbg", "")

   self.drinkEntity:getPose():setParent(self:getBonePose("item_slot2"))
   self.drinkEntity:getPose():resetLocalPose()
   -- self.drinkEntity:getPose():setLocalRotQuat(quatFromEuler({x=90, y=90}) )
   self.drinkEntity:getPose():setLocalPos    ( {y=-30} )
   self.animationsManager:loopAnimation( "drink_idle" .. ".caf")
   self.drinkTimer = runTimer(5 + rand(7), self, CTrailerDrinker.drink_loop, false)
end

function CTrailerDrinker:drink_loop()
   self.animationsManager:playAnimation( "drink_loop" .. ".caf", false)
   self.drinkTimer = runTimer(5 + rand(7), self, CTrailerDrinker.drink_loop, false)
end

function CTrailerDrinker:drink_stop()
   getScene():destroyEntity( self.drinkEntity )
   self.drinkEntity = nil
   if self.drinkTimer then
      self.drinkTimer:stop()
      self.drinkTimer = nil
   end
   self.animationsManager:loopAnimation( self.idleAnimation .. ".caf" )
   self.headLooking = true
end

local CTrailerEater = oo.class( {}, CTalker )

function CTrailerEater:loadParameters()
end

function CTrailerEater:OnCreate()
   CTalker.OnCreate( self )

   CTrailerEater.loadParameters( self )
end

function CTrailerEater:addActions()
   local eat = CAction{}
   eat.start = self.eat_start
   eat.stop  = self.eat_stop
   eat.name  = "eat"

   local root = CNode{}
   root:yes (self.talk_):no (eat)

   self.actionsScheduler.root = root
end

function CTrailerEater:eat_start()
   self.headLooking = false
   self.eatEntity = getScene():createEntity("fried_meat.sbg", "")

   self.eatEntity:getPose():setParent(self:getBonePose("item_slot2"))
   self.eatEntity:getPose():resetLocalPose()
   self.eatEntity:getPose():setLocalRotQuat(quatFromEuler({x=90}) )
   local scale = 0.5
   self.eatEntity:getPose():setLocalScale({x=scale,y=scale,z=scale})
   self.eatEntity:getPose():setLocalPos({y=3,x=3})
   self.animationsManager:loopAnimation( "eat_idle" .. ".caf")
   self.eatTimer = runTimer(5 + rand(7), self, CTrailerEater.eat_loop, false)
end

function CTrailerEater:eat_loop()
   self.animationsManager:playAnimation( "eat_loop" .. ".caf", false)
   self.eatTimer = runTimer(5 + rand(7), self, CTrailerEater.eat_loop, false)
end

function CTrailerEater:eat_stop()
   getScene():destroyEntity( self.eatEntity )
   self.eatEntity = nil
   if self.eatTimer then
      self.eatTimer:stop()
      self.eatTimer = nil
   end
   self.animationsManager:loopAnimation( self.idleAnimation .. ".caf" )
   self.headLooking = true
end


local CTrailerCook = oo.class( {}, CTalker )

function CTrailerCook:loadParameters()
end

function CTrailerCook:OnCreate()
   CTalker.OnCreate( self )

   CTrailerCook.loadParameters( self )
end

function CTrailerCook:addActions()
   local cook = CAction{}
   cook.start = self.cook_start
   cook.stop  = self.cook_stop
   cook.name  = "cook"

   local root = CNode{}
   root:yes (self.talk_):no (cook)

   self.actionsScheduler.root = root
end

function CTrailerCook:cook_start()
   self.headLooking = false
   self.spoonEntity = getScene():createEntity("big_spoon.sbg", "")

   self.spoonEntity:getPose():setParent(self:getBonePose("item_slot1"))
   self.spoonEntity:getPose():resetLocalPose()
   -- self.jointEntity:getPose():setLocalRotQuat(quatFromEuler({x=90, y=90}) )
   -- self.jointEntity:getPose():setLocalPos    ( {z=-10} )
   self.animationsManager:loopAnimation( "idle_pot" .. ".caf")
   self.animationsManager:playAnimation( "idle_pot" .. ".caf", false)
   self.animationsManager:subscribeAnimationEnd("idle_pot" .. ".caf", self, CTrailerCook.cook_loop)
   --   self.cookTimer = runTimer(5 + rand(7), self, CTrailerCook.cook_loop, false)
end

function CTrailerCook:cook_loop()
   local r = rand(10)
   local anim
   if r > 9 then
      anim = "idle_pot_2.caf"
   else
      anim = "idle_pot.caf"
   end
   self.animationsManager:playAnimation( anim, false)
   runTimer(0, {self=self, anim=anim}, function(self)
      self.self.animationsManager:subscribeAnimationEnd(self.anim, self.self, CTrailerCook.cook_loop)
   end, false)
   --   self.cookTimer = runTimer(5 + rand(7), self, CTrailerCook.cook_loop, false)
end

function CTrailerCook:cook_stop()
   getScene():destroyEntity( self.spoonEntity )
   self.spoonEntity = nil
   if self.cookTimer then
      self.cookTimer:stop()
      self.cookTimer = nil
   end
   self.animationsManager:loopAnimation( self.idleAnimation .. ".caf" )
   self.headLooking = true
end

return {
   CTrailerSmoker=CTrailerSmoker,
   CTrailerDrinker=CTrailerDrinker,
   CTrailerCook=CTrailerCook,
}
