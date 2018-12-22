-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "Zak lost his beloved arphant Molly. He asked me to lead her back to him if I find her. He doesn't know where she might have gone to, but he said that Molly loves melons, and doesn't like bitebugs.";
	["hidden"] = false;
	["logs"] = {
		["DiggingStart"] = "Juggo and his team started digging a ramp for the arphant. Shouldn't take longer than half a day.";
		["FedSlaves"] = "I gave Juggo the meat. Now the aborigines should have the strength to help the arphant get out. Juggo kept his word and mentioned a hidden container with promised loot behind a lying door frame nearby.";
		["FoundArphant"] = "I found the arphant. It managed to trap itself inside a ruined building.";
		["HelpedSlaves"] = "I helped slaves tame arphant. Juggo was extatic, and rewarded me with the promised broken shotgun and even more antigravium.";
		["HelpedZak"] = "I fooled the slaves and helped arphant get to Zak.";
		["JuggoWantsArphant"] = "Juggo told me that they want to free the arphant and use it to cross the desert to finally get away from their former owners. But to do that they need a special whistle that belongs to the arphant's owner, which helps controlling the animal. It's probably the same whistle Zak was talking about. They promised to reward me with some sort of broken weapon which they assured me could easily be fixed in any mechanic's workshop. There also seems to exist some sort of weed, which might also help tame the arphant.";
		["MetSlaves"] = "I've met a bunch of hungry slaves near a ruined building, who asked me if I could bring them 6 pieces of fried meat. Their leader Juggo mentioned the arphant and warned me not to get close to the animal, as I might startle it, ruin some sort of plan of theirs and get stomped. These slaves might be the answer to getting the arphant out of the ruins.";
		["RampFinished"] = "The ramp is finished, and the arphant should be able to get out. Now I just need some sort of way to make it trust me. Zak did mention that Molly loves melons...";
		["WhoToHelp"] = "The question is, should I help Zak return his Molly and fool the runaway slaves, or help the slaves get away for a broken shotgun?";
	};
	["nodes"] = {
		["clear_way"] = {
			["ID"] = 15;
			["connectionsID"] = {
				[1] = 44;
				[2] = 45;
				[3] = 46;
			};
			["name"] = "clear_way";
			["posX"] = 390;
			["posY"] = -30;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   for k,v in pairs({\"juggo\", \"chew\", \"ampa\"}) do\
      local s = getObj(v)\
      if s then\
        s:setIgnoreSleep(false)\
      end\
   end\
   self:writeLog(\"RampFinished\")\
   self:setTopicVisible(\"molly_stuck\", false)\
   self:setTopicVisible(\"molly_give_melon_stuck\", false)\
   self:setTopicVisible(\"molly_give_weed\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["condition_00013"] = {
			["ID"] = 13;
			["connectionsID"] = {
				[1] = 14;
			};
			["event"] = "dead";
			["posX"] = -90;
			["posY"] = 330;
			["script"] = "function Condition:onCheck(obj)\
   self:setTopicVisible(\"zak_molly_dead\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "arphant_molly";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00016"] = {
			["ID"] = 16;
			["connectionsID"] = {
				[1] = 15;
			};
			["event"] = "dig_done";
			["posX"] = 150;
			["posY"] = -60;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00020"] = {
			["ID"] = 20;
			["connectionsID"] = {
				[1] = 21;
			};
			["event"] = "with_zak";
			["posX"] = 1560;
			["posY"] = -60;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00032"] = {
			["ID"] = 32;
			["connectionsID"] = {
				[1] = 0;
			};
			["event"] = "find";
			["posX"] = -1380;
			["posY"] = 540;
			["script"] = "function Condition:onCheck(obj)\
   if not self:getTopicVisible(\"zak_found_molly\") then\
      self:setTopicVisible(\"zak_found_molly\", true)\
      self:writeLog(\"FoundArphant\")\
      if self.q:isStarted() then\
         gameplayUI:showQuestUpdateInfo( \"Quest 'Zak's Lost Arphant' updated\" )\
      end\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "arphant_molly";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00035"] = {
			["ID"] = 35;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -540;
			["posY"] = 630;
			["script"] = "function Condition:onCheck(obj)\
   self.q:giveWhistleToZak()\
   self:setTopicVisible(\"juggo_give_whistle\", false)\
   self:setTopicVisible(\"juggo_tell_whistle\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "zak_give_whistle";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00037"] = {
			["ID"] = 37;
			["connectionsID"] = {
				[1] = 2;
			};
			["event"] = "discuss";
			["posX"] = 2010;
			["posY"] = -60;
			["script"] = "function Condition:onCheck(obj)\
   addItemsToPlayer(\"antigravium_shards.itm\", 300)\
   if hasPlayerItem(\"zak_whistle.itm\") then\
      self.q:giveWhistleToZak()\
   end\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "zak_reward";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00038"] = {
			["ID"] = 38;
			["connectionsID"] = {
				[1] = 0;
			};
			["event"] = "discuss";
			["posX"] = -1380;
			["posY"] = 300;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00040"] = {
			["ID"] = 40;
			["connectionsID"] = {
				[1] = 17;
			};
			["event"] = "discuss";
			["posX"] = -570;
			["posY"] = -60;
			["script"] = "function Condition:onCheck(obj)\
   self:setTopicVisible(\"juggo_feed\", false)\
   removeItemFromPlayer(\"fried_meat.itm\", self:getParam(\"meat_count\"))\
   self:writeLog(\"FedSlaves\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "juggo_feed";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00041"] = {
			["ID"] = 41;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -780;
			["posY"] = 540;
			["script"] = "function Condition:onCheck(obj)\
   self:writeLog(\"JuggoWantsArphant\")\
   self:writeLog(\"WhoToHelp\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "juggo_wants_whistle";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00042"] = {
			["ID"] = 42;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -540;
			["posY"] = 450;
			["script"] = "function Condition:onCheck(obj)\
   removeItemFromPlayer(\"zak_whistle.itm\")\
   getPlayer():addExp(200)\
   self:setTopicVisible(\"zak_give_whistle\", false)\
   self:setTopicVisible(\"juggo_give_whistle\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "juggo_give_whistle";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00043"] = {
			["ID"] = 43;
			["connectionsID"] = {
				[1] = 2;
			};
			["event"] = "discuss";
			["posX"] = 1530;
			["posY"] = 210;
			["script"] = "function Condition:onCheck(obj)\
   --self.q:finish()\
   addItemsToPlayer(\"antigravium_shards.itm\", 200)\
   addItemToPlayer(\"broken_shotgun.itm\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "juggo_reward";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00044"] = {
			["ID"] = 44;
			["connectionsID"] = {
				[1] = 5;
			};
			["event"] = "discuss";
			["posX"] = 750;
			["posY"] = -210;
			["script"] = "function Condition:onCheck(obj)\
   removeItemFromPlayer(\"melon.itm\", 1)\
   runTimer(0, self, function(self)\
      goToQuestStep(\"lost_arphant\", \"molly_walk_to_zak\", true)\
   end, false)\
   getObj(\"juggo\"):setDialogInitiator(true)\
   self:setTopicVisible(\"juggo_what_the_hell\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "molly_give_melon";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00045"] = {
			["ID"] = 45;
			["connectionsID"] = {
				[1] = 5;
			};
			["event"] = "discuss";
			["posX"] = 750;
			["posY"] = 90;
			["script"] = "function Condition:onCheck(obj)\
   removeItemFromPlayer(\"arphant_tranquilizer_weed.itm\", 1)\
   runTimer(0, self, function(self)\
      goToQuestStep(\"lost_arphant\", \"molly_for_slaves\", true)\
   end, false)\
   getObj(\"juggo\"):setDialogInitiator(true)\
   self:setTopicVisible(\"juggo_weed_worked\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "molly_give_weed";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00046"] = {
			["ID"] = 46;
			["connectionsID"] = {
				[1] = 5;
			};
			["event"] = "discuss";
			["posX"] = 750;
			["posY"] = -60;
			["script"] = "function Condition:onCheck(obj)\
   runTimer(0, self, function(self)\
      goToQuestStep(\"lost_arphant\", \"molly_for_slaves\", true)\
   end, false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "juggo_blows_whistle";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00048"] = {
			["ID"] = 48;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -1020;
			["posY"] = 690;
			["script"] = "function Condition:onCheck(obj)\
   self:setTopicVisible(\"juggo_warning\", false)\
   self:setTopicVisible(\"juggo_about_molly\", true)\
   self:setTopicVisible(\"zak_found_molly\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "juggo_warning";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00049"] = {
			["ID"] = 49;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -1020;
			["posY"] = 840;
			["script"] = "function Condition:onCheck(obj)\
   self:setTopicVisible(\"zak_who_is_molly\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "zak_who_is_molly";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00050"] = {
			["ID"] = 50;
			["connectionsID"] = {
				[1] = 0;
			};
			["event"] = "discuss";
			["posX"] = -1380;
			["posY"] = 840;
			["script"] = "function Condition:onCheck(obj)\
   self:setTopicVisible(\"zak_who_is_molly\", false)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "zak_who_is_molly";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00051"] = {
			["ID"] = 51;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -1020;
			["posY"] = 990;
			["script"] = "function Condition:onCheck(obj)\
   self:setTopicVisible(\"juggo_intro\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "juggo_intro";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00052"] = {
			["ID"] = 52;
			["connectionsID"] = {
				[1] = 0;
			};
			["event"] = "discuss";
			["posX"] = -1350;
			["posY"] = 990;
			["script"] = "function Condition:onCheck(obj)\
   self:setTopicVisible(\"juggo_intro\", false)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "juggo_intro";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00053"] = {
			["ID"] = 53;
			["connectionsID"] = {
				[1] = 0;
			};
			["event"] = "discuss";
			["posX"] = -1320;
			["posY"] = 1140;
			["script"] = "function Condition:onCheck(obj)\
   self:setTopicVisible(\"juggo_ask_hungry\", false)\
   self:setTopicVisible(\"juggo_feed\", true)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "juggo_ask_hungry";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00055"] = {
			["ID"] = 55;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -1020;
			["posY"] = 1140;
			["script"] = "function Condition:onCheck(obj)\
   self:setTopicVisible(\"juggo_ask_hungry\", false)\
   self:setTopicVisible(\"juggo_feed\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "juggo_ask_hungry";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00056"] = {
			["ID"] = 56;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -300;
			["posY"] = 540;
			["script"] = "function Condition:onCheck(obj)\
   self:setTopicVisible(\"juggo_tell_whistle\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "juggo______whistle";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00057"] = {
			["ID"] = 57;
			["connectionsID"] = {
				[1] = 0;
			};
			["event"] = "discuss";
			["posX"] = -1380;
			["posY"] = 690;
			["script"] = "function Condition:onCheck(obj)\
   self:setTopicVisible(\"juggo_warning\", false)\
   self:setTopicVisible(\"juggo_about_molly\", true)\
   self:setTopicVisible(\"zak_found_molly\", true)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "juggo_warning";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 2;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 2370;
			["posY"] = 360;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   --self:writeLog(\"last step\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["gave_food"] = {
			["ID"] = 17;
			["connectionsID"] = {
				[1] = 8;
			};
			["name"] = "gave_food";
			["posX"] = -300;
			["posY"] = -30;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"juggo_cant_dig\", false)\
   self:setTopicVisible(\"juggo_gonna_dig\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["molly_dead"] = {
			["ID"] = 14;
			["connectionsID"] = {
				[1] = 2;
			};
			["name"] = "molly_dead";
			["posX"] = 540;
			["posY"] = 360;
			["script"] = "";
			["type"] = "step";
		};
		["molly_for_slaves"] = {
			["ID"] = 18;
			["connectionsID"] = {
				[1] = 43;
			};
			["name"] = "molly_for_slaves";
			["posX"] = 1320;
			["posY"] = 240;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:writeLog(\"HelpedSlaves\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["molly_walk_out_hole"] = {
			["ID"] = 5;
			["connectionsID"] = {
				[1] = 7;
				[2] = 18;
			};
			["name"] = "molly_walk_out_hole";
			["posX"] = 1110;
			["posY"] = -30;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   activateObject(\"arphant_molly\")\
   self:setTopicVisible(\"juggo_about_molly\", false)\
   self:setTopicVisible(\"zak_about_molly\", false)\
   self:setTopicVisible(\"molly_give_melon\", false)\
   self:setTopicVisible(\"molly_give_weed\", false)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["molly_walk_to_zak"] = {
			["ID"] = 7;
			["connectionsID"] = {
				[1] = 20;
			};
			["name"] = "molly_walk_to_zak";
			["posX"] = 1350;
			["posY"] = -30;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   getObj(\"arphant_molly\").patrolPoints = loadParamObjects({}, \"patrolPoints\", \"wp_molly_1,wp_molly_2,wp_molly_3,wp_molly_4,wp_molly_5,wp_molly_6,wp_molly_7,wp_molly_8,wp_molly_9,wp_molly_10,wp_molly_11,wp_molly_12,wp_molly_13,wp_molly_14,wp_molly_15,wp_molly_16,wp_molly_17,wp_molly_18,wp_molly_19\")\
   getObj(\"arphant_molly\").nextPatrolPoint = 1\
   activateObject(\"arphant_molly\")\
   getObj(\"arphant_molly\"):setIgnoreSleep(true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["slave_dig"] = {
			["ID"] = 8;
			["connectionsID"] = {
				[1] = 16;
			};
			["name"] = "slave_dig";
			["posX"] = -60;
			["posY"] = -30;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   runTimer(0, self,\
function(self)\
   self:setParam(\"ramp_initial_height\", getObj(\"q_lost_arphant_bridge\"):getPose():getPos().y)\
   for k,v in pairs({\"juggo\", \"chew\", \"ampa\"}) do\
      local s = getObj(v)\
      if s then\
        s:setState(\"dig\", true)\
\9s:setState(\"talk\", false)\
        s:setIgnoreSleep(true)\
\9if v == \"juggo\" then\
\9   s.refuseTalk = true\
\9end\
      end\
   end\
   self:writeLog(\"DiggingStart\")\
end\
             , false)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 13;
				[2] = 40;
			};
			["name"] = "start";
			["posX"] = -1080;
			["posY"] = 330;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"start\", false)\
   self:setTopicVisible(\"juggo_ask_hungry\", true)\
   self:setTopicVisible(\"juggo_about_molly\", true)\
   self:setTopicVisible(\"juggo_cant_dig\", true)\
   self:setTopicVisible(\"molly_give_melon_stuck\", true)\
   self:setTopicVisible(\"molly_give_melon\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["with_zak"] = {
			["ID"] = 21;
			["connectionsID"] = {
				[1] = 37;
			};
			["name"] = "with_zak";
			["posX"] = 1800;
			["posY"] = -30;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   getObj(\"arphant_molly\"):setIgnoreSleep(false)\
   self:writeLog(\"HelpedZak\")\
   self:setTopicVisible(\"molly_with_zak\", true)\
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
   self:setTopicVisible(\"start\", true)\
   self:setTopicVisible(\"zak_who_is_molly\", true)\
   self:setTopicVisible(\"zak_about_molly\", true)\
   self:setTopicVisible(\"zak_found_molly\", false)\
   self:setTopicVisible(\"zak_molly_dead\", false)\
   self:setTopicVisible(\"zak_give_whistle\", true)\
   self:setTopicVisible(\"molly_with_zak\", false)\
   self:setTopicVisible(\"zak_reward\", true) -- comes after molly_with_zak\
   self:setTopicVisible(\"juggo_intro\", true)\
   self:setTopicVisible(\"juggo_about_molly\", false)\
   self:setTopicVisible(\"juggo_ask_hungry\", false)\
   self:setTopicVisible(\"juggo_feed\", false)\
   self:setTopicVisible(\"juggo_warning\", true)\
   self:setTopicVisible(\"juggo_cant_dig\", false)\
   self:setTopicVisible(\"juggo_gonna_dig\", false)\
   self:setTopicVisible(\"juggo_give_whistle\", true)\
   self:setTopicVisible(\"juggo_tell_whistle\", false)\
   self:setTopicVisible(\"juggo_what_the_hell\", false)\
   self:setTopicVisible(\"juggo_weed_worked\", false)\
   self:setTopicVisible(\"juggo_reward\", true)\
   self:setTopicVisible(\"molly_stuck\", true)\
   self:setTopicVisible(\"molly_give_melon_stuck\", false)\
   self:setTopicVisible(\"molly_give_melon\", false)\
   self:setTopicVisible(\"molly_give_weed\", false)\
   self:declareVar(\"meat_count\", 6)\
   self:setParam(\"talked_to_zak\", false)\
end\
\
function Quest:onStart()\
   --getObj(\"arphant_molly\"):setVisible(true)\
   --getObj(\"juggo\"):setVisible(true)\
end\
\
function Quest:onFinish()\
   --self:writeLog(\"QUEST DONE\")\
end\
\
function Quest:getTopicVisible_zak_give_whistle()\
   return hasPlayerItem(\"zak_whistle.itm\")\
end\
\
function Quest:getTopicVisible_juggo_give_whistle()\
   return hasPlayerItem(\"zak_whistle.itm\")\
end\
\
function Quest:getTopicVisible_juggo_feed()\
   return hasPlayerItemCount(\"fried_meat.itm\", self.meat_count)\
end\
\
function Quest:getTopicVisible_molly_give_melon_stuck()\
   return hasPlayerItem(\"melon.itm\")\
end\
\
function Quest:getTopicVisible_molly_give_melon()\
   return hasPlayerItem(\"melon.itm\") and not self:getTopicVisible(\"molly_stuck\")\
end\
\
function Quest:getTopicVisible_molly_give_weed()\
   return hasPlayerItem(\"arphant_tranquilizer_weed.itm\")\
end\
\
function Quest:giveWhistleToZak()\
   removeItemFromPlayer(\"zak_whistle.itm\")\
   getPlayer():addExp(200)\
   addItemsToPlayer(\"22_ammo.itm\", 20)\
   self:setTopicVisible(\"zak_give_whistle\", false)\
end";
	["title"] = "Zak's Lost Arphant";
}
return obj1
