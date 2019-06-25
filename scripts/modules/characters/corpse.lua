local oo = require "loop.simple"
local _rootCharacter = (require "roots")._rootCharacter
local CCharacter = (require "character").CCharacter
local CAnimationsManager = (require "animationsManager").CAnimationsManager

local hlp = require "helpers"

---@class CCorpse : shCharacter
local CCorpse = oo.class({disabled = false}, _rootCharacter)

function CCorpse:loadParameters()
   self:setHealth(0)
   self:setCollisionCharacters(false)
   self:setMassCoeff(0)
   self:setFeelVisible(false)

   self.death_animation = loadParam(self, "death_animation", "death")
   self.style = { body = {}, attachments = {}, textures = {} }
   self:setupAppearance(loadParam(self, "style", ""))
end

function CCorpse:OnCreate()
   self.animationsManager = CAnimationsManager{ owner = self }
   self.animationsManager:init()

   self:loadParameters()

   self.animationsManager:playAction(self.death_animation, nil, nil, true)
   self:setActionTime(self.death_animation, self:getAnimDuration(self.death_animation))
   self.corpseDummy = hlp.spawnCorpseDummy(self)
end

function CCorpse:setupAppearance(styleName)
   CCharacter.setupAppearance(self, styleName)
end

function CCorpse:setupStyle(style, styleName)
   CCharacter.setupStyle(self, style, styleName)
end

function CCorpse:updateAppearance()
   CCharacter.updateAppearance(self)
end

function CCorpse:setupMeshTextures()
   CCharacter.setupMeshTextures(self)
end

function CCorpse:setupAttachments()
   CCharacter.setupAttachments(self)
end

function CCorpse:setupAttachment(attachmentsTable)
   CCharacter.setupAttachment(self, attachmentsTable)
end

function CCorpse:destroyHair()
   CCharacter.destroyHair(self)
end

function CCorpse:isDisabled()
   return self.disabled
end


return {CCorpse=CCorpse}
