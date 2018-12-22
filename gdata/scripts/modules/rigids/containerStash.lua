local oo = require "loop.simple"
local CInventory = (require "inventory").CInventory
local CContainer = (require "rigids.container").CContainer

local hlp = require "helpers"

local CContainerStash = oo.class({}, CContainer)

function CContainerStash:OnCreate()
   self.inventory = CInventory{}
   self.inventory:init( self )
   self.inventory:setRadius( loadParamNumber ( self, "raycastRadius", 100) )
   self.labelId = loadParam( self, "labelId", "" )
   self.gStash = hlp.CGParam("playerStash")
end

function CContainerStash:activate( obj )
   self.inventory.itemsManager.items = {}
   self.inventory.itemsManager:deserialize( self.gStash:get() or {} )
   return CContainer.activate(self, obj)
end

function CContainerStash:deactivate( obj )
   self.gStash:set(self.inventory.itemsManager:serialize() or {})
   return CContainer.deactivate(self, obj)
end

function CContainerStash:getLabel()
   local stash = self.gStash:get()
   if stash and #stash > 0 then
      return "Stash"
   else
      return "Stash (empty)"
   end
end


-- force overwrite parent save routines
function CContainerStash:OnSaveState(state)
end

function CContainerStash:OnLoadState(state)
end

return {CContainerStash=CContainerStash}
