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

function CBluethorn:getAsItem()
   local itemCount = self:getReadyCount()
   for i=1,itemCount do
      local fruit = self:getReadyFruit()
      self:growStart(fruit)
   end

   local item = CHarvestable.getAsItem(self)

   if item then
      if itemCount > 0 then
         item:setCount(itemCount)
      end
   else
      log("Can't create " .. self.itemName)
   end
   return item
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

   self.fruits = {}

   for i=1,10 do
      local meshGreen = self:getMeshByName("fruit_green_" .. tostring(i))
      local meshRipe  = self:getMeshByName("fruit_ripe_" .. tostring(i))

      if meshGreen and meshRipe then
         local fruit = {green = meshGreen, ripe = meshRipe}
         table.insert(self.fruits, fruit)
         self:growFinish(fruit)
      else
         break
      end
   end
end

function CHarvestable:getType()
   return "pickup"
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
   if fruit then
      fruit.green:getPose():setLocalScale({x=0.1,y=0.1,z=0.1})
      fruit.green:setVisible(true)
      fruit.ripe:setVisible(false)
   end

   if not self.growTimer then
      self.growTimer = runTimer(self.growTimerStep, self, self.growStep, true)
      self.growCallback = SkySystem:subscribeFastForwardTime(partial(self.onFastForwardTime, self))
   end

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
   fruit.green:setVisible(false)
   fruit.ripe:setVisible(true)
   self.interactor:setRaycastActive(true)
end

function CHarvestable:onFastForwardTime(event, ...)
   --Restart timer to keep accurate growth rate
   self.growTimer:stop()
   self.growTimer = runTimer(self.growTimerStep, self, self.growStep, true)
   local stepsToCatchUp = event.elapsed:getAs("rSecond") / self.growTimerStep
   --Catch up to the exact scale increase
   self:growStep(stepsToCatchUp * self.growDelta)
end

function CHarvestable:getAsItem()
   self:growStart(self:getReadyFruit())
   local item = hlp.safeCreateItemWithoutModel(self.itemName, ItemsData.getItemClass(self.itemName))
   if item then
      item:setVisible(false)
      return item
   else
      log("Can't create " .. self.itemName)
      return nil
   end
end

function CHarvestable:getInteractTime(interactType)
   return 0
end

function CHarvestable:getLootTable()
   local t = {}
   t[self.itemName] = #self.fruits
   return t
end

function CHarvestable:OnSaveState(state)
   state.fruitScales = {}
   for _,fruit in ipairs(self.fruits) do
      table.insert(state.fruitScales, fruit.green:getPose():getLocalScale().x)
   end
end

function CHarvestable:OnLoadState(state)
   if state.fruitScales and self.fruits then
      for index,fruit in ipairs(self.fruits) do
         local scale = state.fruitScales[index]
         if scale and scale < 1 then
            self:growStart(fruit)
            fruit.green:getPose():setLocalScale({x=scale,y=scale,z=scale})
         elseif scale then
            fruit.green:setVisible(false)
         end
      end
   end
end

return {
   CHarvestable=CHarvestable,
   CBloodRoot=CBloodRoot,
   CKTharsianAloe=CKTharsianAloe,
   CStygmyanGoldenApple=CStygmyanGoldenApple,
   CMelon=CMelon,
   CBluethorn=CBluethorn,
}
