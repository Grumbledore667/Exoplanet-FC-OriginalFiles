-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_00000"] = {
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
	["node_00002"] = {
		["ID"] = 2;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isGotCaught";
		["posX"] = 1320;
		["posY"] = -180;
		["script"] = "{\
   stateName = \"caught\",\
}\
";
	};
	["node_00003"] = {
		["ID"] = 3;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "isGotCaught";
		["link_type"] = false;
		["name"] = "caught";
		["posX"] = 660;
		["posY"] = 480;
		["script"] = "{\
   start_function = function (self)\
      self.animationsManager:loopAnimation( \"escaping.caf\" )\
\
      self:setCollision  ( false )\
      self:setFeelVisible( false )\
\
      self.itemsManager:getSlotItem( 0 ):OnDeactivate()\
\
      self:getPose():setParent( self.caughtPose )\
      self:getPose():resetLocalPose()\
      self:getPose():setLocalRotQuat( quatFromEuler({x=-45}) )\
\
      self:disablePickupItem()\
      self.BT = nil\
   end,\
   running_function = false,\
}\
";
	};
	["node_00004"] = {
		["ID"] = 4;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isDead";
		["posX"] = 1320;
		["posY"] = -120;
		["script"] = "{\
   stateName = \"dead\",\
}\
";
	};
	["node_00005"] = {
		["ID"] = 5;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "isDead";
		["link_type"] = false;
		["name"] = "death";
		["posX"] = 660;
		["posY"] = 570;
		["script"] = "{\
   start_function = Entity.death_start,\
   running_function = false,\
   finish_function = Entity.death_stop,\
}\
";
	};
	["node_00006"] = {
		["ID"] = 6;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isGetDamage";
		["posX"] = 1320;
		["posY"] = -60;
		["script"] = "{\
   stateName = \"damage\",\
}\
";
	};
	["node_00007"] = {
		["ID"] = 7;
		["class"] = "AnimatedAction";
		["connectionsID"] = {
		};
		["guard"] = "isGetDamage";
		["link_type"] = false;
		["name"] = "damaged";
		["posX"] = 660;
		["posY"] = 750;
		["script"] = "{\
   start_function = Entity.damaged_start,\
   finish_function = Entity.damaged_stop,\
   animation = \"hit.caf\",\
}\
";
	};
	["node_00008"] = {
		["ID"] = 8;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyDetected";
		["posX"] = 1320;
		["posY"] = 30;
		["script"] = "{\
   senseName = \"enemyDetect\",\
}\
";
	};
	["node_00009"] = {
		["ID"] = 9;
		["child"] = "isEnemyDetected";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 8;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyNotDetected";
		["posX"] = 1080;
		["posY"] = 30;
		["script"] = "";
	};
	["node_00010"] = {
		["ID"] = 10;
		["child"] = "isEnemyClose";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 11;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyNotClose";
		["posX"] = 1080;
		["posY"] = 90;
		["script"] = "";
	};
	["node_00011"] = {
		["ID"] = 11;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyClose";
		["posX"] = 1320;
		["posY"] = 90;
		["script"] = "{\
   senseName = \"enemyClose\",\
}\
";
	};
	["node_00012"] = {
		["ID"] = 12;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "isEnemyNotClose";
		["link_type"] = false;
		["name"] = "chase";
		["posX"] = 900;
		["posY"] = 1320;
		["script"] = "{\
   start_function = Entity.chase_start,\
   running_function = true,\
   finish_function = Entity.chase_stop,\
}\
";
	};
	["node_00013"] = {
		["ID"] = 13;
		["class"] = "AnimatedAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "preattack";
		["posX"] = 1140;
		["posY"] = 1380;
		["script"] = "{\
   start_function = Entity.preattack_start,\
   finish_function = Entity.preattack_stop,\
   animation = \"jump_ready.caf\",\
}\
";
	};
	["node_00014"] = {
		["ID"] = 14;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hit";
		["posX"] = 1140;
		["posY"] = 1440;
		["script"] = "{\
   start_function = Entity.attack_start,\
   running_function = Entity.attack_running,\
   finish_function = Entity.attack_stop,\
}\
";
	};
	["node_00015"] = {
		["ID"] = 15;
		["children"] = {
			[1] = "isEnemyClose";
			[2] = "preattack";
			[3] = "hit";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 13;
			[2] = 14;
			[3] = 22;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "attack";
		["posX"] = 900;
		["posY"] = 1380;
		["script"] = "";
	};
	["node_00017"] = {
		["ID"] = 17;
		["children"] = {
			[1] = "chase";
			[2] = "attack";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 12;
			[2] = 15;
		};
		["guard"] = "isEnemyDetected";
		["link_type"] = false;
		["name"] = "respondToEnemy";
		["posX"] = 660;
		["posY"] = 1350;
		["script"] = "";
	};
	["node_00018"] = {
		["ID"] = 18;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idle";
		["posX"] = 900;
		["posY"] = 1530;
		["script"] = "{\
   start_function = Entity.idle_start,\
   running_function = Entity.idle_running,\
   finish_function = Entity.idle_stop,\
}\
";
	};
	["node_00019"] = {
		["ID"] = 19;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "walk";
		["posX"] = 900;
		["posY"] = 1590;
		["script"] = "{\
   start_function = Entity.walk_start,\
   running_function = Entity.walk_running,\
   finish_function = Entity.walk_stop,\
}\
";
	};
	["node_00020"] = {
		["ID"] = 20;
		["children"] = {
			[1] = "idle";
			[2] = "walk";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 18;
			[2] = 19;
		};
		["guard"] = "isEnemyNotDetected";
		["link_type"] = false;
		["name"] = "idleBehavior";
		["posX"] = 660;
		["posY"] = 1560;
		["script"] = "";
	};
	["node_00021"] = {
		["ID"] = 21;
		["children"] = {
			[1] = "caught";
			[2] = "death";
			[3] = "die";
			[4] = "damaged";
			[5] = "dealWithBait";
			[6] = "runAway";
			[7] = "respondToEnemy";
			[8] = "idleBehavior";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 3;
			[2] = 5;
			[3] = 7;
			[4] = 17;
			[5] = 20;
			[6] = 25;
			[7] = 36;
			[8] = 42;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "root";
		["posX"] = 390;
		["posY"] = 690;
		["script"] = "";
	};
	["node_00022"] = {
		["ID"] = 22;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isEnemyClose";
		["posX"] = 1140;
		["posY"] = 1320;
		["script"] = "{\
   senseName = \"enemyClose\",\
}\
";
	};
	["node_00024"] = {
		["ID"] = 24;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hasBait";
		["posX"] = 1320;
		["posY"] = 720;
		["script"] = "{\
   condition = function(self)\
      local bait = getObj(\"q_greenbug_antigravium_bait\", true)\
      if bait and bait.getVisible and bait:getVisible() then\
         return true\
      else\
         return false\
      end\
   end,\
}\
";
	};
	["node_00025"] = {
		["ID"] = 25;
		["children"] = {
			[1] = "chaseBait";
			[2] = "eatBait";
		};
		["class"] = "Selector";
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
	["node_00026"] = {
		["ID"] = 26;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "notCloseToBait";
		["link_type"] = false;
		["name"] = "chaseBait";
		["posX"] = 930;
		["posY"] = 840;
		["script"] = "{\
   start_function = function(self)\
      self:setOrientationSpeed(600)\
      self:setMoveSpeed(400)\
      self.animationsManager:loopAnimation( \"run_front.caf\" )\
      self:setTarget(getObj(\"q_greenbug_antigravium_bait\"))\
   end,\
   running_function = true,\
   finish_function = function(self)\
      self:setOrientationSpeed(0)\
      self:setMoveSpeed(0)\
      self:resetTarget()\
   end\
}\
";
	};
	["node_00027"] = {
		["ID"] = 27;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "closeToBait";
		["posX"] = 1320;
		["posY"] = 240;
		["script"] = "{\
   condition = function(self)\
      local bait = getObj(\"q_greenbug_antigravium_bait\")\
      if objInDist(self:getPose():getPos(), bait:getPose():getPos(), 50) then\
         return true\
      else\
         return false\
      end\
   end,\
}\
";
	};
	["node_00029"] = {
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
	["node_00031"] = {
		["ID"] = 31;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "destroyBait";
		["posX"] = 1200;
		["posY"] = 930;
		["script"] = "{\
   start_function = Entity.hideBait,\
}\
";
	};
	["node_00032"] = {
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
	["node_00033"] = {
		["ID"] = 33;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "notCloseToSpawn";
		["link_type"] = false;
		["name"] = "goHome";
		["posX"] = 930;
		["posY"] = 1020;
		["script"] = "{\
   start_function = function(self)\
      self:setOrientationSpeed(600)\
      self:setMoveSpeed(400)\
      self.animationsManager:loopAnimation( \"run_front.caf\" )\
      self:setTarget(getObj(\"q_greenbug_spawn\"))\
   end,\
   running_function = true,\
   finish_function = function(self)\
      self:setOrientationSpeed(0)\
      self:setMoveSpeed(0)\
      self:resetTarget()\
   end\
}\
";
	};
	["node_00034"] = {
		["ID"] = 34;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "closeToSpawn";
		["posX"] = 1320;
		["posY"] = 300;
		["script"] = "{\
   condition = function(self)\
      local spawn = getObj(\"q_greenbug_spawn\")\
      if objInDist(self:getPose():getPos(), spawn:getPose():getPos(), getQuestParam(\"greenbug\", \"despawn_dist\")) then\
         return true\
      else\
         return false\
      end\
   end,\
}\
";
	};
	["node_00035"] = {
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
	["node_00036"] = {
		["ID"] = 36;
		["children"] = {
			[1] = "goHome";
			[2] = "despawn";
		};
		["class"] = "Selector";
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
	["node_00037"] = {
		["ID"] = 37;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "despawn";
		["posX"] = 930;
		["posY"] = 1080;
		["script"] = "{\
   start_function = function(self)\
      local times_got_away = getQuestParam(\"greenbug\", \"times_got_away\") or 0\
      times_got_away = times_got_away + 1\
      setQuestParam(\"greenbug\", \"times_got_away\", times_got_away)\
\
      getScene():destroyEntity(self)\
      questSystem:fireEvent(\"activate\", \"missed_bug\")\
   end,\
}\
";
	};
	["node_00038"] = {
		["ID"] = 38;
		["child"] = "isDead";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 4;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotDead";
		["posX"] = 1080;
		["posY"] = -120;
		["script"] = "";
	};
	["node_00040"] = {
		["ID"] = 40;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ateTooMuch";
		["posX"] = 1320;
		["posY"] = 420;
		["script"] = "{\
   condition = function(self)\
      return (getQuestParam(\"greenbug\", \"times_got_away\") or 0) >= 2\
   end,\
}\
";
	};
	["node_00041"] = {
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
	["node_00042"] = {
		["ID"] = 42;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "ateTooMuch";
		["link_type"] = false;
		["name"] = "die";
		["posX"] = 660;
		["posY"] = 660;
		["script"] = "{\
   start_function = function(self)\
      setQuestParam(\"greenbug\", \"times_got_away\", 3)\
      self:die()\
   end,\
}\
";
	};
	["node_00043"] = {
		["ID"] = 43;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "enablePickup";
		["posX"] = 1200;
		["posY"] = 810;
		["script"] = "{\
   start_function = Entity.enablePickupItem,\
}\
";
	};
	["node_00044"] = {
		["ID"] = 44;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "eat";
		["posX"] = 1470;
		["posY"] = 870;
		["script"] = "{\
   start_function = function(self)\
      self.animationsManager:loopAnimation(\"suck.caf\")\
   end,\
   running_function = true,\
   finish_function = function(self)\
      self.animationsManager:loopAnimation(\"idle.caf\")\
   end\
}\
";
	};
	["node_00045"] = {
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
		["script"] = "{\
   seconds = 5,\
}\
";
	};
	["node_00046"] = {
		["ID"] = 46;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "farFromSpawn";
		["posX"] = 1560;
		["posY"] = 510;
		["script"] = "{\
   condition = function(self)\
      local spawn = getObj(\"q_greenbug_spawn\")\
      if objInDist(self:getPose():getPos(), spawn:getPose():getPos(), 1500) then\
         return false\
      else\
         return true\
      end\
   end,\
}\
";
	};
	["node_00047"] = {
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
	["node_00048"] = {
		["ID"] = 48;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "foodFull";
		["posX"] = 1560;
		["posY"] = 660;
		["script"] = "{\
   stateName = \"foodFull\",\
}\
";
	};
	["node_00049"] = {
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
	["node_00050"] = {
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
	["node_00051"] = {
		["ID"] = 51;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "setFull";
		["posX"] = 1200;
		["posY"] = 990;
		["script"] = "{\
   start_function = function(self)\
      self:setState(\"foodFull\", true)\
   end,\
}\
";
	};
	["node_00052"] = {
		["ID"] = 52;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "duringQuest";
		["posX"] = 1320;
		["posY"] = 570;
		["script"] = "{\
   condition = function(self)\
      return getQuestActiveStepName(\"greenbug\") ~= \"terminal_end\"\
   end,\
}\
";
	};
	["node_00053"] = {
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
}
return obj1
