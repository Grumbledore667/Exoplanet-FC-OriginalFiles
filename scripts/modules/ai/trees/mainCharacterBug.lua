-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_attackGuard_00020"] = {
		["ID"] = 20;
		["children"] = {
			[1] = "not_jump_";
			[2] = "attack_";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 34;
			[2] = 35;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "attackGuard";
		["posX"] = 1290;
		["posY"] = 150;
		["script"] = "";
	};
	["node_attack_00005"] = {
		["ID"] = 5;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "attackGuard";
		["link_type"] = false;
		["name"] = "attack";
		["posX"] = 750;
		["posY"] = 360;
		["script"] = "start_function = Entity.attack\
running_function = true";
	};
	["node_attack__00014"] = {
		["ID"] = 14;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "attack_";
		["posX"] = 1020;
		["posY"] = 150;
		["script"] = "function condition(self)\
   return self:attack_()\
end";
	};
	["node_attack__00035"] = {
		["ID"] = 35;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "attack_";
		["posX"] = 1530;
		["posY"] = 180;
		["script"] = "function condition(self)\
   return self:attack_()\
end";
	};
	["node_jump_00008"] = {
		["ID"] = 8;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "jump_";
		["link_type"] = false;
		["name"] = "jump";
		["posX"] = 750;
		["posY"] = 420;
		["script"] = "start_function = Entity.jump\
running_function = true";
	};
	["node_jump__00019"] = {
		["ID"] = 19;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "jump_";
		["posX"] = 1020;
		["posY"] = 90;
		["script"] = "function condition(self)\
   return self:jump_()\
end";
	};
	["node_mainCharacterBugBT_00010"] = {
		["ID"] = 10;
		["child"] = "root";
		["class"] = "BehaviorTree";
		["connectionsID"] = {
			[1] = 12;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "mainCharacterBugBT";
		["posX"] = 210;
		["posY"] = 420;
		["script"] = "";
	};
	["node_moveFinisher_00003"] = {
		["ID"] = 3;
		["child"] = "preventExit";
		["class"] = "Finisher";
		["connectionsID"] = {
			[1] = 13;
		};
		["guard"] = "move_";
		["link_type"] = false;
		["name"] = "moveFinisher";
		["posX"] = 750;
		["posY"] = 480;
		["script"] = "finish_function = Entity.move_stop";
	};
	["node_move_00007"] = {
		["ID"] = 7;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "move";
		["posX"] = 1290;
		["posY"] = 480;
		["script"] = "start_function = Entity.move_start\
\
function running_function(self)\
   local nc = self.notificationCenter\
   return not nc:notification(\"onChangeButtonState\") and not nc:notification(\"onChangeState\")\
end";
	};
	["node_move__00017"] = {
		["ID"] = 17;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "move_";
		["posX"] = 1020;
		["posY"] = 210;
		["script"] = "function condition(self)\
   return self:move_()\
end";
	};
	["node_not_attack__00016"] = {
		["ID"] = 16;
		["child"] = "attack_";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 14;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "not_attack_";
		["posX"] = 750;
		["posY"] = 150;
		["script"] = "";
	};
	["node_not_jump__00015"] = {
		["ID"] = 15;
		["child"] = "jump_";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 19;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "not_jump_";
		["posX"] = 750;
		["posY"] = 90;
		["script"] = "";
	};
	["node_not_jump__00034"] = {
		["ID"] = 34;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "not_jump_";
		["posX"] = 1530;
		["posY"] = 120;
		["script"] = "";
	};
	["node_not_move__00018"] = {
		["ID"] = 18;
		["child"] = "move_";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 17;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "not_move_";
		["posX"] = 750;
		["posY"] = 210;
		["script"] = "";
	};
	["node_preventExit_00013"] = {
		["ID"] = 13;
		["child"] = "move";
		["class"] = "UntilFailure";
		["connectionsID"] = {
			[1] = 7;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "preventExit";
		["posX"] = 1020;
		["posY"] = 480;
		["script"] = "";
	};
	["node_root_00012"] = {
		["ID"] = 12;
		["children"] = {
			[1] = "attack";
			[2] = "jump";
			[3] = "moveFinisher";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 3;
			[2] = 5;
			[3] = 8;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "root";
		["posX"] = 480;
		["posY"] = 420;
		["script"] = "";
	};
}
return obj1
