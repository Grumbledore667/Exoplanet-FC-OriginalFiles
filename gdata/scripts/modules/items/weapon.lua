local oo = require "loop.simple"
local CItem = (require "items.item").CItem

local CWeapon = oo.class({}, CItem)

local CHandToHand = oo.class({}, CWeapon)

function CHandToHand:OnActivate()
   local char = self.owner.owner
   if char:getPrefabName() == "human_male.cfg" then
      if char.animationsManager.currentAnimations
         and ( char.animationsManager.currentAnimations["melee_idle_boxing_3.caf"]
            or char.animationsManager.currentAnimations["melee_idle_boxing_4.caf"] ) then
         self:getPose():setParent( self.owner.owner:getBonePose( "item_slot2" ) )
         self:getPose():resetLocalPose()
      else
         self:getPose():setParent( self.owner.owner:getBonePose( "item_slot1" ) )
         self:getPose():resetLocalPose()
      end
   end
   CWeapon.OnActivate( self )
end

function CWeapon:OnCreate()
   CItem.OnCreate( self )
   self:setGameGroups("0")
end

function CWeapon:callAfterNameSet()
   CItem.callAfterNameSet(self)

   if self:hasColliderOffset() then
      self:setOffset(true)
   else
      self:setOffset(false)
   end

   local radius = self:getColliderRadius() or 10
   self:setRadius(radius)
   local length = self:getColliderLength() or 50
   self:setLength(length)
end

function CWeapon:getType()
   return "weapon"
end

function CWeapon:isEquipable()
   return true
end

return { CWeapon=CWeapon,
         CHandToHand=CHandToHand}
