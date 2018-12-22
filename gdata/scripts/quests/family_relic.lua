-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "A gravely wounded aborigine named Swift Strider, who was the sole survivor of the massacred trading caravan, asked to find his hatchet and deliver to his brother called Carry the Stone. He works for some mysterious person living in the old terraforming tower near the town. Alternatively, he can be found in saloon, spending his free time drinking. The hatchet is said to be some kind of family heirloom, that has no particular value outside of the family. Whether the hatchet has hit the target or not I must look around the ambush scene and find the weapon. The scanner might be useful for searching for the clues.";
   ["hidden"] = false;
   ["logs"] = {
      ["FoundHatchet"] = "I have found a weathered hatchet in a dead aborigine's head. These locals seems to be tough creatures: he managed to survive and function for at least a couple of hours with a huge piece of steel in his brains.";
      ["FoundHatchetBefore"] = "I managed to find the axe beforehand.";
      ["finish"] = "The family relic has been delivered to Carry the Stone. It seems the relationships between two brothres are quite tense, so Carry cares little for Swift Strider's fate and offered no special reward for my efforts. What was I expecting, playing errand boy for aborigines on this shitty planet?\
";
      ["strider_show_hatchet"] = "I showed the old weathered hatchet to the Swift Strider and it appeared to be his. He refused to take it back so in order to get some reward for my troubles the weapon must be handed over to his brother Carry the Stone.";
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
			["script"] = "function Condition:onCheck(name, obj)\
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
			["posX"] = 990;
			["posY"] = 270;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "finish";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00010"] = {
			["ID"] = 10;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 780;
			["posY"] = 90;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(name)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "strider_show_hatchet";
			["targetsCount"] = 1;
			["type"] = "condition";
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
		["got_axe"] = {
			["ID"] = 5;
			["connectionsID"] = {
				[1] = 9;
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
   self:setTopicVisible(\"strider_unknown\", false)\
   self:setTopicVisible(\"strider_saved\", false)\
   self:setTopicVisible(\"strider_reported\", false)\
   self:setTopicVisible(\"strider_dead\", false)\
   self:setTopicVisible(\"strider_killed\", false)\
   self:setTopicVisible(\"strider_show_hatchet\", true)\
   self:setTopicVisible(\"finish\", false)\
end\
\
function Quest:onStart()\
   self:setTopicVisible(\"strider_unknown\", true)\
   self:setTopicVisible(\"finish\", true)\
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
   giveItemFromPlayerTo(\"family_relic.wpn\", getObj(\"carry_the_stone\"))\
   self:setTopicVisible(\"finish\", false)\
   self:writeLog(\"finish\")\
end\
\
function Quest:getTopicVisible_strider_show_hatchet()\
   return hasPlayerItem(\"family_relic.wpn\")\
end\
\
function Quest:getTopicVisible_finish()\
   return hasPlayerItem(\"family_relic.wpn\")\
end";
	["title"] = "Family Heirloom";
}
return obj1
