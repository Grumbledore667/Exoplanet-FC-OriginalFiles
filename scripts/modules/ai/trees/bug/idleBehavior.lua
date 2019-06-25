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
	["node_idleBehavior_00005"] = {
		["ID"] = 5;
		["children"] = {
			[1] = "timedIdle";
			[2] = "zigZagWalk";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 4;
			[2] = 7;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idleBehavior";
		["posX"] = 390;
		["posY"] = 150;
		["script"] = "";
	};
	["node_idle_00003"] = {
		["ID"] = 3;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idle";
		["posX"] = 870;
		["posY"] = 120;
		["script"] = "start_function = Entity.idle_start\
running_function = true";
	};
	["node_ignored_00010"] = {
		["ID"] = 10;
		["child"] = "idleBehavior";
		["class"] = "BehaviorTree";
		["connectionsID"] = {
			[1] = 5;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ignored";
		["posX"] = 150;
		["posY"] = 150;
		["script"] = "";
	};
	["node_rep4_00009"] = {
		["ID"] = 9;
		["child"] = "timedWalk";
		["class"] = "Repeater";
		["connectionsID"] = {
			[1] = 2;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "rep4";
		["posX"] = 870;
		["posY"] = 210;
		["script"] = "times = 4";
	};
	["node_rep8_00008"] = {
		["ID"] = 8;
		["child"] = "timedWalk";
		["class"] = "Repeater";
		["connectionsID"] = {
			[1] = 2;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "rep8";
		["posX"] = 870;
		["posY"] = 270;
		["script"] = "times = 8";
	};
	["node_timedIdle_00004"] = {
		["ID"] = 4;
		["child"] = "idle";
		["class"] = "TimeLimiter";
		["connectionsID"] = {
			[1] = 3;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "timedIdle";
		["posX"] = 630;
		["posY"] = 120;
		["script"] = "seconds = 1";
	};
	["node_timedWalk_00002"] = {
		["ID"] = 2;
		["child"] = "walk";
		["class"] = "TimeLimiter";
		["connectionsID"] = {
			[1] = 6;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "timedWalk";
		["posX"] = 1110;
		["posY"] = 240;
		["script"] = "seconds = 0.75";
	};
	["node_walk_00006"] = {
		["ID"] = 6;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "canWander";
		["link_type"] = false;
		["name"] = "walk";
		["posX"] = 1350;
		["posY"] = 240;
		["script"] = "start_function = Entity.walk_start\
running_function = true\
finish_function = Entity.stopMove";
	};
	["node_zigZagWalk_00007"] = {
		["ID"] = 7;
		["children"] = {
			[1] = "rep4";
			[2] = "rep8";
		};
		["class"] = "Randomizer";
		["connectionsID"] = {
			[1] = 8;
			[2] = 9;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "zigZagWalk";
		["posX"] = 630;
		["posY"] = 240;
		["script"] = "";
	};
}
return obj1
