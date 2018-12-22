local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local tablex = require "pl.tablex"
local Appearance = require "appearance"
local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CStylesLoaderUI : CBaseModule
local CStylesLoaderUI = oo.class({}, CBaseModule)

function CStylesLoaderUI:init()
   self.wnd = gameplayUI.stylesEditorUI.wnd:getChild("Loader")
   self.wnd:setVisible(false)

   CBaseModule.init(self)

   self.stylesLists = {}
   gameplayUI.stylesEditorUI.loaderButton = gameplayUI.stylesEditorUI.editor.wnd:getChild("LoaderButton")

   GUIUtils.widgetSubscribeEventProtected(gameplayUI.stylesEditorUI.loaderButton, "MouseClick", partial(self.onShowLoader, self))
end

function CStylesLoaderUI:onShow()
   --Reset
   for _,stylesListTable in pairs(self.stylesLists) do
      stylesListTable.wnd:setVisible(false)
   end

   self:setup()

   local prefabStripped = string.gsub(gameplayUI.stylesEditorUI.char:getPrefabName(), ".cfg$", "")
   self.stylesLists[prefabStripped].wnd:setVisible(true)
end

function CStylesLoaderUI:setup()
   if not self:wasStylesListCreated() then
      self:createStylesList()
   end
end

function CStylesLoaderUI:createStylesList()
   local prefabStripped = string.gsub(gameplayUI.stylesEditorUI.char:getPrefabName(), ".cfg$", "")
   local example = gameplayUI.stylesEditorUI.editor.wnd:getChild("Hats")
   local stylesList = example:clone(false)
   stylesList:setName(prefabStripped)
   self.wnd:addChild(stylesList)
   stylesList:setVisible(false)
   stylesList:setPosition(CEGUI.UVector2(CEGUI.UDim(0,0), CEGUI.UDim(0,0)))
   --TODO:FIXME: figure out why CEGUI.UDim(1,0) crashes the editor upon adding the first overlapping (~41st) style window
   stylesList:setHeight(CEGUI.UDim(0.99,0))

   self.stylesLists[prefabStripped] = {wnd = nil, styles = {}}
   self.stylesLists[prefabStripped].wnd = stylesList

   if Appearance.Style[prefabStripped] then
      for styleName in tablex.sort(Appearance.Style[prefabStripped]) do
         self:addStyle(styleName)
      end
   end

   local stylesDump = gameplayUI.stylesEditorUI:loadStyles()
   if stylesDump[prefabStripped] then
      for styleName in tablex.sort(stylesDump[prefabStripped]) do
         self:addStyle(styleName)
      end
   end
end

function CStylesLoaderUI:addStyle(styleName)
   local prefabStripped = string.gsub(gameplayUI.stylesEditorUI.char:getPrefabName(), ".cfg$", "")
   local stylesListTable = self.stylesLists[prefabStripped]
   local styleWnd = stylesListTable.wnd:getChild(styleName)
   local index = #stylesListTable.styles

   if not styleWnd then
      local example = gameplayUI.stylesEditorUI.editor.wnd:getChild("ExampleMesh")
      styleWnd = example:clone(false)
      styleWnd:setName(styleName)
      stylesListTable.wnd:addChild(styleWnd)
      styleWnd:setVisible(true)
      local posScale = styleWnd:getHeight().scale
      styleWnd:setPosition(CEGUI.UVector2(CEGUI.UDim(0.05,0), CEGUI.UDim(posScale*(index-1),0)))
      styleWnd:setText(styleName)
      GUIUtils.widgetSubscribeEventProtected(styleWnd, "MouseClick", partial(self.onStyleClick, self))
      table.insert(stylesListTable.styles, styleWnd)
   end
end

function CStylesLoaderUI:wasStylesListCreated()
   return self.stylesLists[string.gsub(gameplayUI.stylesEditorUI.char:getPrefabName(), ".cfg$", "")]
end

--Callbacks
function CStylesLoaderUI:onStyleClick(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      local styleName = click_args.window:getText()
      local char = gameplayUI.stylesEditorUI.char
      local tab = gameplayUI.stylesEditorUI.editor.currentTabName
      if char then
         char:setupAppearance(styleName)
         gameplayUI.stylesEditorUI:setup(char)
         gameplayUI.stylesEditorUI:showMeshList(tab, true)
      end
   end
   gameplayUI.stylesEditorUI.popupMenu.wnd:setVisible(false)
end

function CStylesLoaderUI:onShowLoader(args)
   self:show(not self.wnd:isVisible())
   gameplayUI.stylesEditorUI.popupMenu.wnd:setVisible(false)
end

return CStylesLoaderUI
