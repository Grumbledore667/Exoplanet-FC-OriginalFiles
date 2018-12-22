-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "Assistance of skillful hunters is required to track and capture a rare antigravium-imbued mutant.\
Reward: antigravium shards, 150 dead, 300 alive.";
	["hidden"] = false;
	["logs"] = {
		["BugAlive"] = "I caught it alive! Patience pays off.";
		["BugExploded"] = "Damn, I didn't manage to get it alive. The damn bug ate too much antigravium and exploded!";
		["BugKilled"] = "Damn, I didn't manage to get it alive.";
		["FindHive"] = "Time to look for the biggest bitebug hive and a good location to set my trap.";
		["GotCrystal"] = "I've got the crystal of required size and quality. It pains me to use such a valuable thing for feeding disgusting insects. I should smear some desert melon juice on it to make it more attractive.";
		["Missed"] = "Damn, I missed him! I should try again...";
		["MissedAgain"] = "Screw me, missed him again! Alright, last try.";
		["WaitEvening"] = "The bug should appear when it's dark. I should set up a camp and wait till it's evening.";
	};
	["nodes"] = {
		["catch_bug"] = {
			["ID"] = 7;
			["connectionsID"] = {
				[1] = 15;
				[2] = 16;
				[3] = 19;
			};
			["name"] = "catch_bug";
			["posX"] = 720;
			["posY"] = 240;
			["script"] = "function Step:onCheck()\
   if objInDist(getMC():getPose():getPos(), getObj(self.bug_spawn):getPose():getPos(), self.spawn_distance) then\
      self.q:goToStepTimer(self:getName(), 5)\
      gameplayUI:showInfoTextEx(\"I'm standing too close\", \"minor\", \"\")\
      return false\
   else\
      return true\
   end\
end\
\
function Step:onStart()\
   activateObject(self.bug_spawn)\
   self:setParam(\"expMult\", 0)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["catch_bug2"] = {
			["ID"] = 18;
			["connectionsID"] = {
				[1] = 16;
				[2] = 19;
				[3] = 34;
			};
			["name"] = "catch_bug2";
			["posX"] = 720;
			["posY"] = 420;
			["script"] = "function Step:onCheck()\
   if objInDist(getMC():getPose():getPos(), getObj(self.bug_spawn):getPose():getPos(), self.spawn_distance) then\
      self.q:goToStepTimer(self:getName(), 5)\
      gameplayUI:showInfoTextEx(\"I'm standing too close\", \"minor\", \"\")\
      return false\
   else\
      return true\
   end\
end\
\
function Step:onStart()\
   deactivateObject(self.bug_spawn)\
   activateObject(self.bug_spawn)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["catch_bug3"] = {
			["ID"] = 25;
			["connectionsID"] = {
				[1] = 16;
				[2] = 19;
			};
			["name"] = "catch_bug3";
			["posX"] = 720;
			["posY"] = 600;
			["script"] = "function Step:onCheck()\
   if objInDist(getMC():getPose():getPos(), getObj(self.bug_spawn):getPose():getPos(), self.spawn_distance) then\
      self.q:goToStepTimer(self:getName(), 5)\
      gameplayUI:showInfoTextEx(\"I'm standing too close\", \"minor\", \"\")\
      return false\
   else\
      return true\
   end\
end\
\
function Step:onStart()\
   deactivateObject(self.bug_spawn)\
   activateObject(self.bug_spawn)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["condition_00011"] = {
			["ID"] = 11;
			["connectionsID"] = {
				[1] = 4;
			};
			["event"] = "get";
			["posX"] = -300;
			["posY"] = 210;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "antigravium_bait.itm";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00015"] = {
			["ID"] = 15;
			["connectionsID"] = {
				[1] = 36;
			};
			["event"] = "activate";
			["posX"] = -300;
			["posY"] = 390;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "missed_bug";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00016"] = {
			["ID"] = 16;
			["connectionsID"] = {
				[1] = 2;
			};
			["event"] = "get";
			["posX"] = 1170;
			["posY"] = 510;
			["script"] = "function Condition:onCheck(name, obj)\
   self.q:setParam(\"dead_bug\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bug_green_dead.itm";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00019"] = {
			["ID"] = 19;
			["connectionsID"] = {
				[1] = 2;
			};
			["event"] = "get";
			["posX"] = 1170;
			["posY"] = 270;
			["script"] = "function Condition:onCheck(name, obj)\
   self.q:setParam(\"alive_bug\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bug_green.itm";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00034"] = {
			["ID"] = 34;
			["connectionsID"] = {
				[1] = 40;
			};
			["event"] = "activate";
			["posX"] = -300;
			["posY"] = 570;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "missed_bug";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00047"] = {
			["ID"] = 47;
			["connectionsID"] = {
				[1] = 6;
			};
			["event"] = "activate";
			["posX"] = 210;
			["posY"] = 210;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "var:bait_act";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00048"] = {
			["ID"] = 48;
			["connectionsID"] = {
				[1] = 17;
			};
			["event"] = "activate";
			["posX"] = 210;
			["posY"] = 390;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "var:bait_act";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00052"] = {
			["ID"] = 52;
			["connectionsID"] = {
				[1] = 24;
			};
			["event"] = "activate";
			["posX"] = 210;
			["posY"] = 570;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "var:bait_act";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00053"] = {
			["ID"] = 53;
			["connectionsID"] = {
			};
			["event"] = "get";
			["posX"] = -300;
			["posY"] = 60;
			["script"] = "function Condition:onCheck(name, obj)\
   if not self:getParam(\"GotCrystal\") then\
      self:writeLog(\"GotCrystal\")\
      self:setParam(\"GotCrystal\", true)\
   end\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "antigravium.itm";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 1740;
			["posY"] = 420;
			["script"] = "function Step:onCheck()\
   if hasPlayerItem(\"bug_green.itm\") or hasPlayerItem(\"bug_green_dead.itm\") then\
      return true\
   end\
   return false\
end\
\
function Step:onStart()\
   if hasPlayerItem(\"bug_green.itm\") then\
      removeItemFromPlayer(\"bug_green.itm\")\
      addItemToPlayer(\"antigravium_shards.itm\", 300)\
   elseif hasPlayerItem(\"bug_green_dead.itm\") then\
      removeItemFromPlayer(\"bug_green_dead.itm\")\
      addItemToPlayer(\"antigravium_shards.itm\", 150)\
   end\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["get_bait"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 11;
			};
			["name"] = "get_bait";
			["posX"] = -540;
			["posY"] = 240;
			["script"] = "";
			["type"] = "step";
		};
		["set_bait"] = {
			["ID"] = 4;
			["connectionsID"] = {
				[1] = 47;
			};
			["name"] = "set_bait";
			["posX"] = -30;
			["posY"] = 240;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:writeLog(\"FindHive\")\
   showObject(self.bait_act)\
   enableObject(self.bait_act)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["set_bait2"] = {
			["ID"] = 36;
			["connectionsID"] = {
				[1] = 48;
			};
			["name"] = "set_bait2";
			["posX"] = -30;
			["posY"] = 420;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:writeLog(\"Missed\")\
   showObject(self.bait_act)\
   enableObject(self.bait_act)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["set_bait3"] = {
			["ID"] = 40;
			["connectionsID"] = {
				[1] = 52;
			};
			["name"] = "set_bait3";
			["posX"] = -30;
			["posY"] = 600;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:writeLog(\"MissedAgain\")\
   showObject(self.bait_act)\
   enableObject(self.bait_act)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["terminal_end"] = {
			["ID"] = 2;
			["connectionsID"] = {
				[1] = 3;
			};
			["name"] = "terminal_end";
			["posX"] = 1500;
			["posY"] = 420;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   if self:getParam(\"times_got_away\") == 3 and self:getParam(\"dead_bug\") then\
      self:writeLog(\"BugExploded\")\
   elseif self:getParam(\"dead_bug\") then\
      self:writeLog(\"BugKilled\")\
   elseif self:getParam(\"alive_bug\") then\
      self:writeLog(\"BugAlive\")\
   end\
   self:setParam(\"expMult\", 1)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["wait_night"] = {
			["ID"] = 6;
			["connectionsID"] = {
				[1] = 7;
			};
			["name"] = "wait_night";
			["posX"] = 480;
			["posY"] = 240;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:writeLog(\"WaitEvening\")\
   if isDebug(\"quest\") then\
      self.q:goToStepTimer(\"catch_bug\", 1)\
   else\
      self.q:goToStepAtDayState(\"night\", \"catch_bug\", 1)\
   end\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["wait_night2"] = {
			["ID"] = 17;
			["connectionsID"] = {
				[1] = 18;
			};
			["name"] = "wait_night2";
			["posX"] = 480;
			["posY"] = 420;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:writeLog(\"WaitEvening\")\
   if isDebug(\"quest\") then\
      self.q:goToStepTimer(\"catch_bug2\", 1)\
   else\
      self.q:goToStepAtDayState(\"night\", \"catch_bug2\", 1)\
   end\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["wait_night3"] = {
			["ID"] = 24;
			["connectionsID"] = {
				[1] = 25;
			};
			["name"] = "wait_night3";
			["posX"] = 480;
			["posY"] = 600;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:writeLog(\"WaitEvening\")\
   if isDebug(\"quest\") then\
      self.q:goToStepTimer(\"catch_bug3\", 1)\
   else\
      self.q:goToStepAtDayState(\"night\", \"catch_bug3\", 1)\
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
   self:declareVar(\"bait_act\", \"q_greenbug_bait_placeholder\")\
   self:declareVar(\"bug_spawn\", \"q_greenbug_spawn\")\
   self:declareVar(\"spawn_distance\", 1500)\
   self:declareVar(\"spawn_distance\", 1500) --don't forget to set it to 2000\
   self:setParam(\"despawn_dist\", 40)\
   self:setParam(\"eat_time\", 3)\
   self:setParam(\"food_radius\", 500)\
   local markers = {\
      set_bait = {{pos = {x=676, y=1932, z=114877}, radius = 60, tip = \"Bug Hills\"}},\
      set_bait2 = {{pos = {x=676, y=1932, z=114877}, radius = 60, tip = \"Bug Hills\"}},\
      set_bait3 = {{pos = {x=676, y=1932, z=114877}, radius = 60, tip = \"Bug Hills\"}},\
   }\
   self:declareQuestMarkers(markers)\
end\
\
function Quest:onStart()\
   if isDebug(\"quest\") then\
      addItemToPlayer(\"antigravium_bait.itm\", 10)\
   end\
   if hasPlayerItem(\"antigravium_bait.itm\") then\
      self:goToStep(\"set_bait\")\
   elseif hasPlayerItem(\"antigravium.itm\") then\
      self:writeLog(\"GotCrystal\")\
      self:setParam(\"GotCrystal\", true)\
   end\
end\
\
function Quest:onFinish()\
end\
\
";
	["title"] = "Small prey - big gain!";
}
return obj1
