local oo = require "loop.simple"
local _rootRigid = (require "roots")._rootRigid

---@class CKabarogHead : shRigidEntity
local CKabarogHead = oo.class({}, _rootRigid)

function CKabarogHead:OnCreate()
   self.interactor = self:createAspect("interactor")
   self.interactor:setObject(self)
   self.interactor:setTriggerRadius(250.0)
   self.interactor:setRaycastRadius(0)
   self.interactor:getPose():setParent(self:getPose())
   self.interactor:getPose():resetLocalPose()
   self.interactor:setTriggerActive(false)

   self:addMaterial("placeholder")
   self:setMaterialVisible("placeholder", false)

   self:setVisible(false)

   self.stink_1 = self:createAspect("stink.sps")
   self.stink_1:setLoop(true)
   self.stink_1:getPose():setScale({x=2,y=2,z=2})
   self.stink_1:getPose():setParent(self:getPose())
   self.stink_1:getPose():resetLocalPos()
   self.stink_1:disable()

   self.stink_2 = self:createAspect("stink.sps")
   self.stink_2:setLoop(true)
   -- self.stink_2:getPose():setScale({x=2,y=2,z=2})
   self.stink_2:getPose():setParent(self:getPose())
   self.stink_2:getPose():resetLocalPos()
   self.stink_2:disable()
end

-- if (effectName == "electro_shock") then
--       if (not self.fx.electroShock) then
--          self.fx.electroShock = {}
--          self.fx.electroShock.emitter = self:createAspect("electro_shock.sps")

--          local emitter = self.fx.electroShock.emitter

--          emitter:setLoop(true)

--          local scale = (self:getCollisionRadius() + self:getCollisionHeight()) * 0.005
--          if (scale < 0.5) then scale = 0.5 end

--          emitter:getPose():setScale     ({x=scale,y=scale,z=scale})
--          emitter:getPose():setParent    (self:getPose())
--          emitter:getPose():resetLocalPos()
--          emitter:getPose():setLocalPos  ({x=0,y=self:getCollisionHeight() * 0.5,z=0})

--          self.fx.electroShock.sound = self:createAspect("Play_electro_smash")

--          self.fx.electroShock.sound:getPose():setParent(self:getPose())
--          self.fx.electroShock.sound:getPose():resetLocalPose()
--          self.fx.electroShock.sound:getPose():setLocalPos({x=0,y=100,z=0})
--          self.fx.electroShock.sound:setDistance(1200)
--       end

--       if (self.fx.electroShock.timer) then
--          self.fx.electroShock.timer:stop()
--          self.fx.electroShock.timer = nil
--       end

--       self.fx.electroShock.emitter:play()
--       self.fx.electroShock.sound:play()
--       self.fx.electroShock.timer = runTimer(time, self.fx.electroShock, CCharacter.stopEffect, false)
--    end


function CKabarogHead:activate(obj)
   self.interactor:setTriggerActive(false)
   self:setMaterialVisible("solid_ns_mono", true)
   self:setMaterialVisible("placeholder", false)

   -- temporary for testing
   -- self:start_stink()
   questSystem:fireEvent("activate", self:getName())
   return true
end

function CKabarogHead:deactivate(obj)
   return true
end

function CKabarogHead:show()
   self:setVisible(true)
   self.interactor:setTriggerActive(true)
   self:setMaterialVisible("solid_ns_mono", false)
   self:setMaterialVisible("placeholder", true)
end

function CKabarogHead:start_stink()
   self.stink_1:enable()
   self.stink_1:play()
   self.stink_2:enable()
   self.stink_2:play()
end


function CKabarogHead:getLabel()
   return "Kabarog head"
end

function CKabarogHead:getType()
   return "activator"
end

function CKabarogHead:getInteractLabel()
   return "place"
end

return {CKabarogHead=CKabarogHead}
