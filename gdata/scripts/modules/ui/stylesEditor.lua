local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local wndMgr
local tablex = require "pl.tablex"
local GUIUtils = require "ui.utils"
local deb = require "global.debug"
local MeshTextureMapping = require "meshTextureMapping"
local CAttachmentConfig   = require "ui.stylesEditorAttachmentConfig"
local CStylesLoader       = require "ui.stylesEditorStylesLoader"

local CBaseModule = require "ui.baseModule"

---@class CStylesEditorUI : CBaseModule
local CStylesEditorUI = oo.class({
   layoutName = "stylesEditor.layout",
   initAsInteractive = true,
   initPlayerControlled = true,
}, CBaseModule)

local BODY_TAGS = {
   include = {"PREFAB _top", "PREFAB _legs", "male_top", "male_legs", "PREFAB _neck", "body", "robo", "powersaw", "skeleton", "arphant", "flyer", "grenade"},
   exclude = {"necklace"}
}
local HEAD_TAGS = {
   include = {"head", "eye", "teeth", "whiskers", "jaws"},
   exclude = {"beard_whiskers"}
}
local HAIR_TAGS = {
   include = {"hair", "moustache", "beard"}
}
local CLOTHES_TAGS = {
   exclude = {
      "PREFAB _top", "PREFAB _legs", "male_top", "male_legs", "PREFAB _neck", "body", "robo", "powersaw", "skeleton",
      "head", "eye", "teeth", "whiskers", "jaws",
      "hair", "moustache", "beard"
   }
}


--Methods
function CStylesEditorUI:init()
   CBaseModule.init(self)

   wndMgr = CEGUI.WindowManager:getSingleton()

   self.editor = {wnd = nil, styleNameBox = nil, currentMeshList = nil}

   self.editor.wnd = self.wnd:getChild("Editor")
   self.editor.styleNameBox = CEGUI.toEditbox(self.editor.wnd:getChild("Editbox"))
   self.editor.meshLists = {
      Hats    = {wnd = self.editor.wnd:getChild("Hats"),  meshes = {}},
      Items   = {wnd = self.editor.wnd:getChild("Items"), meshes = {}},
   }
   GUIUtils.widgetSubscribeEventProtected(self.editor.wnd:getChild("TabBody"), "Clicked", partial(self.onTabClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.editor.wnd:getChild("TabHead"), "Clicked", partial(self.onTabClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.editor.wnd:getChild("TabHair"), "Clicked", partial(self.onTabClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.editor.wnd:getChild("TabClothes"), "Clicked", partial(self.onTabClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.editor.wnd:getChild("TabHats"), "Clicked", partial(self.onTabClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.editor.wnd:getChild("TabItems"), "Clicked", partial(self.onTabClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.editor.styleNameBox, "KeyDown", gameplayUI.onEditBoxKeyDown)
   GUIUtils.widgetSubscribeEventProtected(self.editor.wnd, "CloseClicked", partial(self.onClose, self))


   --Initialize common meshLists
   for _, meshName in ipairs(getFolderElements("\\gdata\\objects\\hats\\*.sbg", false, true)) do
      if not meshName:find("hair") then
         self:addMeshLabel(self.editor.meshLists.Hats, meshName)
      end
   end

   for _, meshName in ipairs(getFolderElements("\\gdata\\objects\\items\\*.sbg", false, true)) do
      self:addMeshLabel(self.editor.meshLists.Items, meshName)
   end

   self.popupMenu = { wnd = nil, slots = {} }
   self.popupMenu.wnd = CEGUI.toPopupMenu(gameplayUI.wndGameplay:createChild("TaharezLook/PopupMenu", "StylesPopupMenu"))

   self.popupMenu.wnd:setProperty("ItemSpacing",       "2"   )
   self.popupMenu.wnd:setProperty("ClippedByParent",   "false")
   self.popupMenu.wnd:setProperty("AutoResizeEnabled", "true")
   self.popupMenu.wnd:setProperty("AlwaysOnTop",       "true")

   self.attachmentConfigUI = CAttachmentConfig()
   self.attachmentConfigUI:init()
   self.stylesLoaderUI = CStylesLoader()
   self.stylesLoaderUI:init()
end

function CStylesEditorUI:isVisible()
   return self.wnd and self.wnd:isVisible()
end

function CStylesEditorUI:editBoxHasFocus()
   return self.wnd and (self.editor.styleNameBox:hasInputFocus() or self.attachmentConfigUI.boneEditBox:hasInputFocus())
end

function CStylesEditorUI:show(state, char)
   if state and not self.wnd then
      self:init()
   elseif not state and not self.wnd then
      return
   end

   if state then
      self:setup(char)
      self:showMeshList(self.editor.currentTabName or "Body", true)
   end
   self.attachmentConfigUI:show(false, nil)
   self.stylesLoaderUI:show(false)
   self.popupMenu.wnd:setVisible(false)

   return CBaseModule.show(self, state)
end

function CStylesEditorUI:setup(char)
   --Hide previously opened
   self:showMeshList(self.editor.currentTabName, false)

   self.char = char
end

function CStylesEditorUI:showMeshList(tabName, state)
   if not self.char or not tabName then return end
   local prefabStripped = string.gsub(self.char:getPrefabName(), ".cfg$", "")

   --Compile meshLists for a prefab if not already
   if not self.editor.meshLists[prefabStripped] then
      self:compileMeshListTableFor(prefabStripped)
   end

   --Common or prefab's
   local meshListTable
   if tabName == "Hats" or tabName == "Items" then
      meshListTable = self.editor.meshLists[tabName]
   else
      meshListTable = self.editor.meshLists[prefabStripped][tabName]
   end

   meshListTable.wnd:setVisible(state)
   if state then
      meshListTable.wnd:activate()
      self.editor.wnd:getChild("Tab" .. tabName):setProperty("Disabled", "true")
      --Select equipped meshes
      for _,meshWnd in ipairs(meshListTable.meshes) do
         if tablex.search(self.char.style, meshWnd:getName()) then
            self:selectMeshWnd(meshWnd, true)
         end
      end
      self.editor.currentTabName = tabName
   else
      self.editor.wnd:getChild("Tab" .. tabName):setProperty("Disabled", "false")
      --Reset selections
      for _, meshWnd in ipairs(meshListTable.meshes) do
         self:selectMeshWnd(meshWnd, false)
      end
   end
end

function CStylesEditorUI:createMeshList(tabName)
   local prefabStripped = string.gsub(self.char:getPrefabName(), ".cfg$", "")
   local example = self.editor.wnd:getChild("Hats")
   local meshList = example:clone(false)
   meshList:setName(prefabStripped .. tabName)
   self.editor.wnd:addChild(meshList)
   meshList:setVisible(false)
   return meshList
end

function CStylesEditorUI:compileMeshListTableFor(prefabStripped)
   self.editor.meshLists[prefabStripped] = {
      Body    = {wnd = self:createMeshList("Body"),    meshes = {}},
      Head    = {wnd = self:createMeshList("Head"),    meshes = {}},
      Hair    = {wnd = self:createMeshList("Hair"),    meshes = {}},
      Clothes = {wnd = self:createMeshList("Clothes"), meshes = {}},
   }

   local peoplePrefabs = getFolderElements("\\gdata\\characters\\people\\*", true, false)
   local subMeshes

   if tablex.search(peoplePrefabs, prefabStripped) then
      subMeshes = getFolderElements("\\gdata\\characters\\people\\" .. prefabStripped .. "\\*.cmf", false, true)
   else
      subMeshes = getFolderElements("\\gdata\\characters\\animals\\" .. prefabStripped .. "\\*.cmf", false, true)
   end

   --BODY
   self:addMeshesByTags(self.editor.meshLists[prefabStripped].Body, subMeshes, BODY_TAGS)

   --HEAD
   self:addMeshesByTags(self.editor.meshLists[prefabStripped].Head, subMeshes, HEAD_TAGS)

   --HAIR and facial hair
   self:addMeshesByTags(self.editor.meshLists[prefabStripped].Hair, getFolderElements("\\gdata\\objects\\hats\\*.sbg", false, true), HAIR_TAGS)
   self:addMeshesByTags(self.editor.meshLists[prefabStripped].Hair, subMeshes, HAIR_TAGS)

   --CLOTHES
   self:addMeshesByTags(self.editor.meshLists[prefabStripped].Clothes, subMeshes, CLOTHES_TAGS)
end

function CStylesEditorUI:addMeshesByTags(meshListTable, meshesTable, tags)
   local prefabStripped = string.gsub(self.char:getPrefabName(), ".cfg$", "")
   local function insertPrefab(value)
      return value:gsub("PREFAB ", prefabStripped)
   end

   local function filterPositive(subMeshName)
      for _,tag in ipairs(tablex.map(insertPrefab, tags.include)) do
         if subMeshName:find(tag) then
            return true
         end
      end
      return false
   end

   local function filterNegative(subMeshName)
      for _,tag in ipairs(tablex.map(insertPrefab, tags.exclude)) do
         if subMeshName:find(tag) then
            return false
         end
      end
      return true
   end

   local taggedMeshes = tags.include and tablex.filter(meshesTable, filterPositive) or meshesTable
   taggedMeshes = tags.exclude and tablex.filter(taggedMeshes, filterNegative) or taggedMeshes
   for _,subMeshName in tablex.sort(taggedMeshes) do
      self:addMeshLabel(meshListTable, subMeshName)
   end
end

function CStylesEditorUI:addMeshLabel(meshListTable, meshName)
   local meshList = meshListTable.wnd
   local index = #meshListTable.meshes

   local meshNameStripped = string.gsub(meshName, ".cmf$", "")
   local example = self.editor.wnd:getChild("ExampleMesh")
   local meshWnd = example:clone(false)
   meshList:addChild(meshWnd)

   local posScale = meshWnd:getHeight().scale
   meshWnd:setPosition(CEGUI.UVector2(CEGUI.UDim(0.05,0), CEGUI.UDim(posScale*(index-1),0)))
   meshWnd:setName(meshNameStripped)
   meshWnd:setText(meshNameStripped)
   meshWnd:setVisible(true)
   GUIUtils.widgetSubscribeEventProtected(meshWnd, "MouseClick", partial(self.onMeshClick, self))
   if #MeshTextureMapping.getMeshTextures(meshNameStripped) > 0 then
      local textureButton = meshWnd:createChild("TaharezLook/Button", "Textures")
      textureButton:setPosition(CEGUI.UVector2(CEGUI.UDim(0.9,0), CEGUI.UDim(0,0)))
      textureButton:setSize    (CEGUI.USize(CEGUI.UDim(0.1,0), CEGUI.UDim(1,0)))
      textureButton:setProperty("AlwaysOnTop", "true")
      textureButton:setText    (">")
      textureButton:setVisible (false)
      GUIUtils.widgetSubscribeEventProtected(textureButton, "MouseClick", partial(self.onTexturesButtonClicked, self))
   end
   table.insert(meshListTable.meshes, meshWnd)
end

--Mesh management
function CStylesEditorUI:addMesh(meshName)
   local char = self.char
   if string.find(meshName, ".sbg") then
      table.insert(char.style.attachments, { bone = "head_slot", name = meshName, pos = vec3Zero(), rot = vec3Zero(), scale = {x=1,y=1,z=1}, })
      self.attachmentConfigUI:show(true, meshName)
   else
      table.insert(char.style.body, {meshName})
      self.attachmentConfigUI:show(false, nil)
   end
end

function CStylesEditorUI:removeMesh(meshName)
   local char = self.char
   if string.find(meshName, ".sbg") then
      for _,charAttach in pairs(char.style.attachments) do
         if charAttach.name == meshName then
            char:removeAccessories({charAttach})
            break
         end
      end
   else
      for k,v in ipairs(char.style.body) do
         for key,val in ipairs(v) do
            if val == meshName then
               table.remove(char.style.body[k], key)
               if #char.style.body[k] == 0 then
                  table.remove(char.style.body, k)
               end
               break
            end
         end
      end
      char.style.textures[meshName] = nil
   end
   self.attachmentConfigUI:show(false, nil)
end

function CStylesEditorUI:selectMeshWnd(meshWnd, state)
   if state then
      meshWnd:setProperty("NormalTextColour", "FF34d4ec")
      meshWnd:setID(1)
      if meshWnd:isChild("Textures") then
         meshWnd:getChild("Textures"):setVisible(true)
      end
   else
      meshWnd:setProperty("NormalTextColour", "FFFFFFFF")
      meshWnd:setID(0)
      if meshWnd:isChild("Textures") then
         meshWnd:getChild("Textures"):setVisible(false)
      end
   end
end

function CStylesEditorUI:isMeshSelected(meshWnd)
   return meshWnd:getID() == 1
end

function CStylesEditorUI:setupPopupMenu(list, click_args)
   self.popupMenu.slots = {}
   self.popupMenu.wnd:resetList()

   for i=1,#list do
      local option = CEGUI.toMenuItem(self.popupMenu.wnd:createChild("TaharezLook/MenuItem", "Item" .. tostring(i)))
      option:setProperty("DestroyedByParent", "false")
      option:setProperty("Font", "venus rising rg-5")
      GUIUtils.widgetSubscribeEventProtected(option, "Clicked", partial(self.onPopupMenuClick, self))
      option:setText(list[i])
      self.popupMenu.wnd:addItem(option)
      self.popupMenu.slots[i] = option
   end

   if #list > 0 then
      self.popupMenu.wnd:setVisible(true)
      local pos = CEGUI.UVector2(CEGUI.UDim(0, click_args.position.x), CEGUI.UDim(0, click_args.position.y))
      self.popupMenu.wnd:setPosition(pos)
   else
      self.popupMenu.wnd:setVisible(false)
   end
end


--Callbacks
function CStylesEditorUI:onTabClick(args)
   local we_args = args:toWindowEventArgs()

   --Hide previously opened
   self:showMeshList(self.editor.currentTabName, false)

   local tabName = we_args.window:getName():gsub("Tab", "")
   self:showMeshList(tabName, true)

   self.popupMenu.wnd:setVisible(false)
end

function CStylesEditorUI:onMeshClick(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local meshName = click_args.window:getText()
   local meshWnd = click_args.window
   self.popupMenu.wnd:setVisible(false)

   if click_args.button == CEGUI.LeftButton then
      if self.char then
         if self:isMeshSelected(meshWnd) then
            self:selectMeshWnd(meshWnd, false)
            self:removeMesh(meshName)
         else
            self:selectMeshWnd(meshWnd, true)
            self:addMesh(meshName)
         end

         self:saveStyle()
         self.char:setupAppearance(self.char.styleName)
      end
   elseif click_args.button == CEGUI.RightButton then
      if self:isMeshSelected(meshWnd) then
         local popupOptions = {}
         if meshName:find(".sbg") then
            table.insert(popupOptions, "configure attachment")
            self.popupMenu.meshName = click_args.window:getText()
         end

         self:setupPopupMenu(popupOptions, click_args)
      end
   end
end

function CStylesEditorUI:onTexturesButtonClicked(args)
   local click_args = args:toMouseEventArgs()
   local meshName = click_args.window:getParent():getText()
   local popupOptions = {}
   local textures = MeshTextureMapping.getMeshTextures(meshName)
   if textures then
      for _,textureName in pairs(textures) do
         table.insert(popupOptions, textureName)
      end
      self.popupMenu.meshName = click_args.window:getParent():getText()
   end
   self:setupPopupMenu(popupOptions, click_args)
end

function CStylesEditorUI:onPopupMenuClick(args)
   local we_args = args:toWindowEventArgs()
   local option = we_args.window:getText()
   local meshName = self.popupMenu.meshName
   if option == "configure attachment" then
      self.attachmentConfigUI:show(true, meshName)
   else
      self.char.style.textures[meshName] = option
      local meshSet = MeshTextureMapping.getMeshSet(meshName)
      local meshTextures = MeshTextureMapping.getMeshTextures(meshName)
      local textureID = tablex.find(meshTextures, option)
      if meshName:find(".sbg") then
         for _,charAttach in pairs(self.char.style.attachments) do
            if charAttach.name == meshName then
               charAttach.texture = meshTextures[textureID]
               break
            end
         end
      else
         if #meshSet > 0 then --Set all of the visible textures from the set to the texture ID of this one
            local function applyToMeshSet()
               for _, name in pairs(meshSet) do
                  if tablex.search(self.char.style, name) then
                     meshTextures = MeshTextureMapping.getMeshTextures(name)
                     self.char.style.textures[name] = meshTextures[textureID]
                  end
               end
               self:saveStyle()
               self.char:setupAppearance(self.char.styleName)
            end
            confirmMessage(gameplayUI.wndGameplay, applyToMeshSet, nil, "Update mesh set")
         end
      end
      self:saveStyle()
      self.char:setupAppearance(self.char.styleName)
   end
   self.popupMenu.wnd:setVisible(false)
end


--SAVE/READ METHODS
function CStylesEditorUI:loadStyles()
   local stylesDump = {}
   deb.loadTableFromFile("./gdata/scripts/stylesDump/styles.lua", stylesDump)
   return stylesDump
end

function CStylesEditorUI:dumpStyles(styles)
   deb.dumpTableToFile(styles, "./gdata/scripts/stylesDump/styles.lua", false)
end

function CStylesEditorUI:saveStyle()
   local styleName = self.editor.styleNameBox:getText()

   if styleName == "" then styleName = self.char:getName() end
   styleName = string.lower(styleName)

   self.char.styleName = styleName
   local style = self.char.style
   local prefabStripped = string.gsub(self.char:getPrefabName(), ".cfg$", "")
   local styles = self:loadStyles() or {}
   local attachments = tablex.deepcopy(style.attachments)
   --Make sure entities don't get there
   for _,v in pairs(attachments) do
      v.entity = nil
   end

   if not styles[prefabStripped] then styles[prefabStripped] = {} end
   styles[prefabStripped][styleName] = { body = tablex.deepcopy(style.body), attachments = attachments, textures = tablex.deepcopy(style.textures) }
   self:dumpStyles(styles)
   if self.stylesLoaderUI:wasStylesListCreated() then
      self.stylesLoaderUI:addStyle(styleName)
   end
end

return CStylesEditorUI
