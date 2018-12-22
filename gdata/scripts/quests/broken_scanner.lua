-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "The scanner I was using was fried and I can no longer use it. I need to find someone who can help me fix it.";
	["hidden"] = false;
	["logs"] = {
		["can_fix_carry_the_stone"] = "Carry the Stone can fix my scanner if I bring him some electronic scrap.";
		["can_fix_vasily"] = "Vasily in Hunter's Rest can fix my scanner if I bring him some electronic scrap.";
		["fixes_scanner"] = "I have managed to fix my scanner with the help of %s.";
	};
	["nodes"] = {
		["condition_00005"] = {
			["ID"] = 5;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 480;
			["posY"] = 90;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(name .. \"_\" .. obj:getName())\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "can_fix";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00006"] = {
			["ID"] = 6;
			["connectionsID"] = {
				[1] = 2;
			};
			["event"] = "discuss";
			["posX"] = 360;
			["posY"] = 270;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(name, obj:getLabel())\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "fixes_scanner";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00007"] = {
			["ID"] = 7;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 240;
			["posY"] = 90;
			["script"] = "function Condition:onCheck(name, obj)\
   removeItemFromPlayer(\"scrap_electric.itm\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "give_items";
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
				[1] = 6;
			};
			["name"] = "start";
			["posX"] = 120;
			["posY"] = 300;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:setTopicVisible(\"can_fix\", false)\
   self:setTopicVisible(\"fixes_scanner\", true)\
   self:setTopicVisible(\"give_items\", true)\
end\
\
function Quest:onStart()\
   self:setTopicVisible(\"can_fix\", true)\
end\
\
function Quest:onFinish()\
   self:setTopicVisible(\"can_fix\", false)\
   removeItemFromPlayer(\"scanner_broken.itm\")\
   addItemToPlayer(\"scanner.itm\")\
   equipItemForPlayer(\"scanner.itm\", \"gadget\", false)\
end\
\
function Quest:getTopicVisible_can_fix()\
   return hasPlayerItem(\"scanner_broken.itm\")\
end\
\
function Quest:getTopicVisible_give_items()\
   return hasPlayerItem(\"scrap_electric.itm\")\
end";
	["title"] = "Fixing the Scanner";
}
return obj1
