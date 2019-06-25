local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local CDestroyable = require "mixins.destroyable"
local CInteractable = require "mixins.interactable"

local heightsByID = {
   ["4"] = 978,
   ["3"] = 710,
   ["2"] = 486,
   ["1"] = 222,
   ["3m"] = 310,
}

---@class CLadder : shRigidEntity
local CLadder = oo.class({}, _rootRigid, CDestroyable, CInteractable)

function CLadder:OnCreate()
   CDestroyable.OnCreate(self)
   CInteractable.OnCreate(self)

   self.interactor_top = self:createAspect("interactor")
   self.interactor_top:setObject(self)
   self.interactor_top:setRaycastRadius(150)
   self.interactor_top:getPose():setParent(self:getPose())
   self.interactor_top:getPose():resetLocalPose()
   self.interactor_top:getPose():setLocalPos({x=0,y=self:getHeight(),z=0})
   self.interactor_top:setRaycastActive(true)

   self.enabled = loadParam(self, "enabled", true)
   if self.enabled then
      self:enable()
   else
      self:disable()
   end
end

function CLadder:getHeight()
   local prefabNameStripped = string.gsub(self:getPrefabName(), ".sbg$", "")
   local ID = string.match(prefabNameStripped, "[ladder_%w_]+(%d.*)$") or "1"
   return heightsByID[ID]
end

---Mockup anchors positions, for such amount of meshes for such complex animated action - it's easier done in script.
function CLadder:getAnchors(char, side)
   local prefabName = char:getPrefabName()
   local pose = self:getPose()
   local height = self:getHeight()
   --33 is `ladder_idle_to_idle_top` and `idle_to_ladder_top` z translation
   --163 is `ladder_idle_to_idle_top` y translation
   --208 is `idle_to_ladder_top` y translation
   if prefabName == "human_male.cfg" then --or prefabName == "test.cfg" then
      if side == "bottom" then
         return {
            localPointToWorld({x= 0, y = 5, z = -40}, pose),
            localPointToWorld({x= 0, y = height - 163, z = -40}, pose),
            localPointToWorld({x= 0, y = height, z = -40 + 33}, pose),
            localPointToWorld({x= 0, y = height, z = -40 + 33 + 30}, pose), --third addend is arbitrary
         }
      elseif side == "top" then
         return {
            localPointToWorld({x= -2, y = height, z = -7}, pose),
            localPointToWorld({x= -2, y = height - 215, z = -7 - 33}, pose),
            localPointToWorld({x= -2, y = 35, z = -7 - 33}, pose),
            localPointToWorld({x= -2, y = 5, z = -7 - 33 - 40}, pose), --third addend is arbitrary
         }
      end
   end
end

function CLadder:OnDestroy()
   CDestroyable.OnDestroy(self)
end

function CLadder:bottom()
   local playerPos = getPlayer():getPose():getPos()
   local dist_to_bottom = getDistance(playerPos, self.interactor:getPose():getPos())
   if self.interactor_top then
      local dist_to_top = getDistance(playerPos, self.interactor_top:getPose():getPos())
      return dist_to_bottom < dist_to_top
   else
      return true
   end
end

function CLadder:enable()
   self.enabled = true
   self.interactor:setRaycastActive(self.enabled)
   self.interactor_top:setRaycastActive(self.enabled)
end

function CLadder:disable()
   self.enabled = false
   self.interactor:setRaycastActive(self.enabled)
   self.interactor_top:setRaycastActive(self.enabled)
end

function CLadder:isEnabled()
   return self.enabled
end

function CLadder:getInteractType(char)
   return "ladder"
end

function CLadder:isInteractionLingering(char)
   return true
end

function CLadder:getLabel()
   return ""
end

function CLadder:getLabelPos()
   local pos
   if self:bottom() then
      pos = self.interactor:getPose():getPos()
   else
      pos = self.interactor_top:getPose():getPos()
   end
   return vec3Add(pos, {y=100})
end

function CLadder:getInteractLabel()
   if self:bottom() then
      return "climb"
   else
      return "climb down"
   end
end

function CLadder:OnSaveState(state)
   state.enabled = self.enabled
end

function CLadder:OnLoadState(state)
   if state.enabled then
      self:enable()
   else
      self:disable()
   end
end

return {CLadder=CLadder}
