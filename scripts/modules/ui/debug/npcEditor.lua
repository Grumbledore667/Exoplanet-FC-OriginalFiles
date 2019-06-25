local oo = require "loop.simple"

local tablex = require "pl.tablex"
local f = require "fun"
local partial = f.partial
local random = require "random"

local GUIUtils = require "ui.utils"
local deb = require "global.debug"

local NpcData = require "npcData"
local Appearance = require "appearance"

local CNpcEditorOverviewInventoryUI = require "ui.debug.npcEditorOverviewInventory"
local CNpcEditorOverviewEquipmentUI = require "ui.debug.npcEditorOverviewEquipment"
local CNpcEditorOverviewMeshesUI = require "ui.debug.npcEditorOverviewMeshes"

local CNpcEditorMeshesUI = require "ui.debug.npcEditorMeshes"
local CNpcEditorItemsUI = require "ui.debug.npcEditorItems"
local CNpcEditorStylesUI = require "ui.debug.npcEditorStyles"
local CNpcEditorAnimationsUI = require "ui.debug.npcEditorAnimations"
local CNpcEditorAttachmentConfigUI = require "ui.debug.npcEditorAttachmentConfig"

local CBaseModule = require "ui.baseModule"

local appearanceStylesPath = "./gdata/scripts/modules/appearanceStyles.lua"
local npcDataTablesPath = "./gdata/scripts/modules/npcDataTables.lua"

---@class CNpcEditorUI : CBaseModule
local CNpcEditorUI = oo.class({
   layoutName = "debug/npcEditor.layout",
   initAsInteractive = true,
   initPlayerControlled = true,
}, CBaseModule)

function CNpcEditorUI:init()
   CBaseModule.init(self)

   --Overview
   self.overviewWindow = self.wnd:getChild("Overview")
   self.saveEditbox = CEGUI.toEditbox(self.overviewWindow:getChild("SaveEditbox"))

   self.overviewMeshesUI = CNpcEditorOverviewMeshesUI({
      wnd = self.wnd:getChild("Overview/MeshesPane"),
   })
   self.overviewMeshesUI:init()
   self.overviewEquipmentUI = CNpcEditorOverviewEquipmentUI({
      wnd = self.wnd:getChild("Overview/Equipment"),
   })
   self.overviewEquipmentUI:init()
   self.overviewInventoryUI = CNpcEditorOverviewInventoryUI({
      wnd = self.wnd:getChild("Overview/ItemsPane"),
      contentPane = self.wnd:getChild("Overview/ItemsPane"),
   })
   self.overviewInventoryUI:init()

   --Separate windows
   self.meshesUI = CNpcEditorMeshesUI()
   self.meshesUI:init()

   self.attachmentConfigUI = CNpcEditorAttachmentConfigUI()
   self.attachmentConfigUI:init()

   self.itemsUI = CNpcEditorItemsUI()
   self.itemsUI:init()

   self.stylesUI = CNpcEditorStylesUI()
   self.stylesUI:init()

   self.animationsUI = CNpcEditorAnimationsUI()
   self.animationsUI:init()

   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("MeshesButton"), "Clicked", partial(self.onMeshesButtonClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("ItemsButton"), "Clicked", partial(self.onItemsButtonClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("StylesButton"), "Clicked", partial(self.onStylesButtonClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("AnimationsButton"), "Clicked", partial(self.onAnimationsButtonClick, self))

   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("LoadAutosaveButton"), "Clicked", partial(self.onLoadAutoSaveClick, self))

   GUIUtils.widgetSubscribeEventProtected(self.overviewWindow:getChild("SaveButton"), "Clicked", partial(self.onSaveButtonClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.overviewWindow, "CloseClicked", partial(self.onClose, self))

   local helpTooltip = self.wnd:getChild("HelpButton"):getTooltip()
   helpTooltip:setDisplayTime(150)
   helpTooltip:setHoverTime(0)

   self.undoIndex = 0
   self.undoMaxCount = 15
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("UndoBackButton"), "Clicked", partial(self.onUndoBackClick, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("UndoForwardButton"), "Clicked", partial(self.onUndoForwardClick, self))
end

function CNpcEditorUI:isVisible()
   return self.wnd and self.wnd:isVisible()
end

function CNpcEditorUI:editBoxHasFocus()
   return self.wnd and (self.saveEditbox:hasInputFocus() or self.attachmentConfigUI.boneEditBox:hasInputFocus())
end

function CNpcEditorUI:show(state, char)
   if state and not self.wnd then
      self:init()
   elseif not state and not self.wnd then
      return
   end

   local player = getPlayer()
   if state then
      if self.char ~= char then
         self.undoSnapTable = {}
         self.undoIndex = 0

         self.char = char

         self:onChangeMade() --Save initial char state
      end
      self.prefabStripped = string.gsub(char:getPrefabName(), ".cfg$", "")

      self.overviewMeshesUI:setup()

      self.overviewEquipmentUI:setup()

      self.overviewInventoryUI:setup()

      --Everything else is setup on demand

      self.saveEditbox:setText(self.char:getName())

      --debugwidget(function() return require "pprint".pformat(self.char.style) end)

      --Protect the character and player
      self.char:OnSleepBegin()
      self.char._previousHasNoEnemiesOverride = self.char.hasNoEnemiesOverride
      self.char:setHasNoEnemiesOverride(true)
      player._previousHasNoEnemiesOverride = player.hasNoEnemiesOverride
      player:setHasNoEnemiesOverride(true)
   else
      self.char:OnSleepEnd()
      self.char:setHasNoEnemiesOverride(self.char._previousHasNoEnemiesOverride)
      player:setHasNoEnemiesOverride(player._previousHasNoEnemiesOverride)
   end

   CBaseModule.show(self, state)
end


--Callbacks--
function CNpcEditorUI:onMeshesButtonClick(args)
   self.itemsUI:show(false)
   self.stylesUI:show(false)
   self.animationsUI:show(false)
   self.meshesUI:show(not self.meshesUI:isVisible())
   GUIUtils.positionWindowRelativeTo(self.meshesUI.wnd, self.overviewWindow, "right")
end

function CNpcEditorUI:onItemsButtonClick(args)
   self.meshesUI:show(false)
   self.stylesUI:show(false)
   self.animationsUI:show(false)
   self.itemsUI:show(not self.itemsUI:isVisible()) --auto setups the window
   GUIUtils.positionWindowRelativeTo(self.itemsUI.wnd, self.overviewWindow, "right")
end

function CNpcEditorUI:onStylesButtonClick(args)
   self.itemsUI:show(false)
   self.meshesUI:show(false)
   self.animationsUI:show(false)
   self.stylesUI:show(not self.stylesUI:isVisible()) --auto setups the window
   GUIUtils.positionWindowRelativeTo(self.stylesUI.wnd, self.overviewWindow, "right")
end

function CNpcEditorUI:onAnimationsButtonClick(args)
   self.itemsUI:show(false)
   self.meshesUI:show(false)
   self.stylesUI:show(false)
   self.animationsUI:show(not self.animationsUI:isVisible()) --auto setups the window
   GUIUtils.positionWindowRelativeTo(self.animationsUI.wnd, self.overviewWindow, "right")
end


--Save/Load
function CNpcEditorUI:onSaveButtonClick()
   local popupOptions = {
      ["style"] = {func = self.onStyleSaved, args = {self}},
      ["npc data"] = {func = self.onNpcDataSaved, args = {self}},
      ["all"] = {func = self.onAllSaved, args = {self}},
   }
   gameplayUI.popupMenuUI:setup(popupOptions)
end

function CNpcEditorUI:onAllSaved()
   self:onStyleSaved()
   self:onNpcDataSaved()
end

function CNpcEditorUI:snapCharStyle()
   local style = self.char.style
   local attachments = tablex.deepcopy(style.attachments)
   --Make sure entities don't get there
   for _,v in pairs(attachments) do
      v.entity = nil
   end
   return { body = tablex.deepcopy(style.body), attachments = attachments, textures = tablex.deepcopy(style.textures) }
end

function CNpcEditorUI:onStyleSaved(path)
   local name = self.saveEditbox:getText()

   if name == "" then name = self.char:getName() end
   name = string.lower(name)

   self.char.styleName = name
   local style = self:snapCharStyle()

   --Manual save
   if not path then
      local data = Appearance.getAllData()

      if not data[self.prefabStripped] then data[self.prefabStripped] = {} end
      data[self.prefabStripped][name] = style
      deb.dumpTableToFile(data, appearanceStylesPath, true)
   else --Autosave
      local styles = style
      deb.dumpTableToFile(styles, path, false)
   end

   --Only setup after manual save
   if self.stylesUI:isVisible() and not path then
      self.stylesUI:setup()
   end
end

function CNpcEditorUI:snapCharData()
   local char = self.char
   local name = self.saveEditbox:getText()

   local charData = NpcData.getDataFor(name) or {}

   --Save selected parameters, other are copy-pasted from modules/npcData.lua
   --Idle animation
   if char.defaultAnimation ~= "idle" then
      charData.defaultAnimation = char.defaultAnimation
   else
      charData.defaultAnimation = nil
   end

   --Inventory, weapons are added separately - do not include them in lootItems param
   local weapon = char:getWeaponSlotItem()

   --Compile an {itemName = count} table
   local lootItemsTable = {}
   for _, item in pairs(char.inventory.items) do
      local itemName = item:getItemName()
      --Exclude items that are added by default or by other means
      if itemName ~= "hand_to_hand.wpn" and itemName ~= "token_human.itm" and itemName ~= "token_abori.itm" and item ~= weapon then
         lootItemsTable[itemName] = (lootItemsTable[itemName] or 0) + item:getCount()
      end
   end
   --Concatenate it
   local lootItemsString
   if tablex.size(lootItemsTable) > 0 then
      local tmp = {}
      for name, count in pairs(lootItemsTable) do
         tmp[#tmp+1] = string.format("%s, %s", name, count) -- or table.insert
      end
      lootItemsString = table.concat(tmp, ',')
   end
   charData.lootItems = lootItemsString

   if weapon then
      local weaponName = weapon:getItemName()
      if weaponName ~= "hand_to_hand.wpn" then --Fists are added by default
         charData.weaponList = weaponName
      end
   end
   return charData
end

function CNpcEditorUI:onNpcDataSaved(path)
   local name = self.saveEditbox:getText()
   local charData = self:snapCharData()

   --Dump
   if not path then --Manual save
      local data = NpcData.getAllData()
      data[name] = charData
      deb.dumpTableToFile(data, npcDataTablesPath, true)
   else --Autosave
      deb.dumpTableToFile(charData, path, false)
   end
end

--Autosave
function CNpcEditorUI:onChangeMade()
   self:autosave()
   self:undoStoreCharState()
end

local docPath = getDocumentsFolder()
local autoSaveStylePath = docPath .. "\\npcEditorAutoSave-style.lua"
local autoSaveNpcDataPath = docPath .. "\\npcEditorAutoSave-npcData.lua"

function CNpcEditorUI:autosave()
   self:onStyleSaved(autoSaveStylePath)
   self:onNpcDataSaved(autoSaveNpcDataPath)
end

function CNpcEditorUI:loadCharState(state)
   local char = self.char
   char.inventory:destroyAllItems()
   if char.tradeInventory then
      char.tradeInventory:destroyAllItems()
   end

   --Replace params and reload them
   for name, value in pairs(state.charData) do
      char.parameters[name] = state.charData[value]
   end
   char.lootItems = nil
   char:loadParameters() --Also reloads the dialog

   --Style
   if tablex.size(state.style) ~= 0 then
      char:setupStyle(state.style)
   end

   self.overviewMeshesUI:setup()
   self.overviewEquipmentUI:setup()
   self.overviewInventoryUI:setup()
end

function CNpcEditorUI:undoStoreCharState()
   if #self.undoSnapTable >= 15 then
      table.remove(self.undoSnapTable, 1)
   end

   table.insert(self.undoSnapTable, {style = self:snapCharStyle(), charData = self:snapCharData()})

   self.undoIndex = #self.undoSnapTable
end


--Callbacks
function CNpcEditorUI:onLoadAutoSaveClick()
   local charData = {}
   deb.loadTableFromFile(autoSaveNpcDataPath, charData)

   local style = {}
   deb.loadTableFromFile(autoSaveStylePath, style)

   self:loadCharState({style = style, charData = charData})
end

function CNpcEditorUI:onUndoBackClick()
   local i = math.max(self.undoIndex - 1, 1)

   if self.undoSnapTable[i] then
      self.undoIndex = i
      self:loadCharState(self.undoSnapTable[i])
   end
end

function CNpcEditorUI:onUndoForwardClick()
   local i = math.min(self.undoIndex + 1, self.undoMaxCount, #self.undoSnapTable)

   if self.undoSnapTable[i] then
      self.undoIndex = i
      self:loadCharState(self.undoSnapTable[i])
   end
end

return CNpcEditorUI
