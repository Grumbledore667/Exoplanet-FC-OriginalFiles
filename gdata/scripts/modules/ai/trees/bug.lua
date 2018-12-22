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
	["node_ai.trees.bug.conditions_00029"] = {
		["ID"] = 29;
		["class"] = "IncludeNodes";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ai.trees.bug.conditions";
		["posX"] = 660;
		["posY"] = 330;
		["script"] = "";
	};
	["node_ai.trees.bug.idleBehavior_00020"] = {
		["ID"] = 20;
		["class"] = "IncludeTree";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ai.trees.bug.idleBehavior";
		["posX"] = 660;
		["posY"] = 1020;
		["script"] = "";
	};
	["node_ai.trees.bug.respondToEnemy_00032"] = {
		["ID"] = 32;
		["class"] = "IncludeTree";
		["connectionsID"] = {
		};
		["guard"] = "isEnemyDetected";
		["h"] = 60;
		["link_type"] = false;
		["name"] = "ai.trees.bug.respondToEnemy";
		["posX"] = 660;
		["posY"] = 840;
		["script"] = "";
		["w"] = 270;
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
	["node_damaged_00007"] = {
		["ID"] = 7;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "isGetDamage";
		["link_type"] = false;
		["name"] = "damaged";
		["posX"] = 660;
		["posY"] = 660;
		["script"] = "running_function = Entity.damaged_running\
finish_function = Entity.damaged_finish";
	};
	["node_root_00021"] = {
		["ID"] = 21;
		["children"] = {
			[1] = "caught";
			[2] = "damaged";
			[3] = "ai.trees.bug.respondToEnemy";
			[4] = "ai.trees.bug.idleBehavior";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 3;
			[2] = 7;
			[3] = 20;
			[4] = 32;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "root";
		["posX"] = 390;
		["posY"] = 690;
		["script"] = "";
	};
}
return obj1
