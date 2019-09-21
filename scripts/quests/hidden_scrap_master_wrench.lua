-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "";
	["hidden"] = true;
	["nodes"] = {
		["condition_00004"] = {
			["ID"] = 4;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 360;
			["posY"] = 270;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "scrap_master_skip_wrench";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00005"] = {
			["ID"] = 5;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = -330;
			["posY"] = 120;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "scrap_master_wait_wrench";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00006"] = {
			["ID"] = 6;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 930;
			["posY"] = -90;
			["script"] = "function Condition:onCheck(name, obj)\
   addExpToPlayer(self.wrench_exp)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "scrap_master_give_right_wrench";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00007"] = {
			["ID"] = 7;
			["connectionsID"] = {
				[1] = 12;
			};
			["event"] = "discuss";
			["posX"] = 330;
			["posY"] = -360;
			["script"] = "function Condition:onCheck(name, obj)\
   hideObject(self.wrench_4)\
   self:setTopicVisible(\"scrap_master_give_right_wrench\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "wrench_rack_take_4";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00008"] = {
			["ID"] = 8;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 930;
			["posY"] = 30;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "scrap_master_give_wrench";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00010"] = {
			["ID"] = 10;
			["connectionsID"] = {
				[1] = 12;
			};
			["event"] = "discuss";
			["posX"] = 330;
			["posY"] = -720;
			["script"] = "function Condition:onCheck(name, obj)\
   hideObject(self.wrench_1)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "wrench_rack_take_1";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00013"] = {
			["ID"] = 13;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = -330;
			["posY"] = -60;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"scrap_master_intro\", false)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "scrap_master_intro";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00014"] = {
			["ID"] = 14;
			["connectionsID"] = {
				[1] = 12;
			};
			["event"] = "discuss";
			["posX"] = 330;
			["posY"] = -600;
			["script"] = "function Condition:onCheck(name, obj)\
   hideObject(self.wrench_2)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "wrench_rack_take_2";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00015"] = {
			["ID"] = 15;
			["connectionsID"] = {
				[1] = 12;
			};
			["event"] = "discuss";
			["posX"] = 330;
			["posY"] = -240;
			["script"] = "function Condition:onCheck(name, obj)\
   hideObject(self.wrench_5)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "wrench_rack_take_5";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00016"] = {
			["ID"] = 16;
			["connectionsID"] = {
				[1] = 12;
			};
			["event"] = "discuss";
			["posX"] = 330;
			["posY"] = -480;
			["script"] = "function Condition:onCheck(name, obj)\
   hideObject(self.wrench_3)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "wrench_rack_take_3";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00017"] = {
			["ID"] = 17;
			["connectionsID"] = {
				[1] = 12;
			};
			["event"] = "discuss";
			["posX"] = 330;
			["posY"] = -120;
			["script"] = "function Condition:onCheck(name, obj)\
   hideObject(self.wrench_6)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "wrench_rack_take_6";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00018"] = {
			["ID"] = 18;
			["connectionsID"] = {
				[1] = 12;
			};
			["event"] = "discuss";
			["posX"] = 330;
			["posY"] = 0;
			["script"] = "function Condition:onCheck(name, obj)\
   hideObject(self.wrench_7)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "wrench_rack_take_7";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00019"] = {
			["ID"] = 19;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = -330;
			["posY"] = 270;
			["script"] = "function Condition:onCheck(name, obj)\
   self:goToStepTimer(\"finish\", 0.1)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "scrap_master_skip_wrench";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 1380;
			["posY"] = 300;
			["script"] = "";
			["type"] = "step";
		};
		["got_wrench"] = {
			["ID"] = 12;
			["connectionsID"] = {
				[1] = 6;
				[2] = 8;
			};
			["name"] = "got_wrench";
			["posX"] = 660;
			["posY"] = 0;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"scrap_master_give_wrench\", true)\
   self:setTopicVisible(\"scrap_master_wait_wrench\", false)\
   self:setTopicVisible(\"scrap_master_waits_wrench\", false)\
   self:setTopicVisible(\"scrap_master_skip_wrench\", false)\
   disableObject(self.wrench_rack)\
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
				[1] = 4;
				[2] = 7;
				[3] = 10;
				[4] = 14;
				[5] = 15;
				[6] = 16;
				[7] = 17;
				[8] = 18;
			};
			["name"] = "start";
			["posX"] = -90;
			["posY"] = 150;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:declareVar(\"wrench_exp\", 50)\
   self:declareVar(\"wrench_rack\", \"q_hidden_scrap_master_wrench_rack\")\
   self:declareVar(\"wrench_1\", \"q_hidden_scrap_master_wrench_1\")\
   self:declareVar(\"wrench_2\", \"q_hidden_scrap_master_wrench_2\")\
   self:declareVar(\"wrench_3\", \"q_hidden_scrap_master_wrench_3\")\
   self:declareVar(\"wrench_4\", \"q_hidden_scrap_master_wrench_4\")\
   self:declareVar(\"wrench_5\", \"q_hidden_scrap_master_wrench_5\")\
   self:declareVar(\"wrench_6\", \"q_hidden_scrap_master_wrench_6\")\
   self:declareVar(\"wrench_7\", \"q_hidden_scrap_master_wrench_7\")\
\
\
   self:setTopicVisible(\"scrap_master_intro\", true)\
   self:setTopicVisible(\"scrap_master_wait_wrench\", true)\
   self:setTopicVisible(\"scrap_master_waits_wrench\", false)\
   self:setTopicVisible(\"scrap_master_give_wrench\", false)\
   self:setTopicVisible(\"scrap_master_give_right_wrench\", false)\
   self:setTopicVisible(\"scrap_master_skip_wrench\", true)\
   self:setTopicVisible(\"scrap_master_regular_greeting\", false)\
end\
\
function Quest:onStart()\
   self:setTopicVisible(\"scrap_master_waits_wrench\", true)\
   enableObject(self.wrench_rack)\
end\
\
function Quest:onFinish()\
   self:setTopicVisible(\"scrap_master_give_wrench\", false)\
   self:setTopicVisible(\"scrap_master_waits_wrench\", false)\
   self:setTopicVisible(\"scrap_master_regular_greeting\", true)\
   disableObject(self.wrench_rack)\
end\
\
";
	["title"] = "";
}
return obj1
