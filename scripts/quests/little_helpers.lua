-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "Msasi, an aborigine in Hunter's Rest camp lost a power cell to bitebugs. They dragged it into some hole that is too small for a human to crawl through. Msasi said that since I possess a scanner, it means I have the ability to remote control chipped bugs. So the plan is to catch a bug alive, insert the chip, then find the hole, which he said is in some cleft in the rocks that's overgrown with blue plants, remote control the bug to crawl into that hole and bring back him a power cell! If that doesn't sound crazy, I don't know what is.";
	["hidden"] = false;
	["logs"] = {
		["BroughtCell"] = "I brought the power cell to Msasi. He rewarded me handsomely.";
		["BroughtCellTerminal"] = "I brought the power cell to Msasi. He rewarded me but didn't take it, so i could plug it in their terminal.";
		["FoundCell"] = "I managed to find the power cell Msasi was talking about. It's kind of small but nevertheless really heavy. That was an interesting experience, to say the least. Now I just gotta bring it to Msasi.";
		["FoundCellBefore"] = "I managed to find the power cell Msasi was talking about beforehand. It's kind of small but nevertheless really heavy. That was an interesting experience, to say the least. Now I just gotta bring it to Msasi.";
	};
	["nodes"] = {
		["condition_00003"] = {
			["ID"] = 3;
			["connectionsID"] = {
				[1] = 4;
			};
			["event"] = "get";
			["posX"] = 480;
			["posY"] = 330;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "power_cell.itm";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00006"] = {
			["ID"] = 6;
			["connectionsID"] = {
				[1] = 2;
			};
			["event"] = "discuss";
			["posX"] = 990;
			["posY"] = 210;
			["script"] = "function Condition:onCheck(name, obj)\
   self.q.hidden = false\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "finish";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00007"] = {
			["ID"] = 7;
			["connectionsID"] = {
				[1] = 0;
			};
			["event"] = "discuss";
			["posX"] = -60;
			["posY"] = 300;
			["script"] = "function Condition:onCheck(name, obj)\
   addItemToPlayer(\"neurochip.itm\", 2)\
   self:setTopicVisible(\"msasi_needs_power_cell\", false)\
   self:setTopicVisible(\"finish\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00012"] = {
			["ID"] = 12;
			["connectionsID"] = {
				[1] = 0;
			};
			["event"] = "get";
			["posX"] = -60;
			["posY"] = 120;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setParam(\"found_cell_before\", true)\
   self.q.hidden = true\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "power_cell.itm";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00014"] = {
			["ID"] = 14;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 240;
			["posY"] = 60;
			["script"] = "function Condition:onCheck(name, obj)\
   self.q.hidden = false\
   fakeQuestStartInfo(self.q)\
   self:setTopicVisible(\"msasi_needs_power_cell\", false)\
   self:setTopicVisible(\"finish\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "msasi_needs_power_cell";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 2;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 1230;
			["posY"] = 240;
			["script"] = "";
			["type"] = "step";
		};
		["found_cell"] = {
			["ID"] = 4;
			["connectionsID"] = {
				[1] = 6;
			};
			["name"] = "found_cell";
			["posX"] = 750;
			["posY"] = 360;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:writeLog(\"FoundCell\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["found_cell_before"] = {
			["ID"] = 13;
			["connectionsID"] = {
				[1] = 6;
			};
			["name"] = "found_cell_before";
			["posX"] = 630;
			["posY"] = 150;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:writeLog(\"FoundCellBefore\")\
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
				[1] = 3;
				[2] = 13;
			};
			["name"] = "start";
			["posX"] = 240;
			["posY"] = 240;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:setTopicVisible(\"start\", true)\
   self:setTopicVisible(\"msasi_needs_power_cell\", true)\
   self:setTopicVisible(\"finish\", false)\
   local markers = {\
      start = {{pos = {x=10162, y=929, z=147950}, radius = 30, tip = \"Lost Power Cell\"}},\
   }\
   self:declareQuestMarkers(markers)\
end\
\
function Quest:onStart()\
   if self:getParam(\"found_cell_before\") then\
      self:goToStep(\"found_cell_before\")\
   end\
end\
\
function Quest:onFinish()\
   addItemToPlayer(\"antigravium_shards.itm\", 200)\
   local terminalStep = getQuest(\"find_terminal\"):getActiveStepName()\
   if terminalStep == \"plug_battery\" then\
      self:writeLog(\"BroughtCellTerminal\")\
   else\
      giveItemFromPlayerTo(\"power_cell.itm\", getObj(\"msasi\"))\
      getQuest(\"find_terminal\"):setTopicVisible(\"msasi_returned_battery_before\", true)\
      self:writeLog(\"BroughtCell\")\
   end\
   self:setTopicVisible(\"msasi_needs_power_cell\", false)\
   self:setTopicVisible(\"finish\", false)\
end\
\
function Quest:getTopicVisible_start()\
   return not self:isActive() and not self.hidden\
end\
\
function Quest:getTopicVisible_finish()\
   return hasPlayerItem(\"power_cell.itm\") and\
   (getQuest(\"find_terminal\"):getActiveStepName() ~= \"plug_battery\"\
    and getQuest(\"find_terminal\"):getActiveStepName() ~= \"return_battery\"\
    and getQuest(\"find_terminal\"):getActiveStepName() ~= \"spawn_terminal\")\
end";
	["title"] = "Little Helpers";
}
return obj1
