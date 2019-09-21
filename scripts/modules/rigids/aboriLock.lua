local oo = require "loop.simple"
local CActivator = require "rigids.activator".CActivator
local hlp = require "helpers"

---@class CAboriLock : CActivator
local CAboriLock = oo.class({}, CActivator)

function CAboriLock:OnCreate(params)
   CActivator.OnCreate(self, params)

   self.keyItems = loadParamStrings(self, "keyItems", {})
   self.insertedKeyName = nil
   self.keyMesh = nil
end

function CAboriLock:preActivate(char)
   if not self.activated then
      char.animationsManager:subscribeAnimationEventIn("idle_abori_lock_close", "item_change", function()
         self.keyMesh = hlp.safeCreateEntity("abori_lock_key.sbg")
         self.keyMesh:getPose():setParent(char:getBonePose("item_slot1"))
         self.keyMesh:getPose():resetLocalPose()
      end)
   end
end

function CAboriLock:activate(char)
   if not self.activated then
      CActivator.activate(self, char)

      self.keyMesh:getPose():resetParent()
      local item = self:characterHasKey(char)
      self.insertedKeyName = item:getItemName()
      removeItemFromObj(self.insertedKeyName, char)
   else
      CActivator.activateReverse(self, char)

      self.keyMesh:getPose():setParent(char:getBonePose("item_slot1"))
      self.keyMesh:getPose():resetLocalPose()
      char.animationsManager:subscribeAnimationEventIn("idle_abori_lock_open", "item_change", function()
         hlp.safeDestroyEntity(self.keyMesh)
         self.keyMesh = nil
         addItemToObj(self.insertedKeyName, char)
      end)
   end
end

function CAboriLock:characterHasKey(char)
   for _,itemName in ipairs(self.keyItems) do
      local item = char.inventory:getItemByName(itemName)
      if item then return item end
   end
   return false
end

function CAboriLock:getInteractType(char)
   return "abori_lock"
end

function CAboriLock:getInteractData(char)
   local data = CActivator.getInteractData(self, char)
   data.holster = true
   data.animations.activate = self.activated and "idle_abori_lock_open" or "idle_abori_lock_close"
   return data
end

function CAboriLock:OnLoadState(state)
   CActivator.OnLoadState(self, state)

   if self.activated then
   end
end

return {CAboriLock=CAboriLock}
