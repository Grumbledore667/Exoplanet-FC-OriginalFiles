-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "I've encountered an old aborigine being attacked by the same group of looters who has robbed me. After I've dealt with the pair of bastards, the old abori asked if I can help him get back home in one piece.";
	["hidden"] = false;
	["logs"] = {
		["EscortStart"] = "I promised the poor abori to help him get back to his hideout. He will lead the way and I must protect him from wild beasts and mad outcasts wandering out there.";
		["Finish"] = "Old Outcast rewarded me for saving his life and helping him reach his home. In addition, I can stay in his hideout whenever I want.";
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
			["posX"] = 330;
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
			["targetsAny"] = "var:wp_end_5";
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
   local abori = getObj(self.q.old_outcast)\
   abori:OnFeelOut(obj)\
   if getObj(self.q.spawn_1):getAliveCount() > 0 then\
      return false\
   end\
\
   abori.idleAnimation = \"idle\"\
   if not abori:patrol_() and not abori:fear_() then\
      abori:idle_start()\
   end\
   gameplayUI.subtitlesUI:addSubtitle(\"Oh thank god...\", 3, abori)\
   abori.subtitles = {self.q.abori_sub_move}\
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
   local abori = getObj(self.q.old_outcast)\
   abori:OnFeelOut(obj)\
   if getObj(self.q.spawn_2):getAliveCount() > 0 then\
      return false\
   end\
\
   abori.idleAnimation = \"idle\"\
   if not abori:patrol_() and not abori:fear_() then\
      abori:idle_start()\
   end\
   gameplayUI.subtitlesUI:addSubtitle(\"Holy shit, huma! You're definitely something.\", 5, abori)\
   abori.subtitles = {self.q.abori_sub_move}\
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
   local abori = getObj(self.q.old_outcast)\
   if inList(obj.chars, abori) then\
      if not self.q:isStepPassed(\"escort_start\") then\
         gameplayUI.subtitlesUI:addSubtitle(self.q.abori_sub_1, 7, abori)\
         abori:pausePatrol(3)\
         return true\
      end\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:wp_end_1";
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
   local abori = getObj(self.q.old_outcast)\
   if inList(obj.chars, abori) then\
      if not self.q:isStepPassed(\"encounter_1_clear\") then\
         gameplayUI.subtitlesUI:addSubtitle(self.q.abori_sub_2, 7, abori)\
         abori:pausePatrol(3)\
         return true\
      end\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:wp_end_2";
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
   local abori = getObj(self.q.old_outcast)\
   if inList(obj.chars, abori) then\
      gameplayUI.subtitlesUI:addSubtitle(self.q.abori_sub_3, 3, abori)\
      return true\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:wp_end_3";
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
   local abori = getObj(self.q.old_outcast)\
   if inList(obj.chars, abori) then\
      gameplayUI.subtitlesUI:addSubtitle(self.q.abori_sub_4, 5, abori)\
      return true\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:wp_end_4";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00038"] = {
			["ID"] = 38;
			["connectionsID"] = {
			};
			["event"] = "talk_start";
			["posX"] = 960;
			["posY"] = -360;
			["script"] = "function Condition:onCheck(name, obj)\
   local abori = getObj(self.q.old_outcast)\
   abori:OnFeelIn(getMC())\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:old_outcast";
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
   local abori = getObj(self.q.old_outcast)\
   abori.patrolPoints = self.q:getWPGroups()\
   abori:setState(\"waitsPlayer\", true)\
   activateObject(self.q.old_outcast)\
   activateObject(self.q.spawn_1)\
   activateObject(self.q.spawn_2)\
   abori.dialogState = \"subtitles\"\
   abori.subtitles = {self.q.abori_sub_move}\
\
   self:writeLog(\"EscortStart\")\
   self:setTopicVisible(\"escort\", false)\
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
			["posX"] = 1800;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 1;
			["connectionsID"] = {
				[1] = 4;
			};
			["name"] = "start";
			["posX"] = 570;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:declareVar(\"old_outcast\", \"old_outcast\")\
   self:declareVar(\"wp_group_1\", \"q_abori_goes_home_wp_1_\")\
   self:declareVar(\"wp_group_2\", \"q_abori_goes_home_wp_2_\")\
   self:declareVar(\"wp_group_3\", \"q_abori_goes_home_wp_3_\")\
   self:declareVar(\"wp_group_4\", \"q_abori_goes_home_wp_4_\")\
   self:declareVar(\"wp_group_5\", \"q_abori_goes_home_wp_5_\")\
   self:declareVar(\"wp_end_1\", \"q_abori_goes_home_wp_1_end\")\
   self:declareVar(\"wp_end_2\", \"q_abori_goes_home_wp_2_end\")\
   self:declareVar(\"wp_end_3\", \"q_abori_goes_home_wp_3_end\")\
   self:declareVar(\"wp_end_4\", \"q_abori_goes_home_wp_4_end\")\
   self:declareVar(\"wp_end_5\", \"q_abori_goes_home_wp_5_end\")\
   self:declareVar(\"spawn_1\", \"q_abori_goes_home_encounter_1\")\
   self:declareVar(\"spawn_2\", \"q_abori_goes_home_encounter_2\")\
   self:declareVar(\"abori_sub_1\", \"Down there is a pair of young crucasses lurking. Damn pests are stupid enough to take us for an easy prey, so keep your weapon ready, huma.\")\
   self:declareVar(\"abori_sub_2\", \"Some of the outcasts go mad from drinking dirty water. These might attack us on sight. Be prepared.\")\
   self:declareVar(\"abori_sub_3\", \"Almost There!\")\
   self:declareVar(\"abori_sub_4\", \"Here we are, huma. I bet, you'd never find the entrance on your own!\")\
   self:declareVar(\"abori_sub_move\", \"We've gotta keep moving, huma.\")\
   self:setTopicVisible(\"start\", true)\
   self:setTopicVisible(\"old_outcast_what_now\", true)\
   self:setTopicVisible(\"old_outcast_before_hideout\", true)\
   self:setTopicVisible(\"old_outcast_in_hideout\", false)\
   self:setTopicVisible(\"escort\", false)\
   self:setTopicVisible(\"finish\", false)\
end\
\
function Quest:onStart()\
   self:setTopicVisible(\"start\", false)\
   self:setTopicVisible(\"old_outcast_what_now\", false)\
   self:setTopicVisible(\"escort\", true)\
end\
\
function Quest:onFinish()\
   local abori = getObj(self.old_outcast)\
   abori.dialogState = \"dialog\"\
   abori:setState(\"waitsPlayer\", false)\
   self:setTopicVisible(\"old_outcast_before_hideout\", false)\
   self:setTopicVisible(\"old_outcast_in_hideout\", true)\
   self:setTopicVisible(\"finish\", true)\
   self:writeLog(\"Finish\")\
end\
\
function Quest:OnLoadState()\
end\
\
function Quest:getWPGroups()\
   local group = {}\
   for i=1,5 do\
      local objID = 1\
      local wp = getObj(self[\"wp_group_\"..i]..objID)\
      while wp do\
         table.insert(group, wp)\
         objID = objID + 1\
         wp = getObj(self[\"wp_group_\"..i]..objID, true)\
      end\
      table.insert(group, getObj(self[\"wp_group_\"..i]..\"end\"))\
   end\
   return group\
end\
";
	["title"] = "Abori goes home";
}
return obj1
