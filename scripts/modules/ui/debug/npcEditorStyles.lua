local oo = require "loop.simple"

local tablex = require "pl.tablex"
local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"

local wndMgr

local Appearance = require "appearance"
local CBaseModule = require "ui.baseModule"

local WINDOW_HOVER_COLOUR = "FF34d4ec"

---@class CNpcEditorStylesUI : CBaseModule
local CNpcEditorStylesUI = oo.class({
}, CBaseModule)

function CNpcEditorStylesUI:init()
   wndMgr = CEGUI.WindowManager:getSingleton()

   self.wnd = gameplayUI.npcEditorUI.wnd:getChild("AvailableStyles")
   CBaseModule.init(self)

   self.styleExample = self.wnd:getChild("StylesPane/Example") --A simple label, not a dragging container
   self.stylesContainer = self.wnd:getChild("StylesPane/Container")
   self.styleWindows = {}
end


function CNpcEditorStylesUI:cleanup()
   for window in pairs(self.styleWindows) do
      wndMgr:destroyWindow(window)
   end
   self.styleWindows = {}
end

function CNpcEditorStylesUI:onShow()
   self.wnd:activate()
   self:setup()
end

--Refresh everything
function CNpcEditorStylesUI:setup()
   self.char = gameplayUI.npcEditorUI.char
   self.prefabStripped = gameplayUI.npcEditorUI.prefabStripped
   self:cleanup()

   local stylesData = Appearance.getAllData()
   local stylesList = stylesData[self.prefabStripped]

   for styleName in tablex.sort(stylesList) do --Sort the list alphabetically
      local window = self.styleExample:clone(true)
      window:setName(styleName)
      window:setVisible(true)
      window:setText(styleName)
      GUIUtils.widgetSubscribeEventProtected(window, "MouseEntersArea", partial(self.onStyleWindowMouseEnter, self))
      GUIUtils.widgetSubscribeEventProtected(window, "MouseLeavesArea", partial(self.onStyleWindowMouseLeave, self))
      GUIUtils.widgetSubscribeEventProtected(window, "MouseClick", partial(self.onStyleClicked, self))

      self.stylesContainer:addChild(window)
      self.styleWindows[window] = true
   end
end


--Callbacks--

--Simple highlighting
function CNpcEditorStylesUI:onStyleWindowMouseEnter(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   click_args.window:setProperty("NormalTextColour", WINDOW_HOVER_COLOUR)
end

--Simple highlighting
function CNpcEditorStylesUI:onStyleWindowMouseLeave(args)
   if not CEGUI then return end
   local click_args = CEGUI.toMouseEventArgs(args)
   local label = click_args.window  --Or else mouse leave event could fire during destruction
   if not label then return end
   label:setProperty("NormalTextColour", "FFFFFFFF")
end

--Left click changes character style
function CNpcEditorStylesUI:onStyleClicked(args)
   local click_args = args:toMouseEventArgs()
   if click_args.button == CEGUI.LeftButton then
      self.char:setupAppearance(click_args.window:getText())
      gameplayUI.npcEditorUI.overviewMeshesUI:setup()

      gameplayUI.npcEditorUI:onChangeMade()
   end
end

return CNpcEditorStylesUI
