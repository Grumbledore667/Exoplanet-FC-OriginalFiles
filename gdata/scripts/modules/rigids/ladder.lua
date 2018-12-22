local oo = require "loop.simple"

local CLadder = oo.class({})

function CLadder:OnCreate()
   self.steps = 5
   local name = self:getPrefabName()
   if name == "ladder_test.sbg" or name == "ladder_clean.sbg" or name == "ladder_old.sbg" or name == "ladder_wood.sbg" then
      self.steps = 5
   elseif name == "ladder_clean_3m.sbg" then
      self.steps = 7
   elseif name == "ladder_test_2.sbg" or name == "ladder_clean_2.sbg" or name == "ladder_old_2.sbg" or name == "ladder_wood_2.sbg" then
      self.steps = 11
   elseif name == "ladder_test_3.sbg" or name == "ladder_clean_3.sbg" or name == "ladder_old_3.sbg" or name == "ladder_wood_3.sbg" then
      self.steps = 16
   elseif name == "ladder_test_4.sbg" or name == "ladder_clean_4.sbg" or name == "ladder_old_4.sbg" or name == "ladder_wood_4.sbg" then
      self.steps = 22
   end
   self.interactor_bottom = self:createAspect( "interactor" )
   self.interactor_bottom:setObject( self )
   self.interactor_bottom:setRaycastRadius( 150.0 )
   self.interactor_bottom:getPose():setParent( self:getPose() )
   self.interactor_bottom:getPose():resetLocalPose()
   self.interactor_bottom:setRaycastActive( true )

   self.interactor_top = self:createAspect( "interactor" )
   self.interactor_top:setObject( self )
   self.interactor_top:setRaycastRadius( 150.0 )
   self.interactor_top:getPose():setParent( self:getPose() )
   self.interactor_top:getPose():resetLocalPose()
   self.interactor_top:getPose():setLocalPos( {x=0,y=50*self.steps,z=0} )
   self.interactor_top:setRaycastActive( true )

   if ( self.isMaterialHelper and not self:isMaterialHelper() ) then
      self:addMaterial( "highlight" )
      self:setMaterialVisible( "highlight", false )
   end
end

function CLadder:OnFocusBegin( obj )
   if ( self.setMaterialVisible ) then
      self:setMaterialVisible( "highlight", true )
   end
end

function CLadder:OnFocusEnd( obj )
   if ( self.setMaterialVisible ) then
      self:setMaterialVisible( "highlight", false )
   end
end

function CLadder:bottom()
   local p = getPlayer()
   local dist_to_bottom = getDistance(p:getPose():getPos(), self.interactor_bottom:getPose():getPos())
   local dist_to_top = getDistance(p:getPose():getPos(), self.interactor_top:getPose():getPos())

   return dist_to_bottom < dist_to_top
end

function CLadder:activate( obj )
   local p = getPlayer()

   if self:bottom() then
      p:climbLadder(self)
   else
      p:climbLadderDown(self)
   end
   return true
end

function CLadder:deactivate( obj )
   return true
end

function CLadder:getType()
   return "activator"
end

function CLadder:getLabel()
   return ""
end

function CLadder:getLabelPos()
   local pos
   if self:bottom() then
      pos = self.interactor_bottom:getPose():getPos()
   else
      pos = self.interactor_top:getPose():getPos()
   end
   return vec3Add(pos, {y=100})
end

function CLadder:getInteractLabel()
   if self:bottom() then
      return "climb"
   else
      return "climb down"
   end
end

return {CLadder=CLadder}
