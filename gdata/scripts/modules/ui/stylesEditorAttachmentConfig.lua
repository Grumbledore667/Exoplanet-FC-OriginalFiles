local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local tablex = require "pl.tablex"
local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CAttachmentConfigUI : CBaseModule
local CAttachmentConfigUI = oo.class({}, CBaseModule)

function CAttachmentConfigUI:init()
   self.wnd = gameplayUI.stylesEditorUI.wnd:getChild("AttachmentConfig")

   CBaseModule.init(self)

   self.boneImage = self.wnd:getChild("bone/StaticImage")
   self.boneImage:setVisible(false)
   self.boneEditBox = CEGUI.toEditbox(self.wnd:getChild("bone/Editbox"))

   GUIUtils.widgetSubscribeEventProtected(self.boneEditBox, "TextChanged", partial(self.onBoneChanged, self))
   GUIUtils.widgetSubscribeEventProtected(self.boneEditBox, "KeyDown", gameplayUI.onEditBoxKeyDown)

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

function CAttachmentConfigUI:show(state, meshName)
   CBaseModule.show(self, state)
   if state and meshName then
      self:setup(meshName)
   end
end

function CAttachmentConfigUI:setup(meshName)
   self.meshName = meshName
   local attachment
   for _, v in pairs(gameplayUI.stylesEditorUI.char.style.attachments) do
      if v.name == meshName then
         attachment = v
      end
   end
   local names = { "pos", "rot", "scale"}
   for _, v in pairs(names) do
      local mainLabel = self.wnd:getChild(v)
      for key, val in pairs(attachment[v]) do
         local label = mainLabel:getChild(key .. "Label")
         label:setText(key .. " = " .. val)
      end
   end
end

--Callbacks
function CAttachmentConfigUI:onBoneChanged(args)
   local boneName = self.boneEditBox:getText()
   if not gameplayUI.stylesEditorUI.char:getBonePose(boneName) then
      self.boneImage:setVisible(true)
      return
   else
      self.boneImage:setVisible(false)

      local attachments = tablex.deepcopy(gameplayUI.stylesEditorUI.char.style.attachments)

      for _, attach in pairs(attachments) do
         if attach.name == self.meshName then
            gameplayUI.stylesEditorUI.char:removeAccessories({attach})
            attach.bone = boneName
            gameplayUI.stylesEditorUI.char:setupAccessories({attach})
         end
      end

      gameplayUI.stylesEditorUI:saveStyle()
   end

   gameplayUI.stylesEditorUI.popupMenu.wnd:setVisible(false)
end

function CAttachmentConfigUI:onConfigClick(args)
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

   local attachments = tablex.deepcopy(gameplayUI.stylesEditorUI.char.style.attachments)
   local index
   for k, v in ipairs(attachments) do
      if v.name == self.meshName then
         index = k
      end
   end

   gameplayUI.stylesEditorUI.char:removeAccessories(attachments)
   if name == "Button1" then
      attachments[index][coordName][coord] = attachments[index][coordName][coord] - delta2
   elseif name == "Button2" then
      attachments[index][coordName][coord] = attachments[index][coordName][coord] - delta1
   elseif name == "Button3" then
      attachments[index][coordName][coord] = attachments[index][coordName][coord] + delta1
   elseif name == "Button4" then
      attachments[index][coordName][coord] = attachments[index][coordName][coord] + delta2
   end
   gameplayUI.stylesEditorUI.char:setupAccessories(attachments)
   gameplayUI.stylesEditorUI:saveStyle()
   self:setup(self.meshName)
   gameplayUI.stylesEditorUI.popupMenu.wnd:setVisible(false)
end

return CAttachmentConfigUI
