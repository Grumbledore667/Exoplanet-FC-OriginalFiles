local oo = require "loop.simple"
local CTrigger = (require "trigger").CTrigger

---@class CTriggerDirectional : CTrigger
local CTriggerDirectional = oo.class({}, CTrigger)

function CTriggerDirectional:OnCreate()
   CTrigger.OnCreate(self)
   self.positivePos = localPointToWorld({x=0,y=0,z=1}, self:getPose())
end

function CTriggerDirectional:OnEnter(char)
   if CTrigger.OnEnter(self, char) then
      if self:isFromPositiveSide(char) then
         self:OnEnterPositive(char)
      else
         self:OnEnterNegative(char)
      end
   end
end

function CTriggerDirectional:OnEnterPositive(char)
end

function CTriggerDirectional:OnEnterNegative(char)
end

function CTriggerDirectional:OnLeave(char)
   if CTrigger.OnLeave(self, char) then
      if self:isFromPositiveSide(char) then
         self:OnLeavePositive(char)
      else
         self:OnLeaveNegative(char)
      end
   end
end

function CTriggerDirectional:OnLeavePositive(char)
end

function CTriggerDirectional:OnLeaveNegative(char)
end

function CTriggerDirectional:isFromPositiveSide(char)
   local pos = char:getPose():getPos()
   if getDistance(pos, self.positivePos) <= getDistance(pos, self:getPose():getPos()) then
      return true
   else
      return false
   end
end

return {CTriggerDirectional=CTriggerDirectional}
