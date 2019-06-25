local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local CInteractable = require "mixins.interactable"

---@class CFastTravel : shRigidEntity
local CFastTravel = oo.class({}, _rootRigid, CInteractable)

function CFastTravel:loadParameters()
   self.prettyName = loadParam(self, "prettyName", self:getName())
   self.activateDistance = loadParamNumber(self, "activateDistance", 500)
   self.ambientToPlay = loadParam(self, "ambientToPlay", nil)
   self.discovered = false
end

function CFastTravel:OnCreate()
   CInteractable.OnCreate(self)

   self:loadParameters(self)

   self.interactor:setTriggerRadius(self.activateDistance)
   self.interactor:setRaycastRadius(150)
   self.interactor:getPose():setLocalPos({x=0,y=100,z=0})
   self.interactor:setTriggerActive(true)
   self.interactor:setRaycastActive(true)

   if isEditor() then
      self.cube_helper = self:createAspect("dummy_item.sbg")
      local pos = localPointToWorld({x=0,y=0,z=-100}, self:getPose())
      self.cube_helper:getPose():setPos(pos)
   end

   local t = getGlobalParam("fast_travel_destinations")
   t[self:getName()] = {discovered = false, prettyName = self.prettyName}
end

function CFastTravel:__discover()
   if self.discovered then return end
   self.discovered = true
   gameplayUI.mapUI:mapAddFastTravel(self)
   local t = getGlobalParam("fast_travel_destinations")
   t[self:getName()].discovered = true
end

function CFastTravel:discover()
   if self.discovered then return end

   self:__discover()

   local q = getQuest("travel")
   if q then
      if not q:isStarted() then
         q:startImediate()
      end
      q:writeLog("%s", self.prettyName)
   end

   getMC():addExp(getGlobalParam("expDiscover"))
   gameplayUI:showInfoTextEx("Discovered " .. self.prettyName, "major", "")
end

function CFastTravel:OnInteractTriggerBegin(obj)
   if obj ~= getPlayer() then return end
   self:OnInteractHighlightBegin(obj)
end

function CFastTravel:OnInteractHighlightBegin(obj)
   if obj ~= getPlayer() then return end

   CInteractable.OnInteractHighlightBegin(self, obj)

   self:discover()
end

function CFastTravel:activate(obj)
   self:discover()
end

function CFastTravel:getInteractType(char)
   return "fast_travel"
end

function CFastTravel:getInteractData(char)
   local data = {
      holster = false,
   }
   return data
end

function CFastTravel:isInteractionLingering(char)
   return true
end

function CFastTravel:getLabel()
   return self.prettyName .. " Travel Marker"
end

function CFastTravel:getLabelPos()
   return vec3Add(self.interactor:getPose():getPos(), {y=75})
end

function CFastTravel:getInteractLabel()
   return "fast travel"
end

function CFastTravel:OnSaveState(state)
   state.discovered = self.discovered
end

function CFastTravel:OnLoadState(state)
   if state.discovered then
      self:__discover()
   end
end

return {CFastTravel=CFastTravel}
