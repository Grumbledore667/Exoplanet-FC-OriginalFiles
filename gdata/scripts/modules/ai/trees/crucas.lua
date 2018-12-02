-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_CrucasBT_00002"] = {
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
	["node_ai.trees.conditions_00070"] = {
		["ID"] = 70;
		["class"] = "IncludeNodes";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ai.trees.conditions";
		["posX"] = 690;
		["posY"] = -720;
		["script"] = "";
	};
	["node_canUseThreat_00019"] = {
		["ID"] = 19;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "canUseThreat";
		["posX"] = 1200;
		["posY"] = -600;
		["script"] = "condition = function(self)\
   -- allow threat at simulation start\
   -- (it's nil before idle\\walk sets it to true)\
   return self.canUseThreat ~= false\
end";
	};
	["node_canUseThreat_00025"] = {
		["ID"] = 25;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "canUseThreat";
		["posX"] = 1500;
		["posY"] = -120;
		["script"] = "condition = function(self)\
   -- allow threat at simulation start\
   -- (it's nil before idle\\walk sets it to true)\
   return self.canUseThreat ~= false\
end";
	};
	["node_chaseAndEat_00076"] = {
		["ID"] = 76;
		["children"] = {
			[1] = "eatDead";
			[2] = "chaseDead";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 45;
			[2] = 46;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "chaseAndEat";
		["posX"] = 1770;
		["posY"] = 510;
		["script"] = "";
	};
	["node_chaseAndGiveUp_00033"] = {
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
	["node_chaseDeadPrereqs_00044"] = {
		["ID"] = 44;
		["children"] = {
			[1] = "freeCorpseDetected";
			[2] = "notCloseToEat";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 41;
			[2] = 73;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "chaseDeadPrereqs";
		["posX"] = 960;
		["posY"] = -330;
		["script"] = "";
	};
	["node_chaseDead_00045"] = {
		["ID"] = 45;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "chaseDead";
		["posX"] = 2040;
		["posY"] = 540;
		["script"] = "start_function = Entity.chase_dead_start\
running_function = true\
finish_function = Entity.chase_dead_stop";
	};
	["node_chaseEverywhere_00067"] = {
		["ID"] = 67;
		["children"] = {
			[1] = "chase";
			[2] = "chaseSwim";
		};
		["class"] = "DynamicGuardSelector";
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
	["node_chaseSwim_00068"] = {
		["ID"] = 68;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "swimming";
		["link_type"] = false;
		["name"] = "chaseSwim";
		["posX"] = 2700;
		["posY"] = 90;
		["script"] = "start_function = Entity.chaseSwim_start\
running_function = true\
finish_function = Entity.chase_stop";
	};
	["node_chaseUntilClose_00079"] = {
		["ID"] = 79;
		["children"] = {
			[1] = "chaseEverywhere";
			[2] = "proceedToAttack";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 67;
			[2] = 78;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "chaseUntilClose";
		["posX"] = 2220;
		["posY"] = 60;
		["script"] = "";
	};
	["node_chase_00029"] = {
		["ID"] = 29;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "notSwimming";
		["link_type"] = false;
		["name"] = "chase";
		["posX"] = 2700;
		["posY"] = 30;
		["script"] = "start_function = Entity.chase_start\
running_function = true\
finish_function = Entity.chase_stop";
	};
	["node_checkedRepWarnNode_00024"] = {
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
	["node_cleanScavenge_00080"] = {
		["ID"] = 80;
		["child"] = "scavenge";
		["class"] = "Finisher";
		["connectionsID"] = {
			[1] = 71;
		};
		["guard"] = "seesCorpses";
		["link_type"] = false;
		["name"] = "cleanScavenge";
		["posX"] = 1230;
		["posY"] = 480;
		["script"] = "function finish_function(self)\
   local corpse = self:getBBVar(\"corpse\")\
   if corpse then\
      corpse:setState(\"occupied\", false)\
   end\
   self:setBBVar(\"corpse\", nil)\
end";
	};
	["node_closeToEat_00040"] = {
		["ID"] = 40;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "closeToEat";
		["posX"] = 1440;
		["posY"] = -300;
		["script"] = "condition = function(self)\
   local corpse = self:getBBVar(\"corpse\")\
   local result = objInDist(self:getPose():getPos(), corpse:getPose():getPos(), 150)\
   return result\
end";
	};
	["node_damaged_00054"] = {
		["ID"] = 54;
		["class"] = "AnimatedAction";
		["connectionsID"] = {
		};
		["guard"] = "isGetDamage";
		["link_type"] = false;
		["name"] = "damaged";
		["posX"] = 960;
		["posY"] = 30;
		["script"] = "start_function = Entity.damaged_start\
finish_function = Entity.damaged_stop\
animation = \"hit__hurt\"";
	};
	["node_eatDead_00046"] = {
		["ID"] = 46;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "closeToEat";
		["link_type"] = false;
		["name"] = "eatDead";
		["posX"] = 2040;
		["posY"] = 480;
		["script"] = "start_function = Entity.eat_dead_start\
running_function = true\
finish_function = Entity.eat_dead_stop\
";
	};
	["node_face_enemy_00020"] = {
		["ID"] = 20;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "face_enemy";
		["posX"] = 1980;
		["posY"] = -60;
		["script"] = "start_function = Entity.face_enemy_start\
running_function = Entity.face_enemy_running\
finish_function = Entity.face_enemy_stop";
	};
	["node_freeCorpseDetected_00073"] = {
		["ID"] = 73;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "freeCorpseDetected";
		["posX"] = 1200;
		["posY"] = -360;
		["script"] = "condition = function(self)\
   local corpse = self.senseScheduler:getCurrentCorpse()\
   return corpse ~= nil and not corpse:getState(\"occupied\")\
end";
	};
	["node_getCorpseLock_00072"] = {
		["ID"] = 72;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "freeCorpseDetected";
		["link_type"] = false;
		["name"] = "getCorpseLock";
		["posX"] = 1770;
		["posY"] = 450;
		["script"] = "function start_function(self)\
   local corpse = self.senseScheduler:getCurrentCorpse()\
   self:setBBVar(\"corpse\", corpse)\
   corpse:setState(\"occupied\", true)\
end";
	};
	["node_giveUp_00030"] = {
		["ID"] = 30;
		["class"] = "Wait";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "giveUp";
		["posX"] = 1500;
		["posY"] = 180;
		["script"] = "seconds = 2";
	};
	["node_hitNode_00035"] = {
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
	["node_hit_00034"] = {
		["ID"] = 34;
		["class"] = "AnimatedAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hit";
		["posX"] = 1500;
		["posY"] = 330;
		["script"] = "start_function = Entity.attack_start\
finish_function = Entity.attack_stop\
animation = \"attack\"";
	};
	["node_idleBehavior_00056"] = {
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
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idleBehavior";
		["posX"] = 1230;
		["posY"] = 750;
		["script"] = "";
	};
	["node_idle_00050"] = {
		["ID"] = 50;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idle";
		["posX"] = 1500;
		["posY"] = 690;
		["script"] = "running_function = Entity.idle_running\
finish_function = Entity.idle_finish";
	};
	["node_idle_00057"] = {
		["ID"] = 57;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "idle";
		["posX"] = 1500;
		["posY"] = 750;
		["script"] = "running_function = Entity.idle_running\
finish_function = Entity.idle_finish";
	};
	["node_isEnemyClose_00009"] = {
		["ID"] = 9;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyClose";
		["posX"] = 1200;
		["posY"] = -660;
		["script"] = "senseName = \"enemyClose\"";
	};
	["node_isEnemyClose_00036"] = {
		["ID"] = 36;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isEnemyClose";
		["posX"] = 1500;
		["posY"] = 270;
		["script"] = "senseName = \"enemyClose\"";
	};
	["node_isEnemyDetected_00004"] = {
		["ID"] = 4;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyDetected";
		["posX"] = 1200;
		["posY"] = -780;
		["script"] = "senseName = \"enemyDetect\"";
	};
	["node_isEnemyDetected_00015"] = {
		["ID"] = 15;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isEnemyDetected";
		["posX"] = 2220;
		["posY"] = -180;
		["script"] = "senseName = \"enemyDetect\"";
	};
	["node_isEnemyInWarnDist_00014"] = {
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
	["node_isEnemyNotClose_00007"] = {
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
	["node_isEnemyNotClose_00016"] = {
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
	["node_isEnemyNotDetected_00008"] = {
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
	["node_isEnemyNotWarn_00013"] = {
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
	["node_isEnemyNotWarn_00017"] = {
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
	["node_isEnemyWarn_00012"] = {
		["ID"] = 12;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyWarn";
		["posX"] = 1200;
		["posY"] = -720;
		["script"] = "senseName = \"enemyWarn\"";
	};
	["node_metaIdle_00075"] = {
		["ID"] = 75;
		["children"] = {
			[1] = "cleanScavenge";
			[2] = "idleBehavior";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 56;
			[2] = 80;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "metaIdle";
		["posX"] = 960;
		["posY"] = 630;
		["script"] = "";
	};
	["node_notCloseToEat_00041"] = {
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
		["posY"] = -300;
		["script"] = "";
	};
	["node_notSwimming_00060"] = {
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
	["node_notSwimming_00062"] = {
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
	["node_optionalChaseDead_00074"] = {
		["ID"] = 74;
		["class"] = "ForceSuccess";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "optionalChaseDead";
		["posX"] = 2040;
		["posY"] = 390;
		["script"] = "";
	};
	["node_optionalThreat_00064"] = {
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
	["node_proceedToAttack_00078"] = {
		["ID"] = 78;
		["class"] = "Failer";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "proceedToAttack";
		["posX"] = 2460;
		["posY"] = 120;
		["script"] = "";
	};
	["node_repWarnNode_00023"] = {
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
		["script"] = "times = 2";
	};
	["node_respondToEnemy_00037"] = {
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
	["node_root_00055"] = {
		["ID"] = 55;
		["children"] = {
			[1] = "damaged";
			[2] = "respondToEnemy";
			[3] = "metaIdle";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 37;
			[2] = 54;
			[3] = 75;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "root";
		["posX"] = 570;
		["posY"] = 330;
		["script"] = "";
	};
	["node_scavenge_00071"] = {
		["ID"] = 71;
		["children"] = {
			[1] = "getCorpseLock";
			[2] = "chaseAndEat";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 72;
			[2] = 76;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "scavenge";
		["posX"] = 1500;
		["posY"] = 480;
		["script"] = "";
	};
	["node_seesCorpses_00039"] = {
		["ID"] = 39;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "seesCorpses";
		["posX"] = 1200;
		["posY"] = -420;
		["script"] = "senseName = \"seesCorpses\"";
	};
	["node_shortIdle_00049"] = {
		["ID"] = 49;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shortIdle";
		["posX"] = 1500;
		["posY"] = 630;
		["script"] = "running_function = Entity.shortIdle_running\
finish_function = Entity.shortIdle_finish";
	};
	["node_swimming_00059"] = {
		["ID"] = 59;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "swimming";
		["posX"] = 1200;
		["posY"] = -1020;
		["script"] = "stateName = \"swimming\"";
	};
	["node_threatOnDryLand_00065"] = {
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
	["node_threat_00021"] = {
		["ID"] = 21;
		["class"] = "AnimatedAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "threat";
		["posX"] = 1980;
		["posY"] = 0;
		["script"] = "start_function = Entity.warn_start\
finish_function = Entity.warn_stop\
animation = \"threat\"";
	};
	["node_threat_00032"] = {
		["ID"] = 32;
		["class"] = "AnimatedAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "threat";
		["posX"] = 1980;
		["posY"] = 150;
		["script"] = "start_function = Entity.warn_start\
finish_function = Entity.warn_stop\
animation = \"threat\"";
	};
	["node_timedChase_00031"] = {
		["ID"] = 31;
		["child"] = "chaseUntilClose";
		["class"] = "TimeLimiter";
		["connectionsID"] = {
			[1] = 79;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "timedChase";
		["posX"] = 1500;
		["posY"] = 60;
		["script"] = "seconds = 8";
	};
	["node_walk_00051"] = {
		["ID"] = 51;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "canWander";
		["link_type"] = false;
		["name"] = "walk";
		["posX"] = 1500;
		["posY"] = 810;
		["script"] = "start_function = Entity.walk_start\
running_function = Entity.walk_running\
finish_function = Entity.walk_stop";
	};
	["node_walk_00058"] = {
		["ID"] = 58;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "walk";
		["posX"] = 1500;
		["posY"] = 870;
		["script"] = "start_function = Entity.walk_start\
running_function = Entity.walk_running\
finish_function = Entity.walk_stop";
	};
	["node_warnNode_00022"] = {
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
}
return obj1
