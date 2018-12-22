-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_00000"] = {
		["ID"] = 0;
		["child"] = "root";
		["class"] = "BehaviorTree";
		["connectionsID"] = {
			[1] = 21;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "BugBT";
		["posX"] = 150;
		["posY"] = 690;
		["script"] = "";
	};
	["node_00002"] = {
		["ID"] = 2;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isGotCaught";
		["posX"] = 1320;
		["posY"] = 240;
		["script"] = "{\
   stateName = \"caught\",\
}\
";
	};
	["node_00003"] = {
		["ID"] = 3;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "isGotCaught";
		["link_type"] = false;
		["name"] = "caught";
		["posX"] = 660;
		["posY"] = 480;
		["script"] = "{\
   start_function = function (self)\
      self.animationsManager:loopAnimation( \"escaping.caf\" )\
\
      self:setCollision  ( false )\
      self:setFeelVisible( false )\
\
      self.itemsManager:getSlotItem( 0 ):OnDeactivate()\
\
      self:getPose():setParent( self.caughtPose )\
      self:getPose():resetLocalPose()\
      self:getPose():setLocalRotQuat( quatFromEuler({x=-45}) )\
\
      self:disablePickupItem()\
      self.BT = nil\
   end,\
   running_function = false,\
}\
";
	};
	["node_00004"] = {
		["ID"] = 4;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isDead";
		["posX"] = 1320;
		["posY"] = 300;
		["script"] = "{\
   stateName = \"dead\",\
}\
";
	};
	["node_00005"] = {
		["ID"] = 5;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "isDead";
		["link_type"] = false;
		["name"] = "death";
		["posX"] = 660;
		["posY"] = 570;
		["script"] = "{\
   start_function = Entity.death_start,\
   running_function = false,\
   finish_function = Entity.death_stop,\
}\
";
	};
	["node_00006"] = {
		["ID"] = 6;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isGetDamage";
		["posX"] = 1320;
		["posY"] = 360;
		["script"] = "{\
   stateName = \"damage\",\
}\
";
	};
	["node_00007"] = {
		["ID"] = 7;
		["class"] = "AnimatedAction";
		["connectionsID"] = {
		};
		["guard"] = "isGetDamage";
		["link_type"] = false;
		["name"] = "damaged";
		["posX"] = 660;
		["posY"] = 660;
		["script"] = "{\
   start_function = Entity.damaged_start,\
   finish_function = Entity.damaged_stop,\
   animation = \"hit.caf\",\
}\
";
	};
	["node_00008"] = {
		["ID"] = 8;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyDetected";
		["posX"] = 1320;
		["posY"] = 450;
		["script"] = "{\
   senseName = \"enemyDetect\",\
}\
";
	};
	["node_00009"] = {
		["ID"] = 9;
		["child"] = "isEnemyDetected";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 8;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyNotDetected";
		["posX"] = 1080;
		["posY"] = 450;
		["script"] = "";
	};
	["node_00010"] = {
		["ID"] = 10;
		["child"] = "isEnemyClose";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 11;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyNotClose";
		["posX"] = 1080;
		["posY"] = 510;
		["script"] = "";
	};
	["node_00011"] = {
		["ID"] = 11;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyClose";
		["posX"] = 1320;
		["posY"] = 510;
		["script"] = "{\
   senseName = \"enemyClose\",\
}\
";
	};
	["node_00012"] = {
		["ID"] = 12;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "isEnemyNotClose";
		["link_type"] = false;
		["name"] = "chase";
		["posX"] = 900;
		["posY"] = 780;
		["script"] = "{\
   start_function = Entity.chase_start,\
   running_function = true,\
   finish_function = Entity.chase_stop,\
}\
";
	};
	["node_00013"] = {
		["ID"] = 13;
		["class"] = "AnimatedAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "preattack";
		["posX"] = 1140;
		["posY"] = 840;
		["script"] = "{\
   start_function = Entity.preattack_start,\
   finish_function = Entity.preattack_stop,\
   animation = \"jump_ready.caf\",\
}\
";
	};
	["node_00014"] = {
		["ID"] = 14;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hit";
		["posX"] = 1140;
		["posY"] = 900;
		["script"] = "{\
   start_function = Entity.attack_start,\
   running_function = Entity.attack_running,\
   finish_function = Entity.attack_stop,\
}\
";
	};
	["node_00015"] = {
		["ID"] = 15;
		["children"] = {
			[1] = "isEnemyClose";
			[2] = "preattack";
			[3] = "hit";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 13;
			[2] = 14;
			[3] = 22;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "attack";
		["posX"] = 900;
		["posY"] = 840;
		["script"] = "";
	};
	["node_00017"] = {
		["ID"] = 17;
		["children"] = {
			[1] = "chase";
			[2] = "attack";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 12;
			[2] = 15;
		};
		["guard"] = "isEnemyDetected";
		["link_type"] = false;
		["name"] = "respondToEnemy";
		["posX"] = 660;
		["posY"] = 810;
		["script"] = "";
	};
	["node_00018"] = {
		["ID"] = 18;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idle";
		["posX"] = 900;
		["posY"] = 990;
		["script"] = "{\
   start_function = Entity.idle_start,\
   running_function = Entity.idle_running,\
   finish_function = Entity.idle_stop,\
}\
";
	};
	["node_00019"] = {
		["ID"] = 19;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "walk";
		["posX"] = 900;
		["posY"] = 1050;
		["script"] = "{\
   start_function = Entity.walk_start,\
   running_function = Entity.walk_running,\
   finish_function = Entity.walk_stop,\
}\
";
	};
	["node_00020"] = {
		["ID"] = 20;
		["children"] = {
			[1] = "idle";
			[2] = "walk";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 18;
			[2] = 19;
		};
		["guard"] = "isEnemyNotDetected";
		["link_type"] = false;
		["name"] = "idleBehavior";
		["posX"] = 660;
		["posY"] = 1020;
		["script"] = "";
	};
	["node_00021"] = {
		["ID"] = 21;
		["children"] = {
			[1] = "caught";
			[2] = "death";
			[3] = "damaged";
			[4] = "respondToEnemy";
			[5] = "idleBehavior";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 3;
			[2] = 5;
			[3] = 7;
			[4] = 17;
			[5] = 20;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "root";
		["posX"] = 390;
		["posY"] = 690;
		["script"] = "";
	};
	["node_00022"] = {
		["ID"] = 22;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isEnemyClose";
		["posX"] = 1140;
		["posY"] = 780;
		["script"] = "{\
   senseName = \"enemyClose\",\
}\
";
	};
}
return obj1
