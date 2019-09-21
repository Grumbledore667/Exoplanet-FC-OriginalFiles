local ItemsInfo = require "itemsData_generated"
local ItemsLists = require "itemsLists"
local TemplateInfo = require "itemsTemplates"
local stringx = require "pl.stringx"
local tablex = require "pl.tablex"

--Quality is an integer from 1 to 4 - the bigger the better
local ItemQualityBonuses =
{
   valueMul       = { 0.6, 1, 1.4, 3 },
   damageMul      = { 0.8, 1, 1.2, 1.5 },
   accuracyFlat   = { -0.015, 0, 0.005, 0.01 },
   bulletSpeedMul = { 0.9, 1, 1.1, 1.2 },
   cooldownMul    = { 1.1, 1, 0.9, 0.8 },
}

local DefaultQuality = {
   ["CItem"]       = 2,
   ["CWeapon"]     = 1,
   ["CGun"]        = 1,
   ["CGunShock"]   = 1,
   ["CGunFlare"]   = 1,
   ["CHandToHand"] = 2,
   ["CStrangeDetector"] = 2,
   ["CItemContainer"] = 2,
}

local ItemsClasses =
{
   ["energy_fence.itm"]     = "CInstallation",
   ["beacon.itm"      ]     = "CInstallation",
   ["turret.itm"      ]     = "CInstallation",
   ["firewood.itm"    ]     = "CInstallation",

   ["flaregun.gun"] =
   {
      class  = "CGunFlare",
      params =
      {
         ammo = {"flare_ammo.itm",},
         magazineMax = 1,
         bullet = "flaregun_glare",
         flash = "flash_flaregun",
         traceFX = {"flare_bullet_black.sps", "flare_bullet_red.sps", "flare_bullet_sparks.sps"},
         light = {color = {r=0.9,g=0.3,b=0.3}, radius = 3500, intensity = 2},
         accuracy = 0.99,
         bulletsInShot = 1,
         bulletSpeed = 7000,
         hitEffects = {
            { name = "flareFire", damageType = "fire",
              changeStats = {health = -60}, duration = 10, removeOnDeath = false,
              particles = {
              {name = "flare_hit_black.sps", bones = { "Spine", "Bone002" }, offset = "impactPos"},
              {name = "flare_hit_red.sps", bones = { "Spine", "Bone002" }, offset = "impactPos"},
              {name = "flare_hit_sparks.sps", bones = { "Spine", "Bone002" }, offset = "impactPos"},
              {name = "omni", light = {color = {r=0.9,g=0.3,b=0.3}, radius = 3500, intensity = 2}, bones = { "Spine", "Bone002" }, offset = "impactPos"}
            }
         }

         },
      }
   },

   ["strange_detector.itm"] =
   {
      class  = "CStrangeDetector",
   },

   ["carry_lunchbox.itm"] =
   {
      class  = "CItemContainer",
   },

   ["energy_boots.itm"] =
   {
      class  = "CEnergyBoots",
      params = { jumpStrength = 500, jumpEnergyCost = 70, fallEnergyCost = 20, fallDamageBlockMul = 0.5, },
   },

   ["energy_shield_1.itm"] =
   {
      class  = "CEnergyShield",
      params = { dmgPerEnergy = 1 },
   },

   ["bug.itm"] =
   {
      class  = "CBugItem",
      params = { imposters = { hand = "killerbug.cfg", handClass = "CBug", control = "killerbug.pfg", holster = "" } },
   },

   ["bug_chipped.itm"] =
   {
      class  = "CBugItem",
      params = { imposters = { hand = "killerbug.cfg", handClass = "CBug", control = "killerbug.pfg", holster = "" } },
   },

   ["hand_to_hand.wpn"] =
   {
      class  = "CHandToHand",
   },

   ["beacon_light.wpn"] =
   {
      class  = "CWeapon",
      params =
      {
         lights =
         {
            { pos = {x=0,y=65,z=0}, color = {r=0.8,g=0.9,b=1}, radius = 2000, intensity = 0.6 },
         }
      }
   },

   ["alien_cactus_bat.wpn"] =
   {
      class  = "CWeapon",
      params =
      {
         hitEffects = {{name = "cactusPoison", damageType = "poison", changeStats = {health = -30}, duration = 5, refresh = true}},
      }
   },

   ["revolver.gun"] =
   {
      class  = "CGun",
      params =
      {
         ammo = {"revolver_ammo.itm",},
         magazineMax = 6,
         bullet = "bullet",
         flash = "flash_revolver",
         impactFX = {"impact1.sps", "impact2.sps"},
         accuracy = 0.98,
         bulletsInShot = 1,
         bulletSpeed = 30000,
      }
   },
   ["scamp_22.gun"] =
   {
      class  = "CGun",
      params =
      {
         ammo = {"22_ammo.itm",},
         magazineMax = 10,
         bullet = "bullet",
         flash = "flash_pistol",
         impactFX = {"impact1.sps", "impact2.sps"},
         accuracy = 0.975,
         bulletSpeed = 18000,
      }
   },
   ["scamp_22_shock.gun"] =
   {
      class  = "CGunShock",
      params =
      {
         energyCost = 50,
         bullet = "bullet",
         flash = "flash_pistol",
         impactFX = {"impact1.sps", "impact2.sps"},
         accuracy = 0.95,
         bulletSpeed = 10000,
         hitEffects = {
            { name = "scampShock", damageType = "energy",
               changeStats = {health = -10}, duration = 20, refresh = true,
               sounds = {{name = "Play_scamp_22_shock_discharge", distance = 1500}},
               particles = {  {name = "electro_touch.sps", bones = { "Spine", "Bone002" } } },
            }
         },
      }
   },
   ["abori_gun_pistol.gun"] =
   {
      class  = "CGun",
      params =
      {
         ammo = {"revolver_ammo.itm",},
         magazineMax = 8,
         bullet = "bullet",
         flash = "flash_pistol",
         impactFX = {"impact1.sps", "impact2.sps"},
         accuracy = 0.98,
         bulletsInShot = 1,
         bulletSpeed = 9000,
      }
   },
   ["abori_gun_rifle.gun"] =
   {
      class  = "CGun",
      params =
      {
         ammo = {"revolver_ammo.itm",},
         magazineMax = 4,
         bullet = "bullet",
         flash = "flash_pistol",
         impactFX = {"impact1.sps", "impact2.sps"},
         accuracy = 0.99,
         bulletsInShot = 1,
         bulletSpeed = 20000,
      }
   },
   ["abori_gun_mortar.gun"] =
   {
      class  = "CGun",
      params =
      {
         ammo = {"revolver_ammo.itm",},
         magazineMax = 2,
         bullet = "bullet",
         flash = "flash_pistol",
         impactFX = {"impact1.sps", "impact2.sps"},
         accuracy = 0.95,
         bulletsInShot = 1,
         bulletSpeed = 500,
      }
   },
   ["shotgun.gun"] =
   {
      class  = "CGun",
      params =
      {
         ammo = {"shotgun_ammo.itm",},
         magazineMax = 6,
         bullet = "bullet",
         flash = "flash_shotgun",
         impactFX = {"impact1.sps", "impact2.sps"},
         accuracy = 0.95,
         bulletsInShot = 10,
         bulletSpeed = 20000,
      }
   },
   ["howdah.gun"] =
   {
      class  = "CGun",
      params =
      {
         ammo = {"howdah_ammo.itm",},
         magazineMax = 1,
         bullet = "bullet",
         flash = "flash_shotgun",
         impactFX = {"impact1.sps", "impact2.sps"},
         accuracy = 0.95,
         bulletsInShot = 4,
         bulletSpeed = 20000,
      }
   },
   ["carbine.gun"] =
   {
      class  = "CGun",
      params =
      {
         ammo = {"revolver_ammo.itm",},
         magazineMax = 10,
         bullet = "bullet",
         accuracy = 0.99,
         flash = "flash_carbine",
         impactFX = {"impact1.sps", "impact2.sps"},
         bulletsInShot = 1,
         bulletSpeed = 20000,
      }
   },
   ["kabarog_hsg.gun"] =
   {
      class  = "CGun",
      params =
      {
         ammo = {"howdah_ammo.itm",},
         magazineMax = 6,
         bullet = "bullet",
         flash = "flash_shotgun",
         impactFX = {"impact1.sps", "impact2.sps"},
         accuracy = 0.95,
         bulletsInShot = 24,
         bulletSpeed = 20000,
      }
   },
}

---@type ItemsData
local api = {}

local ERROR_BAD_TEMPLATE_ITEM_NAME = "ERROR: template '%s' points to an invalid item '%s'"

function api.validateItemsTemplates()
   for templateName, template in pairs(TemplateInfo) do
      if not api.getItemsInfo(template.itemName) then
         log(string.format(ERROR_BAD_TEMPLATE_ITEM_NAME, templateName, tostring(template.itemName)))
      end
   end
end

function api.getItemsInfo(itemName)
   return ItemsInfo[itemName]
end

function api.hasItemsInfo(itemName)
   return api.getItemsInfo(itemName) ~= nil
end

function api.isCorrectItemName(itemName)
   if string.find(itemName, "%.tmpl") == nil and string.find(itemName, "%.gun") == nil and string.find(itemName, "%.wpn") == nil and string.find(itemName, "%.itm") == nil then
      return false
   end
   return true
end

function api.getItemClass(itemName)
   local className = "CItem"

   if api.isItemRangedWeapon(itemName) then
      className = "CGun"
   elseif api.isItemMeleeWeapon(itemName) then
      className = "CWeapon"
   end

   if ItemsClasses[itemName] ~= nil then
      className = ItemsClasses[itemName]
   end

   if className.class then
      className = className.class
   end

   --log (itemName .. " className is " .. className)

   return className
end

function api.isItemTemplate(itemName)
   return string.find(itemName, "%.tmpl") ~= nil
end

function api.isItemItem(itemName)
   return string.find(itemName, "%.itm") ~= nil
end

function api.isItemMeleeWeapon(itemName)
   return string.find(itemName, "%.wpn") ~= nil
end

function api.isItemRangedWeapon(itemName)
   return string.find(itemName, "%.gun") ~= nil
end

function api.isItemWeapon(itemName)
   return api.isItemMeleeWeapon(itemName) or api.isItemRangedWeapon(itemName)
end

function api.getItemClassParams(itemName)
   local classParams = nil

   if ItemsClasses[itemName] and ItemsClasses[itemName].params then
      classParams = ItemsClasses[itemName].params
   end

   return classParams
end

function api.getItemMovementRestriction(itemName)
   if not itemName or itemName == "" then return end
   local info = ItemsInfo[itemName]
   return info and info.movementRestriction
end

function api.getContainerCode(itemName)
   if not itemName or itemName == "" then return end
   local info = ItemsInfo[itemName]
   return info and info.containerCode
end

function api.getContainedItems(itemName)
   if not itemName or itemName == "" then return end
   local info = ItemsInfo[itemName]
   return info and info.containedItems
end

function api.isItemAlive(itemName)
   if not itemName then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.limitCategory == "alive"
end

function api.hasItemColliderOffset(itemName)
   if not itemName or itemName == "" then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.colliderOffset
end

function api.getItemColliderRadius(itemName)
   if not itemName or itemName == "" then
      return nil
   end

   local info = ItemsInfo[itemName]

   if info then
      return info.colliderRadius
   else
      return nil
   end
end

function api.getItemColliderLength(itemName)
   if not itemName or itemName == "" then
      return nil
   end

   local info = ItemsInfo[itemName]

   if info then
      return info.colliderLength
   else
      return nil
   end
end

function api.getItemLabel(itemName)
   if not itemName then
      return ""
   end

   local info = ItemsInfo[itemName]

   if info then
      return info.label.eng
   end

   return ""
end

function api.getAmmoCaliber(itemName)
   if not itemName then return end

   local label = api.getItemLabel(itemName)
   if label then
      return stringx.partition(label," ")
   end
end

function api.getItemIcon(itemName)
   if not itemName then return "" end

   local info = ItemsInfo[itemName]

   if info then
      return info.icon or ""
   end
end

function api.getItemDesc(itemName)
   if not itemName then
      return ""
   end

   local info = ItemsInfo[itemName]

   if info then
      return info.desc.eng
   end

   return ""
end

function api.getItemValue(itemName, qualityInt)
   if not itemName then return nil end
   local info = ItemsInfo[itemName]
   if info and info.value then
      local val = info.value
      qualityInt = qualityInt or 2
      return math.ceil(val * api.getItemQualityBonus("valueMul", qualityInt))
   end
end

function api.isItemStackable(itemName)
   if not itemName then return false end
   local info = ItemsInfo[itemName]
   return info and not api.isItemWeapon(itemName) and not api.isItemAttire(itemName) and not api.isItemAccessory(itemName)
end

function api.isItemCookable(itemName)
   if not itemName then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.cookInfo
end

function api.getItemCookInfo(itemName)
   if not itemName then return nil end
   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].cookInfo
   else
      return nil
   end
end

function api.getRealItemName(name)
   local template = api.getItemTemplate(name)
   return (template and template.itemName) or name
end

function api.getItemModel(itemName)
   if not itemName then return nil end
   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].model or getKeyByValue(ItemsLists.modelsList, itemName)
   else
      return nil
   end
end

function api.getItemConsumeModel(itemName)
   if not itemName then return nil end
   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].consumeModel
   else
      return nil
   end
end

function api.getItemTexture(itemName)
   if not itemName then return nil end
   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].texture
   else
      return nil
   end
end

function api.isItemConsumable(itemName)
   return itemName and ItemsInfo[itemName] and ItemsInfo[itemName].consumableType
end

function api.isItemFood(itemName)
   return itemName and ItemsInfo[itemName] and ItemsInfo[itemName].consumableType == "food"
end

function api.isItemDrink(itemName)
   return itemName and ItemsInfo[itemName] and ItemsInfo[itemName].consumableType == "drink"
end

function api.isItemSmokable(itemName)
   return itemName and ItemsInfo[itemName] and ItemsInfo[itemName].consumableType == "smokable"
end

function api.isItemBandage(itemName)
   return itemName and ItemsInfo[itemName] and ItemsInfo[itemName].consumableType == "bandage"
end

function api.isItemInjector(itemName)
   return itemName and ItemsInfo[itemName] and ItemsInfo[itemName].consumableType == "injector"
end

function api.isItemMoney(itemName)
   if not itemName then
      return false
   end

   return itemName == "antigravium_shards.itm"
end

function api.isItemPermaBuff(itemName)
   if not itemName then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.permaBuffInfo
end

function api.isItemUsable(itemName)
   if not itemName then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.usable
end

function api.isItemMessage(itemName)
   if not itemName then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.message
end

function api.canReadItemMessage(itemName)
   if not itemName then return false end

   local info = ItemsInfo[itemName]

   return info and not info.message.abori
end

function api.isItemContainer(itemName)
   if not itemName then return false end
   local info = ItemsInfo[itemName]
   return info and info.containedItems ~= nil
end

function api.isItemDrawing(itemName)
   if not itemName then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.drawing
end

function api.isItemMap(itemName)
   if not itemName then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.invCategory == "map"
end

function api.isItemFaceCover(itemName)
   if not itemName then return false end
   return ItemsInfo[itemName] and ItemsInfo[itemName].isFaceCover == true
end

function api.getItemTemplate(templateName)
   if not templateName then return nil end
   return TemplateInfo[templateName]
end

function api.getItemFoodInfo(itemName)
   if not itemName then
      return nil
   end

   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].foodInfo
   else
      return nil
   end
end

function api.getItemPermaBuffInfo(itemName)
   if not itemName then
      return nil
   end

   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].permaBuffInfo
   else
      return nil
   end
end

function api.getItemArmor(itemName)
   if not itemName then
      return nil
   end

   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].armor
   else
      return nil
   end
end

function api.getItemAccuracy(itemName)
   if not itemName then return nil end

   if ItemsClasses[itemName] and ItemsClasses[itemName].params then
      return ItemsClasses[itemName].params.accuracy
   else
      return nil
   end
end

function api.isItemEnergy(itemName)
   if not itemName then return nil end

   if ItemsClasses[itemName] and ItemsClasses[itemName].params then
      return ItemsClasses[itemName].params.energyCost ~= nil
   else
      return nil
   end
end

function api.getItemEnergyCost(itemName)
   if not itemName then return nil end

   if ItemsClasses[itemName] and ItemsClasses[itemName].params then
      return ItemsClasses[itemName].params.energyCost
   else
      return nil
   end
end

function api.getItemMagazineMax(itemName)
   if not itemName then return nil end

   if ItemsClasses[itemName] and ItemsClasses[itemName].params then
      return ItemsClasses[itemName].params.magazineMax
   else
      return nil
   end
end

function api.getItemCompatibleAmmo(itemName)
   if not itemName then return nil end

   if ItemsClasses[itemName] and ItemsClasses[itemName].params then
      return tablex.deepcopy(ItemsClasses[itemName].params.ammo)
   else
      return nil
   end
end

function api.getItemDmgPerEnergy(itemName)
   if not itemName then
      return nil
   end

   if ItemsClasses[itemName] then
      return ItemsClasses[itemName].dmgPerEnergy
   else
      return nil
   end
end

function api.getItemAttachInfo(itemName)
   if not itemName then return nil end

   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].attachInfo
   else
      return nil
   end
end

function api.getItemAttachments(itemName)
   if not itemName then
      return nil
   end

   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].attachments
   else
      return nil
   end
end

function api.getItemSounds(itemName)
   if itemName and ItemsInfo[itemName] then
      return ItemsInfo[itemName].sounds or {}
   else
      return {}
   end
end

function api.getItemAnimations(itemName)
   if not itemName then
      return nil
   end

   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].animations
   else
      return nil
   end
end

function api.getItemReloadAnimations(itemName)
   if not itemName then
      return nil
   end

   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].reloadAnimations
   else
      return nil
   end
end

function api.getItemHitEffects(itemName)
   if not itemName then return nil end

   if ItemsClasses[itemName] and ItemsClasses[itemName].params then
      return ItemsClasses[itemName].params.hitEffects
   else
      return nil
   end
end

function api.getItemConsumeInfo(itemName)
   if not itemName then
      return nil
   end

   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].useEffects
   else
      return nil
   end
end

function api.getItemDamage(itemName, qualityInt)
   if not itemName then return 0 end

   if ItemsInfo[itemName] and ItemsInfo[itemName].damage ~= nil then
      qualityInt = qualityInt or 2
      return math.ceil(ItemsInfo[itemName].damage * api.getItemQualityBonus("damageMul", qualityInt))
   else
      return 0
   end
end

function api.getItemLockDamage(itemName, qualityInt)
   if not itemName then return 0 end

   if ItemsInfo[itemName] and ItemsInfo[itemName].lockDamage ~= nil then
      qualityInt = qualityInt or 2
      return math.ceil(ItemsInfo[itemName].lockDamage * api.getItemQualityBonus("damageMul", qualityInt))
   else
      return 0
   end
end

function api.getItemBulletsInShot(itemName)
   if not itemName then return nil end

   if ItemsClasses[itemName] and ItemsClasses[itemName].params then
      return ItemsClasses[itemName].params.bulletsInShot
   else
      return nil
   end
end

function api.getItemDefaultQuality(itemName)
   local className = api.getItemClass(itemName)
   return DefaultQuality[className] or 2
end

function api.getItemQualityBonus(bonusType, qualityInt)
   if not bonusType or not qualityInt then return end
   return ItemQualityBonuses[bonusType][qualityInt]
end

function api.getItemCooldown(itemName, qualityInt)
   if not itemName then return 0 end

   if ItemsInfo[itemName] and ItemsInfo[itemName].cooldown ~= nil then
      qualityInt = qualityInt or 2
      return round(ItemsInfo[itemName].cooldown * api.getItemQualityBonus("cooldownMul", qualityInt), 2)
   else
      return 0
   end
end

function api.getItemMessage(itemName)
   if not itemName then
      return nil
   end

   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].message
   else
      return nil
   end
end

function api.getItemDrawing(itemName)
   if not itemName then return nil end

   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].drawing
   end
   return nil
end

function api.isItemAttire(itemName)
   if not api.isItemEquipable(itemName) then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.attireType
end

function api.getAttireType(itemName)
   if not itemName then
      return nil
   end

   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].attireType
   else
      return nil
   end
end

function api.getAttireMeshes(itemName)
   if not itemName then
      return nil
   end

   if ItemsInfo[itemName] and ItemsInfo[itemName].meshes then
      return getWords(ItemsInfo[itemName].meshes)
   else
      return nil
   end
end

function api.isItemEquipable(itemName)
   if not itemName then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.equipable
end

function api.isItemArmor(itemName)
   if not api.isItemEquipable(itemName) then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.armor
end

function api.isItemAccessory(itemName)
   if not api.isItemEquipable(itemName) then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and (info.attireType == "mask" or info.attireType == "eyewear" or info.attireType == "hat")
end

function api.getCreateModel(itemName)
   if not itemName then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.createModel
end

function api.isItemBooze(itemName)
   if not itemName then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.boozeInfo
end

function api.getBoozeStrength(itemName)
   if not itemName then
      return false
   end

   local info = ItemsInfo[itemName]

   return info.boozeInfo
end

function api.getItemLimitCategory(itemName)
   if not itemName then return nil end
   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].limitCategory
   else
      return nil
   end
end

function api.getItemInvCategory(itemName)
   if not itemName then
      return false
   end

   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].invCategory
   else
      return nil
   end
end

function api.getItemWeaponType(itemName)
   if not itemName then
      return false
   end

   if ItemsInfo[itemName] then
      return ItemsInfo[itemName].weaponType
   else
      return nil
   end
end

function api.isItemQuestItem(itemName)
   if not itemName then
      return nil
   end

   if ItemsInfo[itemName] then
      if ItemsInfo[itemName].questItem then
         return true
      else
         return false
      end
   else
      return nil
   end
end

function api.isItemKey(itemName)
   if not itemName then return false end

   return api.getItemInvCategory(itemName) == "key"
end

api.ItemsInfo          = ItemsInfo
api.ItemsClasses       = ItemsClasses
api.ItemQualityBonuses = ItemQualityBonuses

return api
