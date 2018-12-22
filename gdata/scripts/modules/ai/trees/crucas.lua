-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_00002"] = {
		["ID"] = 2;
		["child"] = "root";
		["class"] = "BehaviorTree";
		["connectionsID"] = {
			[1] = 55;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "CrucasBT";
		["posX"] = 300;
		["posY"] = 330;
		["script"] = "";
	};
	["node_00003"] = {
		["ID"] = 3;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isGetDamage";
		["posX"] = 1200;
		["posY"] = -870;
		["script"] = "{\
   stateName = \"damage\",\
}\
";
	};
	["node_00004"] = {
		["ID"] = 4;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyDetected";
		["posX"] = 1200;
		["posY"] = -780;
		["script"] = "{\
   senseName = \"enemyDetect\",\
}\
";
	};
	["node_00007"] = {
		["ID"] = 7;
		["child"] = "isEnemyClose";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 9;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyNotClose";
		["posX"] = 960;
		["posY"] = -660;
		["script"] = "";
	};
	["node_00008"] = {
		["ID"] = 8;
		["child"] = "isEnemyDetected";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 4;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyNotDetected";
		["posX"] = 960;
		["posY"] = -780;
		["script"] = "";
	};
	["node_00009"] = {
		["ID"] = 9;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyClose";
		["posX"] = 1200;
		["posY"] = -660;
		["script"] = "{\
   senseName = \"enemyClose\",\
}\
";
	};
	["node_00010"] = {
		["ID"] = 10;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isDead";
		["posX"] = 1200;
		["posY"] = -930;
		["script"] = "{\
   stateName = \"dead\",\
}\
";
	};
	["node_00011"] = {
		["ID"] = 11;
		["child"] = "isDead";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 10;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isAlive";
		["posX"] = 960;
		["posY"] = -930;
		["script"] = "";
	};
	["node_00012"] = {
		["ID"] = 12;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyWarn";
		["posX"] = 1200;
		["posY"] = -720;
		["script"] = "{\
   senseName = \"enemyWarn\",\
}\
";
	};
	["node_00013"] = {
		["ID"] = 13;
		["child"] = "isEnemyWarn";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 12;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyNotWarn";
		["posX"] = 960;
		["posY"] = -720;
		["script"] = "";
	};
	["node_00014"] = {
		["ID"] = 14;
		["children"] = {
			[1] = "isEnemyDetected";
			[2] = "isEnemyNotClose";
			[3] = "isEnemyNotWarn";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 15;
			[2] = 16;
			[3] = 17;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyInWarnDist";
		["posX"] = 1980;
		["posY"] = -120;
		["script"] = "";
	};
	["node_00015"] = {
		["ID"] = 15;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isEnemyDetected";
		["posX"] = 2220;
		["posY"] = -180;
		["script"] = "{\
   senseName = \"enemyDetect\",\
}\
";
	};
	["node_00016"] = {
		["ID"] = 16;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isEnemyNotClose";
		["posX"] = 2220;
		["posY"] = -120;
		["script"] = "";
	};
	["node_00017"] = {
		["ID"] = 17;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isEnemyNotWarn";
		["posX"] = 2220;
		["posY"] = -60;
		["script"] = "";
	};
	["node_00019"] = {
		["ID"] = 19;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "canUseThreat";
		["posX"] = 1200;
		["posY"] = -600;
		["script"] = "{\
   condition = function(self)\
      -- allow threat at simulation start\
      -- (it's nil before idle\\walk sets it to true)\
      return self.canUseThreat ~= false\
   end,\
}\
";
	};
	["node_00020"] = {
		["ID"] = 20;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "face_enemy";
		["posX"] = 1980;
		["posY"] = -60;
		["script"] = "{\
   start_function = Entity.face_enemy_start,\
   running_function = Entity.face_enemy_running,\
   finish_function = Entity.face_enemy_stop,\
}\
";
	};
	["node_00021"] = {
		["ID"] = 21;
		["class"] = "AnimatedAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "threat";
		["posX"] = 1980;
		["posY"] = 0;
		["script"] = "{\
   start_function = Entity.warn_start,\
   finish_function = Entity.warn_stop,\
   animation = \"threat.caf\",\
}\
";
	};
	["node_00022"] = {
		["ID"] = 22;
		["children"] = {
			[1] = "isEnemyInWarnDist";
			[2] = "face_enemy";
			[3] = "threat";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 14;
			[2] = 20;
			[3] = 21;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "warnNode";
		["posX"] = 1740;
		["posY"] = -60;
		["script"] = "";
	};
	["node_00023"] = {
		["ID"] = 23;
		["child"] = "warnNode";
		["class"] = "Repeater";
		["connectionsID"] = {
			[1] = 22;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "repWarnNode";
		["posX"] = 1500;
		["posY"] = -60;
		["script"] = "{\
   times = 2,\
}\
";
	};
	["node_00024"] = {
		["ID"] = 24;
		["children"] = {
			[1] = "canUseThreat";
			[2] = "repWarnNode";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 23;
			[2] = 25;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "checkedRepWarnNode";
		["posX"] = 1260;
		["posY"] = -90;
		["script"] = "";
	};
	["node_00025"] = {
		["ID"] = 25;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "canUseThreat";
		["posX"] = 1500;
		["posY"] = -120;
		["script"] = "{\
   condition = function(self)\
      -- allow threat at simulation start\
      -- (it's nil before idle\\walk sets it to true)\
      return self.canUseThreat ~= false\
   end,\
}\
";
	};
	["node_00026"] = {
		["ID"] = 26;
		["children"] = {
			[1] = "isEnemyDetected";
			[2] = "isEnemyNotClose";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 27;
			[2] = 28;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyFar";
		["posX"] = 1200;
		["posY"] = -510;
		["script"] = "";
	};
	["node_00027"] = {
		["ID"] = 27;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isEnemyDetected";
		["posX"] = 1440;
		["posY"] = -540;
		["script"] = "{\
   senseName = \"enemyDetect\",\
}\
";
	};
	["node_00028"] = {
		["ID"] = 28;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isEnemyNotClose";
		["posX"] = 1440;
		["posY"] = -480;
		["script"] = "";
	};
	["node_00029"] = {
		["ID"] = 29;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "notSwimming";
		["link_type"] = false;
		["name"] = "chase";
		["posX"] = 2700;
		["posY"] = 30;
		["script"] = "{\
   start_function = Entity.chase_start,\
   running_function = true,\
   finish_function = Entity.chase_stop,\
}\
";
	};
	["node_00030"] = {
		["ID"] = 30;
		["class"] = "Wait";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "giveUp";
		["posX"] = 1500;
		["posY"] = 180;
		["script"] = "{\
   seconds = 2,\
}\
";
	};
	["node_00031"] = {
		["ID"] = 31;
		["child"] = "chaseEverywhere";
		["class"] = "TimeLimiter";
		["connectionsID"] = {
			[1] = 67;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "timedChase";
		["posX"] = 1500;
		["posY"] = 60;
		["script"] = "{\
   seconds = 8,\
   finish = Entity.stopMove,\
}\
";
	};
	["node_00032"] = {
		["ID"] = 32;
		["class"] = "AnimatedAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "threat";
		["posX"] = 1980;
		["posY"] = 150;
		["script"] = "{\
   start_function = Entity.warn_start,\
   finish_function = Entity.warn_stop,\
   animation = \"threat.caf\",\
}\
";
	};
	["node_00033"] = {
		["ID"] = 33;
		["children"] = {
			[1] = "timedChase";
			[2] = "optionalThreat";
			[3] = "giveUp";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 30;
			[2] = 31;
			[3] = 64;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "chaseAndGiveUp";
		["posX"] = 1260;
		["posY"] = 120;
		["script"] = "";
	};
	["node_00034"] = {
		["ID"] = 34;
		["class"] = "AnimatedAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hit";
		["posX"] = 1500;
		["posY"] = 330;
		["script"] = "{\
   start_function = Entity.attack_start,\
   finish_function = Entity.attack_stop,\
   animation = \"attack.caf\",\
}\
";
	};
	["node_00035"] = {
		["ID"] = 35;
		["children"] = {
			[1] = "isEnemyClose";
			[2] = "hit";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 34;
			[2] = 36;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hitNode";
		["posX"] = 1260;
		["posY"] = 300;
		["script"] = "";
	};
	["node_00036"] = {
		["ID"] = 36;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isEnemyClose";
		["posX"] = 1500;
		["posY"] = 270;
		["script"] = "{\
   senseName = \"enemyClose\",\
}\
";
	};
	["node_00037"] = {
		["ID"] = 37;
		["children"] = {
			[1] = "checkedRepWarnNode";
			[2] = "chaseAndGiveUp";
			[3] = "hitNode";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 24;
			[2] = 33;
			[3] = 35;
		};
		["guard"] = "isEnemyDetected";
		["link_type"] = false;
		["name"] = "respondToEnemy";
		["posX"] = 960;
		["posY"] = 150;
		["script"] = "";
	};
	["node_00039"] = {
		["ID"] = 39;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "canSeeCorpse";
		["posX"] = 1200;
		["posY"] = -390;
		["script"] = "{\
   condition = function(self)\
      local lastEnemy = self.senseScheduler:getClosestCorpse()\
      return lastEnemy ~= nil and lastEnemy:getState(\"dead\")\
   end,\
}\
";
	};
	["node_00040"] = {
		["ID"] = 40;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "closeToEat";
		["posX"] = 1440;
		["posY"] = -330;
		["script"] = "{\
   condition = function(self)\
      local lastEnemy = self.senseScheduler:getClosestCorpse()\
      local result = objInDist(self:getPose():getPos(), lastEnemy:getPose():getPos(), 150)\
      return result\
   end,\
}\
";
	};
	["node_00041"] = {
		["ID"] = 41;
		["child"] = "closeToEat";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 40;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "notCloseToEat";
		["posX"] = 1200;
		["posY"] = -330;
		["script"] = "";
	};
	["node_00044"] = {
		["ID"] = 44;
		["children"] = {
			[1] = "canSeeCorpse";
			[2] = "notCloseToEat";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 39;
			[2] = 41;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "chaseDeadPrereqs";
		["posX"] = 960;
		["posY"] = -360;
		["script"] = "";
	};
	["node_00045"] = {
		["ID"] = 45;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "chaseDeadPrereqs";
		["link_type"] = false;
		["name"] = "chaseDead";
		["posX"] = 960;
		["posY"] = 450;
		["script"] = "{\
   start_function = Entity.chase_dead_start,\
   running_function = true,\
   finish_function = Entity.chase_dead_stop,\
}\
";
	};
	["node_00046"] = {
		["ID"] = 46;
		["class"] = "AnimatedAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "eatDead";
		["posX"] = 1200;
		["posY"] = 600;
		["script"] = "{\
   start_function = Entity.eat_dead_start,\
   finish_function = Entity.eat_dead_stop,\
   animation = \"eat.caf\",\
}\
";
	};
	["node_00047"] = {
		["ID"] = 47;
		["children"] = {
			[1] = "closeToEat";
			[2] = "eatDead";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 46;
			[2] = 48;
		};
		["guard"] = "canSeeCorpse";
		["link_type"] = false;
		["name"] = "eatDeadNode";
		["posX"] = 960;
		["posY"] = 570;
		["script"] = "";
	};
	["node_00048"] = {
		["ID"] = 48;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "closeToEat";
		["posX"] = 1200;
		["posY"] = 540;
		["script"] = "{\
   condition = function(self)\
      local lastEnemy = self.senseScheduler:getClosestCorpse()\
      local result = objInDist(self:getPose():getPos(), lastEnemy:getPose():getPos(), 150)\
      return result\
   end,\
}\
";
	};
	["node_00049"] = {
		["ID"] = 49;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shortIdle";
		["posX"] = 1200;
		["posY"] = 720;
		["script"] = "{\
   start_function = Entity.shortIdle_start,\
   running_function = Entity.shortIdle_running,\
   finish_function = Entity.shortIdle_stop,\
}\
";
	};
	["node_00050"] = {
		["ID"] = 50;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idle";
		["posX"] = 1200;
		["posY"] = 780;
		["script"] = "{\
   start_function = Entity.idle_start,\
   running_function = Entity.idle_running,\
   finish_function = Entity.idle_stop,\
}\
";
	};
	["node_00051"] = {
		["ID"] = 51;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "walk";
		["posX"] = 1200;
		["posY"] = 900;
		["script"] = "{\
   start_function = Entity.walk_start,\
   running_function = Entity.walk_running,\
   finish_function = Entity.walk_stop,\
}\
";
	};
	["node_00053"] = {
		["ID"] = 53;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "isDead";
		["link_type"] = false;
		["name"] = "death";
		["posX"] = 960;
		["posY"] = -90;
		["script"] = "{\
   start_function = Entity.death_start,\
   running_function = false,\
   finish_function = Entity.death_stop,\
}\
";
	};
	["node_00054"] = {
		["ID"] = 54;
		["class"] = "AnimatedAction";
		["connectionsID"] = {
		};
		["guard"] = "isGetDamage";
		["link_type"] = false;
		["name"] = "damaged";
		["posX"] = 960;
		["posY"] = 30;
		["script"] = "{\
   start_function = Entity.damaged_start,\
   finish_function = Entity.damaged_stop,\
   animation = \"hit__hurt.caf\",\
}\
";
	};
	["node_00055"] = {
		["ID"] = 55;
		["children"] = {
			[1] = "death";
			[2] = "damaged";
			[3] = "respondToEnemy";
			[4] = "chaseDead";
			[5] = "eatDeadNode";
			[6] = "idleBehavior";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 37;
			[2] = 45;
			[3] = 47;
			[4] = 53;
			[5] = 54;
			[6] = 56;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "root";
		["posX"] = 570;
		["posY"] = 330;
		["script"] = "";
	};
	["node_00056"] = {
		["ID"] = 56;
		["children"] = {
			[1] = "shortIdle";
			[2] = "idle";
			[3] = "idle";
			[4] = "walk";
			[5] = "walk";
		};
		["class"] = "RandomSelector";
		["connectionsID"] = {
			[1] = 49;
			[2] = 50;
			[3] = 51;
			[4] = 57;
			[5] = 58;
		};
		["guard"] = "isEnemyNotDetected";
		["link_type"] = false;
		["name"] = "idleBehavior";
		["posX"] = 960;
		["posY"] = 840;
		["script"] = "";
	};
	["node_00057"] = {
		["ID"] = 57;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "idle";
		["posX"] = 1200;
		["posY"] = 840;
		["script"] = "{\
   start_function = Entity.idle_start,\
   running_function = Entity.idle_running,\
   finish_function = Entity.idle_stop,\
}\
";
	};
	["node_00058"] = {
		["ID"] = 58;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "walk";
		["posX"] = 1200;
		["posY"] = 960;
		["script"] = "{\
   start_function = Entity.walk_start,\
   running_function = Entity.walk_running,\
   finish_function = Entity.walk_stop,\
}\
";
	};
	["node_00059"] = {
		["ID"] = 59;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "swimming";
		["posX"] = 1200;
		["posY"] = -1020;
		["script"] = "{\
   stateName = \"swimming\",\
}\
";
	};
	["node_00060"] = {
		["ID"] = 60;
		["child"] = "swimming";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 59;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "notSwimming";
		["posX"] = 960;
		["posY"] = -1020;
		["script"] = "";
	};
	["node_00062"] = {
		["ID"] = 62;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "notSwimming";
		["posX"] = 1980;
		["posY"] = 90;
		["script"] = "";
	};
	["node_00064"] = {
		["ID"] = 64;
		["child"] = "threatOnDryLand";
		["class"] = "ForceSuccess";
		["connectionsID"] = {
			[1] = 65;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "optionalThreat";
		["posX"] = 1500;
		["posY"] = 120;
		["script"] = "";
	};
	["node_00065"] = {
		["ID"] = 65;
		["children"] = {
			[1] = "notSwimming";
			[2] = "threat";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 32;
			[2] = 62;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "threatOnDryLand";
		["posX"] = 1740;
		["posY"] = 120;
		["script"] = "";
	};
	["node_00067"] = {
		["ID"] = 67;
		["children"] = {
			[1] = "chase";
			[2] = "chaseSwim";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 29;
			[2] = 68;
		};
		["guard"] = "isEnemyFar";
		["link_type"] = false;
		["name"] = "chaseEverywhere";
		["posX"] = 2460;
		["posY"] = 60;
		["script"] = "";
	};
	["node_00068"] = {
		["ID"] = 68;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "swimming";
		["link_type"] = false;
		["name"] = "chaseSwim";
		["posX"] = 2700;
		["posY"] = 90;
		["script"] = "{\
   start_function = Entity.chaseSwim_start,\
   running_function = true,\
   finish_function = Entity.chase_stop,\
}\
";
	};
}
return obj1
