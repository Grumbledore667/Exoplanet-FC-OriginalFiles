-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "I've encountered an old aborigine being attacked by the same group of looters who has robbed me. After I've dealt with the pair of bastards, the old abori asked if I can help him get back home in one piece.";
	["group_indices"] = {
	};
	["hidden"] = false;
	["logs"] = {
		["EscortStart"] = "I promised the poor abori to help him get back to his hideout. He will lead the way and I must protect him from wild beasts and mad outcasts wandering out there.";
		["Finish"] = "The Herbalist rewarded me for saving his life and helping him reach his home. In addition, I can stay in his hideout whenever I want.";
		["FirstEncounter"] = "Encountered some crucasses blocking our way. Had to take care of them.";
		["Safety"] = "We have reached the hideout. The entrance is very well hidden in the rocks, I doubt I would find it on my own. Old abori is safe now.";
		["SecondEncounter"] = "A couple of mad outcasts attacked us on our way. I've made a short work of them.";
	};
	["nodes"] = {
		["condition_00000"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = -60;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00013"] = {
			["ID"] = 13;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "activate";
			["posX"] = 1560;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "var:herbalist_wp_end";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00015"] = {
			["ID"] = 15;
			["connectionsID"] = {
			};
			["event"] = "dead";
			["posX"] = 1020;
			["posY"] = 90;
			["script"] = "function Condition:onCheck(name, obj)\
   if self.objects.spawn_1:getAliveCount() > 0 then\
      return false\
   end\
\
   gameplayUI.subtitlesUI:addSubtitle(\"Oh thank god...\", 3, getObj(self.q.herbalist))\
   addExpToPlayer(200)\
   self:writeLog(\"FirstEncounter\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:spawn_1";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00018"] = {
			["ID"] = 18;
			["connectionsID"] = {
			};
			["event"] = "dead";
			["posX"] = 1290;
			["posY"] = 150;
			["script"] = "function Condition:onCheck(name, obj)\
   if self.objects.spawn_2:getAliveCount() > 0 then\
      return false\
   end\
\
   gameplayUI.subtitlesUI:addSubtitle(\"Holy shit, huma! You're definitely something.\", 5, getObj(self.q.herbalist))\
   addExpToPlayer(200)\
   self:writeLog(\"SecondEncounter\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:spawn_2";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00019"] = {
			["ID"] = 19;
			["connectionsID"] = {
			};
			["event"] = "activate";
			["posX"] = 600;
			["posY"] = -180;
			["script"] = "function Condition:onCheck(name, obj)\
   local abori = self.objects.herbalist\
   if abori:isInTrigger(obj) then\
      if not self.q:isStepPassed(\"escort_start\") then\
         gameplayUI.subtitlesUI:addSubtitle(self.abori_sub_1, 7, abori)\
         abori.navigator:pausePatrol(self.herbalist_subtitle_pause)\
         abori.navigator:setPatrolRoute(self.groups.herbalist_wps_2)\
         return true\
      end\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:herbalist_wp_sub_1";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00027"] = {
			["ID"] = 27;
			["connectionsID"] = {
			};
			["event"] = "activate";
			["posX"] = 840;
			["posY"] = -180;
			["script"] = "function Condition:onCheck(name, obj)\
   local abori = self.objects.herbalist\
   if abori:isInTrigger(obj) then\
      if not self.q:isStepPassed(\"encounter_1_clear\") then\
         gameplayUI.subtitlesUI:addSubtitle(self.abori_sub_2, 7, abori)\
         abori.navigator:pausePatrol(self.herbalist_subtitle_pause)\
         abori.navigator:setPatrolRoute(self.groups.herbalist_wps_3)\
         return true\
      end\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:herbalist_wp_sub_2";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00029"] = {
			["ID"] = 29;
			["connectionsID"] = {
			};
			["event"] = "activate";
			["posX"] = 1080;
			["posY"] = -180;
			["script"] = "function Condition:onCheck(name, obj)\
   local abori = self.objects.herbalist\
   if abori:isInTrigger(obj) then\
      gameplayUI.subtitlesUI:addSubtitle(self.abori_sub_3, 3, abori)\
      abori.navigator:setPatrolRoute(self.groups.herbalist_wps_4)\
      return true\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:herbalist_wp_sub_3";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00034"] = {
			["ID"] = 34;
			["connectionsID"] = {
			};
			["event"] = "activate";
			["posX"] = 1320;
			["posY"] = -180;
			["script"] = "function Condition:onCheck(name, obj)\
   local abori = self.objects.herbalist\
   if abori:isInTrigger(obj) then\
      gameplayUI.subtitlesUI:addSubtitle(self.abori_sub_4, 5, abori)\
      abori.navigator:setPatrolRoute(self.groups.herbalist_wps_5)\
      return true\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:herbalist_wp_sub_4";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00035"] = {
			["ID"] = 35;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 2070;
			["posY"] = 180;
			["script"] = "function Condition:onCheck(name, obj)\
   addItemToPlayer(\"fried_meat.itm\", 1)\
   addItemToPlayer(\"melon.itm\", 2)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "finish";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00036"] = {
			["ID"] = 36;
			["connectionsID"] = {
				[1] = 4;
			};
			["event"] = "discuss";
			["posX"] = 450;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "herbalist_follow";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["escort_start"] = {
			["ID"] = 4;
			["connectionsID"] = {
				[1] = 13;
				[2] = 15;
				[3] = 18;
			};
			["name"] = "escort_start";
			["posX"] = 780;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local abori = self.objects.herbalist\
   abori.navigator:setPatrolRoute(self.groups.herbalist_wps_1)\
   abori.navigator:setRunPatrol(true)\
   abori.navigator:setPatrolConvoyObj(getMC())\
   abori:setGuild(\"GLD_PLAYER\")\
   abori:setState(\"talkForbidden\", true)\
   self.objects.spawn_1:activate()\
   self.objects.spawn_2:activate()\
\
   self:setTopicVisible(\"escort\", false)\
   self:writeLog(\"EscortStart\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 1830;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 1;
			["connectionsID"] = {
				[1] = 36;
			};
			["name"] = "start";
			["posX"] = 180;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:declareVar(\"abori_sub_1\", \"Down there is a pair of young crucasses lurking. Damn pests are stupid enough to take us for an easy prey, so keep your weapon ready, huma.\")\
   self:declareVar(\"abori_sub_2\", \"Some of the outcasts go mad from drinking dirty water. These might attack us on sight. Be prepared.\")\
   self:declareVar(\"abori_sub_3\", \"Almost There!\")\
   self:declareVar(\"abori_sub_4\", \"Here we are, huma. I bet, you'd never find the entrance on your own!\")\
\
   local CTime = require \"helpers\".CTime\
   self:declareVar(\"herbalist_subtitle_pause\", CTime(3, \"rSecond\"))\
\
   getScene():subscribeOnLocationEnter(self.onLocationEnter, self)\
end\
\
function Quest:onStart()\
   self:setTopicVisible(\"start\", false)\
   self:setTopicVisible(\"escort\", true)\
   self:setTopicVisible(\"herbalist_follow\", true)\
end\
\
function Quest:onFinish()\
   local abori = self.objects.herbalist\
   abori:setGuild(\"GLD_PLAYER\")\
   abori:setState(\"talkForbidden\", false)\
   abori.navigator:setPatrolConvoyObj(nil)\
   self:setTopicVisible(\"herbalist_before_hideout\", false)\
   self:setTopicVisible(\"herbalist_in_hideout\", true)\
   self:setTopicVisible(\"finish\", true)\
   self:writeLog(\"Safety\")\
end\
\
function Quest:onLocationEnter()\
   if #self.groups.herbalist_wps_1 == 0 then return end\
   self:declareVar(\"herbalist_wp_sub_1\", self.groups.herbalist_wps_1[#self.groups.herbalist_wps_1]:getName())\
   self:declareVar(\"herbalist_wp_sub_2\", self.groups.herbalist_wps_2[#self.groups.herbalist_wps_2]:getName())\
   self:declareVar(\"herbalist_wp_sub_3\", self.groups.herbalist_wps_3[#self.groups.herbalist_wps_3]:getName())\
   self:declareVar(\"herbalist_wp_sub_4\", self.groups.herbalist_wps_4[#self.groups.herbalist_wps_4]:getName())\
   self:declareVar(\"herbalist_wp_end\", self.groups.herbalist_wps_5[#self.groups.herbalist_wps_5]:getName())\
end\
\
function Quest:OnLoadState()\
end\
";
	["title"] = "Abori goes home";
	["topics"] = {
		[1] = {
			["log_id"] = "";
			["name"] = "start";
			["single_use"] = true;
			["visible"] = false;
		};
		[2] = {
			["log_id"] = "";
			["name"] = "herbalist_before_hideout";
			["single_use"] = false;
			["visible"] = true;
		};
		[3] = {
			["log_id"] = "";
			["name"] = "herbalist_in_hideout";
			["single_use"] = false;
			["visible"] = false;
		};
		[4] = {
			["log_id"] = "Finish";
			["name"] = "finish";
			["single_use"] = true;
			["visible"] = false;
		};
		[5] = {
			["log_id"] = "";
			["name"] = "escort";
			["single_use"] = false;
			["visible"] = false;
		};
		[6] = {
			["log_id"] = "";
			["name"] = "herbalist_follow";
			["single_use"] = true;
			["visible"] = false;
		};
	};
	["variables"] = {
		[1] = {
			["icon"] = " ";
			["kind"] = "object";
			["name"] = "herbalist";
			["value"] = "herbalist";
		};
		[2] = {
			["icon"] = "G";
			["kind"] = "group";
			["name"] = "herbalist_wps_1";
			["value"] = "q_abori_goes_home_old_outcast_wps_1";
		};
		[3] = {
			["icon"] = "G";
			["kind"] = "group";
			["name"] = "herbalist_wps_2";
			["value"] = "q_abori_goes_home_old_outcast_wps_2";
		};
		[4] = {
			["icon"] = "G";
			["kind"] = "group";
			["name"] = "herbalist_wps_3";
			["value"] = "q_abori_goes_home_old_outcast_wps_3";
		};
		[5] = {
			["icon"] = "G";
			["kind"] = "group";
			["name"] = "herbalist_wps_4";
			["value"] = "q_abori_goes_home_old_outcast_wps_4";
		};
		[6] = {
			["icon"] = "G";
			["kind"] = "group";
			["name"] = "herbalist_wps_5";
			["value"] = "q_abori_goes_home_old_outcast_wps_5";
		};
		[7] = {
			["icon"] = " ";
			["kind"] = "object";
			["name"] = "spawn_1";
			["value"] = "q_abori_goes_home_encounter_1";
		};
		[8] = {
			["icon"] = " ";
			["kind"] = "object";
			["name"] = "spawn_2";
			["value"] = "q_abori_goes_home_encounter_2";
		};
	};
}
return obj1
