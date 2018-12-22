local oo = require "loop.simple"
local CItem = (require "items.item").CItem
local ItemsData = (require "itemsData")

local CBugItem = oo.class({}, CItem)

function CBugItem:setClassParams(params)
   CItem.setClassParams(self, params)

   if params and params.imposters then
      self.imposters = params.imposters
   end
end

function CBugItem:OnEquip(slotId, silent)
   CItem.OnEquip(self, slotId, silent)

   if slotId == self:getObject():getWeaponSlot() then
      if self.imposters and self.imposters.hand then
         self.bugChar = getScene():createEntity(self.imposters.hand, self.imposters.handClass, {installer=self:getObject()})
         self.bugChar:getPose():setParent(self:getObject():getBonePose("item_slot" .. slotId))
         self.bugChar:getPose():resetLocalPose()
         self.bugChar:getPose():setLocalRotQuat(quatFromEuler({x=-45}))
         self.bugChar:setCollision(false)
         self.bugChar:setFeelVisible(false)
         self.bugChar:disablePickupItem()

         if self:getObject().addInstallation and self.bugChar.setInstaller then
            self:getObject():addInstallation(self.bugChar)
            self.bugChar:setInstaller(self:getObject())
         end

         self.bugChar:OnCaught()

         self:hide()
      end
   end
end

function CBugItem:OnUnequip(slotId, silent)
   CItem.OnUnequip(self, slotId, silent)

   if self.bugChar then
      getScene():destroyEntity(self.bugChar)
      self.bugChar = nil
   end
end

function CBugItem:OnActivate()
   if self.bugChar then
      gameplayUI:showInventoryDropInfo(self:getLabel() .. " was removed from Inventory")
      self.bugChar:OnFree(self:getObject():getPose())
      self.bugChar:push  (self:getObject():getCamera():getDir(), 15000, 1)
      if self:getItemName() == "bug_chipped.itm" then
         self.bugChar.wasChipped = true
      end
      self.bugChar = nil

      if self:getOwner() then
         self:getOwner():getOwner():holsterWeapon()
      end

      self:destroy()
   end
end

function CBugItem:OnAltActivate()
   if not self.bugChar and self.imposters and self.imposters.hand then
      self.bugChar = getScene():createEntity(self.imposters.hand, self.imposters.handClass)
      self.bugChar:setPose(self:getObject():getPose())

      local dir = self:getObject():getDir()
      dir.y = 0.5
      self.bugChar:getPose():setPos(vec3Add(self:getObject():getPose():getPos(), vec3Mul(vec3Normalize(dir), 150)))
   end

   if self.bugChar then
      self:getObject():startControlObject(self.bugChar, self.imposters.control, "CMainCharacterBug", {height=50,dist=100,offset=0,fov=85})
      self.bugChar = nil
   end
end

function CBugItem:hasAltActivation()
   if self.name == "bug_chipped.itm" then
      return true
   end
   return false
end

function CBugItem:isInstallable()
   if self.name == "bug_chipped.itm" then
      return true
   end
   return false
end

function CBugItem:getInteractTime(interactType)
   if interactType == "drop" then
      return 1
   end

   return 0
end

return {CBugItem=CBugItem}
