local oo = require "loop.simple"
local CItemGenerator = (require "rigids.itemGenerator").CItemGenerator
local random = require "random"

---@class CCactus : CItemGenerator
local CCactus = oo.class({}, CItemGenerator)

local THRESHOLD = 0.5

function CCactus:OnCreate(params)
   local scale = self:getPose():getScale()
   self.size = scale.y
   if self.size > THRESHOLD then
      self.parameters["meshRaycast"] = true
   else
      self.parameters["interactHeight"] = 100
   end

   self.parameters.itemName = random.choice{"firewood.itm", "cactus_head.itm"}
   CItemGenerator.OnCreate(self, params)
   if self.size <= THRESHOLD then
      ---@type shInteractor
      local inter = self.interactor
      inter:getPose():setLocalPos(vec3New{y=350})
   end
end

function CCactus:getLabel()
   local label = "Alien Cactus Plant"
   return label
end

function CCactus:getLabelPos()
   if self.size > THRESHOLD then
      return vec3Add(vec3RotateQuat(vec3New{y=200}, self:getPose():getRotQuat()), self:getPose():getPos())
   else
      return vec3Add(self.interactor:getPose():getPos(), vec3New{y=50})
   end
end

return {CCactus=CCactus}
