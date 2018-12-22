-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "";
	["hidden"] = true;
	["nodes"] = {
		["condition_00000"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "activate";
			["posX"] = -510;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "var:start_trigger";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00002"] = {
			["ID"] = 2;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 630;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "castor_finish";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00007"] = {
			["ID"] = 7;
			["connectionsID"] = {
				[1] = 8;
			};
			["event"] = "dead";
			["posX"] = 120;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "var:kill_require";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00009"] = {
			["ID"] = 9;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = -120;
			["posY"] = 90;
			["script"] = "function Condition:onCheck(name, obj)\
   getObj(self.kill_require):setAttitudeToMainCharacter(\"ENEMY\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:wade_show_wp_group_end";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00010"] = {
			["ID"] = 10;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "activate";
			["posX"] = -360;
			["posY"] = 390;
			["script"] = "function Condition:onCheck(name, obj)\
   local wade = getObj(self.kill_require)\
   local health = wade:getStatCount(\"health\")\
   wade:setStatCount(\"health\", health * self.wade_poisoned_health_percent / 100)\
   addExpToPlayer(50)\
   gameplayUI.subtitlesUI:addSubtitle(self.jack_poison_subtitles, 4, getMC(), true)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "q_lemonade_wade_food";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 900;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 1;
			["connectionsID"] = {
				[1] = 7;
			};
			["name"] = "start";
			["posX"] = -120;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["wade_dead"] = {
			["ID"] = 8;
			["connectionsID"] = {
				[1] = 2;
			};
			["name"] = "wade_dead";
			["posX"] = 390;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   addExpToPlayer(150)\
   self:setTopicVisible(\"castor_finish\", true)\
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
   self:setTopicVisible(\"castor_finish\", false)\
   self:declareVar(\"start_trigger\", \"q_lemonade_wade_show_trigger\")\
   self:declareVar(\"kill_require\", \"lemonade_wade\")\
   self:declareVar(\"wade_show_wp_group_name\", \"q_lemonade_wade_show_wps\")\
   self:declareVar(\"wade_subtitles\", \"Who's that? Another pesky bounty hunter came sniffing around? Welcome to my little playground, kiddo!\")\
   self:declareVar(\"jack_poison_subtitles\", \"This will soften the big guy up a bit.\")\
   self:declareVar(\"wade_poisoned_health_percent\", 50)\
\
   getScene():subscribeOnLocationEnter(self.onLocationEnter, self)\
end\
\
function Quest:onStart()\
   enableObject(self.kill_require)\
   getObj(self.kill_require):setPatrolRoute(table.concat(self.wade_show_wp_group, \",\"))\
   gameplayUI.subtitlesUI:addSubtitle(self.wade_subtitles, 8, getObj(self.kill_require), true)\
end\
\
function Quest:onFinish()\
   self:setTopicVisible(\"castor_finish\", false)\
   addExpToPlayer(100)\
end\
\
function Quest:onLocationEnter()\
   self:declareVar(\"wade_show_wp_group\", getObjectsInGroupOrdered(self.wade_show_wp_group_name))\
   self:declareVar(\"wade_show_wp_group_end\", self.wade_show_wp_group[#self.wade_show_wp_group])\
   disableObject(self.kill_require)\
end\
\
";
	["title"] = "";
}
return obj1
