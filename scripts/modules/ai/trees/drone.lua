-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_DroneBT_00003"] = {
		["ID"] = 3;
		["child"] = "root";
		["class"] = "BehaviorTree";
		["connectionsID"] = {
			[1] = 2;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "DroneBT";
		["posX"] = 660;
		["posY"] = 360;
		["script"] = "";
	};
	["node_ai.trees.patrolling_00005"] = {
		["ID"] = 5;
		["class"] = "IncludeTree";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ai.trees.patrolling";
		["posX"] = 1200;
		["posY"] = 300;
		["script"] = "";
	};
	["node_idle_00004"] = {
		["ID"] = 4;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idle";
		["posX"] = 1200;
		["posY"] = 420;
		["script"] = "start_function = Entity.idle_start\
running_function = true";
	};
	["node_root_00002"] = {
		["ID"] = 2;
		["children"] = {
			[1] = "ai.trees.patrolling";
			[2] = "idle";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 4;
			[2] = 5;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "root";
		["posX"] = 930;
		["posY"] = 360;
		["script"] = "";
	};
}
return obj1
