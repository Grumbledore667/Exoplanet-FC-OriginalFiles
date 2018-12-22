local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local SkySystem = (require "environment.sky").SkySystem
local CTime = (require "helpers").CTime
local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CTravelUI : CBaseModule
local CTravelUI = oo.class({
   layoutName = "travel_menu.layout",
   initAsInteractive = true,
   initPlayerControlled = true,
}, CBaseModule)

--Methods
function CTravelUI:init()
   CBaseModule.init(self)

   self.entries = {}

   self.label = self.wnd:getChild("LabelBackground/Label")
   self.listBox = CEGUI.toListbox(self.wnd:getChild("TravelList"))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("TravelButton"), "MouseClick", partial(self.onTravelItemMouseClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("BackButton"), "MouseClick", partial(self.onClose, self))
end

function CTravelUI:setupTravel(obj)
   if obj then
      self.label:setText(obj.prettyName)
   end

   local listBox = self.listBox
   listBox:resetList()
   self.entries = {}

   local ListItemColour = CEGUI.Colour:new_local(1.0,1.0,1.0,1.0)
   local ListItemSelectedColour = CEGUI.Colour:new_local(1.0,1.0,1.0,0.8)

   local t = getGlobalParam("fast_travel_destinations")
   local i = 1
   for objName, entry in pairs(t) do
      if entry.activated then
         if not obj or entry.prettyName ~= obj.prettyName then
            local item = CEGUI.createListboxTextItem(entry.prettyName)
            item:setTextColours(ListItemColour)
            item:setSelectionColours(ListItemSelectedColour)
            item:setSelectionBrushImage("TaharezLook/TextSelectionBrush")
            item:setFont("dialog-14")
            item:setID(i)
            table.insert(self.entries, objName)
            listBox:addItem(item)
            i = i + 1
         end
      end
   end
   self:show(true)
end

function CTravelUI:onShow()
   CBaseModule.onShow(self)
end

--Callbacks
function CTravelUI:onTravelItemMouseClick(args)
   local item = self.listBox:getFirstSelectedItem()
   if not item then return end
   local obj = getObj(self.entries[item:getID()])
   if not obj then return end

   local player = getMC()
   local timeSkip = (getDistance(player:getPose():getPos(), obj:getPose():getPos()) / player:getRunSpeed()) * 1.5 --In real seconds

   gameplayUI:closeUI()
   player:setDisableActionStates(true)
   player:setState("fastTravel", true)
   local callbacks = {
      onPause = {["func"] = function()
         SkySystem:fastForwardTime(CTime(timeSkip, "rSecond"))
         local pos = localPointToWorld({x=0,y=0,z=-100}, obj:getPose())
         local dir = vec3RotateQuat({x=0,y=0,z=1}, obj:getPose():getRotQuat())
         player:moveAndOrientate(pos, dir, 0)
      end},
      onFadeOutEnd = {["func"] = function()
         player:setDisableActionStates(false)
         player:setState("fastTravel", false)
      end},
   }

   gameplayUI:startFadeToBlackSequence(0.3, 1.5, 1, callbacks)
end

return CTravelUI
