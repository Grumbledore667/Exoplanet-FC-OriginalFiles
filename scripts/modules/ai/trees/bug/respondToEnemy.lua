-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_ai.trees.bug.conditions_00011"] = {
		["ID"] = 11;
		["class"] = "IncludeNodes";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ai.trees.bug.conditions";
		["posX"] = 960;
		["posY"] = -30;
		["script"] = "";
	};
	["node_attack_00016"] = {
		["ID"] = 16;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "attack";
		["posX"] = 660;
		["posY"] = 180;
		["script"] = "running_function = Entity.attack_running\
finish_function = Entity.attack_finish";
	};
	["node_chaseUntilClose_00014"] = {
		["ID"] = 14;
		["children"] = {
			[1] = "chase";
			[2] = "return";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 12;
			[2] = 15;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "chaseUntilClose";
		["posX"] = 660;
		["posY"] = 120;
		["script"] = "";
	};
	["node_chase_00015"] = {
		["ID"] = 15;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "isEnemyNotClose";
		["link_type"] = false;
		["name"] = "chase";
		["posX"] = 930;
		["posY"] = 90;
		["script"] = "start_function = Entity.chase_start\
running_function = true\
finish_function = Entity.chase_finish";
	};
	["node_ignored_00010"] = {
		["ID"] = 10;
		["child"] = "respondToEnemy";
		["class"] = "BehaviorTree";
		["connectionsID"] = {
			[1] = 13;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ignored";
		["posX"] = 150;
		["posY"] = 150;
		["script"] = "";
	};
	["node_respondToEnemy_00013"] = {
		["ID"] = 13;
		["children"] = {
			[1] = "chaseUntilClose";
			[2] = "attack";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 14;
			[2] = 16;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "respondToEnemy";
		["posX"] = 420;
		["posY"] = 150;
		["script"] = "";
	};
	["node_return_00012"] = {
		["ID"] = 12;
		["class"] = "Failer";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "return";
		["posX"] = 930;
		["posY"] = 150;
		["script"] = "";
	};
}
return obj1
