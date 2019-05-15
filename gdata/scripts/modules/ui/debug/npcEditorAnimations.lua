local oo = require "loop.simple"

local tablex = require "pl.tablex"
local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"

local wndMgr

local CBaseModule = require "ui.baseModule"

local WINDOW_HOVER_COLOUR = "FF34d4ec"

---@class CNpcEditorAnimationsUI : CBaseModule
local CNpcEditorAnimationsUI = oo.class({
}, CBaseModule)

function CNpcEditorAnimationsUI:init()
   wndMgr = CEGUI.WindowManager:getSingleton()

   self.wnd = gameplayUI.npcEditorUI.wnd:getChild("AvailableAnimations")
   CBaseModule.init(self)

   self.animExample = self.wnd:getChild("AnimationsPane/Example") --A simple label, not a dragging container
   self.animContainer = self.wnd:getChild("AnimationsPane/Container")
   self.animWindows = {}
   self.lastAnimation = nil
   self.playCycled = true

   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("CycledCheckbox"), "MouseButtonUp", partial(self.onCycledCheckboxClicked, self))
end


function CNpcEditorAnimationsUI:cleanup()
   for window in pairs(self.animWindows) do
      wndMgr:destroyWindow(window)
   end
   self.animWindows = {}
end

function CNpcEditorAnimationsUI:onShow()
   self.wnd:activate()
   self:setup()
end

--Refresh everything
function CNpcEditorAnimationsUI:setup()
   self.char = gameplayUI.npcEditorUI.char
   self.prefabStripped = gameplayUI.npcEditorUI.prefabStripped
   self:cleanup()

   local peoplePrefabs = getFolderElements("\\gdata\\characters\\people\\*", true, false)
   local animList
   if tablex.search(peoplePrefabs, self.prefabStripped) then
      animList = getFolderElements("\\gdata\\characters\\people\\" .. self.prefabStripped .. "\\*.caf", false, true)
   else
      animList = getFolderElements("\\gdata\\characters\\animals\\" .. self.prefabStripped .. "\\*.caf", false, true)
   end

   for _, animation in tablex.sortv(animList) do --Sort the list alphabetically
      animation = string.gsub(animation, ".caf", "")
      local window = self.animExample:clone(true)
      window:setName(animation)
      window:setVisible(true)
      window:setText(animation)
      GUIUtils.widgetSubscribeEventProtected(window, "MouseEntersArea", partial(self.onAnimWindowMouseEnter, self))
      GUIUtils.widgetSubscribeEventProtected(window, "MouseLeavesArea", partial(self.onAnimWindowMouseLeave, self))
      GUIUtils.widgetSubscribeEventProtected(window, "MouseClick", partial(self.onAnimClicked, self))

      self.animContainer:addChild(window)
      self.animWindows[window] = true
   end
end


--Callbacks--

--Simple highlighting
function CNpcEditorAnimationsUI:onAnimWindowMouseEnter(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   click_args.window:setProperty("NormalTextColour", WINDOW_HOVER_COLOUR)
end

--Simple highlighting
function CNpcEditorAnimationsUI:onAnimWindowMouseLeave(args)
   if not CEGUI then return end
   local click_args = CEGUI.toMouseEventArgs(args)
   local label = click_args.window  --Or else mouse leave event could fire during destruction
   if not label then return end
   label:setProperty("NormalTextColour", "FFFFFFFF")
end

--Left click changes character style
function CNpcEditorAnimationsUI:onAnimClicked(args)
   local click_args = args:toMouseEventArgs()
   local window = click_args.window
   local animation = window:getText()
   if click_args.button == CEGUI.LeftButton then
      if self.playCycled then
         self.char.animationsManager:playCycle(animation)
      else
         self.char.animationsManager:playAction(animation)
      end
      self.lastAnimation = animation
   elseif click_args.button == CEGUI.RightButton and self.char.setDefaultAnimation then
      local popupOptions = {["set as idle"] = {func = function()
         self.char:setDefaultAnimation(animation)
      end}}
      gameplayUI.popupMenuUI:setup(popupOptions)
   end
end

function CNpcEditorAnimationsUI:onCycledCheckboxClicked(args)
   self.playCycled = not self.playCycled
   if self.playCycled then
      if self.lastAnimation then
         self.char.animationsManager:playCycle(self.lastAnimation)
      end
   else
      self.char.animationsManager:playCycle(self.char.defaultAnimation)
   end
end

return CNpcEditorAnimationsUI
