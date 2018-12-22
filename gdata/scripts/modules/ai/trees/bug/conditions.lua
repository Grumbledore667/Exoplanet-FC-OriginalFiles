-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_canWander_00010"] = {
		["ID"] = 10;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "canWander";
		["posX"] = 720;
		["posY"] = 510;
		["script"] = "function condition(self)\
   return self.parameters.zoneSize > 100\
end";
	};
	["node_isDead_00007"] = {
		["ID"] = 7;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isDead";
		["posX"] = 720;
		["posY"] = 180;
		["script"] = "stateName = \"dead\"";
	};
	["node_isEnemyClose_00005"] = {
		["ID"] = 5;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyClose";
		["posX"] = 720;
		["posY"] = 390;
		["script"] = "senseName = \"enemyClose\"";
	};
	["node_isEnemyDetected_00003"] = {
		["ID"] = 3;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyDetected";
		["posX"] = 720;
		["posY"] = 330;
		["script"] = "senseName = \"enemyDetect\"";
	};
	["node_isEnemyNotClose_00004"] = {
		["ID"] = 4;
		["child"] = "isEnemyClose";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 5;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyNotClose";
		["posX"] = 480;
		["posY"] = 390;
		["script"] = "";
	};
	["node_isEnemyNotDetected_00009"] = {
		["ID"] = 9;
		["child"] = "isEnemyDetected";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 3;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyNotDetected";
		["posX"] = 480;
		["posY"] = 330;
		["script"] = "";
	};
	["node_isGetDamage_00002"] = {
		["ID"] = 2;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isGetDamage";
		["posX"] = 720;
		["posY"] = 240;
		["script"] = "stateName = \"damage\"";
	};
	["node_isGotCaught_00008"] = {
		["ID"] = 8;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isGotCaught";
		["posX"] = 720;
		["posY"] = 120;
		["script"] = "stateName = \"caught\"";
	};
	["node_isNotDead_00006"] = {
		["ID"] = 6;
		["child"] = "isDead";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 7;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotDead";
		["posX"] = 480;
		["posY"] = 180;
		["script"] = "";
	};
}
return obj1
