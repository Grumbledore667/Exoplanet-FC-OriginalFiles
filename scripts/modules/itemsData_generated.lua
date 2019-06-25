-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["22_ammo.itm"] = {
		["desc"] = {
			["eng"] = "Standard .22 pistol ammo.";
		};
		["icon"] = "22Ammo";
		["invCategory"] = "ammo";
		["label"] = {
			["eng"] = ".22 Ammo";
		};
		["value"] = 2;
	};
	["abori_axe.wpn"] = {
		["animations"] = "melee_low";
		["colliderLength"] = 20;
		["colliderOffset"] = true;
		["colliderRadius"] = 50;
		["damage"] = 45;
		["desc"] = {
			["eng"] = "Short and heavy aboriginal axe made of hard wood, scrap metal and animal fangs.";
		};
		["icon"] = "ColonialAxe";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Abori axe";
		};
		["model"] = "abori_axe.sbg";
		["sounds"] = {
			["activate"] = {
				[1] = {
					["distance"] = 2000;
					["name"] = "Play_abori_axe_swing";
				};
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_axe_equip";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_axe_unequip";
			};
		};
		["value"] = 35;
	};
	["abori_bat.wpn"] = {
		["animations"] = "melee_low";
		["colliderLength"] = 0;
		["colliderOffset"] = true;
		["colliderRadius"] = 100;
		["damage"] = 40;
		["desc"] = {
			["eng"] = "One of the most terrifying aboriginal weapons - a long sword made of scrap metal and some animal fangs.";
		};
		["icon"] = "ColonialBat";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Abori war sword";
		};
		["model"] = "abori_bat.sbg";
		["sounds"] = {
			["activate"] = {
				[1] = {
					["distance"] = 2000;
					["name"] = "Play_abori_bat_swing";
				};
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_bat_equip";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_bat_unequip";
			};
		};
		["value"] = 35;
	};
	["abori_gun_mortar.gun"] = {
		["animations"] = "shotgun";
		["cooldown"] = 2;
		["damage"] = 100;
		["desc"] = {
			["eng"] = "Crafted from the remains of a broken 8-gauge shotgun, this ugly short four barrelled thing makes good last ditch weapon for big game hunters or perfect room sweeper if you want. '4 barrels instead of 2: double your chances when shit hits the fan!'";
		};
		["icon"] = "Howdah";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Abori Mortar";
		};
		["model"] = "abori_gun_mortar.sbg";
		["reloadAnimations"] = "shotgun1";
		["sounds"] = {
			["activate"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_gun_mortar_fire";
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_gun_mortar_equip";
			};
			["inactive"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_gun_mortar_empty";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_gun_mortar_unequip";
			};
		};
		["value"] = 350;
	};
	["abori_gun_pistol.gun"] = {
		["animations"] = "pistol";
		["cooldown"] = 0.2;
		["damage"] = 15;
		["desc"] = {
			["eng"] = "Aboriginal weapon that accelerates sharp antigravium projectiles to supersonic speed. This version is shortened and has no shock. You cannot use it without special training.";
		};
		["icon"] = "AboriPistol";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Shard thrower";
		};
		["model"] = "abori_gun_pistol.sbg";
		["reloadAnimations"] = "pistol2";
		["sounds"] = {
			["activate"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_gun_pistol_fire";
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_gun_pistol_equip";
			};
			["inactive"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_gun_pistol_empty";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_gun_pistol_unequip";
			};
		};
		["value"] = 100;
	};
	["abori_gun_rifle.gun"] = {
		["animations"] = "shotgun";
		["cooldown"] = 2;
		["damage"] = 100;
		["desc"] = {
			["eng"] = "Aboriginal weapon that accelerates sharp antigravium projectiles to supersonic speed. This version is modified for long range combat. You cannot use it without special training.";
		};
		["icon"] = "AboriRifle";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Long shard thrower";
		};
		["model"] = "abori_gun_rifle.sbg";
		["reloadAnimations"] = "shotgun1";
		["sounds"] = {
			["activate"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_gun_rifle_fire";
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_gun_rifle_equip";
			};
			["inactive"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_gun_rifle_empty";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_gun_rifle_unequip";
			};
		};
		["value"] = 300;
	};
	["abori_knife.wpn"] = {
		["animations"] = "melee_low";
		["colliderLength"] = 20;
		["colliderOffset"] = true;
		["colliderRadius"] = 80;
		["damage"] = 35;
		["desc"] = {
			["eng"] = "Aboriginal knife made of scrap metal and hard wood. Perfect for cutting human throats in the night.";
		};
		["icon"] = "ColonialKnife";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Abori knife";
		};
		["model"] = "abori_knife.sbg";
		["sounds"] = {
			["activate"] = {
				[1] = {
					["distance"] = 2000;
					["name"] = "Play_abori_knife_swing";
				};
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_knife_equip";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_abori_knife_unequip";
			};
		};
		["value"] = 35;
	};
	["sledgehammer.wpn"] = {
		["animations"] = "melee_low";
		["colliderLength"] = 0;
		["colliderOffset"] = true;
		["colliderRadius"] = 80;
		["damage"] = 35;
		["desc"] = {
			["eng"] = "Long heavy duty hammer used for breaking rocks or bashing skulls in.";
		};
		["icon"] = "Sledgehammer";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Sledgehammer";
		};
		["model"] = "sledgehammer.sbg";
		["sounds"] = {
			["activate"] = {
				[1] = {
					["distance"] = 2000;
					["name"] = "Play_machete_swing";
				};
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_revolver_equip";
			};
		};
		["value"] = 100;
	};
	["absinthe.itm"] = {
		["attachInfo"] = {
			["pos"] = {
				["x"] = 0;
				["y"] = -28;
				["z"] = 0;
			};
		};
		["boozeInfo"] = "strong";
		["consumableType"] = "drink";
		["desc"] = {
			["eng"] = "Absinthe. Liquor that can set your insides on fire";
		};
		["foodInfo"] = {
			["health"] = 10;
		};
		["icon"] = "BottleAbsinth";
		["invCategory"] = "drink";
		["label"] = {
			["eng"] = "Absinthe";
		};
		["model"] = "bottle_absinth.sbg";
		["useEffects"] = {
			["alcoholBuff"] = {
				["duration"] = 120;
				["refresh"] = true;
				["statBonuses"] = {
					["staminaMaxFlat"] = 75;
					["waterRegenFlat"] = -15;
				};
			};
		};
		["value"] = 12;
	};
	["alien_cactus_bat.wpn"] = {
		["animations"] = "melee_low";
		["colliderLength"] = 0;
		["colliderOffset"] = true;
		["colliderRadius"] = 100;
		["damage"] = 20;
		["desc"] = {
			["eng"] = "A club made of poisonous cactus. The locals invented a brutal game, which involves two teams fighting with these clubs for a hornhog skull representing the ball. Deals additional poison damage but has low durability.'This is gonna hurt!'\
\
Poison damage: 30 over 5 seconds";
		};
		["icon"] = "AlienCactusBat";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Cactus bat";
		};
		["model"] = "alien_cactus_bat.sbg";
		["sounds"] = {
			["activate"] = {
				[1] = {
					["distance"] = 2000;
					["name"] = "Play_alien_cactus_bat_swing";
				};
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_alien_cactus_bat_equip";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_alien_cactus_bat_unequip";
			};
		};
		["value"] = 10;
	};
	["antigravium.itm"] = {
		["desc"] = {
			["eng"] = "Large and pure antigravium crystal. Being worthy a small fortune in Core Worlds, on the K'Tharsis it is a common thing which probably will buy you a couple of good meals.";
		};
		["icon"] = "Antigravium";
		["invCategory"] = "misc";
		["label"] = {
			["eng"] = "Antigravium crystal";
		};
		["value"] = 250;
	};
	["antigravium_bait.itm"] = {
		["desc"] = {
			["eng"] = "Large and pure antigravium crystal covered in sticky desert melon juice.";
		};
		["icon"] = "AntigravBait";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Antigravium bait";
		};
		["questItem"] = true;
		["value"] = 10;
	};
	["antigravium_shards.itm"] = {
		["desc"] = {
			["eng"] = "Local currency on the planet K'Tharsis. Also called 'shinies' or 'greens'. Most precious things, but not as your life";
		};
		["icon"] = "AntigraviumShards";
		["invCategory"] = "misc";
		["label"] = {
			["eng"] = "Antigravium shards";
		};
		["value"] = 1;
	};
	["arphant_dung.itm"] = {
		["desc"] = {
			["eng"] = "This fragrant substance contains many partially digested weeds.";
		};
		["icon"] = "ArphantDung";
		["invCategory"] = "misc";
		["label"] = {
			["eng"] = "Arphant Dung";
		};
		["value"] = 0;
	};
	["arphant_tranquilizer_weed.itm"] = {
		["desc"] = {
			["eng"] = "Supposed to calm and make arphants obey if fed to them.";
		};
		["icon"] = "ArphantTranquilizerWeed";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Arphant Tranquilizer Weed";
		};
		["value"] = 250;
	};
	["axe.wpn"] = {
		["animations"] = "melee_low";
		["colliderLength"] = 20;
		["colliderOffset"] = true;
		["colliderRadius"] = 50;
		["damage"] = 50;
		["desc"] = {
			["eng"] = "Made of high carbon stainless steel and light polymer this axe was imported as a part of colonial survival kit. Also perfectly fits for throwing at people and crushing their skulls. 'Chingachgook would be jealous'";
		};
		["icon"] = "Axe";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Colonial hatchet";
		};
		["model"] = "axe.sbg";
		["sounds"] = {
			["activate"] = {
				[1] = {
					["distance"] = 2000;
					["name"] = "Play_axe_swing";
				};
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_axe_equip";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_axe_unequip";
			};
		};
		["value"] = 35;
	};
	["bag_hat.itm"] = {
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "Make two holes in a bag, and you've got yourself a perfect desert raider's mask! It won't protect you from headshots though.";
		};
		["equipable"] = true;
		["icon"] = "BagHat";
		["invCategory"] = "accessory";
		["isFaceCover"] = true;
		["label"] = {
			["eng"] = "Bag Hat";
		};
		["meshes"] = "bag_hat";
		["value"] = 20;
	};
	["bandana_black.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "bandana_1.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "mask";
		["desc"] = {
			["eng"] = "A black bandana with skeleton jaws print.";
		};
		["equipable"] = true;
		["icon"] = "BandanaBlack";
		["invCategory"] = "accessory";
		["isFaceCover"] = true;
		["label"] = {
			["eng"] = "Black Bandana";
		};
		["value"] = 50;
	};
	["bandana_grey.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "bandana_1.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
				["texture"] = "bandana_dif_2.dds";
			};
		};
		["attireType"] = "mask";
		["desc"] = {
			["eng"] = "A grey bandana with bloody vampire teeth print.";
		};
		["equipable"] = true;
		["icon"] = "BandanaGrey";
		["invCategory"] = "accessory";
		["isFaceCover"] = true;
		["label"] = {
			["eng"] = "Grey Bandana";
		};
		["value"] = 50;
	};
	["bandana_red.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "bandana_1.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
				["texture"] = "bandana_dif_3.dds";
			};
		};
		["attireType"] = "mask";
		["desc"] = {
			["eng"] = "A red bandana from patterned fabric.";
		};
		["equipable"] = true;
		["icon"] = "BandanaRed";
		["invCategory"] = "accessory";
		["isFaceCover"] = true;
		["label"] = {
			["eng"] = "Red Bandana";
		};
		["value"] = 50;
	};
	["barnabas_cipher.itm"] = {
		["desc"] = {
			["eng"] = "The book covers the basics of cryptography.";
		};
		["icon"] = "CipherBook";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Cryptography for Dummies";
		};
		["message"] = {
			["eng"] = {
				["contents"] = "The book covers the basics of cryptography. Starting with the origins of cryptography, it moves on to explain cryptosystems, various traditional and modern ciphers, public key encryption, data integration, message authentication, and digital signatures. Many pages have marks on them. Judging by the fat fingerprints and coffee stains the most popular page contains tips for encrypting and remembering simple numeric codes.\
\
\"Afraid you'll forget the combination of your lock? We got you covered! In this case we can use the following simple technique for encrypting numeric codes: just add 1 to each digit of the actual code and even if your passcode note gets stolen, it's still encrypted!\"";
				["title"] = "Cryptography for Dummies";
			};
		};
		["questItem"] = true;
		["value"] = 10;
	};
	["barnabas_code.itm"] = {
		["desc"] = {
			["eng"] = "The diary is filed with almost illegible scrawl and many pages are torn off. One of the last entries contains some interesting passages.";
		};
		["icon"] = "LeatherJournal";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Barnabas' diary";
		};
		["message"] = {
			["eng"] = {
				["contents"] = "The diary is filed with almost illegible scrawl and many pages are torn off. One of the last entries contines some interesting passages:\
\
\"Castor is suspecting something, asks too much questions. Looks like I need to shut down my little side line and prepare for leaving. Departing empty handed would be a crime after all I have suffered in this place. Of course I have my savings, but there's so much more to be had here! Our brave captain can be fooled for another week or two if needed, but that old fucker Eli seems to have been eavesdropping on me, when I was opening my private storage last time. I bet he aims for my place, that spineless buttlicker! I must change the code again, before someone breaks in and finds out about the \"missing\" goods.\
\
The real problem is that I have no more pills left and withdrawal makes the symptoms even worse. It's really hard to remember the fucking numbers, so I'll just write it down. 9731.";
				["title"] = "Barnabas' diary";
			};
		};
		["questItem"] = true;
		["value"] = 10;
	};
	["beacon.itm"] = {
		["animations"] = "melee_low";
		["createModel"] = true;
		["desc"] = {
			["eng"] = "Autonomous 'Sunflower' lamp gathers the solar energy at days and shines at nights, illuminating camps and roads in the Frontier worlds. It's ultra durable batteries are made using some licensed alien technology.";
		};
		["equipable"] = true;
		["icon"] = "Beacon";
		["invCategory"] = "tech";
		["label"] = {
			["eng"] = "'Sunflower' lamp";
		};
		["model"] = "beacon.sbg";
		["sounds"] = {
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_revolver_equip";
			};
		};
		["value"] = 100;
	};
	["beacon_base.itm"] = {
		["desc"] = {
			["eng"] = "Mechanised fast deployable metal tripod that digs into the ground. Universal module for lots of colonial field gadgets.";
		};
		["icon"] = "BeaconBase";
		["invCategory"] = "tech";
		["label"] = {
			["eng"] = "Metal tripod";
		};
		["model"] = "beacon_base.sbg";
		["value"] = 30;
	};
	["beacon_leaf.itm"] = {
		["desc"] = {
			["eng"] = "Solar batteries have evolved in the last centuries, becoming quite effective in the harsh environments of the Frontier planets. On the K'Tharsis there are 260 sunny days in 298-days year, so this small portable array can be reliable power source for various gadgets.";
		};
		["icon"] = "BeaconLeaf";
		["invCategory"] = "tech";
		["label"] = {
			["eng"] = "Solar battery array";
		};
		["model"] = "beacon_leaf.sbg";
		["value"] = 25;
	};
	["beacon_light.wpn"] = {
		["animations"] = "melee_low";
		["colliderLength"] = 0;
		["colliderOffset"] = true;
		["colliderRadius"] = 80;
		["damage"] = 30;
		["desc"] = {
			["eng"] = "Upper part of the 'Sunflower' lamp contains batteries and LED arrays. It can be used as an improvised 'torch' or a blunt weapon dealing additional shock damage.";
		};
		["icon"] = "BeaconLight";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "'LED torch'";
		};
		["model"] = "beacon_light.sbg";
		["sounds"] = {
			["activate"] = {
				[1] = {
					["distance"] = 2000;
					["name"] = "Play_machete_swing";
				};
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_revolver_equip";
			};
		};
		["value"] = 40;
	};
	["beer.itm"] = {
		["attachInfo"] = {
			["pos"] = {
				["x"] = 0;
				["y"] = -20;
				["z"] = 0;
			};
		};
		["boozeInfo"] = "weak";
		["consumableType"] = "drink";
		["desc"] = {
			["eng"] = "Imported beer. Better than local booze but expensive";
		};
		["foodInfo"] = {
			["health"] = 10;
		};
		["icon"] = "BottleBoozeBeer";
		["invCategory"] = "drink";
		["label"] = {
			["eng"] = "Beer";
		};
		["model"] = "bottle_booze_beer.sbg";
		["useEffects"] = {
			["alcoholBuff"] = {
				["duration"] = 30;
				["refresh"] = true;
				["statBonuses"] = {
					["staminaMaxFlat"] = 15;
					["waterRegenFlat"] = -15;
				};
			};
		};
		["value"] = 15;
	};
	["biker_helmet.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "biker_helmet.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "This intimidating helmet offers basic protection from environmental dangers and weapons. You gonna need this if you want to ride a hoverbike on K'Tharsis.";
		};
		["equipable"] = true;
		["icon"] = "BikerHelmet";
		["invCategory"] = "accessory";
		["isFaceCover"] = true;
		["label"] = {
			["eng"] = "Biker Helmet";
		};
		["value"] = 50;
	};
	["biker_helmet_2.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "biker_helmet_2.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "This intimidating helmet offers basic protection from environmental dangers and weapons. You gonna need this if you want to ride a hoverbike on K'Tharsis.";
		};
		["equipable"] = true;
		["icon"] = "BikerHelmet2";
		["invCategory"] = "accessory";
		["isFaceCover"] = true;
		["label"] = {
			["eng"] = "Biker Helmet";
		};
		["value"] = 50;
	};
	["biker_mask.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "biker_mask.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "This mask protects the wearer from sandstorms and small caliber projectiles. Also looks badass.";
		};
		["equipable"] = true;
		["icon"] = "BikerMask";
		["invCategory"] = "accessory";
		["isFaceCover"] = true;
		["label"] = {
			["eng"] = "Biker Mask";
		};
		["value"] = 50;
	};
	["biker_mask_2.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "biker_mask_2.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "This mask protects the wearer from sandstorms and small caliber projectiles. Makes everything look red.";
		};
		["equipable"] = true;
		["icon"] = "BikerMask2";
		["invCategory"] = "accessory";
		["isFaceCover"] = true;
		["label"] = {
			["eng"] = "Biker Mask";
		};
		["value"] = 50;
	};
	["blood_root.itm"] = {
		["consumableType"] = "food";
		["consumeModel"] = "anim_bloodroot.sbg";
		["desc"] = {
			["eng"] = "Medium healing plant";
		};
		["foodInfo"] = {
			["food"] = 5;
			["health"] = 5;
			["water"] = 10;
		};
		["icon"] = "BloodRoot";
		["invCategory"] = "meds";
		["label"] = {
			["eng"] = "Blood root";
		};
		["model"] = "fruit_root.sbg";
		["useEffects"] = {
			["foodBuff"] = {
				["duration"] = 120;
				["refresh"] = true;
				["statBonuses"] = {
					["healthRegenFlat"] = 0.2;
				};
			};
		};
		["value"] = 20;
	};
	["bluethorn_leaf.itm"] = {
		["consumableType"] = "food";
		["consumeModel"] = "anim_bluethorn.sbg";
		["desc"] = {
			["eng"] = "Local anaesthetic and minor disinfectant.";
		};
		["icon"] = "BluethornLeaf";
		["invCategory"] = "meds";
		["label"] = {
			["eng"] = "Bluethorn leaf";
		};
		["model"] = "fruit_bluethorn.sbg";
		["useEffects"] = {
			["medicineBuff"] = {
				["changeStats"] = {
					["healthPercentage"] = 5;
				};
				["duration"] = 5;
				["refresh"] = true;
			};
			["medicineRegenBuff"] = {
				["duration"] = 10;
				["refresh"] = true;
				["statBonuses"] = {
					["healthRegenFlat"] = 0.05;
				};
			};
		};
		["value"] = 5;
	};
	["boonie_hat.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "boonie_hat.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "Boonie hat. Protects from getting a sunstroke. It won't make you invisible or anytnig else";
		};
		["equipable"] = true;
		["icon"] = "BoonieHat";
		["invCategory"] = "accessory";
		["label"] = {
			["eng"] = "Boonie Hat";
		};
		["value"] = 50;
	};
	["booze.itm"] = {
		["attachInfo"] = {
			["pos"] = {
				["x"] = 0;
				["y"] = -28;
				["z"] = 0;
			};
		};
		["boozeInfo"] = "strong";
		["consumableType"] = "drink";
		["desc"] = {
			["eng"] = "Booze. Cheap local alcohol. Guaranteed to give you a hangover";
		};
		["foodInfo"] = {
			["health"] = 10;
		};
		["icon"] = "BottleBooze";
		["invCategory"] = "drink";
		["label"] = {
			["eng"] = "Booze";
		};
		["model"] = "bottle_booze.sbg";
		["useEffects"] = {
			["alcoholBuff"] = {
				["duration"] = 60;
				["refresh"] = true;
				["statBonuses"] = {
					["staminaMaxFlat"] = 25;
					["waterRegenFlat"] = -15;
				};
			};
		};
		["value"] = 10;
	};
	["booze_cold.itm"] = {
		["attachInfo"] = {
			["pos"] = {
				["x"] = 0;
				["y"] = -28;
				["z"] = 0;
			};
		};
		["boozeInfo"] = "strong";
		["consumableType"] = "drink";
		["desc"] = {
			["eng"] = "Same crap as normal booze, but chilled, which makes it easier to drink.";
		};
		["foodInfo"] = {
			["health"] = 15;
		};
		["icon"] = "ColdBooze";
		["invCategory"] = "drink";
		["label"] = {
			["eng"] = "Cold Booze";
		};
		["model"] = "bottle_booze.sbg";
		["useEffects"] = {
			["alcoholBuff"] = {
				["duration"] = 60;
				["refresh"] = true;
				["statBonuses"] = {
					["staminaMaxFlat"] = 25;
					["waterRegenFlat"] = -15;
				};
			};
		};
		["value"] = 15;
	};
	["bounty_hunter_jacket_1.itm"] = {
		["armor"] = 10;
		["attireType"] = "top";
		["desc"] = {
			["eng"] = "A light bounty hunter's jacket made of composite materials. Offers minimal protection from small arms and doesn't restrict movement.";
		};
		["equipable"] = true;
		["icon"] = "BountyHunterArmor";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Bounty Hunter's Jacket";
		};
		["meshes"] = "human_male_top_hands, bounty_hunter_1_top";
		["value"] = 350;
	};
	["bounty_hunter_jacket_2.itm"] = {
		["armor"] = 15;
		["attireType"] = "top";
		["desc"] = {
			["eng"] = "Advanced bounty hunter jacket made of composite materials. Offers decent protection from small arms and doesn't restrict movement.";
		};
		["equipable"] = true;
		["icon"] = "MediumBountyHunterArmor";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Medium Bounty Hunter's Jacket";
		};
		["meshes"] = "human_male_top_hands, bounty_hunter_2_top";
		["value"] = 450;
	};
	["bounty_hunter_jacket_3.itm"] = {
		["armor"] = 20;
		["attireType"] = "top";
		["desc"] = {
			["eng"] = "Advanced bounty hunter jacket made of composite materials. Offers decent protection from small arms and doesn't restrict movement.";
		};
		["equipable"] = true;
		["icon"] = "HeavyBountyHunterArmor";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Heavy Bounty Hunter's Jacket";
		};
		["meshes"] = "human_male_top_hands, bounty_hunter_3_top";
		["value"] = 750;
	};
	["bounty_hunter_pants_1.itm"] = {
		["armor"] = 10;
		["attireType"] = "bottom";
		["desc"] = {
			["eng"] = "A pair of light bounty hunter's pants made of composite materials. Offers minimal protection from small arms and doesn't restrict movement.";
		};
		["equipable"] = true;
		["icon"] = "PantsBounty1";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Bounty Hunter's Pants";
		};
		["meshes"] = "bounty_hunter_1_legs";
		["value"] = 350;
	};
	["bounty_hunter_pants_2.itm"] = {
		["armor"] = 15;
		["attireType"] = "bottom";
		["desc"] = {
			["eng"] = "Advanced bounty hunter pants made of composite materials. Offers decent protection from small arms and doesn't restrict movement.";
		};
		["equipable"] = true;
		["icon"] = "PantsBounty2";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Medium Bounty Hunter's Pants";
		};
		["meshes"] = "bounty_hunter_2_legs";
		["value"] = 450;
	};
	["bounty_hunter_pants_3.itm"] = {
		["armor"] = 20;
		["attireType"] = "bottom";
		["desc"] = {
			["eng"] = "Advanced bounty hunter pants made of composite materials. Offers decent protection from small arms and doesn't restrict movement.";
		};
		["equipable"] = true;
		["icon"] = "PantsBounty3";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Heavy Bounty Hunter's Pants";
		};
		["meshes"] = "bounty_hunter_3_legs";
		["value"] = 750;
	};
	["broken_shotgun.itm"] = {
		["desc"] = {
			["eng"] = "This shotgun is broken and cannot be fixed without proper tools";
		};
		["icon"] = "BrokenShotgun";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Broken Shotgun";
		};
		["value"] = 70;
	};
	["bug.itm"] = {
		["animations"] = "melee_low";
		["desc"] = {
			["eng"] = "Huge bug with terrifying mandibles. You can throw it at the opponents to create distraction or use it as a scout, but handle it with care - this little bugger can bite your fingers in an instant!";
		};
		["equipable"] = true;
		["icon"] = "Bug";
		["invCategory"] = "misc";
		["label"] = {
			["eng"] = "Bitebug";
		};
		["limitCategory"] = "alive";
		["value"] = 5;
	};
	["bug_chipped.itm"] = {
		["animations"] = "melee_low";
		["desc"] = {
			["eng"] = "Huge bug with terrifying mandibles. You can throw it at the opponents to create distraction or use it as a scout, but handle it with care - this little bugger can bite your fingers in an instant!\
\
Implants:\
Neurochip (allows remote control)";
		};
		["equipable"] = true;
		["icon"] = "BugChipped";
		["invCategory"] = "misc";
		["label"] = {
			["eng"] = "Chipped Bitebug";
		};
		["limitCategory"] = "alive";
		["value"] = 55;
	};
	["bug_dead.itm"] = {
		["cookInfo"] = {
			["item"] = "fried_bug.itm";
			["model"] = "fried_bug.sbg";
			["texCooked"] = "fried_bug_diff.dds";
			["texRaw"] = "raw_bug_diff.dds";
		};
		["desc"] = {
			["eng"] = "Even more ugly when dead, this huge beetle is said to be edible if cooked properly.";
		};
		["icon"] = "BugDead";
		["invCategory"] = "misc";
		["label"] = {
			["eng"] = "Dead bitebug";
		};
		["value"] = 5;
	};
	["bug_green.itm"] = {
		["desc"] = {
			["eng"] = "This bitebug seems to be a rare mutant affected by antigravium.";
		};
		["icon"] = "BugGreen";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Green bitebug";
		};
		["questItem"] = true;
		["value"] = 15;
	};
	["bug_green_dead.itm"] = {
		["desc"] = {
			["eng"] = "Oops! Looks like you have killed a rare antigravium-imbued mutant bug! Maybe one and the only of his kind. Who cares.";
		};
		["icon"] = "BugGreenDead";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Dead green bitebug";
		};
		["questItem"] = true;
		["value"] = 15;
	};
	["bug_poison.itm"] = {
		["desc"] = {
			["eng"] = "Some very strong insecticide.";
		};
		["icon"] = "BugPoison";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Bug Poison";
		};
		["questItem"] = true;
		["value"] = 15;
	};
	["bullet_hat.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "bullet_hat.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "A hat decorated with bullets. Theoretically increaes your accuracy, if you belive in talismans.";
		};
		["equipable"] = true;
		["icon"] = "BulletHat";
		["invCategory"] = "accessory";
		["label"] = {
			["eng"] = "Bullet Hat";
		};
		["value"] = 50;
	};
	["bullet_hat_2.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "bullet_hat_2.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "A hat decorated with bullets. Theoretically increaes your accuracy, if you belive in talismans.";
		};
		["equipable"] = true;
		["icon"] = "BulletHat2";
		["invCategory"] = "accessory";
		["label"] = {
			["eng"] = "Bullet Hat";
		};
		["value"] = 50;
	};
	["cactus_head.itm"] = {
		["desc"] = {
			["eng"] = "A torn off alien cactus with poisonous spikes.";
		};
		["icon"] = "AlienCactusSpikes";
		["invCategory"] = "misc";
		["label"] = {
			["eng"] = "Alien Cactus";
		};
		["value"] = 4;
	};
	["camera_basic.itm"] = {
		["desc"] = {
			["eng"] = "Big Brother is watching you!";
		};
		["icon"] = "CameraBasic";
		["invCategory"] = "tech";
		["label"] = {
			["eng"] = "Security camera";
		};
		["model"] = "camera_basic_item.sbg";
		["value"] = 60;
	};
	["camera_strong.itm"] = {
		["desc"] = {
			["eng"] = "You need something more substantial than a brick or a handgun to blind this cold eye.";
		};
		["icon"] = "CameraStrong";
		["invCategory"] = "tech";
		["label"] = {
			["eng"] = "Reinforced security camera";
		};
		["model"] = "camera_strong_item.sbg";
		["value"] = 80;
	};
	["can_emulsia.itm"] = {
		["attachInfo"] = {
			["pos"] = {
				["x"] = -1;
				["y"] = -3;
				["z"] = 2;
			};
		};
		["consumableType"] = "drink";
		["desc"] = {
			["eng"] = "Emulsia.";
		};
		["foodInfo"] = {
			["stamina"] = 10;
			["water"] = 300;
		};
		["icon"] = "CanEmulsia";
		["invCategory"] = "drink";
		["label"] = {
			["eng"] = "Emulsia";
		};
		["model"] = "can_emulsia.sbg";
		["useEffects"] = {
			["drinkBuff"] = {
				["duration"] = 45;
				["refresh"] = true;
				["statBonuses"] = {
					["healthRegenFlat"] = 0.025;
					["staminaRegenFlat"] = 0.5;
				};
			};
		};
		["value"] = 15;
	};
	["can_mixture.itm"] = {
		["attachInfo"] = {
			["pos"] = {
				["x"] = -1;
				["y"] = -3;
				["z"] = 2;
			};
		};
		["consumableType"] = "drink";
		["desc"] = {
			["eng"] = "Mixture.";
		};
		["foodInfo"] = {
			["stamina"] = 10;
			["water"] = 300;
		};
		["icon"] = "CanMixture";
		["invCategory"] = "drink";
		["label"] = {
			["eng"] = "Mixture";
		};
		["model"] = "can_mixture.sbg";
		["useEffects"] = {
			["drinkBuff"] = {
				["duration"] = 45;
				["refresh"] = true;
				["statBonuses"] = {
					["healthRegenFlat"] = 0.025;
					["staminaRegenFlat"] = 0.5;
				};
			};
		};
		["value"] = 6;
	};
	["cannibal_spoon.wpn"] = {
		["animations"] = "melee_low";
		["colliderLength"] = 0;
		["colliderOffset"] = true;
		["colliderRadius"] = 90;
		["damage"] = 30;
		["desc"] = {
			["eng"] = "Cannibal spoon – Carved from a claw of unknown beast and decorated with small antigravium crystals, this spoon is a fine gift. The cannibals of the Great Swamp aborigine tribes use them to eat brains of their enemies, sometimes when they are still alive. Wear it on your neck to terrify other people.";
		};
		["icon"] = "CannibalSpoon";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Cannibal Spoon";
		};
		["model"] = "big_spoon.sbg";
		["questItem"] = true;
		["sounds"] = {
			["activate"] = {
				[1] = {
					["distance"] = 2000;
					["name"] = "Play_machete_swing";
				};
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_revolver_equip";
			};
		};
		["value"] = 50;
	};
	["capsule_health.itm"] = {
		["consumableType"] = "injector";
		["consumeModel"] = "red";
		["desc"] = {
			["eng"] = "A military grade enhanced blood capsule designed to greatly boost health regeneration and replenish blood loss.";
		};
		["icon"] = "InjectorRefillRed";
		["invCategory"] = "meds";
		["label"] = {
			["eng"] = "Health Capsule";
		};
		["model"] = "jet_injector.sbg";
		["useEffects"] = {
			["medicineBuff"] = {
				["changeStats"] = {
					["healthPercentage"] = 25;
				};
				["duration"] = 2;
				["refresh"] = true;
			};
		};
		["value"] = 150;
	};
	["carbine.gun"] = {
		["animations"] = "carbine";
		["cooldown"] = 1;
		["damage"] = 70;
		["desc"] = {
			["eng"] = "A high-accuracy lever-action repeating rifle.";
		};
		["icon"] = "Carbine";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Carbine";
		};
		["model"] = "carbine.sbg";
		["reloadAnimations"] = "carbine";
		["sounds"] = {
			["activate"] = {
				["distance"] = 2000;
				["name"] = "Play_carbine_fire";
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_carbine_equip";
			};
			["inactive"] = {
				["distance"] = 2000;
				["name"] = "Play_carbine_empty";
			};
			["reload_out"] = {
				["distance"] = 1700;
				["name"] = "Play_carbine_lever";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_carbine_unequip";
			};
		};
		["value"] = 250;
	};
	["carry_lunchbox.itm"] = {
		["containedItems"] = "tasty_sandwich.itm";
		["containerCode"] = "3141";
		["desc"] = {
			["eng"] = "A small metal box with surprisingly complex electronic lock on it. Found in anomaly near the Dead Lake.";
		};
		["icon"] = "Lunchbox";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Strange small metal box";
		};
		["model"] = "lunch_box.sbg";
		["questItem"] = true;
		["value"] = 60;
	};
	["circuit_breaker_auto.itm"] = {
		["desc"] = {
			["eng"] = "Automatic triple-phase fuse for a high-voltage line. Prevents damage from short circuits.";
		};
		["icon"] = "CircuitBreaker";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Automatic Circuit Breaker";
		};
		["questItem"] = true;
		["value"] = 150;
	};
	["cleaver.wpn"] = {
		["animations"] = "melee_low";
		["colliderLength"] = 20;
		["colliderOffset"] = true;
		["colliderRadius"] = 50;
		["damage"] = 60;
		["desc"] = {
			["eng"] = "Cleaver – Handy for every cook. Also good for fast dismemberment in combat and after it.";
		};
		["icon"] = "Cleaver";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Cleaver";
		};
		["model"] = "cleaver.sbg";
		["sounds"] = {
			["activate"] = {
				[1] = {
					["distance"] = 2000;
					["name"] = "Play_machete_swing";
				};
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_revolver_equip";
			};
		};
		["value"] = 30;
	};
	["cloth.itm"] = {
		["desc"] = {
			["eng"] = "Random dirty cloth rag. Useful crafting ingredient.";
		};
		["icon"] = "Fabric";
		["invCategory"] = "misc";
		["label"] = {
			["eng"] = "Cloth";
		};
		["value"] = 3;
	};
	["dirty_water_bottle.itm"] = {
		["attachInfo"] = {
			["pos"] = {
				["x"] = 0;
				["y"] = -13;
				["z"] = 0;
			};
		};
		["consumableType"] = "drink";
		["desc"] = {
			["eng"] = "Natural water sources on K'Tharsis are usually poisoned with heavy metals and waste antigravium. Drinking unfiltered water will lower your stamina regeneration for a while.";
		};
		["foodInfo"] = {
			["stamina"] = 5;
			["water"] = 1000;
		};
		["icon"] = "MuddyWaterBottle";
		["invCategory"] = "drink";
		["label"] = {
			["eng"] = "Dirty Water Bottle";
		};
		["model"] = "bottle_water_dirty.sbg";
		["useEffects"] = {
			["blockStaminaRegenDebuff"] = {
				["duration"] = 60;
				["refresh"] = true;
			};
		};
		["value"] = 5;
	};
	["drawing_test.itm"] = {
		["desc"] = {
			["eng"] = "Drawing type item for testing purposes. Displays a window with custom title and image.";
		};
		["drawing"] = {
			["eng"] = {
				["image"] = "wanted1.png";
				["title"] = "Test drawing";
			};
			["size"] = {
				["height"] = 256;
				["width"] = 256;
			};
		};
		["icon"] = "NoteAbori";
		["invCategory"] = "drawing";
		["label"] = {
			["eng"] = "Drawing";
		};
		["value"] = 1;
	};
	["electrical_tape.itm"] = {
		["desc"] = {
			["eng"] = "A valuable item that helps fix anything from spaceships to toilets.";
		};
		["icon"] = "DuctTape";
		["invCategory"] = "misc";
		["model"] = "electrical_tape.sbg";
		["label"] = {
			["eng"] = "Electrical Tape";
		};
		["value"] = 50;
	};
	["dummy.itm"] = {
		["desc"] = {
			["eng"] = "Dummy test item";
		};
		["icon"] = "Machete";
		["invCategory"] = "test";
		["label"] = {
			["eng"] = "Dummy test item";
		};
		["model"] = "dummy_item.sbg";
		["value"] = 20;
	};
	["emulsia.itm"] = {
		["attachInfo"] = {
			["pos"] = {
				["x"] = 0;
				["y"] = -13;
				["z"] = 0;
			};
		};
		["consumableType"] = "drink";
		["desc"] = {
			["eng"] = "Emulsia.";
		};
		["foodInfo"] = {
			["stamina"] = 15;
			["water"] = 450;
		};
		["icon"] = "BottleEmulsia";
		["invCategory"] = "drink";
		["label"] = {
			["eng"] = "Emulsia";
		};
		["model"] = "bottle_emulsia.sbg";
		["useEffects"] = {
			["drinkBuff"] = {
				["duration"] = 60;
				["refresh"] = true;
				["statBonuses"] = {
					["healthRegenFlat"] = 0.025;
					["staminaRegenFlat"] = 0.5;
				};
			};
		};
		["value"] = 20;
	};
	["energy_boots.itm"] = {
		["attireType"] = "boots";
		["desc"] = {
			["eng"] = "Old Antigrav Boots. You can break your neck if you dont have some special training to use these.";
		};
		["equipable"] = true;
		["icon"] = "NoteHuman";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Old Energy Boots";
		};
		["value"] = 550;
	};
	["energy_fence.itm"] = {
		["animations"] = "melee_low";
		["createModel"] = true;
		["desc"] = {
			["eng"] = "Put two or more of these pillars close enough to each other and they will be connected with a force field. The 'fence' will stop any objects bigger than sand grains and additionally shock them on impact. The same technology is used in federal prisons, but for some reasons the makeshift force fences are considered inhumane and illegal.";
		};
		["equipable"] = true;
		["icon"] = "EnergyFence";
		["invCategory"] = "tech";
		["label"] = {
			["eng"] = "Forcefield fence pillar";
		};
		["model"] = "beacon.sbg";
		["value"] = 150;
	};
	["energy_implant.itm"] = {
		["consumableType"] = "injector";
		["consumeModel"] = "blue";
		["desc"] = {
			["eng"] = "Energy-boosting skin implant";
		};
		["icon"] = "SkinCell1";
		["invCategory"] = "tech";
		["label"] = {
			["eng"] = "Energy implant";
		};
		["model"] = "jet_injector.sbg";
		["permaBuffInfo"] = {
			["energyMaxFlat"] = 25;
		};
		["value"] = 2500;
	};
	["energy_shield_1.itm"] = {
		["attireType"] = "shield";
		["desc"] = {
			["eng"] = "Rough Environment energy shield for civil use. Device that creates a force field and draws energy from external source to protect the user.";
		};
		["equipable"] = true;
		["icon"] = "NoteHuman";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "RE Energy Shield";
		};
		["model"] = "starting_rock_bubble.sbg";
		["sounds"] = {
			["activate"] = {
				["distance"] = 1000;
				["name"] = "Play_launcher_fire";
			};
		};
		["value"] = 700;
	};
	["family_relic.wpn"] = {
		["animations"] = "melee_low";
		["colliderLength"] = 20;
		["colliderOffset"] = true;
		["colliderRadius"] = 50;
		["damage"] = 10;
		["desc"] = {
			["eng"] = "So crappy it isn't worth rusty iron it's made of.";
		};
		["icon"] = "Axe";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Rusty Axe";
		};
		["model"] = "axe.sbg";
		["questItem"] = true;
		["sounds"] = {
			["activate"] = {
				[1] = {
					["distance"] = 2000;
					["name"] = "Play_axe_swing";
				};
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_axe_equip";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_axe_unequip";
			};
		};
		["value"] = 20;
	};
	["farmer_1_hat.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "farmer_1_hat.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "Typical farmer's hat. Not badass.";
		};
		["equipable"] = true;
		["icon"] = "FarmersHat";
		["invCategory"] = "accessory";
		["label"] = {
			["eng"] = "Farmer's Hat";
		};
		["value"] = 50;
	};
	["farmer_1_jacket.itm"] = {
		["armor"] = 2;
		["attireType"] = "top";
		["desc"] = {
			["eng"] = "Farmer's jacket.";
		};
		["equipable"] = true;
		["icon"] = "FarmerJacket";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Farmer's Jacket";
		};
		["meshes"] = "human_male_top_arms, farmer_1_top";
		["value"] = 100;
	};
	["farmer_1_pants.itm"] = {
		["armor"] = 2;
		["attireType"] = "bottom";
		["desc"] = {
			["eng"] = "Farmer's pants.";
		};
		["equipable"] = true;
		["icon"] = "FarmerPants";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Farmer's Pants";
		};
		["meshes"] = "farmer_1_legs";
		["value"] = 100;
	};
	["firewood.itm"] = {
		["desc"] = {
			["eng"] = "Some withered branches and plants or split tree trunks - the colonists call it firewood for obvious reason.";
		};
		["icon"] = "Firewood";
		["invCategory"] = "misc";
		["label"] = {
			["eng"] = "Firewood";
		};
		["value"] = 3;
	};
	["flare_ammo.itm"] = {
		["desc"] = {
			["eng"] = "26.5mm flare gun ammo. Deals little damage and won't really penetrate skin or clothes, but it might set the target on fire.";
		};
		["icon"] = "FlareAmmo";
		["invCategory"] = "ammo";
		["label"] = {
			["eng"] = "Flare Gun Ammo";
		};
		["value"] = 20;
	};
	["flaregun.gun"] = {
		["animations"] = "pistol";
		["cooldown"] = 0.5;
		["damage"] = 45;
		["desc"] = {
			["eng"] = "A 26.5mm signal flare gun. Deals little damage and won't really penetrate skin or clothes, but it might set the target on fire.";
		};
		["icon"] = "FlareGun";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Flare Gun";
		};
		["model"] = "flaregun.sbg";
		["reloadAnimations"] = "flare";
		["sounds"] = {
			["activate"] = {
				["distance"] = 2000;
				["name"] = "Play_flaregun_fire";
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_flaregun_equip";
			};
			["inactive"] = {
				["distance"] = 2000;
				["name"] = "Play_flaregun_empty";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_flaregun_unequip";
			};
		};
		["value"] = 150;
	};
	["fried_bug.itm"] = {
		["consumableType"] = "food";
		["consumeModel"] = "anim_friedbug.sbg";
		["desc"] = {
			["eng"] = "Just close your eyes and bite in.";
		};
		["foodInfo"] = {
			["food"] = 320;
			["health"] = 10;
		};
		["icon"] = "FriedBug";
		["invCategory"] = "food";
		["label"] = {
			["eng"] = "Bug on a stick";
		};
		["model"] = "fried_bug.sbg";
		["useEffects"] = {
			["foodBuff"] = {
				["duration"] = 120;
				["refresh"] = true;
				["statBonuses"] = {
					["healthRegenFlat"] = 0.15;
				};
			};
		};
		["value"] = 20;
	};
	["fried_meat.itm"] = {
		["consumableType"] = "food";
		["consumeModel"] = "anim_meat_cooked.sbg";
		["desc"] = {
			["eng"] = "All real men like it. Especially with some booze.";
		};
		["foodInfo"] = {
			["food"] = 800;
			["health"] = 10;
		};
		["icon"] = "FriedMeat";
		["invCategory"] = "food";
		["label"] = {
			["eng"] = "Roasted meat";
		};
		["model"] = "fried_meat.sbg";
		["useEffects"] = {
			["foodBuff"] = {
				["duration"] = 120;
				["refresh"] = true;
				["statBonuses"] = {
					["healthRegenFlat"] = 0.2;
				};
			};
		};
		["value"] = 15;
	};
	["hand_to_hand.wpn"] = {
		["animations"] = "boxing";
		["colliderLength"] = 0;
		["colliderOffset"] = false;
		["colliderRadius"] = 60;
		["damage"] = 10;
		["desc"] = {
			["eng"] = "Don't have any other way to prove your point? Equip these.";
		};
		["icon"] = "Hand";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Hand to Hand";
		};
		["questItem"] = true;
		["sounds"] = {
			["activate"] = {
				[1] = {
					["distance"] = 2000;
					["name"] = "Play_hand_to_hand_swing";
				};
			};
		};
		["value"] = 5;
	};
	["hat_jack.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "hat_leather.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "Your old hat you love. Brings you luck, mostly...";
		};
		["equipable"] = true;
		["icon"] = "LeatherHat";
		["invCategory"] = "accessory";
		["label"] = {
			["eng"] = "My Old Hat";
		};
		["value"] = 50;
	};
	["hat_leather.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "hat_leather.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "Fits like it was made for you. Common headwear on K'tharsis.";
		};
		["equipable"] = true;
		["icon"] = "LeatherHat";
		["invCategory"] = "accessory";
		["label"] = {
			["eng"] = "Leather Hat";
		};
		["value"] = 50;
	};
	["herbal_soap.itm"] = {
		["desc"] = {
			["eng"] = "Home made herbal soap. Despite being made by aborigine from unknown ingredients, it raises your charisma, for you are not stinking like dead hornhog's ass while most of the local men do.";
		};
		["icon"] = "HerbalSoap";
		["invCategory"] = "misc";
		["label"] = {
			["eng"] = "Herbal Soap";
		};
		["value"] = 45;
	};
	["horn.itm"] = {
		["desc"] = {
			["eng"] = "A large horn, extracted from some big game corpse. Nothing special for the experienced hunter, but still can be sold for a decent price or used for crafting weapon handles and various trinkets. Pointy.";
		};
		["icon"] = "Horn";
		["invCategory"] = "misc";
		["label"] = {
			["eng"] = "Horn";
		};
		["value"] = 150;
	};
	["howdah.gun"] = {
		["animations"] = "shotgun";
		["cooldown"] = 2;
		["damage"] = 35;
		["desc"] = {
			["eng"] = "Crafted from the remains of a broken 8-gauge shotgun, this ugly short four barrelled thing makes good last ditch weapon for big game hunters or perfect room sweeper if you want. '4 barrels instead of 2: double your chances when shit hits the fan!'";
		};
		["icon"] = "HowdahX4";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Howdah x4";
		};
		["model"] = "howdah.sbg";
		["reloadAnimations"] = "shotgun1";
		["sounds"] = {
			["activate"] = {
				["distance"] = 2000;
				["name"] = "Play_howdah_fire";
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_howdah_equip";
			};
			["inactive"] = {
				["distance"] = 2000;
				["name"] = "Play_howdah_empty";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_howdah_unequip";
			};
		};
		["value"] = 250;
	};
	["howdah_ammo.itm"] = {
		["desc"] = {
			["eng"] = "Buckshot ammo for monstrous 8-gauge shotguns, favoured by colonists on the planets with hostile biosphere. Perfect for those who are ready to pay extra cash for extra punch of their boomsticks.";
		};
		["icon"] = "HowdahAmmo";
		["invCategory"] = "ammo";
		["label"] = {
			["eng"] = "8-gauge buckshot";
		};
		["value"] = 8;
	};
	["human_turban.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "human_turban.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "A turban made of locally produced cloth. Offers good thermal insulation.";
		};
		["equipable"] = true;
		["icon"] = "Turban";
		["invCategory"] = "accessory";
		["label"] = {
			["eng"] = "Turban";
		};
		["value"] = 50;
	};
	["humanoid_leg.itm"] = {
		["desc"] = {
			["eng"] = "Severed humanoid leg with deep wounds on it. The owner should be already dead.";
		};
		["icon"] = "HumanoidLeg";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Humanoid leg";
		};
		["model"] = "humanoid_leg.sbg";
		["value"] = 3;
	};
	["hunter_hat.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "hunter_hat.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "Decorated with trophies, this hat marks you as a skilled hunter. Or someone who tries to pass for one.";
		};
		["equipable"] = true;
		["icon"] = "HuntersHat";
		["invCategory"] = "accessory";
		["label"] = {
			["eng"] = "Hunter's Hat";
		};
		["value"] = 50;
	};
	["joint.itm"] = {
		["attachInfo"] = {
			["pos"] = {
				["x"] = 0;
				["y"] = 0;
				["z"] = 0;
			};
		};
		["consumableType"] = "smokable";
		["desc"] = {
			["eng"] = "A joint rolled from a local anaesthetic herb.";
		};
		["foodInfo"] = {
			["health"] = -5;
		};
		["icon"] = "BigJoint";
		["invCategory"] = "smokable";
		["label"] = {
			["eng"] = "Joint";
		};
		["model"] = "joint_small.sbg";
		["useEffects"] = {
			["smokeBuff"] = {
				["duration"] = 120;
				["refresh"] = true;
				["statBonuses"] = {
					["foodRegenFlat"] = -0.25;
					["staminaRegenFlat"] = 0.5;
				};
			};
		};
		["value"] = 10;
	};
	["junk_legs_1.itm"] = {
		["armor"] = 1;
		["attireType"] = "bottom";
		["desc"] = {
			["eng"] = "DIY sandals with raggy gaiters.";
		};
		["equipable"] = true;
		["icon"] = "JunkLegs1";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Junk Boots";
		};
		["meshes"] = "human_male_legs, junk_legs_1";
		["value"] = 30;
	};
	["junk_legs_2.itm"] = {
		["armor"] = 2;
		["attireType"] = "bottom";
		["desc"] = {
			["eng"] = "Thick breeches with metal knee pads and old leather boots.";
		};
		["equipable"] = true;
		["icon"] = "JunkLegs2";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Junk Pants";
		};
		["meshes"] = "human_male_legs, junk_legs_2";
		["value"] = 30;
	};
	["junk_top_1.itm"] = {
		["armor"] = 1;
		["attireType"] = "top";
		["desc"] = {
			["eng"] = "Tattered tunic sewn together from random rags.";
		};
		["equipable"] = true;
		["icon"] = "JunkTop1";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Junk Tunic";
		};
		["meshes"] = "human_male_top, junk_top_1";
		["value"] = 30;
	};
	["junk_top_2.itm"] = {
		["armor"] = 2;
		["attireType"] = "top";
		["desc"] = {
			["eng"] = "Hastily crafted vest with raggy scarfs.";
		};
		["equipable"] = true;
		["icon"] = "JunkTop2";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Junk Jacket";
		};
		["meshes"] = "human_male_top, junk_top_2";
		["value"] = 30;
	};
	["kabarog_head.itm"] = {
		["desc"] = {
			["eng"] = "A head of a dead hornhog. The stench almost makes your eyes bleed. You better don't try to hang this trophy above your fireplace";
		};
		["icon"] = "KabarogHead";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Hornhog's head";
		};
		["questItem"] = true;
		["value"] = 15;
	};
	["kabarog_hsg.gun"] = {
		["animations"] = "shotgun";
		["cooldown"] = 1.5;
		["damage"] = 10;
		["desc"] = {
			["eng"] = "This monstruous 8-gauge double barelled shotgun was nicknamed 'Hornhog' for obvious reasons. Hydraulic shock absorber protects shooter's bones from powerful recoil";
		};
		["icon"] = "DoubleBarrel8cal";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Hornhog";
		};
		["model"] = "kabarog_hsg.sbg";
		["reloadAnimations"] = "shotgun1";
		["sounds"] = {
			["activate"] = {
				["distance"] = 2000;
				["name"] = "Play_kabarog_hsg_fire";
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_kabarog_hsg_equip";
			};
			["inactive"] = {
				["distance"] = 2000;
				["name"] = "Play_kabarog_hsg_empty";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_kabarog_hsg_unequip";
			};
		};
		["value"] = 300;
	};
	["ktharsian_aloe.itm"] = {
		["consumableType"] = "food";
		["consumeModel"] = "anim_aloe.sbg";
		["desc"] = {
			["eng"] = "Small healing plant";
		};
		["foodInfo"] = {
			["food"] = 5;
			["health"] = 3;
			["water"] = 10;
		};
		["icon"] = "KTharsianAloe";
		["invCategory"] = "meds";
		["label"] = {
			["eng"] = "K'Tharsian aloe";
		};
		["model"] = "fruit_aloe.sbg";
		["useEffects"] = {
			["foodBuff"] = {
				["duration"] = 90;
				["refresh"] = true;
				["statBonuses"] = {
					["healthRegenFlat"] = 0.15;
				};
			};
		};
		["value"] = 10;
	};
	["kwagga_special.itm"] = {
		["attachInfo"] = {
			["pos"] = {
				["x"] = 0;
				["y"] = -28;
				["z"] = 0;
			};
		};
		["boozeInfo"] = "strong";
		["consumableType"] = "drink";
		["consumeModel"] = "bottle_booze.sbg";
		["desc"] = {
			["eng"] = "If people like it - don't tell them what it's made of. You might lose some friends if you do.";
		};
		["icon"] = "KwaggasSpecial";
		["invCategory"] = "drink";
		["label"] = {
			["eng"] = "Kwagga's Special";
		};
		["useEffects"] = {
			["alcoholBuff"] = {
				["duration"] = 200;
				["refresh"] = true;
				["statBonuses"] = {
					["staminaMaxFlat"] = 100;
					["waterRegenFlat"] = -15;
				};
			};
		};
		["value"] = 25;
	};
	["lager.itm"] = {
		["attachInfo"] = {
			["pos"] = {
				["x"] = 0;
				["y"] = -20;
				["z"] = 0;
			};
		};
		["boozeInfo"] = "weak";
		["consumableType"] = "drink";
		["desc"] = {
			["eng"] = "Lager beer.";
		};
		["foodInfo"] = {
			["health"] = 10;
		};
		["icon"] = "BottleLager";
		["invCategory"] = "drink";
		["label"] = {
			["eng"] = "Lager";
		};
		["model"] = "bottle_lager.sbg";
		["useEffects"] = {
			["alcoholBuff"] = {
				["duration"] = 30;
				["refresh"] = true;
				["statBonuses"] = {
					["staminaMaxFlat"] = 15;
					["waterRegenFlat"] = -15;
				};
			};
		};
		["value"] = 15;
	};
	["lemonade_wade_bug_message.itm"] = {
		["desc"] = {
			["eng"] = "Short message written by Lemonade Wade. The slaver has a surprisingly elegant handwriting.";
		};
		["icon"] = "NoteHuman";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Bug Problem Message";
		};
		["message"] = {
			["eng"] = {
				["contents"] = "If you brought those pests here - you are the one who's gonna get rid of 'em! W.";
				["title"] = "Hey dumbass!";
			};
		};
		["value"] = 0;
	};
	["lemonade_wade_code.itm"] = {
		["desc"] = {
			["eng"] = "A dirty scrap of paper.";
		};
		["icon"] = "NoteHuman";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Lemonade Wade's Lock Code";
		};
		["message"] = {
			["eng"] = {
				["contents"] = "The code to the Warehouse door is *125, and the * stands for the number of times I kicked your ass on the arena last night before you started to cry. You are welcome to get some more any time, wimp!";
				["title"] = "Code";
			};
		};
		["value"] = 0;
	};
	["lemonade_wade_key.itm"] = {
		["desc"] = {
			["eng"] = "This special key opens several doors in Lemonade Wade's stronghold. Obviously was made for slaver leader's convenience but it's quite impractical in terms of security.";
		};
		["icon"] = "MasterKey";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Lemonade Wade's Master Key";
		};
		["value"] = 50;
	};
	["machete.wpn"] = {
		["animations"] = "melee_low";
		["colliderLength"] = 0;
		["colliderOffset"] = true;
		["colliderRadius"] = 80;
		["damage"] = 40;
		["desc"] = {
			["eng"] = "Primitive big knife made of steel plate, tempered in waste oil and wrapped with leather strings for handle. Things like this successfully chop heads since the beginning of the metal age";
		};
		["icon"] = "Machete";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Makeshift khukri knife";
		};
		["model"] = "machete.sbg";
		["sounds"] = {
			["activate"] = {
				[1] = {
					["distance"] = 2000;
					["name"] = "Play_machete_swing";
				};
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_machete_equip";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_machete_unequip";
			};
		};
		["value"] = 40;
	};
	["meat.itm"] = {
		["consumableType"] = "food";
		["consumeModel"] = "anim_meat_raw.sbg";
		["cookInfo"] = {
			["item"] = "fried_meat.itm";
			["model"] = "fried_meat_bent.sbg";
			["texCooked"] = "meat_fried_dif.dds";
			["texRaw"] = "meat_raw_dif.dds";
		};
		["desc"] = {
			["eng"] = "Although most parts of local animals are too tough for human teeth, several pieces can be used for barbecue. Try to fry it, huma!";
		};
		["foodInfo"] = {
			["food"] = 100;
			["health"] = 5;
			["water"] = 150;
		};
		["icon"] = "Meat";
		["invCategory"] = "food";
		["label"] = {
			["eng"] = "Raw meat";
		};
		["model"] = "fried_meat.sbg";
		["useEffects"] = {
			["foodBuff"] = {
				["duration"] = 60;
				["refresh"] = true;
				["statBonuses"] = {
					["healthRegenFlat"] = 0.1;
				};
			};
		};
		["value"] = 10;
	};
	["medkit.itm"] = {
		["consumableType"] = "bandage";
		["desc"] = {
			["eng"] = "Cheap automatic first aid kit designed for colonists of the first wave. Although it's construction and content remained the same for centuries, it still can provide sufficient amount of healing in the most cases you can encounter on an Earth-like planet.";
		};
		["icon"] = "Medkit";
		["invCategory"] = "meds";
		["label"] = {
			["eng"] = "Medkit";
		};
		["useEffects"] = {
			["medicineBuff"] = {
				["changeStats"] = {
					["healthPercentage"] = 20;
				};
				["duration"] = 5;
				["refresh"] = true;
			};
			["medicineRegenBuff"] = {
				["duration"] = 30;
				["refresh"] = true;
				["statBonuses"] = {
					["healthRegenFlat"] = 0.05;
				};
			};
		};
		["value"] = 100;
	};
	["melon.itm"] = {
		["consumableType"] = "food";
		["consumeModel"] = "anim_melon.sbg";
		["desc"] = {
			["eng"] = "Surprisingly sweet and juicy fruit of the desert";
		};
		["foodInfo"] = {
			["food"] = 50;
			["health"] = 2;
			["water"] = 200;
		};
		["icon"] = "Melon";
		["invCategory"] = "food";
		["label"] = {
			["eng"] = "Desert melon";
		};
		["model"] = "fruit_melon.sbg";
		["useEffects"] = {
			["foodBuff"] = {
				["duration"] = 60;
				["refresh"] = true;
				["statBonuses"] = {
					["healthRegenFlat"] = 0.1;
				};
			};
		};
		["value"] = 2;
	};
	["corn_dry.itm"] = {
		["consumableType"] = "food";
		["consumeModel"] = "fruit_corn_dry.sbg";
		["model"] = "fruit_corn_dry.sbg";
		["desc"] = {
			["eng"] = "Dry cob of raw desert corn, probably better for colon cleansing than sustenance.";
		};
		["foodInfo"] = {
			["food"] = 10;
		};
		["icon"] = "DryCorn";
		["invCategory"] = "food";
		["label"] = {
			["eng"] = "Dry Desert Corn Cob";
		};
		["useEffects"] = {
			["foodBuff"] = {
				["duration"] = 30;
				["refresh"] = true;
				["statBonuses"] = {
					["healthRegenFlat"] = 0.05;
				};
			};
		};
		["value"] = 1;
	};
	["corn_fresh.itm"] = {
		["consumableType"] = "food";
		["consumeModel"] = "fruit_corn_fresh.sbg";
		["model"] = "fruit_corn_fresh.sbg";
		["desc"] = {
			["eng"] = "Raw cob of desert corn, juicy and colorful.";
		};
		["foodInfo"] = {
			["food"] = 100;
			["health"] = 3;
			["water"] = 150;
		};
		["icon"] = "FineCorn";
		["invCategory"] = "food";
		["label"] = {
			["eng"] = "Fresh Desert Corn Cob";
		};
		["useEffects"] = {
			["foodBuff"] = {
				["duration"] = 60;
				["refresh"] = true;
				["statBonuses"] = {
					["healthRegenFlat"] = 0.2;
				};
			};
		};
		["value"] = 5;
	};
	["message_test.itm"] = {
		["desc"] = {
			["eng"] = "Message type item for testing purposes. Displays a window with custom title and message.";
		};
		["icon"] = "NoteHuman";
		["invCategory"] = "message";
		["label"] = {
			["eng"] = "Message";
		};
		["message"] = {
			["eng"] = {
				["contents"] = "Message type item for testing purposes. Displays a window with custom title and message. Message type item for testing purposes. Displays a window with custom title and message. Message type item for testing purposes. Displays a window with custom title and message. Message type item for testing purposes. Displays a window with custom title and message.";
				["title"] = "Test message";
			};
		};
		["value"] = 1;
	};
	["miner_journal.itm"] = {
		["desc"] = {
			["eng"] = "Old and battered miner's notebook.";
		};
		["icon"] = "LeatherJournal";
		["invCategory"] = "message";
		["label"] = {
			["eng"] = "Miner's Journal";
		};
		["message"] = {
			["eng"] = {
				["contents"] = "This weathered old journal, among countless complaints about the weather, joint pain and lack of booze and sleep, contains a few useful tips that can help with basics of mining antigravium.\
\
Raises mining to 20\
Mining +5 if already 20 or above";
				["title"] = "Miner's Journal";
			};
		};
		["value"] = 5;
	};
	["mixture.itm"] = {
		["attachInfo"] = {
			["pos"] = {
				["x"] = 0;
				["y"] = -13;
				["z"] = 0;
			};
		};
		["consumableType"] = "drink";
		["desc"] = {
			["eng"] = "Mixture.";
		};
		["foodInfo"] = {
			["stamina"] = 15;
			["water"] = 450;
		};
		["icon"] = "BottleMixture";
		["invCategory"] = "drink";
		["label"] = {
			["eng"] = "Mixture";
		};
		["model"] = "bottle_mixture.sbg";
		["useEffects"] = {
			["drinkBuff"] = {
				["duration"] = 60;
				["refresh"] = true;
				["statBonuses"] = {
					["healthRegenFlat"] = 0.025;
					["staminaRegenFlat"] = 0.5;
				};
			};
		};
		["value"] = 8;
	};
	["morbid_green.itm"] = {
		["desc"] = {
			["eng"] = "Greener than antigravium.";
		};
		["icon"] = "MorbidGreen";
		["invCategory"] = "misc";
		["label"] = {
			["eng"] = "Morbid Green";
		};
		["model"] = "morbid_green.sbg";
		["value"] = 10;
	};
	["morbid_red.itm"] = {
		["desc"] = {
			["eng"] = "Explodes in your mouth.";
		};
		["icon"] = "MorbidRed";
		["invCategory"] = "misc";
		["label"] = {
			["eng"] = "Morbid Red";
		};
		["model"] = "morbid_red.sbg";
		["value"] = 10;
	};
	["nanogreaze.itm"] = {
		["desc"] = {
			["eng"] = "A capsule of strange blue gloving substance, filled with alien-tech nano-machines, rumoured to work miracles on weathered mechanical parts of various devices. The other stories told are about unlucky spaceships and stations, reduced to grey goo after injecting nanogrease into their systems.";
		};
		["icon"] = "Nanogrease";
		["invCategory"] = "tech";
		["label"] = {
			["eng"] = "Nanogrease";
		};
		["model"] = "nanogreaze_tube.sbg";
		["value"] = 10;
	};
	["neocortex_cartridge.itm"] = {
		["desc"] = {
			["eng"] = "This strange device contains something that seems to be a fragment of cerebral cortex floating in blue protective fluid.";
		};
		["icon"] = "NeocortexCartridge";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Neocortex Cartridge\
";
		};
		["model"] = "neocortex_cartridge.sbg";
		["questItem"] = true;
		["value"] = 300;
	};
	["neurochip.itm"] = {
		["animations"] = "melee_low";
		["desc"] = {
			["eng"] = "A neurochip implant that can intercept and take over motor functions of the implantee.";
		};
		["icon"] = "Neurochip";
		["invCategory"] = "tech";
		["label"] = {
			["eng"] = "Neurochip";
		};
		["value"] = 50;
	};
	["nomad_goggles.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "nomad_goggles.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "eyewear";
		["desc"] = {
			["eng"] = "Plastic goggles favored by nomads. No additional gadgets included.";
		};
		["equipable"] = true;
		["icon"] = "NomadsGoggles";
		["invCategory"] = "accessory";
		["label"] = {
			["eng"] = "Nomad's Goggles";
		};
		["value"] = 50;
	};
	["outcast_map.itm"] = {
		["desc"] = {
			["eng"] = "A quickly drawn map of the taboo area and your path to the Hunter's Rest.";
		};
		["drawing"] = {
			["eng"] = {
				["image"] = "outcast_map.jpg";
				["title"] = "Taboo Area";
			};
			["size"] = {
				["height"] = 2215;
				["width"] = 1187;
			};
		};
		["icon"] = "NoteAbori";
		["invCategory"] = "drawing";
		["label"] = {
			["eng"] = "Taboo Area Schematic";
		};
		["value"] = 20;
	};
	["pickaxe.wpn"] = {
		["animations"] = "melee_low";
		["colliderLength"] = 0;
		["colliderOffset"] = true;
		["colliderRadius"] = 90;
		["damage"] = 10;
		["desc"] = {
			["eng"] = "Used to mine. Not much of a use otherwise.";
		};
		["icon"] = "Pickaxe";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Pickaxe";
		};
		["model"] = "pickaxe.sbg";
		["sounds"] = {
			["activate"] = {
				[1] = {
					["distance"] = 2000;
					["name"] = "Play_pickaxe_swing";
				};
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_pickaxe_equip";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_pickaxe_unequip";
			};
		};
		["value"] = 20;
	};
	["pipe.wpn"] = {
		["animations"] = "melee_low";
		["colliderLength"] = 0;
		["colliderOffset"] = true;
		["colliderRadius"] = 80;
		["damage"] = 25;
		["desc"] = {
			["eng"] = "Primitive metal pipe.";
		};
		["icon"] = "MetalPipe";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Metal Pipe";
		};
		["model"] = "pipe.sbg";
		["sounds"] = {
			["activate"] = {
				[1] = {
					["distance"] = 2000;
					["name"] = "Play_pipe_swing";
				};
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_pipe_equip";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_pipe_unequip";
			};
		};
		["value"] = 20;
	};
	["poisoned_melon.itm"] = {
		["desc"] = {
			["eng"] = "It would be a surprisingly sweet and juicy fruit of the desert if it wasn't poisoned.";
		};
		["icon"] = "Melon";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Desert melon with poison";
		};
		["value"] = 2;
	};
	["porter.itm"] = {
		["attachInfo"] = {
			["pos"] = {
				["x"] = 0;
				["y"] = -20;
				["z"] = 0;
			};
		};
		["boozeInfo"] = "weak";
		["consumableType"] = "drink";
		["desc"] = {
			["eng"] = "Porter beer.";
		};
		["foodInfo"] = {
			["health"] = 10;
		};
		["icon"] = "BottlePorter";
		["invCategory"] = "drink";
		["label"] = {
			["eng"] = "Porter";
		};
		["model"] = "bottle_porter.sbg";
		["useEffects"] = {
			["alcoholBuff"] = {
				["duration"] = 30;
				["refresh"] = true;
				["statBonuses"] = {
					["staminaMaxFlat"] = 15;
					["waterRegenFlat"] = -15;
				};
			};
		};
		["value"] = 15;
	};
	["power_cell.itm"] = {
		["desc"] = {
			["eng"] = "Can power stuff.";
		};
		["icon"] = "PowerCell";
		["invCategory"] = "tech";
		["label"] = {
			["eng"] = "Power Cell";
		};
		["model"] = "nanogreaze_tube.sbg";
		["value"] = 50;
	};
	["pure_water_bottle.itm"] = {
		["attachInfo"] = {
			["pos"] = {
				["x"] = 0;
				["y"] = -13;
				["z"] = 0;
			};
		};
		["consumableType"] = "drink";
		["desc"] = {
			["eng"] = "Drinking from pools and wells on K'Tharsis is a bad idea: all natural water sources are usually poisoned with heavy metals and waste antigravium. This bottle of purified water will prevent an excrutiating death from dehydration.";
		};
		["foodInfo"] = {
			["stamina"] = 15;
			["water"] = 1000;
		};
		["icon"] = "PureWaterBottle";
		["invCategory"] = "drink";
		["label"] = {
			["eng"] = "Pure Water Bottle";
		};
		["model"] = "bottle_water.sbg";
		["useEffects"] = {
			["drinkBuff"] = {
				["duration"] = 60;
				["refresh"] = true;
				["statBonuses"] = {
					["healthRegenFlat"] = 0.05;
					["staminaRegenFlat"] = 1;
				};
			};
		};
		["value"] = 25;
	};
	["revolver.gun"] = {
		["animations"] = "pistol";
		["cooldown"] = 0.5;
		["damage"] = 45;
		["desc"] = {
			["eng"] = "HR80 'Equalizer' revolver with 8'' barrel is the most popular model in Wesson&Sons line. Standard ones use .45 ammo and are favoured for their high reliability and accuracy.";
		};
		["icon"] = "Revolver";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Equalizer";
		};
		["model"] = "revolver.sbg";
		["reloadAnimations"] = "pistol1";
		["sounds"] = {
			["activate"] = {
				["distance"] = 2000;
				["name"] = "Play_revolver_fire";
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_revolver_equip";
			};
			["inactive"] = {
				["distance"] = 2000;
				["name"] = "Play_revolver_empty";
			};
			["reload"] = {
				["distance"] = 1400;
				["name"] = "Play_revolver_reloading";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_revolver_unequip";
			};
		};
		["value"] = 150;
	};
	["revolver_ammo.itm"] = {
		["desc"] = {
			["eng"] = "Standard .45 revolver ammo. Has great stopping power against humanoids but probably not the best choice against the tough creatures on this desert planet.";
		};
		["icon"] = "RevolverAmmo";
		["invCategory"] = "ammo";
		["label"] = {
			["eng"] = ".45 Revolver Ammo";
		};
		["value"] = 2;
	};
	["rice_hat.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "rice_hat.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "Solar batteries on this hat should provide faster energy recharge. Technically. Also has build-in radio, but yours seems to be broken. Sigh...";
		};
		["equipable"] = true;
		["icon"] = "RiceHat";
		["invCategory"] = "accessory";
		["label"] = {
			["eng"] = "Solar Batteries Hat";
		};
		["value"] = 50;
	};
	["rotten_meat.itm"] = {
		["consumableType"] = "food";
		["consumeModel"] = "anim_meat_rotten.sbg";
		["desc"] = {
			["eng"] = "A piece of rotten meat.";
		};
		["foodInfo"] = {
			["food"] = 10;
			["health"] = -10;
			["water"] = -10;
		};
		["icon"] = "RottenMeat";
		["invCategory"] = "food";
		["label"] = {
			["eng"] = "Rotten meat";
		};
		["model"] = "fried_meat.sbg";
		["useEffects"] = {
			["badFoodDebuff"] = {
				["duration"] = 120;
				["refresh"] = true;
				["statBonuses"] = {
					["healthRegenOvrd"] = 0;
				};
			};
		};
		["value"] = 2;
	};
	["rotten_melon.itm"] = {
		["desc"] = {
			["eng"] = "Rotten desert melon, found in anomaly near the Dead Lake.";
		};
		["icon"] = "RottenMellon";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Rotten melon";
		};
		["model"] = "fruit_melon.sbg";
		["questItem"] = true;
		["texture"] = "alien_melon_rotten_dif.dds";
		["value"] = 1;
	};
	["scamp_22.gun"] = {
		["animations"] = "pistol";
		["cooldown"] = 0.2;
		["damage"] = 30;
		["desc"] = {
			["eng"] = "Small CAliber Machine Pistol is often used on spaceships and station for law enforcement and self-defence. 22 caliber ammo can't puncture hull or deal heavy damage to equipment which also makes it ineffective against heavily armored targets";
		};
		["icon"] = "Scamp";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "SCAMP";
		};
		["model"] = "scamp_22.sbg";
		["reloadAnimations"] = "pistol2";
		["sounds"] = {
			["activate"] = {
				["distance"] = 2000;
				["name"] = "Play_scamp_22_fire";
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_scamp_22_equip";
			};
			["inactive"] = {
				["distance"] = 2000;
				["name"] = "Play_scamp_22_empty";
			};
			["reload"] = {
				["distance"] = 1400;
				["name"] = "Play_scamp_22_reloading";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_scamp_22_unequip";
			};
		};
		["value"] = 90;
	};
	["scamp_22_shock.gun"] = {
		["animations"] = "pistol";
		["cooldown"] = 0.2;
		["damage"] = 1;
		["desc"] = {
			["eng"] = "Unlike regular tazers which stun opponents, this one on its own doesn't do any significant damage. However, when used with an LED torch, a usually unimpressive weapon used commonly as a light source, if the enemy is under the effect of this seemingly useless tazer, then the humble LED torch shows its full potential, unleashing a devastating attack.\
Uses energy.";
		};
		["icon"] = "ScampYellow";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Combat Tazer";
		};
		["model"] = "scamp_22.sbg";
		["reloadAnimations"] = "pistol2";
		["sounds"] = {
			["activate"] = {
				["distance"] = 2000;
				["name"] = "Play_scamp_22_shock_fire";
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_scamp_22_shock_equip";
			};
			["inactive"] = {
				["distance"] = 2000;
				["name"] = "Play_scamp_22_shock_empty";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_scamp_22_shock_unequip";
			};
		};
		["texture"] = "scamp_22_yellow_dif.dds";
		["value"] = 90;
		["weaponType"] = "energy";
	};
	["scanner.itm"] = {
		["attireType"] = "gadget";
		["desc"] = {
			["eng"] = "Allows to scan surroundings.";
		};
		["equipable"] = true;
		["icon"] = "HandScanner";
		["invCategory"] = "gadget";
		["label"] = {
			["eng"] = "Scanner";
		};
		["meshes"] = "scanner";
		["questItem"] = true;
		["usable"] = true;
		["value"] = 50;
	};
	["scanner_broken.itm"] = {
		["attireType"] = "gadget";
		["desc"] = {
			["eng"] = "Allows to scan surroundings. Broken.";
		};
		["equipable"] = true;
		["icon"] = "BrokenScanner";
		["invCategory"] = "gadget";
		["label"] = {
			["eng"] = "Scanner (broken)";
		};
		["meshes"] = "scanner";
		["questItem"] = true;
		["usable"] = true;
		["value"] = 30;
	};
	["scarecrow_mask.itm"] = {
		["armor"] = 5;
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "This terrifying mask belonged to the infamous desert raider known as  the Scarecrow. Still emanates a deep primal fear.";
		};
		["equipable"] = true;
		["icon"] = "BagHat";
		["invCategory"] = "accessory";
		["isFaceCover"] = true;
		["label"] = {
			["eng"] = "Scarecrow's Mask";
		};
		["meshes"] = "bag_hat";
		["value"] = 50;
	};
	["scrap_electric.itm"] = {
		["desc"] = {
			["eng"] = "Printed circuit boards, microchips and controllers as well as displays and other salvages parts of electronic devices. Useless junk for for the inhabitants of the Core Worlds and valuable resources for the craftsman on the K'Tharsis.";
		};
		["icon"] = "ScrapElectric";
		["invCategory"] = "misc";
		["label"] = {
			["eng"] = "Electronic scrap";
		};
		["model"] = "scrap_electric.sbg";
		["value"] = 25;
	};
	["scrap_mechanical.itm"] = {
		["desc"] = {
			["eng"] = "Parts stripped from various broken devices and gadgets, a salad of potentially useful items from different times and races. Most craftsmen on the K'Tharisis require two things to work: a swing of booze and some mechanical scrap.";
		};
		["icon"] = "ScrapMechanical";
		["invCategory"] = "misc";
		["label"] = {
			["eng"] = "Mechanical scrap";
		};
		["model"] = "scrap_mechanical.sbg";
		["value"] = 10;
	};
	["sheriff_hat.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "sheriff_hat.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "Sheriff's Hat. Well, a sheriff would wear one if he wants.";
		};
		["equipable"] = true;
		["icon"] = "SheriffsHat";
		["invCategory"] = "accessory";
		["label"] = {
			["eng"] = "Sheriff's Hat";
		};
		["value"] = 50;
	};
	["sheriff_jacket.itm"] = {
		["armor"] = 20;
		["attireType"] = "top";
		["desc"] = {
			["eng"] = "An old heavy vest with a monomolecular trenchcoat. This armor has seen better days but can still protect from a shotgun buckshot.";
		};
		["equipable"] = true;
		["icon"] = "OldArmoredDuster";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Old Armored Duster";
		};
		["meshes"] = "human_male_top_hands, sheriff_jack_top";
		["value"] = 750;
	};
	["sheriff_pants.itm"] = {
		["armor"] = 20;
		["attireType"] = "bottom";
		["desc"] = {
			["eng"] = "An old heavy pair of pants. This armor has seen better days but can still protect from a shotgun buckshot.";
		};
		["equipable"] = true;
		["icon"] = "PantsSheriff";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Old Armored Pants";
		};
		["meshes"] = "sheriff_jack_legs";
		["value"] = 750;
	};
	["shotgun.gun"] = {
		["animations"] = "shotgun";
		["cooldown"] = 0.1;
		["damage"] = 15;
		["desc"] = {
			["eng"] = "An immortal classic 12-gauge shotgun design embodied in common materials. Can be heavily modified by its owner.";
		};
		["icon"] = "Shotgun";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "M37 pump-action shotgun";
		};
		["model"] = "shotgun.sbg";
		["reloadAnimations"] = "shotgun1";
		["sounds"] = {
			["activate"] = {
				["distance"] = 2000;
				["name"] = "Play_shotgun_fire";
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_shotgun_equip";
			};
			["inactive"] = {
				["distance"] = 2000;
				["name"] = "Play_shotgun_empty";
			};
			["reload_out"] = {
				["distance"] = 1700;
				["name"] = "Play_shotgun_pump";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_shotgun_unequip";
			};
		};
		["value"] = 200;
	};
	["shotgun_ammo.itm"] = {
		["desc"] = {
			["eng"] = "12-gauge shotgun buckshot ammo in red plastic shell. The cheapest of all ammunition types sold by 'Colonial Wares', it never looses it's popularity. Effective against unarmoured targets.";
		};
		["icon"] = "ShotgunAmmo";
		["invCategory"] = "ammo";
		["label"] = {
			["eng"] = "12-gauge buckshot";
		};
		["value"] = 5;
	};
	["shovel.wpn"] = {
		["animations"] = "melee_low";
		["colliderLength"] = 0;
		["colliderOffset"] = true;
		["colliderRadius"] = 90;
		["damage"] = 10;
		["desc"] = {
			["eng"] = "Used to dig.";
		};
		["icon"] = "Shovel";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Shovel";
		};
		["model"] = "shovel_wep.sbg";
		["sounds"] = {
			["activate"] = {
				[1] = {
					["distance"] = 2000;
					["name"] = "Play_shovel_swing";
				};
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_shovel_equip";
			};
			["unequip"] = {
				["distance"] = 2000;
				["name"] = "Play_shovel_unequip";
			};
		};
		["value"] = 20;
	};
	["shroom_grenade.itm"] = {
		["desc"] = {
			["eng"] = "A very slimy and stinky shroom. Must be handled with care to avoid the foul spore burst.";
		};
		["icon"] = "ShroomGrenade";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Stinky Shroom";
		};
		["model"] = "shroom_grenade.sbg";
		["value"] = 10;
	};
	["slime_meat.itm"] = {
		["consumableType"] = "food";
		["consumeModel"] = "anim_slimemeat.sbg";
		["desc"] = {
			["eng"] = "The slimiest meat you ever ate!";
		};
		["foodInfo"] = {
			["food"] = 500;
			["health"] = 10;
		};
		["icon"] = "SlimeMeat";
		["invCategory"] = "food";
		["label"] = {
			["eng"] = "Slime Meat";
		};
		["model"] = "slime_meat.sbg";
		["useEffects"] = {
			["foodBuff"] = {
				["duration"] = 120;
				["refresh"] = true;
				["statBonuses"] = {
					["healthRegenFlat"] = 0.2;
				};
			};
		};
		["value"] = 20;
	};
	["spacer_hat.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "spacer_hat.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "Fancy spacer's hat. Immediately marks you as an offworlder.";
		};
		["equipable"] = true;
		["icon"] = "SpacersHat";
		["invCategory"] = "accessory";
		["label"] = {
			["eng"] = "Spacer's Hat";
		};
		["value"] = 50;
	};
	["spacer_jacket.itm"] = {
		["armor"] = 2;
		["attireType"] = "top";
		["desc"] = {
			["eng"] = "Stylish spacer's jacket. Attracts eyes, can't stop bullets.";
		};
		["equipable"] = true;
		["icon"] = "SpacerJacket";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Spacer's Jacket";
		};
		["meshes"] = "human_male_top_hands, jack_top";
		["value"] = 100;
	};
	["spacer_pants.itm"] = {
		["armor"] = 2;
		["attireType"] = "bottom";
		["desc"] = {
			["eng"] = "Cool spacer's leg gear. Looks great but local wildlife on K'tharsis can easly bite off your family jewels in these.";
		};
		["equipable"] = true;
		["icon"] = "SpacerPants";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Spacer's Pants";
		};
		["meshes"] = "jack_legs";
		["value"] = 100;
	};
	["strange_absinthe.itm"] = {
		["desc"] = {
			["eng"] = "Absinthe bottle with only half of the liquid remaining. Found in anomaly near the Dead Lake.";
		};
		["icon"] = "StrangeAbsinthe";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Strange Absinthe";
		};
		["model"] = "bottle_absinth.sbg";
		["questItem"] = true;
		["value"] = 5;
	};
	["strange_detector.itm"] = {
		["animations"] = "detect";
		["desc"] = {
			["eng"] = "Exotic Particle Detector addon for my scanner made by Carry the Stone. When activated near anomalies, should give sound signals that help locate samples with high concentration of said particles.";
		};
		["equipable"] = true;
		["icon"] = "StrangeDetector";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Exotic Particle Detector";
		};
		["movementRestriction"] = "walk";
		["questItem"] = true;
		["sounds"] = {
			["nosignal"] = {
				["distance"] = 1500;
				["name"] = "Play_scan_detection_nosignal";
			};
			["pulse"] = {
				["distance"] = 500;
				["name"] = "Play_scan_detection_pulse";
			};
			["pulse_critical"] = {
				["distance"] = 500;
				["name"] = "Play_scan_detection_pulse_critical";
			};
		};
		["value"] = 150;
	};
	["strange_knife.itm"] = {
		["desc"] = {
			["eng"] = "A knife cut in half. The surface of the cut is mirror-like. Found in one of anomalies around the Dead Lake.";
		};
		["icon"] = "AKnifeCutInHalf";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Knife cut in half";
		};
		["model"] = "cleaver.sbg";
		["questItem"] = true;
		["value"] = 5;
	};
	["stygmyan_golden_apple.itm"] = {
		["consumableType"] = "food";
		["consumeModel"] = "anim_apple.sbg";
		["desc"] = {
			["eng"] = "Plentiful healing plant with permanent health boost effect";
		};
		["foodInfo"] = {
			["food"] = 5;
			["health"] = 75;
			["water"] = 10;
		};
		["icon"] = "StygmyanGoldenApple";
		["invCategory"] = "meds";
		["label"] = {
			["eng"] = "Stygmyan golden apple";
		};
		["model"] = "fruit_apple.sbg";
		["permaBuffInfo"] = {
			["healthMaxFlat"] = 10;
		};
		["value"] = 1500;
	};
	["sweet_joy.itm"] = {
		["desc"] = {
			["eng"] = "Addictive lollipops popular among nomads. Made from the sweet juice of desert plants and other unknown ingredients.";
		};
		["icon"] = "SweetJoy";
		["invCategory"] = "quest";
		["model"] = "sweet_joy.sbg";
		["label"] = {
			["eng"] = "Sweet Joy";
		};
		["value"] = 50;
	};
	["tasty_sandwich.itm"] = {
		["consumableType"] = "food";
		["consumeModel"] = "slime_sandwich.sbg";
		["desc"] = {
			["eng"] = "A tasty sandwich. No idea what it’s made of but smells good and will satiate your hunger.";
		};
		["foodInfo"] = {
			["food"] = 500;
			["health"] = 10;
		};
		["icon"] = "TastySandwich";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Tasty sandwich";
		};
		["permaBuffInfo"] = {
			["staminaMaxFlat"] = 5;
		};
		["questItem"] = true;
		["value"] = 50;
	};
	["thug_1_hat.itm"] = {
		["attachments"] = {
			[1] = {
				["bone"] = "head_slot";
				["name"] = "thug_1_hat.sbg";
				["pos"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["rot"] = {
					["x"] = 0;
					["y"] = 0;
					["z"] = 0;
				};
				["scale"] = {
					["x"] = 1;
					["y"] = 1;
					["z"] = 1;
				};
			};
		};
		["attireType"] = "hat";
		["desc"] = {
			["eng"] = "In this one you look like a typical thug.";
		};
		["equipable"] = true;
		["icon"] = "ThugsHat";
		["invCategory"] = "accessory";
		["label"] = {
			["eng"] = "Thug's Hat";
		};
		["value"] = 50;
	};
	["token_abori.itm"] = {
		["desc"] = {
			["eng"] = "A severed aborigine finger";
		};
		["icon"] = "AboriFinger";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Abori severed finger";
		};
		["model"] = "dummy_item.sbg";
		["questItem"] = true;
		["value"] = 10;
	};
	["token_human.itm"] = {
		["desc"] = {
			["eng"] = "A temporal barcode id implant chip";
		};
		["icon"] = "BarcodeChip";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Human ID implant chip";
		};
		["model"] = "dummy_item.sbg";
		["questItem"] = true;
		["value"] = 10;
	};
	["token_scarecrow.itm"] = {
		["desc"] = {
			["eng"] = "An outdated ID implant with traces of Scarecrow's DNA.";
		};
		["icon"] = "ScarecrowChip";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Scarecrow's ID Chip";
		};
		["questItem"] = true;
		["value"] = 10;
	};
	["turret.itm"] = {
		["animations"] = "melee_low";
		["createModel"] = true;
		["desc"] = {
			["eng"] = "A good example of the local inventive engineering: salvaged parts of broken devices and junk items are used to create protective gadget. It won't stop an army but will protect your field camp from animals and stupid aborigines. Can be equipped with various guns.";
		};
		["equipable"] = true;
		["icon"] = "Turret";
		["invCategory"] = "tech";
		["label"] = {
			["eng"] = "'Cyclops' sentry turret";
		};
		["model"] = "turret.sbg";
		["sounds"] = {
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_revolver_equip";
			};
		};
		["value"] = 400;
	};
	["turret_ammo_box.itm"] = {
		["desc"] = {
			["eng"] = "Old 'ammo can'. Probably older than you are.";
		};
		["icon"] = "TurretAmmo";
		["invCategory"] = "ammo";
		["label"] = {
			["eng"] = "Large ammo box";
		};
		["model"] = "turret_ammo_box_item.sbg";
		["value"] = 35;
	};
	["vasily_tools.itm"] = {
		["desc"] = {
			["eng"] = "Various mechanic tools.";
		};
		["icon"] = "ToolBox";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Vasily's tools";
		};
		["model"] = "toolbox_vas.sbg";
		["questItem"] = true;
		["value"] = 10;
	};
	["whiskey.itm"] = {
		["attachInfo"] = {
			["pos"] = {
				["x"] = 0;
				["y"] = -28;
				["z"] = 0;
			};
		};
		["boozeInfo"] = "strong";
		["consumableType"] = "drink";
		["desc"] = {
			["eng"] = "Whiskey. Drown your sorrows in it.";
		};
		["foodInfo"] = {
			["health"] = 10;
		};
		["icon"] = "BottleWhiskey";
		["invCategory"] = "drink";
		["label"] = {
			["eng"] = "Whiskey";
		};
		["model"] = "bottle_whiskey.sbg";
		["useEffects"] = {
			["alcoholBuff"] = {
				["duration"] = 60;
				["refresh"] = true;
				["statBonuses"] = {
					["staminaMaxFlat"] = 40;
					["waterRegenFlat"] = -15;
				};
			};
		};
		["value"] = 14;
	};
	["windscream_canyon_map.itm"] = {
		["desc"] = {
			["eng"] = "A map of the Windscream Canyon area.";
		};
		["icon"] = "PaperMap";
		["invCategory"] = "map";
		["label"] = {
			["eng"] = "Map";
		};
		["value"] = 250;
	};
	["wooden_bat.wpn"] = {
		["animations"] = "melee_low";
		["colliderLength"] = 0;
		["colliderOffset"] = true;
		["colliderRadius"] = 80;
		["damage"] = 15;
		["desc"] = {
			["eng"] = "Straight from the stone age, if not earlier. You can hit things with it or roast meat on it.";
		};
		["icon"] = "WoodenStick";
		["invCategory"] = "weapon";
		["label"] = {
			["eng"] = "Stick";
		};
		["model"] = "wooden_bat.sbg";
		["sounds"] = {
			["activate"] = {
				[1] = {
					["distance"] = 2000;
					["name"] = "Play_machete_swing";
				};
			};
			["equip"] = {
				["distance"] = 2000;
				["name"] = "Play_revolver_equip";
			};
		};
		["value"] = 5;
	};
	["worker_jacket.itm"] = {
		["armor"] = 5;
		["attireType"] = "top";
		["desc"] = {
			["eng"] = "A standard worker's jacket. Basic protection from scratches and spilt coffee.";
		};
		["equipable"] = true;
		["icon"] = "WorkerOutfit";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Worker's Jacket";
		};
		["meshes"] = "human_male_top_hands, worker_1_top";
		["value"] = 250;
	};
	["worker_pants.itm"] = {
		["armor"] = 5;
		["attireType"] = "bottom";
		["desc"] = {
			["eng"] = "A pair of dusty working pants. Basic protection from scratches and spilt coffee.";
		};
		["equipable"] = true;
		["icon"] = "WorkerPants";
		["invCategory"] = "attire";
		["label"] = {
			["eng"] = "Worker's Pants";
		};
		["meshes"] = "worker_1_legs";
		["value"] = 250;
	};
	["zak_whistle.itm"] = {
		["desc"] = {
			["eng"] = "An owner's whistle to give commands to the arphant.";
		};
		["icon"] = "ZakWhistle";
		["invCategory"] = "quest";
		["label"] = {
			["eng"] = "Zak's Whistle";
		};
		["questItem"] = true;
		["value"] = 15;
	};
}
return obj1
