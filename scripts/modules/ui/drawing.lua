local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local imgMgr
local ItemsData = require "itemsData"
local tablex = require "pl.tablex"
local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CDrawingUI : CBaseModule
local CDrawingUI = oo.class({
   layoutName = "drawing.layout",
   initAsInteractive = true,
   initPlayerControlled = true,
}, CBaseModule)


--Methods
function CDrawingUI:init()
   CBaseModule.init(self)

   imgMgr = CEGUI.ImageManager:getSingleton()

   self.image = self.wnd:getChild("ScrollablePane/__auto_container__/Image")

   local image = "outcast_map.jpg"
   if not imgMgr:isDefined(image) then
      imgMgr:addFromImageFile(image, image)
   end
   self.image:setProperty("Image", image)

   GUIUtils.widgetSubscribeEventProtected(self.image, "MouseWheel", partial(self.onMouseWheel, self))
end

function CDrawingUI:show(state, itemName)
   if state and itemName then
      local screenSize = getScreenSize()
      local drawing = ItemsData.getItemDrawing(itemName)
      local drawingSize = tablex.deepcopy(drawing.size)

      self.wnd:setProperty("Text", drawing.eng.title)
      local image = drawing.eng.image
      if not imgMgr:isDefined(image) then
         imgMgr:addFromImageFile(image, image)
      end

      local imageRatio = drawing.size.width / drawing.size.height
      self.image:setProperty("AspectRatio", tostring(imageRatio))
      self.image:setProperty("MaxSize", "{{0,0},{0,0}}")

      if screenSize.x < drawingSize.width and imageRatio > 1 then --Scale by height
         local scale = math.min(drawingSize.height/screenSize.y, 1)
         self.image:setHeight(CEGUI.UDim(scale, 0))
      elseif screenSize.y < drawingSize.height and imageRatio < 1 then --Autoscale by width
         local scale = math.min(drawingSize.width/screenSize.x, 1)
         self.image:setWidth(CEGUI.UDim(scale, 0))
      else --Screen is bigger - show the image as it is
         self.image:setSize(CEGUI.USize(CEGUI.UDim(0, drawingSize.width), CEGUI.UDim(0, drawingSize.height)))
      end

      self.image:setProperty("Image", image)
   end
   return CBaseModule.show(self, state)
end

--Callbacks
function CDrawingUI:onMouseWheel(args)
   local wheel_args = CEGUI.toMouseEventArgs(args)
   local parent = wheel_args.window:getParent():getParent()
   local vscroll = parent:getChild("__auto_vscrollbar__")
   local hscroll = parent:getChild("__auto_hscrollbar__")
   local scroll_pos
   if vscroll:isVisible() then
      scroll_pos = parent:getProperty("VertScrollPosition")
   elseif hscroll:isVisible() then
      scroll_pos = parent:getProperty("HorzScrollPosition")
   end
   if scroll_pos then
      if wheel_args.wheelChange > 0 then
         scroll_pos = scroll_pos - 0.1
      else
         scroll_pos = scroll_pos + 0.1
      end

      scroll_pos = math.max(0, math.min(1.0, scroll_pos))
      if vscroll:isVisible() then
         parent:setProperty("VertScrollPosition", scroll_pos)
      elseif hscroll:isVisible() then
         parent:setProperty("HorzScrollPosition", scroll_pos)
      end
   end
end


return CDrawingUI
