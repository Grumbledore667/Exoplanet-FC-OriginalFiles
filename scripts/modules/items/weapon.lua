local oo = require "loop.multiple"
local _rootWeapon = (require "roots")._rootWeapon
local CItem = (require "items.item").CItem
local ItemsData = require "itemsData"

---@class CWeapon : CItem
local CWeapon = oo.class({}, _rootWeapon, CItem)
---@class CHandToHand : CWeapon
local CHandToHand = oo.class({}, CWeapon)

function CHandToHand:OnCreate(params)
   CWeapon.OnCreate(self, params)
end

function CHandToHand:OnActivate()
   local inventory = self:getOwner()
   if not inventory then
      return
   end
   local char = inventory:getOwner()
   local prefabName = char:getPrefabName()
   if prefabName == "human_male.cfg" or prefabName == "abori.cfg" then
      if char.animationsManager.currentAnimations
         and (char.animationsManager.currentAnimations["h2h_idle_melee_3"]
         or char.animationsManager.currentAnimations["h2h_idle_melee_4"]
         or char.animationsManager.currentAnimations["h2h_idle_melee_2"]) then
         self:getPose():setParent(self:getOwner():getOwner():getBonePose("item_slot2"))
         self:getPose():resetLocalPose()
      else
         self:getPose():setParent(self:getOwner():getOwner():getBonePose("item_slot1"))
         self:getPose():resetLocalPose()
      end
   end
   CWeapon.OnActivate(self)
end

function CWeapon:OnCreate(params)
   CItem.OnCreate(self, params)

   self:setGameGroups("0")

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

function CWeapon:initSounds()
   CItem.initSounds(self)

   if self:getAnimations() == "melee_low" then
      local aspect = self:createAspect("Play_flesh_impact_axe")
      aspect:setDistance(1000)
      self.sounds.target = {aspect} --TODO:FIXNE: get rid of this mockup of deprecated table structure which is used in CItem.playSound
   elseif self:getAnimations() == "boxing" then
      local aspect = self:createAspect("Play_cloth_impact_fist")
      aspect:setDistance(1000)
      self.sounds.target = {aspect}
   end
end

function CWeapon:getType()
   return "weapon"
end

function CWeapon:isEquipable()
   return true
end

return { CWeapon=CWeapon,
         CHandToHand=CHandToHand}
