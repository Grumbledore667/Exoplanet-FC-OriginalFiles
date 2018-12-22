local oo = require "loop.simple"
local CCharacter = (require "character").CCharacter
local CActionsScheduler = (require "actionsScheduler").CActionsScheduler
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local ItemsData = (require "itemsData")

local CBirds = oo.class({}, CCharacter)

function CBirds:initSenses()
-- self.senseScheduler:addSense( "inZone", false, self.senseScheduler, self.senseScheduler.checkZone )
end

function CBirds:loadParameters()
-- self.parameters.zoneSize = loadParamNumber(self, "walkRange" , 1000)

-- self.senseScheduler:setFeelRadius( loadParamNumber(self, "viewRange", 3000) )

-- self.parameters.maxLandingSpeed = 1500
end

function CBirds:OnCreate()
   CCharacter.OnCreate(self)

   -- self.weapon = "bug_ball.wpn"
   -- local item = self.itemsManager:addItem( self.weapon )
   -- self.itemsManager:equipSlotWithItem( 0, item.id )

   -- CBirds.loadParameters(self)
   -- CBirds.initSenses    (self)

   -- self.interactor = self:createAspect( "interactor" )
   -- self.interactor:setObject( self )
   -- self.interactor:setTriggerRadius( 150.0 )
   -- self.interactor:getPose():setParent( self:getPose() )
   -- self.interactor:getPose():resetLocalPose()
   -- self.interactor:getPose():setLocalPos( {x=0,y=0,z=0} )
   -- self.interactor:setTriggerActive( false )

   self:addActions()
   -- self.animationsManager:stopAnimation ( "death.caf" )
   -- runTimer( rand(5), self, self.changeWalkDir, false )

   -- self:setRole( ROLE_INSECT )

   -- self:setMaxHealthCount( 10 )
   -- self:setHealthCount   ( 10 )

   -- self:enablePickupItem()
end

-- Timed events

-- Actions

function CBirds:addActions()
   local move = CAction{}
   move:allowRestartOnEvent("onChangeState")
   move.start = self.move_start
   move.stop  = self.move_stop
   move.name = "move"

   local root = CNode{}
   root:yes (self.alive_):yes (move)

   self.actionsScheduler.root = root
end


-- Predicates

function CBirds:alive_()
   return true
end

-- Callbacks

function CBirds:move_start()
   -- self:setOrientationSpeed( 500 )

   -- self:setMoveSpeed( 300 )
   self.animationsManager:loopAnimation( "fly.caf" )
end

function CBirds:move_stop()
-- self:setMoveSpeed( 0 )
end

function CBirds:getType()
   return ""
end

function CBirds:getLabel()
   return ""
end

function CBirds:getInteractLabel()
   return ""
end

return {CBirds=CBirds}
