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
   if char:getPrefabName() == "human_male.cfg" then
      if char.animationsManager.currentAnimations
         and (char.animationsManager.currentAnimations["melee_idle_boxing_3"]
            or char.animationsManager.currentAnimations["melee_idle_boxing_4"]) then
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
   self.sounds.target = {}
   local impactList = self.sounds.target
   if self:getAnimations() == "melee_low" then
      for i=1,5 do
         local soundName = string.format("flesh_impact_axe_%d%s", i, ".wav")
         self:insertSoundToTable(soundName, impactList, {distance=1000, volume=1.3})
      end
   elseif self:getAnimations() == "boxing" then
      --Inited as default due to lack of soundfiles
      for i=1,5 do
         local soundName = string.format("cloth_impact_fist_%d%s", i, ".wav")
         self:insertSoundToTable(soundName, impactList, {distance=1000})
      end
   end
end

function CWeapon:getDamage()
   return self.damage or ItemsData.getItemDamage(self.name, self:getQuality())
end

function CWeapon:getType()
   return "weapon"
end

function CWeapon:isEquipable()
   return true
end

return { CWeapon=CWeapon,
         CHandToHand=CHandToHand}
