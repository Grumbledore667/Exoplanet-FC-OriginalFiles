local oo = require "loop.multiple"
local CInteractable = require "mixins.interactable"
local _rootRigid = (require "roots")._rootRigid

---@class CAntigraviumMine : shRigidEntity
local CAntigraviumMine = oo.class({}, _rootRigid, CInteractable)

function CAntigraviumMine:OnCreate(params)
   params = params or {}
   CInteractable.OnCreate(self, params)
   self.initialResource = 3
   self.resource = math.floor(loadParamNumber(self, "resource", 3))
   self.fertility = math.floor(loadParamNumber(self, "fertility", 2))
   self.crystalMined = false
   self.meshRaycast = loadParam(self, "meshRaycast", true)
   self.baseObj = loadParamObjects(self, "baseObj", nil)[1]

   self.interactor:getPose():setLocalPos({x=0,y=100,z=0})
   if self.meshRaycast then
      self.interactor:setRaycastTarget(self:getPose())
   end

   self:playAnimation("animate", true)

   if not self.omni and self:getMeshByName("main_1") then
      self.omniIntensity = 4
      self.omni = self:createAspect("omni")
      self.omni:getPose():setParent(self:getMeshByName("main_1"):getPose())
      self.omni:getPose():resetLocalPose()
      self.omni:getPose():setLocalPos({x=0,y=100,z=0})
      self.omni:setColor({r=0,g=0.5,b=0})
      self.omni:setRadius(400)
      self.omni:setVisible(true)
      self.omni:setIntensity(self.omniIntensity)
   end

   self:updateMeshes()
end

function CAntigraviumMine:updateMeshes()
   local depletion = self.initialResource - self.resource
   if depletion > 0 then
      for i=1,depletion do
         self:onMiningHit(i)
      end
   end
end

function CAntigraviumMine:tryHideMesh(meshName)
   local mesh = self:getMeshByName(meshName)
   if mesh then
      mesh:setVisible(false)
   end
end

function CAntigraviumMine:isDepleted(char)
   return self.resource <= 0
end

function CAntigraviumMine:onMiningHit(fakeDepletion)
   local stage = fakeDepletion or (self.initialResource - self.resource)
   if not fakeDepletion then
      self:omniFlash()
   end
   if stage == 1 then
      self.omniIntensity = 3
      self:tryHideMesh("main_1")
   elseif stage == 2 then
      self.omniIntensity = 2
      self:tryHideMesh("main_2")
      self:tryHideMesh("shard_1")
   elseif stage == 3 then
      self.omniIntensity = 0
      self:tryHideMesh("main_3")
      self:tryHideMesh("shard_2")
      self:tryHideMesh("rocks_1")
      if self:getMeshByName("main_4") then self:getMeshByName("main_4"):setTexture(0,"antigravium_minable_empty_dif.dds") end
      if self.baseObj and self.baseObj:getMeshByName("crystal") then
         self.baseObj:getMeshByName("crystal"):setTexture(0,"antigravium_minable_empty_dif.dds")
      end
      self:stopAnimations()
      self:setCollisionRaycast(false)
      self:setCollisionObjects(false)
      self:setCollisionCharacters(false, false)
   end
   if fakeDepletion then
      self.omni:setIntensity(self.omniIntensity)
      if self.omniIntensity == 0 then
         self.omni:setVisible(false)
      end
   end
end

function CAntigraviumMine:omniFlash()
   local target = self.omniIntensity * 3
   local duration = 0.1
   local updateInterval = 0.03
   local delta = (target - self.omni:getIntensity())/(duration/updateInterval)
   local timer
   timer = runTimer(updateInterval, nil, function()
      self.omni:setIntensity(self.omni:getIntensity() + delta)
      if self.omni:getIntensity() >= target then
         self.omni:setIntensity(target)
         timer:stop()

         target = self.omniIntensity
         delta = (target - self.omni:getIntensity())/(duration/updateInterval)
         timer = runTimer(updateInterval, nil, function()
            self.omni:setIntensity(self.omni:getIntensity() + delta)
            if self.omni:getIntensity() <= target then
               self.omni:setIntensity(target)
               timer:stop()
               if target == 0 then
                  self.omni:setVisible(false)
               end
            end
         end, true)
      end
   end, true)
end

function CAntigraviumMine:getActivationsLeft()
   return self.resource
end

function CAntigraviumMine:getLabel()
   if self.resource <= 0 then
      return "Depleted Antigravium Deposit"
   elseif self.fertility >= 3 then
      return "Rich Antigravium Deposit"
   elseif self.fertility == 2 then
      return "Antigravium Deposit"
   elseif self.fertility <= 1 then
      return "Poor Antigravium Deposit"
   end
end

function CAntigraviumMine:getLabelPos()
   return vec3Add(self.interactor:getPose():getPos(), {y=75})
end

function CAntigraviumMine:getInteractLabel()
   return "mine"
end

function CAntigraviumMine:getInteractType(char)
   return "mine"
end

function CAntigraviumMine:isInteractionLingering(char)
   return true
end

function CAntigraviumMine:getInteractData(char)
   local prefabName = self:getPrefabName()
   local data = {
      anchorPos = getMC():getPose():getPos(),
      anchorDir = vec3Normalize(vec3Sub(self:getPose():getPos(), char:getPose():getPos())),
      animations = {},
   }
   if self:getPose():getPos().y - char:getPose():getPos().y > 50
         or prefabName == "shard_4.sbg"
         or prefabName == "shard_5.sbg"
         or prefabName == "shard_6.sbg" then
      data.animations.loop = "mine_front"
   else
      data.animations.loop = "mine_down"
   end
   return data
end

function CAntigraviumMine:OnSaveState(state)
   CInteractable.OnSaveState(self, state)

   state.resource = self.resource
   state.crystalMined = self.crystalMined
end

function CAntigraviumMine:OnLoadState(state)
   CInteractable.OnLoadState(self, state)

   self.resource = state.resource
   self.crystalMined = state.crystalMined
   self:updateMeshes()
end

return {CAntigraviumMine=CAntigraviumMine}
