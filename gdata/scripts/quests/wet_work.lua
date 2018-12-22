-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "Eastern Road Company is concerned about the heightened criminal situation in the region, and would like to offer marksmen a reward for exterminating aborigine raider outcasts and escaped human convicts in the Windscream canyon area.\
\
In case of aggressive aborigines, the proof of death is a severed right thumb, two for each. The superstitious natives believe that without their thumbs they aren't going to be able to hold weapons in the afterlife to fend for themselves and are willing to fight to the death to avoid such a fate.\
\
As for the human criminals, a proof of a job well done is a temporal brain implant id chip.\
\
The Company strongly recommends against all attempts to fake an id chip or to forcefully remove them from the brains of innocent citizens. In case of the aborigines the marksmen are free to act at their own risk, however the Company does not approve killing members of Stone Heads tribe with whom an indefinite truce was procured.\
\
To recieve the reward the trophies should be brought to a Company representative captain Castor in the Fort.\
\
Currently the following pricing are in effect:\
Escaped convict - 10\
Aborigine raider - 10";
	["hidden"] = false;
	["nodes"] = {
		["condition_00004"] = {
			["ID"] = 4;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = -60;
			["posY"] = 240;
			["script"] = "function Condition:onCheck(name, obj)\
   runTimer(0, self, function(self) self:setTopicVisible(\"terminal\", false) end, false)\
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
			};
			["event"] = "discuss";
			["posX"] = 480;
			["posY"] = 120;
			["script"] = "function Condition:onCheck(name, obj)\
   self:goToStep(\"give_tokens\")\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "give_tokens";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 840;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["give_tokens"] = {
			["ID"] = 9;
			["connectionsID"] = {
				[1] = 3;
			};
			["name"] = "give_tokens";
			["posX"] = 510;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   local getbonusMoneyCount = function(itemName)\
      local count = getPlayerItemCount(itemName)\
      if count == 0 then return 0 end\
      giveItemFromPlayerTo(itemName, getObj(\"castor\"), count)\
      if itemName == \"token_abori.itm\" then count = count/2 end\
      local bonuscount = 0\
      local total = self:getParam(\"totalTokens\")\
      if total < 5 and total + count >= 5 then\
         bonuscount = 10\
      end\
      if total < 10 and total + count >= 10 then\
         bonuscount = bonuscount + 20\
      end\
      if total < 20 and total + count >= 20 then\
         bonuscount = bonuscount + 30\
      end\
      if total + count >= 40 then\
         bonuscount = bonuscount + 40\
      end\
      self:setParam(\"totalTokens\", self:getParam(\"totalTokens\") + count)\
      return 10 * count + bonuscount\
   end\
   local count1 = getbonusMoneyCount(\"token_human.itm\")\
   local count2 = getbonusMoneyCount(\"token_abori.itm\")\
   addItemToPlayer(\"antigravium_shards.itm\", count1+count2)\
   getMC():addExp((count1+count2) * 2)\
   return false\
end\
\
function Step:onStart()\
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
				[1] = 9;
			};
			["name"] = "start";
			["posX"] = 210;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"terminal\", true)\
   self:setTopicVisible(\"give_tokens\", true)\
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
   self:setTopicVisible(\"intro\", true)\
   self:setTopicVisible(\"terminal\", false)\
   self:setTopicVisible(\"give_tokens\", false)\
   self:setParam(\"totalTokens\", 0)\
end\
\
function Quest:onStart()\
end\
\
function Quest:onFinish()\
end\
\
function Quest:getTopicVisible_give_tokens()\
   return hasPlayerItem(\"token_human.itm\") or hasPlayerItem(\"token_abori.itm\")\
end\
\
";
	["title"] = "Wet Work";
}
return obj1
