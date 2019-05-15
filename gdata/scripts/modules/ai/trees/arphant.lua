-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_ArphantBT_00003"] = {
		["ID"] = 3;
		["child"] = "root";
		["class"] = "BehaviorTree";
		["connectionsID"] = {
			[1] = 2;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ArphantBT";
		["posX"] = 570;
		["posY"] = 90;
		["script"] = "";
	};
	["node_ai.trees.conditions_00006"] = {
		["ID"] = 6;
		["class"] = "IncludeNodes";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ai.trees.conditions";
		["posX"] = 720;
		["posY"] = -180;
		["script"] = "";
	};
	["node_ai.trees.patrolling_00009"] = {
		["ID"] = 9;
		["class"] = "IncludeTree";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ai.trees.patrolling";
		["posX"] = 1080;
		["posY"] = 90;
		["script"] = "";
	};
	["node_attackProlog_00033"] = {
		["ID"] = 33;
		["children"] = {
			[1] = "chaseAndGiveUp";
			[2] = "turnTowards";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 36;
			[2] = 39;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "attackProlog";
		["posX"] = 1320;
		["posY"] = -60;
		["script"] = "";
	};
	["node_attack_00045"] = {
		["ID"] = 45;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "isEnemyClose";
		["link_type"] = false;
		["name"] = "attack";
		["posX"] = 1320;
		["posY"] = 0;
		["script"] = "local random = require \"random\"\
running_function = function(self)\
   local weapon\
   local anim\
   if random.random(0, 10) > 3 then\
      anim = \"attack\"\
      weapon = self.weapon\
   else\
      anim = \"attack_2\"\
      weapon = self.weapon2\
   end\
\
   self:getInventory():equipSlotWithItem(self:getWeaponSlot(), weapon:getId())\
\
   self.animationsManager:playCycle(self:getAnimationFor(\"idle_attack\"))\
   self.animationsManager:playAction(anim)\
\
   coro.waitAnimationEventIn(self, anim, \"attack\")\
\
   self:OnItemActivateSafe(weapon)\
\
   coro.waitAnimationEventOut(self, anim, \"attack\")\
\
   self:OnItemDeactivateSafe(weapon)\
\
   coro.waitAnimationEnd(self, anim)\
\
   self:OnItemDeactivateSafe(weapon)\
end";
	};
	["node_chaseAndGiveUp_00036"] = {
		["ID"] = 36;
		["children"] = {
			[1] = "timedChase";
			[2] = "playIdle";
			[3] = "wait2";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 31;
			[2] = 32;
			[3] = 35;
		};
		["guard"] = "isEnemyFar";
		["link_type"] = false;
		["name"] = "chaseAndGiveUp";
		["posX"] = 1590;
		["posY"] = -60;
		["script"] = "";
	};
	["node_chase_00029"] = {
		["ID"] = 29;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "chase";
		["posX"] = 2130;
		["posY"] = -120;
		["script"] = "start_function = function(self)\
   self:setTarget(self.senseScheduler:getCurEnemy())\
   self:setMoveSpeed(self:getRunSpeed())\
   self:setOrientationSpeed(self.parameters.orientationSpeed)\
   local anim = self:getAnimationFor(\"run\")\
   self.animationsManager:playCycle(anim)\
   self:subscribeToStepEvents(anim)\
end\
running_function = true\
finish_function = function(self)\
   self:resetTarget()\
   self:resetSpeed()\
end\
";
	};
	["node_damaged_00027"] = {
		["ID"] = 27;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "isGetDamage";
		["link_type"] = false;
		["name"] = "damaged";
		["posX"] = 1080;
		["posY"] = -180;
		["script"] = "running_function = function(self)\
   local anim = self:getAnimationFor(\"hit\")\
   self.animationsManager:playAction(anim)\
   coro.waitAnimationEnd(self, anim)\
end\
finish_function = function(self) self:setState(\"damage\", false) end";
	};
	["node_goToSpawn_00016"] = {
		["ID"] = 16;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "notInZone";
		["link_type"] = false;
		["name"] = "goToSpawn";
		["posX"] = 1350;
		["posY"] = 180;
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
	["node_idle4_00015"] = {
		["ID"] = 15;
		["child"] = "idle";
		["class"] = "TimeLimiter";
		["connectionsID"] = {
			[1] = 11;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idle4";
		["posX"] = 1620;
		["posY"] = 270;
		["script"] = "seconds = 4";
	};
	["node_idleBehavior_00014"] = {
		["ID"] = 14;
		["children"] = {
			[1] = "goToSpawn";
			[2] = "walkOrStand";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 13;
			[2] = 16;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idleBehavior";
		["posX"] = 1080;
		["posY"] = 210;
		["script"] = "";
	};
	["node_idle_00011"] = {
		["ID"] = 11;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idle";
		["posX"] = 1890;
		["posY"] = 270;
		["script"] = "start_function = function(self)\
   local anim = self:getAnimationFor(\"idle\")\
   self.animationsManager:playCycle(anim)\
   self:setOrientationFull(0)\
end\
running_function = true";
	};
	["node_playIdle_00031"] = {
		["ID"] = 31;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "playIdle";
		["posX"] = 1860;
		["posY"] = -60;
		["script"] = "start_function = function(self)\
   local anim = self:getAnimationFor(\"idle_neutral\")\
   self.animationsManager:playCycle(anim)\
end";
	};
	["node_respondToEnemy_00044"] = {
		["ID"] = 44;
		["children"] = {
			[1] = "attackProlog";
			[2] = "attack";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 33;
			[2] = 45;
		};
		["guard"] = "isEnemyDetected";
		["link_type"] = false;
		["name"] = "respondToEnemy";
		["posX"] = 1080;
		["posY"] = -60;
		["script"] = "";
	};
	["node_root_00002"] = {
		["ID"] = 2;
		["children"] = {
			[1] = "damaged";
			[2] = "respondToEnemy";
			[3] = "ai.trees.patrolling";
			[4] = "idleBehavior";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 9;
			[2] = 14;
			[3] = 27;
			[4] = 44;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "root";
		["posX"] = 810;
		["posY"] = 90;
		["script"] = "";
	};
	["node_timedChase_00035"] = {
		["ID"] = 35;
		["child"] = "chase";
		["class"] = "TimeLimiter";
		["connectionsID"] = {
			[1] = 29;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "timedChase";
		["posX"] = 1860;
		["posY"] = -120;
		["script"] = "seconds = 10";
	};
	["node_turnTowards_00039"] = {
		["ID"] = 39;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "isEnemyNotFront";
		["link_type"] = false;
		["name"] = "turnTowards";
		["posX"] = 1590;
		["posY"] = 0;
		["script"] = "start_function = function(self)\
   self:setTarget(self.senseScheduler:getCurEnemy())\
   self:setOrientationSpeed(self.parameters.orientationSpeed)\
end\
running_function = true\
finish_function = function(self)\
   self:resetTarget()\
   self:resetSpeed()\
end\
";
	};
	["node_wait2_00032"] = {
		["ID"] = 32;
		["class"] = "Wait";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "wait2";
		["posX"] = 1860;
		["posY"] = 0;
		["script"] = "seconds = 2";
	};
	["node_walk4_00012"] = {
		["ID"] = 12;
		["child"] = "walk";
		["class"] = "TimeLimiter";
		["connectionsID"] = {
			[1] = 17;
		};
		["guard"] = "canWander";
		["link_type"] = false;
		["name"] = "walk4";
		["posX"] = 1620;
		["posY"] = 210;
		["script"] = "seconds = 4";
	};
	["node_walkOrStand_00013"] = {
		["ID"] = 13;
		["children"] = {
			[1] = "walk4";
			[2] = "idle4";
		};
		["class"] = "RandomSelector";
		["connectionsID"] = {
			[1] = 12;
			[2] = 15;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "walkOrStand";
		["posX"] = 1350;
		["posY"] = 240;
		["script"] = "";
	};
	["node_walk_00017"] = {
		["ID"] = 17;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "walk";
		["posX"] = 1890;
		["posY"] = 210;
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
