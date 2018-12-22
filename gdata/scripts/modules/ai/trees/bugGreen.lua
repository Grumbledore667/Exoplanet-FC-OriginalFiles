-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_BugBT_00000"] = {
		["ID"] = 0;
		["child"] = "root";
		["class"] = "BehaviorTree";
		["connectionsID"] = {
			[1] = 21;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "BugBT";
		["posX"] = 150;
		["posY"] = 690;
		["script"] = "";
	};
	["node_ai.trees.bug.conditions_00066"] = {
		["ID"] = 66;
		["class"] = "IncludeNodes";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ai.trees.bug.conditions";
		["posX"] = 1200;
		["posY"] = 120;
		["script"] = "";
	};
	["node_ai.trees.bug.idleBehavior_00067"] = {
		["ID"] = 67;
		["class"] = "IncludeTree";
		["connectionsID"] = {
		};
		["guard"] = "";
		["h"] = 60;
		["link_type"] = false;
		["name"] = "ai.trees.bug.idleBehavior";
		["posX"] = 660;
		["posY"] = 1440;
		["script"] = "";
		["w"] = 240;
	};
	["node_ai.trees.bug.respondToEnemy_00073"] = {
		["ID"] = 73;
		["class"] = "IncludeTree";
		["connectionsID"] = {
		};
		["guard"] = "isEnemyDetected";
		["h"] = 60;
		["link_type"] = false;
		["name"] = "ai.trees.bug.respondToEnemy";
		["posX"] = 660;
		["posY"] = 1230;
		["script"] = "";
		["w"] = 270;
	};
	["node_ateTooMuch_00040"] = {
		["ID"] = 40;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ateTooMuch";
		["posX"] = 1320;
		["posY"] = 420;
		["script"] = "condition = function()\
   return (getQuestParam(\"greenbug\", \"times_got_away\") or 0) >= 2\
end";
	};
	["node_caught_00003"] = {
		["ID"] = 3;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "isGotCaught";
		["link_type"] = false;
		["name"] = "caught";
		["posX"] = 660;
		["posY"] = 480;
		["script"] = "start_function = Entity.caught_start";
	};
	["node_chaseBait_00026"] = {
		["ID"] = 26;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "notCloseToBait";
		["link_type"] = false;
		["name"] = "chaseBait";
		["posX"] = 930;
		["posY"] = 840;
		["script"] = "start_function = function(self)\
   self:setOrientationSpeed(600)\
   self:setMoveSpeed(400)\
   self.animationsManager:playCycle(\"run_front\")\
   self:setTarget(getObj(\"q_greenbug_antigravium_bait\"))\
end\
running_function = true\
finish_function = function(self)\
   self:setOrientationSpeed(0)\
   self:setMoveSpeed(0)\
   self:resetTarget()\
end\
";
	};
	["node_closeToBait_00027"] = {
		["ID"] = 27;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "closeToBait";
		["posX"] = 1320;
		["posY"] = 240;
		["script"] = "condition = function(self)\
   local bait = getObj(\"q_greenbug_antigravium_bait\")\
   if objInDist(self:getPose():getPos(), bait:getPose():getPos(), 50) then\
      return true\
   else\
      return false\
   end\
end";
	};
	["node_closeToSpawn_00034"] = {
		["ID"] = 34;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "closeToSpawn";
		["posX"] = 1320;
		["posY"] = 300;
		["script"] = "condition = function(self)\
   local spawn = getObj(\"q_greenbug_spawn\")\
   if objInDist(self:getPose():getPos(), spawn:getPose():getPos(), getQuestParam(\"greenbug\", \"despawn_dist\")) then\
      return true\
   else\
      return false\
   end\
end";
	};
	["node_damaged_00007"] = {
		["ID"] = 7;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "isGetDamage";
		["link_type"] = false;
		["name"] = "damaged";
		["posX"] = 660;
		["posY"] = 750;
		["script"] = "running_function = Entity.damaged_running\
finish_function = Entity.damaged_finish";
	};
	["node_dealWithBait_00025"] = {
		["ID"] = 25;
		["children"] = {
			[1] = "chaseBait";
			[2] = "eatBait";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 26;
			[2] = 32;
		};
		["guard"] = "hasBaitAndHungry";
		["link_type"] = false;
		["name"] = "dealWithBait";
		["posX"] = 660;
		["posY"] = 870;
		["script"] = "";
	};
	["node_death_00005"] = {
		["ID"] = 5;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "isDead";
		["link_type"] = false;
		["name"] = "death";
		["posX"] = 660;
		["posY"] = 570;
		["script"] = "start_function = Entity.death_start";
	};
	["node_despawn_00037"] = {
		["ID"] = 37;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "despawn";
		["posX"] = 930;
		["posY"] = 1080;
		["script"] = "start_function = function(self)\
   local times_got_away = getQuestParam(\"greenbug\", \"times_got_away\") or 0\
   times_got_away = times_got_away + 1\
   setQuestParam(\"greenbug\", \"times_got_away\", times_got_away)\
\
   getScene():destroyEntity(self)\
   questSystem:fireEvent(\"activate\", \"missed_bug\")\
end";
	};
	["node_destroyBait_00031"] = {
		["ID"] = 31;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "destroyBait";
		["posX"] = 1200;
		["posY"] = 930;
		["script"] = "start_function = Entity.hideBait";
	};
	["node_die_00042"] = {
		["ID"] = 42;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "ateTooMuch";
		["link_type"] = false;
		["name"] = "die";
		["posX"] = 660;
		["posY"] = 660;
		["script"] = "start_function = function(self)\
   setQuestParam(\"greenbug\", \"times_got_away\", 3)\
   self:die()\
   self:startJump(200)\
end";
	};
	["node_duringQuest_00052"] = {
		["ID"] = 52;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "duringQuest";
		["posX"] = 1320;
		["posY"] = 570;
		["script"] = "condition = function()\
   return getQuestActiveStepName(\"greenbug\") ~= \"terminal_end\"\
end";
	};
	["node_eatBait_00032"] = {
		["ID"] = 32;
		["children"] = {
			[1] = "enablePickup";
			[2] = "wait";
			[3] = "destroyBait";
			[4] = "setFull";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 31;
			[2] = 43;
			[3] = 45;
			[4] = 51;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "eatBait";
		["posX"] = 930;
		["posY"] = 900;
		["script"] = "";
	};
	["node_eat_00044"] = {
		["ID"] = 44;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "eat";
		["posX"] = 1470;
		["posY"] = 870;
		["script"] = "start_function = function(self)\
   self.animationsManager:playCycle(\"suck\")\
end\
running_function = true\
finish_function = function(self)\
   self.animationsManager:playCycle(\"idle\")\
end\
";
	};
	["node_enablePickup_00043"] = {
		["ID"] = 43;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "enablePickup";
		["posX"] = 1200;
		["posY"] = 810;
		["script"] = "start_function = Entity.enablePickupItem";
	};
	["node_farFromSpawn_00046"] = {
		["ID"] = 46;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "farFromSpawn";
		["posX"] = 1560;
		["posY"] = 510;
		["script"] = "condition = function(self)\
   local spawn = getObj(\"q_greenbug_spawn\")\
   if not spawn then\
      return true\
   end\
   if objInDist(self:getPose():getPos(), spawn:getPose():getPos(), 1500) then\
      return false\
   else\
      return true\
   end\
end";
	};
	["node_foodFull_00048"] = {
		["ID"] = 48;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "foodFull";
		["posX"] = 1560;
		["posY"] = 660;
		["script"] = "stateName = \"foodFull\"";
	};
	["node_goHome_00033"] = {
		["ID"] = 33;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "notCloseToSpawn";
		["link_type"] = false;
		["name"] = "goHome";
		["posX"] = 930;
		["posY"] = 1020;
		["script"] = "start_function = function(self)\
   self:setOrientationSpeed(600)\
   self:setMoveSpeed(400)\
   self.animationsManager:playCycle(\"run_front\")\
   self:setTarget(getObj(\"q_greenbug_spawn\"))\
end\
running_function = true\
finish_function = function(self)\
   self:stopMove()\
   self:resetTarget()\
end\
";
	};
	["node_hasBaitAndHungry_00050"] = {
		["ID"] = 50;
		["children"] = {
			[1] = "notFoodFull";
			[2] = "hasBait";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 24;
			[2] = 49;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hasBaitAndHungry";
		["posX"] = 1080;
		["posY"] = 690;
		["script"] = "";
	};
	["node_hasBait_00024"] = {
		["ID"] = 24;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hasBait";
		["posX"] = 1320;
		["posY"] = 720;
		["script"] = "condition = function()\
   local bait = getObj(\"q_greenbug_antigravium_bait\", true)\
   if bait and bait.getVisible and bait:getVisible() then\
      return true\
   else\
      return false\
   end\
end";
	};
	["node_notAteTooMuch_00041"] = {
		["ID"] = 41;
		["child"] = "ateTooMuch";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 40;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "notAteTooMuch";
		["posX"] = 1080;
		["posY"] = 420;
		["script"] = "";
	};
	["node_notCloseToBait_00029"] = {
		["ID"] = 29;
		["child"] = "closeToBait";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 27;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "notCloseToBait";
		["posX"] = 1080;
		["posY"] = 240;
		["script"] = "";
	};
	["node_notCloseToSpawn_00035"] = {
		["ID"] = 35;
		["child"] = "closeToSpawn";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 34;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "notCloseToSpawn";
		["posX"] = 1080;
		["posY"] = 300;
		["script"] = "";
	};
	["node_notFarFromSpawn_00047"] = {
		["ID"] = 47;
		["child"] = "farFromSpawn";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 46;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "notFarFromSpawn";
		["posX"] = 1320;
		["posY"] = 510;
		["script"] = "";
	};
	["node_notFoodFull_00049"] = {
		["ID"] = 49;
		["child"] = "foodFull";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 48;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "notFoodFull";
		["posX"] = 1320;
		["posY"] = 660;
		["script"] = "";
	};
	["node_root_00021"] = {
		["ID"] = 21;
		["children"] = {
			[1] = "caught";
			[2] = "death";
			[3] = "die";
			[4] = "damaged";
			[5] = "dealWithBait";
			[6] = "runAway";
			[7] = "ai.trees.bug.respondToEnemy";
			[8] = "ai.trees.bug.idleBehavior";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 3;
			[2] = 5;
			[3] = 7;
			[4] = 25;
			[5] = 36;
			[6] = 42;
			[7] = 67;
			[8] = 73;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "root";
		["posX"] = 390;
		["posY"] = 690;
		["script"] = "";
	};
	["node_runAwayPrereqs_00053"] = {
		["ID"] = 53;
		["children"] = {
			[1] = "notFarFromSpawn";
			[2] = "duringQuest";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 47;
			[2] = 52;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "runAwayPrereqs";
		["posX"] = 1080;
		["posY"] = 540;
		["script"] = "";
	};
	["node_runAway_00036"] = {
		["ID"] = 36;
		["children"] = {
			[1] = "goHome";
			[2] = "despawn";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 33;
			[2] = 37;
		};
		["guard"] = "runAwayPrereqs";
		["link_type"] = false;
		["name"] = "runAway";
		["posX"] = 660;
		["posY"] = 1050;
		["script"] = "";
	};
	["node_setFull_00051"] = {
		["ID"] = 51;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "setFull";
		["posX"] = 1200;
		["posY"] = 990;
		["script"] = "start_function = function(self)\
   self:setState(\"foodFull\", true)\
end";
	};
	["node_wait_00045"] = {
		["ID"] = 45;
		["child"] = "eat";
		["class"] = "TimeLimiter";
		["connectionsID"] = {
			[1] = 44;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "wait";
		["posX"] = 1200;
		["posY"] = 870;
		["script"] = "seconds = 5";
	};
}
return obj1
