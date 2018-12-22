local oo = require "loop.simple"
local _rootRigid = (require "roots")._rootRigid

local CShells = oo.class({
   activated = false,
}, _rootRigid)

function CShells:OnCreate()
   self.itemName    = loadParam      (self, "itemName", "")
   self.shellsCount = loadParamNumber(self, "shellsCount", 0)

   --self:setCollisionCharacters(false, true)
   self:setCollisionSlide(false)
   self:setCollisionRide (false)
end

function CShells:OnDestroy()
end

function CShells:OnTouchCharacter(obj)
   --log("OnTouchCharacter: " .. obj:getName())

   if self.activated then
      return
   end

   if obj ~= getMC() then
      return
   end

   --log("self.itemName: " .. self.itemName)

   self.activated = true

   if obj == getPlayer() then
      addItemToPlayer(self.itemName, self.shellsCount)
   else
      -- TODO: FIXME: keep old func for obj other than player???
      obj:obtainItem(self.itemName, self.shellsCount)
   end

   if not self.sound then
      self.sound = self:createAspect("shotgun_take.wav")
   end

   self.sound:setLoop(false)
   self.sound:setPose(self:getMeshByIndex(0):getPose())
   self.sound:play()

   self:setVisible         (false)
   self:setCollisionObjects(false)
   self:setDynamic         (false)
end

function CShells:OnUntouchCharacter(obj)
--log("OnUntouchCharacter: " .. obj:getName())
end

function CShells:OnSaveState(state)
   state.activated = self.activated
   state.collisionObjects = self:getCollisionObjects()
   state.dynamic = self:getDynamic()
end

function CShells:OnLoadState(state)
   if state.activated ~= nil then
      self.activated = state.activated
   end
   if self.activated then
      self:setCollisionObjects(false)
      self:setDynamic(false)
   end
end

return {CShells=CShells}
