-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
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
	["node_aimAndShoot_00085"] = {
		["ID"] = 85;
		["children"] = {
			[1] = "tryFaceAndAim";
			[2] = "tryAim";
			[3] = "shoot";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 36;
			[2] = 83;
			[3] = 84;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "aimAndShoot";
		["posX"] = 1950;
		["posY"] = 270;
		["script"] = "";
	};
	["node_aimAtEnemy_00082"] = {
		["ID"] = 82;
		["children"] = {
			[1] = "mustAim";
			[2] = "aim";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 69;
			[2] = 78;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "aimAtEnemy";
		["posX"] = 2460;
		["posY"] = 420;
		["script"] = "";
	};
	["node_aim_00038"] = {
		["ID"] = 38;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "aim";
		["posX"] = 2700;
		["posY"] = 300;
		["script"] = "running_function = Entity.aim_running\
finish_function = Entity.aim_finish\
";
	};
	["node_aim_00078"] = {
		["ID"] = 78;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "aim";
		["posX"] = 2700;
		["posY"] = 450;
		["script"] = "running_function = Entity.aim_running\
finish_function = Entity.aim_finish\
";
	};
	["node_attackProlog_00105"] = {
		["ID"] = 105;
		["children"] = {
			[1] = "chaseAndGiveUp";
			[2] = "turnTowards";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 106;
			[2] = 112;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "attackProlog";
		["posX"] = 1710;
		["posY"] = 60;
		["script"] = "";
	};
	["node_attack_00108"] = {
		["ID"] = 108;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "isEnemyClose";
		["link_type"] = false;
		["name"] = "attack";
		["posX"] = 1710;
		["posY"] = 120;
		["script"] = "start_function = function(self)\
   self:setBBVar(\"attackRunning\", true)\
\
   local weapon = self:getWeaponSlotItem()\
   if weapon:isMeleeWeapon() then\
      local anim\
      anim = self:getRandomAnimationFor(\"attack\")\
\
      local function fire()\
         self:OnItemActivateSafe(self:getWeaponSlotItem())\
      end\
\
      local function stopFiring()\
         self:OnItemDeactivateSafe(self:getWeaponSlotItem())\
      end\
\
      self.animationsManager:playCycle(self:getAnimationFor(\"idle_attack\"))\
      self.animationsManager:playAction(anim)\
      self.animationsManager:subscribeAnimationEventIn(anim, \"attack\", fire)\
      self.animationsManager:subscribeAnimationEventOut(anim, \"attack\", stopFiring)\
\
      local function onEnd()\
         stopFiring()\
         self:setBBVar(\"attackRunning\", false)\
      end\
      self.animationsManager:subscribeAnimationEnd(anim, onEnd, self)\
   end\
end\
running_function = function(self)\
   return self:getBBVar(\"attackRunning\")\
end";
	};
	["node_chaseAndGiveUp_00112"] = {
		["ID"] = 112;
		["children"] = {
			[1] = "timedChase";
			[2] = "playIdle";
			[3] = "wait2";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 109;
			[2] = 110;
			[3] = 111;
		};
		["guard"] = "isEnemyFar";
		["link_type"] = false;
		["name"] = "chaseAndGiveUp";
		["posX"] = 1980;
		["posY"] = 30;
		["script"] = "";
	};
	["node_chase_00107"] = {
		["ID"] = 107;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "chase";
		["posX"] = 2520;
		["posY"] = -30;
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
	["node_closeEncounters_00104"] = {
		["ID"] = 104;
		["children"] = {
			[1] = "attackProlog";
			[2] = "attack";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 105;
			[2] = 108;
		};
		["guard"] = "hasMeleeWeapon";
		["link_type"] = false;
		["name"] = "closeEncounters";
		["posX"] = 1440;
		["posY"] = 90;
		["script"] = "";
	};
	["node_damageable_00028"] = {
		["ID"] = 28;
		["children"] = {
			[1] = "respondToEnemy";
			[2] = "damaged";
		};
		["class"] = "Parallel";
		["connectionsID"] = {
			[1] = 27;
			[2] = 35;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "damageable";
		["posX"] = 900;
		["posY"] = 270;
		["script"] = "orchestrator = \"resume\"\
policy = \"selector\"";
	};
	["node_damaged_00027"] = {
		["ID"] = 27;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "isGetDamage";
		["link_type"] = false;
		["name"] = "damaged";
		["posX"] = 1140;
		["posY"] = 300;
		["script"] = "running_function = function(self)\
   local anim = self:getBBVar(\"hitAnimation\")\
   self.animationsManager:playAction(anim)\
   coro.waitAnimationEnd(self, anim)\
end\
finish_function = function(self) self:setState(\"damage\", false) end";
	};
	["node_faceAndAimAtEnemy_00081"] = {
		["ID"] = 81;
		["children"] = {
			[1] = "mustFace";
			[2] = "faceObject";
			[3] = "aim";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 38;
			[2] = 47;
			[3] = 50;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "faceAndAimAtEnemy";
		["posX"] = 2460;
		["posY"] = 240;
		["script"] = "";
	};
	["node_faceObject_00047"] = {
		["ID"] = 47;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "faceObject";
		["posX"] = 2700;
		["posY"] = 240;
		["script"] = "function running_function(self)\
   local enemy = self.senseScheduler:getCurEnemy()\
   self:setTarget(enemy)\
   self:orientationWorker()\
end\
finish_function = Entity.orientation_finish\
--[[\
function finish_function(self)\
   self:setOrientationSpeed(0)\
   self:setAnimSpeed(1)\
   self:resetTarget()\
   self:setOrientationFull(self:getOrientationFull()) -- reset getOrientation\
end\
]]";
	};
	["node_hasMeleeWeapon_00039"] = {
		["ID"] = 39;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hasMeleeWeapon";
		["posX"] = 1110;
		["posY"] = -150;
		["script"] = "condition = function(self)\
   local item = self:getWeaponSlotItem()\
   if item and item:isMeleeWeapon() then\
      return true\
   else\
      return false\
   end\
end";
	};
	["node_hasRangedWeapon_00040"] = {
		["ID"] = 40;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hasRangedWeapon";
		["posX"] = 1110;
		["posY"] = -90;
		["script"] = "condition = function(self)\
   local item = self:getWeaponSlotItem()\
   if item and item:isRangedWeapon() then\
      return true\
   else\
      return false\
   end\
end";
	};
	["node_ignored_00000"] = {
		["ID"] = 0;
		["child"] = "damageable";
		["class"] = "BehaviorTree";
		["connectionsID"] = {
			[1] = 28;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ignored";
		["posX"] = 630;
		["posY"] = 270;
		["script"] = "";
	};
	["node_managedRangedAttack_00086"] = {
		["ID"] = 86;
		["children"] = {
			[1] = "aimAndShoot";
			[2] = "trackTarget";
		};
		["class"] = "Parallel";
		["connectionsID"] = {
			[1] = 56;
			[2] = 85;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "managedRangedAttack";
		["posX"] = 1680;
		["posY"] = 300;
		["script"] = "orchestrator = \"resume\"\
policy = \"sequence\"";
	};
	["node_mustAim_00069"] = {
		["ID"] = 69;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "mustAim";
		["posX"] = 2700;
		["posY"] = 390;
		["script"] = "function condition(self)\
   return self.senseScheduler:getCurEnemy() ~= self:getBBVar(\"enemy\")\
end";
	};
	["node_mustFace_00050"] = {
		["ID"] = 50;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "mustFace";
		["posX"] = 2700;
		["posY"] = 180;
		["script"] = "function condition(self)\
   return math.abs(getTargetAngleFlat(self, self.senseScheduler:getCurEnemy():getPose():getPos())) > 30\
end";
	};
	["node_playIdle_00110"] = {
		["ID"] = 110;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "playIdle";
		["posX"] = 2250;
		["posY"] = 30;
		["script"] = "start_function = function(self)\
   local anim = self:getAnimationFor(\"idle_neutral\")\
   self.animationsManager:playCycle(anim)\
end";
	};
	["node_rangedFinisher_00053"] = {
		["ID"] = 53;
		["child"] = "managedRangedAttack";
		["class"] = "Finisher";
		["connectionsID"] = {
			[1] = 86;
		};
		["guard"] = "hasRangedWeapon";
		["link_type"] = false;
		["name"] = "rangedFinisher";
		["posX"] = 1440;
		["posY"] = 300;
		["script"] = "function finish_function(self)\
   self:resetTarget()\
   self:resetSpeed()\
   self.animationsManager:playCycle(self.defaultAnimation)\
   self:setBBVar(\"cachedPrefabFactor\", nil)\
   self:setBBVar(\"enemy\", nil)\
end";
	};
	["node_respondToEnemy_00035"] = {
		["ID"] = 35;
		["children"] = {
			[1] = "closeEncounters";
			[2] = "rangedFinisher";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 53;
			[2] = 104;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "respondToEnemy";
		["posX"] = 1140;
		["posY"] = 240;
		["script"] = "";
	};
	["node_shoot_00036"] = {
		["ID"] = 36;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shoot";
		["posX"] = 2220;
		["posY"] = 510;
		["script"] = "running_function = Entity.shoot_running\
";
	};
	["node_timedChase_00109"] = {
		["ID"] = 109;
		["child"] = "chase";
		["class"] = "TimeLimiter";
		["connectionsID"] = {
			[1] = 107;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "timedChase";
		["posX"] = 2250;
		["posY"] = -30;
		["script"] = "seconds = 10";
	};
	["node_trackTarget_00056"] = {
		["ID"] = 56;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "trackTarget";
		["posX"] = 1950;
		["posY"] = 330;
		["script"] = "start_function = Entity.trackTarget_start\
running_function = true\
finish_function = Entity.trackTarget_finish\
";
	};
	["node_tryAim_00084"] = {
		["ID"] = 84;
		["child"] = "aimAtEnemy";
		["class"] = "ForceFailure";
		["connectionsID"] = {
			[1] = 82;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "tryAim";
		["posX"] = 2220;
		["posY"] = 420;
		["script"] = "";
	};
	["node_tryFaceAndAim_00083"] = {
		["ID"] = 83;
		["child"] = "faceAndAimAtEnemy";
		["class"] = "ForceFailure";
		["connectionsID"] = {
			[1] = 81;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "tryFaceAndAim";
		["posX"] = 2220;
		["posY"] = 240;
		["script"] = "";
	};
	["node_turnTowards_00106"] = {
		["ID"] = 106;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "isEnemyNotFront";
		["link_type"] = false;
		["name"] = "turnTowards";
		["posX"] = 1980;
		["posY"] = 90;
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
	["node_wait2_00111"] = {
		["ID"] = 111;
		["class"] = "Wait";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "wait2";
		["posX"] = 2250;
		["posY"] = 90;
		["script"] = "seconds = 2";
	};
}
return obj1
