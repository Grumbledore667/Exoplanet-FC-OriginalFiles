local oo = require "loop.simple"

local wndMgr
local imgMgr
local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CMapUI : CBaseModule
local CMapUI = oo.class({
   layoutName = "map.layout",
   initAsInteractive = true,
   initPlayerControlled = true,
   currentMapItemName = "windscream_canyon_map.itm",
   minZoom = 0.3,
   currentZoom = 1,
}, CBaseModule)

local PIXELS_PER_METER = 2.7

--Methods
function CMapUI:init()
   CBaseModule.init(self)

   wndMgr = CEGUI.WindowManager:getSingleton()
   imgMgr = CEGUI.ImageManager:getSingleton()

   self.mapInfo = { ["windscream_canyon_map.itm"] = {image = "map2.jpg", xoffset = 458, yoffset = -2285}, }
   self.icons = {}
   self.activeMarkers = {}

   --Of the screen height
   self.playerSize = 0.04
   self.markerCenterSize = 0.0185
   self.iconSize = 0.0277

   self.mapImage = self.wnd:getChild("ScrollablePane/__auto_container__/Image")
   self.playerIcon = self.mapImage:getChild("PlayerIcon")
   local image = "map2.jpg"
   if not imgMgr:isDefined(image) then
      imgMgr:addFromImageFile(image, image)
   end
   self.mapImage:setProperty("Image", image)

   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("CenterButton"), "MouseClick", partial(self.onCenterOnPlayer, self))
   GUIUtils.widgetSubscribeEventProtected(self.mapImage, "MouseLeavesArea", partial(self.onMapLeave, self))
   GUIUtils.widgetSubscribeEventProtected(self.mapImage, "MouseButtonDown", partial(self.onMapClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.mapImage, "MouseButtonUp", partial(self.onMapRelease, self))
   GUIUtils.widgetSubscribeEventProtected(self.mapImage, "MouseMove", partial(self.onMapMove, self))
   GUIUtils.widgetSubscribeEventProtected(self.mapImage, "MouseWheel", partial(self.onMapWheel, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("ShowQuestMarkers"), "MouseClick", partial(self.onShowQuestMarkers, self))
   --load this checkbox's state from a global param
   runTimer(0,nil,function()
      if getGlobalParam("showQuestMarkers") ~= nil then
         self.wnd:getChild("ShowQuestMarkers"):setProperty("Selected", tostring(getGlobalParam("showQuestMarkers")))
      end
   end,false)
end

function CMapUI:show(state, itemName)
   if state then
      if itemName == self.currentMapItemName then
         CBaseModule.show(self, state)
      else
         gameplayUI:showInfoTextEx("This map is useless in this area", "minor", "")
      end
   else
      CBaseModule.show(self, state)
   end
end

function CMapUI:onShow()
   CBaseModule.onShow(self)

   self:updateMap()

   local image = self.mapInfo[self.currentMapItemName].image
   if not imgMgr:isDefined(image) then
      imgMgr:addFromImageFile(image, image)
   end
   self.mapImage:setProperty("Image", image)

   if isDebug() then
      self.wnd:getChild("VisualizerButton"):setVisible(true)
   else
      self.wnd:getChild("VisualizerButton"):setVisible(false)
   end
end

function CMapUI:onHide()
   CBaseModule.onHide(self)

   gameplayUI.popupMenuUI:show(false)
end

function CMapUI:updateMap()
   self:onDisplaySizeChanged()

   local mapWidth = self.mapImage:getPixelSize().width
   local mapHeight = self.mapImage:getPixelSize().height
   local playerPos = getMC():getPose():getPos()
   local mapPlayerPos = self:getPositionOnMap(playerPos, self.currentMapItemName)

   local xoffset = self.playerIcon:getPixelSize().width/2
   local yoffset = self.playerIcon:getPixelSize().height/2
   local iconPos = CEGUI.UVector2(CEGUI.UDim(mapPlayerPos.x/mapWidth, -xoffset), CEGUI.UDim(mapPlayerPos.y/mapHeight, -yoffset))
   self.playerIcon:setPosition(iconPos)

   local targetRotation = quatRotateQuat(quatFromDirs(getMC():getDir(), {x=1,y=0,z=0}))
   local playerRot = getAnglesFromQuat(targetRotation).y + 90
   self.playerIcon:setProperty("Rotation", "x:0 y:0 z:"..playerRot)
end

function CMapUI:mapAddIcon(name, icon, tipText)
   local window = self.mapImage:createChild("TaharezLook/StaticImage", name)
   window:setSize(CEGUI.USize(CEGUI.UDim(0, 0), CEGUI.UDim(0, 0)))
   window:setProperty("Image", icon)
   window:setProperty("AspectMode", "Expand")

   window:setProperty("FrameEnabled", "false")
   window:setProperty("BackgroundEnabled", "false")
   window:setProperty("MousePassThroughEnabled", "false")
   window:setProperty("MouseInputPropagationEnabled", "true")
   window:setProperty("TooltipText", tipText)
   window:setProperty("TooltipType", "TaharezLook/Tooltip")
   return window
end

function CMapUI:mapAddIconUnscaled(name, icon, size, worldPos, tipText)
   local screenSize = getScreenSize()
   local mapSize = self.mapImage:getPixelSize()
   local window = self:mapAddIcon(name, icon, tipText)

   window:setHeight(CEGUI.UDim(0, size * screenSize.y))
   local pixelOffset = window:getPixelSize().height/2
   local mapPos = self:getPositionOnMap(worldPos, self.currentMapItemName)
   local position = CEGUI.UVector2(CEGUI.UDim(mapPos.x/mapSize.width, -pixelOffset), CEGUI.UDim(mapPos.y/mapSize.height, -pixelOffset))
   window:setPosition(position)

   self.icons[window] = {worldPos = worldPos, size = size, scaled = false}
   return window
end

function CMapUI:mapAddIconScaled(name, icon, size, worldPos, tipText)
   local mapSize = self.mapImage:getPixelSize()
   local window = self:mapAddIcon(name, icon, tipText)
   size = size * self.currentZoom
   window:setHeight(CEGUI.UDim(size/mapSize.height, 0))
   local pixelOffset = window:getPixelSize().height/2
   local mapPos = self:getPositionOnMap(worldPos, self.currentMapItemName)
   local position = CEGUI.UVector2(CEGUI.UDim((mapPos.x - pixelOffset)/mapSize.width, 0), CEGUI.UDim((mapPos.y - pixelOffset)/mapSize.height, 0))
   window:setPosition(position)

   self.icons[window] = {worldPos = worldPos, size = size, scaled = true}
   return window
end

function CMapUI:mapAddQuestMarker(quest, params, tipText)
   if not quest or not params then return end

   local questName = quest:getName()
   self.activeMarkers[questName] = self.activeMarkers[questName] or {}
   local index = #self.activeMarkers[questName] + 1
   local position = params.pos
   tipText = tipText or ""

   if type(params.pos) == "string" then
      local obj = getObj(params.pos)
      if obj then
         position = obj:getPose():getPos()
         if tipText == "" and obj.getLabel then
            tipText = obj:getLabel()
         end
      else
         return
      end
   end

   tipText = string.format("%s - %s", tipText, quest.title)

   local marker1
   local marker2
   if params.radius then
      local iconSize = params.radius * PIXELS_PER_METER * 2
      marker1 = self:mapAddIconScaled(questName .. index .. "_radius", "quest_radius/QuestRadius", iconSize, position, tipText, true)
      marker2 = self:mapAddIconUnscaled(questName .. index .. "_radius2", "quest_radius/MarkCenter", self.markerCenterSize, position, tipText)
   else
      marker1 = self:mapAddIconUnscaled(questName .. index, "gameplay/LandmarkPoint", self.iconSize, position, tipText)
      marker1:setProperty("AlwaysOnTop", "true")
   end

   if not quest:isTracked() or not getGlobalParam("showQuestMarkers") then
      marker1:setVisible(false)
      if marker2 then
         marker2:setVisible(false)
      end
   end

   table.insert(self.activeMarkers[questName], {marker1, marker2})
end

function CMapUI:onDisplaySizeChanged()
   local screenSize = getScreenSize()
   local mapSize = self.mapImage:getPixelSize()
   self.playerIcon:setHeight(CEGUI.UDim(0, self.playerSize * screenSize.y)) --Width is set by aspect ratio
   for window, params in pairs(self.icons) do
      if not params.scaled then
         window:setHeight(CEGUI.UDim(0, params.size * screenSize.y))
         local pixelOffset = window:getPixelSize().height/2
         local mapPos = self:getPositionOnMap(params.worldPos, self.currentMapItemName)
         local position = CEGUI.UVector2(CEGUI.UDim(mapPos.x/mapSize.width, -pixelOffset), CEGUI.UDim(mapPos.y/mapSize.height, -pixelOffset))
         window:setPosition(position)
      end
   end
end

function CMapUI:destroyActiveQuestMarkers(quest)
   local questName = quest:getName()
   if self.activeMarkers[questName] then
      for _,markers in pairs(self.activeMarkers[questName]) do
         for _,window in pairs(markers) do
            self.icons[window] = nil
            wndMgr:destroyWindow(window)
         end
      end
      self.activeMarkers[questName] = nil
   end
end

function CMapUI:mapAddFastTravel(obj)
   if self.mapImage:isChild(obj:getName()) then return end
   self:mapAddIconUnscaled(obj:getName(), "gameplay/FastTravelPoint", self.iconSize, obj:getPose():getPos(), obj.prettyName)
end

function CMapUI:mapCenterOnPos(pos)
   local mapWidth = self.mapImage:getPixelSize().width
   local mapHeight = self.mapImage:getPixelSize().height

   local horzScroll
   local vertScroll
   local mapPos
   --Means world position
   if pos.y then
      mapPos = self:getPositionOnMap(pos, self.currentMapItemName)
      horzScroll = mapPos.x / mapWidth
      vertScroll = mapPos.y / mapHeight
   else --Means map scale position taken from icon pos
      horzScroll = pos[1]
      vertScroll = pos[2]
   end

   if vertScroll > 0.5 then
     vertScroll = vertScroll + (vertScroll - 0.5) * 0.25
   elseif vertScroll < 0.5 then
     vertScroll = vertScroll - (0.5 - vertScroll) * 0.25
   end

   if horzScroll > 0.5 then
     horzScroll = horzScroll + (horzScroll - 0.5) * 1.2
   elseif horzScroll < 0.5 then
     horzScroll = horzScroll - (0.5 - horzScroll) * 1.2
   end

   self.wnd:getChild("ScrollablePane"):setProperty("HorzScrollPosition", tostring(horzScroll))
   self.wnd:getChild("ScrollablePane"):setProperty("VertScrollPosition", tostring(vertScroll))
end

function CMapUI:getPositionOnMap(vector3, mapItemName)
   local xPixels = math.ceil((vector3.x/100) * PIXELS_PER_METER)
   local yPixels = math.ceil((vector3.z/100) * PIXELS_PER_METER)
   return { x=(xPixels + self.mapInfo[mapItemName].xoffset) * self.currentZoom, y=(yPixels + self.mapInfo[mapItemName].yoffset) * self.currentZoom }
end


--Callbacks
function CMapUI:onCenterOnPlayer(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      self:mapCenterOnPos(getMC():getPose():getPos())
   end
end

function CMapUI:onMapClick(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      self.clicked = true
   end
end

function CMapUI:onMapRelease(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      self.clicked = false
   end
end

function CMapUI:onMapLeave(args)
   if CEGUI then
      self.clicked = false
   end
end

function CMapUI:onMapMove(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if self.clicked then
      local deltaX = click_args.moveDelta.x
      local deltaY = click_args.moveDelta.y
      local containerWidth = self.wnd:getChild("ScrollablePane"):getPixelSize().width
      local containerHeight = self.wnd:getChild("ScrollablePane"):getPixelSize().height
      local mapWidth = self.mapImage:getPixelSize().width
      local mapHeight = self.mapImage:getPixelSize().height
      local horzScroll = tonumber(self.wnd:getChild("ScrollablePane"):getProperty("HorzScrollPosition")) - deltaX/(mapWidth-containerWidth)
      local vertScroll = tonumber(self.wnd:getChild("ScrollablePane"):getProperty("VertScrollPosition")) - deltaY/(mapHeight-containerHeight)

      self.wnd:getChild("ScrollablePane"):setProperty("HorzScrollPosition", tostring(horzScroll))
      self.wnd:getChild("ScrollablePane"):setProperty("VertScrollPosition", tostring(vertScroll))
   end
end

function CMapUI:onMapWheel(args)
   local wheel_args = CEGUI.toMouseEventArgs(args)
   local vertScroll = tonumber(self.wnd:getChild("ScrollablePane"):getProperty("VertScrollPosition"))
   local horzScroll = tonumber(self.wnd:getChild("ScrollablePane"):getProperty("HorzScrollPosition"))
   local size = self.mapImage:getMaxSize()
   local delta = 0.05
   if wheel_args.wheelChange < 0 then
      delta = -0.05
   end
   if self.currentZoom + delta >= self.minZoom and self.currentZoom + delta <= 1 then
      self.currentZoom = self.currentZoom + delta
      --get real width and height
      size.width.offset = math.ceil(self.mapImage:getWidth().offset * self.currentZoom)
      size.height.offset = math.ceil(self.mapImage:getHeight().offset * self.currentZoom)
      self.mapImage:setMaxSize(size)
      self.wnd:getChild("ScrollablePane"):setProperty("HorzScrollPosition", horzScroll)
      self.wnd:getChild("ScrollablePane"):setProperty("VertScrollPosition", vertScroll)
   end
end

function CMapUI:onShowQuestMarkers(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      local newState = click_args.window:getProperty("Selected") == "true"
      if newState ~= getGlobalParam("showQuestMarkers") then
         setGlobalParam("showQuestMarkers", newState)
         for _,q in pairs(quests) do
            if q:isTracked() then
               q:setMarkersVisible(newState)
            end
         end
      end
   end
end

return CMapUI
