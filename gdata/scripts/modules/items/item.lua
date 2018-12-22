local oo = require "loop.simple"
local ItemsData = (require "itemsData")

local CItem = oo.class({
   creator = nil,
   owner   = nil,
   isItem  = true
})

function CItem:initSounds()
   self.sounds = {}

   local soundsList = ItemsData.getItemSounds( self:getItemName() )

   if ( soundsList ) then
      for soundLabel,sounds in pairs(soundsList) do
         -- check if we don't have an array of sounds to be played randomly
         if sounds.name then
            sounds = {sounds}
         end
         for _, sound in ipairs( sounds ) do
            if self.sounds[soundLabel] == nil then
               self.sounds[soundLabel] = {}
            end
            local aspect = self:createAspect( sound.name )
            if aspect then
               aspect:setDistance( sound.distance )
               aspect:setLoop    ( false )
               table.insert(self.sounds[soundLabel], aspect)
            else
               log("ERROR: couldn't create sound " .. tostring(sound.name))
            end
         end
      end
   end
end

function CItem:OnCreate()
   --log( "class = " .. self:getClass() )
   --log( "name = " .. self:getName() )
   --log( "params = " .. tostring(ItemsData.getItemClassParams( self:getName() )) )
   self:setItemName(self:getName())
end

function CItem:callAfterNameSet()
   self:setClassParams( ItemsData.getItemClassParams( self:getItemName() ) )

   self:initSounds()
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
   self:playSound("target", params.impactPos)
   if params.targetType == "character" then
      local hitEffect = tableDeepCopy( self.hitEffect, destiny )
      if hitEffect then
         local hp = hitEffect.health
         if hp and hp < 0 then
            hp = hp * getGlobalParam("dmgMultiplier")
            if params.impactor == getPlayer() then
               hp = hp * getGlobalParam("dmgOutgoingMultiplier")
            elseif params.target == getPlayer() then
               hp = hp * getGlobalParam("dmgIncomingMultiplier")
            end
            hitEffect.health = hp
         end

         hitEffect.inflictor = self.owner.owner:getName()
         hitEffect.impactPos = worldPointToLocal( params.impactPos, params.target:getPose() )
         params.target.statusEffectsManager:addStatusEffect( hitEffect )
      end
   end
end

function CItem:setClassParams( params )
   if ( not params ) then
      return
   end
   self:initParam( "impactFX", params.impactFX, nil )
   self:initParam( "traceFX", params.traceFX, nil )
   self:initParam( "hitEffect", params.hitEffect, nil )

   if ( params.lights and #params.lights > 0 ) then
      self.lights = {}

      for i=1,#params.lights do
         local light = self:createAspect( "omni" )

         light:getPose():setParent( self:getPose() )
         light:getPose():resetLocalPose()

         if ( params.lights[i].pos ) then
            light:getPose():setLocalPos( params.lights[i].pos )
         end

         if ( params.lights[i].color ) then
            light:setColor( params.lights[i].color )
         end

         if ( params.lights[i].radius ) then
            light:setRadius( params.lights[i].radius )
         end

         if ( params.lights[i].intensity ) then
            light:setIntensity( params.lights[i].intensity )
         end

         self.lights[#self.lights+1] = light
      end
   end
end

function CItem:initParam( paramName, value, default )
   if ( value ) then
      self[paramName] = value
   else
      self[paramName] = default
   end
end

function CItem:setCreator( obj )
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
   local label = ItemsData.getItemLabel( self:getItemName() )

   if ( label ~= "" ) then
      return label
   else
      return self:getItemName()
   end
end

function CItem:getDesc()
   return ItemsData.getItemDesc( self:getItemName() )
end

function CItem:getValue()
   return ItemsData.getItemValue( self:getItemName() )
end

function CItem:isConsumable()
   return ItemsData.isItemConsumable( self:getItemName() )
end

function CItem:isFood()
   return ItemsData.isItemFood( self:getItemName() )
end

function CItem:isDrink()
   return ItemsData.isItemDrink( self:getItemName() )
end

function CItem:isBandage()
   return ItemsData.isItemBandage( self:getItemName() )
end

function CItem:isInjector()
   return ItemsData.isItemInjector( self:getItemName() )
end

function CItem:getRestoreHealth()
   local info = ItemsData.getItemFoodInfo( self:getItemName() )

   if ( info and info.health ) then
      return info.health
   end

   return 0
end

function CItem:getRestoreFood()
   local info = ItemsData.getItemFoodInfo( self:getItemName() )

   if ( info and info.food ) then
      return info.food
   end

   return 0
end

function CItem:getRestoreWater()
   local info = ItemsData.getItemFoodInfo( self:getItemName() )

   if ( info and info.water ) then
      return info.water
   end

   return 0
end

function CItem:getArmor()
   local armor = ItemsData.getItemArmor( self:getItemName() )

   if armor then
      return armor
   end

   return 0
end

function CItem:getDmgPerEnergy()
   return self.dmgPerEnergy or 0
end


function CItem:OnOwnerUpdate( action, item )
end

function CItem:OnPick( char )
   if ( self.creator ) then
      if ( self.creator.destroyByChar ) then
         self.creator:destroyByChar( char )
      elseif ( self.creator.destroy ) then
         self.creator:destroy()
      else
         getScene():destroyEntity( self.creator )
      end

      self.creator = nil
   end

   self.owner = char.itemsManager
   self:getPose():resetParent()
end

function CItem:OnDrop( char )
   self:setVisible( true )
   self.owner = nil
end

function CItem:OnActivate()
   self:runAction()
   self:playSound( "activate", true )
   if self:isMessage() then
      local title = self:getMessage().eng.title
      local contents = self:getMessage().eng.contents
      gameplayUI:showMessage(title, contents)

      questSystem:fireEvent("read", self.name, self)
   elseif self:isMap() then
      gameplayUI:showMap( not gameplayUI:isMapVisible(), self.name )
   elseif self:isDrawing() then
      gameplayUI:showDrawing( true, self.name )
   end
end

function CItem:OnDeactivate()
   self:stopAction()
end

function CItem:OnAltActivate()
end

function CItem:OnAltDeactivate()
end

function CItem:OnEquip( slotId )
   --log( "CItem:OnEquip")
   if self.impactFX then
      self:setImpactEffects( self.impactFX )
   end
   if self.traceFX then
      self:setTraceEffects( self.traceFX )
   end
   if ( self:getObject():getWeaponSlot() == slotId ) then
      self:playSound( "equip", true )
   end
end

function CItem:OnUnequip( slotId )
   self:playSound( "unequip", true )
end

function CItem:getType()
   return ""
end

function CItem:isUsable()
   return ItemsData.isItemUsable( self.name )
end

function CItem:isEquipable()
   return ItemsData.isItemEquipable( self.name )
end

function CItem:hasAltActivation()
   return false
end

function CItem:changeCount( delta )
   self.count = self.count + delta

   if ( self.count <= 0 ) then
      self:destroy()
      return false
   end

   return true
end

function CItem:show()
   self:setVisible( true )

   if ( self.lights ) then
      for i=1,#self.lights do
         self.lights[i]:setVisible( true )
      end
   end
end

function CItem:hide()
   self:setVisible( false )

   if ( self.lights ) then
      for i=1,#self.lights do
         self.lights[i]:setVisible( false )
      end
   end
end

function CItem:drop()
   if ( self.owner ) then
      return self.owner:dropItem( self.id )
   end
   return nil
end

function CItem:destroy()
   if ( self.owner ) then
      self.owner:destroyItem( self.id )
   end
end

function CItem:playSound( name, localPose )
   local sounds = self.sounds[name]
   if ( sounds and #sounds > 0 ) then
      local sound = randChoice(sounds)
      if ( localPose == true ) then
         sound:getPose():setParent( self:getPose() )
         sound:getPose():resetLocalPose()
      elseif localPose ~= nil then -- impactPos comes
         local pos = localPose
         sound:getPose():resetParent()
         sound:getPose():resetLocalPose()
         sound:getPose():setLocalPos(pos)
      end
      sound:play()
   end
end

function CItem:getInteractTime( interactType )
   return 0
end

function CItem:isMeleeWeapon()
   return string.find(self:getItemName(), "%.wpn") ~= nil
end

function CItem:isRangedWeapon()
   return string.find(self:getItemName(), "%.gun") ~= nil
end

function CItem:isItem()
   return string.find(self:getItemName(), "%.itm") ~= nil
end

function CItem:isAmmo()
   return string.find(self:getItemName(), "ammo") ~= nil
end

function CItem:isWeapon()
   return self:isMeleeWeapon() or self:isRangedWeapon()
end

function CItem:isAttire()
   return ItemsData.isItemAttire( self.name )
end

function CItem:isArmor()
   return ItemsData.isItemArmor( self.name )
end

function CItem:isAccessory()
   return ItemsData.isItemAccessory( self.name )
end

function CItem:getSounds()
   return ItemsData.getItemSounds( self.name )
end

function CItem:getAttachments()
   return ItemsData.getItemAttachments( self.name )
end

function CItem:isMoney()
   return ItemsData.isItemMoney( self.name )
end

function CItem:isMessage()
   return ItemsData.isItemMessage( self.name )
end

function CItem:isDrawing()
   return ItemsData.isItemDrawing( self.name )
end

function CItem:isMap()
   return ItemsData.isItemMap( self.name )
end

function CItem:hasColliderOffset()
   return ItemsData.hasItemColliderOffset( self.name )
end

function CItem:getColliderRadius()
   return ItemsData.getItemColliderRadius( self.name )
end

function CItem:getColliderLength()
   return ItemsData.getItemColliderLength( self.name )
end

function CItem:getHitEffect()
   return ItemsData.getItemHitEffect( self.name )
end

function CItem:getUseEffects()
   return ItemsData.getItemUseEffects( self.name )
end

function CItem:getPermaBuffInfo()
   return ItemsData.getItemPermaBuffInfo( self.name )
end

function CItem:getDamage()
   return self.damage or ItemsData.getItemDamage( self.name )
end

function CItem:setDamage(damage)
   self.damage = damage
end

function CItem:getCooldown()
   return self.cooldown or ItemsData.getItemCooldown( self.name )
end

function CItem:setCooldown(cooldown)
   self.cooldown = cooldown
end

function CItem:getMessage()
   return ItemsData.getItemMessage( self.name )
end

function CItem:getAttireType()
   return ItemsData.getAttireType( self.name )
end

function CItem:getAttireMeshes()
   return ItemsData.getAttireMeshes( self.name )
end

function CItem:getAnimations()
   return ItemsData.getItemAnimations( self.name )
end

function CItem:getReloadAnimations()
   return ItemsData.getItemReloadAnimations( self.name )
end

function CItem:isBooze()
   return ItemsData.isItemBooze( self.name )
end

function CItem:getBoozeStrength()
   return ItemsData.getBoozeStrength( self.name )
end

function CItem:isSmokable()
   return ItemsData.isItemSmokable( self.name )
end

function CItem:getInvCategory()
   return ItemsData.getItemInvCategory( self.name )
end

function CItem:getWeaponType()
   return ItemsData.getItemWeaponType( self.name )
end

function CItem:isQuestItem()
   return ItemsData.isItemQuestItem( self.name )
end

return {CItem=CItem}
