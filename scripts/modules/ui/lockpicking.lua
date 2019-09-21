local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"
local MiscLabels = require "miscLabels"
local animMgr = CEGUI.AnimationManager:getSingleton()

local CBaseModule = require "ui.baseModule"

---@class CLockpickingUI : CBaseModule
local CLockpickingUI = oo.class({
   layoutName = "lockpicking.layout",
   initAsInteractive = true,
   initPlayerControlled = true,
}, CBaseModule)

--Methods
function CLockpickingUI:init()
   CBaseModule.init(self)

   self.lockTypeLabel = self.wnd:getChild("LockTypeLabel")
   self.lockpicksLabel = self.wnd:getChild("LockpicksLabel")
   self.lockPointsLabel = self.wnd:getChild("LockPoints/Label")
   self.lockPointsBar = self.wnd:getChild("LockPoints/Bar")
   self.depletionBar = self.lockPointsBar:getChild("DepletionBar")
   self.pickLockButton = self.wnd:getChild("PickLockButton")

   self.showDepletionBar = false
   self.depletionAnimation = animMgr:instantiateAnimation("GenericBlinking")
   self.depletionAnimation:setTargetWindow(self.depletionBar)

   GUIUtils.widgetSubscribeEventProtected(self.pickLockButton, "MouseClick", partial(self.onPickLockClicked, self))
   GUIUtils.widgetSubscribeEventProtected(self.pickLockButton, "MouseEntersArea", partial(self.onPickLockEnter, self))
   GUIUtils.widgetSubscribeEventProtected(self.pickLockButton, "MouseLeavesArea", partial(self.onPickLockLeave, self))
   GUIUtils.widgetSubscribeEventProtected(self.wnd:getChild("CancelButton"), "MouseClick", partial(self.onCancelClicked, self))
end

function CLockpickingUI:show(state)
   CBaseModule.show(self, state)

   if state then
      self:setup()
   end
end

function CLockpickingUI:setup()
   local obj = getPlayer():getBBVar("interactObject")
   if not obj then return end

   local lockPoints = obj:getLockPoints()
   local lockInitialPoints = obj:getLockInitialPoints()

   self.playerLockpickItem = self:getPlayerLockpickItem()

   local lockType = string.gsub(obj:getLockType(), "^.", string.upper)
   local lockLevel = MiscLabels.getLabel("lock" .. obj:getLockLevel())
   self.lockTypeLabel:setText(string.format("%s Lock (%s)", lockType, lockLevel))

   self.lockPointsLabel:setText(string.format("%d/%d", lockPoints, lockInitialPoints))

   local lockpicksCount = self.playerLockpickItem and self.playerLockpickItem:getCount() or 0
   self.lockpicksLabel:setText("Lockpicks: " .. lockpicksCount)

   --Set bar size
   local width = self.lockPointsBar:getWidth()
   width.scale = lockPoints / lockInitialPoints
   self.lockPointsBar:setWidth(width)

   self.pickLockButton:setProperty("Disabled", tostring(lockpicksCount <= 0))

   self:updateDepletionBar()
end

function CLockpickingUI:onHide()
   CBaseModule.onHide(self)

   getPlayer():interactStop()
end

function CLockpickingUI:updateDepletionBar()
   --Calculate depletion from next lockpick use
   if self.playerLockpickItem and self.showDepletionBar then
      local obj = getPlayer():getBBVar("interactObject")
      local lockPoints = obj:getLockPoints()
      local damage = self.playerLockpickItem:getDamage()
      local pos = self.depletionBar:getXPosition()
      pos.scale = (lockPoints - damage) / lockPoints
      self.depletionBar:setXPosition(pos)

      local width = self.depletionBar:getWidth()
      width.scale = damage / lockPoints
      self.depletionBar:setWidth(width)
      self.depletionBar:setVisible(true)
      self.depletionAnimation:start()
   else
      self.depletionBar:setVisible(false)
      self.depletionAnimation:stop()
   end
end

function CLockpickingUI:onPickLockClicked(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local obj = getPlayer():getBBVar("interactObject")
   if click_args.button == CEGUI.LeftButton and obj then
      obj:pickLock(self:getPlayerLockpickItem(), getPlayer())
      self:setup()
   end
end

function CLockpickingUI:onPickLockEnter(args)
   self.showDepletionBar = true
   self:updateDepletionBar(true)
end

function CLockpickingUI:onPickLockLeave(args)
   self.showDepletionBar = false
   self:updateDepletionBar(false)
end

function CLockpickingUI:onCancelClicked(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      self:show(false)
   end
end

function CLockpickingUI:getPlayerLockpickItem()
   local obj = getPlayer():getBBVar("interactObject")
   local lockType = obj:getLockType()
   local itemName = string.format("%s%s%s", "lockpick_", lockType, ".itm")
   local item = getPlayer().inventory:getItemByName(itemName)
   return item
end

return CLockpickingUI
