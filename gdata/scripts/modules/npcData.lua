 -- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["Arphant_3"] = {
		["moveAnimation"] = "walk";
		["orientateSpeed"] = 20;
		["patrolPoints"] = "w5,w6,w1,w2,w3,w4,";
		["patrolSpeed"] = 100;
		["turnLeftAnim"] = "turn_left";
		["turnRightAnim"] = "turn_right";
	};
	["Arphant_4"] = {
		["moveAnimation"] = "walk";
		["orientateSpeed"] = 20;
		["patrolPoints"] = "w1,w2,w3,w4,w5,w6";
		["patrolSpeed"] = 100;
		["turnLeftAnim"] = "turn_left";
		["turnRightAnim"] = "turn_right";
	};
	["Arphant_5"] = {
		["moveAnimation"] = "walk";
		["orientateSpeed"] = 20.6;
		["patrolPoints"] = "w2,w3,w4,w5,w6,w1";
		["patrolSpeed"] = 100;
		["turnLeftAnim"] = "turn_left";
		["turnRightAnim"] = "turn_right";
	};
	["Worker_6"] = {
		["dialog"] = "default_worker_1";
		["style"] = "abori_worker_1";
	};
	["Character_122"] = {
		["dialog"] = "default";
		["style"] = "barnie";
	};
	["Drunk_Abori_Worker_1"] = {
		["defaultAnimation"] = "sleep_2";
		["dialog"] = "drunk_abori_worker";
		["orientateToPlayer"] = false;
		["style"] = "abori_worker_1";
	};
	["Drunk_Abori_Worker_2"] = {
		["defaultAnimation"] = "sleep_3";
		["dialog"] = "drunk_abori_worker";
		["orientateToPlayer"] = false;
		["style"] = "abori_worker_2";
	};
	["Drunk_Abori_Worker_3"] = {
		["defaultAnimation"] = "sleep_3";
		["dialog"] = "drunk_abori_worker";
		["orientateToPlayer"] = false;
		["style"] = "abori_worker_3";
	};
	["Drunk_Abori_Worker_4"] = {
		["defaultAnimation"] = "sleep_3";
		["dialog"] = "drunk_abori_worker";
		["orientateToPlayer"] = false;
		["style"] = "abori_worker_2";
	};
	["Drunk_Abori_Worker_5"] = {
		["defaultAnimation"] = "sleep_3";
		["dialog"] = "drunk_abori_worker";
		["orientateToPlayer"] = false;
		["style"] = "abori_worker_3";
	};
	["Dying_Abori_Worker_1"] = {
		["defaultAnimation"] = "sleep";
		["dialog"] = "dying_abori_worker";
		["orientateToPlayer"] = false;
		["style"] = "abori_worker_wounded_2";
	};
	["Mercenary_1"] = {
		["defaultAnimation"] = "idle_shotgun";
		["dialog"] = "default_merc_1";
		["style"] = "drago";
	};
	["Mercenary_2"] = {
		["defaultAnimation"] = "idle_shotgun";
		["dialog"] = "default_merc_1";
		["style"] = "barnie";
	};
	["Worker_1"] = {
		["dialog"] = "default_worker_1";
		["style"] = "abori_worker_1";
	};
	["Worker_2"] = {
		["dialog"] = "default_worker_1";
		["style"] = "abori_worker_2";
	};
	["Worker_3"] = {
		["dialog"] = "default_worker_1";
		["style"] = "abori_worker_3";
	};
	["Worker_4"] = {
		["dialog"] = "default_worker_1";
		["style"] = "abori_worker_1";
	};
	["Worker_5"] = {
		["dialog"] = "default_worker_1";
		["style"] = "abori_worker_2";
	};
	["Wounded_Abori_Worker_1"] = {
		["defaultAnimation"] = "sleep_2";
		["dialog"] = "wounded_abori_worker";
		["orientateToPlayer"] = false;
		["style"] = "abori_worker_wounded_1";
	};
	["abori_prisoner"] = {
		["dialog"] = "default_stone_heads_1";
	};
	["angry_jag"] = {
	};
	["angry_outcast"] = {
		["dialog"] = "default_outcast_1";
		["style"] = "abori_outcast_5";
	};
	["another_guard"] = {
		["dialog"] = "default";
		["style"] = "barnie";
	};
	["arphant_1"] = {
	};
	["arphant_2"] = {
	};
	["arphant_molly"] = {
		["dialog"] = "molly";
		["patrolPoints"] = "wp_molly_1,wp_molly_2";
	};
	["barnie"] = {
		["defaultAnimation"] = "idle_shotgun_2";
	};
	["big_hat"] = {
		["dialog"] = "big_hat_outcast";
	};
	["bjorn"] = {
		["defaultAnimation"] = "idle_shotgun";
		["style"] = "drago";
	};
	["caravaneer"] = {
	};
	["castor"] = {
	};
	["croaker"] = {
		["defaultAnimation"] = "idle_pot";
		["dialog"] = "default_slave_1";
		["orientateToPlayer"] = false;
	};
	["depressed_worker"] = {
		["dialog"] = "depressed_abori";
		["style"] = "abori_worker_3";
	};
	["dikson"] = {
		["dialog"] = "default_merc_1";
	};
	["drago"] = {
		["defaultAnimation"] = "idle_shotgun";
		["dialogInitiator"] = true;
		["dialogInitiatorDist"] = 500;
	};
	["eli"] = {
	};
	["fort_worker_1"] = {
		["style"] = "abori_worker_1";
	};
	["fort_worker_2"] = {
		["style"] = "abori_worker_3";
	};
	["fort_worker_3"] = {
		["style"] = "abori_worker_2";
	};
	["fort_worker_4"] = {
		["defaultAnimation"] = "sleep_3";
		["orientateToPlayer"] = false;
		["style"] = "abori_worker_3";
	};
	["frank"] = {
		["dialog"] = "default_merc_1";
	};
	["grave_digger_1"] = {
		["dialog"] = "grave_digger";
		["style"] = "abori_worker_1";
	};
	["grave_digger_2"] = {
		["dialog"] = "grave_digger";
		["style"] = "abori_worker_2";
	};
	["guard"] = {
		["dialog"] = "passage_guard";
		["style"] = "barnie";
	};
	["guard_4"] = {
		["defaultAnimation"] = "idle_1h_weapon";
		["dialog"] = "outcast_guard";
	};
	["john"] = {
		["defaultAnimation"] = "idle_shotgun";
		["dialogInitiator"] = true;
		["dialogInitiatorDist"] = 500;
	};
	["jorgen"] = {
		["defaultAnimation"] = "idle_shotgun";
		["dialog"] = "default_merc_1";
	};
	["junior"] = {
		["dialog"] = "default_merc_1";
	};
	["kampa"] = {
		["defaultAnimation"] = "sleep_3";
		["dialog"] = "default_slave_1";
		["orientateToPlayer"] = false;
	};
	["kenneth"] = {
	};
	["kwagga"] = {
	};
	["leon"] = {
		["defaultAnimation"] = "idle_shotgun";
		["dialog"] = "default_merc_1";
		["style"] = "barnie";
	};
	["pale"] = {
		["dialog"] = "pale";
	};
	["pales_follower_1"] = {
		["customLabel"] = "Pale's Follower";
		["dialog"] = "pales_follower";
		["defaultAnimation"] = "sit_pray_1";
		["style"] = "pales_follower_1";
	};
	["pales_follower_2"] = {
		["customLabel"] = "Pale's Follower";
		["dialog"] = "pales_follower";
		["defaultAnimation"] = "sit_pray_2";
		["style"] = "pales_follower_2";
	};
	["pales_follower_3"] = {
		["customLabel"] = "Pale's Follower";
		["dialog"] = "pales_follower";
		["defaultAnimation"] = "sit_pray_1";
		["style"] = "pales_follower_3";
	};
	["pales_follower_4"] = {
		["customLabel"] = "Pale's Follower";
		["dialog"] = "pales_follower";
		["defaultAnimation"] = "sit_pray_2";
		["style"] = "pales_follower_4";
	};
	["pales_follower_5"] = {
		["customLabel"] = "Pale's Follower";
		["dialog"] = "pales_follower";
		["defaultAnimation"] = "sit_pray_1";
		["style"] = "pales_follower_5";
	};
	["marik"] = {
	};
	["mason"] = {
		["dialog"] = "default_worker_1";
	};
	["master_phil"] = {
	};
	["mister_green"] = {
		["defaultAnimation"] = "idle_pot";
		["orientateToPlayer"] = false;
	};
	["msasi"] = {
	};
	["mute"] = {
	};
	["nab"] = {
		["defaultAnimation"] = "idle_1h_weapon";
		["dialog"] = "default_slave_1";
	};
	["obai"] = {
		["defaultAnimation"] = "sleep_3";
		["orientateToPlayer"] = false;
	};
	["observer"] = {
		["dialog"] = "default_merc_1";
		["style"] = "drago";
	};
	["old_mug"] = {
	};
	["ouga"] = {
		["dialog"] = "default_slave_1";
	};
	["outcast_1"] = {
		["defaultAnimation"] = "sleep_3";
		["dialog"] = "default_outcast_1";
		["orientateToPlayer"] = false;
	};
	["outcast_2"] = {
		["defaultAnimation"] = "sleep_3";
		["dialog"] = "default_outcast_1";
		["orientateToPlayer"] = false;
		["style"] = "abori_outcast_1";
	};
	["outcast_3"] = {
		["dialog"] = "default_outcast_1";
		["style"] = "abori_outcast_5";
	};
	["outcast_4"] = {
		["defaultAnimation"] = "dl_talk_1";
		["dialog"] = "default_outcast_1";
		["orientateToPlayer"] = false;
		["style"] = "abori_outcast_2";
	};
	["outcast_5"] = {
		["defaultAnimation"] = "search";
		["dialog"] = "default_outcast_1";
		["orientateToPlayer"] = false;
		["style"] = "abori_outcast_1";
	};
	["outcast_6"] = {
		["moveAnimation"] = "walk_front";
		["dialog"] = "default_outcast_1";
		["orientateSpeed"] = 20;
		["patrolPoints"] = "BH1,BH2,BH3,BH4,BH2,";
		["patrolSpeed"] = 50;
		["patrolLoop"] = true;
		["turnLeftAnim"] = "turn_left";
		["turnRightAnim"] = "turn_right";
		["style"] = "abori_outcast_4";
	};
	["outcast_7"] = {
		["defaultAnimation"] = "sleep_3";
		["dialog"] = "default_outcast_1";
		["orientateToPlayer"] = false;
		["style"] = "abori_outcast_3";
	};
	["outcast_8"] = {
		["defaultAnimation"] = "kneel_pistol";
		["dialog"] = "default_outcast_1";
		["orientateToPlayer"] = false;
		["style"] = "abori_outcast_10";
	};
        ["outcast_9"] = {
		["defaultAnimation"] = "kneel_pistol";
		["dialog"] = "default_outcast_1";
		["orientateToPlayer"] = false;
		["style"] = "abori_outcast_11";
	};
        ["outcast_10"] = {
		["defaultAnimation"] = "collect_idle";
		["dialog"] = "default_outcast_1";
		["orientateToPlayer"] = false;
		["style"] = "abori_outcast_12";
	};
        ["outcast_11"] = {
		["defaultAnimation"] = "sleep_3";
		["dialog"] = "default_outcast_1";
		["orientateToPlayer"] = false;
		["style"] = "abori_outcast_5";
	};
        ["outcast_12"] = {
		["dialog"] = "default_outcast_1";
		["style"] = "abori_outcast_13";
	};
        ["outcast_13"] = {
		["dialog"] = "default_outcast_1";
		["style"] = "abori_outcast_14";
	};
        ["outcast_14"] = {
		["dialog"] = "default_outcast_1";
		["style"] = "abori_outcast_15";
	};
        ["outcast_15"] = {
		["dialog"] = "default_outcast_1";
		["style"] = "abori_outcast_4";
	};
        ["outcast_16"] = {
                ["defaultAnimation"] = "idle_look";
		["dialog"] = "default_outcast_1";
		["orientateToPlayer"] = false;
		["style"] = "abori_outcast_16";
	};
        ["outcast_17"] = {
		["dialog"] = "default_outcast_1";
		["style"] = "abori_outcast_farmer";
	};
        ["outcast_18"] = {
		["dialog"] = "default_outcast_1";
		["style"] = "abori_outcast_17";
	};
        ["outcast_19"] = {
                ["defaultAnimation"] = "idle_cintooch";
		["dialog"] = "default_outcast_1";
		["orientateToPlayer"] = false;
		["style"] = "abori_outcast_18";
	};
        ["outcast_20"] = {
		["dialog"] = "default_outcast_1";
		["style"] = "abori_outcast_15";
	};
        ["outcast_farmer"] = {
                ["defaultAnimation"] = "collect_sit_1";
		["dialog"] = "default_outcast_1";
                ["orientateToPlayer"] = false;
		["style"] = "abori_outcast_farmer";
	};
	["outcast_guard_1"] = {
		["defaultAnimation"] = "idle_1h_weapon";
		["dialog"] = "outcast_guard";
	};
	["outcast_guard_2"] = {
		["defaultAnimation"] = "idle_1h_weapon";
		["dialog"] = "outcast_guard";
	};
	["outcast_guard_3"] = {
		["defaultAnimation"] = "idle_1h_weapon";
		["dialog"] = "outcast_guard";
	};
	["outcast_guard_4"] = {
		["defaultAnimation"] = "idle_1h_weapon";
		["dialog"] = "outcast_guard";
		["style"] = "outcast_guard_3";
	};
	["outcast_guard_5"] = {
		["defaultAnimation"] = "idle_1h_weapon";
		["dialog"] = "outcast_guard";
		["style"] = "outcast_guard_2";
	};
	["outcast_guard_6"] = {
		["defaultAnimation"] = "idle_armcross";
		["dialog"] = "outcast_guard";
		["style"] = "outcast_guard_3_noweapon";
	};
        ["outcast_guard_7"] = {
		["defaultAnimation"] = "idle_1h_weapon";
		["dialog"] = "outcast_guard";
		["style"] = "outcast_guard_1";
	};
        ["outcast_guard_8"] = {
		["defaultAnimation"] = "idle_1h_weapon";
		["dialog"] = "outcast_guard";
		["style"] = "outcast_guard_4";
	};
        ["outcast_guard_9"] = {
		["defaultAnimation"] = "idle_1h_weapon";
		["dialog"] = "outcast_guard";
		["style"] = "outcast_guard_3";
	};
        ["outcast_guard_10"] = {
		["defaultAnimation"] = "sleep_3";
                ["orientateToPlayer"] = false;
		["dialog"] = "outcast_guard";
		["style"] = "outcast_guard_3_noweapon";
	};
        ["outcast_guard_11"] = {
                ["defaultAnimation"] = "sleep";
                ["orientateToPlayer"] = false;
                ["dialog"] = "outcast_guard";
                ["style"] = "outcast_guard_1_noweapon";
        };
        ["outcast_guard_12"] = {
                ["dialog"] = "outcast_guard";
                ["style"] = "outcast_guard_5";
        };
        ["outcast_guard_13"] = {
                ["dialog"] = "outcast_guard";
                ["style"] = "abori_outcast_8";
        };
	["outcast_hunter"] = {
		["dialog"] = "default_outcast_1";
		["style"] = "abori_outcast_hunter";
	};
	["paga"] = {
		["defaultAnimation"] = "sleep";
		["orientateToPlayer"] = false;
	};
	["q_angrybugs_bandit_1"] = {
		["style"] = "scalphunter_1";
		["customLabel"] = "Scalphunter";
		["weaponList"] = "scamp_22.gun";
	};
	["q_angrybugs_bandit_2"] = {
		["style"] = "scalphunter_2";
		["customLabel"] = "Scalphunter";
		["weaponList"] = "scamp_22.gun";
	};
	["q_angrybugs_bandit_3"] = {
		["style"] = "scalphunter_3";
		["customLabel"] = "Scalphunter";
		["weaponList"] = "scamp_22.gun";
	};
	["q_angrybugs_bandit_4"] = {
		["style"] = "scalphunter_4";
		["customLabel"] = "Scalphunter";
		["weaponList"] = "scamp_22.gun";
	};
	["q_angrybugs_bandit_5"] = {
		["style"] = "scalphunter_5";
		["customLabel"] = "Scalphunter";
		["weaponList"] = "scamp_22.gun";
	};
	["q_angrybugs_bandit_6"] = {
		["style"] = "scalphunter_6";
		["customLabel"] = "Scalphunter";
		["weaponList"] = "scamp_22.gun";
	};
	["q_angrybugs_bandit_7"] = {
		["style"] = "scalphunter_7";
		["customLabel"] = "Scalphunter";
		["weaponList"] = "scamp_22.gun";
	};
	["q_angrybugs_bandit_8"] = {
		["style"] = "scalphunter_8";
		["customLabel"] = "Scalphunter";
		["weaponList"] = "scamp_22.gun";
	};
	["q_angrybugs_bandit_9"] = {
		["style"] = "scalphunter_9";
		["customLabel"] = "Scalphunter";
		["weaponList"] = "scamp_22.gun";
	};
	["q_angrybugs_bandit_10"] = {
		["style"] = "scalphunter_10";
		["customLabel"] = "Scalphunter";
		["weaponList"] = "scamp_22.gun";
	};
	["q_my_clothes_bandit_1"] = {
		["tree"] = "ai.trees.npc";
		["dialog"] = "outcast_looters";
		["customLabel"] = "Outcast Looter 1";
		["lootItems"] = "antigravium_shards.itm,3,booze.itm,cloth.itm";
		["attitudeToMainCharacter"] = "NEUTRAL";
		["defaultAnimation"] = "search";
	};
	["q_my_clothes_bandit_2"] = {
		["tree"] = "ai.trees.npc";
		["dialog"] = "outcast_looters";
		["customLabel"] = "Outcast Looter 2";
		["lootItems"] = "antigravium_shards.itm,5, melon.itm,cloth.itm";
		["dialogActors"] = "q_my_clothes_bandit_1,q_my_clothes_bandit_2";
		["attitudeToMainCharacter"] = "NEUTRAL";
		["defaultAnimation"] = "search";
	};
	["q_my_clothes_bandit_3"] = {
		["tree"] = "ai.trees.npc";
		["customLabel"] = "Outcast Looter 3";
		["lootItems"] = "antigravium_shards.itm,25";
		["attitudeToMainCharacter"] = "NEUTRAL";
	};
	["scarecrow"] = {
		["dialog"] = "scarecrow";
		["customLabel"] = "The Scarecrow";
		["tree"] = "ai.trees.npc";
		["attitudeToMainCharacter"] = "NEUTRAL";
		["immortality"] = "protected";
		["defaultLoot"] = false;
		["patrolLoop"] = true;
		["dialogInitiator"] = true;
		["patrolPoints"] = "SCARECR_1,SCARECR_2,SCARECR_3,SCARECR_4,SCARECR_5";
		["weaponList"] = "kabarog_hsg.gun",
		["lootItems"] = "cleaver.wpn,token_scarecrow.itm,shotgun_ammo.itm,3,howdah_ammo.itm,14,rotten_meat.itm,2,melon.itm,3,scrap_mechanical.itm,5,"
	};
	["lemonade_wade"] = {
		["customLabel"] = "Lemonade Wade";
		["tree"] = "ai.trees.bandit";
		["attitudeToMainCharacter"] = "NEUTRAL";
		["weaponList"] = "shotgun.gun",
		["lootItems"] = "lemonade_wade_key.itm,shotgun_ammo.itm,9,howdah_ammo.itm,6,slime_meat.itm,emulsia.itm,2,scrap_electric.itm,3,firewood.itm,2,blood_root.itm,capsule_health.itm,"
	};
	["ragpicker"] = {
		["tree"] = "ai.trees.npc";
		["customLabel"] = "Ragpicker";
		["dialog"] = "ragpicker";
		["weaponList"] = "abori_knife.wpn";
		["guild"] = "GLD_NPC_FRIEND";
	};
	["repairer"] = {
		["dialog"] = "default";
		["style"] = "master_phil";
	};
	["ringo"] = {
		["defaultAnimation"] = "idle_shotgun";
		["dialog"] = "default_merc_1";
	};
	["sad_abori"] = {
		["style"] = "abori_worker_2";
	};
	["sandflea"] = {
		["dialog"] = "default_outcast_1";
	};
	["sick_outcast"] = {
		["defaultAnimation"] = "sleep_3";
		["dialog"] = "default_outcast_1";
		["orientateToPlayer"] = false;
	};
	["sick_outcast_1"] = {
		["defaultAnimation"] = "sleep_2";
		["dialog"] = "default_outcast_1";
		["orientateToPlayer"] = false;
		["style"] = "abori_outcast_1";
	};
	["sly"] = {
		["defaultAnimation"] = "idle_1h_weapon";
		["dialog"] = "default_stone_heads_1";
	};
	["stone_heads_scout_1"] = {
		["defaultAnimation"] = "idle_rifle";
		["dialog"] = "default_stone_heads_1";
	};
	["stone_heads_scout_2"] = {
		["defaultAnimation"] = "idle_rifle";
		["dialog"] = "default_stone_heads_1";
	};
	["stone_heads_trader"] = {
		["defaultAnimation"] = "sleep_3";
		["orientateToPlayer"] = false;
		["style"] = "abori_raider_2";
	};
	["stone_heads_warchief"] = {
		["dialog"] = "default_stone_heads_1";
	};
	["stone_heads_warrior_1"] = {
		["defaultAnimation"] = "idle_rifle";
		["dialog"] = "default_stone_heads_1";
	};
	["stone_heads_warrior_2"] = {
		["defaultAnimation"] = "idle_pistol";
		["dialog"] = "default_stone_heads_1";
	};
	["stone_heads_warrior_3"] = {
		["defaultAnimation"] = "idle_pistol";
		["dialog"] = "default_stone_heads_1";
	};
	["stone_heads_warrior_4"] = {
		["defaultAnimation"] = "idle_rifle";
		["dialog"] = "default_stone_heads_1";
	};
	["stone_heads_warrior_5"] = {
		["defaultAnimation"] = "idle_rifle";
		["dialog"] = "default_stone_heads_1";
	};
	["the_other_john"] = {
		["defaultAnimation"] = "idle_shotgun_2";
	};
	["tired_outcast"] = {
		["dialog"] = "default_outcast_1";
	};
	["twitchy_outcast"] = {
		["dialog"] = "default_outcast_1";
		["style"] = "abori_outcast_7";
	};
	["vasily"] = {
	};
	["vorga"] = {
		["dialogInitiator"] = true;
		["style"] = "msasi";
	};
	["waga_the_tumbleweed"] = {
		["defaultAnimation"] = "idle_bag_2h_weapon";
	};
	["wandering_merchant"] = {
		["defaultAnimation"] = "idle_bag_2h_weapon";
		["style"] = "abori_trader_1";
	};
	["watchman"] = {
		["defaultAnimation"] = "sleep_2";
		["style"] = "abori_outcast_8_noweapon";
	};
        ["watchman_1"] = {
                ["defaultAnimation"] = "idle_1h_weapon";
		["moveAnimation"] = "walk_front";
		["dialog"] = "outcast_guard";
		["orientateSpeed"] = 20;
		["patrolPoints"] = "WH1,WH2,WH3,WH4,WH2,WH3";
		["patrolSpeed"] = 50;
		["patrolLoop"] = true;
		["turnLeftAnim"] = "turn_left";
		["turnRightAnim"] = "turn_right";
		["style"] = "guard_4";
	};
	["wessley"] = {
		["dialog"] = "default_merc_1";
	};
	["zak"] = {
		["dialogInitiator"] = true;
	};
}

return obj1
