local oo = require "loop.simple"
local _rootItem = (require "roots")._rootItem
local ItemsData = (require "itemsData")
local MiscLabels = require "miscLabels"
local random = require "random"

local tablex = require "pl.tablex"
local hlp = require "helpers"

---@class CItem : shItem
local CItem = oo.class({
   creator = nil,
   owner   = nil,
}, _rootItem)

CItem.insertSoundToTable = hlp.insertSoundToTable

function CItem:OnCreate(params)
   local name = params and params.itemName or self:getName()
   self:setItemName(name)
   self:setClassParams(ItemsData.getItemClassParams(self:getItemName()))
   self:setQuality(ItemsData.getItemDefaultQuality(self:getItemName()), true)

   self.sounds = {}
   self:initSounds()
end

function CItem:initSounds()
   local soundsList = self:getSounds()

   --Default values
   soundsList.equip = soundsList.equip or {name = "Play_common_item_equip", distance = 2000}
   soundsList.unequip = soundsList.unequip or {name = "Play_common_item_unequip", distance = 2000}

   for action, sounds in pairs(soundsList) do
      if self.sounds[action] == nil then
         self.sounds[action] = {}
      end
      -- check if we don't have an array of sounds to be played randomly
      if sounds.name then
         sounds = {sounds}
      end
      for _, sound in ipairs(sounds) do
         self:insertSoundToTable(sound.name, self.sounds[action], {distance=sound.distance})
      end
   end
end

function CItem:playSound(name, localPose, params)
   params = params or {}
   local sounds = self.sounds[name]
   if sounds then
      if self:getAnimations() ~= "boxing" and params.target == getMC() then
         -- CMainCharacter has his own sounds
         return
      elseif params.targetType and params.targetType ~= "character" then
         -- TODO:FIXME: no sounds for hitting rigids for now, remove when added
         return
      end

      if sounds and #sounds > 0 then
         local sound = random.choice(sounds)
         --Remove spatial for player items cause they are so close to the listener,
         --that their movement around it causes negative response
         if self.owner and self.owner.owner and self.owner.owner == getPlayer() then
            sound:setSpatial(0)
         else
            sound:setSpatial(100)
         end
         if localPose == true then
            sound:getPose():setParent(self:getPose())
            sound:getPose():resetLocalPose()
         elseif localPose ~= nil then -- impactPos comes
            sound:getPose():resetParent()
            sound:getPose():resetLocalPose()
            sound:getPose():setPos(localPose)
         end
         if params.speed then
            sound:setSpeed(params.speed)
         end
         sound:play()
      end
   end
end

function CItem:stopSound(name)
   local sounds = self.sounds[name]
   if sounds then
      for _,sound in ipairs(sounds) do
         sound:stop()
      end
   end
end

function CItem:isSoundPlaying(name)
   local sounds = self.sounds[name]
   if sounds then
      for _,sound in ipairs(sounds) do
         if sound:isPlaying() then
            return true
         end
      end
   end
end

function CItem:OnDestroy()
   self:OnDeactivate()
end

function CItem:OnHitTarget(params)
   -- impactor - damage source object (item)
   -- impactType - string (ranged, melee, explosion)
   -- impactPos - impact position
   -- impactForce - set by engine, can be changed
   -- impactRadius - set by engine, can be changed
   -- target - target object (character, rigid)
   -- targetType - target type (string) (character, rigid)
   -- interrupt - boolean, defaults to false. if set to true - stops hit event propagation
   self:playSound("target", params.impactPos, params)
   if params.targetType == "character" and self.hitEffects then
      for _, effect in ipairs(self.hitEffects) do
         effect = tablex.deepcopy(effect)
         local hp = effect.health
         if hp and hp < 0 then
            hp = hp * getGlobalParam("dmgMultiplier")
            if params.impactor == getPlayer() then
               hp = hp * getGlobalParam("dmgOutgoingMultiplier")
            elseif params.target == getPlayer() then
               hp = hp * getGlobalParam("dmgIncomingMultiplier")
            end
            effect.health = hp
         end

         effect.inflictor = self:getOwner():getOwner():getName()
         effect.impactPos = worldPointToLocal(params.impactPos, params.target:getPose())
         params.target.statusEffectsManager:addStatusEffect(effect)
      end
   end
end

function CItem:setClassParams(params)
   if not params then
      return
   end
   self:initParam("impactFX", params.impactFX, nil)
   self:initParam("traceFX", params.traceFX, nil)
   self:initParam("hitEffects", params.hitEffects, nil)

   if params.lights and #params.lights > 0 then
      self.lights = {}

      for i=1,#params.lights do
         local light = self:createAspect("omni")

         light:getPose():setParent(self:getPose())
         light:getPose():resetLocalPose()

         if params.lights[i].pos then
            light:getPose():setLocalPos(params.lights[i].pos)
         end

         if params.lights[i].color then
            light:setColor(params.lights[i].color)
         end

         if params.lights[i].radius then
            light:setRadius(params.lights[i].radius)
         end

         if params.lights[i].intensity then
            light:setIntensity(params.lights[i].intensity)
         end

         self.lights[#self.lights+1] = light
      end
   end
end

function CItem:initParam(paramName, value, default)
   if value then
      self[paramName] = value
   else
      self[paramName] = default
   end
end

function CItem:setQuality(qualityInt, silent)
   if not qualityInt then return end
   self.quality = qualityInt
   if not silent and self.owner then
      self.owner:OnChange({eventType="QualityChanged", item = self})
   end
end

function CItem:getQuality()
   return self.quality
end

function CItem:getQualityBonus(bonusType)
   return ItemsData.getItemQualityBonus(bonusType, self:getQuality())
end

function CItem:setCreator(obj)
   self.creator = obj
end

function CItem:getCreator()
   return self.creator
end

function CItem:setItemName(name)
   self.name = name
end

function CItem:getItemName()
   return self.name
end

function CItem:getLabel()
   local label = ItemsData.getItemLabel(self:getItemName())

   if label ~= "" then
      return label
   else
      return self:getItemName()
   end
end

function CItem:getConsumeEffects()
   local itemName = self:getItemName()
   local effects = {}

   local foodInfo = ItemsData.getItemFoodInfo(itemName)
   if foodInfo then
      local t = {
         changeStats = foodInfo, duration = 2, name = "food", label = self:getLabel(),
         destroyEffects = {name = {"food"}}
      }
      table.insert(effects, t)
   end

   local buffInfo = ItemsData.getItemPermaBuffInfo(itemName)
   if buffInfo then
      local t = {
         name = itemName, label = self:getLabel(),
         saved = true, stackable = true,
         statBonuses = buffInfo,
      }
      table.insert(effects, t)
   end

   local useEffects = self:getConsumeInfo()
   if useEffects then
      for name,effect in pairs(useEffects) do
         effect = tablex.deepcopy(effect)
         effect.name = name
         effect.label = self:getLabel() .. " - " .. MiscLabels.getLabel(name)
         table.insert(effects, effect)
      end
   end

   return effects
end

function CItem:getDesc()
   return ItemsData.getItemDesc(self:getItemName())
end

function CItem:getValue()
   return ItemsData.getItemValue(self:getItemName(), self:getQuality())
end

function CItem:isConsumable()
   return ItemsData.isItemConsumable(self:getItemName())
end

function CItem:isFood()
   return ItemsData.isItemFood(self:getItemName())
end

function CItem:isDrink()
   return ItemsData.isItemDrink(self:getItemName())
end

function CItem:isSmokable()
   return ItemsData.isItemSmokable(self:getItemName())
end

function CItem:isBandage()
   return ItemsData.isItemBandage(self:getItemName())
end

function CItem:isInjector()
   return ItemsData.isItemInjector(self:getItemName())
end

function CItem:isEnergy()
   return ItemsData.isItemEnergy(self:getItemName())
end

function CItem:getEnergyCost()
   return ItemsData.getItemEnergyCost(self:getItemName())
end

function CItem:getRestoreHealth()
   local info = ItemsData.getItemFoodInfo(self:getItemName())

   if info and info.health then
      return info.health
   end

   return 0
end

function CItem:getRestoreFood()
   local info = ItemsData.getItemFoodInfo(self:getItemName())

   if info and info.food then
      return info.food
   end

   return 0
end

function CItem:getRestoreWater()
   local info = ItemsData.getItemFoodInfo(self:getItemName())

   if info and info.water then
      return info.water
   end

   return 0
end

function CItem:getArmor()
   return ItemsData.getItemArmor(self:getItemName())
end

function CItem:getDmgPerEnergy()
   return self.dmgPerEnergy
end

function CItem:OnInventoryChange(event)
end

function CItem:OnDrop(char)
   self:setVisible(true)
   self.owner = nil
end

function CItem:OnActivate()
   self:runAction()
   self:playSound("activate", true)
   if self:isMessage() then
      gameplayUI.messageUI:showItem(true, self:getItemName())
      questSystem:fireEvent("read", self.name, self)
   elseif self:isMap() then
      if gameplayUI.mapUI.currentMapItemName == self:getItemName() then
         gameplayUI.gameplayMenuUI:toggleTab("Map")
      else
         gameplayUI:showInfoTextEx("This map is useless in this area", "minor", "")
      end
   elseif self:isDrawing() then
      gameplayUI.drawingUI:show(true, self:getItemName())
   end
end

function CItem:OnDeactivate()
   self:stopAction()
end

function CItem:OnAltActivate()
end

function CItem:OnAltDeactivate()
end

function CItem:OnEquip(slotId, silent)
   if self.impactFX then
      self:setImpactEffects(self.impactFX)
   end
   if self.traceFX then
      self:setTraceEffects(self.traceFX)
   end
   if not silent then
      self:playSound("equip", true)
   end
end

function CItem:OnUnequip(slotId, silent)
   if not silent then
      self:playSound("unequip", true)
   end
end

function CItem:getType()
   return ""
end

function CItem:getOwner()
   return self.owner
end

function CItem:getId()
   return self.id
end

function CItem:getCount(searchSimilar)
   if self:getOwner() then
      return self:getOwner():getItemCount(self, searchSimilar)
   else
      return self.count
   end
end

function CItem:setCount(count)
   if self:getOwner() then
      self:getOwner():setItemCount(self, count)
   else
      self.count = count
      if self.count <= 0 then
         self:destroy()
      end
   end
end

function CItem:changeCount(delta)
   self:setCount(self:getCount() + delta)
end

function CItem:isUsable()
   return ItemsData.isItemUsable(self.name)
end

function CItem:isEquipable()
   return ItemsData.isItemEquipable(self.name)
end

function CItem:getEquippedSlot()
   return self.equippedSlot
end

function CItem:isEquipped()
   return self:getEquippedSlot() ~= nil
end

function CItem:getFastAccessSlot()
   return self.fastAccessSlot
end

function CItem:hasAltActivation()
   return false
end

function CItem:show()
   self:setVisible(true)

   if self.lights then
      for i=1,#self.lights do
         self.lights[i]:setVisible(true)
      end
   end
end

function CItem:hide()
   self:setVisible(false)

   if self.lights then
      for i=1,#self.lights do
         self.lights[i]:setVisible(false)
      end
   end
end

function CItem:drop()
   if self:getOwner() then
      return self:getOwner():dropItem(self.id)
   end
   return nil
end

function CItem:destroy(count, silent, noEvent, searchSimilar)
   if self:getOwner() then
      self:getOwner():destroyItem(self, count, silent, noEvent, searchSimilar)
   else
      hlp.safeDestroyEntity(self)
   end
end

function CItem:getInteractTime(interactType)
   return 0
end

function CItem:isMeleeWeapon()
   return ItemsData.isItemMeleeWeapon(self:getItemName())
end

function CItem:isRangedWeapon()
   return ItemsData.isItemRangedWeapon(self:getItemName())
end

function CItem:isItem()
   return ItemsData.isItemItem(self:getItemName())
end

function CItem:isAmmo()
   return string.find(self:getItemName(), "ammo") ~= nil
end

function CItem:isWeapon()
   return ItemsData.isItemWeapon(self:getItemName())
end

function CItem:isAttire()
   return ItemsData.isItemAttire(self.name)
end

function CItem:isArmor()
   return ItemsData.isItemArmor(self.name)
end

function CItem:isAccessory()
   return ItemsData.isItemAccessory(self.name)
end

function CItem:getMovementRestriction()
   return ItemsData.getItemMovementRestriction(self:getItemName())
end

function CItem:getSounds()
   return ItemsData.getItemSounds(self.name)
end

function CItem:getAttachments()
   return ItemsData.getItemAttachments(self.name)
end

function CItem:isMoney()
   return ItemsData.isItemMoney(self.name)
end

function CItem:isMessage()
   return ItemsData.isItemMessage(self.name)
end

function CItem:isItemContainer()
   return ItemsData.isItemContainer(self.name)
end

function CItem:isDrawing()
   return ItemsData.isItemDrawing(self.name)
end

function CItem:isMap()
   return ItemsData.isItemMap(self.name)
end

function CItem:isFaceCover()
   return ItemsData.isItemFaceCover(self:getItemName())
end

function CItem:hasColliderOffset()
   return ItemsData.hasItemColliderOffset(self.name)
end

function CItem:getColliderRadius()
   return ItemsData.getItemColliderRadius(self.name)
end

function CItem:getColliderLength()
   return ItemsData.getItemColliderLength(self.name)
end

function CItem:getHitEffects()
   return ItemsData.getItemHitEffects(self.name)
end

function CItem:getConsumeInfo()
   return ItemsData.getItemConsumeInfo(self.name)
end

function CItem:getPermaBuffInfo()
   return ItemsData.getItemPermaBuffInfo(self.name)
end

function CItem:getDamage()
   return self.damage or ItemsData.getItemDamage(self.name, self:getQuality())
end

function CItem:setDamage(damage)
   self.damage = damage
end

function CItem:getCooldown()
   return self.cooldown or ItemsData.getItemCooldown(self.name, self:getQuality())
end

function CItem:setCooldown(cooldown)
   self.cooldown = cooldown
end

function CItem:getMessage()
   return ItemsData.getItemMessage(self.name)
end

function CItem:getAttireType()
   return ItemsData.getAttireType(self.name)
end

function CItem:getAttireMeshes()
   return ItemsData.getAttireMeshes(self.name)
end

function CItem:getAnimations()
   return ItemsData.getItemAnimations(self.name)
end

function CItem:getReloadAnimations()
   return ItemsData.getItemReloadAnimations(self.name)
end

function CItem:isBooze()
   return ItemsData.isItemBooze(self.name)
end

function CItem:getBoozeStrength()
   return ItemsData.getBoozeStrength(self.name)
end

function CItem:getInvCategory()
   return ItemsData.getItemInvCategory(self.name)
end

function CItem:getLimitCategory()
   return ItemsData.getItemLimitCategory(self:getItemName())
end

function CItem:getWeaponType()
   return ItemsData.getItemWeaponType(self.name)
end

function CItem:isQuestItem()
   return ItemsData.isItemQuestItem(self.name)
end

return {CItem=CItem}
