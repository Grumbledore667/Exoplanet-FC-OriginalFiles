local oo = require "loop.simple"

local tablex = require "pl.tablex"
local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"

local wndMgr

local CBaseModule = require "ui.baseModule"

local WINDOW_HOVER_COLOUR = "FF34d4ec"


local TAGS = {
   BODY = {
      include = {"PREFAB_top", "PREFAB_legs", "male_top", "male_legs", "PREFAB_neck", "body", "robo", "powersaw", "skeleton", "arphant", "flyer", "grenade"},
      exclude = {"necklace"}
   },
   HEAD = {
      include = {"head", "eye", "teeth", "whiskers", "jaws"},
      exclude = {"beard_whiskers"}
   },
   HAIR = {
      include = {"hair", "moustache", "beard"},
   },
   CLOTHES = {
      exclude = {
         "PREFAB_top", "PREFAB_legs", "male_top", "male_legs", "PREFAB_neck", "body", "robo", "powersaw", "skeleton",
         "head", "eye", "teeth", "whiskers", "jaws",
         "hair", "moustache", "beard"},
   },
}

---@class CNpcEditorMeshesUI : CBaseModule
local CNpcEditorMeshesUI = oo.class({
}, CBaseModule)

function CNpcEditorMeshesUI:init()
   wndMgr = CEGUI.WindowManager:getSingleton()

   self.wnd = gameplayUI.npcEditorUI.wnd:getChild("AvailableMeshes")
   CBaseModule.init(self)

   self.meshExample = self.wnd:getChild("MeshesPane/Example")
   self.meshesContainer = self.wnd:getChild("MeshesPane/Container")
   self.meshWindows = {}

   self.currentTab = "BODY"

   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("TabBody"), "Clicked", partial(self.onTabClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("TabHead"), "Clicked", partial(self.onTabClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("TabHair"), "Clicked", partial(self.onTabClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("TabClothes"), "Clicked", partial(self.onTabClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("TabHats"), "Clicked", partial(self.onTabClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("TabAttachments"), "Clicked", partial(self.onTabClick, self))
end


function CNpcEditorMeshesUI:cleanup()
   for window in pairs(self.meshWindows) do
      wndMgr:destroyWindow(window)
   end
   self.meshWindows = {}
end

--Internal
local function insertPrefab(value, prefabStripped)
   return string.gsub(value, "PREFAB", prefabStripped)
end

--Internal
function CNpcEditorMeshesUI:filterByPositiveTags(subMeshName)
   local tags = TAGS[self.currentTab].include
   for _,tag in ipairs(tablex.map(insertPrefab, tags, self.prefabStripped)) do
      if string.find(subMeshName, tag) then
         return true
      end
   end
   return false
end

--Internal
function CNpcEditorMeshesUI:filterByNegativeTags(subMeshName)
   local tags = TAGS[self.currentTab].exclude
   for _,tag in ipairs(tablex.map(insertPrefab, tags, self.prefabStripped)) do
      if string.find(subMeshName, tag) then
         return false
      end
   end
   return true
end

function CNpcEditorMeshesUI:onShow()
   self.wnd:activate()
   self:setup()
end

--Refresh everything
function CNpcEditorMeshesUI:setup()
   self.char = gameplayUI.npcEditorUI.char
   self.prefabStripped = gameplayUI.npcEditorUI.prefabStripped
   self:cleanup()

   local tags = TAGS[self.currentTab]
   local meshList

   --Compile a meshlist for the current tab
   local peoplePrefabs = getFolderElements("\\gdata\\characters\\people\\*", true, false)
   if self.currentTab == "HATS" then
      meshList = getFolderElements("\\gdata\\objects\\hats\\*.sbg", false, true)
   elseif self.currentTab == "ATTACHMENTS" then
      meshList = getFolderElements("\\gdata\\objects\\items\\*.sbg", false, true)
   else
      if tablex.search(peoplePrefabs, self.prefabStripped) then
         meshList = getFolderElements("\\gdata\\characters\\people\\" .. self.prefabStripped .. "\\*.cmf", false, true)
      else
         meshList = getFolderElements("\\gdata\\characters\\animals\\" .. self.prefabStripped .. "\\*.cmf", false, true)
      end

      meshList = tags.include and tablex.filter(meshList, partial(self.filterByPositiveTags, self)) or meshList
      meshList = tags.exclude and tablex.filter(meshList, partial(self.filterByNegativeTags, self)) or meshList
      if self.currentTab == "HAIR" then --Cause some hair meshes are separated and are in the hats folder
         local additionalMeshes = getFolderElements("\\gdata\\objects\\hats\\*.sbg", false, true)
         additionalMeshes = tags.include and tablex.filter(additionalMeshes, partial(self.filterByPositiveTags, self)) or additionalMeshes
         additionalMeshes = tags.exclude and tablex.filter(additionalMeshes, partial(self.filterByNegativeTags, self)) or additionalMeshes
         meshList = tablex.union(meshList, additionalMeshes)
      end
   end

   local ID = 1
   for _, meshName in tablex.sort(meshList) do --Sort the list alphabetically
      meshName = string.gsub(meshName, ".cmf$", "")
      local window = self.meshExample:clone(true)
      window:setName("Mesh" .. ID)
      window:setVisible(true)
      window:getChild("Label"):setText(meshName)
      window:setUserString("sourceWindowName", "NpcEditorMeshes")
      GUIUtils.widgetSubscribeEventProtected(window, "MouseEntersArea", partial(self.onMeshWindowMouseEnter, self))
      GUIUtils.widgetSubscribeEventProtected(window, "MouseLeavesArea", partial(self.onMeshWindowMouseLeave, self))
      GUIUtils.widgetSubscribeEventProtected(window, "MouseClick", partial(self.onMeshClicked, self))

      self.meshesContainer:addChild(window)
      self.meshWindows[window] = true
      ID = ID + 1
   end
end


--Callbacks--

--Simple highlighting
function CNpcEditorMeshesUI:onMeshWindowMouseEnter(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   click_args.window:getChild("Label"):setProperty("NormalTextColour", WINDOW_HOVER_COLOUR)
   self:highlightSimilarWindowInOverview(click_args.window)
end

function CNpcEditorMeshesUI:highlightSimilarWindowInOverview(window)
   local text = window:getChild("Label"):getText()
   self.highlithedLabelInOverview = nil
   if string.find(text, ".sbg$") then
      for meshWindow in pairs(gameplayUI.npcEditorUI.overviewMeshesUI.attachmentWindows) do
         if meshWindow:getChild("Label"):getText() == text then
            self.highlithedLabelInOverview = meshWindow:getChild("Label")
            break
         end
      end
   else
      for meshWindow in pairs(gameplayUI.npcEditorUI.overviewMeshesUI.submeshWindows) do
         if meshWindow:getChild("Label"):getText() == text then
            self.highlithedLabelInOverview = meshWindow:getChild("Label")
            break
         end
      end
   end

   if self.highlithedLabelInOverview then
      self.highlithedLabelInOverview:setProperty("NormalTextColour", WINDOW_HOVER_COLOUR)
   end
end

--Simple highlighting
function CNpcEditorMeshesUI:onMeshWindowMouseLeave(args)
   if not CEGUI then return end
   local click_args = CEGUI.toMouseEventArgs(args)
   local meshLabel = click_args.window:getChild("Label")  --Or else mouse leave event could fire during destruction
   if not meshLabel then return end
   meshLabel:setProperty("NormalTextColour", "FFFFFFFF")
   self:dehighlightWindowInOverview()
end

function CNpcEditorMeshesUI:dehighlightWindowInOverview()
   if self.highlithedLabelInOverview then
      self.highlithedLabelInOverview:setProperty("NormalTextColour", "FFFFFFFF")
   end
   self.highlithedLabelInOverview = nil
end

function CNpcEditorMeshesUI:onTabClick(args)
   local we_args = args:toWindowEventArgs()
   self.currentTab = string.upper(we_args.window:getName():gsub("Tab", ""))
   self:setup()
end

--Left click adds a mesh
function CNpcEditorMeshesUI:onMeshClicked(args)
   local click_args = args:toMouseEventArgs()
   if click_args.button == CEGUI.LeftButton then
      self:onMeshEnabled(click_args.window)
      self:onMeshWindowMouseEnter(args) --The meshes overview is going to be refreshed, so inject mouseEnter to highlight again
   end
end

function CNpcEditorMeshesUI:onMeshEnabled(window)
   local meshName = window:getChild("Label"):getText()
   local attachmentTable

   if string.find(meshName, ".sbg$") then
      attachmentTable = {bone = "head_slot", name = meshName, pos = vec3Zero(), rot = vec3Zero(), scale = {x=1,y=1,z=1}, entity = nil}
      table.insert(self.char.style.attachments, attachmentTable)
   elseif not tablex.search(self.char.style.body, meshName) then --don't insert more than one submesh
      table.insert(self.char.style.body, {meshName})
   end

   self.char:updateAppearance()
   gameplayUI.npcEditorUI.overviewMeshesUI:setup()

   if attachmentTable then
      gameplayUI.npcEditorUI.attachmentConfigUI:show(true, attachmentTable) --updateAppearance populates 'entity' fields of attachment tables with game objects
   end

   gameplayUI.npcEditorUI:onChangeMade()
end

return CNpcEditorMeshesUI
