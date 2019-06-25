local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local CDestroyable = require "mixins.destroyable"
local CInteractable = require "mixins.interactable"

local ItemsData  = (require "itemsData")
local MiscLabels = require "miscLabels"
local hlp        = require "helpers"

---@class CItemGenerator : shRigidEntity
local CItemGenerator = oo.class({
   item = nil,
}, _rootRigid, CInteractable, CDestroyable)

local ERROR_BAD_TEMPLATE = "ERROR: %s %s specified item template '%s' that doesn't exist"
local ERROR_BAD_ITEM = "ERROR: %s %s specified item '%s' that doesn't exist"

function CItemGenerator:loadDynamicParameters(params)
   self.itemName = params.itemName or self.itemName
   self.itemCount = params.itemCount or self.itemCount
end

function CItemGenerator:OnCreate(params)
   CDestroyable.OnCreate(self, params)
   CInteractable.OnCreate(self, params)

   self.activated = false
   self.itemName, self.itemCount = loadAndGuessItemParam(self, "itemName", {})
   self.hideSource     = loadParam(self, "hideSource", true)
   self.meshRaycast    = loadParam(self, "meshRaycast", false)
   self.interactHeight = loadParamNumber(self, "interactHeight", 0)
   self.raycastRadius  = loadParamNumber(self, "raycastRadius", 50)
   self.interactTime   = loadParamNumber(self, "interactTime", 0)
   if params then self:loadDynamicParameters(params) end

   self.interactor:setRaycastRadius(self.raycastRadius)
   self.interactor:getPose():setLocalPos({x=0, y=self.interactHeight, z=0})

   if not self.itemName or self.itemName == ""
      or not ItemsData.isCorrectItemName(self.itemName)
      or not (ItemsData.getItemsInfo(self.itemName) or ItemsData.getItemTemplate(self.itemName)) then
      self:setInteractorActive(false)
   else
      if self.meshRaycast then
         self.interactor:setRaycastTarget(self:getPose())
      end
      local texture = ItemsData.getItemTexture(self.itemName)
      if texture then
         self:setTexture(0, texture)
      end
   end

   if not self.itemName then return end
   if ItemsData.isItemTemplate(self.itemName) then
      if not ItemsData.getItemTemplate(self.itemName) then
         log(string.format(ERROR_BAD_TEMPLATE, self:getScriptClass(), self:getName(), tostring(self.itemName)))
      end
   elseif not ItemsData.getItemsInfo(self.itemName) then
      log(string.format(ERROR_BAD_ITEM, self:getScriptClass(), self:getName(), tostring(self.itemName)))
   end
end


function CItemGenerator:pickupItem(inventory)
   self.activated = true
   local item = inventory:addItem(self.itemName, self.itemCount)

   if item then
      if self.hideSource then
         self:setVisible(false)
         self.interactor:setRaycastActive(false)
      end
   end
   return item, self.itemCount
end

function CItemGenerator:getLabel()
   local template = ItemsData.getItemTemplate(self.itemName)
   if template and template.quality then
      return string.format("%s (%s)", ItemsData.getItemLabel(template.itemName), MiscLabels.getItemQualityLabel(template.quality))
   else
      return ItemsData.getItemLabel(self.itemName)
   end
end

function CItemGenerator:getLabelPos()
   return vec3Add(self:getPose():getPos(), {y=65})
end

function CItemGenerator:getInteractLabel()
   return "pick up"
end

function CItemGenerator:getInteractType(char)
   return "pickup"
end

function CItemGenerator:getInteractData(char)
   local data = {
      time = self.interactTime,
      animations = {
         activate = hlp.getPickupAnimationFor(char, self)
      },
   }
   return data
end

function CItemGenerator:getLootTable()
   if not self.itemName then return end
   local t = {}
   if not self.activated or self.interactor:getRaycastActive() then
      local template = ItemsData.getItemTemplate(self.itemName)
      if template then
         t[template.itemName] = self.itemCount
      else
         t[self.itemName] = self.itemCount
      end
   end
   return t
end

function CItemGenerator:OnSaveState(state)
   state.visible = self:getVisible()
   state.interactor = self.interactor:getRaycastActive()
   state.activated = self.activated
end

function CItemGenerator:OnLoadState(state)
   if state.visible then
      self:setVisible(true)
   else
      self:setVisible(false)
   end
   if state.interactor ~= nil then
      self.interactor:setRaycastActive(state.interactor)
   end
   self.activated = state.activated
end

return {CItemGenerator=CItemGenerator}
