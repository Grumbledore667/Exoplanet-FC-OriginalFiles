-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "Bounty Hunters' assistance is required to track and kill a bandit known as The Scarecrow who can be found in the Windscream Canyon area. Ask captain Castor in the Fort to get more information.\
Reward: 1000 antigravium shards.\
The reward can be obtained in exchange for an ID implant chip which confirms criminal's identity.";
	["hidden"] = false;
	["logs"] = {
		["AskLocals"] = "According to Captain Castor, this Scarecrow guy is a real madman. He wears a sack with two holes as a mask and that's how he got his nickname. He doesn't rob those he kills, but takes some dead bodies with him. A nomad trading caravan was attacked recently and three guards managed to survive. I must interrogate them all. Furthermore, the mercenary called Red was also attacked by the Scarecrow and barely managed to escape death. I should ask Red about the Scarecrow as well.";
		["CaravaneerAboutMask"] = "One of the Caravaneers has noticed that the Scarecrow wasn't killing masked people for some reason. Is it true or not, but I better find me some protective headgear before confronting the mad bandit.";
		["CutOutChip"] = "The Scarecrow has cut out his ID chip and gave it to me. Seemed like he suffered serious brain damage as if his madness wasn't enough.";
		["Finish"] = "Finally, I got my reward for the contract. The mad bandit Scarecrow won’t attack travellers on the caravan road anymore.";
		["GetSpecialBooze"] = "Red doesn't want to talk about the attack, but some special drink from Kwagga should loosen his tongue. Kwagga is an abori trader who has set up his booth with some cheap wares in the Fort.";
		["Kill"] = "The three shaken nomad survivors provided me with some useful information. The Scarecrow attacked their caravan on the road not far from the desert area, near the huge abori ruins. One of the nomads assumed that Scarecrow must have a vantage point in the old ruined fort across the road form the abori ruins. This fort was built during the first wave of the colonization and is a dangerous place to explore. The nomad marked the area on my map.";
		["Killed"] = "I have killed the Scarecrow and have to get his ID chip and deliver it to Captain Castor to get my reward.";
		["KwaggaSpecial"] = "Kwagga was out of stock, but he was kind enough to give me the recipe for his \"special\" booze: Absinthe, Booze and a bit of Arphant Dung. Now I just have to get these ingredients, mix 'em and get Red to talk. I hope this exotic cocktail won't kill him before I get what I need.";
		["RedLore"] = "Red told me a weird story about the Scarecrow. He used to know him long before he turned into a dangerous outlaw. The guy was a security guard named Crow at Devil's Throat, a big mining facility under control of Terraform corporation. Crow was cruel with slaves and ruthless to the ones who dared to rebel. He enjoyed the look of fear on faces of aborigines and mercenaries and used an old sack as a mask. Red believes that it's the bloody work in that mine that turned Crow into a murderous psychopath.";
	};
	["nodes"] = {
		["condition_00008"] = {
			["ID"] = 8;
			["connectionsID"] = {
				[1] = 9;
			};
			["event"] = "discuss";
			["posX"] = 540;
			["posY"] = 240;
			["script"] = "function Condition:onCheck(name, obj)\
   addExpToPlayer(self.caravaneer_exp)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "caravaneer_about_scarecrow_3";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00010"] = {
			["ID"] = 10;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 540;
			["posY"] = -60;
			["script"] = "function Condition:onCheck(name, obj)\
   addExpToPlayer(self.caravaneer_exp)\
   self:setTopicVisible(\"caravaneer_about_scarecrow_1\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "caravaneer_about_scarecrow_1";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00011"] = {
			["ID"] = 11;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 540;
			["posY"] = 90;
			["script"] = "function Condition:onCheck(name, obj)\
   addExpToPlayer(self.caravaneer_exp)\
   self:setTopicVisible(\"caravaneer_about_scarecrow_2\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "caravaneer_about_scarecrow_2";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00013"] = {
			["ID"] = 13;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 2070;
			["posY"] = 60;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"caravaneer_scarecrow_reward\", false)\
   self:setTopicVisible(\"caravaneers_friendly\", true)\
   addExpToPlayer(self.caravaneer_finish_exp)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "caravaneer_scarecrow_reward";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00014"] = {
			["ID"] = 14;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 2070;
			["posY"] = 420;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"red_scarecrow_reward\", false)\
   addExpToPlayer(self.red_finish_exp)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "red_scarecrow_reward";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00018"] = {
			["ID"] = 18;
			["connectionsID"] = {
				[1] = 4;
			};
			["event"] = "dead";
			["posX"] = 1320;
			["posY"] = 330;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(\"Killed\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:scarecrow";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00021"] = {
			["ID"] = 21;
			["connectionsID"] = {
				[1] = 4;
			};
			["event"] = "discuss";
			["posX"] = 1320;
			["posY"] = 150;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromObjTo(\"token_scarecrow.itm\", obj, getMC(), 1)\
   enableObject(self.getaway_trigger)\
   self:setTopicVisible(\"scarecrow_no_chip\", true)\
   self:writeLog(\"CutOutChip\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "scarecrow_cut_out_chip";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00022"] = {
			["ID"] = 22;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 540;
			["posY"] = 390;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"caravaneer_about_scarecrow_1\", false)\
   self:writeLog(\"CaravaneerAboutMask\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "caravaneer_about_scarecrow_3_bonus";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00023"] = {
			["ID"] = 23;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 1050;
			["posY"] = 390;
			["script"] = "function Condition:onCheck(name, obj)\
   obj:setAttitudeToMainCharacter(\"ENEMY\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "scarecrow_aggressive";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00029"] = {
			["ID"] = 29;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 1050;
			["posY"] = 90;
			["script"] = "function Condition:onCheck(name, obj)\
   getObj(self.scarecrow):setBBVar(\"shouldCutChip\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "scarecrow_cut_animation";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00032"] = {
			["ID"] = 32;
			["connectionsID"] = {
				[1] = 33;
			};
			["event"] = "discuss";
			["posX"] = 60;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "castor_briefing";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00034"] = {
			["ID"] = 34;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 1800;
			["posY"] = 240;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"token_scarecrow.itm\", obj, 1)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "castor_finish";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00035"] = {
			["ID"] = 35;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -420;
			["posY"] = -270;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"kwagga_about_special_booze\", true)\
   self:setTopicVisible(\"red_booze\", true)\
   self:setTopicVisible(\"red_give_special_booze\", true)\
   self:setTopicVisible(\"red_about_scarecrow\", false)\
   self:writeLog(\"GetSpecialBooze\")\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "red_about_scarecrow";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00036"] = {
			["ID"] = 36;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -180;
			["posY"] = -270;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(\"KwaggaSpecial\")\
   self:setTopicVisible(\"kwagga_about_special_booze\", false)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "kwagga_about_special_booze";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00037"] = {
			["ID"] = 37;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 60;
			["posY"] = -270;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"kwagga_special.itm\", obj, 1)\
   self:setTopicVisible(\"red_give_special_booze\", false)\
   self:setTopicVisible(\"red_booze\", false)\
   self:setTopicVisible(\"red_wait_for_special_booze\", true)\
   getObj(\"red\").navigator:setPatrolRoute(table.concat(self.red_drink_wp_group, \",\"))\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "red_give_special_booze";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00038"] = {
			["ID"] = 38;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 540;
			["posY"] = -270;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"red_ready_for_special_booze\", false)\
   self:setTopicVisible(\"red_drinks_special_booze\", false)\
   obj:setBBVar(\"consumeItemName\", \"kwagga_special.itm\")\
   getObj(\"red\").navigator:setPatrolRoute(table.concat(self.red_back_wp_group, \",\"))\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "red_drinks_special_booze";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00039"] = {
			["ID"] = 39;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 300;
			["posY"] = -270;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"red_wait_for_special_booze\", false)\
   self:setTopicVisible(\"red_ready_for_special_booze\", true)\
   getObj(\"red\"):setDialogInitiator(true)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:red_drink_wp_group_end";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00040"] = {
			["ID"] = 40;
			["connectionsID"] = {
			};
			["event"] = "activate";
			["posX"] = 1800;
			["posY"] = 60;
			["script"] = "function Condition:onCheck(name, obj)\
   if not getObj(self.scarecrow):getState(\"dead\") then\
      disableObject(self.scarecrow)\
   end\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:getaway_trigger";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00041"] = {
			["ID"] = 41;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 780;
			["posY"] = -270;
			["script"] = "function Condition:onCheck(name, obj)\
   addExpToPlayer(self.red_exp)\
   self:setTopicVisible(\"red_scarecrow_reward\", true)\
   self:writeLog(\"RedLore\")\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "red_scarecrow_lore";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00043"] = {
			["ID"] = 43;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 180;
			["posY"] = -450;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"red_interrogation_1\", false)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "red_interrogation_1";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00044"] = {
			["ID"] = 44;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 420;
			["posY"] = -450;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"red_interrogation_2\", false)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "red_interrogation_2";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 2070;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["scarecrow_shown"] = {
			["ID"] = 9;
			["connectionsID"] = {
				[1] = 18;
				[2] = 21;
			};
			["name"] = "scarecrow_shown";
			["posX"] = 810;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   enableObject(self.scarecrow)\
\
   self:setTopicVisible(\"caravaneer_about_scarecrow_3\", false)\
   self:setTopicVisible(\"caravaneers_about_scarecrow\", false)\
   self:writeLog(\"Kill\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 1;
			["connectionsID"] = {
				[1] = 32;
			};
			["name"] = "start";
			["posX"] = -150;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["talk_to_locals"] = {
			["ID"] = 33;
			["connectionsID"] = {
				[1] = 8;
			};
			["name"] = "talk_to_locals";
			["posX"] = 300;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"castor_briefing\", false)\
   self:setTopicVisible(\"red_about_scarecrow\", true)\
   self:setTopicVisible(\"caravaneers_about_scarecrow\", true)\
   self:setTopicVisible(\"caravaneer_about_scarecrow_1\", true)\
   self:setTopicVisible(\"caravaneer_about_scarecrow_2\", true)\
   self:setTopicVisible(\"caravaneer_about_scarecrow_3\", true)\
   self:setTopicVisible(\"caravaneer_about_scarecrow_3_bonus\", true)\
   self:writeLog(\"AskLocals\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["to_castor"] = {
			["ID"] = 4;
			["connectionsID"] = {
				[1] = 34;
				[2] = 40;
			};
			["name"] = "to_castor";
			["posX"] = 1560;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"castor_finish\", true)\
   self:setTopicVisible(\"caravaneer_scarecrow_reward\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:setTopicVisible(\"castor_about_scarecrow\", false)\
   self:setTopicVisible(\"castor_briefing\", false)\
   self:setTopicVisible(\"castor_finish\", false)\
   self:setTopicVisible(\"red_about_scarecrow\", false)\
   self:setTopicVisible(\"red_booze\", false)\
   self:setTopicVisible(\"red_give_special_booze\", false)\
   self:setTopicVisible(\"red_wait_for_special_booze\", false)\
   self:setTopicVisible(\"red_ready_for_special_booze\", false)\
   self:setTopicVisible(\"red_drinks_special_booze\", false)\
   self:setTopicVisible(\"red_interrogation_1\", true)\
   self:setTopicVisible(\"red_interrogation_2\", true)\
   self:setTopicVisible(\"red_scarecrow_reward\", false)\
   self:setTopicVisible(\"kwagga_about_special_booze\", false)\
   self:setTopicVisible(\"caravaneers_friendly\", false)\
   self:setTopicVisible(\"caravaneers_about_scarecrow\", false)\
   self:setTopicVisible(\"caravaneer_about_scarecrow_1\", false)\
   self:setTopicVisible(\"caravaneer_about_scarecrow_2\", false)\
   self:setTopicVisible(\"caravaneer_about_scarecrow_3\", false)\
   self:setTopicVisible(\"caravaneer_about_scarecrow_3_bonus\", false)\
   self:setTopicVisible(\"caravaneer_scarecrow_reward\", false)\
   self:setTopicVisible(\"scarecrow_bag_hat\", true)\
   self:setTopicVisible(\"scarecrow_face_covered\", true)\
   self:setTopicVisible(\"scarecrow_aggressive\", true)\
   self:setTopicVisible(\"scarecrow_cut_out_chip\", true)\
   self:setTopicVisible(\"scarecrow_no_chip\", false)\
\
   self:declareVar(\"red_drink_wp_group_name\", \"q_scarecrow_red_drink_wps\")\
   self:declareVar(\"red_back_wp_group_name\", \"q_scarecrow_red_back_wps\")\
   self:declareVar(\"item_requisite\", \"token_scarecrow.itm\")\
   self:declareVar(\"scarecrow\", \"scarecrow\")\
   self:declareVar(\"chip_cut_animation\", \"idle_cut_chip\")\
\
   self:declareVar(\"red_exp\", 50)\
   self:declareVar(\"red_finish_exp\", 150)\
   self:declareVar(\"caravaneer_exp\", 25)\
   self:declareVar(\"caravaneer_finish_exp\", 100)\
   self:declareVar(\"finish_money\", 1000)\
   self:declareVar(\"getaway_trigger\", \"q_scarecrow_getaway_trigger\")\
\
   local markers = {\
      scarecrow_shown = {{pos = {x=-8017, y=6743, z=174935}, radius = 45, tip = \"Old Fort\"}},\
   }\
   self:declareQuestMarkers(markers)\
\
   getScene():subscribeOnLocationEnter(self.onLocationEnter, self)\
end\
\
function Quest:onStart()\
   self:setTopicVisible(\"castor_about_scarecrow\", true)\
   self:setTopicVisible(\"castor_briefing\", true)\
end\
\
function Quest:onFinish()\
   self:setTopicVisible(\"castor_about_scarecrow\", false)\
   self:setTopicVisible(\"castor_finish\", false)\
   addItemToPlayer(\"antigravium_shards.itm\", self.finish_money)\
   self:writeLog(\"Finish\")\
end\
\
function Quest:onLocationEnter()\
   self:declareVar(\"red_drink_wp_group\", getObjectsInGroupOrdered(self.red_drink_wp_group_name))\
   self:declareVar(\"red_drink_wp_group_end\", self.red_drink_wp_group[#self.red_drink_wp_group])\
   self:declareVar(\"red_back_wp_group\", getObjectsInGroupOrdered(self.red_back_wp_group_name))\
   disableObject(self.scarecrow)\
end\
\
function Quest:getTopicVisible_castor_scarecrow_finish()\
   return hasPlayerItem(self.item_requisite)\
end\
\
function Quest:getTopicVisible_red_give_special_booze()\
   return hasPlayerItem(\"kwagga_special.itm\")\
end\
\
function Quest:getTopicVisible_scarecrow_bag_hat()\
   return getMC():hasItemEquipped(\"scarecrow_mask.itm\")\
          or getMC():hasItemEquipped(\"bag_hat.itm\")\
end\
\
function Quest:getTopicVisible_scarecrow_face_covered()\
   return getMC():hasFaceCover()\
end\
\
function Quest:getTopicVisible_red_scarecrow_reward()\
   return self:isStepPassed(\"scarecrow_shown\")\
end\
\
";
	["title"] = "The Scarecrow";
}
return obj1
