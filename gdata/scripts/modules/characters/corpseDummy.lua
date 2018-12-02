local oo = require "loop.simple"
local _rootCharacter = require "roots"._rootCharacter
local CCharacter = require "character".CCharacter
local CDestroyable = require "mixins.destroyable"

local hlp = require "helpers"

---@class CCorpseDummy : shCharacter
local CCorpseDummy = oo.class({}, _rootCharacter, CDestroyable)

CCorpseDummy.setState = CCharacter.setState
CCorpseDummy.getState = CCharacter.getState

function CCorpseDummy:OnCreate(params)
   CDestroyable.OnCreate(self)
   local parent = params.parent
   if parent.subscribeOnDestroy then
      parent:subscribeOnDestroy(hlp.safeDestroyEntity, self)
   end
   self:getPose():setParent(parent:getPose())
   self:getPose():resetLocalPose()
   self:setVisible(false)
   self:setHealth(1)
   self.states = {}
   self.notificationCenter = {postNotification=function() end}

   self:setState("occupied", false)
end

function CCorpseDummy:OnHit(params)
   params.interrupt = true
end

function CCorpseDummy:getGuild()
   return "GLD_CORPSE"
end

function CCorpseDummy:OnSenseInOther()
end

function CCorpseDummy:OnSenseOutOther()
end

return {CCorpseDummy = CCorpseDummy}
