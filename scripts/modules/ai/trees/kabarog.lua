-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_HornhogBT_00000"] = {
		["ID"] = 0;
		["child"] = "root";
		["class"] = "BehaviorTree";
		["connectionsID"] = {
			[1] = 1;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "HornhogBT";
		["posX"] = 360;
		["posY"] = 270;
		["script"] = "";
	};
	["node_ai.trees.conditions_00003"] = {
		["ID"] = 3;
		["class"] = "IncludeNodes";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ai.trees.conditions";
		["posX"] = 1290;
		["posY"] = -210;
		["script"] = "";
	};
	["node_attack_00017"] = {
		["ID"] = 17;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "isEnemyClose";
		["link_type"] = false;
		["name"] = "attack";
		["posX"] = 1170;
		["posY"] = 270;
		["script"] = "running_function = Entity.attack_running\
finish_function = Entity.attack_finish";
	};
	["node_chaseAndWatchUntilClose_00033"] = {
		["ID"] = 33;
		["children"] = {
			[1] = "chaseAndWatch";
			[2] = "proceedToAttack";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 13;
			[2] = 34;
		};
		["guard"] = "";
		["h"] = 60;
		["link_type"] = false;
		["name"] = "chaseAndWatchUntilClose";
		["posX"] = 1170;
		["posY"] = 150;
		["script"] = "";
		["w"] = 240;
	};
	["node_chaseAndWatch_00013"] = {
		["ID"] = 13;
		["children"] = {
			[1] = "limitChaseTime";
			[2] = "watchFinisher";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 12;
			[2] = 40;
		};
		["guard"] = "isEnemyFar";
		["link_type"] = false;
		["name"] = "chaseAndWatch";
		["posX"] = 1440;
		["posY"] = 120;
		["script"] = "";
	};
	["node_chase_00011"] = {
		["ID"] = 11;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "chase";
		["posX"] = 1920;
		["posY"] = 60;
		["script"] = "start_function = Entity.chase_start\
running_function = true\
finish_function = Entity.chase_finish";
	};
	["node_damagedFinisher_00047"] = {
		["ID"] = 47;
		["child"] = "damaged";
		["class"] = "Finisher";
		["connectionsID"] = {
			[1] = 35;
		};
		["guard"] = "isGetDamage";
		["link_type"] = false;
		["name"] = "damagedFinisher";
		["posX"] = 900;
		["posY"] = 30;
		["script"] = "function finish_function(self)\
   self:setState(\"damage\", false)\
end";
	};
	["node_damaged_00035"] = {
		["ID"] = 35;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "shouldPlayHurt";
		["link_type"] = false;
		["name"] = "damaged";
		["posX"] = 1170;
		["posY"] = 30;
		["script"] = "running_function = Entity.damaged_running\
finish_function = Entity.damaged_finish";
	};
	["node_idleBehavior_00005"] = {
		["ID"] = 5;
		["children"] = {
			[1] = "idle";
			[2] = "longIdle";
			[3] = "walk4";
		};
		["class"] = "RandomSelector";
		["connectionsID"] = {
			[1] = 2;
			[2] = 4;
			[3] = 9;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idleBehavior";
		["posX"] = 900;
		["posY"] = 420;
		["script"] = "";
	};
	["node_idle_00002"] = {
		["ID"] = 2;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idle";
		["posX"] = 1170;
		["posY"] = 360;
		["script"] = "running_function = Entity.idle_running";
	};
	["node_limitChaseTime_00012"] = {
		["ID"] = 12;
		["child"] = "chase";
		["class"] = "TimeLimiter";
		["connectionsID"] = {
			[1] = 11;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "limitChaseTime";
		["posX"] = 1680;
		["posY"] = 60;
		["script"] = "seconds = 8";
	};
	["node_longIdle_00004"] = {
		["ID"] = 4;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "longIdle";
		["posX"] = 1170;
		["posY"] = 420;
		["script"] = "running_function = Entity.longIdle_running\
finish_function = Entity.longIdle_finish";
	};
	["node_playIdle_00029"] = {
		["ID"] = 29;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "playIdle";
		["posX"] = 2160;
		["posY"] = 120;
		["script"] = "start_function = Entity.playIdle_start";
	};
	["node_proceedToAttack_00034"] = {
		["ID"] = 34;
		["class"] = "Failer";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "proceedToAttack";
		["posX"] = 1440;
		["posY"] = 180;
		["script"] = "";
	};
	["node_respondToEnemy_00038"] = {
		["ID"] = 38;
		["children"] = {
			[1] = "chaseAndWatchUntilClose";
			[2] = "attack";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 17;
			[2] = 33;
		};
		["guard"] = "isEnemyDetected";
		["link_type"] = false;
		["name"] = "respondToEnemy";
		["posX"] = 900;
		["posY"] = 210;
		["script"] = "";
	};
	["node_root_00001"] = {
		["ID"] = 1;
		["children"] = {
			[1] = "damagedFinisher";
			[2] = "respondToEnemy";
			[3] = "idleBehavior";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 5;
			[2] = 38;
			[3] = 47;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "root";
		["posX"] = 630;
		["posY"] = 270;
		["script"] = "";
	};
	["node_shouldPlayHurt_00043"] = {
		["ID"] = 43;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shouldPlayHurt";
		["posX"] = 1620;
		["posY"] = -120;
		["script"] = "condition = Entity.shouldPlayHurt_condition";
	};
	["node_wait_00027"] = {
		["ID"] = 27;
		["class"] = "Wait";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "wait";
		["posX"] = 2160;
		["posY"] = 180;
		["script"] = "seconds = 4";
	};
	["node_walk4_00009"] = {
		["ID"] = 9;
		["child"] = "walk";
		["class"] = "TimeLimiter";
		["connectionsID"] = {
			[1] = 8;
		};
		["guard"] = "canWander";
		["link_type"] = false;
		["name"] = "walk4";
		["posX"] = 1170;
		["posY"] = 480;
		["script"] = "seconds = 4";
	};
	["node_walk_00008"] = {
		["ID"] = 8;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "walk";
		["posX"] = 1440;
		["posY"] = 480;
		["script"] = "start_function = Entity.walk_start\
running_function = true\
finish_function = Entity.walk_finish";
	};
	["node_watchFinisher_00040"] = {
		["ID"] = 40;
		["child"] = "watch";
		["class"] = "Finisher";
		["connectionsID"] = {
			[1] = 30;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "watchFinisher";
		["posX"] = 1680;
		["posY"] = 150;
		["script"] = "function finish_function(self)\
   self:setOrientationSpeed(0)\
   self:resetTarget()\
end";
	};
	["node_watch_00030"] = {
		["ID"] = 30;
		["children"] = {
			[1] = "playIdle";
			[2] = "wait";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 27;
			[2] = 29;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "watch";
		["posX"] = 1920;
		["posY"] = 150;
		["script"] = "";
	};
}
return obj1
