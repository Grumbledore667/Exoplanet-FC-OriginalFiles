local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local CLockable = require "mixins.lockable"
local CDestroyable = require "mixins.destroyable"

---@class CCombinationLock : shRigidEntity
local CCombinationLock = oo.class({}, _rootRigid, CLockable, CDestroyable)

function CCombinationLock:OnCreate()
   CDestroyable.OnCreate(self)

   getScene():subscribeOnLocationEnter(function()
      self.lockedObjects = loadParamObjects(self, "lockedObjects", "")
      for _, obj in pairs(self.lockedObjects) do
         obj.lockObject = self
      end
      table.insert(self.lockedObjects, 1, self)
      CLockable.OnCreate(self)
   end, self)
end

function CCombinationLock:setLockState(state)
   for _,obj in ipairs(self.lockedObjects) do
      if obj == self then
         CLockable.setLockState(self, state)
      else
         obj:setLockState(state)
      end
   end
   self:setInteractorActive(state)
end

function CCombinationLock:getLabel()
   local label = CLockable.getLabel(self) .. "Code Lock"
   return label
end

return {CCombinationLock=CCombinationLock}
