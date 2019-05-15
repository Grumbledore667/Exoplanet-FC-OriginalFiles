-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_TurretBT_00002"] = {
		["ID"] = 2;
		["child"] = "root";
		["class"] = "BehaviorTree";
		["connectionsID"] = {
			[1] = 3;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "TurretBT";
		["posX"] = 330;
		["posY"] = 360;
		["script"] = "";
	};
	["node_facingEnemy_00020"] = {
		["ID"] = 20;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "facingEnemy";
		["posX"] = 1080;
		["posY"] = 60;
		["script"] = "condition = function(self)\
   return self.senseScheduler:getSense(\"enemyFront\")\
end";
	};
	["node_hasRangedWeapon_00019"] = {
		["ID"] = 19;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hasRangedWeapon";
		["posX"] = 960;
		["posY"] = -30;
		["script"] = "condition = function(self)\
   local item = self:getWeaponSlotItem()\
   if item and item:isRangedWeapon() then\
      return true\
   else\
      return false\
   end\
end";
	};
	["node_idle_00004"] = {
		["ID"] = 4;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idle";
		["posX"] = 870;
		["posY"] = 450;
		["script"] = "start_function = function(self)\
   self.animationsManager:playCycle(\"idle\")\
end";
	};
	["node_lookAndShoot_00034"] = {
		["ID"] = 34;
		["children"] = {
			[1] = "shoot";
			[2] = "lookSides";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 14;
			[2] = 23;
		};
		["guard"] = "hasRangedWeapon";
		["link_type"] = false;
		["name"] = "lookAndShoot";
		["posX"] = 870;
		["posY"] = 270;
		["script"] = "";
	};
	["node_lookSides_00023"] = {
		["ID"] = 23;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "notFacingEnemy";
		["link_type"] = false;
		["name"] = "lookSides";
		["posX"] = 1140;
		["posY"] = 300;
		["script"] = "running_function = Entity.lookSides_running\
finish_function = Entity.lookSides_finish";
	};
	["node_notFacingEnemy_00044"] = {
		["ID"] = 44;
		["child"] = "facingEnemy";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 20;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "notFacingEnemy";
		["posX"] = 840;
		["posY"] = 60;
		["script"] = "";
	};
	["node_root_00003"] = {
		["ID"] = 3;
		["children"] = {
			[1] = "lookAndShoot";
			[2] = "idle";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 4;
			[2] = 34;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "root";
		["posX"] = 600;
		["posY"] = 360;
		["script"] = "";
	};
	["node_shoot_00014"] = {
		["ID"] = 14;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "facingEnemy";
		["link_type"] = false;
		["name"] = "shoot";
		["posX"] = 1140;
		["posY"] = 210;
		["script"] = "running_function = Entity.shoot_running";
	};
}
return obj1
