local oo = require "loop.simple"
local ootable = require "loop.table"
local CItem = (require "items.item").CItem

local ItemRecipes =
   {
      ["energy_fence.itm"        ] = {["energy_fence.sbg"] = {type="CEnergyFence", params = {}},},
      ["beacon.itm"              ] = {["beacon_stand.sbg"] = {type="CBeacon"     , params = {}},},
      ["turret.itm"              ] = {["turret.cfg"]       = {type="CTurret"     , params = {base="turret_construct_base.sbg", head="turret_construct_head.sbg"}},},
      ["firewood.itm"            ] = {["campfire.sbg"]     = {type="CFireplace"  , params = {}},},
      ["antigravium_bait.itm"    ] = {["crystall_group_1.sbg"]     = {type="CBait"  , params = {}},},
   }

local CInstallation = oo.class({}, CItem)

function CInstallation:OnAltActivate()
   log("CInstallation:OnAltActivate")

   local posItem  = self:getPose():getPos()
   local posNew   = self:getObject():getPose():getPos()
   local rotOwner = self:getObject():getPose():getRot()
   local dirOwner = self:getObject():getDir()

   for k,v in pairs(ItemRecipes[self:getItemName()]) do
      local object = getScene():createEntity( k, v.type )

      if self:getObject().addInstallation and object.setInstaller then
         self:getObject():addInstallation(object)
         object:setInstaller(self:getObject())
      end

      posNew = vec3Add( posNew, vec3Mul({x=dirOwner.x,y=0,z=dirOwner.z},100) )

      object:getPose():setPos( posNew )
      object:getPose():setRot( rotOwner )

      if ( object.initWithParams ) then
         local tmp = ootable.copy( v.params )
         tmp.installer     = self:getObject()
         tmp.installerItem = self
         object:initWithParams( tmp )
      end
   end
end

function CInstallation:hasAltActivation()
   return true
end

function CInstallation:getInteractTime( interactType )
   return 1
end

function CInstallation:isInstallable()
   return true
end

return {
   ItemRecipes=ItemRecipes,
   CInstallation=CInstallation,
}
