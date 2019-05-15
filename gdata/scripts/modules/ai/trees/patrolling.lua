-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_convoyIsNear_00007"] = {
		["ID"] = 7;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "convoyIsNear";
		["posX"] = 1080;
		["posY"] = -510;
		["script"] = "function condition(self)\
   local obj = self.navigator.patrolConvoyObj\
   local convoyDistance = self.navigator.convoyDistance\
   return getDistance(obj:getPose():getPos(), self:getPose():getPos()) <= convoyDistance\
end";
	};
	["node_hasConvoy_00008"] = {
		["ID"] = 8;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hasConvoy";
		["posX"] = 1320;
		["posY"] = -570;
		["script"] = "function condition(self)\
   return self.navigator.patrolConvoyObj ~= nil\
end";
	};
	["node_hasNextWaypoint_00006"] = {
		["ID"] = 6;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hasNextWaypoint";
		["posX"] = 1320;
		["posY"] = -330;
		["script"] = "function condition(self)\
   return self.navigator.nextWPID > 0\
end";
	};
	["node_hasNoConvoy_00003"] = {
		["ID"] = 3;
		["child"] = "hasConvoy";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 8;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hasNoConvoy";
		["posX"] = 1080;
		["posY"] = -570;
		["script"] = "";
	};
	["node_ignored_00016"] = {
		["ID"] = 16;
		["child"] = "patrol";
		["class"] = "BehaviorTree";
		["connectionsID"] = {
			[1] = 12;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ignored";
		["posX"] = 840;
		["posY"] = -30;
		["script"] = "";
	};
	["node_move_00014"] = {
		["ID"] = 14;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "notWaitingConvoy";
		["link_type"] = false;
		["name"] = "move";
		["posX"] = 1320;
		["posY"] = -60;
		["script"] = "running_function = function(self)\
   self.navigator:patrol_running()\
end\
\
finish_function = function(self)\
   self.navigator:patrol_finish()\
end";
	};
	["node_notWaitingConvoy_00004"] = {
		["ID"] = 4;
		["children"] = {
			[1] = "hasNoConvoy";
			[2] = "convoyIsNear";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 3;
			[2] = 7;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "notWaitingConvoy";
		["posX"] = 840;
		["posY"] = -540;
		["script"] = "";
	};
	["node_patrolAllowed_00002"] = {
		["ID"] = 2;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "patrolAllowed";
		["posX"] = 1320;
		["posY"] = -450;
		["script"] = "function condition(self)\
   return self.navigator.patrolAllowed\
end";
	};
	["node_patrolNotPaused_00011"] = {
		["ID"] = 11;
		["child"] = "patrolPaused";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 10;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "patrolNotPaused";
		["posX"] = 1320;
		["posY"] = -390;
		["script"] = "";
	};
	["node_patrolPaused_00010"] = {
		["ID"] = 10;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "patrolPaused";
		["posX"] = 1560;
		["posY"] = -390;
		["script"] = "function condition(self)\
   return self.navigator.patrolPaused\
end";
	};
	["node_patrol_00012"] = {
		["ID"] = 12;
		["children"] = {
			[1] = "move";
			[2] = "wait";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 13;
			[2] = 14;
		};
		["guard"] = "shouldPatrol";
		["link_type"] = false;
		["name"] = "patrol";
		["posX"] = 1080;
		["posY"] = -30;
		["script"] = "";
	};
	["node_shouldNotPatrol_00009"] = {
		["ID"] = 9;
		["child"] = "shouldPatrol";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 5;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shouldNotPatrol";
		["posX"] = 840;
		["posY"] = -390;
		["script"] = "";
	};
	["node_shouldPatrol_00005"] = {
		["ID"] = 5;
		["children"] = {
			[1] = "patrolAllowed";
			[2] = "patrolNotPaused";
			[3] = "hasNextWaypoint";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 2;
			[2] = 6;
			[3] = 11;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shouldPatrol";
		["posX"] = 1080;
		["posY"] = -390;
		["script"] = "";
	};
	["node_wait_00013"] = {
		["ID"] = 13;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "wait";
		["posX"] = 1320;
		["posY"] = 0;
		["script"] = "start_function = function(self)\
   if self.defaultAnimation then\
      self.animationsManager:playCycle(self.defaultAnimation)\
   end\
end\
\
running_function = true";
	};
}
return obj1
