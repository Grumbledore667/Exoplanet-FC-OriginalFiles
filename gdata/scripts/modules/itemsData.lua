local Appearance = (require "appearance")

local ItemsInfo = require "itemsData_generated"

local ItemsDecompose =
{
   ["beacon.itm"] = {"beacon_base.itm", "beacon_leaf.itm", "beacon_light.wpn"},
   ["alien_cactus_bat.wpn"] = {"firewood.itm", "firewood.itm"},
   ["wooden_bat.wpn"] = {"firewood.itm"},
}

local ItemsCompose =
{
   { item = "beacon.itm", recipe = { ["beacon_base.itm"] = 1, ["beacon_leaf.itm"] = 1, ["beacon_light.wpn"] = 1} },
   { item = "antigravium_bait.itm", recipe = { ["antigravium.itm"] = 1, ["melon.itm"] = 1 } },
   { item = "joint.itm", recipe = { ["bluethorn_leaf.itm"] = 3 } },
   { item = "pure_water_bottle.itm", recipe = { ["dirty_water_bottle.itm"] = 1, ["bluethorn_leaf.itm"] = 3 } },
   { item = "turret.itm", recipe = { ["beacon_base.itm"] = 1, ["camera_basic.itm"] = 1, ["turret_ammo_box.itm"] = 1 } },
   -- { item = "turret.itm", recipe = { ["beacon_base.itm"] = 1, ["camera_strong.itm"] = 1, ["turret_ammo_box.itm"] = 1 } },
   { item = "energy_fence.itm", recipe = { ["beacon_base.itm"] = 1, ["scrap_electric.itm"] = 1, ["scrap_mechanical.itm"] = 1 } },
   { item = "bug_chipped.itm", recipe = { ["bug.itm"] = 1, ["neurochip.itm"] = 1 } },
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
         hitEffect = { name = "flareFire", label = "Flare fire",
                       changeStats = { health = -60}, duration = 10, removeOnDeath = false,
                       particles = {
                       {name = "flare_hit_black.sps", bones = { "Spine", "Bone002" }, offset = "impactPos"},
                       {name = "flare_hit_red.sps", bones = { "Spine", "Bone002" }, offset = "impactPos"},
                       {name = "flare_hit_sparks.sps", bones = { "Spine", "Bone002" }, offset = "impactPos"},
                       {name = "omni", light = {color = {r=0.9,g=0.3,b=0.3}, radius = 3500, intensity = 2}, bones = { "Spine", "Bone002" }, offset = "impactPos"}
                     }

         },
      }
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

   ["bug_green.itm"] =
   {
      class  = "CBugItem",
      params = { imposters = { hand = "greenbug.cfg", handClass = "CBugGreen", control = "greenbug.pfg", holster = "" } },
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
         hitEffect = {name = "cactusPoison", label = "Cactus poison", changeStats = {health = -30}, duration = 5, refresh = true},
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
         hitEffect = {  name = "scampShock", label = "Electric shock",
                        changeStats = {health = -10}, duration = 20, refresh = true,
                        particles = {  {name = "electro_touch.sps", bones = { "Spine", "Bone002" } }
                     },
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

local api = {}

function api.getItemsInfo(itemName)
   return ItemsInfo[itemName]
end

function api.hasItemsInfo(itemName)
   return api.getItemsInfo(itemName) ~= nil
end

function api.isCorrectItemName(itemName)
   if string.find(itemName, "%.gun") == nil and string.find(itemName, "%.wpn") == nil and string.find(itemName, "%.itm") == nil then
      return false
   end
   return true
end

function api.getItemClass( itemName )
   local className = "CItem"

   if (string.find(itemName, "%.gun") ~= nil) then
      className = "CGun"
   end

   if (string.find(itemName, "%.wpn") ~= nil) then
      className = "CWeapon"
   end

   if ( ItemsClasses[itemName] ~= nil ) then
      className = ItemsClasses[itemName]
   end

   if ( className.class ) then
      className = className.class
   end

   --log ( itemName .. " className is " .. className )

   return className
end

function api.getItemClassParams( itemName )
   local classParams = nil

   if ( ItemsClasses[itemName] and ItemsClasses[itemName].params ) then
      classParams = ItemsClasses[itemName].params
   end

   return classParams
end

function api.isItemAlive( itemName )
   if ( not itemName ) then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.alive
end

function api.hasItemColliderOffset( itemName )
   if ( not itemName or itemName == "") then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.colliderOffset
end

function api.getItemColliderRadius( itemName )
   if ( not itemName or itemName == "") then
      return nil
   end

   local info = ItemsInfo[itemName]

   if info then
      return info.colliderRadius
   else
      return nil
   end
end

function api.getItemColliderLength( itemName )
   if ( not itemName or itemName == "") then
      return nil
   end

   local info = ItemsInfo[itemName]

   if info then
      return info.colliderLength
   else
      return nil
   end
end

function api.getItemLabel( itemName )
   if ( not itemName ) then
      return ""
   end

   local info = ItemsInfo[itemName]

   if ( info ) then
      return info.label.eng
   end

   return ""
end

function api.getItemIcon( itemName )
   if not itemName then return "" end

   local info = ItemsInfo[itemName]

   if info then
      return info.icon or ""
   end
end

function api.getItemDesc( itemName )
   if ( not itemName ) then
      return ""
   end

   local info = ItemsInfo[itemName]

   if ( info ) then
      return info.desc.eng
   end

   return ""
end

function api.getItemValue( itemName )
   if ( not itemName ) then
      return ""
   end

   local info = ItemsInfo[itemName]

   if ( info ) then
      return info.value
   end

   return nil
end

function api.isItemCookable( itemName )
   if ( not itemName ) then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.cookInfo
end

function api.getItemCookInfo( itemName )
   if ( not itemName ) then
      return nil
   end

   if ( ItemsInfo[itemName] ) then
      return ItemsInfo[itemName].cookInfo
   else
      return nil
   end
end

function api.getItemModel( itemName )
   if ( not itemName ) then
      return nil
   end

   if ( ItemsInfo[itemName] ) then
      return ItemsInfo[itemName].model
   else
      return nil
   end
end

function api.getItemTexture( itemName )
   if ( not itemName ) then
      return nil
   end

   if ( ItemsInfo[itemName] ) then
      return ItemsInfo[itemName].texture
   else
      return nil
   end
end

function api.isItemConsumable( itemName )
   return itemName and ItemsInfo[itemName] and ItemsInfo[itemName].consumableType
end

function api.isItemFood( itemName )
   return itemName and ItemsInfo[itemName] and ItemsInfo[itemName].consumableType == "food"
end

function api.isItemDrink( itemName )
   return itemName and ItemsInfo[itemName] and ItemsInfo[itemName].consumableType == "drink"
end

function api.isItemSmokable( itemName )
   return itemName and ItemsInfo[itemName] and ItemsInfo[itemName].consumableType == "smokable"
end

function api.isItemBandage( itemName )
   return itemName and ItemsInfo[itemName] and ItemsInfo[itemName].consumableType == "bandage"
end

function api.isItemInjector( itemName )
   return itemName and ItemsInfo[itemName] and ItemsInfo[itemName].consumableType == "injector"
end

function api.isItemMoney( itemName )
   if ( not itemName ) then
      return false
   end

   return itemName == "antigravium_shards.itm"
end

function api.isItemPermaBuff( itemName )
   if ( not itemName ) then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.permaBuffInfo
end

function api.isItemUsable( itemName )
   if ( not itemName ) then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.usable
end

function api.isItemMessage( itemName )
   if ( not itemName ) then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.message
end

function api.isItemDrawing( itemName )
   if ( not itemName ) then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.drawing
end

function api.isItemMap( itemName )
   if ( not itemName ) then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.invCategory == "map"
end

function api.getItemFoodInfo( itemName )
   if ( not itemName ) then
      return nil
   end

   if ( ItemsInfo[itemName] ) then
      return ItemsInfo[itemName].foodInfo
   else
      return nil
   end
end

function api.getItemPermaBuffInfo( itemName )
   if ( not itemName ) then
      return nil
   end

   if ( ItemsInfo[itemName] ) then
      return ItemsInfo[itemName].permaBuffInfo
   else
      return nil
   end
end

function api.getItemArmor( itemName )
   if ( not itemName ) then
      return nil
   end

   if ( ItemsInfo[itemName] ) then
      return ItemsInfo[itemName].armor
   else
      return nil
   end
end

function api.getItemDmgPerEnergy( itemName )
   if ( not itemName ) then
      return nil
   end

   if ( ItemsClasses[itemName] ) then
      return ItemsClasses[itemName].dmgPerEnergy
   else
      return nil
   end
end

function api.getItemAttachments( itemName )
   if ( not itemName ) then
      return nil
   end

   if ( ItemsInfo[itemName] ) then
      return ItemsInfo[itemName].attachments
   else
      return nil
   end
end

function api.getItemSounds( itemName )
   if ( not itemName ) then
      return nil
   end

   if ( ItemsInfo[itemName] ) then
      return ItemsInfo[itemName].sounds
   else
      return nil
   end
end

function api.getItemAnimations( itemName )
   if ( not itemName ) then
      return nil
   end

   if ( ItemsInfo[itemName] ) then
      return ItemsInfo[itemName].animations
   else
      return nil
   end
end

function api.getItemReloadAnimations( itemName )
   if ( not itemName ) then
      return nil
   end

   if ( ItemsInfo[itemName] ) then
      return ItemsInfo[itemName].reloadAnimations
   else
      return nil
   end
end

function api.getItemHitEffect( itemName )
   if ( not itemName ) then
      return nil
   end

   if ( ItemsClasses[itemName] ) then
      return ItemsClasses[itemName].params.hitEffect
   else
      return nil
   end
end

function api.getItemUseEffects( itemName )
   if ( not itemName ) then
      return nil
   end

   if ( ItemsInfo[itemName] ) then
      return ItemsInfo[itemName].useEffects
   else
      return nil
   end
end

function api.getItemDamage( itemName )
   if ( not itemName ) then
      return 0
   end

   if ( ItemsInfo[itemName] and ItemsInfo[itemName].damage ~= nil ) then
      return ItemsInfo[itemName].damage
   else
      return 0
   end
end

function api.getItemCooldown( itemName )
   if ( not itemName ) then
      return 0
   end

   if ( ItemsInfo[itemName] and ItemsInfo[itemName].cooldown ~= nil ) then
      return ItemsInfo[itemName].cooldown
   else
      return 0
   end
end

function api.getItemMessage( itemName )
   if ( not itemName ) then
      return nil
   end

   if ( ItemsInfo[itemName] ) then
      return ItemsInfo[itemName].message
   else
      return nil
   end
end

function api.isItemAttire( itemName )
   if not api.isItemEquipable(itemName) then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.attireType
end

function api.getAttireType( itemName )
   if ( not itemName ) then
      return nil
   end

   if ( ItemsInfo[itemName] ) then
      return ItemsInfo[itemName].attireType
   else
      return nil
   end
end

function api.getAttireMeshes( itemName )
   if ( not itemName ) then
      return nil
   end

   if ( ItemsInfo[itemName] ) then
      return ItemsInfo[itemName].meshes
   else
      return nil
   end
end

function api.isItemEquipable( itemName )
   if ( not itemName ) then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.equipable
end

function api.isItemArmor( itemName )
   if not api.isItemEquipable(itemName) then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.armor
end

function api.isItemAccessory( itemName )
   if not api.isItemEquipable(itemName) then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and (info.attireType == "mask" or info.attireType == "eyewear" or info.attireType == "hat")
end

function api.getCreateModel( itemName )
   if ( not itemName ) then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.createModel
end

function api.isItemBooze( itemName )
   if ( not itemName ) then
      return false
   end

   local info = ItemsInfo[itemName]

   return info and info.boozeInfo
end

function api.getBoozeStrength( itemName )
   if ( not itemName ) then
      return false
   end

   local info = ItemsInfo[itemName]

   return info.boozeInfo
end

function api.getItemInvCategory( itemName )
   if ( not itemName ) then
      return false
   end

   if ( ItemsInfo[itemName] ) then
      return ItemsInfo[itemName].invCategory
   else
      return nil
   end
end

function api.getItemWeaponType( itemName )
   if ( not itemName ) then
      return false
   end

   if ( ItemsInfo[itemName] ) then
      return ItemsInfo[itemName].weaponType
   else
      return nil
   end
end

function api.isItemQuestItem( itemName )
   if ( not itemName ) then
      return nil
   end

   if ( ItemsInfo[itemName] ) then
      if ItemsInfo[itemName].questItem then
         return true
      else
         return false
      end
   else
      return nil
   end
end

api.ItemsInfo      = ItemsInfo
api.ItemsDecompose = ItemsDecompose
api.ItemsCompose   = ItemsCompose
api.ItemsClasses   = ItemsClasses

return api
