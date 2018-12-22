-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "";
	["hidden"] = true;
	["nodes"] = {
		["condition_00002"] = {
			["ID"] = 2;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 270;
			["posY"] = -30;
			["script"] = "function Condition:onCheck(obj)\
   removeItemFromPlayer(\"bug_dead.itm\")\
   addItemToPlayer(\"fried_bug.itm\")\
   getPlayer():addExp(100)\
   self:setTopicVisible(\"give_bug\", false)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "give_bug";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00004"] = {
			["ID"] = 4;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 510;
			["posY"] = -30;
			["script"] = "function Condition:onCheck(obj)\
   removeItemFromPlayer(\"meat.itm\")\
   addItemsToPlayer(\"antigravium_shards.itm\", 5)\
   getPlayer():addExp(150)\
   self:setTopicVisible(\"give_meat\", false)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "give_meat";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00005"] = {
			["ID"] = 5;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 750;
			["posY"] = -30;
			["script"] = "function Condition:onCheck(obj)\
   removeItemFromPlayer(\"humanoid_leg.itm\")\
   addItemsToPlayer(\"howdah_ammo.itm\", 5)\
   addItemToPlayer(\"cleaver.wpn\")\
   getPlayer():addExp(200)\
   self:setTopicVisible(\"give_leg\", false)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "give_leg";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00006"] = {
			["ID"] = 6;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 390;
			["posY"] = 120;
			["script"] = "function Condition:onCheck(obj)\
   -- old code\
   --[[\
   removeItemFromPlayer(\"kabarog_head.itm\", 4)\
   addItemToPlayer(\"medkit.itm\")\
   addItemToPlayer(\"axe.wpn\")\
   -- HACKETY HACK\
   if (getQuestActiveStepName(\"psychowar\") == \"burn_heads\") then\
      psy = findQuest(\"psychowar\")\
      psy.steps[getQuestActiveStepIndex(\"psychowar\")].result = \"Mister Green gratefully accepted the rotting heads and gave me a medkit and an axe in return. I should tell Jag that the cleanup is finished.\"\
   end\
   stepQuest(\"psychowar\", \"good_ending\")\
   self:setTopicVisible(\"give_hornhog\", false)\
   ]]\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "give_hornhog";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00007"] = {
			["ID"] = 7;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 630;
			["posY"] = 120;
			["script"] = "function Condition:onCheck(obj)\
   -- old code\
   --[[\
   removeItemFromPlayer(\"lem_hard_drive_broken.itm\")\
   stepQuest(\"cannedbrains\", \"sold_green\")\
   stepQuest(\"cannedbrains\", \"finish\")\
   finishQuest(\"cannedbrains\")\
   addItemsToPlayer(\"antigravium_shards.itm\", 250)\
   addItemToPlayer(\"cannibal_spoon.itm\")\
   self:setTopicVisible(\"give_brain\", false)\
   ]]\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "give_brain";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00008"] = {
			["ID"] = 8;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = 60;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 720;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 1;
			["connectionsID"] = {
				[1] = 3;
			};
			["name"] = "start";
			["posX"] = 330;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"deal\", true)\
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
   self:setTopicVisible(\"deal\", false)\
   -- if deal is false then the following topics won't show up anyway\
   self:setTopicVisible(\"give_bug\", true)\
   self:setTopicVisible(\"give_meat\", true)\
   self:setTopicVisible(\"give_leg\", true)\
   --next are disabled\
   self:setTopicVisible(\"give_hornhog\", false)\
   self:setTopicVisible(\"give_brain\", false)\
end\
\
function Quest:onStart()\
end\
\
function Quest:onFinish()\
end\
\
function Quest:getTopicVisible_give_bug()\
   return hasPlayerItem(\"bug_dead.itm\")\
end\
\
function Quest:getTopicVisible_give_meat()\
   return hasPlayerItem(\"meat.itm\")\
end\
\
function Quest:getTopicVisible_give_leg()\
   return hasPlayerItem(\"humanoid_leg.itm\")\
end\
\
function Quest:getTopicVisible_give_hornhog()\
   return hasPlayerItemCount(\"kabarog_head.itm\",4)\
end\
\
function Quest:getTopicVisible_give_brain()\
   return hasPlayerItem(\"lem_hard_drive_broken.itm\")\
end";
	["title"] = "Mister Green's Bring Me Stuff";
}
return obj1
