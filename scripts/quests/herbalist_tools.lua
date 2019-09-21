-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "Herbalist asked me to get special sewing tools for him so that he could make decent armor for me. I can buy the tools in the outcast camp, but Herbalist recommended that I visit his friend Scrap Master and pass him a letter. Scrap Master might give me a friends discount on the tools. I should look for Herbalist's friend in his workshop where he spends the entire day.";
	["group_indices"] = {
	};
	["hidden"] = false;
	["logs"] = {
		["cudgel_about_herbalist"] = "A guard questioned me at the entrance to the camp. He inquired if I had met Herbalist outside the perimeter. There is a reward offered for any information about Herbalist. I need to ask the old abori what it's all about if I get the chance.";
		["cudgel_about_message"] = "Besides, the guard asked if Herbalist had sent any letters to the camp inhabitants.";
		["cudgel_give_message"] = "I decided to get rid of the letter and handed it to the guard. My reward was not cash but an expression of deepest gratitude.";
		["cudgel_has_message"] = "I replied that I had handed it to the guards. To my surprise, Herbalist wasn't really upset and said he had assumed such an outcome. However, he added that he wouldn't trust me with similar tasks in future.";
		["herbalist_about_camp_exile"] = "I asked Herbalist why they wouldn't let him into the camp. He told me how he had fallen victim to persecution at the hands of the current leader of the outcast camp, Big Hat.";
		["herbalist_about_message"] = "I thought Herbalist had forgotten about the note, but he asked what I had done with it.";
		["herbalist_give_message"] = "I returned the note to him. The old abori said that he was going to send it using his own channels and added that he wouldn't trust me with similar tasks in future.";
		["herbalist_message_lost"] = "I reported that I had lost the note. This didn't overly convince the old man and, by the look in his eyes, I could tell that his trust in me had gone down a few notches.";
		["herbalist_tools_from_ragpicker"] = "I gave the tools to Herbalist and told him I had got the tools by simply buying them from Ragpicker. Herbalist was disappointed with my wastefulness. I did my part of the deal and got my reward.";
		["herbalist_tools_from_scrap_master"] = "I gave the tools to Herbalist and told him that I had bought the tools from Scrap Master. Herbalist was glad to hear that I had shown reason and followed his advice to go to his old friend.";
		["herbalist_tools_stolen"] = "I gave the tools to Herbalist and told him I had \"borrowed\" them from Ragpicker. The old man pulled a face but didn't refuse to take the tools. I did my part of the job and got a reward.";
		["ragpicker_about_tools"] = "I found a trader selling armorer's tools in the camp, an abori called Ragpicker, but he shamelessly hiked up the price. I might consider alternative ways of laying my hands on his supplies.";
		["ragpicker_buy_tools"] = "I decided not to got to all the trouble and just bought the tools from Ragpicker. It was expensive but I saved time.";
		["scrap_master_about_tools"] = "I spoke to Scrap Master about buying the tools from him. He agreed to sell them to me at a discount, for a much lower price than the traders in the camp but only if I agree to help him.";
		["scrap_master_broken_crane_finished"] = "I've completed a task for Scrap Master, so he'll lower the price of the tools for me.";
		["scrap_master_buy_tools"] = "I bought the tools from Scrap Master. Now I need to take them to Herbalist and make him ensure the reward is worth all the trouble.";
		["scrap_master_give_message"] = "I gave Herbalist's letter to Scrap Master. The old abori was very happy to hear news about his friend and said he would give me a small discount on the tools.";
		["scrap_master_has_message"] = "I replied that I had handed it to the recipient and the old abori was really happy.";
		["stole_tools"] = "I got the tools in Ragpicker's warehouse. All that's left is to bring them to Herbalist.";
	};
	["nodes"] = {
		["condition_00000"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = -510;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "herbalist_start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00002"] = {
			["ID"] = 2;
			["connectionsID"] = {
				[1] = 8;
			};
			["event"] = "discuss";
			["posX"] = 870;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "herbalist_give_tools";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00004"] = {
			["ID"] = 4;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -30;
			["posY"] = -600;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"herbalist_about_camp_exile\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "cudgel_about_herbalist";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00006"] = {
			["ID"] = 6;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 90;
			["posY"] = -330;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"herbalist_tools_message.itm\", self.objects.cudgel)\
   self:setTopicVisible(\"scrap_master_give_message\", false)\
   self:setTopicVisible(\"cudgel_has_message\", true)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "cudgel_give_message";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00011"] = {
			["ID"] = 11;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 360;
			["posY"] = -330;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"herbalist_tools_message.itm\", self.objects.scrap_master)\
   self:setTopicVisible(\"cudgel_give_message\", false)\
   self:setTopicVisible(\"scrap_master_has_message\", true)\
   self:setTopicVisible(\"scrap_master_get_message_discount\", true)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "scrap_master_give_message";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00014"] = {
			["ID"] = 14;
			["connectionsID"] = {
				[1] = 32;
			};
			["event"] = "discuss";
			["posX"] = 1410;
			["posY"] = -30;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"herbalist_tools_message.itm\", self.objects.herbalist)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "herbalist_give_message";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00015"] = {
			["ID"] = 15;
			["connectionsID"] = {
				[1] = 32;
			};
			["event"] = "discuss";
			["posX"] = 1410;
			["posY"] = 510;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "scrap_master_has_message";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00016"] = {
			["ID"] = 16;
			["connectionsID"] = {
				[1] = 32;
			};
			["event"] = "discuss";
			["posX"] = 1410;
			["posY"] = 330;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "cudgel_has_message";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00017"] = {
			["ID"] = 17;
			["connectionsID"] = {
				[1] = 32;
			};
			["event"] = "discuss";
			["posX"] = 1410;
			["posY"] = 150;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "herbalist_message_lost";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00025"] = {
			["ID"] = 25;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 240;
			["posY"] = 30;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"antigravium_shards.itm\", self.objects.scrap_master, self:getParam(\"scrap_master_price\"))\
   addItemToPlayer(\"armorer_tools.itm\")\
   self:setTopicVisible(\"scrap_master_about_tools\", false)\
   self:setTopicVisible(\"herbalist_tools_from_scrap_master\", true)\
   self:setTopicVisible(\"herbalist_tools_stolen\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "scrap_master_buy_tools";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00026"] = {
			["ID"] = 26;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 210;
			["posY"] = 540;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(\"ragpicker_about_tools\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_about_tools";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00028"] = {
			["ID"] = 28;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 360;
			["posY"] = 390;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"antigravium_shards.itm\", self.objects.ragpicker, self.ragpicker_price)\
   addItemToPlayer(\"armorer_tools.itm\")\
   self:setTopicVisible(\"ragpicker_about_tools\", false)\
   self:setTopicVisible(\"herbalist_tools_from_ragpicker\", true)\
   self:setTopicVisible(\"herbalist_tools_stolen\", false)\
   local chest = self.objects.ragpicker_tools_chest\
   chest.inventory:destroyItemByName(\"armorer_tools.itm\", 1)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_buy_tools";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00030"] = {
			["ID"] = 30;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 150;
			["posY"] = -120;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(\"scrap_master_about_tools\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "scrap_master_about_tools";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00031"] = {
			["ID"] = 31;
			["connectionsID"] = {
			};
			["event"] = "get";
			["posX"] = 420;
			["posY"] = 810;
			["script"] = "function Condition:onCheck(name, obj)\
   if not self:getParam(\"tools_exp_given\") then\
      self:setParam(\"tools_exp_given\", true)\
      addExpToPlayer(self.tools_exp)\
   end\
   local heist_quest = getQuest(\"ragpicker_heist\")\
   local ragpicker_loot = heist_quest:getLootList()\
   if not self.q:isFinished() and not ragpicker_loot[\"armorer_tools.itm\"] then\
      self:setTopicVisible(\"ragpicker_about_tools\", false)\
      self:writeLogOnce(\"stole_tools\")\
   end\
   return false\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "armorer_tools.itm";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00033"] = {
			["ID"] = 33;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 1980;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "herbalist_finish";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00034"] = {
			["ID"] = 34;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 630;
			["posY"] = -330;
			["script"] = "function Condition:onCheck(name, obj)\
   self.q:applyScrapMasterDiscount(\"scrap_master_message_discount\")\
   self:setTopicVisible(\"scrap_master_got_message_discount\", true)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "scrap_master_get_message_discount";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 2280;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["gave_tools"] = {
			["ID"] = 8;
			["connectionsID"] = {
				[1] = 14;
				[2] = 15;
				[3] = 16;
				[4] = 17;
			};
			["name"] = "gave_tools";
			["posX"] = 1140;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"scrap_master_about_tools\", false)\
   self:setTopicVisible(\"ragpicker_about_tools\", false)\
   self:setTopicVisible(\"herbalist_give_tools\", false)\
   self:setTopicVisible(\"herbalist_about_message\", true)\
   self:setTopicVisible(\"herbalist_give_message\", true)\
   self:setTopicVisible(\"herbalist_message_lost\", true)\
   self:setTopicVisible(\"herbalist_finish\", true)\
   giveItemFromPlayerTo(\"armorer_tools.itm\", self.objects.herbalist)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["message"] = {
			["ID"] = 32;
			["connectionsID"] = {
				[1] = 33;
			};
			["name"] = "message";
			["posX"] = 1710;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 1;
			["connectionsID"] = {
				[1] = 2;
				[2] = 4;
				[3] = 25;
				[4] = 26;
				[5] = 28;
				[6] = 30;
			};
			["name"] = "start";
			["posX"] = -240;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   --EXP\
   self:declareVar(\"tools_exp\", 200)\
\
   --VARS\
   self:declareVar(\"scrap_master_message_discount\", -50)\
   self:declareVar(\"crane_beating_markup\", 100)\
   self:declareVar(\"crane_discount\", -200)\
   self:declareVar(\"crane_self_repair_discount\", -300)\
   self:setParam(\"scrap_master_price\", 700)\
   self:declareVar(\"ragpicker_price\", 1000)\
end\
\
function Quest:onStart()\
   addItemToPlayer(\"herbalist_tools_message.itm\")\
   self:setTopicVisible(\"herbalist_give_tools\", true)\
   self:setTopicVisible(\"cudgel_about_herbalist\", true)\
   self:setTopicVisible(\"cudgel_about_message\", true)\
   self:setTopicVisible(\"cudgel_give_message\", true)\
\
   self:setTopicVisible(\"scrap_master_about_tools\", true)\
   self:setTopicVisible(\"scrap_master_give_message\", true)\
   self:setTopicVisible(\"scrap_master_buy_tools\", true)\
\
   self:setTopicVisible(\"ragpicker_about_tools\", true)\
   self:setTopicVisible(\"ragpicker_buy_tools\", true)\
\
   self.objects.cudgel:setDialogInitiator(true)\
end\
\
function Quest:onFinish()\
   getQuest(\"abori_goes_home\"):setTopicVisible(\"start\", true)\
   addItemToPlayer(\"junk_top_herbalist.itm\", 1, 3)\
   addItemToPlayer(\"junk_legs_herbalist.itm\", 1, 3)\
end\
\
function Quest:applyScrapMasterDiscount(discountName)\
   local price = self:getParam(\"scrap_master_price\")\
   local discount = self[discountName]\
   self:setParam(\"scrap_master_price\", price + discount)\
end\
\
function Quest:getTopicVisible_cudgel_give_message()\
   return hasPlayerItem(\"herbalist_tools_message.itm\")\
end\
\
function Quest:getTopicVisible_scrap_master_give_message()\
   return hasPlayerItem(\"herbalist_tools_message.itm\")\
end\
\
function Quest:getTopicVisible_herbalist_give_tools()\
   return hasPlayerItem(\"armorer_tools.itm\")\
end\
\
function Quest:getTopicVisible_herbalist_give_message()\
   return hasPlayerItem(\"herbalist_tools_message.itm\")\
end\
\
function Quest:getTopicVisible_scrap_master_buy_tools()\
   return hasPlayerItem(\"antigravium_shards.itm\", self:getParam(\"scrap_master_price\"))\
end\
\
function Quest:getTopicVisible_ragpicker_buy_tools()\
   return hasPlayerItem(\"antigravium_shards.itm\", self.ragpicker_price)\
end\
\
";
	["title"] = "Tools For Herbalist";
	["topics"] = {
		[1] = {
			["log_id"] = "";
			["name"] = "herbalist_start";
			["single_use"] = true;
			["visible"] = true;
		};
		[2] = {
			["log_id"] = "herbalist_about_camp_exile";
			["name"] = "herbalist_about_camp_exile";
			["single_use"] = true;
			["visible"] = false;
		};
		[3] = {
			["log_id"] = "";
			["name"] = "herbalist_give_tools";
			["single_use"] = true;
			["visible"] = false;
		};
		[4] = {
			["log_id"] = "herbalist_tools_from_ragpicker";
			["name"] = "herbalist_tools_from_ragpicker";
			["single_use"] = true;
			["visible"] = false;
		};
		[5] = {
			["log_id"] = "herbalist_tools_from_scrap_master";
			["name"] = "herbalist_tools_from_scrap_master";
			["single_use"] = true;
			["visible"] = false;
		};
		[6] = {
			["log_id"] = "herbalist_tools_stolen";
			["name"] = "herbalist_tools_stolen";
			["single_use"] = true;
			["visible"] = true;
		};
		[7] = {
			["log_id"] = "herbalist_about_message";
			["name"] = "herbalist_about_message";
			["single_use"] = true;
			["visible"] = false;
		};
		[8] = {
			["log_id"] = "herbalist_give_message";
			["name"] = "herbalist_give_message";
			["single_use"] = true;
			["visible"] = false;
		};
		[9] = {
			["log_id"] = "herbalist_message_lost";
			["name"] = "herbalist_message_lost";
			["single_use"] = true;
			["visible"] = false;
		};
		[10] = {
			["log_id"] = "cudgel_has_message";
			["name"] = "cudgel_has_message";
			["single_use"] = true;
			["visible"] = false;
		};
		[11] = {
			["log_id"] = "scrap_master_has_message";
			["name"] = "scrap_master_has_message";
			["single_use"] = true;
			["visible"] = false;
		};
		[12] = {
			["log_id"] = "cudgel_about_herbalist";
			["name"] = "cudgel_about_herbalist";
			["single_use"] = true;
			["visible"] = false;
		};
		[13] = {
			["log_id"] = "cudgel_about_message";
			["name"] = "cudgel_about_message";
			["single_use"] = true;
			["visible"] = false;
		};
		[14] = {
			["log_id"] = "cudgel_give_message";
			["name"] = "cudgel_give_message";
			["single_use"] = true;
			["visible"] = false;
		};
		[15] = {
			["log_id"] = "";
			["name"] = "scrap_master_about_tools";
			["single_use"] = false;
			["visible"] = false;
		};
		[16] = {
			["log_id"] = "scrap_master_give_message";
			["name"] = "scrap_master_give_message";
			["single_use"] = true;
			["visible"] = false;
		};
		[17] = {
			["log_id"] = "scrap_master_buy_tools";
			["name"] = "scrap_master_buy_tools";
			["single_use"] = true;
			["visible"] = false;
		};
		[18] = {
			["log_id"] = "";
			["name"] = "ragpicker_about_tools";
			["single_use"] = false;
			["visible"] = false;
		};
		[19] = {
			["log_id"] = "ragpicker_buy_tools";
			["name"] = "ragpicker_buy_tools";
			["single_use"] = true;
			["visible"] = false;
		};
		[20] = {
			["log_id"] = "";
			["name"] = "herbalist_finish";
			["single_use"] = true;
			["visible"] = false;
		};
		[21] = {
			["log_id"] = "";
			["name"] = "scrap_master_get_message_discount";
			["single_use"] = true;
			["visible"] = false;
		};
		[22] = {
			["log_id"] = "";
			["name"] = "scrap_master_got_message_discount";
			["single_use"] = true;
			["visible"] = false;
		};
	};
	["variables"] = {
		[1] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "cudgel";
			["value"] = "cudgel";
		};
		[2] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "herbalist";
			["value"] = "herbalist";
		};
		[3] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "ragpicker";
			["value"] = "ragpicker";
		};
		[4] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "scrap_master";
			["value"] = "scrap_master";
		};
		[5] = {
			["icon"] = "O";
			["kind"] = "object";
			["name"] = "ragpicker_tools_chest";
			["value"] = "chest_3";
		};
	};
}
return obj1
