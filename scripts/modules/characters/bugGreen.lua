local oo = require "loop.simple"
local CBug = (require "characters.bug").CBug

---@class CBugGreen : CBug
local CBugGreen = oo.class({}, CBug)

function CBugGreen:OnCreate(params)
   CBug.OnCreate(self, params)

   self:disablePickupItem()

   if not self.effects then
      self.effects = {}
      self.effects.magic = self:createAspect("antigrav_magic.sps")
      self.effects.magic:getPose():setParent(self:getPose())
      self.effects.magic:getPose():resetLocalPose()
      self.effects.magic:enable()
   end

   if not self.omni then
      self.omni = self:createAspect("omni")
      self.omni:getPose():setParent(self:getPose())
      self.omni:getPose():resetLocalPose()
      self.omni:getPose():setLocalPos({x=0,y=10,z=0})
      self.omni:setColor({r=0,g=0.7,b=0})
      self.omni:setRadius (100)
      self.omni:setVisible(true)
   end

   self.itemName     = "bug_green.itm"
   self.itemNameDead = "bug_green_dead.itm" -- used for item generation at death (by parent)
end

function CBugGreen:createTree(path)
   CBug.createTree(self, "ai.trees.bugGreen")
end

function CBugGreen:animatedEvent(eventType)
   CBug.animatedEvent(self, eventType)

   if self:getHealth() == 0 and eventType ~= "die" then
      return
   end

   if eventType == "hit" then
      self.fx.blood:play()
      self.animationsManager:playAction("hit")
   end
end

function CBugGreen:die()
   CBug.die(self)

   self:hideBait()
end

function CBugGreen:pickupItem(inventory)
   local item, count = CBug.pickupItem(self, inventory)
   if item then
      self:hideBait()
   end
   return item, count
end

function CBugGreen:hideBait()
   hideObject("q_greenbug_antigravium_bait")
end

function CBugGreen:OnSaveState(state)
   CBug.OnSaveState(self, state)
   state.foodFull = self:getState("foodFull")
end

function CBugGreen:OnLoadState(state)
   CBug.OnLoadState(self, state)
   if state and state.foodFull ~= nil then
      self:setState("foodFull", state.foodFull)
   end
end

return {CBugGreen=CBugGreen}
