local oo = require "loop.simple"
local CTalker = (require "characters.talker").CTalker
local CActionsScheduler = (require "actionsScheduler").CActionsScheduler
local CAction = (require "action").CAction
local CNode = (require "node").CNode
local ObjectsLabels = (require "objectsLabels")

local CBetterBirds = oo.class( {}, CTalker )

function CBetterBirds:loadParameters()
   CTalker.loadParameters( self )

   -- self.clothes = {}

   -- for i=1,3 do
   --    self.clothes[i] = {}

   --    self.clothes[i].aspectName = loadParam( self, "aspect" .. i, "" )
   --    self.clothes[i].boneName   = loadParam( self, "slotName" .. i, "" )
   --    self.clothes[i].offset     =
   --    {
   --       x = loadParamNumber( self, "offset" .. i .. "X", 0 ),
   --       y = loadParamNumber( self, "offset" .. i .. "Y", 0 ),
   --       z = loadParamNumber( self, "offset" .. i .. "Z", 0 ),
   --    }
   --    self.clothes[i].scale = loadParamNumber( self, "scale" .. i, 1 )
   -- end

   -- self:createClothes()
   -- self:setMaxHealthCount( 1 )
   -- self:setHealthCount   ( 1 )
end

function CBetterBirds:Col()
end

function CBetterBirds:Dmg()
   self:setHealthCount(0)
end

function CBetterBirds:OnCreate()
   CTalker.OnCreate( self )
   CBetterBirds.loadParameters( self )
   self:setCollision(false)
   self:setMassCoeff(0)

   -- runTimer( 2, self, self.Col , false )
   -- runTimer( 5, self, self.Dmg , false )
end
   
-- function CBetterBirds:createClothes()
--    for i=1,#self.clothes do
--       self.clothes[i].aspect = self:createAspect( self.clothes[i].aspectName )
--       if ( self.clothes[i].aspect ) then
--          self.clothes[i].aspect:getPose():setParent( self:getBonePose( self.clothes[i].boneName ) )
--          self.clothes[i].aspect:getPose():resetLocalPose()
--          self.clothes[i].aspect:getPose():setLocalPos( self.clothes[i].offset )
--          self.clothes[i].aspect:getPose():setLocalScale( {x=self.clothes[i].scale, y=self.clothes[i].scale, z=self.clothes[i].scale} )
--       end
--    end
-- end

-- function CBetterBirds:setVisible( state )
--    CTalker.setVisible( state )
   
--    for i=1,#self.clothes do
--       if ( self.clothes[i].aspect ) then
--          self.clothes[i].aspect:setVisible( state )
--       end
--    end
-- end

return {CBetterBirds=CBetterBirds}
