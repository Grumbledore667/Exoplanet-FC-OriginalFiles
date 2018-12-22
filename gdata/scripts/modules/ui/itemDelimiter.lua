local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local guiContext
local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CItemDelimiterUI : CBaseModule
local CItemDelimiterUI = oo.class({
   layoutName = "items_delimiter.layout",
   initAsInteractive = true,
   initPlayerControlled = true,
   callback = "drag",
}, CBaseModule)

--Methods
function CItemDelimiterUI:init()
   CBaseModule.init(self)

   guiContext = CEGUI.System:getSingleton():getDefaultGUIContext()

   self.editbox = self.wnd:getChild("Editbox"):toEditbox()
   GUIUtils.widgetSubscribeEventProtected(self.editbox, "TextAccepted", partial(self.onEditChanged, self))

   self.scrollbar = CEGUI.toScrollbar(self.wnd:getChild("Scrollbar"))
   GUIUtils.widgetSubscribeEventProtected(self.scrollbar, "ScrollPositionChanged", partial(self.onScrollbarChanged, self))

   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("Apply"), "MouseClick", partial(self.onAccept, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("Cancel"), "MouseClick", partial(self.onCancel, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd, "Deactivated", partial(self.onDeactivated, self))
end

function CItemDelimiterUI:setup(item, callback, obj, maxCount)
   --Reset alignment, which allows to setup the property on the spot after the setup call
   self.wnd:setProperty("HorizontalAlignment", "Left")
   self.wnd:getChild("ItemIcon"):setProperty("Image", "gameplay/"..item.icon)
   local delimiterMax = tostring(maxCount or item.count or item:getCount())

   self.editbox:setText(delimiterMax)
   self.scrollbar:setProperty("DocumentSize", delimiterMax)
   self.scrollbar:setProperty("ScrollPosition", delimiterMax)

   self.item = item
   if type(callback) == "function" then
      self.callback = { func = callback, obj = obj }
   else
      self.callback = callback
   end

   local pos = guiContext:getMouseCursor():getPosition()
   local delHeight = self.wnd:getPixelSize().height
   local delWidth = self.wnd:getPixelSize().width
   pos = CEGUI.UVector2(CEGUI.UDim(0, pos.x-delWidth/2), CEGUI.UDim(0, pos.y-delHeight/2))
   gameplayUI:retainPositionInsideDisplay(pos, self.wnd)
end

function CItemDelimiterUI:editBoxHasFocus()
   return self.editbox:hasInputFocus()
end

function CItemDelimiterUI:getCount()
   return tonumber(self.editbox:getText()) or 0
end

--Callbacks
function CItemDelimiterUI:onAccept(args)
   local itemsCount = self:getCount()

   if type(self.callback) == "table" then
      self.callback.func(self.callback.obj)
   elseif self.callback == "cook" then
      getMC().cookCount = itemsCount
      gameplayUI.popupMenuUI:OnPopupInventoryClick("cook_multi")
   elseif self.callback == "craft" then
      gameplayUI.craftUI:craftItem(self.item, itemsCount)
   end

   self:show(false)
end

function CItemDelimiterUI:onDeactivated(args)
   if not CEGUI then return end
   self:show(false)
end

function CItemDelimiterUI:onCancel()
   self:show(false)
end

function CItemDelimiterUI:onEditChanged(args)
   local itemsCount = round(self:getCount())

   if itemsCount >= 1 and itemsCount <= self.scrollbar:getDocumentSize() then
      self.scrollbar:setScrollPosition(itemsCount)
   elseif itemsCount <= 0 then
      itemsCount = 1
      self.editbox:setText(tostring(itemsCount))
   elseif itemsCount > self.scrollbar:getDocumentSize() then
      itemsCount = self.scrollbar:getDocumentSize()
      self.editbox:setText(tostring(itemsCount))
   end
end

function CItemDelimiterUI:onScrollbarChanged(args)
   local itemsCount = round(self.scrollbar:getScrollPosition())
   if itemsCount == 0 then itemsCount = 1 end
   self.editbox:setText(tostring(itemsCount))
end

return CItemDelimiterUI
