-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_BanditBT_00000"] = {
		["ID"] = 0;
		["child"] = "root";
		["class"] = "BehaviorTree";
		["connectionsID"] = {
			[1] = 1;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "BanditBT";
		["posX"] = 360;
		["posY"] = 270;
		["script"] = "";
	};
	["node_ai.trees.conditions_00018"] = {
		["ID"] = 18;
		["class"] = "IncludeNodes";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ai.trees.conditions";
		["posX"] = 960;
		["posY"] = -300;
		["script"] = "";
	};
	["node_ai.trees.damageable_00113"] = {
		["ID"] = 113;
		["class"] = "IncludeTree";
		["connectionsID"] = {
		};
		["guard"] = "isEnemyDetected";
		["link_type"] = false;
		["name"] = "ai.trees.damageable";
		["posX"] = 900;
		["posY"] = 270;
		["script"] = "";
	};
	["node_fall_00045"] = {
		["ID"] = 45;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "isFalling";
		["link_type"] = false;
		["name"] = "fall";
		["posX"] = 900;
		["posY"] = 150;
		["script"] = "running_function = Entity.fall_running\
finish_function = Entity.fall_finish\
";
	};
	["node_goToSpawn_00034"] = {
		["ID"] = 34;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "notInZone";
		["link_type"] = false;
		["name"] = "goToSpawn";
		["posX"] = 1140;
		["posY"] = 480;
		["script"] = "start_function = function(self)\
   local anim = self:getAnimationFor(\"walk\")\
   self.animationsManager:playCycle(anim)\
   self:subscribeToStepEvents(anim)\
   self:setMoveSpeed(self:getWalkSpeed())\
   self:setOrientationSpeed(self.parameters.orientationSpeed)\
   self:setOrientation(getTargetAngleDir(self, self.senseScheduler:getCurZone()))\
end\
running_function = true\
finish_function = Entity.resetSpeed";
	};
	["node_idle4_00044"] = {
		["ID"] = 44;
		["child"] = "idle";
		["class"] = "TimeLimiter";
		["connectionsID"] = {
			[1] = 2;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idle4";
		["posX"] = 1380;
		["posY"] = 570;
		["script"] = "seconds = 4";
	};
	["node_idleBehavior_00033"] = {
		["ID"] = 33;
		["children"] = {
			[1] = "patrol";
			[2] = "goToSpawn";
			[3] = "walkOrStand";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 34;
			[2] = 42;
			[3] = 46;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idleBehavior";
		["posX"] = 900;
		["posY"] = 480;
		["script"] = "";
	};
	["node_idle_00002"] = {
		["ID"] = 2;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idle";
		["posX"] = 1620;
		["posY"] = 570;
		["script"] = "local random = require \"random\"\
start_function = function(self)\
   local anim = random.choice(self:getAnimationFor(\"idle\"))\
   self.animationsManager:playCycle(anim)\
   self:setOrientationFull(0)\
end\
running_function = true";
	};
	["node_patrol_00046"] = {
		["ID"] = 46;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "shouldPatrol";
		["link_type"] = false;
		["name"] = "patrol";
		["posX"] = 1140;
		["posY"] = 420;
		["script"] = "running_function = Entity.patrol_running\
finish_function = Entity.patrol_finish";
	};
	["node_root_00001"] = {
		["ID"] = 1;
		["children"] = {
			[1] = "fall";
			[2] = "ai.trees.damageable";
			[3] = "idleBehavior";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 33;
			[2] = 45;
			[3] = 113;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "root";
		["posX"] = 630;
		["posY"] = 270;
		["script"] = "";
	};
	["node_walk4_00043"] = {
		["ID"] = 43;
		["child"] = "walk";
		["class"] = "TimeLimiter";
		["connectionsID"] = {
			[1] = 41;
		};
		["guard"] = "canWander";
		["link_type"] = false;
		["name"] = "walk4";
		["posX"] = 1380;
		["posY"] = 510;
		["script"] = "seconds = 4";
	};
	["node_walkOrStand_00042"] = {
		["ID"] = 42;
		["children"] = {
			[1] = "walk4";
			[2] = "idle4";
		};
		["class"] = "RandomSelector";
		["connectionsID"] = {
			[1] = 43;
			[2] = 44;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "walkOrStand";
		["posX"] = 1140;
		["posY"] = 540;
		["script"] = "";
	};
	["node_walk_00041"] = {
		["ID"] = 41;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "walk";
		["posX"] = 1620;
		["posY"] = 510;
		["script"] = "local random = require \"random\"\
function start_function(self)\
   local anim = self:getAnimationFor(\"walk\")\
   self.animationsManager:playCycle(anim)\
   self:subscribeToStepEvents(anim)\
   self:setMoveSpeed(self:getWalkSpeed())\
   self:setOrientationSpeed(self.parameters.orientationSpeed)\
   self:setOrientation(random.normal(-180, 180))\
end\
\
running_function = true\
\
function finish_function(self)\
   self:setMoveSpeed(0)\
   self:setOrientationSpeed(0)\
   self:setStrafeSpeed(0)\
end";
	};
}
return obj1
