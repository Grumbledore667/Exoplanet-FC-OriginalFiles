local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CNpcEditorAttachmentConfigUI : CBaseModule
local CNpcEditorAttachmentConfigUI = oo.class({
}, CBaseModule)

function CNpcEditorAttachmentConfigUI:init()
   self.wnd = gameplayUI.npcEditorUI.wnd:getChild("AttachmentConfig")

   CBaseModule.init(self)

   self.boneImage = self.wnd:getChild("bone/StaticImage")
   self.boneImage:setVisible(false)
   self.boneEditBox = CEGUI.toEditbox(self.wnd:getChild("bone/Editbox"))

   GUIUtils.widgetSubscribeEventProtected(self.boneEditBox, "TextChanged", partial(self.onBoneChanged, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd, "Deactivated", partial(self.onDeactivated, self))

   local names = { "pos", "rot", "scale"}
   for _, v in pairs(names) do
      local mainLabel = self.wnd:getChild(v)
      for _, val in pairs({"xLabel", "yLabel", "zLabel"}) do
         local label = mainLabel:getChild(val)
         for i=1,4 do
            GUIUtils.widgetSubscribeEventProtected(label:getChild("Button"..i), "MouseClick", partial(self.onConfigClick, self))
         end
      end
   end
end

function CNpcEditorAttachmentConfigUI:show(state, attachmentTable)
   CBaseModule.show(self, state)
   if state and attachmentTable then
      self:setup(attachmentTable)
      self.wnd:activate() --So onDeactivated works properly
   end
end

function CNpcEditorAttachmentConfigUI:setup(attachmentTable)
   self.char = gameplayUI.npcEditorUI.char
   self.prefabStripped = gameplayUI.npcEditorUI.prefabStripped

   if not attachmentTable or not attachmentTable.entity then return end
   self.wnd:setText(attachmentTable.entity:getPrefabName())
   self.attachmentTable = attachmentTable
   local names = { "pos", "rot", "scale"}
   for _, v in pairs(names) do
      local mainLabel = self.wnd:getChild(v)
      for key, val in pairs(self.attachmentTable[v]) do
         local label = mainLabel:getChild(key .. "Label")
         label:setText(key .. " = " .. val)
      end
   end
end

--Callbacks
function CNpcEditorAttachmentConfigUI:onDeactivated(args)
   if not CEGUI then return end
   self:show(false)
end

function CNpcEditorAttachmentConfigUI:onBoneChanged(args)
   local boneName = self.boneEditBox:getText()
   if not self.char:getBonePose(boneName) then
      self.boneImage:setVisible(true)
      return
   else
      self.boneImage:setVisible(false)

      for _, attach in pairs(self.char.style.attachments) do
         if attach.entity == self.attachmentTable.entity then
            attach.bone = boneName
            break
         end
      end

      self.char:setupAttachments()

      gameplayUI.npcEditorUI:onChangeMade()
   end
end

function CNpcEditorAttachmentConfigUI:onConfigClick(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local name = click_args.window:getName()
   local coord = click_args.window:getParent():getName():gsub("Label", "")
   local coordName = click_args.window:getParent():getParent():getName()
   local delta1 = 1
   local delta2 = 10
   if coordName == "scale" then
      delta1 = 0.01
      delta2 = 0.1
   end

   local map = {
      Button1 = -delta2,
      Button2 = -delta1,
      Button3 = delta1,
      Button4 = delta2,
   }
   local delta = map[name]
   self.attachmentTable[coordName][coord] = self.attachmentTable[coordName][coord] + delta

   self.char:setupAttachments()
   self:setup(self.attachmentTable)

   gameplayUI.npcEditorUI:onChangeMade()
end

return CNpcEditorAttachmentConfigUI
