-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "";
	["hidden"] = false;
	["logs"] = {
		["DiggingStart"] = "Juggo and his team started digging a ramp for the arphant. Shouldn't take longer than half a day.";
		["FedSlaves"] = "I gave Juggo the meat. Now the aborigines should have the strength to help the arphant get out. Juggo kept his word and mentioned a hidden container with promised loot behind a lying door frame nearby.";
		["FoundArphant"] = "I found the a striped arphant. It managed to trap itself inside a ruined building.";
		["HelpedSlaves"] = "I helped slaves tame arphant. Juggo was extatic, and rewarded me with the promised broken shotgun and even more antigravium.";
		["HelpedZak"] = "I fooled the slaves and helped Molly the arphant get to Zak.";
		["JuggoWantsArphant"] = "Juggo told me that they want to free the arphant and use it to cross the desert to finally get away from their former owners. But to control the beast they need a special whistle that belongs to the arphant's owner. They promised to reward me with some sort of broken weapon which they assured me could easily be fixed in any mechanic's workshop. There also seems to exist some sort of weed, which might also help tame the arphant.";
		["JuggoWantsMeat"] = "Juggo asked me if I could bring them 6 pieces of fried meat.";
		["RampFinished"] = "The ramp is finished, and the arphant should be able to get out. Now I just need some sort of way to make it trust me.";
		["StartJuggo"] = "I've met a bunch of hungry slaves near a ruined building. Their leader Juggo mentioned an arphant and warned me not to get close to the animal, as I might startle it, ruin some sort of plan of theirs and get stomped.";
		["StartZak"] = "Zak lost his beloved arphant Molly. He asked me to lead her back to him if I find her. He doesn't know where she might have gone to, but he said that Molly loves melons, and doesn't like bitebugs.";
		["WhoToHelp"] = "The question is, should I help Zak return his Molly and fool the runaway slaves, or help the slaves get away?";
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
			["posX"] = 480;
			["posY"] = -30;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self.q:unequipShovel(getObj(\"juggo\"))\
   self.q:unequipShovel(getObj(\"chew\"))\
   self.q:unequipShovel(getObj(\"ampa\"))\
\
   self:writeLog(\"RampFinished\")\
   self:setTopicVisible(\"molly_stuck\", false)\
   self:setTopicVisible(\"molly_give_weed\", true)\
   self:setTopicVisible(\"juggo_blows_whistle\", true)\
   if self:getParam(\"JuggoHasWhistle\") then\
      getObj(\"juggo\"):setDialogInitiator(true)\
   end\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["condition_00016"] = {
			["ID"] = 16;
			["connectionsID"] = {
				[1] = 15;
			};
			["event"] = "dig_done";
			["posX"] = 240;
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
			["posX"] = 1500;
			["posY"] = -60;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00037"] = {
			["ID"] = 37;
			["connectionsID"] = {
				[1] = 2;
			};
			["event"] = "discuss";
			["posX"] = 1950;
			["posY"] = -60;
			["script"] = "function Condition:onCheck(name, obj)\
   addItemToPlayer(\"antigravium_shards.itm\", 300)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "zak_reward";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00042"] = {
			["ID"] = 42;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -210;
			["posY"] = -480;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"zak_whistle.itm\", getObj(\"juggo\"))\
   getMC():addExp(200)\
   addItemToPlayer(\"flare_ammo.itm\", 8)\
   addItemToPlayer(\"22_ammo.itm\", 10)\
\
   self:setTopicVisible(\"juggo_give_whistle\", false)\
   self:setTopicVisible(\"juggo_have_weed\", false)\
   self:setParam(\"JuggoHasWhistle\", true)\
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
			["posX"] = 1500;
			["posY"] = 150;
			["script"] = "function Condition:onCheck(name, obj)\
   --self.q:finish()\
   addItemToPlayer(\"antigravium_shards.itm\", 200)\
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
			["script"] = "function Condition:onCheck(name, obj)\
   removeItemFromPlayer(\"melon.itm\", 1)\
   runTimer(0, self, function()\
      goToQuestStep(\"lost_arphant\", \"molly_walk_to_zak\", true)\
   end, false)\
   getObj(\"juggo\"):setDialogInitiator(true)\
   self:setTopicVisible(\"juggo_what_the_hell\", true)\
   self:setTopicVisible(\"juggo_angry\", true)\
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
			["script"] = "function Condition:onCheck(name, obj)\
   removeItemFromPlayer(\"arphant_tranquilizer_weed.itm\", 1)\
   runTimer(0, self, function()\
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
			["script"] = "function Condition:onCheck(name, obj)\
   runTimer(0, self, function()\
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
		["condition_00056"] = {
			["ID"] = 56;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -210;
			["posY"] = -630;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"juggo_tell_whistle_gone\", false)\
   self:setTopicVisible(\"juggo_whistle_gone\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "juggo_tell_whistle_gone";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00062"] = {
			["ID"] = 62;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -450;
			["posY"] = -480;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"juggo_go_dig\", true)\
   self:setTopicVisible(\"juggo_give_whistle\", true)\
   self:setTopicVisible(\"juggo_have_weed\", true)\
   self:setTopicVisible(\"juggo_tell_whistle_gone\", true)\
   self:writeLog(\"JuggoWantsArphant\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "juggo_wants_arphant";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00064"] = {
			["ID"] = 64;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -450;
			["posY"] = -630;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"juggo_i_know_owner\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "juggo_i_know_owner";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00065"] = {
			["ID"] = 65;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -810;
			["posY"] = -450;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"juggo_wants_meat\", false)\
   self:setTopicVisible(\"juggo_feed\", true)\
   self:setParam(\"JuggoSaidWantsMeat\", true)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "juggo_wants_meat";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00066"] = {
			["ID"] = 66;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -810;
			["posY"] = -300;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"fried_meat.itm\", getObj(\"juggo\"), self.meat_count)\
   self:setParam(\"JuggoWasFed\", true)\
   if self.q:isStarted() then\
      self:goToStep(\"gave_food\", true)\
   end\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "juggo_feed";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00067"] = {
			["ID"] = 67;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -660;
			["posY"] = -150;
			["script"] = "function Condition:onCheck(name, obj)\
   if not self.q:isStarted() then\
      self.q:start()\
   else\
      runTimer(0, nil, function() self:writeLog(\"WhoToHelp\") end, false)\
   end\
   self:setTopicVisible(\"juggo_start\", false)\
   self:setTopicVisible(\"juggo_about_molly\", true)\
   self:setTopicVisible(\"zak_found_molly\", true)\
   self:writeLog(\"StartJuggo\")\
   if self:getParam(\"JuggoSaidWantsMeat\") then\
      self:writeLog(\"JuggoWantsMeat\")\
   end\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "juggo_start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00068"] = {
			["ID"] = 68;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -660;
			["posY"] = 30;
			["script"] = "function Condition:onCheck(name, obj)\
   if not self.q:isStarted() then\
      self.q:start()\
   else\
      runTimer(0, nil, function() self:writeLog(\"WhoToHelp\") end, false)\
   end\
   self:setTopicVisible(\"zak_start\", false)\
   self:setTopicVisible(\"zak_about_molly\", true)\
   self:setTopicVisible(\"molly_go_to_zak\", true)\
   self:setTopicVisible(\"juggo_i_know_owner\", true)\
   self:writeLog(\"StartZak\")\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "zak_start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00069"] = {
			["ID"] = 69;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -810;
			["posY"] = 180;
			["script"] = "function Condition:onCheck(name, obj)\
   getMC():addExp(200)\
   giveItemFromPlayerTo(\"zak_whistle.itm\", getObj(\"zak\"))\
   addItemToPlayer(\"22_ammo.itm\", 20)\
   self:setTopicVisible(\"zak_give_whistle\", false)\
   self:setParam(\"ZakHasWhistle\", true)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "zak_give_whistle";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00070"] = {
			["ID"] = 70;
			["connectionsID"] = {
			};
			["event"] = "find";
			["posX"] = -810;
			["posY"] = 330;
			["script"] = "function Condition:onCheck(name, obj)\
   if not self:getTopicVisible(\"zak_found_molly\") then\
      self:setTopicVisible(\"zak_found_molly\", true)\
      self:writeLog(\"FoundArphant\")\
      if self.q:isStarted() then\
         gameplayUI:showQuestUpdateInfo(\"Quest 'Lost Arphant' updated\")\
      end\
   end\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "arphant_molly";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00072"] = {
			["ID"] = 72;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -150;
			["posY"] = 150;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"zak_found_molly\", false)\
   self:setTopicVisible(\"zak_molly_questions1\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "zak_found_molly";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00074"] = {
			["ID"] = 74;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -390;
			["posY"] = 150;
			["script"] = "function Condition:onCheck(name, obj)\
   if not self.q:isFinished() then\
      self:setTopicVisible(\"zak_molly_questions1\", true)\
   end\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "mention_arphant";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00075"] = {
			["ID"] = 75;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 240;
			["posY"] = -480;
			["script"] = "function Condition:onCheck(name, obj)\
   local char = getObj(\"juggo\")\
   if char:isInTrigger(obj) then\
      self.q:equipShovelAndDig(char)\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:juggo_wp";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00076"] = {
			["ID"] = 76;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 240;
			["posY"] = -240;
			["script"] = "function Condition:onCheck(name, obj)\
   local char = getObj(\"chew\")\
   if char:isInTrigger(obj) then\
      self.q:equipShovelAndDig(char)\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:chew_wp_end";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00077"] = {
			["ID"] = 77;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 240;
			["posY"] = -360;
			["script"] = "function Condition:onCheck(name, obj)\
   local char = getObj(\"ampa\")\
   if char:isInTrigger(obj) then\
      self.q:equipShovelAndDig(char)\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:ampa_wp_end";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 2;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 2220;
			["posY"] = 180;
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
			["posX"] = -180;
			["posY"] = -30;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"juggo_feed\", false)\
   self:setTopicVisible(\"juggo_still_hungry\", false)\
   self:writeLog(\"FedSlaves\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["molly_for_slaves"] = {
			["ID"] = 18;
			["connectionsID"] = {
				[1] = 43;
			};
			["name"] = "molly_for_slaves";
			["posX"] = 1290;
			["posY"] = 180;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   getObj(\"arphant_molly\").navigator:setPatrolRoute(table.concat(self.molly_wp_group_1, \",\"))\
\
   self:writeLog(\"HelpedSlaves\")\
   self:setTopicVisible(\"juggo_what_now\", true)\
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
			["posX"] = 1050;
			["posY"] = -30;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local molly = getObj(\"arphant_molly\")\
   molly.navigator:setRunPatrol(true)\
   molly.navigator:setPatrolAllowed(true)\
   molly:setState(\"talkForbidden\", true)\
   molly.defaultAnimation = \"idle\"\
   self:setTopicVisible(\"juggo_about_molly\", false)\
   self:setTopicVisible(\"zak_about_molly\", false)\
   self:setTopicVisible(\"molly_talk\", false)\
   self:setTopicVisible(\"molly_give_weed\", false)\
   self:setTopicVisible(\"molly_go_to_zak\", false)\
   self:setTopicVisible(\"juggo_blows_whistle\", false)\
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
			["posX"] = 1290;
			["posY"] = -30;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   getObj(\"arphant_molly\").navigator:setPatrolRoute(table.concat(self.molly_wp_group_to_zak, \",\"))\
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
				[2] = 75;
				[3] = 76;
				[4] = 77;
			};
			["name"] = "slave_dig";
			["posX"] = 30;
			["posY"] = -30;
			["script"] = "local SkySystem = (require \"environment.sky\").SkySystem\
local partial = require \"fun\".partial\
\
function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local juggo = getObj(\"juggo\")\
   local ampa = getObj(\"ampa\")\
   local chew = getObj(\"chew\")\
\
   juggo.navigator:setPatrolRoute(self.juggo_wp)\
   ampa.navigator:setPatrolRoute(table.concat(self.ampa_wp_group, \",\"))\
   chew.navigator:setPatrolRoute(table.concat(self.chew_wp_group, \",\"))\
\
   juggo.navigator:setRunPatrol(true)\
   ampa.navigator:setRunPatrol(true)\
   chew.navigator:setRunPatrol(true)\
\
   juggo:setState(\"talkForbidden\", true)\
   ampa:setState(\"talkForbidden\", true)\
   chew:setState(\"talkForbidden\", true)\
\
   juggo:setIgnoreSleep(true)\
   ampa:setIgnoreSleep(true)\
   chew:setIgnoreSleep(true)\
\
   self:writeLog(\"DiggingStart\")\
   self:setTopicVisible(\"juggo_go_dig\", false)\
\
   self.digTimer = runTimerAdv(1.5, true, self.digStep, self)\
\
   self:subscribeDigToFastForwardTime()\
end\
\
function Step:digStep(delta)\
   local digsDone = self:getParam(\"digsDone\")\
   delta = delta or ((isDebug(\"quest\") and 50) or  1) * math.abs(SkySystem:getTimeRate())\
   --Can't be more than needed for completion\
   delta = math.min(delta, self.digsToComplete - digsDone)\
\
   local ramp = getObj(self.rampName)\
   local pos = ramp:getPose():getPos()\
   pos.y = pos.y + delta\
   ramp:getPose():setPos(pos)\
\
   self:setParam(\"digsDone\", digsDone + delta)\
\
   if self:getParam(\"digsDone\") >= self.digsToComplete then\
      questSystem:fireEvent(\"dig_done\")\
      self.digTimer:stop()\
      self.digTimer = nil\
      SkySystem:unsubscribeFastForwardTime(self.digFFCallback)\
   end\
end\
\
function Step:subscribeDigToFastForwardTime()\
   self.digFFCallback = SkySystem:subscribeFastForwardTime(partial(self.onFastForwardTime, self))\
end\
\
function Step:onFastForwardTime(event, ...)\
   local stepsToCatchUp = math.floor(event.elapsed:getAs(\"rSecond\") / self.digInterval)\
   local digDelta = (isDebug(\"quest\") and 50 or 1)\
   self:digStep(stepsToCatchUp * digDelta)\
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
				[1] = 17;
			};
			["name"] = "start";
			["posX"] = -390;
			["posY"] = -30;
			["script"] = "";
			["type"] = "step";
		};
		["with_zak"] = {
			["ID"] = 21;
			["connectionsID"] = {
				[1] = 37;
			};
			["name"] = "with_zak";
			["posX"] = 1740;
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
   self:setTopicVisible(\"zak_start\", true)\
   self:setTopicVisible(\"zak_about_molly\", false) -- next two are behind this one\
   self:setTopicVisible(\"zak_molly_questions1\", false)\
   self:setTopicVisible(\"zak_molly_questions2\", true)\
   self:setTopicVisible(\"zak_found_molly\", false)\
   self:setTopicVisible(\"zak_give_whistle\", true)\
   self:setTopicVisible(\"molly_with_zak\", false)\
   self:setTopicVisible(\"zak_reward\", true) -- comes after molly_with_zak\
\
   self:setTopicVisible(\"juggo_start\", true)\
   self:setTopicVisible(\"juggo_wants_meat\", true)\
   self:setTopicVisible(\"juggo_about_molly\", false)\
   self:setTopicVisible(\"juggo_still_hungry\", true)\
   self:setTopicVisible(\"juggo_feed\", false)\
   self:setTopicVisible(\"juggo_go_dig\", false)\
   self:setTopicVisible(\"juggo_i_know_owner\", false)\
   self:setTopicVisible(\"juggo_wants_arphant\", true)\
   self:setTopicVisible(\"juggo_tell_whistle_gone\", false)\
   self:setTopicVisible(\"juggo_whistle_gone\", false)\
\
   self:setTopicVisible(\"juggo_give_whistle\", false)\
   self:setTopicVisible(\"juggo_have_weed\", false)\
\
   self:setTopicVisible(\"juggo_what_the_hell\", false)\
   self:setTopicVisible(\"juggo_angry\", false)\
   self:setTopicVisible(\"juggo_weed_worked\", false)\
   self:setTopicVisible(\"juggo_blows_whistle\", false)\
   self:setTopicVisible(\"juggo_reward\", true)\
   self:setTopicVisible(\"juggo_what_now\", false)\
\
   self:setTopicVisible(\"molly_talk\", true)\
   self:setTopicVisible(\"molly_stuck\", true)\
   self:setTopicVisible(\"molly_go_to_zak\", false)\
   self:setTopicVisible(\"molly_give_melon\", true)\
   self:setTopicVisible(\"molly_give_weed\", false)\
   self:declareVar(\"meat_count\", 6)\
   self:setParam(\"JuggoSaidWantsMeat\", false)\
   self:setParam(\"JuggoWasFed\", false)\
   self:setParam(\"JuggoHasWhistle\", false)\
   self:setParam(\"ZakHasWhistle\", false)\
\
\
   self:declareVar(\"molly_wp_group_1_name\", \"q_lost_arphant_molly_wps_1\")\
   self:declareVar(\"molly_wp_group_to_zak_name\", \"q_lost_arphant_molly_wps_to_zak\")\
\
   self:declareVar(\"juggo_wp\", \"q_lost_arphant_juggo_wp_1\") --Juggo only has a single wp\
   self:declareVar(\"chew_wp_group_name\", \"q_lost_arphant_chew_wps\")\
   self:declareVar(\"ampa_wp_group_name\", \"q_lost_arphant_ampa_wps\")\
\
   self:declareVar(\"digsToComplete\", 200)\
   self:declareVar(\"digInterval\", 1.5)\
   self:setParam(\"digsDone\", 0)\
   self:declareVar(\"rampName\", \"q_lost_arphant_bridge\")\
\
   getScene():subscribeOnLocationEnter(self.onLocationEnter, self)\
end\
\
function Quest:onLocationEnter()\
   self:declareVar(\"molly_wp_group_1\", getObjectsInGroupOrdered(self.molly_wp_group_1_name))\
   self:declareVar(\"molly_wp_group_to_zak\", getObjectsInGroupOrdered(self.molly_wp_group_to_zak_name))\
   table.insert(self.molly_wp_group_to_zak, 1, self.molly_wp_group_1[1])\
   table.insert(self.molly_wp_group_to_zak, 2, self.molly_wp_group_1[2])\
   self:declareVar(\"molly_wp_to_zak_end\", self.molly_wp_group_to_zak[#self.molly_wp_group_to_zak])\
\
   self:declareVar(\"ampa_wp_group\", getObjectsInGroupOrdered(self.ampa_wp_group_name))\
   self:declareVar(\"ampa_wp_end\", self.ampa_wp_group[#self.ampa_wp_group])\
   self:declareVar(\"chew_wp_group\", getObjectsInGroupOrdered(self.chew_wp_group_name))\
   self:declareVar(\"chew_wp_end\", self.chew_wp_group[#self.chew_wp_group])\
end\
\
function Quest:onStart()\
   if self:getParam(\"JuggoWasFed\") then\
      self:goToStep(\"gave_food\", true)\
   end\
end\
\
function Quest:onFinish()\
end\
\
function Quest:OnLoadState()\
   if self:getActiveStepName() == \"slave_dig\" then\
      local step = self:getStep(\"slave_dig\")\
      step:subscribeDigToFastForwardTime()\
      step.digTimer = runTimerAdv(1.5, true, step.digStep, step)\
   end\
end\
\
function Quest:equipShovelAndDig(char)\
   char:orientTo(getObj(self.rampName))\
\
   char.shovelEntity = getScene():createEntity(\"shovel.sbg\", \"\")\
   char.shovelEntity:getPose():setParent(char:getBonePose(\"item_slot1\"))\
   char.shovelEntity:getPose():resetLocalPose()\
\
   char:setDefaultAnimation(\"dig_delve_right\")\
   char:setState(\"talkForbidden\", false)\
   char:setIgnoreSleep(false)\
\
   local function onDigSoundEventIn()\
      char.soundManager:OnEventIn(\"dig_dirt\")\
   end\
   char.animationsManager:subscribeAnimationEventIn(\"dig_delve_right\", \"dig_sound\", onDigSoundEventIn)\
end\
\
function Quest:unequipShovel(char)\
   local hlp = require \"helpers\"\
   hlp.safeDestroyEntity(char.shovelEntity)\
   char.shovelEntity = nil\
   char:setDefaultAnimation(\"idle\")\
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
function Quest:getTopicVisible_juggo_tell_whistle_gone()\
   return self:getParam(\"ZakHasWhistle\")\
end\
\
function Quest:getTopicVisible_juggo_have_weed()\
   return hasPlayerItem(\"arphant_tranquilizer_weed.itm\")\
end\
\
function Quest:getTopicVisible_juggo_feed()\
   return hasPlayerItem(\"fried_meat.itm\", self.meat_count)\
end\
\
function Quest:getTopicVisible_molly_give_melon()\
   return hasPlayerItem(\"melon.itm\")\
end\
\
function Quest:getTopicVisible_molly_give_weed()\
   return hasPlayerItem(\"arphant_tranquilizer_weed.itm\")\
end\
\
function Quest:getTopicVisible_juggo_blows_whistle()\
   return self:getParam(\"JuggoHasWhistle\")\
end";
	["title"] = "Lost Arphant";
}
return obj1
