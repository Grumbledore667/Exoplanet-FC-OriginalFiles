local oo = require "loop.simple"
local CItem = (require "items.item").CItem

local ItemRecipes =
{
   ["energy_fence.itm"] = {
      ["energy_fence.sbg"] = {
         type="CEnergyFence",
         params = {}
      },
   },

   ["beacon.itm"] = {
      ["beacon_stand.sbg"] = {
         type="CBeacon",
         params = {}
      },
   },

   ["turret.itm"] = {
      ["turret.cfg"] = {
         type="CTurret",
         params = {}
      },
   },

   ["firewood.itm"] = {
      ["campfire.sbg"] = {
         type="CFireplace",
         params = {}
      },
   },

   ["antigravium_bait.itm"] = {
      ["crystall_group_1.sbg"] = {
         type="CBait",
         params = {}
      },
   },
}

local CInstallation = oo.class({}, CItem)

function CInstallation:OnAltActivate()
   log("CInstallation:OnAltActivate " .. self:getItemName())

   local posNew   = self:getObject():getPose():getPos()
   local rotOwner = self:getObject():getPose():getRot()
   local dirOwner = self:getObject():getDir()

   for k,v in pairs(ItemRecipes[self:getItemName()]) do
      local object = getScene():createEntity(k, v.type, {installer = self:getObject()})

      if self:getObject().addInstallation and object.setInstaller then
         self:getObject():addInstallation(object)
         object:setInstaller(self:getObject())
      end

      posNew = vec3Add(posNew, vec3Mul({x=dirOwner.x,y=0,z=dirOwner.z},100))

      object:getPose():setPos(posNew)
      object:getPose():setRot(rotOwner)
   end
end

function CInstallation:hasAltActivation()
   return true
end

function CInstallation:getInteractTime(interactType)
   return 1
end

function CInstallation:isInstallable()
   return true
end

return {
   ItemRecipes=ItemRecipes,
   CInstallation=CInstallation,
}
