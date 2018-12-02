local oo = require "loop.simple"

local MiscLabels = require "miscLabels"
local ItemsData = require "itemsData"
local stringx = require "pl.stringx"
local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CItemInfoUI : CBaseModule
local CItemInfoUI = oo.class({
   layoutName = "item_info.layout",
}, CBaseModule)

--Internal
local function compareStat(stat1, stat2, text)
   if not stat1 or not stat2 or not text then return end
   local delta = stat2 - stat1
   if delta > 0 then
      text = string.format("%s%s(+%s)%s", text, gameplayUI.betterColorTag, tostring(delta), gameplayUI.whiteTag)
   elseif delta < 0 then
      text = string.format("%s%s(%s)%s", text, gameplayUI.worseColorTag, tostring(delta), gameplayUI.whiteTag)
   end
   return text
end

--Methods
function CItemInfoUI:init()
   CBaseModule.init(self)

   self.container = self.wnd:getChild("Container"):toVerticalLayoutContainer()
   self.name = self.wnd:getChild("Container/Name")

   self.stats = self.wnd:getChild("Container/Stats")
   self.stats:setMargin(CEGUI.UBox(CEGUI.UDim(0, 0), CEGUI.UDim(0.08, 0), CEGUI.UDim(0, 0), CEGUI.UDim(0.08, 0)))

   self.value = self.wnd:getChild("Container/Value")
   self.description = self.wnd:getChild("Container/Description")
   self.borders = {
      self.wnd:getChild("BorderLeft"),
      self.wnd:getChild("BorderRight"),
      self.wnd:getChild("Container/BorderTop"),
      self.wnd:getChild("Container/BorderBottom"),
      self.wnd:getChild("Container/BorderName"),
      self.wnd:getChild("Container/BorderDescription"),
   }
end

function CItemInfoUI:show(state, item)
   self.item = item
   CBaseModule.show(self, state)
end

function CItemInfoUI:onShow()
   self:setup()
end

function CItemInfoUI:onHide()
   self.item = nil
   self:showDescription(false)
end

function CItemInfoUI:setup()
   if not self.item then return end

   local item = self.item
   local qualityInt = item:getQuality()
   local qualityTag = ""
   self:setBorderColors(gameplayUI.qualityColors[qualityInt])
   qualityTag = gameplayUI.qualityTags[qualityInt]
   
   local labelText = string.format("%s%s%s", qualityTag, item:getLabel(), gameplayUI.whiteTag)
   self.name:setText(labelText)

   local player = getMC()
   local stats    = ""
   local equippedItem = player:getInventory():getSlotItem(item:getAttireType()) or player:getWeaponSlotItem()

   --TYPE
   if item:isWeapon() then
      local text = MiscLabels.getItemTypeLabel(item:getAnimations())
      if text then
         stats = string.format("%sType: %s\n", stats, MiscLabels.getItemTypeLabel(item:getAnimations()))
      end
   else
      local text = MiscLabels.getItemTypeLabel(item:getInvCategory())
      if text then
         stats = string.format("%sType: %s\n", stats, MiscLabels.getItemTypeLabel(item:getInvCategory()))
      end
   end

   --QUALITY
   if item:isWeapon() then
      stats = string.format("%sQuality: %s%s%s\n", stats, qualityTag, MiscLabels.getItemQualityLabel(qualityInt), gameplayUI.whiteTag)
   end

   --DAMAGE
   local damage = item:getDamage()
   if damage > 0 then
      local totalDmg = damage * (item.bulletsInShot or 1)
      local bullets = item.getBulletsInShot and item:getBulletsInShot()
      local text = string.format("%s%s%d%s", "Damage: ", gameplayUI.damageColorTags.physical, totalDmg, gameplayUI.whiteTag)
      if bullets and bullets > 1 then
          text = string.format("%s%s(%dx%d)%s", text, gameplayUI.damageColorTags.physical, damage, bullets, gameplayUI.whiteTag)
      end
      if equippedItem then
         local totalEquippedDmg = equippedItem:getDamage() * (equippedItem.getBulletsInShot and equippedItem:getBulletsInShot() or 1)
         text = compareStat(totalEquippedDmg, totalDmg, text)
      end
      stats = string.format("%s%s\n", stats, text)
   end

   --HIT EFFECTS
   local hitEffects = item:getHitEffects()
   if hitEffects then
      for _, effect in ipairs(hitEffects) do
         stats = string.format("%s%s\\[%s\\]", stats, gameplayUI.damageColorTags[effect.damageType], MiscLabels.getLabel(effect.name))
         if effect.changeStats then
            for statName, value in pairs(effect.changeStats) do
               local dpsStr = " DPS "
               if value >= 0 then
                  dpsStr = ""
               end
               local dps = math.abs(value) / effect.duration
               stats = string.format("%s  %s %s %s for %d sec%s\n", stats, dps, MiscLabels.getBonusLabel(statName), dpsStr, effect.duration, gameplayUI.whiteTag)
            end
         end
      end
   end

   --ARMOR
   local armor = item:getArmor()
   if armor > 0 then
      local text = string.format("%s%s%d%s", "Armor: ", gameplayUI.damageColorTags.physical, armor, gameplayUI.whiteTag)
      if equippedItem then
         text = compareStat(equippedItem:getArmor(), armor, text)
      end
      stats = string.format("%s%s\n", stats, text)
   end

   --ENERGYSTUFF
   if item:getDmgPerEnergy() > 0 then
      local text = "Damage/Energy: " .. item:getDmgPerEnergy()
      if equippedItem then
         text = compareStat(equippedItem:getDmgPerEnergy(), item:getDmgPerEnergy(), text)
      end
      stats = string.format("%s%s\n", stats, text)
   end

   --ATTACK SPEED
   local function getAttackSpeed(item)
      if not item then return end
      local attackDuration = 0
      local attackAnim = player.animations.idle.attack[item:getAnimations()]
      if attackAnim then
         local anims
         if type(attackAnim) == "table" then
            anims = attackAnim
         else
            anims = stringx.split(attackAnim)
         end

         --Get duration of the whole attack sequence
         for _, anim in pairs(anims) do
            attackDuration = attackDuration + player:getAnimDuration(anim)
         end

         --Get average for weapons with random attacks
         if type(attackAnim) == "table" then
            attackDuration = attackDuration / #attackAnim
         end

         attackDuration = math.max(item:getCooldown(), attackDuration)
         return round(1 / attackDuration, 2)
      end
   end
   local attackSpeed = item:isWeapon() and getAttackSpeed(item)
   if attackSpeed then
      local text = string.format("Attack Rate: %s", tostring(attackSpeed))
      local equippedAttackSpeed = equippedItem and getAttackSpeed(equippedItem)
      if equippedAttackSpeed then
         text = compareStat(equippedAttackSpeed, attackSpeed, text)
      end
      stats = string.format("%s%s\n", stats, text)
   end

   --ACCURACY
   local accuracy = item.getAccuracy and item:getAccuracy()
   if accuracy then
      accuracy = (round(accuracy, 2) - 0.9) * 1000
      local text = string.format("Accuracy: %d", accuracy)
      if equippedItem and equippedItem.getAccuracy then
         local equippedAccuracy = (round(equippedItem:getAccuracy(), 2) - 0.9) * 1000
         text = compareStat(equippedAccuracy, accuracy, text)
      end
      stats = string.format("%s%s\n", stats, text)
   end

   --AMMO
   if item.getMagazine and not item:isEnergy() then
      local magazine = item:getMagazine()
      local magazineMax = item:getMagazineMax()
      local text = string.format("Mag: %d/%d", magazine, magazineMax)
      if equippedItem and equippedItem.getMagazineMax and not equippedItem:isEnergy() then
         local equippedmagazineMax = equippedItem:getMagazineMax()
         text = compareStat(equippedmagazineMax, magazineMax, text)
      end
      if item.getAvailableAmmoCount then
         text = string.format("%s   \\[%d\\]", text, item:getAvailableAmmoCount())
      end
      stats = string.format("%s%s\n", stats, text)
   end

   --AMMOTYPES
   if item.getCompatibleAmmo then
      local text = "Ammo type: "
      local ammoNames = item:getCompatibleAmmo()
      if not item:isEnergy() and ammoNames[1] then
         local caliber = ItemsData.getAmmoCaliber(ammoNames[1])
         if caliber then
            text = string.format("%s%s", text, caliber)
         end
      elseif item:isEnergy() then
         text = string.format("%s%s", text, "Energy")
      end
      stats = string.format("%s%s\n", stats, text)
   end

   --ENERGYCOST
   if item:isEnergy() then
      local energyCost = item:getEnergyCost()
      local text = string.format("Energy Cost: %d", energyCost)
      if equippedItem and equippedItem:isEnergy() then
         local equippedEnergyCost = equippedItem:getEnergyCost()
         text = compareStat(equippedEnergyCost, energyCost, text)
      end
      stats = string.format("%s%s\n", stats, text)
   end

   --CONSUMABLES
   if item:getRestoreHealth() ~= 0 then
      stats = string.format("%sRestores: %d health\n", stats, item:getRestoreHealth())
   end

   if item:getRestoreFood() ~= 0 then
      stats = string.format("%sRestores: %d kcal\n", stats, item:getRestoreFood())
   end
   if item:getRestoreWater() ~= 0 then
      stats = string.format("%sRestores: %d ml\n", stats, item:getRestoreWater())
   end

   --EFFECTS
   local permaBuffInfo = item:getPermaBuffInfo()
   if permaBuffInfo then
      if stats ~= "" then stats = string.format("%s\n", stats) end
      stats = string.format("%sPermanent Buffs:", stats)
      stats = string.format("%s%s", stats, gameplayUI:bonusTableToString(permaBuffInfo))
   end

   local effects = item:getConsumeInfo()
   if effects then
      if stats ~= "" then stats = string.format("%s\n", stats) end
      stats = string.format("%sEffects:\n", stats)
      for effectName, effect in pairs(effects) do
         if string.find(effectName, "Debuff") then
            stats = string.format("%s%s\\[%s\\]%s", stats, gameplayUI.worseColorTag, MiscLabels.getLabel(effectName), gameplayUI.whiteTag)
         else
            stats = string.format("%s%s\\[%s\\]%s", stats, gameplayUI.betterColorTag, MiscLabels.getLabel(effectName), gameplayUI.whiteTag)
         end
         stats = string.format("%s%s", stats, gameplayUI:bonusTableToString(effect.changeStats))
         stats = string.format("%s%s", stats, gameplayUI:bonusTableToString(effect.statBonuses))
         stats = string.format("%s\nDuration: %s\n", stats, effect.duration)
      end
   end

   self.stats:setText(stats)

   --VALUE
   local val = item:getValue()
   if gameplayUI.tradingUI:isVisible() and not item:isMoney() then
      if item:getOwner():getOwner() == player then
         local sellMul = getGlobalParam("sellingPriceMultiplier")
         local globalMul = getGlobalParam("sellToVendorMul")
         local personalMul = getGlobalParam(player.exchangeTarget:getName() .. "_sellToVendorMul") or 1
         val = math.ceil(val * sellMul * globalMul * personalMul)
      else
         local globalMul = getGlobalParam("buyFromVendorMul")
         local personalMul = getGlobalParam(player.exchangeTarget:getName() .. "_buyFromVendorMul") or 1
         val = math.ceil(val * globalMul * personalMul)
      end
   end
   if val then
      local valueTag = "[colour='FFDAA520']"
      local valueText = string.format("%sValue: %d", valueTag, val)
      self.value:setText(valueText)
   else
      self.value:setText("")
   end

   --Reset description to use later as a kind of minimal width
   self.description:setProperty("HorzFormatting", "CentreAligned")
   self.description:setText("Hold 'ALT' for description")

   self:adjustWnd()
   
   self:showDescription(stats:len() <= 30 or getButton("ALT"))
end

function CItemInfoUI:adjustWnd()
   local borderSize =  self.wnd:getChild("BorderLeft"):getPixelSize().width * 2
   --Set these subwindows according to their text extents (none of them have word wrap)
   self.name:setHeight(CEGUI.UDim(0, GUIUtils.getStaticTextOrLabelVertExtent(self.name)))
   self.stats:setHeight(CEGUI.UDim(0, GUIUtils.getStaticTextOrLabelVertExtent(self.stats)))
   self.value:setHeight(CEGUI.UDim(0, GUIUtils.getStaticTextOrLabelVertExtent(self.value)))

   local width = math.max(GUIUtils.getStaticTextOrLabelHorzExtent(self.stats),
                          GUIUtils.getStaticTextOrLabelHorzExtent(self.name),
                          GUIUtils.getStaticTextOrLabelHorzExtent(self.description)) + borderSize
   --Gets rid of continuous width increase of the container
   self.wnd:setWidth(CEGUI.UDim(0, width))

   --This (or the next frame) fucks up container's relative sizing
   self.container:layout()

   local rect = self.container:getUnclippedOuterRect():get()
   local pixelHeight = rect:getHeight()
   --Rect width plus the width of the vertical borders not included into vertical container
   local pixelWidth = rect:getWidth() + borderSize
   self.wnd:setSize(CEGUI.USize(CEGUI.UDim(0, pixelWidth), CEGUI.UDim(0, pixelHeight)))
end

function CItemInfoUI:showDescription(state)
   if state and self.item then
      self.description:setProperty("HorzFormatting", "WordWrapLeftAligned")
      self.description:setText(self.item:getDesc())
   elseif self.stats:getText():len() > 30 then
      self.description:setProperty("HorzFormatting", "CentreAligned")
      self.description:setText("Hold 'ALT' for description")
   end

   --Description does NOT dictate width and has word wrap - it should be adjusted after the main window
   self.description:setHeight(CEGUI.UDim(0, GUIUtils.getStaticTextOrLabelVertExtent(self.description)))
   self.container:layout()
   local rect = self.container:getUnclippedOuterRect():get()
   local pixelHeight = rect:getHeight()
   self.wnd:setHeight(CEGUI.UDim(0, pixelHeight))
end

function CItemInfoUI:setPosition(mousePos)
   local wndSize = self.wnd:getPixelSize()
   local descHeight = self.description:getHeight().offset

   local xoff = mousePos.x - wndSize.width - 15
   local yoff = mousePos.y - (wndSize.height - descHeight)/2
   local pos = CEGUI.UVector2(CEGUI.UDim(0,xoff), CEGUI.UDim(0,yoff))

   if pos.x.offset < 0 then
      pos.x.offset = xoff + wndSize.width + 45
   end

   gameplayUI:retainPositionInsideDisplay(pos, self.wnd)
end

function CItemInfoUI:setBorderColors(color)
   for _, wnd in pairs(self.borders) do
      wnd:setProperty("ImageColours", color)
   end
end

return CItemInfoUI
