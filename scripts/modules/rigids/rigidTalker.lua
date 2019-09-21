local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local CInteractable = require "mixins.interactable"
local CDestroyable = require "mixins.destroyable"

local ObjectsLabels = (require "objectsLabels")

local stringx = require "pl.stringx"

---@class CRigidTalker : CRigid
local CRigidTalker = oo.class({
}, _rootRigid, CDestroyable, CInteractable)

function CRigidTalker:OnCreate(params)
   CInteractable.OnCreate(self, params)
   CDestroyable.OnCreate(self, params)

   local dialogName = loadParam(self, "dialog", self:getName())
   if dialogName ~= false then
      local uniqueName = string.format("%s_%s", self:getName(), dialogName)
      self.dialog = dialogSystem:createDialog(dialogName, uniqueName)
      getScene():subscribeOnLocationEnter(self.initDialog, self)
   end

   self.labelId = loadParam(self, "labelId", "")

   self.enabled = loadParam(self, "enabled", true)
   self.interactor:setRaycastActive(self.enabled)
end

function CRigidTalker:initDialog()
   if self.dialog then
      self.dialog.actors = {getMC(), self}
   end
end

function CRigidTalker:activate(obj)
   obj:startTalk(self)
end

function CRigidTalker:startTalk(obj)
   if self.dialog then
      dialogSystem:playDialog(self.dialog)
   end
   return true
end

function CRigidTalker:stopTalk(obj)
end

function CRigidTalker:onStartMessage()
end

function CRigidTalker:onStopMessage()
end

function CRigidTalker:onStopDialog()
   if self.dialog then
      runTimer(0, nil, function()
         dialogSystem:stopDialog(self.dialog)
      end, false)
   end
end

function CRigidTalker:getInteractType(char)
   if not self.dialog then
      return "no_interaction"
   else
      return "rigid_talker"
   end
end

function CRigidTalker:getLabel()
   local label = ObjectsLabels.getLabel(self.labelId)

   if label == "" then
      label = ObjectsLabels.getLabel(self:getName())
   end

   if label == nil or label == "" then
      label = self:getName()
      label = string.gsub(label, "%d+", "")
      label = string.gsub(label, "_", " ")
      label = stringx.strip(label)
      label = stringx.capitalize(label)
   end

   return label
end

function CRigidTalker:getInteractLabel()
   return "activate"
end

function CRigidTalker:getLabelPos()
   local pos = self.interactor:getPose():getPos()
   pos.y = pos.y + 65
   return pos
end

function CRigidTalker:OnSaveState(state)
   CInteractable.OnSaveState(self, state)
end

function CRigidTalker:OnLoadState(state)
   CInteractable.OnLoadState(self, state)
end

return {CRigidTalker=CRigidTalker}
