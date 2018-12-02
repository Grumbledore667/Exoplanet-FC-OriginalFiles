local spawnList =
{
   -- assumes that char class and type are set in the editor
   test_spawn1 =
   {
      weapons = { "alien_cactus_bat.wpn", },
   },

   -- partial parameters, all others are taken from editor
   test_spawn2 =
   {
      weapons = { "machete.wpn", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 3,
      aliveCountMax = 4,
   },

   test_spawn3 =
   {
      active = true, -- if this spawner is active
      spawnRate = 0, -- how often to generate chars, better leave at default
      spawnDist = 5000, -- spawn when player gets within this distance, better leave default
      viewDist = 5000, -- how far away the char will spot enemies                      --do not include if you want default values
      attackDist = 5000, -- custom attack range                                        --do not include if you want default values
      zoneSize = 0, -- defines how far the char will wander from his spawner
      lootItems = { ["22_ammo.itm"] = 20,
         ["absinthe.itm"] = 1, }, -- each generated character receives this
      weapons = { "scamp_22.gun", }, -- each char receives random from this list
      energyMax = 100, --Capacity of the shield (blocks 100 damage before armor)  --do not include if you want none
      styles = { "zak", "eli", "bandit12345", }, -- each char gets a random style from this list
      characterType = "human_male.cfg", -- or "abori.cfg"
      characterClass = "CBandit",
      spawnTimeMax = 1, -- stop spawn after x seconds, leave default
      spawnCountMax = 1, -- total spawned count, leave default
      aliveCountMax = 1, -- max alive at any single time, leave default
      customLabel = "Retarded Bandit", -- custom label that will be assigned to all spawned bandits
   },

   test_spawn4 =
   {
      active = true, -- if this spawner is active
      spawnRate = 0, -- how often to generate chars, better leave at default
      spawnDist = 5000, -- spawn when player gets within this distance, better leave default
      lootItems = { ["22_ammo.itm"] = 20,
         ["absinthe.itm"] = 1, }, -- each generated character receives this, ANIMALS ALSO HAVE THEIR DEFAULT LOOT - meat for crucases and meat + horns for kabarogs
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnTimeMax = 1, -- stop spawn after x seconds, leave default
      spawnCountMax = 1, -- total spawned count, leave default
      aliveCountMax = 1, -- max alive at any single time, leave default
   },

   abori_goes_home_encounter_1 =
   {
      active = false,
      spawnDist = 10000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },

   abori_goes_home_encounter_2 =
   {
      active = false,
      spawnDist = 10000,
      lootItems = { ["cloth.itm"] = 1,
         ["melon.itm"] = 1,},
      weapons = { "wooden_bat.wpn", },
      styles = { "abori_bandit_1", "abori_bandit_2", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 2,
      aliveCountMax = 2,
      customLabel = "Mad outcast",
   },

   q_angry_bugs_spawn_1 =
   {
      active = false,
      spawnDist = 10000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      spawnCountMax = 15,
      aliveCountMax = 15,
      healthMax = 100,
      walkSpeed = 400,
      runSpeed = 800,
      weaponDamage = 50,
   },
   q_angry_bugs_spawn_2 =
   {
      active = false,
      spawnDist = 10000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      spawnCountMax = 15,
      aliveCountMax = 15,
      healthMax = 100,
      walkSpeed = 400,
      runSpeed = 800,
      weaponDamage = 80,
   },
   q_angry_bugs_spawn_3 =
   {
      active = false,
      spawnDist = 10000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      spawnCountMax = 15,
      aliveCountMax = 15,
      healthMax = 100,
      walkSpeed = 400,
      runSpeed = 800,
      weaponDamage = 80,
   },

   spwn_tutorial_weak_crucass_1 =
   {
      active = true,
      spawnDist = 5000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },


   spwn_tutorial_weak_crucass_2 =
   {
      active = true,
      spawnDist = 8000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },


   spwn_tutorial_weak_crucass_3 =
   {
      active = true,
      spawnDist = 5000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_tutorial_weak_crucass_4 =
   {
      active = true,
      spawnDist = 5000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnTimeMax = 5,
      spawnCountMax = 2,
      aliveCountMax = 2,
   },

   spwn_tutorial_weak_crucass_5 =
   {
      active = true,
      spawnDist = 5000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_tutorial_bad_cave_weak_crucass_1 =
   {
      active = true,
      spawnDist = 8000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 2,
      aliveCountMax = 2,
      zoneSize = 700,
   },

   spwn_tutorial_stonecircle_path_weak_crucass_1 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_tutorial_stonecircle_path_weak_crucass_2 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_anom_building_bug =
   {
      active = true,
      spawnDist = 7000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      spawnCountMax = 3,
      aliveCountMax = 3,
   },

   spwn_tutorial_old_outcast_bug =
   {
      active = true,
      spawnDist = 7000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },

   spwn_tutorial_young_outcast_bug =
   {
      active = true,
      spawnDist = 7000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      spawnCountMax = 4,
      aliveCountMax = 4,
   },

   spwn_tutorial_lake_hornhog =
   {
      active = true,
      spawnDist = 10000,
      characterType = "kabarog.cfg",
      characterClass = "CKabarogWeak",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_tutorial_near_cliff_bug =
   {
      active = true,
      spawnDist = 7000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },

   spwn_tutorial_cave_bug_1 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },

   spwn_tutorial_cave_bug_2 =
   {
      active = true,
      spawnDist = 6000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      spawnCountMax = 3,
      aliveCountMax = 3,
   },

   spwn_sinkhole_hornhog_1 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "kabarog.cfg",
      characterClass = "CKabarog",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_sinkhole_bug_1 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_sinkhole_bug_2 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_sinkhole_hornhog_2 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "kabarog.cfg",
      characterClass = "CKabarog",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_turbines_hornhog =
   {
      active = true,
      spawnDist = 10000,
      characterType = "kabarog.cfg",
      characterClass = "CKabarog",
      spawnCountMax = 3,
      aliveCountMax = 3,
   },

   spwn_littlehelpers_bug_1 =
   {
      active = true,
      spawnDist = 5000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      feelRadiusCutoff = 30,
      zoneSize = 200,
      spawnCountMax = 2,
      aliveCountMax = 2,
   },

   spwn_littlehelpers_bug_2 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      feelRadiusCutoff = 400,
      zoneSize = 500,
      spawnCountMax = 2,
      aliveCountMax = 2,
   },

   spwn_littlehelpers_bug_3 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      feelRadiusCutoff = 400,
      spawnCountMax = 3,
      aliveCountMax = 3,
   },

   spwn_littlehelpers_bug_4 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      feelRadiusCutoff = 400,
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_old_mine_hornhog =
   {
      active = true,
      spawnDist = 8000,
      characterType = "kabarog.cfg",
      characterClass = "CKabarog",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },

   spwn_upper_wade_hornhog =
   {
      active = true,
      spawnDist = 10000,
      characterType = "kabarog.cfg",
      characterClass = "CKabarog",
      spawnCountMax = 3,
      aliveCountMax = 3,
   },

   spwn_plateau_hornhog_1 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "kabarog.cfg",
      characterClass = "CKabarog",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },

   spwn_plateau_hornhog_2 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "kabarog.cfg",
      characterClass = "CKabarog",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_plateau_hornhog_3 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "kabarog.cfg",
      characterClass = "CKabarog",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_plateau_hornhog_4 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "kabarog.cfg",
      characterClass = "CKabarog",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_plateau_hornhog_5 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "kabarog.cfg",
      characterClass = "CKabarog",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_mrgreen_crucass_nest_1 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },

   spwn_mrgreen_crucass_nest_2 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },

   spwn_near_swift_strider_bug_1 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      spawnCountMax = 3,
      aliveCountMax = 3,
   },

   spwn_near_swift_strider_bug_2 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      zoneSize = 600,
      spawnCountMax = 3,
      aliveCountMax = 3,
   },

   spwn_fort_bug =
   {
      active = true,
      spawnDist = 4000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      feelRadiusCutoff = 0,
      zoneSize = 8,
      blockChirping = true,
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_windscr_canyon_cave_to_turbines_hornhog =
   {
      active = true,
      spawnDist = 10000,
      characterType = "kabarog.cfg",
      characterClass = "CKabarog",
      spawnCountMax = 3,
      aliveCountMax = 3,
   },

   spwn_windscr_canyon_path_to_jungle_bug =
   {
      active = true,
      spawnDist = 10000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      feelRadiusCutoff = 500,
      zoneSize = 120,
      spawnCountMax = 4,
      aliveCountMax = 4,
   },

   spwn_outcast_camp_bitebug_1 =
   {
      active = true,
      spawnDist = 5000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      feelRadiusCutoff = 180,
      zoneSize = 140,
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_windscr_canyon_jungle_hornhog =
   {
      active = true,
      spawnDist = 10000,
      characterType = "kabarog.cfg",
      characterClass = "CKabarog",
      spawnCountMax = 4,
      aliveCountMax = 4,
   },

   spwn_windscr_canyon_opposite_elev_cave_bug =
   {
      active = true,
      spawnDist = 10000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      zoneSize = 200,
      spawnCountMax = 5,
      aliveCountMax = 5,
   },

   spwn_windscr_canyon_water_cave_crucass_eating =
   {
      active = true,
      spawnDist = 5000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      zoneSize = 8,
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_family_relic_cave_crucass_eating =
   {
      active = true,
      spawnDist = 8000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      zoneSize = 8,
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_tutorial_stonecircle_cave_mad_outcast_1 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["22_ammo.itm"] = 9,
         ["rotten_meat.itm"] = 2,
         ["melon.itm"] = 1,},
      weapons = { "alien_cactus_bat.wpn", },
      styles = { "abori_bandit_1", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Mad outcast",
   },

   spwn_tutorial_cliff_1 =
   {
      active = true,
      spawnDist = 9500,
      lootItems = { ["22_ammo.itm"] = 10,
         ["fried_bug.itm"] = 2,
         ["antigravium_shards.itm"] = 8,},
      weapons = { "wooden_bat.wpn", },
      styles = { "scalphunter_5", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      zoneSize = 70,
      customLabel = "Scalphunter",
   },

   spwn_tutorial_cliff_2 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["22_ammo.itm"] = 3,
         ["absinthe.itm"] = 1,
         ["bluethorn_leaf.itm"] = 2, },
      weapons = { "wooden_bat.wpn", },
      styles = { "scalphunter_7", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      zoneSize = 70,
      customLabel = "Scalphunter",
   },

   spwn_tutorial_stonecircle_cave_mad_outcast_2 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["22_ammo.itm"] = 5,
         ["meat.itm"] = 1,
         ["antigravium_shards.itm"] = 6,},
      weapons = { "machete.wpn", },
      styles = { "abori_bandit_4", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Mad outcast",
   },

   spwn_tutorial_stonecircle_mad_outcast_1 =
   {
      active = true,
      zoneSize = 7,
      spawnDist = 5000,
      lootItems = { ["22_ammo.itm"] = 4,
         ["antigravium_shards.itm"] = 9,
         ["booze.itm"] = 1,},
      weapons = { "shovel.wpn", },
      styles = { "abori_bandit_1", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Mad outcast",
   },

   spwn_tutorial_stonecircle_mad_outcast_2 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["can_emulsia.itm"] = 1,
         ["bluethorn_leaf.itm"] = 2,
         ["antigravium_shards.itm"] = 9,},
      weapons = { "abori_axe.wpn", },
      styles = { "abori_bandit_3", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Mad outcast",
   },

   spwn_tutorial_stonecircle_mad_outcast_3 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["22_ammo.itm"] = 12,
         ["antigravium_shards.itm"] = 2,
         ["melon.itm"] = 3,},
      weapons = { "abori_knife.wpn", },
      styles = { "abori_bandit_2", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Mad outcast",
   },

   spwn_tutorial_abori_1 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["22_ammo.itm"] = 9,
         ["rotten_meat.itm"] = 2,
         ["melon.itm"] = 1,},
      weapons = { "alien_cactus_bat.wpn", },
      styles = { "abori_bandit_1", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori outcast",
   },


   spwn_tutorial_abori_2 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["22_ammo.itm"] = 5,
         ["meat.itm"] = 1,
         ["antigravium_shards.itm"] = 6,},
      weapons = { "machete.wpn", },
      styles = { "abori_bandit_4", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori outcast",
   },


   spwn_tutorial_abori_3 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["22_ammo.itm"] = 4,
         ["antigravium_shards.itm"] = 9,
         ["booze.itm"] = 1,},
      weapons = { "shovel.wpn", },
      styles = { "abori_bandit_1", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori outcast",
   },


   spwn_tutorial_abori_4 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["can_emulsia.itm"] = 1,
         ["bluethorn_leaf.itm"] = 2,
         ["antigravium_shards.itm"] = 9,},
      weapons = { "abori_axe.wpn", },
      styles = { "abori_bandit_3", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori outcast",
   },


   spwn_tutorial_abori_5 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["22_ammo.itm"] = 5,
         ["slime_meat.itm"] = 1,
         ["antigravium_shards.itm"] = 15,},
      weapons = { "pickaxe.wpn", },
      styles = { "abori_bandit_2", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori outcast",
   },


   spwn_tutorial_abori_6 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["22_ammo.itm"] = 12,
         ["antigravium_shards.itm"] = 2,
         ["melon.itm"] = 3,},
      weapons = { "scamp_22.gun", },
      styles = { "abori_bandit_1", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori outcast",
   },


   spwn_tutorial_abori_7 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["22_ammo.itm"] = 2,
         ["pure_water_bottle.itm"] = 1,
         ["antigravium_shards.itm"] = 4},
      weapons = { "abori_axe.wpn", },
      styles = { "abori_bandit_5", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori outcast",
   },


   spwn_tutorial_passage_1 =
   {
      active = true,
      spawnDist = 9500,
      lootItems = { ["22_ammo.itm"] = 10,
         ["fried_bug.itm"] = 2,
         ["antigravium_shards.itm"] = 8,},
      weapons = { "abori_knife.wpn", },
      styles = { "scalphunter_2", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      zoneSize = 1,
      customLabel = "Abori scalphunter",
   },

   spwn_tutorial_passage_2 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["22_ammo.itm"] = 3,
         ["absinthe.itm"] = 1,
         ["bluethorn_leaf.itm"] = 2, },
      weapons = { "abori_bat.wpn", },
      styles = { "scalphunter_1", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori scalphunter",
   },

   spwn_tutorial_passage_3 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["revolver_ammo.itm"] = 5,
         ["humanoid_leg.itm"] = 1, },
      weapons = { "abori_knife.wpn", },
      styles = { "scalphunter_6", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori scalphunter",
   },

   spwn_tutorial_passage_4 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["antigravium_shards.itm"] = 6,
         ["booze.itm"] = 2, },
      weapons = { "abori_bat.wpn", },
      styles = { "scalphunter_4", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori scalphunter",
   },

   spwn_tutorial_cave_1 =
   {
      active = true,
      spawnDist = 5000,
      zoneSize = 105,
      lootItems = { ["revolver_ammo.itm"] = 7,
         ["can_mixture.itm"] = 2, },
      weapons = { "revolver.gun", },
      styles = { "abori_bandit_5", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori bandit",
   },

   spwn_tutorial_cave_2 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["firewood.itm"] = 3, },
      weapons = { "abori_axe.wpn", },
      styles = { "abori_bandit_6", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori bandit",
   },

   spwn_turbines_1 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["scrap_mechanical.itm"] = 3,
         ["rotten_meat.itm"] = 1, },
      weapons = { "abori_axe.wpn", },
      styles = { "mad_bandit_4", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Mad bandit",
   },

   spwn_turbines_2 =
   {
      active = true,
      spawnDist = 5000,
      lootItems = { ["scrap_electric.itm"] = 2,
         ["blood_root.itm"] = 3, },
      weapons = { "shovel.wpn", },
      styles = { "mad_bandit_2", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Mad bandit",
   },


   spwn_turbines_3 =
   {
      active = true,
      spawnDist = 10000,
      zoneSize = 1,
      lootItems = { ["22_ammo.itm"] = 3,
         ["porter.itm"] = 1,
         ["bluethorn_leaf.itm"] = 2,
         ["joint.itm"] = 1, },
      weapons = { "carbine.gun", },
      styles = { "bandit_sharpshooter_1", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit sharpshooter",
   },

   spwn_turbines_4 =
   {
      active = true,
      spawnDist = 9000,
      zoneSize = 1,
      lootItems = { ["shotgun_ammo.itm"] = 1,
         ["mixture.itm"] = 2,
         ["antigravium_shards.itm"] = 8, },
      weapons = { "good_shotgun_2.tmpl", },
      styles = { "bandit_sharpshooter_2", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit sharpshooter",
   },

   spwn_turbines_5 =
   {
      active = true,
      spawnDist = 9000,
      zoneSize = 1,
      lootItems = { ["shotgun_ammo.itm"] = 3,
         ["fried_bug.itm"] = 2, },
      weapons = { "shotgun.gun", },
      styles = { "bandit_sharpshooter_3", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit sharpshooter",
   },

   spwn_turbines_7 =
   {
      active = true,
      spawnRate = 2,
      spawnDist = 9000,
      zoneSize = 200,
      lootItems = { ["revolver_ammo.itm"] = 10,
         ["fried_meat.itm"] = 2, },
      weapons = { "revolver.gun", },
      styles = { "bandit_gunslinger_1", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnTimeMax = 5,
      spawnCountMax = 2,
      aliveCountMax = 2,
      customLabel = "Bandit gunslinger",
   },

   spwn_turbines_6 =
   {
      active = true,
      spawnDist = 9000,
      zoneSize = 2,
      lootItems = { ["booze.itm"] = 1,
         ["melon.itm"] = 3, },
      weapons = { "axe.wpn", },
      styles = { "mad_bandit_3", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Mad bandit",
   },

   spwn_turbines_8 =
   {
      active = true,
      spawnDist = 9000,
      lootItems = { ["firewood.itm"] = 3, },
      weapons = { "machete.wpn", },
      styles = { "mad_bandit_1", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Mad bandit",
   },

   spwn_windscr_canyon_waydown_cave_bandit_1 =
   {
      active = true,
      spawnRate = 2,
      spawnDist = 9000,
      lootItems = { ["revolver_ammo.itm"] = 5,
         ["slime_meat.itm"] = 2,
         ["scrap_mechanical.itm"] = 1,
         ["morbid_green.itm"] = 1,
         ["antigravium_shards.itm"] = 5, },
      weapons = { "good_revolver_3.tmpl", },
      styles = { "bandit_gunslinger_1", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnTimeMax = 5,
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit gunslinger",
   },

   spwn_windscr_canyon_waydown_cave_bandit_2 =
   {
      active = true,
      spawnDist = 9000,
      zoneSize = 50,
      lootItems = { ["shotgun_ammo.itm"] = 7,
         ["fried_bug.itm"] = 1,
         ["booze.itm"] = 2,
         ["medkit.itm"] = 1,
         ["scrap_electric.itm"] = 3, },
      weapons = { "shotgun.gun", },
      styles = { "bandit_sharpshooter_3", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit sharpshooter",
   },

   spwn_windscr_canyon_waydown_cave_bandit_3 =
   {
      active = true,
      spawnDist = 9000,
      zoneSize = 50,
      lootItems = { ["shotgun_ammo.itm"] = 1,
         ["fried_bug.itm"] = 1,
         ["lager.itm"] = 1,
         ["blood_root.itm"] = 4,
         ["mixture.itm"] = 1, },
      weapons = { "shotgun.gun", },
      styles = { "bandit_sharpshooter_2", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit sharpshooter",
   },

   spwn_windscr_canyon_waydown_cave_votary_1 =
   {
      active = true,
      spawnDist = 9000,
      zoneSize = 6,
      lootItems = { ["joint.itm"] = 4,
         ["bluethorn_leaf.itm"] = 2,
         ["blood_root.itm"] = 2,
         ["cloth.itm"] = 4,
         ["firewood.itm"] = 1, },
      weapons = { "abori_bat.wpn", },
      styles = { "scalphunter_9", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Scalphunter votary",
   },

   spwn_windscr_canyon_waydown_cave_votary_2 =
   {
      active = true,
      spawnDist = 9000,
      zoneSize = 6,
      lootItems = { ["joint.itm"] = 8,
         ["bluethorn_leaf.itm"] = 5,
         ["revolver_ammo.itm"] = 17,
         ["ktharsian_aloe.itm,2"] = 4,
         ["horn.itm"] = 4, },
      weapons = { "revolver.gun", },
      styles = { "scalphunter_3", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Scalphunter votary",
   },

   spwn_windscr_canyon_waydown_cave_votary_3 =
   {
      active = true,
      spawnDist = 9000,
      zoneSize = 16,
      lootItems = { ["joint.itm"] = 1,
         ["flare_ammo.itm"] = 1,
         ["cloth.itm"] = 2,
         ["firewood.itm"] = 2, },
      weapons = { "abori_knife.wpn", },
      styles = { "scalphunter_6", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Scalphunter votary",
   },

   spwn_hulk_1 =
   {
      healthMax = 400,
      active = true,
      spawnDist = 9000,
      zoneSize = 5,
      lootItems = { ["joint.itm"] = 3,
         ["rotten_meat.itm"] = 2,
         ["booze.itm"] = 1,
         ["antigravium_shards.itm"] = 6, },
      weapons = {},
      styles = { "abori_hulk_1", },
      characterType = "hulk.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Hybrid hulk",
   },

   spwn_hulk_2 =
   {
      healthMax = 400,
      active = true,
      spawnDist = 9000,
      zoneSize = 5,
      lootItems = { ["joint.itm"] = 2,
         ["rotten_meat.itm"] = 3,
         ["booze.itm"] = 1,
         ["antigravium_shards.itm"] = 9, },
      weapons = {},
      styles = { "abori_hulk_2", },
      characterType = "hulk.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Hybrid outlaw",
   },

   spwn_hulk_3 =
   {
      healthMax = 400,
      active = true,
      spawnDist = 9000,
      zoneSize = 10,
      lootItems = { ["scrap_mechanical.itm"] = 5,
         ["rotten_meat.itm"] = 4,
         ["booze.itm"] = 4,
         ["antigravium.itm"] = 1, },
      weapons = {},
      styles = { "abori_hulk_3", },
      characterType = "hulk.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Mad hybrid",
   },

   spwn_hulk_4 =
   {
      healthMax = 400,
      active = true,
      spawnDist = 9000,
      zoneSize = 300,
      lootItems = { ["joint.itm"] = 1,
         ["rotten_meat.itm"] = 5,
         ["scrap_mechanical.itm"] = 3,
         ["booze.itm"] = 4,
         ["antigravium_shards.itm"] = 5, },
      weapons = {},
      styles = { "abori_hulk_4", },
      characterType = "hulk.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Hybrid hulk",
   },

   spwn_hulk_5 =
   {
      healthMax = 400,
      active = true,
      spawnDist = 9000,
      zoneSize = 300,
      lootItems = { ["joint.itm"] = 2,
         ["rotten_meat.itm"] = 2,
         ["booze.itm"] = 1,
         ["can_mixture.itm"] = 1,
         ["blood_root.itm"] = 2,
         ["antigravium_shards.itm"] = 7,
         ["antigravium.itm"] = 1, },
      weapons = {},
      styles = { "abori_hulk_5", },
      characterType = "hulk.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Hybrid outlaw",
   },

   spwn_hulk_6 =
   {
      healthMax = 400,
      active = true,
      spawnDist = 9000,
      zoneSize = 300,
      lootItems = { ["joint.itm"] = 1,
         ["rotten_meat.itm"] = 1,
         ["booze.itm"] = 2,
         ["antigravium_shards.itm"] = 10, },
      weapons = {},
      styles = { "abori_hulk_6", },
      characterType = "hulk.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Hybrid outlaw",
   },

   spwn_hulk_7 =
   {
      healthMax = 400,
      active = true,
      spawnDist = 9000,
      zoneSize = 101,
      lootItems = { ["joint.itm"] = 3,
         ["rotten_meat.itm"] = 2,
         ["booze.itm"] = 1,
         ["scrap_mechanical.itm"] = 3,
         ["antigravium_shards.itm"] = 5, },
      weapons = {},
      styles = { "abori_hulk_7", },
      characterType = "hulk.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Hybrid hulk",
   },

   spwn_hulk_8 =
   {
      healthMax = 400,
      active = true,
      spawnDist = 9000,
      zoneSize = 400,
      lootItems = { ["joint.itm"] = 5,
         ["fried_meat.itm"] = 3,
         ["whiskey.itm"] = 1,
         ["antigravium_shards.itm"] = 3,
         ["slime_meat.itm"] = 1,
         ["antigravium.itm"] = 1, },
      weapons = {},
      styles = { "abori_hulk_8", },
      characterType = "hulk.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Hybrid guard",
   },

   spwn_tutorial_upper_camp_chief =
   {
      healthMax = 400,
      active = true,
      spawnDist = 6000,
      zoneSize = 20,
      lootItems = { ["joint.itm"] = 2,
         ["fried_meat.itm"] = 3,
         ["absinthe.itm"] = 2,
         ["antigravium.itm"] = 1,
         ["flare_ammo.itm"] = 4, },
      weapons = {},
      styles = { "abori_hulk_9", },
      characterType = "hulk.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Hybrid chief",
   },

   spwn_tutorial_upper_camp_scalphunter_1 =
   {
      active = true,
      spawnDist = 6500,
      lootItems = { ["22_ammo.itm"] = 10,
         ["fried_meat.itm"] = 2,
         ["booze.itm"] = 1,
         ["antigravium_shards.itm"] = 4,},
      weapons = { "exceptional_scamp_22_8.tmpl", },
      styles = { "scalphunter_8", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      zoneSize = 10,
      customLabel = "Abori scalphunter",
   },

   spwn_tutorial_upper_camp_scalphunter_2 =
   {
      active = true,
      spawnDist = 6500,
      lootItems = { ["22_ammo.itm"] = 2,
         ["cloth.itm"] = 3,
         ["antigravium_shards.itm"] = 2,
         ["pure_water_bottle.itm"] = 3,},
      weapons = { "abori_knife.wpn", },
      styles = { "scalphunter_10", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      zoneSize = 10,
      customLabel = "Abori scalphunter",
   },

spwn_tutorial_upper_camp_arch_sniper_1 =
   {
      active = true,
      spawnDist = 9500,
      lootItems = { ["revolver_ammo.itm"] = 2,
         ["cloth.itm"] = 3,
         ["antigravium_shards.itm"] = 2,
         ["fried_bug.itm"] = 2,},
      weapons = { "carbine.gun", },
      styles = { "scalphunter_3", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      zoneSize = 2,
      viewDist = 2900,
      feelRadiusCutoff = 3900,
      customLabel = "Scalphunter sniper",
   },

spwn_tutorial_upper_camp_arch_sniper_2 =
   {
      active = true,
      spawnDist = 9500,
      lootItems = { ["revolver_ammo.itm"] = 11,
         ["capsule_health.itm"] = 1,
         ["bluethorn_leaf.itm"] = 3,},
      weapons = { "carbine.gun", },
      styles = { "scalphunter_8", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      zoneSize = 2,
      viewDist = 2900,
      feelRadiusCutoff = 3900,
      customLabel = "Scalphunter sniper",
   },

spwn_tutorial_upper_camp_arch_sniper_3 =
   {
      active = true,
      spawnDist = 9500,
      lootItems = { ["revolver_ammo.itm"] = 5,
         ["antigravium_shards.itm"] = 3,
         ["joint.itm"] = 1,},
      weapons = { "carbine.gun", },
      styles = { "scalphunter_1", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      zoneSize = 2,
      viewDist = 2900,
      feelRadiusCutoff = 3900,
      customLabel = "Scalphunter sniper",
   },

   spwn_tutorial_upper_camp_guardpost =
   {
      active = true,
      spawnDist = 9500,
      lootItems = { ["revolver_ammo.itm"] = 9,
         ["cloth.itm"] = 1,
         ["antigravium_shards.itm"] = 6,
         ["can_mixture.itm"] = 1,},
      weapons = { "carbine.gun", },
      styles = { "scalphunter_3", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      zoneSize = 2,
      viewDist = 5900,
      feelRadiusCutoff = 6900,
      customLabel = "Scalphunter sniper",
   },

   spwn_tutorial_upper_camp_guardpost_2 =
   {
      active = true,
      spawnDist = 9500,
      lootItems = { ["revolver_ammo.itm"] = 3,
         ["bluethorn_leaf.itm"] = 2,
         ["antigravium_shards.itm"] = 6,
         ["slime_meat.itm"] = 1,},
      weapons = { "carbine.gun", },
      styles = { "scalphunter_8", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      zoneSize = 2,
      viewDist = 2900,
      feelRadiusCutoff = 3900,
      customLabel = "Scalphunter sniper",
   },

   spwn_hulk_lackey_1 =
   {
      active = true,
      spawnDist = 9000,
      zoneSize = 40,
      lootItems = { ["scrap_mechanical.itm"] = 1,
         ["fried_bug.itm"] = 2,
         ["antigravium_shards.itm"] = 1, },
      weapons = { "pipe.wpn", },
      styles = { "abori_outcast_8_noweapon", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit lackey",
   },

   spwn_hulk_lackey_2 =
   {
      active = true,
      spawnDist = 9000,
      zoneSize = 40,
      lootItems = { ["scrap_mechanical.itm"] = 1,
         ["booze.itm"] = 2,
         ["antigravium_shards.itm"] = 4, },
      weapons = { "alien_cactus_bat.wpn", },
      styles = { "abori_outcast_4", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit lackey",
   },

   spwn_hulk_lackey_3 =
   {
      active = true,
      spawnDist = 9000,
      zoneSize = 20,
      lootItems = { ["scrap_mechanical.itm"] = 3,
         ["fried_bug.itm"] = 1,
         ["antigravium_shards.itm"] = 2, },
      weapons = { "wooden_bat.wpn", },
      styles = { "abori_outcast_2", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit lackey",
   },

   spwn_windscr_canyon_far_cave_1 =
   {
      active = true,
      spawnDist = 6000,
      zoneSize = 7,
      lootItems = {},
      weapons = {},
      styles = { "abori_raider_2", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Mad hermit",
   },

   spwn_windscr_canyon_north_camp_1 =
   {
      active = true,
      spawnDist = 8000,
      zoneSize = 3,
      lootItems = { ["booze.itm"] = 1, },
      weapons = { "machete.wpn", },
      styles = { "human_male_naked", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit lackey",
   },

   spwn_windscr_canyon_north_camp_2 =
   {
      active = true,
      spawnDist = 8000,
      zoneSize = 3,
      lootItems = { ["meat.itm"] = 1,
                    ["bluethorn_leaf.itm"] = 4,},
      weapons = { "good_scamp_22_2.tmpl", },
      styles = { "abori_outcast_3", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Ambitious bandit",
   },

   spwn_windscr_canyon_water_cave_crucass_1 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_windscr_canyon_water_cave_crucass_2 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },

   spwn_windscr_canyon_water_cave_crucass_3 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_windscr_canyon_cave_beast_lair_crucass_1 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_windscr_canyon_cave_beast_lair_crucass_2 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_windscr_canyon_cave_beast_lair_bandit_1 =
   {
      active = true,
      spawnDist = 8000,
      zoneSize = 15,
      lootItems = { ["revolver_ammo.itm"] = 11,
         ["can_emulsia.itm"] = 2,
         ["medkit.itm"] = 1, },
      weapons = { "revolver.gun", },
      styles = { "abori_bandit_5", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori bandit",
   },

   spwn_windscr_canyon_path_to_elev_cave_2 =
   {
      active = true,
      spawnDist = 5000,
      zoneSize = 180,
      lootItems = { ["firewood.itm"] = 2,
                    ["flare_ammo.itm"] = 1,
                    ["revolver_ammo.itm"] = 13, },
      weapons = { "carbine.gun", },
      styles = { "abori_bandit_6", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori bandit",
   },

   spwn_windscr_canyon_path_to_elev_cave_1 =
   {
      active = true,
      spawnDist = 5000,
      zoneSize = 140,
      lootItems = { ["bluethorn_leaf.itm"] = 2,
                    ["flare_ammo.itm"] = 1, },
      weapons = { "abori_knife.wpn", },
      styles = { "abori_bandit_1", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori bandit",
   },

   spwn_windscr_canyon_elev_cave_1 =
   {
      active = true,
      spawnDist = 10000,
      zoneSize = 110,
      lootItems = { ["blood_root.itm"] = 4,
                    ["flare_ammo.itm"] = 3,
                    ["22_ammo.itm"] = 10, },
      weapons = { "scamp_22.gun", },
      styles = { "abori_bandit_2", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori bandit",
   },

   spwn_windscr_canyon_elev_cave_2 =
   {
      active = true,
      spawnDist = 10000,
      zoneSize = 110,
      lootItems = { ["antigravium_shards.itm"] = 12,
                    ["booze.itm"] = 3, },
      weapons = { "abori_bat.wpn", },
      styles = { "abori_bandit_3", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori bandit",
   },

   spwn_windscr_canyon_elev_cave_3 =
   {
      active = true,
      spawnDist = 10000,
      zoneSize = 110,
      lootItems = { ["shotgun_ammo.itm"] = 7,
                    ["whiskey.itm"] = 2, },
      weapons = { "shotgun.gun", },
      styles = { "abori_bandit_4", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori bandit",
   },

   spwn_windscr_canyon_elev_cave_4 =
   {
      active = true,
      spawnDist = 10000,
      zoneSize = 101,
      lootItems = { ["wooden_bat.wpn"] = 4,
                    ["whiskey.itm"] = 1, },
      weapons = { "abori_axe.wpn", },
      styles = { "abori_bandit_5", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Abori bandit",
   },
   spwn_windscr_canyon_elev_cave_5 =
   {
      healthMax = 400,
      active = true,
      spawnDist = 6000,
      zoneSize = 120,
      lootItems = { ["blood_root.itm"] = 3,
         ["fried_meat.itm"] = 3,
         ["cloth.itm"] = 2,
         ["antigravium.itm"] = 1,
         ["flare_ammo.itm"] = 2, },
      weapons = {},
      styles = { "abori_hulk_10", },
      characterType = "hulk.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Hybrid chief",
   },

   spwn_windscr_canyon_far_side_crucass_lair_1 =
   {
      active = true,
      spawnDist = 8000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },

   spwn_windscr_canyon_far_side_bandit_1 =
   {
      active = true,
      spawnRate = 2,
      spawnDist = 9000,
      lootItems = { ["revolver_ammo.itm"] = 6,
         ["fried_meat.itm"] = 2,
         ["scrap_mechanical.itm"] = 1,
         ["antigravium_shards.itm"] = 8, },
      weapons = { "revolver.gun", },
      styles = { "bandit_gunslinger_2", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnTimeMax = 5,
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit gunslinger",
   },

   spwn_windscr_canyon_far_side_bandit_2 =
   {
      active = true,
      spawnDist = 5000,
      zoneSize = 1,
      lootItems = { ["22_ammo.itm"] = 11,
         ["medkit.itm"] = 1,
         ["scrap_electric.itm"] = 3, },
      weapons = { "scamp_22.gun", },
      styles = { "bandit_gunslinger_3", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit gunslinger",
   },

   spwn_windscr_canyon_far_side_bandit_3 =
   {
      active = true,
      spawnDist = 5000,
      zoneSize = 1,
      lootItems = { ["revolver_ammo.itm"] = 5,
         ["mixture.itm"] = 2,
         ["antigravium_shards.itm"] = 3, },
      weapons = { "good_carbine_5.tmpl", },
      styles = { "bandit_gunslinger_4", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit sharpshooter",
   },

   spwn_windscr_canyon_far_side_bandit_4 =
   {
      active = true,
      spawnDist = 5000,
      zoneSize = 20,
      lootItems = { ["shotgun_ammo.itm"] = 8,
         ["fried_meat.itm"] = 5,
         ["lager.itm"] = 3,
         ["stygmyan_golden_apple.itm"] = 1,
         ["mixture.itm"] = 2, },
      weapons = { "mastercrafted_shotgun_2.tmpl", },
      styles = { "bandit_sharpshooter_5", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit sharpshooter",
   },

   spwn_windscr_canyon_far_side_bandit_5 =
   {
      active = true,
      spawnDist = 9000,
      zoneSize = 50,
      lootItems = { ["revolver_ammo.itm"] = 9,
         ["fried_meat.itm"] = 3,
         ["horn.itm"] = 2,
         ["blood_root.itm"] = 2,
         ["melon.itm"] = 7,
         ["booze.itm"] = 1,
         ["joint.itm"] = 2, },
      weapons = { "revolver.gun", },
      styles = { "bandit_gunslinger_4", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit gunslinger",
   },

   spwn_windscr_canyon_cave_to_turbines_crucass_1 =
   {
      active = true,
      spawnDist = 11000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_windscr_canyon_cave_to_turbines_crucass_2 =
   {
      active = true,
      spawnDist = 11000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_windscr_canyon_cave_to_turbines_crucass_3 =
   {
      active = true,
      spawnDist = 11000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },

   spwn_windscr_canyon_cave_to_turbines_crucass_4 =
   {
      active = true,
      spawnDist = 11000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_shallows_crucass_1 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_shallows_crucass_2 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_shallows_crucass_3 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_near_merchant_island_crucass_1 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_near_swift_strider_crucass_1 =
   {
      active = true,
      spawnDist = 9000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_near_swift_strider_crucass_2 =
   {
      active = true,
      spawnDist = 8000,
      zoneSize = 2,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_north_from_turbines_cave_crucass_1 =
   {
      active = true,
      spawnDist = 5000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },

   spwn_north_from_turbines_cave_crucass_2 =
   {
      active = true,
      spawnDist = 5000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },
   spwn_north_from_turbines_crucass_1 =
   {
      active = true,
      spawnDist = 8000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },
   spwn_north_mine_entrance_crucass_1 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },
   spwn_white_erg_crucass_1 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },
   spwn_path_to_zak_crucass_1 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },
   spwn_path_to_zak_crucass_2 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },
   spwn_bughills_hornhog_1 = 
   {
      active = true,
      spawnDist = 10000,
      characterType = "kabarog.cfg",
      characterClass = "CKabarog",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },
   spwn_riverside_hornhog_1 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "kabarog.cfg",
      characterClass = "CKabarog",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },
   spwn_riverside_hornhog_2 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "kabarog.cfg",
      characterClass = "CKabarog",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },
   spwn_riverside_crucass_1 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },
   spwn_sinkhole_crucass_1 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },
   spwn_under_fort_bridge_crucass_1 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },
   spwn_under_fort_bridge_bitebug_1 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      spawnCountMax = 5,
      aliveCountMax = 5,
   },
   spwn_upper_wade_crucass_1 =
   {
      active = true,
      spawnDist = 10000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },
   spwn_riverside_weak_hornhog =
   {
      active = true,
      spawnDist = 10000,
      characterType = "kabarog.cfg",
      characterClass = "CKabarogWeak",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },
   spwn_riverside_highwayman_1 =
   {
      active = true,
      spawnDist = 9000,
      lootItems = { ["revolver_ammo.itm"] = 15,
         ["antigravium_shards.itm"] = 6,
         ["ktharsian_aloe.itm"] = 4, },
      weapons = { "revolver.gun", },
      styles = { "bandit_gunslinger_2", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit gunslinger",
   },
   spwn_riverside_highwayman_2 =
   {
      active = true,
      spawnDist = 9000,
      lootItems = { ["revolver_ammo.itm"] = 6,
         ["antigravium_shards.itm"] = 8,
         ["ktharsian_aloe.itm"] = 4, },
      weapons = { "revolver.gun", },
      styles = { "bandit_gunslinger_3", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit gunslinger",
   },
   spwn_riverside_highwayman_3 =
   {
      active = true,
      spawnDist = 9000,
      lootItems = { ["revolver_ammo.itm"] = 15,
         ["beer.itm"] = 1,
         ["neurochip.itm"] = 1, },
      weapons = { "revolver.gun", },
      styles = { "bandit_gunslinger_4", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Bandit gunslinger",
   },
   spwn_plateau_scout_1 =
   {
      active = true,
      spawnDist = 9000,
      lootItems = { ["22_ammo.itm"] = 3,
         ["antigravium_shards.itm"] = 8,
         ["booze.itm"] = 1,
         ["meat.itm"] = 2, },
      weapons = { "scamp_22.gun", },
      styles = { "stone_heads_scout_1_bandit", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Stone Heads scout",
   },
   spwn_plateau_scout_2 =
   {
      active = true,
      spawnDist = 9000,
      lootItems = { ["revolver_ammo.itm"] = 6,
         ["antigravium_shards.itm"] = 2,
         ["melon.itm"] = 3, },
      weapons = { "revolver.gun", },
      styles = { "stone_heads_scout_2_bandit", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Stone Heads scout",
   },
   spwn_plateau_scout_3 =
   {
      active = true,
      spawnDist = 9000,
      lootItems = { ["22_ammo.itm"] = 3,
         ["ktharsian_aloe.itm"] = 3, },
      weapons = { "scamp_22.gun", },
      styles = { "stone_heads_scout_1_bandit", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Stone Heads scout",
   },
   spwn_plateau_scout_4 =
   {
      active = true,
      spawnDist = 9000,
      lootItems = { ["revolver_ammo.itm"] = 2,
         ["meat.itm"] = 3, },
      weapons = { "revolver.gun", },
      styles = { "stone_heads_scout_2_bandit", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Stone Heads scout",
   },
   spwn_stoneheads_cave_1 =
   {
      active = true,
      spawnDist = 9000,
      zoneSize = 3,
      lootItems = { ["shotgun_ammo.itm"] = 8,
         ["antigravium_shards.itm"] = 4,
         ["melon.itm"] = 5, },
      weapons = { "shotgun.gun", },
      styles = { "stone_heads_warrior_2_bandit", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Stone Heads warrior",
   },
   spwn_stoneheads_cave_2 =
   {
      active = true,
      spawnDist = 9000,
      zoneSize = 3,
      lootItems = { ["shotgun_ammo.itm"] = 7,
         ["ktharsian_aloe.itm"] = 2, },
      weapons = { "shotgun.gun", },
      styles = { "stone_heads_warrior_1_bandit", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Stone Heads warrior",
   },
   spwn_wild_escaped_convict_1 =
   {
      active = true,
      spawnDist = 9000,
      zoneSize = 2,
      lootItems = { ["booze.itm"] = 1,
         ["rotten_meat.itm"] = 2, },
      weapons = { "axe.wpn", },
      styles = { "mad_bandit_4", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Escaped convict",
   },
   spwn_wild_escaped_convict_2 =
   {
      active = true,
      spawnDist = 9000,
      zoneSize = 2,
      lootItems = { ["revolver_ammo.itm"] = 9,
         ["meat.itm"] = 1, },
      weapons = { "revolver.gun", },
      styles = { "mad_bandit_2", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Escaped convict",
   },
   spwn_wild_escaped_convict_3 =
   {
      active = true,
      spawnDist = 9000,
      zoneSize = 2,
      lootItems = { ["bug_dead.itm"] = 3,
         ["antigravium_shards.itm"] = 8, },
      weapons = { "cleaver.wpn", },
      styles = { "mad_bandit_1", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Escaped convict",
   },
   spwn_old_mine_bandit_1 =
   {
      active = true,
      spawnDist = 7000,
      lootItems = { ["scrap_mechanical.itm"] = 2,
         ["meat.itm"] = 1, },
      weapons = { "abori_bat.wpn", },
      styles = { "mad_bandit_4", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Old mine bandit",
   },
   spwn_old_mine_bandit_2 =
   {
      active = true,
      spawnDist = 7000,
      lootItems = { ["scrap_electric.itm"] = 2,
         ["ktharsian_aloe.itm"] = 1, },
      weapons = { "shovel.wpn", },
      styles = { "mad_bandit_2", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Old mine bandit",
   },
   spwn_old_mine_bandit_3 =
   {
      active = true,
      spawnDist = 15000,
      zoneSize = 1,
      lootItems = { ["22_ammo.itm"] = 4,
         ["antigravium_shards.itm"] = 16, },
      weapons = { "scamp_22.gun", },
      styles = { "bandit_sharpshooter_4", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Old mine bandit",
   },

   spwn_old_mine_bandit_4 =
   {
      active = true,
      spawnDist = 15000,
      zoneSize = 1,
      lootItems = { ["shotgun_ammo.itm"] = 7,
         ["antigravium_shards.itm"] = 8, },
      weapons = { "shotgun.gun", },
      styles = { "bandit_sharpshooter_2", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Old mine bandit",
   },
   slaver_01 =
   {
      active = true,
      spawnDist = 4000,
      zoneSize = 102,
      lootItems = { ["22_ammo.itm"] = 8,
         ["antigravium_shards.itm"] = 49,
         ["farmer_1_pants.itm"] = 1, },
      weapons = { "scamp_22.gun", },
      styles = { "slaver_01", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Slaver",
   },
   slaver_02 = 
   {
      active = true,
      spawnDist = 4000,
      zoneSize = 102,
      lootItems = { ["antigravium_shards.itm"] = 17,
         ["farmer_1_hat.itm"] = 1, },
      weapons = { "shovel.wpn", },
      styles = { "slaver_02", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Slaver",
   },
   slaver_03 = 
   {
      active = true,
      spawnDist = 4000,
      zoneSize = 102,
      lootItems = { ["bluethorn_leaf.itm"] = 1,
         ["fried_bug.itm"] = 1, },
      weapons = { "good_cleaver.tmpl", },
      styles = { "slaver_03", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Slaver",
   },
   slaver_04 = 
   {
      active = true,
      spawnDist = 4000,
      zoneSize = 1,
      lootItems = { ["can_mixture"] = 1, },
      weapons = { "good_abori_knife.tmpl", },
      styles = { "slaver_04", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Slaver",
   },
   slaver_05 = 
   {
      active = true,
      spawnDist = 4000,
      zoneSize = 1,
      lootItems = { ["morbid_green.itm"] = 1,
         ["fried_meat.itm"] = 1, },
      weapons = { "machete.wpn", },
      styles = { "slaver_05", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Slaver",
   },
   slaver_06 = 
   {
      active = true,
      spawnDist = 4000,
      zoneSize = 1,
      lootItems = { ["booze.itm"] = 1,
         ["beer.itm"] = 1,
         ["revolver_ammo.itm"] = 10, },
      weapons = { "revolver.gun", },
      styles = { "slaver_06", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Slaver",
   },
   slaver_07 = 
   {
      active = true,
      spawnDist = 4000,
      zoneSize = 1,
      lootItems = { ["slime_meat.itm"] = 2,
         ["melon.itm"] = 1,
         ["revolver_ammo.itm"] = 4, },
      weapons = { "revolver.gun", },
      styles = { "slaver_07", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Slaver",
   },
   slaver_08 = 
   {
      active = true,
      spawnDist = 4000,
      zoneSize = 1,
      lootItems = { ["slime_meat.itm"] = 2,
         ["melon.itm"] = 1,
         ["revolver_ammo.itm"] = 4, },
      weapons = { "revolver.gun", },
      styles = { "slaver_08", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      patrolAllowed = true,
      patrolLoop = true,
      patrolPoints = "SCB8_1,SCB8_2,SCB8_3,SCB8_4,SCB8_5,SCB8_6,SCB8_1,SCB8_3,SCB8_4,SCB8_6,SCB8_5,SCB8_4,SCB8_3,SCB8_2",
      customLabel = "Slaver",
   },
   slaver_09 = 
   {
      active = true,
      spawnDist = 4000,
      zoneSize = 1,
      lootItems = { ["meat.itm"] = 4,
         ["melon.itm"] = 1,
         ["revolver_ammo.itm"] = 4, },
      weapons = { "good_machete.tmpl", },
      styles = { "slaver_09", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Slaver",
   },
   slaver_10 = 
   {
      active = true,
      spawnDist = 4000,
      zoneSize = 1,
      lootItems = { ["ktharsian_aloe.itm"] = 2,
         ["fried_meat.itm"] = 4,
         ["fried_bug.itm"] = 2, },
      weapons = { "good_machete.tmpl", },
      styles = { "slaver_10", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Slaver",
   },
   slaver_11 = 
   {
      active = true,
      spawnDist = 4000,
      zoneSize = 1,
      lootItems = { ["joint.itm"] = 3,
         ["fried_meat.itm"] = 2,
         ["fried_bug.itm"] = 3, },
      weapons = { "good_machete.tmpl", },
      styles = { "slaver_11", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Slaver",
   },
   slaver_12 = 
   {
      active = true,
      spawnDist = 4000,
      zoneSize = 1,
      lootItems = { ["howdah_ammo.itm"] = 3,
         ["shotgun_ammo.itm"] = 9,
         ["joint.itm"] = 1, },
      weapons = { "good_shotgun_2.tmpl", },
      styles = { "slaver_12", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      patrolAllowed = true,
      patrolLoop = true,
      patrolPoints = "SCB12_1,SCB12_2,SCB12_3,SCB12_4,SCB12_5,SCB12_6,SCB12_7,SCB12_8,SCB12_9,SCB12_10,SCB12_11,SCB12_12,SCB12_13,SCB12_8,SCB12_7,SCB12_6,SCB12_5,SCB12_4,SCB12_3,SCB12_2",
      customLabel = "Slaver",
   },
   slaver_13 = 
   {
      active = true,
      spawnDist = 4000,
      zoneSize = 1,
      lootItems = { ["bug_dead.itm"] = 4,
         ["shotgun_ammo.itm"] = 2,
         ["lemonade_wade_code.itm"] = 1,
         ["lemonade_wade_bug_message.itm"] = 1,
         ["bug_poison.itm"] = 1,
         ["horn.itm"] = 3, },
      weapons = { "good_abori_axe.tmpl", },
      styles = { "slaver_13", },
      characterType = "human_male.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Slaver",
   },
   spwn_altar_mad_shaman =
   {
      active = true,
      spawnDist = 11000,
      zoneSize = 1,
      lootItems = { ["cannibal_spoon.wpn"] = 1,
         ["meat.itm"] = 1,
         ["antigravium_shards.itm"] = 6,},
      weapons = { "abori_knife.wpn", },
      styles = { "mad_shaman", },
      characterType = "abori.cfg",
      characterClass = "CBandit",
      spawnCountMax = 1,
      aliveCountMax = 1,
      customLabel = "Mad shaman",
   },
   spwn_canyon_bed_crucass_01 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 3,
      aliveCountMax = 3,
   },
   spwn_canyon_bed_crucass_02 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },
   spwn_canyon_bed_crucass_03 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },
   spwn_canyon_bed_crucass_04 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },
   spwn_canyon_bed_crucass_05 =
   {
      active = true,
      spawnDist = 1000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },

   spwn_canyon_bed_crucass_06 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },
   spwn_canyon_bed_crucass_07 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },
   spwn_canyon_bed_crucass_08 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },
   spwn_canyon_bed_crucass_09 =
   {
      active = true,
      spawnDist = 1000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },
   spwn_canyon_bed_crucass_10 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "crucas.cfg",
      characterClass = "CCrucas",
      spawnCountMax = 1,
      aliveCountMax = 1,
   },
   spwn_canyon_bed_crucass_weak_01 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },
   spwn_canyon_bed_crucass_weak_02 =
   {
      active = true,
      spawnDist = 13000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 4,
      aliveCountMax = 4,
   },
   spwn_canyon_bed_crucass_weak_03 =
   {
      active = true,
      spawnDist = 13000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 3,
      aliveCountMax = 3,
   },
   spwn_canyon_bed_crucass_weak_04 =
   {
      active = true,
      spawnDist = 5000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },
   spwn_canyon_bed_crucass_weak_05 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },
   spwn_canyon_bed_crucass_weak_06 =
   {
      active = true,
      spawnDist = 15000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 4,
      aliveCountMax = 4,
   },
   spwn_canyon_bed_crucass_weak_07 =
   {
      active = true,
      spawnDist = 3000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },
   spwn_canyon_bed_crucass_weak_08 =
   {
      active = true,
      spawnDist = 13000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 3,
      aliveCountMax = 3,
   },
   spwn_canyon_bed_crucass_weak_09 =
   {
      active = true,
      spawnDist = 5000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 3,
      aliveCountMax = 3,
   },
   spwn_canyon_bed_crucass_weak_10 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 4,
      aliveCountMax = 4,
   },
   spwn_canyon_bed_crucass_weak_11 =
   {
      active = true,
      spawnDist = 7000,
      characterType = "crucas.cfg",
      characterClass = "CCrucasWeak",
      spawnCountMax = 2,
      aliveCountMax = 2,
   },
   spwn_canyon_bed_bug_big_hill =
   {
      active = true,
      spawnDist = 10000,
      characterType = "killerbug.cfg",
      characterClass = "CBug",
      feelRadiusCutoff = 500,
      zoneSize = 4,
      spawnCountMax = 6,
      aliveCountMax = 6,
   },
}

return spawnList
