local oo = require "loop.simple"
local _rootRigid = (require "roots")._rootRigid
local random = require "random"

---@class CWater : shRigidEntity
local CWater = oo.class({}, _rootRigid)


function CWater:OnCreate()
   self.volume = loadParamNumber(self, "volume", 3.0)
   self.distance = loadParamNumber(self, "distance", 1200)
   self.soundNames = loadParamStrings(self, "sounds", {"river_1.wav"})

   self.cameraCollider = getScene():createEntity("collision_box.sbg", "")
   local spose = self:getPose()
   local spos = spose:getPos()
   local sscale = spose:getScale()
   local boxpose = self.cameraCollider:getPose()
   local waterName = self:getPrefabName()
   sscale.y = 1
   if waterName == "water_25x25.sbg" then
      sscale.x = sscale.x * 25
      sscale.z = sscale.z * 25
   elseif waterName == "water_50x25.sbg" then
      sscale.x = sscale.x * 25
      sscale.z = sscale.z * 50
   elseif waterName == "water_50x50.sbg" then
      sscale.x = sscale.x * 50
      sscale.z = sscale.z * 50
   end
   boxpose:setScale(sscale)
   spos.y = spos.y - 100
   boxpose:setPos(spos)

   self.cameraCollider:setCollisionCharacters(true, true)
   self.cameraCollider:setCollisionObjects(false)

   self.sounds = {}

   for i = 1, 4 do
      local name = random.choice(self.soundNames)
      local snd = self:createAspect(name)
      if snd ~= nil then
         snd:setVolume(self.volume)
         snd:setDistance(self.distance)
         snd:getPose():setParent(self:getPose())
         snd:getPose():resetLocalPose()

         local x = sscale.x * 100 / 2
         local z = sscale.z * 100 / 2
         if i == 1 then
            snd:getPose():setLocalPos({["x"] = 0, ["z"] = z})
         elseif i == 2 then
            snd:getPose():setLocalPos({["x"] = 0, ["z"] = -z})
         elseif i == 3 then
            snd:getPose():setLocalPos({["x"] = x, ["z"] = 0})
         else
            snd:getPose():setLocalPos({["x"] = -x, ["z"] = 0})
         end

         snd:play()
         table.insert(self.sounds, snd)
      end
   end
end

function CWater:OnDestroy()
   if self.cameraCollider then
      getScene():destroyEntity(self.cameraCollider)
   end
   self.cameraCollider = nil
end

return {CWater=CWater}
