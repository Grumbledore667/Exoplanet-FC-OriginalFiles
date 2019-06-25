local deb = require "global.debug"

local i18n = require "i18n"
local tablex = require "pl.tablex"

local guiSystem
local guiContext
local animMgr
local wndMgr

local api = {
   interactiveWindows = {},
}

function api.init()
   guiSystem  = CEGUI.System:getSingleton()
   guiContext = CEGUI.System:getSingleton():getDefaultGUIContext()
   animMgr = CEGUI.AnimationManager:getSingleton()
   wndMgr  = CEGUI.WindowManager:getSingleton()
end

function api.translateAllWindowsText()
   local wndIterator = wndMgr:getIterator()
   while not wndIterator:isAtEnd() do
      local wnd = wndIterator:value()
      api.translateWindowText(wnd)
      wndIterator:next()
   end
end

function api.translateWindowText(wnd)
   local text = api.getWindowTranslationText(wnd)
   if text then
      wnd:setText(text)
   end
end

function api.getWindowTranslationText(wnd)
   if not wnd then
      log("ERROR: 'getWindowTranslationText' recieved nil as a window")
      log(debug.traceback())
      return
   end
   if wnd:isPropertyPresent("TranslationPath") and wnd:isPropertyPresent("Text") then
      local path = wnd:getProperty("TranslationPath")
      if path ~= "" then
         return i18n(path)
      end
   end
end

--It's better to ignore AutoWindows and LayoutContainers as parents and point to their parents instead
function api.getRealWindowParent(window)
   local parent = window:getParent()
   while parent and (parent:isAutoWindow() or parent.layout) do
      parent = parent:getParent()
   end
   return parent or window:getParent()
end

---@param window CEGUI.Window
function api.adjustWindowHeightToVertExtent(window)
   local borderSize = window:getClipRect(true):getHeight() - window:getClipRect(false):getHeight()
   local parent = api.getRealWindowParent(window)
   local scale = (api.getStaticTextOrLabelVertExtent(window) + borderSize) / parent:getPixelSize().height
   window:setHeight(CEGUI.UDim(scale, 0))
end

---@param window CEGUI.Window
function api.adjustWindowWidthToHorzExtent(window)
   local borderSize = window:getClipRect(true):getWidth() - window:getClipRect(false):getWidth()
   local parent = api.getRealWindowParent(window)
   local scale = (api.getStaticTextOrLabelHorzExtent(window) + borderSize) / parent:getPixelSize().width
   window:setWidth(CEGUI.UDim(scale, 0))
end

---@param window CEGUI.Window
---@param pixelIncrease float amount of pixels to add to the windows extent
---@param ... CEGUI.Window
function api.adjustWindowHeightForTextChildren(window, pixelIncrease, ...)
   local extent = 0
   for _, child in ipairs(table.pack(...)) do
      extent = extent + api.getStaticTextOrLabelVertExtent(child)
   end
   local borderSize = window:getClipRect(true):getHeight() - window:getClipRect(false):getHeight()
   local parent = api.getRealWindowParent(window)
   window:setHeight(CEGUI.UDim((extent + pixelIncrease + borderSize)/parent:getPixelSize().height, 0))
end

---@param window CEGUI.Window
---@param pixelIncrease float amount of pixels to add to the windows extent
---@param ... CEGUI.Window
function api.adjustWindowHeightForMaxTextChild(window, pixelIncrease, ...)
   local extent = 0
   for _, child in ipairs(table.pack(...)) do
      local childScale = child:getPixelSize().height / window:getPixelSize().height
      local childExtent = api.getStaticTextOrLabelVertExtent(child) / childScale
      if extent < childExtent then extent = childExtent end
   end
   local borderSize = window:getClipRect(true):getHeight() - window:getClipRect(false):getHeight()
   local parent = api.getRealWindowParent(window)
   window:setHeight(CEGUI.UDim((extent + pixelIncrease + borderSize)/parent:getPixelSize().height, 0))
end

---@param window CEGUI.Window
---@param ... CEGUI.Window
function api.adjustWindowWidthForTextChildren(window, pixelIncrease, ...)
   local extent = 0
   for _, child in ipairs(table.pack(...)) do
      extent = extent + api.getStaticTextOrLabelHorzExtent(child)
   end
   local borderSize = window:getClipRect(true):getWidth() - window:getClipRect(false):getWidth()
   local parent = api.getRealWindowParent(window)
   window:setWidth(CEGUI.UDim((extent + pixelIncrease + borderSize)/parent:getPixelSize().width, 0))
end

---@param window CEGUI.Window
---@param pixelIncrease float amount of pixels to add to the windows extent
---@param ... CEGUI.Window
function api.adjustWindowWidthForMaxTextChild(window, pixelIncrease, ...)
   local extent = 0
   for _, child in ipairs(table.pack(...)) do
      local childScale = child:getPixelSize().width / window:getPixelSize().width
      local childExtent = api.getStaticTextOrLabelHorzExtent(child) / childScale
      if extent < childExtent then extent = childExtent end
   end
   local borderSize = window:getClipRect(true):getWidth() - window:getClipRect(false):getWidth()
   local parent = api.getRealWindowParent(window)
   window:setWidth(CEGUI.UDim((extent + pixelIncrease + borderSize)/parent:getPixelSize().width, 0))
end

--- Position a window relative to a sibling - of the same parent
--- Changes the alignment property of the window to the same of the reference one
---@param window CEGUI.Window
---@param refWindow CEGUI.Window
---@param side string
function api.positionWindowRelativeTo(window, refWindow, side, pixelOffset)
   pixelOffset = pixelOffset or 0
   local pos
   local parent = api.getRealWindowParent(window)
   if side == "top" or side == "bottom" then
      local alignment = refWindow:getProperty("VerticalAlignment")
      window:setProperty("VerticalAlignment", alignment)
      if side == "top" then
         if alignment == "Top" then
            pos = refWindow:getYPosition() - CEGUI.UDim((window:getPixelSize().height + pixelOffset) / parent:getPixelSize().height, 0)
         elseif alignment == "Centre" then
            pos = refWindow:getYPosition() - CEGUI.UDim((window:getPixelSize().height/2 + refWindow:getPixelSize().height/2 + pixelOffset) / parent:getPixelSize().height, 0)
         elseif alignment == "Bottom" then
            pos = refWindow:getYPosition() - CEGUI.UDim((refWindow:getPixelSize().height + pixelOffset) / parent:getPixelSize().height, 0)
         end
      elseif side == "bottom" then
         if alignment == "Top" then
            pos = refWindow:getYPosition() + CEGUI.UDim((refWindow:getPixelSize().height + pixelOffset) / parent:getPixelSize().height, 0)
         elseif alignment == "Centre" then
            pos = refWindow:getYPosition() + CEGUI.UDim((window:getPixelSize().height/2 + refWindow:getPixelSize().height/2 + pixelOffset) / parent:getPixelSize().height, 0)
         elseif alignment == "Bottom" then
            pos = refWindow:getYPosition() + CEGUI.UDim((window:getPixelSize().height + pixelOffset) / parent:getPixelSize().height, 0)
         end
      end
      window:setYPosition(pos)
   elseif side == "left" or side == "right" then
      local alignment = refWindow:getProperty("HorizontalAlignment")
      window:setProperty("HorizontalAlignment", alignment)
      if side == "left" then
         if alignment == "Left" then
            pos = refWindow:getXPosition() - CEGUI.UDim((window:getPixelSize().width + pixelOffset) / parent:getPixelSize().width, 0)
         elseif alignment == "Centre" then
            pos = refWindow:getXPosition() - CEGUI.UDim((window:getPixelSize().width/2 + refWindow:getPixelSize().width/2 + pixelOffset) / parent:getPixelSize().width, 0)
         elseif alignment == "Right" then
            pos = refWindow:getXPosition() - CEGUI.UDim((refWindow:getPixelSize().width + pixelOffset) / parent:getPixelSize().width, 0)
         end
      elseif side == "right" then
         if alignment == "Left" then
            pos = refWindow:getXPosition() + CEGUI.UDim((refWindow:getPixelSize().width + pixelOffset) / parent:getPixelSize().width, 0)
         elseif alignment == "Centre" then
            pos = refWindow:getXPosition() + CEGUI.UDim((window:getPixelSize().width/2 + refWindow:getPixelSize().width/2 + pixelOffset) / parent:getPixelSize().width, 0)
         elseif alignment == "Right" then
            pos = refWindow:getXPosition() + CEGUI.UDim((window:getPixelSize().width + pixelOffset) / parent:getPixelSize().width, 0)
         end
      end
      window:setXPosition(pos)
   end
end

function api.adjustWindowForText(wnd, text, adjustParentHeight, adjustParentWidth)
   local parent = api.getRealWindowParent(wnd)
   wnd:setSize(wnd:getMaxSize())
   wnd:setText(text)
   local width = CEGUI.UDim(0, api.getStaticTextOrLabelHorzExtent(wnd))
   wnd:setWidth(width)
   if adjustParentWidth then
      parent:setWidth(width)
   end
   local height = CEGUI.UDim(0, api.getStaticTextOrLabelVertExtent(wnd))
   if adjustParentHeight then
      parent:setHeight(height)
   end
   wnd:setHeight(height)
   wnd:setText("")
end

function api.widgetSubscribeEventProtected(wnd, event, func)
   local callback = func
   if deb.pcallProtection then
      callback = function(args)
         local status, result = pcall(func, args)
         if status then return result end
      end
   end
   return wnd:subscribeEvent(event, callback)
end

function api.fadeInWindow(wnd, time, onFinishedCallback, ...)
   local params = table.pack(...)
   local instance = animMgr:instantiateAnimation("GenericFadeIn")
   instance:setTargetWindow(wnd)
   instance:setSpeed(1/time)
   instance:start()

   local subConnection
   local function onAnimationEnd(args)
      if onFinishedCallback then
         onFinishedCallback(unpack(params))
      end
      gameplayUI:destroyAnimationInstanceSafe(instance, subConnection)
   end
   subConnection = api.widgetSubscribeEventProtected(wnd, "AnimationEnded", onAnimationEnd)
   return instance
end

function api.fadeOutWindow(wnd, time, onFinishedCallback, ...)
   local params = table.pack(...)
   local instance = animMgr:instantiateAnimation("GenericFadeOut")
   instance:setTargetWindow(wnd)
   instance:setSpeed(1/time)
   instance:start()

   local subConnection
   local function onAnimationEnd(args)
      if onFinishedCallback then
         onFinishedCallback(unpack(params))
      end
      gameplayUI:destroyAnimationInstanceSafe(instance, subConnection)
   end
   subConnection = api.widgetSubscribeEventProtected(wnd, "AnimationEnded", onAnimationEnd)
   return instance
end


local DYNAMIC_WINDOWS = {"WarningMessage", "OptionalLoading", "Confirmation"}

function api.getDynamicWindowSafe(wndName)
   local rootWnd = guiContext:getRootWindow()
   if rootWnd and rootWnd:isChild(wndName) then
      return rootWnd:getChild(wndName)
   end
end

function api.getWindowUserStringSafe(window, str)
   if window:isUserStringDefined(str) then return window:getUserString(str) end
end

---Returns an item from the window that represents it, from a given inventory
---@param window CEGUI.Window
---@param inventory CInventoryBase
---@return CItem
function api.getWindowItem(window, inventory)
   local item
   if window:isUserStringDefined("itemID") then
      local itemID = tonumber(window:getUserString("itemID"))
      item = inventory:getItemById(itemID)
   end
   return item
end

function api.tryDestroyDynamicWindows()
   local found = false
   local hideCursor = false
   for _,wndName in pairs(DYNAMIC_WINDOWS) do
      local wnd = api.getDynamicWindowSafe(wndName)
      if wnd then
         if api.isWindowInteractive(wnd) then
            hideCursor = true
         end
         wndMgr:destroyWindow(wnd)
         found = true
      end
   end
   if hideCursor then gameplayUI:onInteractiveWindowHide() end
   return found
end

---Returns the inventory equipment slot key that the window represents.
function api.getWindowInventorySlotKey(window)
   local slotName = window:getName()
   if string.find(slotName, "slot") then
      slotName = string.gsub(slotName, "slot", "")
      slotName = tonumber(slotName)
   end
   return slotName
end

function api.isOptionalLoadingVisible()
   local wnd = api.getDynamicWindowSafe("OptionalLoading")
   return wnd and wnd:isVisible()
end

function api.isWarningVisible()
   local wnd = api.getDynamicWindowSafe("WarningMessage")
   return wnd and wnd:isVisible()
end

function api.isConfirmationVisible()
   local wnd = api.getDynamicWindowSafe("Confirmation")
   return wnd and wnd:isVisible()
end

function api.isWindowInteractive(wnd)
   return api.interactiveWindows[wnd] == true
end

--TODO:FIXME: Refac userstring setting into proper methods and make this table store module instances and not CEGUI wnds
function api.setWindowInteractive(wnd, state, playerControlled)
   if state then
      api.interactiveWindows[wnd] = true
      wnd:setUserString("playerControlled", tostring(playerControlled))
   else
      api.interactiveWindows[wnd] = nil
      wnd:setUserString("playerControlled", "false")
   end
end

function api.interactiveWindowsVisible()
   for wnd in pairs(api.interactiveWindows) do
      if wnd:isVisible() then return true end
   end
   return false
end

local function sortFunc(x,y)
   return (x:getZIndex() > y:getZIndex()) and x:isVisible() and x:getUserString("playerControlled") == "true"
end

--Find the first visible window and close it
function api.tryCloseInteractiveWindow()
   for wnd in tablex.sort(api.interactiveWindows, sortFunc) do
      if wnd:isVisible() and wnd:getUserString("playerControlled") == "true" and wnd:getRootWindow() == guiContext:getRootWindow() then
         wnd:setVisible(false) --Since setVisible(false) will trigger proper onHide event
         return true
      end
   end
   return false
end

---@param window CEGUI.Window
function api.getStaticTextOrLabelVertExtent(window)
   if window then
      if window:isPropertyPresent("VertExtent") then
         return tonumber(window:getProperty("VertExtent"))
      end

      local lookNFeel = window:getLookNFeel()
      local widgetLook = CEGUI.WidgetLookManager:getSingleton():getWidgetLook(lookNFeel)
      local ok, section = pcall(widgetLook.getImagerySection, widgetLook, "Label")
      if ok then
         return section:getTextComponentIterator():value():getVerticalTextExtent(window)
      end
   end
end

---@param window CEGUI.Window
function api.getStaticTextOrLabelHorzExtent(window)
   if window then
      if window:isPropertyPresent("HorzExtent") then
         return tonumber(window:getProperty("HorzExtent"))
      end

      local lookNFeel = window:getLookNFeel()
      local widgetLook = CEGUI.WidgetLookManager:getSingleton():getWidgetLook(lookNFeel)
      local ok, section = pcall(widgetLook.getImagerySection, widgetLook, "Label")
      if ok then
         return section:getTextComponentIterator():value():getHorizontalTextExtent(window)
      end
   end
end

-- from https://forums.coronalabs.com/topic/42019-split-utf-8-string-word-with-foreign-characters-to-letters/
function api.UTF8ToCharArray(str)
   local charArray = {}
   local iStart = 0
   local strLen = str:len()

   local function bit(b)
      return 2 ^ (b - 1)
   end

   local function hasbit(w, b)
      return w % (b + b) >= b
   end

   local checkMultiByte = function(i)
      if (iStart ~= 0) then
         charArray[#charArray + 1] = str:sub(iStart, i - 1)
         iStart = 0
      end
   end

   for i = 1, strLen do
      local b = str:byte(i)
      local multiStart = hasbit(b, bit(7)) and hasbit(b, bit(8))
      local multiTrail = not hasbit(b, bit(7)) and hasbit(b, bit(8))

      if (multiStart) then
         checkMultiByte(i)
         iStart = i

      elseif (not multiTrail) then
         checkMultiByte(i)
         charArray[#charArray + 1] = str:sub(i, i)
      end
   end

   -- process if last character is multi-byte
   checkMultiByte(strLen + 1)

   return charArray
end

return api
