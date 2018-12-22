-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "A gravely wounded aborigine named Swift Strider who was the sole survivor of the massacred trading caravan asked to find his hatchet[and deliver to his brother Carry-the-Stone. Carry-the-Stone works at a hoverbike mechanic's shop situated near the small town of New Hope] and bring it to him so that he could die in peace. The hatchet is said to be some kind of family heirloom, that has no particular value outside of the family. Whether the hatchet has hit the target or not I must look around the ambush scene and find the weapon. The scanner might be useful for searching for the clues.";
	["hidden"] = false;
	["logs"] = {
		["FoundHatchet"] = "I have found a weathered hatchet in a dead aborigine's head. These locals seems to be tough creatures: he managed to survive and function for at least a couple of hours with a huge piece of steel in his brains.";
		["FoundHatchetBefore"] = "I managed to find the axe beforehand.";
		["GaveAxe"] = "I gave the axe to Swift Strider. The stubborn sod is still centered on the idea of kicking the bucket (heh) with the axe by his side.";
		["GaveAxeSafe"] = "I gave the axe to Swift Strider. Though his idea of dying with the family relic beside him is now obsolete.";
		["ShowedHatchet"] = "I showed the old weathered hatchet to the Swift Strider and it appeared to be his. He refused to take it back so in order to get some reward for my troubles the weapon must be handed over to his brother Carry-the-Stone.";
	};
	["nodes"] = {
		["condition_00007"] = {
			["ID"] = 7;
			["connectionsID"] = {
				[1] = 5;
			};
			["event"] = "get";
			["posX"] = 510;
			["posY"] = 180;
			["script"] = "function Condition:onCheck(obj)\
   for i=1,5 do\
      disableObject(\"q_relic_hint\"..i)\
   end\
   self:writeLog(\"FoundHatchet\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "family_relic.wpn";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00008"] = {
			["ID"] = 8;
			["connectionsID"] = {
				[1] = 0;
			};
			["event"] = "discuss";
			["posX"] = 30;
			["posY"] = 270;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00009"] = {
			["ID"] = 9;
			["connectionsID"] = {
				[1] = 2;
			};
			["event"] = "discuss";
			["posX"] = 1020;
			["posY"] = 360;
			["script"] = "function Condition:onCheck(obj)\
   self:writeLog(\"GaveAxe\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "strider_give_axe";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00012"] = {
			["ID"] = 12;
			["connectionsID"] = {
				[1] = 2;
			};
			["event"] = "discuss";
			["posX"] = 1020;
			["posY"] = 180;
			["script"] = "function Condition:onCheck(obj)\
   self:writeLog(\"GaveAxeSafe\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "strider_give_axe_safe";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 2;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 1290;
			["posY"] = 300;
			["script"] = "";
			["type"] = "step";
		};
		["got_axe"] = {
			["ID"] = 5;
			["connectionsID"] = {
				[1] = 9;
				[2] = 12;
			};
			["name"] = "got_axe";
			["posX"] = 780;
			["posY"] = 300;
			["script"] = "";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 5;
				[2] = 7;
			};
			["name"] = "start";
			["posX"] = 270;
			["posY"] = 300;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:setTopicVisible(\"start\", true)\
   self:setTopicVisible(\"strider_give_axe\", true)\
   self:setTopicVisible(\"strider_give_axe_safe\", false)\
end\
\
function Quest:onStart()\
   if hasPlayerItem(\"family_relic.wpn\") then\
      self:writeLog(\"FoundHatchetBefore\")\
      self:goToStep(\"got_axe\", true)\
   else\
      for i=1,5 do\
         enableObject(\"q_relic_hint\"..i)\
      end\
   end\
end\
\
function Quest:onFinish()\
   giveItemToNPC(\"family_relic.wpn\", \"swift_strider\")\
   self:setTopicVisible(\"strider_give_axe\", false)\
end\
\
function Quest:getTopicVisible_strider_give_axe()\
   return hasPlayerItem(\"family_relic.wpn\")\
end\
\
function Quest:getTopicVisible_strider_give_axe_safe()\
   return hasPlayerItem(\"family_relic.wpn\")\
end";
	["title"] = "Family Heirloom";
}
return obj1
