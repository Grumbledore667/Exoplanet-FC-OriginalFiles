local oo = require "loop.simple"
local CTrigger = (require "trigger").CTrigger

local CTriggerSwim = oo.class({}, CTrigger)

function CTriggerSwim:loadParameters()
   self.byPlayer = true
   self.enabled  = true
   self.swimBox  = nil
end

function CTriggerSwim:OnCreate()
   CTrigger.OnCreate(self)
   self:loadParameters()

   self.swimBox = getScene():createEntity("collision_box.sbg", "")
   local spose = self:getPose()
   local spos = spose:getPos()
   local sscale = spose:getScale()
   local srot = spose:getRot()
   local boxpose = self.swimBox:getPose()

   sscale.y = 1
   boxpose:setScale(sscale)

   local yscale = spose:getScale().y
   spos.y = spos.y + (50 * yscale) - 125
   boxpose:setPos(spos)

   boxpose:setRot( srot )

   self.swimBox:setCollisionCharacters(true, true)
   self.swimBox:setCollisionObjects(true)
end

function CTriggerSwim:OnDestroy()
   if self.swimBox then
      getScene():destroyEntity(self.swimBox)
   end
   self.swimBox = nil
end

function CTriggerSwim:OnEnter( char )
   CTrigger.OnEnter(self, char)
   if char and char == getPlayer() then
      char:startSwim(self)
   elseif char then
      char:setState("swimming", true)
      if not char.BT then -- limit to old ai characters
         char:setOrientationSpeed(char:getOrientationSpeed() / 3)
         char:setMoveSpeed(char:getMoveSpeed() / 3)
      end
   end
end

function CTriggerSwim:OnLeave( char )
   CTrigger.OnLeave(self, char)
   if char and char == getPlayer() then
      char:stopSwim(self)
   elseif char then
      char:setState("swimming", false)
      if not char.BT then -- limit to old ai characters
         char:setOrientationSpeed(char:getOrientationSpeed() * 3)
         char:setMoveSpeed(char:getMoveSpeed() * 3)
      end
   end
end

return {CTriggerSwim=CTriggerSwim}
