-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_00000"] = {
		["ID"] = 0;
		["child"] = "root";
		["class"] = "BehaviorTree";
		["connectionsID"] = {
			[1] = 1;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "NpcBT";
		["posX"] = 360;
		["posY"] = 270;
		["script"] = "";
	};
	["node_00001"] = {
		["ID"] = 1;
		["children"] = {
			[1] = "dialogInit";
			[2] = "inDialog";
			[3] = "turnBack";
			[4] = "patrol";
			[5] = "idle";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 2;
			[2] = 11;
			[3] = 12;
			[4] = 21;
			[5] = 31;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "root";
		["posX"] = 630;
		["posY"] = 270;
		["script"] = "";
	};
	["node_00002"] = {
		["ID"] = 2;
		["class"] = "AnimatedAction";
		["connectionsID"] = {
		};
		["guard"] = "forceSuccess";
		["link_type"] = false;
		["name"] = "idle";
		["posX"] = 900;
		["posY"] = 780;
		["script"] = "{\
   start_function = function(self)\
      self.animationsManager:loopAnimation(\"idle_look.caf\")\
      self.animationsManager:playAnimation(\"idle_look.caf\")\
   end,\
   animation = \"idle_look.caf\",\
}\
";
	};
	["node_00003"] = {
		["ID"] = 3;
		["class"] = "Succeeder";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "forceSuccess";
		["posX"] = 870;
		["posY"] = -90;
		["script"] = "";
	};
	["node_00004"] = {
		["ID"] = 4;
		["class"] = "Failer";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "forceFail";
		["posX"] = 870;
		["posY"] = -30;
		["script"] = "";
	};
	["node_00006"] = {
		["ID"] = 6;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "talkRequest";
		["posX"] = 1380;
		["posY"] = -270;
		["script"] = "{\
   stateName = \"talkRequest\",\
}\
";
	};
	["node_00007"] = {
		["ID"] = 7;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "faceObject";
		["posX"] = 1620;
		["posY"] = 150;
		["script"] = "{\
   start_function = Entity.faceObject_start,\
   running_function = Entity.faceObject_running,\
   finish_function = Entity.faceObject_finish,\
}\
";
	};
	["node_00008"] = {
		["ID"] = 8;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "angleBigger10";
		["posX"] = 1380;
		["posY"] = -210;
		["script"] = "{\
   condition = function(self)\
      return math.abs(getTargetAngle(self, getPlayer():getPose():getPos())) > 10\
   end,\
}\
";
	};
	["node_00009"] = {
		["ID"] = 9;
		["children"] = {
			[1] = "talkRequest";
			[2] = "angleBigger10";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 6;
			[2] = 8;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shouldFacePlayer";
		["posX"] = 1140;
		["posY"] = -240;
		["script"] = "";
	};
	["node_00010"] = {
		["ID"] = 10;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "talkToPlayer";
		["posX"] = 1140;
		["posY"] = 210;
		["script"] = "{\
   start_function = Entity.talkToPlayer_start,\
}\
";
	};
	["node_00011"] = {
		["ID"] = 11;
		["children"] = {
			[1] = "skipIfFacingPlayer";
			[2] = "talkToPlayer";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 10;
			[2] = 15;
		};
		["guard"] = "shouldStartDialog";
		["link_type"] = false;
		["name"] = "dialogInit";
		["posX"] = 900;
		["posY"] = 180;
		["script"] = "";
	};
	["node_00012"] = {
		["ID"] = 12;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "isInDialog";
		["link_type"] = false;
		["name"] = "inDialog";
		["posX"] = 900;
		["posY"] = 270;
		["script"] = "{\
   start_function = Entity.inDialog_start,\
   running_function = true,\
   --finish_function = Entity.inDialog_finish,\
}\
";
	};
	["node_00013"] = {
		["ID"] = 13;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isInDialog";
		["posX"] = 1380;
		["posY"] = -330;
		["script"] = "{\
   stateName = \"inDialog\",\
}\
";
	};
	["node_00014"] = {
		["ID"] = 14;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "angleBigger10";
		["link_type"] = false;
		["name"] = "setTargetObjPlayer";
		["posX"] = 1620;
		["posY"] = 90;
		["script"] = "{\
   start_function = Entity.setTargetObjPlayer_start,\
}\
";
	};
	["node_00015"] = {
		["ID"] = 15;
		["child"] = "facePlayer";
		["class"] = "ForceFailure";
		["connectionsID"] = {
			[1] = 16;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "skipIfFacingPlayer";
		["posX"] = 1140;
		["posY"] = 150;
		["script"] = "";
	};
	["node_00016"] = {
		["ID"] = 16;
		["children"] = {
			[1] = "setTargetObjPlayer";
			[2] = "faceObject";
			[3] = "resetTargetObj";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 7;
			[2] = 14;
			[3] = 19;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "facePlayer";
		["posX"] = 1380;
		["posY"] = 150;
		["script"] = "";
	};
	["node_00017"] = {
		["ID"] = 17;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "setOrientationZero";
		["posX"] = 1140;
		["posY"] = 300;
		["script"] = "{\
   start_function = function(self)\
      self:setBBVar(\"orientAngle\", 0)\
   end,\
}\
";
	};
	["node_00018"] = {
		["ID"] = 18;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "faceObject";
		["posX"] = 1140;
		["posY"] = 360;
		["script"] = "{\
   start_function = Entity.faceObject_start,\
   running_function = Entity.faceObject_running,\
   finish_function = Entity.faceObject_finish,\
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
		["name"] = "resetTargetObj";
		["posX"] = 1620;
		["posY"] = 210;
		["script"] = "{\
   start_function = function(self)\
      self:setBBVar(\"targetObj\", nil)\
   end,\
}\
";
	};
	["node_00020"] = {
		["ID"] = 20;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "resetOrientation";
		["posX"] = 1140;
		["posY"] = 420;
		["script"] = "{\
   start_function = function(self)\
      self:setBBVar(\"orientAngle\", nil)\
   end,\
}\
";
	};
	["node_00021"] = {
		["ID"] = 21;
		["children"] = {
			[1] = "setOrientationZero";
			[2] = "faceObject";
			[3] = "resetOrientation";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 17;
			[2] = 18;
			[3] = 20;
		};
		["guard"] = "shouldTurn";
		["link_type"] = false;
		["name"] = "turnBack";
		["posX"] = 900;
		["posY"] = 360;
		["script"] = "";
	};
	["node_00022"] = {
		["ID"] = 22;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "orientationNotZero";
		["posX"] = 1380;
		["posY"] = -150;
		["script"] = "{\
   condition = function(self)\
      return self:getOrientationFull() ~= 0\
   end,\
}\
";
	};
	["node_00023"] = {
		["ID"] = 23;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hasNextWaypoint";
		["posX"] = 1620;
		["posY"] = -90;
		["script"] = "{\
   condition = function(self)\
      return self.nextPatrolPoint > 0\
   end,\
}\
";
	};
	["node_00024"] = {
		["ID"] = 24;
		["class"] = "EventCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "enteredNextWaypoint";
		["posX"] = 1620;
		["posY"] = -30;
		["script"] = "{\
   eventName = \"OnTriggerEnter\",\
   condition = function(self, event)\
      if event.obj == self:getBBVar(\"nextWaypoint\") then\
         event.consumed = false\
         return true\
      end\
      return false\
   end\
}\
";
	};
	["node_00025"] = {
		["ID"] = 25;
		["child"] = "enteredNextWaypoint";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 24;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "notEnteredNextWp";
		["posX"] = 1380;
		["posY"] = -30;
		["script"] = "";
	};
	["node_00026"] = {
		["ID"] = 26;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "notEnteredNextWp";
		["link_type"] = false;
		["name"] = "runToSetWp";
		["posX"] = 1890;
		["posY"] = 600;
		["script"] = "{\
   start_function = Entity.runToSetWp_start,\
   running_function = true,\
   finish_function = Entity.resetTarget,\
}\
";
	};
	["node_00030"] = {
		["ID"] = 30;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "getNextWp";
		["posX"] = 1650;
		["posY"] = 540;
		["script"] = "{\
   start_function = function(self)\
      self:setBBVar(\"nextWaypoint\", self.patrolPoints[self.nextPatrolPoint])\
   end,\
}\
";
	};
	["node_00031"] = {
		["ID"] = 31;
		["children"] = {
			[1] = "patrolCycleCondition";
			[2] = "resetSpeed";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 36;
			[2] = 39;
		};
		["guard"] = "shouldPatrol";
		["link_type"] = false;
		["name"] = "patrol";
		["posX"] = 900;
		["posY"] = 630;
		["script"] = "{\
   finish=Entity.resetSpeed,\
}\
";
	};
	["node_00032"] = {
		["ID"] = 32;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "advanceWp";
		["posX"] = 1650;
		["posY"] = 660;
		["script"] = "{\
   start_function = Entity.advanceWp_start,\
}\
";
	};
	["node_00034"] = {
		["ID"] = 34;
		["child"] = "runToSetWp";
		["class"] = "ForceSuccess";
		["connectionsID"] = {
			[1] = 26;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "forceSuccessGuard";
		["posX"] = 1650;
		["posY"] = 600;
		["script"] = "{\
   -- when runToSetWp guard fails this node allows to continue to advanceWp\
}\
";
	};
	["node_00035"] = {
		["ID"] = 35;
		["child"] = "hasNextWaypoint";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 23;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "noNextWaypoint";
		["posX"] = 1380;
		["posY"] = -90;
		["script"] = "";
	};
	["node_00036"] = {
		["ID"] = 36;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "noNextWaypoint";
		["link_type"] = false;
		["name"] = "resetSpeed";
		["posX"] = 1140;
		["posY"] = 660;
		["script"] = "{\
   start_function = Entity.resetSpeed,\
}\
";
	};
	["node_00037"] = {
		["ID"] = 37;
		["children"] = {
			[1] = "orientationNotZero";
			[2] = "shouldNotPatrol";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 45;
			[2] = 47;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shouldTurn";
		["posX"] = 1620;
		["posY"] = -330;
		["script"] = "";
	};
	["node_00038"] = {
		["ID"] = 38;
		["children"] = {
			[1] = "getNextWp";
			[2] = "forceSuccessGuard";
			[3] = "advanceWp";
			[4] = "forceFail";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 30;
			[2] = 32;
			[3] = 34;
			[4] = 40;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "patrolCycle";
		["posX"] = 1380;
		["posY"] = 600;
		["script"] = "";
	};
	["node_00039"] = {
		["ID"] = 39;
		["child"] = "patrolCycle";
		["class"] = "UntilSuccess";
		["connectionsID"] = {
			[1] = 38;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "patrolCycleCondition";
		["posX"] = 1140;
		["posY"] = 600;
		["script"] = "";
	};
	["node_00040"] = {
		["ID"] = 40;
		["class"] = "Failer";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "forceFail";
		["posX"] = 1650;
		["posY"] = 720;
		["script"] = "";
	};
	["node_00041"] = {
		["ID"] = 41;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "patrolActive";
		["posX"] = 2100;
		["posY"] = -210;
		["script"] = "{\
   stateName = \"patrolActive\",\
}\
";
	};
	["node_00042"] = {
		["ID"] = 42;
		["children"] = {
			[1] = "patrolActive";
			[2] = "hasNextWaypoint";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 41;
			[2] = 43;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shouldPatrol";
		["posX"] = 1860;
		["posY"] = -180;
		["script"] = "";
	};
	["node_00043"] = {
		["ID"] = 43;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "hasNextWaypoint";
		["posX"] = 2100;
		["posY"] = -150;
		["script"] = "{\
   condition = function(self)\
      return self.nextPatrolPoint > 0\
   end,\
}\
";
	};
	["node_00045"] = {
		["ID"] = 45;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "orientationNotZero";
		["posX"] = 1860;
		["posY"] = -360;
		["script"] = "{\
   condition = function(self)\
      return self:getOrientationFull() ~= 0\
   end,\
}\
";
	};
	["node_00046"] = {
		["ID"] = 46;
		["child"] = "shouldPatrol";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 42;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shouldNotPatrol";
		["posX"] = 1620;
		["posY"] = -180;
		["script"] = "";
	};
	["node_00047"] = {
		["ID"] = 47;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "shouldNotPatrol";
		["posX"] = 1860;
		["posY"] = -300;
		["script"] = "";
	};
	["node_00048"] = {
		["ID"] = 48;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isDialogInitiator";
		["posX"] = 1380;
		["posY"] = -450;
		["script"] = "{\
   condition = Entity.isDialogInitiator,\
}\
";
	};
	["node_00049"] = {
		["ID"] = 49;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "playerDetect";
		["posX"] = 1380;
		["posY"] = -510;
		["script"] = "{\
   senseName = \"playerDetect\",\
}\
";
	};
	["node_00050"] = {
		["ID"] = 50;
		["children"] = {
			[1] = "playerDetect";
			[2] = "isDialogInitiator";
			[3] = "playerInDialogDistance";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 48;
			[2] = 49;
			[3] = 54;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "wantsToTalk";
		["posX"] = 1140;
		["posY"] = -450;
		["script"] = "";
	};
	["node_00051"] = {
		["ID"] = 51;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "talkRequest";
		["posX"] = 1140;
		["posY"] = -390;
		["script"] = "{\
   stateName = \"talkRequest\",\
}\
";
	};
	["node_00053"] = {
		["ID"] = 53;
		["children"] = {
			[1] = "wantsToTalk";
			[2] = "talkRequest";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 50;
			[2] = 51;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shouldStartDialog";
		["posX"] = 900;
		["posY"] = -420;
		["script"] = "";
	};
	["node_00054"] = {
		["ID"] = 54;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "playerInDialogDistance";
		["posX"] = 1380;
		["posY"] = -390;
		["script"] = "{\
   senseName = \"playerInDialogDistance\",\
}\
";
	};
}
return obj1
