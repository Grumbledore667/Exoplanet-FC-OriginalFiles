-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "Vasily lost his toolbox when he was attacked in the canyon. Without it he can't fix his hoverbike, or anything else.";
	["hidden"] = false;
	["logs"] = {
		["GaveScrap"] = "I gave Vasily enough scrap. Now he can fix his hoverbike and other stuff, maybe even teach me something.";
		["GaveToolbox"] = "I gave Vasily his toolbox but he lacks the mechanical scrap to finally start fixing his bike.";
		["GotTools"] = "I managed to find the toolbox, it's time to turn back.";
		["GotToolsAlready"] = "I already found his toolbox.";
		["LookTurbines"] = "Vasily mentioned that I should look somewhere in the bottom of the canyon of the wind turbines.";
	};
	["nodes"] = {
		["condition_00004"] = {
			["ID"] = 4;
			["connectionsID"] = {
				[1] = 11;
			};
			["event"] = "get";
			["posX"] = 90;
			["posY"] = 270;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(\"GotTools\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "vasily_tools.itm";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00005"] = {
			["ID"] = 5;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -120;
			["posY"] = 120;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(\"LookTurbines\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "vasily_location";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00007"] = {
			["ID"] = 7;
			["connectionsID"] = {
				[1] = 0;
			};
			["event"] = "discuss";
			["posX"] = -360;
			["posY"] = 270;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00010"] = {
			["ID"] = 10;
			["connectionsID"] = {
				[1] = 12;
			};
			["event"] = "discuss";
			["posX"] = 540;
			["posY"] = 270;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(\"GaveToolbox\")\
   giveItemFromPlayerTo(\"vasily_tools.itm\", getObj(\"vasily\"))\
   self:setTopicVisible(\"vasily_get_lost\", false)\
   self:setTopicVisible(\"vasily_give_scrap\", true)\
   getQuest(\"broken_shotgun\"):setTopicVisible(\"vasily_can_fix_shotgun\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "vasily_give_tools";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00013"] = {
			["ID"] = 13;
			["connectionsID"] = {
				[1] = 2;
			};
			["event"] = "discuss";
			["posX"] = 990;
			["posY"] = 270;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(\"GaveScrap\")\
   giveItemFromPlayerTo(\"scrap_mechanical.itm\", getObj(\"vasily\"), 6)\
   self:setTopicVisible(\"vasily_give_scrap\", false)\
   getQuest(\"broken_shotgun\"):setParam(\"discount\", getQuest(\"broken_shotgun\"):getParam(\"discount\") + 1)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "vasily_give_scrap";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["find_scrap"] = {
			["ID"] = 12;
			["connectionsID"] = {
				[1] = 13;
			};
			["name"] = "find_scrap";
			["posX"] = 780;
			["posY"] = 300;
			["script"] = "";
			["type"] = "step";
		};
		["finish"] = {
			["ID"] = 2;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 1230;
			["posY"] = 300;
			["script"] = "";
			["type"] = "step";
		};
		["return_tools"] = {
			["ID"] = 11;
			["connectionsID"] = {
				[1] = 10;
			};
			["name"] = "return_tools";
			["posX"] = 330;
			["posY"] = 300;
			["script"] = "";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 4;
			};
			["name"] = "start";
			["posX"] = -120;
			["posY"] = 300;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"vasily_intro\", false)\
   if hasPlayerItem(\"vasily_tools.itm\") then\
      self:writeLog(\"GotToolsAlready\")\
      self:goToStep(\"return_tools\", true)\
   end\
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
   self:setTopicVisible(\"vasily_intro\", true)\
   self:setTopicVisible(\"vasily_location\", true)\
   self:setTopicVisible(\"vasily_get_lost\", true)\
   self:setTopicVisible(\"vasily_gotta_drink\", true)\
   self:setTopicVisible(\"vasily_give_drink\", false)\
   self:setTopicVisible(\"vasily_give_scrap\", false)\
   self:setTopicVisible(\"vasily_give_tools\", true)\
   self:setTopicVisible(\"finish\", true)\
   self:setTopicVisible(\"vasily_teach\", false)\
end\
\
function Quest:onStart()\
end\
\
function Quest:onFinish()\
   self:setTopicVisible(\"vasily_location\", false)\
   self:setTopicVisible(\"vasily_teach\", true)\
end\
\
function Quest:getTopicVisible_vasily_give_drink()\
   return hasPlayerBooze(1)\
end\
\
function Quest:getTopicVisible_vasily_give_tools()\
   return hasPlayerItem(\"vasily_tools.itm\")\
end\
\
function Quest:getTopicVisible_vasily_give_scrap()\
   return hasPlayerItem(\"scrap_mechanical.itm\", 6)\
end";
	["title"] = "Tools for Vasily";
}
return obj1
