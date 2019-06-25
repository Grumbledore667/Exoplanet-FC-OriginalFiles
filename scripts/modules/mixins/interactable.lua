local oo = require "loop.simple"

---@class CInteractable
local CInteractable = oo.class({
   highlightingAllowed = true,
})

function CInteractable:OnCreate(params)
   params = params or {}
   if params.highlightingAllowed ~= nil then
      self.highlightingAllowed = params.highlightingAllowed
   end
   self.highlightMaterial = params.highlightMaterial or "highlight"
   self.highlightTime = params.highlightTime or 2

   if self:isHighlightingAllowed() then
      self:addMaterial(self.highlightMaterial)
      self:setMaterialVisible(self.highlightMaterial, false)
   end

   self.interactor = self:createAspect("interactor")
   self.interactor:setObject(self)
   self.interactor:getPose():setParent(self:getPose())
   self.interactor:getPose():resetLocalPose()
   self.interactor:setTriggerActive(false)
   self.interactor:setRaycastActive(true)
   self.interactor:setRaycastRadius(loadParamNumber(self, "raycastRadius", 150))
end

function CInteractable:isHighlightingAllowed()
   return self.highlightingAllowed
end

function CInteractable:setInteractorActive(state)
   self.interactor:setTriggerActive(state)
   self.interactor:setRaycastActive(state)
end

function CInteractable:shouldScanHighlight(obj)
   return self.interactor:getRaycastActive()
end

function CInteractable:OnInteractHighlightBegin(obj)
   if not self.setMaterialVisible or not self:shouldScanHighlight(obj) then return end

   self:stopHighlightTimer()
   self.highlightTimer = runTimer(self.highlightTime, self,
      function (self)
         self:setMaterialVisible(self.highlightMaterial, false)
         self.highlightTimer = nil
      end, false)
   self:setMaterialVisible(self.highlightMaterial, true)
end

function CInteractable:OnFocusBegin(obj)
   if self.setMaterialVisible then
      self:setMaterialVisible(self.highlightMaterial, true)
   end
   self:stopHighlightTimer()
end

function CInteractable:OnFocusEnd(obj)
   if self.setMaterialVisible then
      self:setMaterialVisible(self.highlightMaterial, false)
   end
   self:stopHighlightTimer()
end

function CInteractable:stopHighlightTimer()
   if self.highlightTimer then
      self.highlightTimer:stop()
      self.highlightTimer = nil
   end
end

function CInteractable:getInteractType(char)
   return "activator"
end

function CInteractable:isInteractionLingering(char)
   return false
end

function CInteractable:getLabelPos()
   local pos = self.interactor:getPose():getPos()
   pos.y = pos.y + 30
   return pos
end

return CInteractable
