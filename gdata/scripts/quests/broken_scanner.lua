-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "The scanner I was using was fried and I can no longer use it. I need to find someone who can help me fix it.";
	["hidden"] = false;
	["logs"] = {
		["Finish"] = "I have managed to fix my scanner with the help of Vasily.";
		["VasilyCanFix"] = "Vasily in Hunter's Rest can fix my scanner if I bring him some electronic scrap.";
	};
	["nodes"] = {
		["condition_00003"] = {
			["ID"] = 3;
			["connectionsID"] = {
				[1] = 2;
			};
			["event"] = "discuss";
			["posX"] = 360;
			["posY"] = 270;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "vasily_fix_scanner";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00004"] = {
			["ID"] = 4;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 360;
			["posY"] = 120;
			["script"] = "function Condition:onCheck(obj)\
   self.q:writeLog(\"VasilyCanFix\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "vasily_can_fix_scanner";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 2;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 630;
			["posY"] = 300;
			["script"] = "";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 3;
			};
			["name"] = "start";
			["posX"] = 120;
			["posY"] = 300;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:setTopicVisible(\"vasily_can_fix_scanner\", false)\
   self:setTopicVisible(\"vasily_fix_scanner\", true)\
end\
\
function Quest:onStart()\
   self:setTopicVisible(\"vasily_can_fix_scanner\", true)\
end\
\
function Quest:onFinish()\
   removeItemFromPlayer(\"scrap_electric.itm\")\
   removeItemFromPlayer(\"scanner_broken.itm\")\
   addItemToPlayer(\"scanner.itm\")\
   self:writeLog(\"Finish\")\
end\
\
function Quest:getTopicVisible_vasily_can_fix_scanner()\
   return hasPlayerItem( \"scanner_broken.itm\" )\
end\
\
function Quest:getTopicVisible_vasily_fix_scanner()\
   return hasPlayerItem( \"scrap_electric.itm\" )\
end";
	["title"] = "Fixing the Scanner";
}
return obj1
