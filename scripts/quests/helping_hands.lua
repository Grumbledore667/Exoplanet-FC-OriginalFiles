-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "Eli the warehouse keeper in the Fort asked me to bring him a couple of aboriginal workers to help him take care of the mess that was left by the previous superintendant. To do that I need a permission of Master Phil which is most probably in the cemetery outside the Fort. I can reach it by exiting through the west gate and going along the path.";
	["hidden"] = false;
	["logs"] = {
		["reward"] = "Eli was very satisfied with additional help and showed his appreciation with a pile of shinies.";
		["talk_workers"] = "Master Phil gave his permission to borrow two of his idle workers in the Fort to help Eli.";
		["talked_workers"] = "The workers should be there any minute now. I should tell Eli.";
		["worker1"] = "I've told one of the aborigine workers that he must go and help Eli. He assured me he'll go to the warehouse as soon as he finishes his bottle.";
		["worker2"] = "I've talked to an abori worker about helping Eli. He didn't seem too happy about it but said he'll be there soon.";
	};
	["nodes"] = {
		["condition_00001"] = {
			["ID"] = 1;
			["connectionsID"] = {
				[1] = 0;
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
		["condition_00003"] = {
			["ID"] = 3;
			["connectionsID"] = {
				[1] = 4;
			};
			["event"] = "discuss";
			["posX"] = 570;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "workers";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00007"] = {
			["ID"] = 7;
			["connectionsID"] = {
				[1] = 8;
			};
			["event"] = "discuss";
			["posX"] = 1830;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "finish";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00009"] = {
			["ID"] = 9;
			["connectionsID"] = {
				[1] = 10;
			};
			["event"] = "trigger_out";
			["posX"] = 1320;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "var:worker_trigger";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00012"] = {
			["ID"] = 12;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 510;
			["posY"] = -150;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setParam(\"w1\", true)\
   self:setTopicVisible(\"worker1_phil_said\", false)\
   self:writeLog(\"worker1\")\
   self:goToStep(\"talked_workers\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "worker1_phil_said";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00014"] = {
			["ID"] = 14;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 780;
			["posY"] = -150;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setParam(\"w2\", true)\
   self:setTopicVisible(\"worker2_phil_said\", false)\
   self:writeLog(\"worker2\")\
   self:goToStep(\"talked_workers\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "worker2_phil_said";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 8;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 2100;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"finish\", false)\
   self:writeLog(\"reward\")\
   addItemToPlayer(self.reward_item, self.reward_count)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["on_the_way"] = {
			["ID"] = 10;
			["connectionsID"] = {
				[1] = 7;
			};
			["name"] = "on_the_way";
			["posX"] = 1590;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   teleportTo(getObj(self.worker1), getObj(self.worker1_wp))\
   teleportTo(getObj(self.worker2), getObj(self.worker2_wp))\
   self:setTopicVisible(\"finish\", true)\
   self:writeLog(\"talked_workers\")\
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
			};
			["name"] = "start";
			["posX"] = 330;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"workers\", true)\
   self:setTopicVisible(\"other_workers\", true)\
   self:setTopicVisible(\"worker1\", true)\
   self:setTopicVisible(\"worker2\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["talk_workers"] = {
			["ID"] = 4;
			["connectionsID"] = {
				[1] = 6;
			};
			["name"] = "talk_workers";
			["posX"] = 840;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"workers\", false)\
   self:setTopicVisible(\"worker1_phil_said\", true)\
   self:setTopicVisible(\"worker2_phil_said\", true)\
   self:writeLog(\"talk_workers\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["talked_workers"] = {
			["ID"] = 6;
			["connectionsID"] = {
				[1] = 9;
			};
			["name"] = "talked_workers";
			["posX"] = 1080;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return self:getParam(\"w1\") and self:getParam(\"w2\")\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"other_workers\", false)\
   self:setTopicVisible(\"worker1\", false)\
   self:setTopicVisible(\"worker2\", false)\
   self:setTopicVisible(\"worker1_phil_said\", false)\
   self:setTopicVisible(\"worker2_phil_said\", false)\
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
   self:setTopicVisible(\"finish\", false)\
   self:setTopicVisible(\"workers\", false)\
   self:setTopicVisible(\"other_workers\", false)\
   self:setTopicVisible(\"worker1\", false)\
   self:setTopicVisible(\"worker2\", false)\
   self:setTopicVisible(\"worker1_phil_said\", false)\
   self:setTopicVisible(\"worker2_phil_said\", false)\
   self:declareVar(\"worker1\", \"fort_worker_2\")\
   self:declareVar(\"worker2\", \"fort_worker_3\")\
   self:declareVar(\"worker_trigger\", \"q_helping_hands_worker_trigger\")\
   self:declareVar(\"worker1_wp\", \"q_helping_hands_worker1_wp\")\
   self:declareVar(\"worker2_wp\", \"q_helping_hands_worker2_wp\")\
   self:declareVar(\"reward_item\", \"antigravium_shards.itm\")\
   self:declareVar(\"reward_count\", 100)\
end\
\
function Quest:onStart()\
end\
\
function Quest:onFinish()\
end\
\
";
	["title"] = "Helping Hands";
}
return obj1
