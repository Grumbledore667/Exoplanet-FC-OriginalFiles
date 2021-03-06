local oo = require "loop.multiple"
local ItemsData = (require "itemsData")
local _rootRigid = (require "roots")._rootRigid
local CDestroyable = require "mixins.destroyable"

local hlp = require "helpers"

local gFences = {}
local gFields = {}
local gFieldMaxDist = 500

---@class CEnergyFence : shRigidEntity
local CEnergyFence = oo.class({
   installer = nil,
   itemName = "energy_fence.itm",
}, _rootRigid, CDestroyable)

local function energyTouchDamage(field, touch, touchInfo)
   touch.object:push      (touchInfo.normal, touch.damage * 800, 0.4)
   touch.object:hit       (touch.damage)
   touch.object:playEffect("electro_shock", 1)
end

local function energyFieldTouch(field, obj, touchInfo)
   if obj:getHealth() <= 0 then
      return
   end

   local touch = {}

   touch.object = obj
   touch.damage = 10
   touch.timer  = runTimer(0.75, {["field"]=field, ["touchInfo"] = touchInfo}, energyFieldDamage, true)

   field.touches[#field.touches+1] = touch

   energyTouchDamage(field, touch, touchInfo)

   --log("+++++energyFieldTouch ".. obj:getName())
end

local function energyFieldUntouch(field, obj)
   for i=1,#field.touches do
      if field.touches[i].object == obj then
         --log("!!!!!!!!!!!!")
         field.touches[i].timer:stop()
         table.remove(field.touches, i)
         break
      end
   end

   --log("------energyFieldUntouch ".. obj:getName())
end

local function energyFieldDamage(params)
   --log("************")
   for i=1,#params.field.touches do
      energyTouchDamage(params.field, params.field.touches[i], params.touchInfo)
   end
end

function CEnergyFence:OnCreate(params)
   CDestroyable.OnCreate(self, params)
   if params then
      self:setInstaller(params.installer)
   end

   gFences[#gFences+1] = self

   self.interactor = self:createAspect("interactor")
   self.interactor:setObject(self)
   self.interactor:setRaycastRadius(100.0)
   self.interactor:getPose():setParent(self:getPose())
   self.interactor:getPose():resetLocalPose()
   self.interactor:getPose():setLocalPos({x=0,y=100,z=0})
   self.interactor:setRaycastActive(true)

   local instances = {}

   self.sounds = {}

   self.sounds.open = self:createAspect("Play_energy_fence_open")
   instances[#instances+1] = self.sounds.open

   --self.sounds.close = self:createAspect("Play_energy_fence_close")
   --instances[#instances+1] = self.sounds.close

   for i=1,#instances do
      instances[i]:getPose():setParent(self:getPose())
      instances[i]:getPose():resetLocalPose()
      instances[i]:getPose():setLocalPos({x=0,y=100,z=0})
      instances[i]:setDistance(1500)
   end

   self.sounds.open:play()
   self:playAnimation("Open", false)

   self.fx = {}

   self:subscribeAnimationStop(self.OnAnimationStop, self)
end

function CEnergyFence:OnDestroy()
   CDestroyable.OnDestroy(self)
   for i=1,#gFences do
      if gFences[i] == self then
         table.remove(gFences, i)
         break
      end
   end

   self:recreateField()
end

function CEnergyFence:getLabelPos()
   local pos = self.interactor:getPose():getPos()
   pos.y = pos.y + 100
   return pos
end

function CEnergyFence:OnTouchCharacter(obj)
end

function CEnergyFence:OnUntouchCharacter(obj)
end

function CEnergyFence:OnAnimationStop(anim)
   if anim == "Open" then
      self:recreateField()

      if not self.fx.emitter then
         self.fx.emitter = self:createAspect("electro_fence.sps")
      end

      if self.fx.emitter then
         local pos = self:getPose():getPos()
         pos.y = pos.y + 135.0
         self.fx.emitter:getPose():setPos(pos)
         self.fx.emitter:setLoop(true)
         self.fx.emitter:play()
      end

      if not self.fx.sound then
         self.fx.sound = self:createAspect("Play_electro_voltage")
      end

      if self.fx.sound then
         local pos = self:getPose():getPos()
         pos.y = pos.y + 135.0
         self.fx.sound:getPose():setPos(pos)
         self.fx.sound:setDistance(500)
         self.fx.sound:play()
      end
   end
end

function CEnergyFence:findNearestFence()
   local res     = nil
   local minDist = gFieldMaxDist

   for i=1,#gFences do
      if gFences[i] ~= self then
         local dist = getDistance(self:getPose():getPos(), gFences[i]:getPose():getPos())
         if dist < minDist then
            minDist = dist
            res = gFences[i]
         end
      end
   end

   return res
end

function CEnergyFence:findField(fence1, fence2)

   for i=1,#gFields do
      local parentsMatch = 0

      for j=1,#gFields[i].parents do
         if gFields[i].parents[j] == fence1 then parentsMatch = parentsMatch+1 end
         if gFields[i].parents[j] == fence2 then parentsMatch = parentsMatch+1 end
      end

      if parentsMatch == 2 then
         return true
      end
   end

   return false
end

function CEnergyFence:createField(targetFence)
   if not targetFence then return end
   if self == targetFence then return end
   if self:findField(self, targetFence) then return end

   local dist = getDistance(self:getPose():getPos(), targetFence:getPose():getPos())

   if dist > gFieldMaxDist then return end

   for i=1,3 do
      local field = { object = nil, collision = nil, parents = {} }
      field.object = getScene():createEntity("electro_arc.sbg", "")

      field.parents[#field.parents+1] = self
      field.parents[#field.parents+1] = targetFence

      local dir = vec3Sub(targetFence:getPose():getPos(), self:getPose():getPos())
      local pos = vec3Add(self:getPose():getPos(), vec3Mul(dir, 0.5))

      field.object:getPose():setPos({x=pos.x, y=pos.y+60*i+0, z=pos.z})
      field.object:getPose():setOrientation({x=1,y=0,z=0}, dir)
      field.object:getPose():setScale({x=dist*0.01,y=1.25,z=1})

      if i == 2 then
         field.touches = {}

         field.collision = getScene():createEntity("collision_box.sbg", "")
         field.collision:getPose():setPos({x=pos.x, y=pos.y+50, z=pos.z})
         field.collision:getPose():setOrientation({x=1,y=0,z=0}, dir)
         field.collision:getPose():setScale({x=dist*0.01,y=2.0,z=0.1})
         field.collision:subscribeTouchCharacter  (energyFieldTouch, field)
         field.collision:subscribeUntouchCharacter(energyFieldUntouch, field)
      end

      gFields[#gFields+1] = field
   end
end

function CEnergyFence:recreateField()
   for i=1,#gFields do
      getScene():destroyEntity(gFields[i].object)
      getScene():destroyEntity(gFields[i].collision)

      if gFields[i].touches then
         for j=1,#gFields[i].touches do
            gFields[i].touches[j].timer:stop()
         end
      end
   end
   gFields = {}

   for i=1,#gFences do
      for j=1,#gFences do
         gFences[i]:createField(gFences[j])
      end
   end
   --[[
   for i=1,#gFences do
      gFences[i]:createField(gFences[i]:findNearestFence())
   end]]
end

function CEnergyFence:getInteractType(char)
   return "pickup"
end

function CEnergyFence:getInteractData(char)
   local data = {
      animations = {
         activate = hlp.getPickupAnimationFor(char, self)
      },
   }
   return data
end

function CEnergyFence:getLabel()
   return "Energy Fence"
end

function CEnergyFence:getInteractLabel()
   return "deinstall"
end

function CEnergyFence:pickupItem(inventory)
   local item = inventory:addItem(self.itemName)

   if item then
      getScene():destroyEntity(self)
   end
   return item, 1
end

function CEnergyFence:setInstaller(obj)
   self.installer = obj
end

function CEnergyFence:OnSaveState(state)
   if self.installer then
      state.pos = self:getPose():getPos()
      state.rotQuat = self:getPose():getRotQuat()
   end
end

function CEnergyFence:OnLoadState(state)
   if self.installer then
      if state.pos then
         self:getPose():setPos(state.pos)
      end
      if state.rotQuat then
         self:getPose():setRotQuat(state.rotQuat)
      end
   end
end

return {CEnergyFence=CEnergyFence}
