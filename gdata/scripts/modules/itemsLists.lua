local stringx = require "pl.stringx"

local itemsLists = {}

itemsLists.lootLists =
{
   ---------------------------------------------------
   ----------- Food ----------------------------------
   ---------------------------------------------------
   ["food_common_small"] = {
      ["meat.itm"] = 1,
      ["can_emulsia.itm"] = 1,
   },

   ["food_common_medium"] = {
      ["meat.itm"] = 2,
      ["can_emulsia.itm"] = 2,
   },

   ["food_common_large"] = {
      ["meat.itm"] = 3,
      ["can_emulsia.itm"] = 3,
      ["melon.itm"] = 1,
   },


   ["food_uncommon_small"] = {
      ["fried_bug.itm"] = 1,
      ["emulsia.itm"] = 1,
   },

   ["food_uncommon_medium"] = {
      ["fried_bug.itm"] = 2,
      ["emulsia.itm"] = 2,
   },

   ["food_uncommon_large"] = {
      ["fried_bug.itm"] = 3,
      ["emulsia.itm"] = 3,
      ["pure_water_bottle.itm"] = 1,
   },


   ["food_rare_small"] = {
      ["fried_meat.itm"] = 1,
      ["pure_water_bottle.itm"] = 1,
   },

   ["food_rare_medium"] = {
      ["fried_meat.itm"] = 2,
      ["pure_water_bottle.itm"] = 2,
   },

   ["food_rare_large"] = {
      ["fried_meat.itm"] = 3,
      ["pure_water_bottle.itm"] = 3,
      ["emulsia.itm"] = 1,
   },

   ---------------------------------------------------
   ----------- Ammo ----------------------------------
   ---------------------------------------------------
   ["ammo_common_small"] = {
      ["22_ammo.itm"] = 6,
      ["revolver_ammo.itm"] = 4,
   },

   ["ammo_common_medium"] = {
      ["22_ammo.itm"] = 12,
      ["revolver_ammo.itm"] = 8,
   },

   ["ammo_common_large"] = {
      ["22_ammo.itm"] = 24,
      ["revolver_ammo.itm"] = 16,
   },


   ["ammo_uncommon_small"] = {
      ["shotgun_ammo.itm"] = 3,
   },

   ["ammo_uncommon_medium"] = {
      ["shotgun_ammo.itm"] = 6,
   },

   ["ammo_uncommon_large"] = {
      ["shotgun_ammo.itm"] = 12,
   },


   ["ammo_rare_small"] = {
      ["howdah_ammo.itm"] = 2,
   },

   ["ammo_rare_medium"] = {
      ["howdah_ammo.itm"] = 4,
   },

   ["ammo_rare_large"] = {
      ["howdah_ammo.itm"] = 8,
   },

   ---------------------------------------------------
   ----------- Meds ----------------------------------
   ---------------------------------------------------
   ["meds_common_small"] = {
      ["bluethorn_leaf.itm"] = 1,
   },

   ["meds_common_medium"] = {
      ["bluethorn_leaf.itm"] = 2,
   },

   ["meds_common_large"] = {
      ["bluethorn_leaf.itm"] = 3,
   },


   ["meds_uncommon_small"] = {
      ["ktharsian_aloe.itm"] = 1,
   },

   ["meds_uncommon_medium"] = {
      ["ktharsian_aloe.itm"] = 2,
   },

   ["meds_uncommon_large"] = {
      ["ktharsian_aloe.itm"] = 3,
   },


   ["meds_rare_small"] = {
      ["blood_root.itm"] = 1,
   },

   ["meds_rare_medium"] = {
      ["blood_root.itm"] = 2,
   },

   ["meds_rare_large"] = {
      ["medkit.itm"] = 2,
   },

   ---------------------------------------------------
   ----------- Tech ----------------------------------
   ---------------------------------------------------
   ["tech_common_small"] = {
      ["scrap_electric.itm"] = 2,
      ["scrap_mechanical.itm"] = 3,
   },

   ["tech_common_medium"] = {
      ["scrap_electric.itm"] = 4,
      ["scrap_mechanical.itm"] = 6,
   },

   ["tech_common_large"] = {
      ["scrap_electric.itm"] = 8,
      ["scrap_mechanical.itm"] = 12,
   },


   ["tech_uncommon_small"] = {
      ["nanogreaze.itm"] = 4,
      ["power_cell.itm"] = 1,
   },

   ["tech_uncommon_medium"] = {
      ["nanogreaze.itm"] = 9,
      ["power_cell.itm"] = 2,
   },

   ["tech_uncommon_large"] = {
      ["nanogreaze.itm"] = 16,
      ["power_cell.itm"] = 3,
   },


   ["tech_rare_small"] = {
      ["beacon_base.itm"] = 1,
      ["beacon_leaf.itm"] = 1,
   },

   ["tech_rare_medium"] = {
      ["beacon_base.itm"] = 1,
      ["beacon_leaf.itm"] = 1,
      ["camera_basic.itm"] = 1,
   },

   ["tech_rare_large"] = {
      ["beacon_base.itm"] = 1,
      ["beacon_leaf.itm"] = 2,
      ["camera_strong.itm"] = 1,
   },

   ---------------------------------------------------
   ----------- Armor ---------------------------------
   ---------------------------------------------------
   ["armor_common_small"] =
   {["farmer_1_hat.itm"] = 1},

   ["armor_common_medium"] = {
      ["farmer_1_hat.itm"] = 1,
      ["worker_pants.itm"] = 1,
   },

   ["armor_common_large"] = {
      ["farmer_1_hat.itm"] = 1,
      ["worker_jacket.itm"] = 1,
      ["worker_pants.itm"] = 1,
   },


   ["armor_uncommon_small"] =
   {["hat_leather.itm"] = 1,
   },

   ["armor_uncommon_medium"] = {
      ["hat_leather.itm"          ] = 1,
      ["bounty_hunter_pants_1.itm"] = 1,
   },

   ["armor_uncommon_large"] = {
      ["bounty_hunter_jacket_1.itm"] = 1,
      ["bounty_hunter_pants_1.itm"]  = 1,
      ["hat_leather.itm"] = 1,
   },


   ["armor_rare_small"] = {
      ["bullet_hat.itm"] = 1,
   },

   ["armor_rare_medium"] = {
      ["bullet_hat.itm"] = 1,
      ["bounty_hunter_pants_3.itm"] = 1,
   },

   ["armor_rare_large"] = {
      ["bounty_hunter_jacket_3.itm"] = 1,
      ["bounty_hunter_pants_3"]      = 1,
      ["bullet_hat.itm"] = 1,
   },

   ---------------------------------------------------
   ----------- Weapons -------------------------------
   ---------------------------------------------------
   ["weapon_common_small"] = {
      ["axe.wpn"] = 1,
   },

   ["weapon_common_medium"] = {
      ["scamp_22.gun"] = 1,
   },

   ["weapon_common_large"] = {
      ["abori_gun_pistol.gun"] = 1,
   },


   ["weapon_uncommon_small"] = {
      ["revolver.gun"] = 1,
   },

   ["weapon_uncommon_medium"] = {
      ["shotgun.gun"] = 1,
   },

   ["weapon_uncommon_large"] = {
      ["howdah.gun"] = 1,
   },


   ["weapon_rare_small"] = {
      ["abori_gun_rifle.gun"] = 1,
   },

   ["weapon_rare_medium"] = {
      ["abori_gun_mortar.gun"] = 1,
   },

   ["weapon_rare_large"] = {
      ["kabarog_hsg.gun"] = 1,
   },

   ---------------------------------------------------
   ----------- Booze ---------------------------------
   ---------------------------------------------------
   ["booze_common_small"] = {
      ["booze.itm"] = 1,
      ["beer.itm"] = 1,
   },

   ["booze_common_medium"] = {
      ["booze.itm"] = 2,
      ["beer.itm"] = 2,
   },

   ["booze_common_large"] = {
      ["booze.itm"] = 3,
      ["beer.itm"] = 3,
   },


   ["booze_uncommon_small"] = {
      ["lager.itm"] = 1,
      ["porter.itm"] = 1,
   },

   ["booze_uncommon_medium"] = {
      ["lager.itm"] = 2,
      ["porter.itm"] = 2,
   },

   ["booze_uncommon_large"] = {
      ["lager.itm"] = 3,
      ["porter.itm"] = 3,
   },


   ["booze_rare_small"] = {
      ["absinthe.itm"] = 1,
      ["whiskey.itm"] = 1,
   },

   ["booze_rare_medium"] = {
      ["absinthe.itm"] = 2,
      ["whiskey.itm"] = 2,
   },

   ["booze_rare_large"] = {
      ["absinthe.itm"] = 3,
      ["whiskey.itm"] = 3,
   },
}

itemsLists.tradeLists =
{
   ["marik_trade_whitelist"] =
   {
      "antigravium_shards.itm",
      "booze.itm",
      "absinthe.itm",
      "whiskey.itm",
      "lager.itm",
      "porter.itm",
      "arphant_tranquilizer_weed.itm",
      "antigravium.itm",
      "joint.itm",
      "bluethorn_leaf.itm",
   },
   ["marik_trade_inventory"] = {
      ["antigravium_shards.itm"]        = 1000,
      ["booze.itm"]                     = 20,
      ["absinthe.itm"]                  = 15,
      ["whiskey.itm"]                   = 15,
      ["lager.itm"]                     = 20,
      ["porter.itm"]                    = 20,
      ["arphant_tranquilizer_weed.itm"] = 5,
      ["joint.itm"]                     = 15,
      ["bluethorn_leaf.itm"]            = 40,
   },
   ["mute_trade_inventory"] = {
      ["antigravium_shards.itm"]        = 200,
      ["antigravium.itm"]               = 1,
      ["booze.itm"]                     = 5,
      ["bluethorn_leaf.itm"]            = 2,
      ["joint.itm"]                     = 2,
      ["human_turban.itm"]              = 1,
      ["junk_top_1.itm"]                = 1,
      ["junk_legs_1.itm"]               = 1,
      ["junk_top_2.itm"]                = 1,
      ["junk_legs_2.itm"]               = 1,
      ["shovel.wpn"]                    = 2,
      ["pickaxe.wpn"]                   = 1,
      ["bug_dead.itm"]                  = 4,
      ["scrap_mechanical.itm"]          = 6,
   },
   ["default_trade_whitelist"] =
   {
      "antigravium_shards.itm",
      "blood_root.itm",
      "ktharsian_aloe.itm",
      "stygmyan_golden_apple.itm",
      "antigravium.itm",
      "scrap_mechanical.itm",
      "scrap_electric.itm",
      "meat.itm",
      "fried_meat.itm",
      "melon.itm",
      "pure_water_bottle.itm",
      "dirty_water_bottle.itm",
   },
   ["eli_trade_whitelist"] =
   {
      "guns_all",
      "weapons_all",
      "ammo_all",
      "antigravium_shards.itm",
      "blood_root.itm",
      "ktharsian_aloe.itm",
      "stygmyan_golden_apple.itm",
      "antigravium.itm",
      "scrap_mechanical.itm",
      "scrap_electric.itm",
   },
   ["eli_trade_inventory"] = {
      ["antigravium_shards.itm"]     = 2000,
      ["flare_ammo.itm"]             = 7,
      ["beacon_base.itm"]            = 3,
      ["good_beacon_light.tmpl"]     = 2,
      ["bluethorn_leaf.itm"]         = 10,
      ["worker_jacket.itm"]          = 1,
      ["worker_pants.itm"]           = 1,
      ["bounty_hunter_jacket_1.itm"] = 1,
      ["bounty_hunter_jacket_2.itm"] = 1,
      ["bounty_hunter_jacket_3.itm"] = 1,
      ["bounty_hunter_pants_1.itm"]  = 1,
      ["bounty_hunter_pants_2.itm"]  = 1,
      ["bounty_hunter_pants_3.itm"]  = 1,
      ["camera_basic.itm"]           = 2,
      ["energy_implant.itm"]         = 1,
      ["firewood.itm"]               = 10,
      ["meat.itm"]                   = 20,
      ["cloth.itm"]                  = 20,
      ["medkit.itm"]                 = 5,
      ["capsule_health.itm"]         = 4,
      ["morbid_green.itm"]           = 2,
      ["morbid_red.itm"]             = 1,
      ["neurochip.itm"]              = 3,
      ["good_pickaxe.tmpl"]          = 1,
      ["power_cell.itm"]             = 1,
      ["pure_water_bottle.itm"]      = 8,
      ["good_shovel.tmpl"]           = 1,
      ["slime_meat.itm"]             = 4,
      ["bandana_grey.itm"]           = 1,
      ["windscream_canyon_map.itm"]  = 1,
      ["absinthe.itm"]               = 4,
      ["whiskey.itm"]                = 5,
   },
   ["waga_the_tumbleweed_trade_whitelist"] =
   {
      "antigravium_shards.itm",
      "blood_root.itm",
      "ktharsian_aloe.itm",
      "stygmyan_golden_apple.itm",
      "antigravium.itm",
      "scrap_mechanical.itm",
      "scrap_electric.itm",
      "meat.itm",
      "fried_meat.itm",
      "melon.itm",
      "pure_water_bottle.itm",
      "dirty_water_bottle.itm",
   },
   ["waga_the_tumbleweed_trade_inventory"] = {
      ["antigravium_shards.itm"]    = 400,
      ["flare_ammo.itm"]            = 4,
      ["22_ammo.itm"]               = 70,
      ["revolver_ammo.itm"]         = 50,
      ["meat.itm"]                  = 10,
      ["cloth.itm"]                 = 5,
      ["booze.itm"]                 = 5,
      ["bandana_red.itm"]           = 1,
      ["junk_top_2.itm"]            = 1,
      ["junk_legs_2.itm"]           = 1,
      ["windscream_canyon_map.itm"] = 1,
   },
   ["wandering_merchant_trade_whitelist"] =
   {
      "antigravium_shards.itm",
      "blood_root.itm",
      "ktharsian_aloe.itm",
      "stygmyan_golden_apple.itm",
      "antigravium.itm",
      "scrap_mechanical.itm",
      "scrap_electric.itm",
      "meat.itm",
      "fried_meat.itm",
      "melon.itm",
      "pure_water_bottle.itm",
      "dirty_water_bottle.itm",
   },
   ["wandering_merchant_trade_inventory"] = {
      ["antigravium_shards.itm"] = 1000,
      ["flare_ammo.itm"]         = 5,
      ["22_ammo.itm"]            = 500,
      ["howdah_ammo.itm"]        = 500,
      ["shotgun_ammo.itm"]       = 500,
      ["revolver_ammo.itm"]      = 500,
      ["cloth.itm"]              = 15,
      ["meat.itm"]               = 20,
      ["neurochip.itm"]          = 3,
      ["worker_jacket.itm"]      = 1,
      ["worker_pants.itm"]       = 1,
      ["sheriff_jacket.itm"]     = 1,
      ["sheriff_pants.itm"]      = 1,
      ["bandana_black.itm"]      = 1,
      ["scrap_electric.itm"]     = 15,
      ["good_pickaxe.tmpl"]      = 1,
      ["good_flaregun.tmpl"]     = 1,
      ["good_shotgun_3.tmpl"]    = 1,
   },
   ["kwagga_trade_whitelist"] =
   {
      "antigravium_shards.itm",
      "blood_root.itm",
      "ktharsian_aloe.itm",
      "stygmyan_golden_apple.itm",
      "antigravium.itm",
      "scrap_mechanical.itm",
      "scrap_electric.itm",
      "meat.itm",
      "fried_meat.itm",
      "melon.itm",
      "pure_water_bottle.itm",
      "dirty_water_bottle.itm",
   },
   ["kwagga_trade_inventory"] = {
      ["antigravium_shards.itm"] = 1000,
      ["22_ammo.itm"]            = 500,
      ["howdah_ammo.itm"]        = 500,
      ["shotgun_ammo.itm"]       = 500,
      ["revolver_ammo.itm"]      = 500,
      ["cloth.itm"]              = 8,
      ["capsule_health.itm"]     = 2,
      ["meat.itm"]               = 20,
      ["neurochip.itm"]          = 3,
      ["worker_jacket.itm"]      = 1,
      ["worker_pants.itm"]       = 1,
      ["sheriff_jacket.itm"]     = 1,
      ["sheriff_pants.itm"]      = 1,
      ["scrap_electric.itm"]     = 15,
      ["good_shovel.tmpl"]       = 2,
      ["good_pickaxe.tmpl"]      = 2,
      ["good_shotgun_3.tmpl"]    = 1,
      ["flare_ammo.itm"]         = 6,
      ["booze.itm"]              = 5,
      ["beer.itm"]               = 4,
      ["good_machete.tmpl"]      = 1,
   },
   ["msasi_trade_whitelist"] =
   {
      "horn.itm",
      "blood_root.itm",
      "ktharsian_aloe.itm",
      "stygmyan_golden_apple.itm",
      "antigravium.itm",
      "antigravium_shards.itm",
   },
   ["msasi_trade_inventory"] = {
      ["antigravium_shards.itm"]    = 1000,
      ["flare_ammo.itm"]            = 3,
      ["22_ammo.itm"]               = 500,
      ["howdah_ammo.itm"]           = 500,
      ["shotgun_ammo.itm"]          = 500,
      ["revolver_ammo.itm"]         = 500,
      ["neurochip.itm"]             = 3,
      ["cloth.itm"]                 = 10,
      ["meat.itm"]                  = 20,
      ["capsule_health.itm"]        = 2,
      ["good_pickaxe.tmpl"]         = 1,
      ["windscream_canyon_map.itm"] = 1,
      ["bandana_red.itm"]           = 1,
      ["worker_jacket.itm"]         = 1,
      ["worker_pants.itm"]          = 1,
   },
   ["stone_heads_trader_trade_whitelist"] =
   {
      "guns_all",
      "weapons_all",
      "ammo_all",
      "blood_root.itm",
      "ktharsian_aloe.itm",
      "stygmyan_golden_apple.itm",
      "antigravium.itm",
      "scrap_mechanical.itm",
      "scrap_electric.itm",
      "antigravium_shards.itm",
   },
   ["stone_heads_trader_trade_inventory"] = {
      ["antigravium_shards.itm"]          = 1000,
      ["22_ammo.itm"]                     = 500,
      ["howdah_ammo.itm"]                 = 500,
      ["shotgun_ammo.itm"]                = 500,
      ["revolver_ammo.itm"]               = 500,
      ["meat.itm"]                        = 20,
      ["cloth.itm"]                       = 5,
      ["scrap_electric.itm"]              = 10,
      ["bluethorn_leaf.itm"]              = 10,
      ["bandana_black.itm"]               = 1,
      ["good_pickaxe.tmpl"]               = 1,
      ["worker_pants.itm"]                = 1,
   },
}

itemsLists.modelsList =
{
   ["bottle_absinth.sbg"]        = "absinthe.itm",
   ["axe.sbg"]                   = "axe.wpn",
   ["abori_gun_mix.sbg"]         = nil,
   ["camera_basic.sbg"]          = nil,
   ["camera_strong.sbg"]         = nil,
   ["energy.sbg"]                = nil,
   ["energy_fence.sbg"]          = "energy_fence.itm",
   ["howdah_OLD.sbg"]            = nil,
   ["plasma_spear.sbg"]          = nil,
   ["revolver_old.sbg"]          = nil,
   ["shotgun_old.sbg"]           = nil,
   ["shovel_wep.sbg"]            = "shovel.wpn",
   ["turret_ammo_box.sbg"]       = nil,
   ["turret_construct_base.sbg"] = nil,
   ["turret_construct_head.sbg"] = nil,
   ["cigar_large.sbg"]           = nil,
   ["cigar_med.sbg"]             = nil,
   ["cigar_small.sbg"]           = nil,
   ["fried_meat_bent.sbg"]       = "fried_meat.itm",
   ["joint_med.sbg"]             = nil,
   ["joint_large.sbg"]           = nil,
   ["biker_helmet.sbg"]          = "biker_helmet.itm",
   ["biker_helmet_2.sbg"]        = "biker_helmet_2.itm",
   ["biker_mask.sbg"]            = "biker_mask.itm",
   ["biker_mask_2.sbg"]          = "biker_mask_2.itm",
   ["boonie_hat.sbg"]            = "boonie_hat.itm",
   ["bullet_hat.sbg"]            = "bullet_hat.itm",
   ["bullet_hat_2.sbg"]          = "bullet_hat_2.itm",
   ["hunter_hat.sbg"]            = "hunter_hat.itm",
   ["farmer_1_hat.sbg"]          = "farmer_1_hat.itm",
   ["spacer_hat.sbg"]            = "spacer_hat.itm",
   ["hat_leather.sbg"]           = "hat_leather.itm",
   ["human_turban.sbg"]          = "human_turban.itm",
   ["nomad_goggles.sbg"]         = "nomad_goggles.itm",
   ["rice_hat.sbg"]              = "rice_hat.itm",
   ["sheriff_hat.sbg"]           = "sheriff_hat.itm",
   ["thug_1_hat.sbg"]            = "thug_1_hat.itm",
   ["wooden_stick.sbg"]          = "wooden_bat.wpn",
   ["crystall_shard_1a.sbg"]     = "antigravium_shards.itm",
   ["crystall_shard_1b.sbg"]     = "antigravium_shards.itm",
   ["crystall_shard_1c.sbg"]     = "antigravium_shards.itm",
   ["melon_fruit.sbg"]           = "melon.itm",
}

itemsLists.meshToLabelList =
{
   ["electric_panel.sbg"]              = "Electric Panel",
   ["toolbox.sbg"]                     = "Toolbox",
   ["barrel_empty.sbg"]                = "Barrel",
   ["barrel_full.sbg"]                 = "Barrel",
   ["basket_1_base.sbg"]               = "Basket",
   ["basket_large_1_base.sbg"]         = "Large Basket",
   ["basket_large_2_base.sbg"]         = "Large Basket",
   ["basket_tall_base.sbg"]            = "Tall Basket",
   ["bounty_hunter_terminal.sbg"]      = "Terminal",
   ["caravan_bag_1.sbg"]               = "Bag",
   ["caravan_bag_2.sbg"]               = "Bag",
   ["caravan_bag_3.sbg"]               = "Bag",
   ["caravan_box_1.sbg"]               = "Box",
   ["caravan_box_2.sbg"]               = "Box",
   ["caravan_box_3.sbg"]               = "Box",
   ["crucass_cut.sbg"]                 = "Dead Crucass",
   ["footlocker_normal.sbg"]           = "Chest",
   ["footlocker_short.sbg"]            = "Chest",
   ["footlocker_tall.sbg"]             = "Chest",
   ["furnitureset_cabinet.sbg"]        = "Metal locker",
   ["furnitureset_cabinet_small.sbg"]  = "Metal locker",
   ["hoverbike_classic_blue.sbg"]      = "Blue Hoverbike",
   ["hoverbike_classic_blue_2.sbg"]    = "Blue Hoverbike",
   ["rock_medium_parall.sbg"]          = "Rock",
   ["rock_medium_round.sbg"]           = "Rock",
   ["small_4.sbg"]                     = "Rock",
   ["supply_tube.sbg"]                 = "Supply Tube",
   ["vacuum_box.sbg"]                  = "Vacuum Box",
   ["campfire.sbg"]                    = "Campfire",
}

local function getItemsList(name)
   return itemsLists.lootLists[name] or itemsLists.tradeLists[name]
end

local function getItemForModel(modelName)
   local ItemsData = require "itemsData"
   local result = itemsLists.modelsList[modelName]
   if not result then
      for itemName, item in pairs(ItemsData.ItemsInfo) do
         if item.model == modelName then
            return itemName
         end
      end
      -- fallback to guessing
      if stringx.endswith(modelName, ".sbg") then
         local types = {".itm", ".wpn", ".gun"}
         local guess
         for _, ext in pairs(types) do
            guess = stringx.replace(modelName, ".sbg", ext)
            if ItemsData.ItemsInfo[guess] then
               log(string.format("INFO: guessing that model %s is item %s", modelName, guess))
               return guess
            end
         end
      end
   end
   return result
end

local function getLabelForModel(modelName)
   return itemsLists.meshToLabelList[modelName] or ""
end

itemsLists.getItemsList    = getItemsList
itemsLists.getItemForModel = getItemForModel
itemsLists.getLabelForModel = getLabelForModel

return itemsLists
