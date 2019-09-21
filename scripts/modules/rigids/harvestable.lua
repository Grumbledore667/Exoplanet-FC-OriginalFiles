local oo = require "loop.multiple"
local _rootRigid = (require "roots")._rootRigid
local CDestroyable = require "mixins.destroyable"
local CInteractable = require "mixins.interactable"
local ItemsData = (require "itemsData")
local SkySystem = (require "environment.sky").SkySystem

local hlp = require "helpers"
local f = require "fun"
local partial = f.partial

---@class CHarvestable : shRigidEntity
local CHarvestable = oo.class({}, _rootRigid, CDestroyable, CInteractable)

---@class CCorn : CHarvestable
local CCorn = oo.class({}, CHarvestable)

---@class CCornDry : CHarvestable
local CCornDry = oo.class({}, CHarvestable)

---@class CBloodRoot : CHarvestable
local CBloodRoot = oo.class({}, CHarvestable)

---@class CKTharsianAloe : CHarvestable
local CKTharsianAloe = oo.class({}, CHarvestable)

---@class CStygmyanGoldenApple : CHarvestable
local CStygmyanGoldenApple = oo.class({}, CHarvestable)

---@class CMelon : CHarvestable
local CMelon = oo.class({}, CHarvestable)

---@class CBluethorn : CHarvestable
local CBluethorn = oo.class({}, CHarvestable)

function CBluethorn:OnCreate()
   CHarvestable.OnCreate(self)
   self.interactor:setTriggerRadius(200)
end

function CBluethorn:pickupItem(inventory)
   --Pickup every leaf
   local count = self:getReadyCount()
   local item = inventory:addItem(self.itemName, count)
   for i=1, count do
      local fruit = self:getReadyFruit()
      self:hideRipeFruit(fruit)
      self:growStart(fruit)
   end
   return item, count
end

function CHarvestable:OnCreate()
   CDestroyable.OnCreate(self)
   CInteractable.OnCreate(self)
   self.interactor:setRaycastRadius(100)

   self.growDelta = 0.005
   self.growTimerStep = 0.5
   if not isDebug("plants") then
      self.growTimerStep = 25 -- ~1.25 realtime hours
   end
   self.itemName = loadParam(self, "item", "")
   self.regrow = loadParam(self, "regrow", true)

   self.fruits = {}

   for i=1,10 do
      local meshGreen = self:getMeshByName("fruit_green_" .. tostring(i))
      local meshRipe  = self:getMeshByName("fruit_ripe_" .. tostring(i))

      if self:getName() == "corn_1_dry_0" or self:getName() == "corn_1_0" then
         log(meshRipe)
      end

      if meshRipe then --Some of the plants have only ripe submeshes and can only be gathered once
         local fruit = {green = meshGreen, ripe = meshRipe}
         table.insert(self.fruits, fruit)
         self:growFinish(fruit)
      else
         break
      end
   end
end

function CHarvestable:getInteractType(char)
   return "pickup"
end

function CHarvestable:getInteractData(char)
   local data = {
      animations = {
         activate = hlp.getPickupAnimationFor(char, self)
      },
   }
   return data
end

function CHarvestable:getItemName()
   return self.itemName
end

function CHarvestable:getLabel()
   return ItemsData.getItemLabel(self.itemName)
end

function CHarvestable:getInteractLabel()
   return "harvest"
end

function CHarvestable:getReadyCount()
   local count = 0
   for _,fruit in ipairs(self.fruits) do
      if self:isFruitReady(fruit) then
         count = count + 1
      end
   end
   return count
end

function CHarvestable:getReadyFruit()
   for _,fruit in ipairs(self.fruits) do
      if self:isFruitReady(fruit) then
         return fruit
      end
   end
end

function CHarvestable:isFruitReady(fruit)
   return fruit.ripe:getVisible()
end

function CHarvestable:growStart(fruit)
   if not fruit.green or not self.regrow then return end --plants without green submeshes don't regrow

   if fruit then
      fruit.green:getPose():setLocalScale({x=0.1,y=0.1,z=0.1})
      fruit.green:setVisible(true)
   end

   if not self.growTimer then
      self.growTimer = runTimer(self.growTimerStep, self, self.growStep, true)
      self.growCallback = SkySystem:subscribeFastForwardTime(partial(self.onFastForwardTime, self))
   end
end

function CHarvestable:hideRipeFruit(fruit)
   fruit.ripe:setVisible(false)
   if self:getReadyCount() <= 0 then
      self.interactor:setRaycastActive(false)
   end
end

function CHarvestable:growStep(scaleDelta)
   scaleDelta = scaleDelta or (self.growDelta * math.abs(SkySystem:getTimeRate()))
   for _,fruit in ipairs(self.fruits) do
      if not self:isFruitReady(fruit) then
         local scale = fruit.green:getPose():getLocalScale().x
         scale = math.min(1, scale + scaleDelta)
         fruit.green:getPose():setLocalScale({x=scale,y=scale,z=scale})
         if scale >= 1 then
            self:growFinish(fruit)
         end
      end
   end

   if self:getReadyCount() == #self.fruits then
      self.growTimer:stop()
      SkySystem:unsubscribeFastForwardTime(self.growCallback)
      self.growTimer = nil
   end
end

function CHarvestable:growFinish(fruit)
   fruit.ripe:setVisible(true)
   self.interactor:setRaycastActive(true)
   if fruit.green then
      fruit.green:setVisible(false)
   end
end

function CHarvestable:pickupItem(inventory)
   local count = 1
   local item = inventory:addItem(self.itemName, count)

   local fruit = self:getReadyFruit()
   self:hideRipeFruit(fruit)
   self:growStart(fruit)
   return item, count
end

function CHarvestable:onFastForwardTime(event, ...)
   --Restart timer to keep accurate growth rate
   self.growTimer:stop()
   self.growTimer = runTimer(self.growTimerStep, self, self.growStep, true)
   local stepsToCatchUp = event.elapsed:getAs("rSecond") / self.growTimerStep
   --Catch up to the exact scale increase
   self:growStep(stepsToCatchUp * self.growDelta)
end

function CHarvestable:getLootTable()
   local t = {}
   t[self.itemName] = #self.fruits
   return t
end

function CHarvestable:OnSaveState(state)
   CInteractable.OnSaveState(self, state)

   state.fruitStates = {}
   for _,fruit in ipairs(self.fruits) do
      local fruitState = {ripeVisible = fruit.ripe:getVisible(), greenScale = nil}
      table.insert(state.fruitStates, fruitState)
      if not fruitState.ripeVisible and fruit.green and self.regrow then
         fruitState.greenScale = fruit.green:getPose():getLocalScale().x
      end
   end
end

function CHarvestable:OnLoadState(state)
   CInteractable.OnLoadState(self, state)

   --While loading, the engine loads the visibility of the main mesh which also shows every green submesh,
   --so we have to hide them again
   for _, fruit in ipairs(self.fruits) do
      if fruit.green then
         fruit.green:setVisible(false)
      end
   end
   for i, fruitState in ipairs(state.fruitStates) do
      if not fruitState.ripeVisible then
         local fruit = self.fruits[i]
         if fruit then
            self:hideRipeFruit(fruit)
         end
         local scale = fruitState.greenScale
         if fruit and fruit.green and scale and scale < 1 then
            self:growStart(fruit)
            fruit.green:getPose():setLocalScale({x=scale,y=scale,z=scale})
         end
      end
   end
end

return {
   CHarvestable=CHarvestable,
   CBloodRoot=CBloodRoot,
   CCorn=CCorn,
   CCornDry=CCornDry,
   CKTharsianAloe=CKTharsianAloe,
   CStygmyanGoldenApple=CStygmyanGoldenApple,
   CMelon=CMelon,
   CBluethorn=CBluethorn,
}
