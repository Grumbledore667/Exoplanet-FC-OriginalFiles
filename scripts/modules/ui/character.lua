local oo = require "loop.simple"

local wndMgr
local tablex = require "pl.tablex"
local f = require "fun"
local partial = f.partial
local hlp = require "helpers"

local CInventoryBaseUI = require "ui.inventoryBaseUI"
local GUIUtils = require "ui.utils"
local ImmersiveUI = require "ui.immersiveUI"

local CBaseModule = require "ui.baseModule"

---@class CCharacterUI : CBaseModule
local CCharacterUI = oo.class({
   layoutName = "characterWindow.layout",
   initAsInteractive = true,
   initPlayerControlled = true,
}, CBaseModule)

--Methods
function CCharacterUI:init()
   CBaseModule.init(self)

   wndMgr = CEGUI.WindowManager:getSingleton()

   self.slots = {}
   self.slotNames = {"top", "bottom", "hat", "eyewear", "mask", "slot1", "slot3", "slot4", "slot5", "slot6", "gadget"}

   self.statistics = {
      wnd = nil,
      level = nil, experience = nil, attackType = nil, physicalDamage = nil, armor = nil,
      attributePoints = nil, food = nil, water = nil, sleep = nil,
      health = nil, stamina = nil, energy = nil,
      upgrades = {
         health  = {button = nil, highlight = nil},
         stamina = {button = nil, highlight = nil},
         energy  = {button = nil, highlight = nil},
      },
   }

   self.statUpdateList = {"health", "stamina", "energy", "armor", "food", "water", "sleep"}

   for _, slotName in pairs(self.slotNames) do
      self:addCharacterSlot(slotName)
   end

   self.statistics.wnd = self.wnd:getChild("Statistics")
   self.statistics.level = self.statistics.wnd:getChild("Level/Label")
   self.statistics.experience = self.statistics.wnd:getChild("Level/Experience/Value")
   self.statistics.attributePoints = self.statistics.wnd:getChild("Level/Attribute/Value")

   self.statistics.health = self.statistics.wnd:getChild("Physique/Health/Value")
   self.statistics.stamina = self.statistics.wnd:getChild("Physique/Stamina/Value")
   self.statistics.energy = self.statistics.wnd:getChild("Physique/Energy/Value")
   self.statistics.upgrades.health.button = self.statistics.wnd:getChild("Physique/Health/healthMaxUpgrade")
   self.statistics.upgrades.health.highlight = self.statistics.wnd:getChild("Physique/Health/Highlight")
   self.statistics.upgrades.stamina.button = self.statistics.wnd:getChild("Physique/Stamina/staminaMaxUpgrade")
   self.statistics.upgrades.stamina.highlight = self.statistics.wnd:getChild("Physique/Stamina/Highlight")
   self.statistics.upgrades.energy.button = self.statistics.wnd:getChild("Physique/Energy/energyMaxUpgrade")
   self.statistics.upgrades.energy.highlight = self.statistics.wnd:getChild("Physique/Energy/Highlight")
   GUIUtils.widgetSubscribeEventProtected(self.statistics.upgrades.health.button, "MouseClick", partial(self.onStatUpgrade, self))
   GUIUtils.widgetSubscribeEventProtected(self.statistics.upgrades.stamina.button, "MouseClick", partial(self.onStatUpgrade, self))
   GUIUtils.widgetSubscribeEventProtected(self.statistics.upgrades.energy.button, "MouseClick", partial(self.onStatUpgrade, self))

   self.statistics.food  = self.statistics.wnd:getChild("Needs/Food/Value")
   self.statistics.water = self.statistics.wnd:getChild("Needs/Water/Value")
   self.statistics.sleep = self.statistics.wnd:getChild("Needs/Sleep/Value")

   self.statistics.attackType     = self.statistics.wnd:getChild("Combat/AttackType/Value")
   self.statistics.physicalDamage = self.statistics.wnd:getChild("Combat/Damage/Value")
   self.statistics.armor          = self.statistics.wnd:getChild("Combat/Armor/Value")

   --Effects
   self.characterEffects = {wnd = nil, showHidden = nil, effectsTable = {}}
   self.characterEffects.wnd = wndMgr:loadLayoutFromFile("characterEffects.layout")
   gameplayUI.wndGameplay:addChild(self.characterEffects.wnd)
   self.characterEffects.wnd:setVisible(false)

   --sleep/hunger/water/upgrade notifications
   self.statNotificationsWnd = nil
   self.statNotificationsAnim = nil
   self.statNotifications = {food = nil, water = nil, sleep = nil, attributePoints = nil}
   self.statNotificationsWnd = wndMgr:loadLayoutFromFile("statistics_notifications.layout")
   gameplayUI.wndGameplay:addChild(self.statNotificationsWnd)

   self.statNotifications.food  = self.statNotificationsWnd:getChild("Food")
   self.statNotifications.water = self.statNotificationsWnd:getChild("Water")
   self.statNotifications.sleep = self.statNotificationsWnd:getChild("Sleep")
   self.statNotifications.attributePoints = self.statNotificationsWnd:getChild("LevelUp")

   CEGUI.AnimationManager:getSingleton():loadAnimationsFromXML("statNotifications.xml")
   self.statNotificationsAnim = CEGUI.AnimationManager:getSingleton():instantiateAnimation("StatNotificationsLoop")
   self.statNotificationsAnim:setTargetWindow(self.statNotificationsWnd)

   self:initEffectInfo()

   getScene():subscribeOnLocationEnter(function()
      local player = getMC()
      if player then player:getInventory():subscribeOnChange(partial(self.updateStatisticsCombat, self)) end
   end)
end

function CCharacterUI:addCharacterSlot(slotName)
   local parent = self.wnd:getChild("Slots/" .. slotName)
   local slot = wndMgr:loadLayoutFromFile("inventory_slot.layout")
   slot:setName(slotName)
   parent:addChild(slot)

   slot:setWidth(CEGUI.UDim(1,0))

   local newSlot = {}
   newSlot.slot     = slot:getChild("DragContainer")
   newSlot.image    = slot:getChild("DragContainer/ItemImage")
   newSlot.equipped = slot:getChild("DragContainer/ItemImage/Equipped")
   newSlot.selected = slot:getChild("DragContainer/ItemImage/Selected")
   newSlot.counter  = slot:getChild("DragContainer/ItemImage/Counter")
   newSlot.quality  = slot:getChild("DragContainer/ItemImage/Quality")

   newSlot.counter:setText("")

   newSlot.slot:setUserString("inventoryName", self.wnd:getName())
   newSlot.slot:setUserString("slotID", slotName)

   GUIUtils.widgetSubscribeEventProtected(newSlot.slot, "DragStarted", CInventoryBaseUI.onSlotDragStarted)
   GUIUtils.widgetSubscribeEventProtected(newSlot.slot, "DragDropItemDropped", partial(self.onDragAndDropCharacterSlot, self))
   GUIUtils.widgetSubscribeEventProtected(newSlot.slot, "MouseClick", partial(self.onCharacterSlotClick, self))
   GUIUtils.widgetSubscribeEventProtected(newSlot.slot, "MouseMove", partial(self.onCharacterSlotMouseMove, self))
   GUIUtils.widgetSubscribeEventProtected(newSlot.slot, "MouseEntersArea", partial(self.onCharacterSlotOver, self))
   GUIUtils.widgetSubscribeEventProtected(newSlot.slot, "MouseLeavesArea", partial(self.onCharacterSlotLeave, self))

   self.slots[slotName] = newSlot
   return newSlot
end

function CCharacterUI:onShow()
   CBaseModule.onShow(self)

   self.characterEffects.wnd:setVisible(true)
   self:setup()
   self.onInventoryChangeCallback = getMC():getInventory():subscribeOnChange(partial(self.setup, self))
end

function CCharacterUI:onHide()
   CBaseModule.onHide(self)

   gameplayUI.gameplayMenuUI:onHideTab("Inventory")
   gameplayUI.inventoryPlayer:show(false)
   self.characterEffects.wnd:setVisible(false)
   getMC():getInventory():unsubscribeOnChange(self.onInventoryChangeCallback)
end

function CCharacterUI:setup()
   self:updateAllPlayerEffectsUI()
   local player = getMC()
   local pInventory = player:getInventory()
   local slots = pInventory:getSlots()

   local weapon = player:getWeaponSlotItem()
   for _, slotName in pairs(self.slotNames) do
      if self.slots[slotName] then
         local slotID = slotName
         if slotID:find("slot") then
            slotID = slotID:gsub("slot", "")
            slotID = tonumber(slotID)
         end
         if slots[slotID] or pInventory.fastAccessSlots[slotID] then
            local item = slots[slotID] or pInventory.fastAccessSlots[slotID]
            self.slots[slotName].image:setProperty("Image", "gameplay/"..item.icon)
            self.slots[slotName].slot:setUserString("itemID", tostring(item.id))
            if slotID ~= 1 and weapon == item then
               self.slots[slotName].image:setAlpha(0.4)
            else
               self.slots[slotName].image:setAlpha(1)
            end
            self.slots[slotName].slot:setProperty("DraggingEnabled", "true")
            self.slots[slotName].quality:setProperty("Image", "gameplay/QualityMark" .. item:getQuality())
         else
            self.slots[slotName].image:setProperty  ("Image", "")
            self.slots[slotName].quality:setProperty("Image", "")
            self.slots[slotName].slot:setProperty("DraggingEnabled", "false")
            self.slots[slotName].slot:setUserString("ItemID", "")
         end
      end
   end
end

function CCharacterUI:setStatUpgradeButtonsDisabled(state)
   self.statistics.upgrades.health.button:setProperty("Disabled", tostring(state))
   self.statistics.upgrades.stamina.button:setProperty("Disabled", tostring(state))
   self.statistics.upgrades.energy.button:setProperty("Disabled", tostring(state))
end

function CCharacterUI:highlightUpgradeButtons(state)
   self.statistics.upgrades.health.highlight:setVisible(state)
   self.statistics.upgrades.stamina.highlight:setVisible(state)
   self.statistics.upgrades.energy.highlight:setVisible(state)
end

function CCharacterUI:adjustNotificationPositions()
   local id = 0
   for _,wnd in pairs(self.statNotifications) do
      if wnd:isVisible() then
         id = id + 1
         wnd:setYPosition(CEGUI.UDim((id-1)*0.25, (id-1)))
      end
   end
end

function CCharacterUI:showStatisticsNotification(statName, state)
   if state then
      self.statNotifications[statName]:setVisible(true)
      if not self.statNotificationsAnim:isRunning() then
         self.statNotificationsAnim:start()
      end
   else
      self.statNotifications[statName]:setVisible(false)
      local stopAnim = true
      for _,wnd in pairs(self.statNotifications) do
         if wnd:isVisible() then
            stopAnim = false
         end
      end
      if stopAnim then
         self.statNotificationsAnim:stop()
      end
   end
end

--Update
function CCharacterUI:updateStatisticsLevel()
   local lvl = "Level " .. getMC().level
   self.statistics.level:setText(lvl)
   self:updateStatisticsAttributePoints()
end

function CCharacterUI:updateStatisticsAttributePoints()
   local points = getMC().attributePoints
   self.statistics.attributePoints:setText(points)
   if points > 0 then
      self:showStatisticsNotification("attributePoints", true)
   else
      self:showStatisticsNotification("attributePoints", false)
   end
end

function CCharacterUI:updateStatisticsCombat(event)
   if event.eventType == "ItemEquipped" or event.eventType == "ItemUnequipped" then
      local weapon = getMC():getWeaponSlotItem()
      if weapon then
         if weapon:isMeleeWeapon() then
            self.statistics.attackType:setText("Melee")
         elseif weapon:isRangedWeapon() then
            self.statistics.attackType:setText("Ranged")
         else
            self.statistics.attackType:setText("None")
            self.statistics.physicalDamage:setText("0")
         end

         if weapon:isWeapon() then
            self.statistics.physicalDamage:setText(tostring(weapon:getDamage()))
         end
      else
         self.statistics.attackType:setText("None")
         self.statistics.physicalDamage:setText("0")
      end
   end
end

function CCharacterUI:updateStatisticsExperience()
   local text = getMC().experience.current .. "/" .. getMC().experience.max
   self.statistics.experience:setText(text)
end

function CCharacterUI:updatePlayerStats()
   local player = getMC()
   for _,statName in pairs(self.statUpdateList) do
      local current = player:getStatCount(statName)
      local max = player:getStatMax(statName)
      if max then
         self:setPlayerStatValue(statName, current, max)
      else
         self.statistics[statName]:setText(current)
      end
   end
end

function CCharacterUI:setPlayerStatValue(statName, current, max)
   local text     = ""
   local color    = "[colour='ffec260c']"
   local percents = round(current / max * 100)

   if percents >= 75 then
      color = "[colour='ffffffff']"
   elseif percents >= 50 then
      color = "[colour='fff2ee8c']"
   elseif percents >= 25 then
      color = "[colour='fff4c034']"
   end

   text = text .. color
   text = text .. round(current) .. "/" .. max
   text = text .. " (" .. percents .. "%)"

   self.statistics[statName]:setText(text)

   if self.statNotifications[statName] then
      if percents <= 25 and not self.statNotifications[statName]:isVisible() then
         self:showStatisticsNotification(statName, true)
         self:adjustNotificationPositions()
      elseif percents > 25 and self.statNotifications[statName]:isVisible() then
         self:showStatisticsNotification(statName, false)
         self:adjustNotificationPositions()
      end
   end
end

--Effects
function CCharacterUI:initEffectInfo()
   self.effectInfo = { wnd = nil, title = nil, stats = nil, }
   self.effectInfo.wnd = wndMgr:loadLayoutFromFile("effect_info.layout")
   gameplayUI.wndGameplay:addChild(self.effectInfo.wnd)

   self.effectInfo.title = self.effectInfo.wnd:getChild("Title")
   self.effectInfo.stats = self.effectInfo.wnd:getChild("Stats")
   self.effectInfo.wnd:setVisible(false)
end

function CCharacterUI:setupEffectInfo(effect, effectWnd)
   if not effect then return end

   self.effectInfo.wnd:setVisible(true)
   local label = string.format("%s (%s)", effect:getLabel(), effect:getStackCount())
   self.effectInfo.title:setText(label)

   local bonuses = effect:getAllStatBonuses()
   local changeStats = effect.params.changeStats
   local lines = 0

   local text = ""
   if tablex.size(changeStats) > 0 then
      text = text .. "Effects:"
      text = text .. gameplayUI:bonusTableToString(changeStats) .. "\n"
      lines = lines + 1
   end

   if tablex.size(bonuses) > 0 then
      if lines > 0 then text = text .. "\n" end
      text = text .. "Bonuses:"
      text = text .. gameplayUI:bonusTableToString(bonuses) .. "\n"
      lines = lines + 1
   end

   if effect.params.duration then
      if lines > 0 then text = text .. "\n" end
      text = text .. "Duration: " .. effect.params.duration
   end

   GUIUtils.adjustWindowForText(self.effectInfo.stats, text)
   local height = self.effectInfo.stats:getPixelSize().height + self.effectInfo.title:getPixelSize().height
   self.effectInfo.wnd:setHeight(CEGUI.UDim(0, height))
   self.effectInfo.stats:setText(text)

   local pos = effectWnd:getPixelPosition()
   pos = CEGUI.UVector2(CEGUI.UDim(0, pos.x), CEGUI.UDim(0, pos.y - height))
   gameplayUI:retainPositionInsideDisplay(pos, self.effectInfo.wnd)
end

function CCharacterUI:addEffectToUI(effect)
   local index = #self.characterEffects.effectsTable + 1
   local pos = (index - 1) * 0.1

   local effectWnd = wndMgr:createWindow("TaharezLook/Label", string.format("%s_%d", effect:getName(), effect.ID))
   effectWnd:setSize(CEGUI.USize(CEGUI.UDim(0.95,0), CEGUI.UDim(0.1,0)))
   effectWnd:setProperty("HorzFormatting", "LeftAligned")
   effectWnd:setProperty("MouseInputPropagationEnabled", "true")
   effectWnd:setProperty("Font", "dialog-8")
   effectWnd:setText(effect:getLabel())
   effectWnd:setPosition(CEGUI.UVector2(CEGUI.UDim(0.02,0), CEGUI.UDim(pos,0)))
   effectWnd:setUserString("effectID", effect.ID)
   effectWnd:setID(index)

   self.characterEffects.wnd:getChild("EffectsList"):addChild(effectWnd)

   local timeLeft = effect:getTimeLeft()
   if timeLeft then
      local durationWnd = wndMgr:createWindow("TaharezLook/Label", "Duration")
      durationWnd:setProperty("Area", "{{0.8,0},{0,0},{1,0},{1,0}}")
      durationWnd:setProperty("HorzFormatting", "RightAligned")
      durationWnd:setProperty("MouseInputPropagationEnabled", "true")
      durationWnd:setProperty("Font", "dialog-10")
      durationWnd:setText(round(timeLeft, 1))
      effectWnd:addChild(durationWnd)
   end

   GUIUtils.widgetSubscribeEventProtected(effectWnd, "MouseEntersArea", partial(self.onCharacterEffectMouseIn, self))
   GUIUtils.widgetSubscribeEventProtected(effectWnd, "MouseLeavesArea", partial(self.onCharacterEffectMouseOut, self))

   table.insert(self.characterEffects.effectsTable, effectWnd)
end

function CCharacterUI:removeEffectFromUI(effect)
   local effectWnd = self.characterEffects.wnd:getChild(string.format("%s%s_%d", "EffectsList/", effect:getName(), effect.ID))
   if effectWnd then
      table.remove(self.characterEffects.effectsTable, effectWnd:getID())
      wndMgr:destroyWindow(effectWnd)
      self:updateEffectsPositions()
   end
end

function CCharacterUI:updateAllPlayerEffectsUI()
   if self:isVisible() then
      for _, effectWnd in ipairs(self.characterEffects.effectsTable) do
         local effect = getMC().statusEffectsManager:getEffectByID(tonumber(effectWnd:getUserString("effectID")))
         if effect:getStackCount() > 1 then
            effectWnd:setText(string.format("%s (%d)", effect:getLabel(), effect:getStackCount()))
         else
            effectWnd:setText(effect:getLabel())
         end
         local timeLeft = effect:getTimeLeft()
         if timeLeft then
            effectWnd:getChild("Duration"):setText(round(timeLeft, 1))
         end
      end
   end
end

function CCharacterUI:updateEffectsPositions()
   for index,effectWnd in ipairs(self.characterEffects.effectsTable) do
      local pos = (index - 1) * 0.1
      effectWnd:setID(index)
      effectWnd:setPosition(CEGUI.UVector2(CEGUI.UDim(0.02,0), CEGUI.UDim(pos,0)))
   end
end

--Callbacks
function CCharacterUI:onCharacterEffectMouseIn(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local effect = getMC().statusEffectsManager:getEffectByID(click_args.window:getUserString("effectID"))
   self:setupEffectInfo(effect, click_args.window)
end

function CCharacterUI:onCharacterEffectMouseOut(args)
   if not CEGUI then return end
   self.effectInfo.wnd:setVisible(false)
end

function CCharacterUI:onCharacterSlotClick(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.RightButton then
      local player = getMC()
      local slotName = click_args.window:getParent():getName()
      local item = player:getInventory():getSlotItem(slotName)
      local slotId = click_args.window:getName():gsub("slot", "")
      item = item or player:getInventory():getSlotItem(tonumber(slotId))
      if item then
         gameplayUI.popupMenuUI:setup({["unequip"] = {func = player.unequipItem, args = {player, item}}})
      end
   end
end

function CCharacterUI:onCharacterSlotMouseMove(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local slotKey = GUIUtils.getWindowInventorySlotKey(click_args.window:getParent())
   local item = getMC():getInventory():getSlotItem(slotKey)
   if not item then return false end

   gameplayUI.itemInfoUI:setPosition(click_args.position)
end

function CCharacterUI:onCharacterSlotOver(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   local slotName = click_args.window:getParent():getName()
   local slotKey = GUIUtils.getWindowInventorySlotKey(click_args.window:getParent())

   self.slots[slotName].selected:setVisible(true)

   local item = getMC():getInventory():getSlotItem(slotKey)
   if not item then return end

   gameplayUI.itemInfoUI:show(true, item)
   self:onCharacterSlotMouseMove(args)
end

function CCharacterUI:onCharacterSlotLeave(args)
   if not CEGUI then return end
   local click_args = CEGUI.toMouseEventArgs(args)
   local slotName = click_args.window:getParent():getName()
   gameplayUI.itemInfoUI:show(false)
   self.slots[slotName].selected:setVisible(false)
end

function CCharacterUI:onStatUpgrade(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      getMC():upgradeStat(click_args.window:getName():gsub("Upgrade", ""))
      self:updateStatisticsAttributePoints()
   end
end

--Drag
function CCharacterUI:onDragAndDropCharacterSlot(args)
   local dd_args = CEGUI.toDragDropEventArgs(args)
   local player = getMC()
   local pInventory = player:getInventory()
   local sourceInventoryName = dd_args.dragDropItem:getUserString("inventoryName")
   if not sourceInventoryName then return end

   local slotKey = GUIUtils.getWindowInventorySlotKey(dd_args.window:getParent())

   local item
   if sourceInventoryName == "inventoryContainer" or sourceInventoryName == "inventoryTurret" then
      item = GUIUtils.getWindowItem(dd_args.dragDropItem, player:getTargetInventory())
      item = player:getTargetInventory():giveItemTo(item, player:getInventory(), item:getCount())
   else
      item = GUIUtils.getWindowItem(dd_args.dragDropItem, player.inventory)
   end

   if not item then return end

   if item:isAttire() then
      if item:getAttireType() == slotKey then
         pInventory:equipSlotWithItem(item:getAttireType(), item.id, false, false)
      end
   elseif item:isEquipable() and (item:getItemName() ~= "hand_to_hand.wpn" or slotKey == player:getWeaponSlot()) then
      if slotKey == 1 then
         player:useItem(item)

      elseif item:getFastAccessSlot() == slotKey then
         player:unequipItem(item)

      elseif item == player:getWeaponSlotItem() and item:getFastAccessSlot() ~= slotKey then
         pInventory:setItemToFastAccess(slotKey, item:getId())
         self:setup()

      elseif type(slotKey) == "number" then
         if pInventory:setItemToFastAccess(slotKey, item:getId()) then
            pInventory:equipSlotWithItem(slotKey, item:getId(), false, false)
         end
      end
   end
end


return CCharacterUI
