local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial
local tablex = require "pl.tablex"

local ItemsData = require "itemsData"
local GUIUtils = require "ui.utils"
local ImmersiveUI = require "ui.immersiveUI"

local CDamageIndicator = require "ui.damageIndicator"

local CBaseModule = require "ui.baseModule"

---@class CHudUI : CBaseModule
local CHudUI = oo.class({
   initVisible = true,
}, CBaseModule)

--Methods
function CHudUI:init()
   --Layout loading is done in gui.lua OnInit
   self.wnd = gameplayUI.wndGameplay

   CBaseModule.init(self)

   self.fpsText  = {wnd = self.wnd:getChild("FPSText"), timer = nil}
   self.fpsText.wnd:setVisible(false)
   if isDebug() or isEditor() then
      self:showFPS(true)
   end

   self.aim = {wnd = self.wnd:getChild("Cursor")}

   self.status  = {wnd = self.wnd:getChild("Status")}
   self.health  = {wnd = self.wnd:getChild("Status/Health")}
   self.energy  = {wnd = self.wnd:getChild("Status/Energy")}
   self.stamina = {wnd = self.wnd:getChild("Status/Stamina")}
   self.statUpdateList = {"health", "stamina", "energy"}
   --Updated through ui.character.updatePlayerStat

   self.weapon = {wnd = self.wnd:getChild("Weapon")}
   self.weapon.item            = self.weapon.wnd:getChild("Item")
   self.weapon.weaponStatus    = self.weapon.wnd:getChild("WeaponStatus")
   self.weapon.itemType        = self.weapon.weaponStatus:getChild("ItemType")
   self.weapon.ammoCount       = self.weapon.weaponStatus:getChild("AmmoCount")

   self.focus = {currentObj = nil, label = nil, updateTimer = nil, interactLabelTime = nil}
   self.focus.label = self.wnd:getChild("FocusLabel")
   self.focus.label:setVisible(false)
   self.focus.interactLabel = self.wnd:getChild("InteractLabel")
   self.focus.interactLabel:setVisible(false)

   GUIUtils.widgetSubscribeEventProtected(self.focus.label, "RenderingStarted", partial(self.updateFocusUI, self))
   GUIUtils.widgetSubscribeEventProtected(self.focus.label, "Updated", function()
      self.focus.label:invalidate(false)
   end)

   self.enemyStatus = {wnd = nil, label = nil, health = nil, shield = nil, char = nil}
   self.enemyStatus.wnd = self.wnd:getChild("EnemyStatus")
   self.enemyStatus.wnd:setVisible(false)

   self.enemyStatus.label  = self.wnd:getChild("EnemyStatus/Label")
   self.enemyStatus.health = self.wnd:getChild("EnemyStatus/HealthWindow")
   self.enemyStatus.shield = self.wnd:getChild("EnemyStatus/ShieldWindow")
   self.enemyStatus.shield:setVisible(false)

   getScene():subscribeOnLocationEnter(function()
      local player = getMC()
      if player then player:getInventory():subscribeOnChange(partial(self.updateWeaponUI, self)) end
   end)

   CEGUI.ImageManager:getSingleton():addFromImageFile(CDamageIndicator.image, CDamageIndicator.image)
   self.damageIndicatorLayout = CEGUI.WindowManager:getSingleton():loadLayoutFromFile("damageIndicator.layout")
   self.damageIndicatorInstances = {}
end

function CHudUI:setupDamageIndicator(impactor)
   local ID = 0
   for instance in pairs(self.damageIndicatorInstances) do
      if impactor == instance.impactor then --Update position and
         instance:destroy()
      else
         if instance.ID > ID then ID = instance.ID end
      end
   end
   ID = ID + 1
   local newInstance = CDamageIndicator({windowName = "DamageIndicator" .. ID, impactor = impactor, ID = ID})
   self.damageIndicatorInstances[newInstance] = true
   newInstance:init()
end

function CHudUI:updateFocusUI()
   local lbl = self.focus.label
   local intlbl = self.focus.interactLabel
   local obj = self.focus.currentObj
   if obj and not getGlobalParam("inScene") then
      if obj.getLabel then
         local txt = obj:getLabel()
         lbl:setText(txt)
      end
      local pos = obj:getPose():getPos()
      pos.y = pos.y + 100
      if obj.getLabelPos then
         pos = obj:getLabelPos()
      end
      local p = projectPointToScreen(pos)
      p.y = 1 - p.y
      local x, y = p.x, p.y
      x = math.min(math.max(0.02, x), 0.98)
      y = math.min(math.max(0.01, y), 0.97)
      lbl:setPosition(CEGUI.UVector2(CEGUI.UDim(x - 0.5, 0), CEGUI.UDim(y, 0)))

      if getGameTime() - self.focus.interactLabelTime >= 4 and obj.getInteractLabel and not obj.OnDie then
         local label = obj:getInteractLabel()
         if label then
            intlbl:setVisible(true)
            intlbl:setPosition(CEGUI.UVector2(CEGUI.UDim(x - 0.5, 0), CEGUI.UDim(y, lbl:getFont():getFontHeight())))
            intlbl:setText(string.format("'%s' to %s", getButtonCurrentKeyName("ACTIVATE"), label))
         end
      end
   else
      lbl:setVisible(false)
   end
end

function CHudUI:updatePlayerStats()
   local player = getPlayer()
   for _,statName in pairs(self.statUpdateList) do
      self[statName].wnd:setWidth(CEGUI.UDim(clamp(player:getStatPercent(statName)/100, 0, 1), 0))
      ImmersiveUI.triggerUI("playerStatus")
   end
end

function CHudUI:updateWeaponUI(event)
   local player = getMC()
   local currentWeapon = player:getWeaponSlotItem()
   if currentWeapon then
      local icon = ItemsData.getItemIcon(currentWeapon:getItemName())
      self.weapon.item:setProperty("Image", "gameplay/" .. icon)
      if (event.item == currentWeapon and currentWeapon:isRangedWeapon())
         or (currentWeapon:isRangedWeapon() and currentWeapon:isAmmoCompatible(event.item:getItemName())) then
         if currentWeapon:isRangedWeapon() then
            local ammoText
            if currentWeapon:getWeaponType() == "energy" then
               self.weapon.itemType:setProperty("Image", "gameplay/EffectGunElectric")
               ammoText = tostring(currentWeapon:getAmmoCount())
            else
               self.weapon.itemType:setProperty("Image", "gameplay/EffectGunDefault")
               local ammoCount = currentWeapon:getAmmoCount()
               ammoText = string.format("%d/%d", ammoCount, math.max(currentWeapon:getAvailableAmmoCount() - ammoCount, 0))
            end
            self.weapon.ammoCount:setText(ammoText)
         end
      end
   end
   if not currentWeapon or currentWeapon and currentWeapon:isMeleeWeapon() then
      self.weapon.ammoCount:setText("")
      self.weapon.itemType:setProperty("Image", "gameplay/EffectWeaponDefault")
      if not currentWeapon then
         self.weapon.item:setProperty("Image", "gameplay/Empty")
      end
   end
end

function CHudUI:showEnemyCursor(state)
   if state then
      self.aim.wnd:setProperty("Image", "gameplay/CursorRed")
   else
      self.aim.wnd:setProperty("Image", "gameplay/Cursor")
   end
end

function CHudUI:showEnemyStatus(char)
   if getGlobalParam("inScene") or getMC():getState("talk") then return end
   self.enemyStatus.wnd:setVisible(true)
   self.enemyStatus.char = char
   self.enemyStatus.label:setText(char:getLabel())
   self:setEnemyHealth(char)

   if char:hasShield() then
      self:setEnemyShield(char)
      self.enemyStatus.shield:setVisible(true)
   else
      self.enemyStatus.shield:setVisible(false)
   end
   ImmersiveUI.triggerUI("enemyStatus")
end

function CHudUI:setEnemyHealth(char)
   local bar = self.enemyStatus.health:getChild("Health")
   local size = bar:getSize()
   size.width.scale = char:getStatPercent("health") / 100
   bar:setSize(size)
end

function CHudUI:setEnemyShield(char)
   local bar = self.enemyStatus.shield:getChild("Shield")
   local size = bar:getSize()
   size.width.scale = char:getStatPercent("energy") / 100
   bar:setSize(size)
end


function CHudUI:showFPS(state)
   self.fpsText.wnd:setVisible(state)
   if state then
      self.fpsText.timer = runTimer(0.5, self, self.updateFPS, true)
   else
      if self.fpsText.timer then
         self.fpsText.timer:stop()
         self.fpsText.timer = nil
      end
   end
end

function CHudUI:isFPSVisible()
   return self.fpsText.wnd:isVisible()
end

function CHudUI:updateFPS()
   local player = getMC()
   local x, y, z = 0, 0, 0
   if player then
      local pos = player:getPose():getPos()
      x, y, z = pos.x, pos.y, pos.z
   end
   local text = string.format("FPS: %d, X:%d, Y:%d, Z:%d", getFrameRate(), x, y, z)

   local rigid = raycastRigidOnScreen({x=0.5,y=0.5})
   if rigid then
      local name = rigid:getName()
      if name == "" then
         name = "(unmanaged)"
      end
      text = string.format("%s, %s", text, tostring(name))
   end

   self.fpsText.wnd:setText(text)
end

return CHudUI
