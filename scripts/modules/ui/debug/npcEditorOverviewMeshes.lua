local oo = require "loop.simple"

local tablex = require "pl.tablex"
local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"
local hlp = require "helpers"

local wndMgr

local MeshTextureMapping = require "meshTextureMapping"
local CBaseModule = require "ui.baseModule"

local MESH_WINDOW_DEFAULT_COLOUR = "FFFFFFFF"
local MESH_WINDOW_HOVER_COLOUR = "FF34d4ec"

---@class CNpcEditorOverviewMeshesUI : CBaseModule
local CNpcEditorOverviewMeshesUI = oo.class({
   initVisible = true,
}, CBaseModule)

function CNpcEditorOverviewMeshesUI:init()
   CBaseModule.init(self)

   wndMgr = CEGUI.WindowManager:getSingleton()

   self.meshExample = self.wnd:getChild("Example")
   self.submeshesContainer = self.wnd:getChild("SubmeshesContainer")
   self.attachmentsContainer = self.wnd:getChild("AttachmentsContainer")
   self.submeshWindows = {}
   self.attachmentWindows = {}

   GUIUtils.widgetSubscribeEventProtected(gameplayUI.npcEditorUI.wnd, "DragDropItemDropped", partial(self.onMeshDragDropToMainWindow, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd, "DragDropItemDropped", partial(self.onMeshDragDropToOverview, self))
end


function CNpcEditorOverviewMeshesUI:cleanup()
   for window in pairs(self.submeshWindows) do
      wndMgr:destroyWindow(window)
   end
   self.submeshWindows = {}

   for window in pairs(self.attachmentWindows) do
      wndMgr:destroyWindow(window)
   end
   self.attachmentWindows = {}
end

--Make a sortable list from nested style.body table
local function makeSubmeshList(t)
   local res = {}
   for _, meshTable in pairs(t) do
      for _, meshName in pairs(meshTable) do
         table.insert(res, meshName)
      end
   end
   return res
end

function CNpcEditorOverviewMeshesUI:getAppliedMeshTexture(window)
   local meshType = GUIUtils.getWindowUserStringSafe(window, "meshType")
   local meshName = window:getChild("Label"):getText()
   if meshType == "Submesh" then
      return self.char.style.textures and self.char.style.textures[meshName]
   elseif meshType == "Attachment" then
      local attachmentTable = self.attachmentWindows[window]
      return attachmentTable.texture
   end
end

--Refresh everything
function CNpcEditorOverviewMeshesUI:setup()
   self.char = gameplayUI.npcEditorUI.char
   self.prefabStripped = gameplayUI.npcEditorUI.prefabStripped

   self:cleanup()

   local style = self.char.style

   --Meshes
   local ID = 1
   for _, meshName in tablex.sortv(makeSubmeshList(style.body)) do --Sort the list alphabetically
      self:createMeshWindow(meshName, "Submesh", ID)
      ID = ID + 1
   end

   --Attachments
   for i, attachmentTable in ipairs(style.attachments) do --Sort the list alphabetically
      self:createMeshWindow(attachmentTable.name, "Attachment", i)
   end
end

function CNpcEditorOverviewMeshesUI:createMeshWindow(meshName, meshType, ID)
   local window = self.meshExample:clone(true)
   window:setName(meshType .. ID)
   window:setVisible(true)
   window:getChild("Label"):setText(meshName)
   window:setUserString("sourceWindowName", "NpcEditorOverview")
   window:setUserString("meshType", meshType)
   GUIUtils.widgetSubscribeEventProtected(window, "MouseEntersArea", partial(self.onMeshMouseEnter, self))
   GUIUtils.widgetSubscribeEventProtected(window, "MouseLeavesArea", partial(self.onMeshMouseLeave, self))
   GUIUtils.widgetSubscribeEventProtected(window, "MouseClick", partial(self.onMeshClicked, self))
   --Because apparently, vertical layout container? does not propagate drag drop events to the meshesPane window
   GUIUtils.widgetSubscribeEventProtected(window, "DragDropItemDropped", partial(self.onMeshDragDropToOverview, self))

   if meshType == "Submesh" then
      self.submeshWindows[window] = true
      self.submeshesContainer:addChild(window)
   elseif meshType == "Attachment" then
      self.attachmentWindows[window] = self.char.style.attachments[ID] --Allows to precisely manage and destroy attachments
      self.attachmentsContainer:addChild(window)
   end

   local appliedTexture = self:getAppliedMeshTexture(window)
   if appliedTexture then
      window:setHeight(CEGUI.UDim(0.085, 0))
      window:getChild("Texture"):setVisible(true)
      window:getChild("Texture"):setText(appliedTexture)
      window:getChild("TextureButton"):setHeight(CEGUI.UDim(0.5, 0))
   end
   if #MeshTextureMapping.getMeshTextures(meshName) > 0 then
      window:getChild("TextureButton"):setVisible(true)
      GUIUtils.widgetSubscribeEventProtected(window:getChild("TextureButton"), "MouseClick", partial(self.onTextureButtonClicked, self))
   end
end

--Callbacks--

--Simple highlighting
function CNpcEditorOverviewMeshesUI:onMeshMouseEnter(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local meshWnd = click_args.window
   meshWnd:getChild("Label"):setProperty("NormalTextColour", MESH_WINDOW_HOVER_COLOUR)
end

--Simple highlighting
function CNpcEditorOverviewMeshesUI:onMeshMouseLeave(args)
   if not CEGUI then return end
   local click_args = CEGUI.toMouseEventArgs(args)
   local meshLabel = click_args.window:getChild("Label")
   if not meshLabel then return end --Or else mouse leave event could fire during destruction
   meshLabel:setProperty("NormalTextColour", MESH_WINDOW_DEFAULT_COLOUR)
end

--Summon texture popup selection menu
function CNpcEditorOverviewMeshesUI:onTextureButtonClicked(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.RightButton then
      local window = click_args.window
      local meshWindow = window:getParent()
      local meshName = meshWindow:getChild("Label"):getText()

      local popupOptions = {}
      for _, textureName in pairs(MeshTextureMapping.getMeshTextures(meshName)) do
         popupOptions[textureName] = {func = self.onTexturePopupClicked, args = {self, textureName, meshWindow}}
      end
      gameplayUI.popupMenuUI:setup(popupOptions)
   end
end

--Select mesh texture
function CNpcEditorOverviewMeshesUI:onTexturePopupClicked(textureName, meshWindow)
   local meshName = meshWindow:getChild("Label"):getText()
   local meshType = GUIUtils.getWindowUserStringSafe(meshWindow, "meshType")

   local meshSet = MeshTextureMapping.getMeshSet(meshName)
   local meshTextures = MeshTextureMapping.getMeshTextures(meshName)
   local textureID = tablex.find(meshTextures, textureName)
   if meshType == "Attachment" then
      local selectedAttachmentTable = self.attachmentWindows[meshWindow]
      for _, attachmentTable in pairs(self.char.style.attachments) do
         if attachmentTable == selectedAttachmentTable then
            attachmentTable.texture = meshTextures[textureID]
            break
         end
      end
      self.char:setupAttachments()
   elseif meshType == "Submesh" then
      self.char.style.textures[meshName] = textureName
      self.char:setupMeshTextures()

      if #meshSet > 0 then --Set all of the visible textures from the set to the texture ID of this one
         local function applyToMeshSet()
            for _, name in pairs(meshSet) do
               if tablex.search(self.char.style, name) then
                  meshTextures = MeshTextureMapping.getMeshTextures(name)
                  self.char.style.textures[name] = meshTextures[textureID]
               end
            end
            self.char:setupMeshTextures()
            self:setup()

            gameplayUI.npcEditorUI:onChangeMade()
         end
         confirmMessage(gameplayUI.wndGameplay, applyToMeshSet, nil, "Update mesh set")
      end
   end

   self:setup()

   gameplayUI.npcEditorUI:onChangeMade()
end

--Drag drop to any mesh contaner in the overview adds a mesh
function CNpcEditorOverviewMeshesUI:onMeshDragDropToOverview(args)
   local dd_args = CEGUI.toDragDropEventArgs(args)
   local window = dd_args.dragDropItem
   if window:getUserString("sourceWindowName") == "NpcEditorMeshes" then
      gameplayUI.npcEditorUI.meshesUI:onMeshEnabled(window)
   end
end

--RMB removes a mesh, LMB allows to configure attachment
function CNpcEditorOverviewMeshesUI:onMeshClicked(args)
   local click_args = args:toMouseEventArgs()
   local window = click_args.window
   local meshType = GUIUtils.getWindowUserStringSafe(window, "meshType")
   if click_args.button == CEGUI.LeftButton then
      self:onMeshRemoved(window)
   elseif click_args.button == CEGUI.RightButton and meshType == "Attachment" then
      gameplayUI.npcEditorUI.attachmentConfigUI:show(true, self.attachmentWindows[window])
   end
end

--Drag drop to main window removes a mesh
function CNpcEditorOverviewMeshesUI:onMeshDragDropToMainWindow(args)
   local dd_args = CEGUI.toDragDropEventArgs(args)
   local window = dd_args.dragDropItem

   local meshType = GUIUtils.getWindowUserStringSafe(window, "meshType")
   if meshType == "Submesh" or meshType == "Attachment" then
      self:onMeshRemoved(window)
   end
end

function CNpcEditorOverviewMeshesUI:onMeshRemoved(window)
   local meshType = GUIUtils.getWindowUserStringSafe(window, "meshType")
   local style = self.char.style

   if meshType == "Submesh" then
      local removeMeshName = window:getChild("Label"):getText()
      for i, submeshTable in pairs(style.body) do
         for j, meshName in pairs(submeshTable) do
            if removeMeshName == meshName then
               table.remove(submeshTable, j)
               if #submeshTable == 0 then
                  table.remove(style.body, i)
               end
               break
            end
         end
      end
   elseif meshType == "Attachment" then
      local selectedAttachmentTable = self.attachmentWindows[window]
      for i, attachmentTable in pairs(style.attachments) do
         if selectedAttachmentTable == attachmentTable then
            hlp.safeDestroyEntity(attachmentTable.entity)
            table.remove(style.attachments, i)
            break
         end
      end
   end

   self.char:updateAppearance()
   self:setup()

   gameplayUI.npcEditorUI:onChangeMade()
end

return CNpcEditorOverviewMeshesUI
