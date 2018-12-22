-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_NpcBT_00000"] = {
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
	["node_ai.trees.conditions_00065"] = {
		["ID"] = 65;
		["class"] = "IncludeNodes";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ai.trees.conditions";
		["posX"] = 870;
		["posY"] = -180;
		["script"] = "";
	};
	["node_ai.trees.damageable_00092"] = {
		["ID"] = 92;
		["class"] = "IncludeTree";
		["connectionsID"] = {
		};
		["guard"] = "isEnemyDetected";
		["link_type"] = false;
		["name"] = "ai.trees.damageable";
		["posX"] = 900;
		["posY"] = 210;
		["script"] = "";
	};
	["node_angleBigger10_00008"] = {
		["ID"] = 8;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "angleBigger10";
		["posX"] = 1380;
		["posY"] = -210;
		["script"] = "condition = function(self)\
   return math.abs(getTargetAngleFlat(self, getPlayer():getPose():getPos())) > 10\
end";
	};
	["node_consumeItemNameIsSet_00068"] = {
		["ID"] = 68;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["h"] = 60;
		["link_type"] = false;
		["name"] = "consumeItemNameIsSet";
		["posX"] = 1620;
		["posY"] = -210;
		["script"] = "function condition(self)\
   return self:getBBVar(\"consumeItemName\") ~= nil\
end";
		["w"] = 240;
	};
	["node_consumeItem_00067"] = {
		["ID"] = 67;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "consumeItem";
		["posX"] = 1140;
		["posY"] = 480;
		["script"] = "running_function = Entity.consumeItem_running\
finish_function = Entity.consumeItem_finish";
	};
	["node_cutChipFinisher_00084"] = {
		["ID"] = 84;
		["child"] = "cutChip";
		["class"] = "Finisher";
		["connectionsID"] = {
			[1] = 82;
		};
		["guard"] = "shouldCutChip";
		["link_type"] = false;
		["name"] = "cutChipFinisher";
		["posX"] = 2130;
		["posY"] = 90;
		["script"] = "function finish_function(self)\
   self:setBBVar(\"shouldCutChip\", nil)\
   self:setBBVar(\"lastEquippedWeapon\", self:getInventory():getItemByName(\"kabarog_hsg.gun\"))\
end";
	};
	["node_cutChip_00082"] = {
		["ID"] = 82;
		["children"] = {
			[1] = "tryUnequip";
			[2] = "setCleaverToEquip";
			[3] = "reequipWeapon";
			[4] = "cutOutChip";
			[5] = "tryUnequip";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 85;
			[2] = 86;
			[3] = 87;
			[4] = 88;
			[5] = 91;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "cutChip";
		["posX"] = 2370;
		["posY"] = 90;
		["script"] = "";
	};
	["node_cutOutChip_00091"] = {
		["ID"] = 91;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "cutOutChip";
		["posX"] = 2640;
		["posY"] = 150;
		["script"] = "running_function = Entity.cutOutChip_running";
	};
	["node_dialogInit_00011"] = {
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
		["guard"] = "canStartDialog";
		["link_type"] = false;
		["name"] = "dialogInit";
		["posX"] = 900;
		["posY"] = 300;
		["script"] = "";
	};
	["node_faceObject_00066"] = {
		["ID"] = 66;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "faceObject";
		["posX"] = 1620;
		["posY"] = 300;
		["script"] = "function running_function(self)\
   local mc = getMC()\
   if math.abs(getTargetAngleFlat(self, mc:getPose():getPos())) > 20 then\
      self:setTarget(mc)\
      self:orientationWorker()\
   end\
end\
finish_function = Entity.orientation_finish";
	};
	["node_facePlayer_00016"] = {
		["ID"] = 16;
		["children"] = {
			[1] = "orientateToPlayer";
			[2] = "faceObject";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 60;
			[2] = 66;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "facePlayer";
		["posX"] = 1380;
		["posY"] = 270;
		["script"] = "";
	};
	["node_fall_00064"] = {
		["ID"] = 64;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "isFalling";
		["link_type"] = false;
		["name"] = "fall";
		["posX"] = 900;
		["posY"] = 120;
		["script"] = "running_function = Entity.fall_running\
finish_function = Entity.fall_finish\
";
	};
	["node_idle_00002"] = {
		["ID"] = 2;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idle";
		["posX"] = 900;
		["posY"] = 810;
		["script"] = "start_function = function(self)\
   if self.defaultAnimation then\
      self.animationsManager:playCycle(self.defaultAnimation)\
   end\
end";
	};
	["node_inDialogOrTrading_00056"] = {
		["ID"] = 56;
		["children"] = {
			[1] = "isInDialog";
			[2] = "isTrading";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 13;
			[2] = 55;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "inDialogOrTrading";
		["posX"] = 1620;
		["posY"] = -480;
		["script"] = "";
	};
	["node_inDialog_00012"] = {
		["ID"] = 12;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "inDialog";
		["posX"] = 1140;
		["posY"] = 0;
		["script"] = "start_function = Entity.inDialog_start\
running_function = true\
--finish_function = Entity.inDialog_finish";
	};
	["node_isInDialog_00013"] = {
		["ID"] = 13;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isInDialog";
		["posX"] = 1860;
		["posY"] = -510;
		["script"] = "stateName = \"inDialog\"";
	};
	["node_isTrading_00055"] = {
		["ID"] = 55;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isTrading";
		["posX"] = 1860;
		["posY"] = -450;
		["script"] = "stateName = \"trading\"";
	};
	["node_livelyDialog_00076"] = {
		["ID"] = 76;
		["children"] = {
			[1] = "inDialog";
			[2] = "preventDialogRestart";
		};
		["class"] = "Parallel";
		["connectionsID"] = {
			[1] = 12;
			[2] = 80;
		};
		["guard"] = "inDialogOrTrading";
		["link_type"] = false;
		["name"] = "livelyDialog";
		["posX"] = 900;
		["posY"] = 30;
		["script"] = "orchestrator = \"resume\"\
policy = \"sequence\"";
	};
	["node_orientateToPlayer_00059"] = {
		["ID"] = 59;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "orientateToPlayer";
		["posX"] = 1860;
		["posY"] = -390;
		["script"] = "stateName = \"orientateToPlayer\"";
	};
	["node_orientateToPlayer_00060"] = {
		["ID"] = 60;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "orientateToPlayer";
		["posX"] = 1620;
		["posY"] = 240;
		["script"] = "stateName = \"orientateToPlayer\"";
	};
	["node_orientationNotZero_00022"] = {
		["ID"] = 22;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "orientationNotZero";
		["posX"] = 1860;
		["posY"] = -330;
		["script"] = "local abs = math.abs\
condition = function(self)\
   local defaultAzimuth = self:getBBVar(\"defaultAzimuth\") or 0\
   local currentAzimuth = self:getOrientationFull()\
   return abs(abs(defaultAzimuth) - abs(currentAzimuth)) > 0.1\
end";
	};
	["node_patrol_00063"] = {
		["ID"] = 63;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "shouldPatrol";
		["link_type"] = false;
		["name"] = "patrol";
		["posX"] = 900;
		["posY"] = 720;
		["script"] = "running_function = Entity.patrol_running\
finish_function = Entity.patrol_finish";
	};
	["node_preventDialogRestart_00080"] = {
		["ID"] = 80;
		["child"] = "stuffDuringDialog";
		["class"] = "ForceSuccess";
		["connectionsID"] = {
			[1] = 81;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "preventDialogRestart";
		["posX"] = 1140;
		["posY"] = 60;
		["script"] = "";
	};
	["node_reequipWeapon_00074"] = {
		["ID"] = 74;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "shouldReequip";
		["link_type"] = false;
		["name"] = "reequipWeapon";
		["posX"] = 900;
		["posY"] = 630;
		["script"] = "running_function = Entity.reequipWeapon_running\
finish_function = Entity.reequipWeapon_finish";
	};
	["node_reequipWeapon_00087"] = {
		["ID"] = 87;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "reequipWeapon";
		["posX"] = 2640;
		["posY"] = 90;
		["script"] = "running_function = Entity.reequipWeapon_running\
finish_function = Entity.reequipWeapon_finish";
	};
	["node_root_00001"] = {
		["ID"] = 1;
		["children"] = {
			[1] = "livelyDialog";
			[2] = "fall";
			[3] = "ai.trees.damageable";
			[4] = "dialogInit";
			[5] = "unequipAndConsume";
			[6] = "turnBack";
			[7] = "reequipWeapon";
			[8] = "patrol";
			[9] = "idle";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 2;
			[2] = 11;
			[3] = 21;
			[4] = 63;
			[5] = 64;
			[6] = 70;
			[7] = 74;
			[8] = 76;
			[9] = 92;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "root";
		["posX"] = 630;
		["posY"] = 270;
		["script"] = "";
	};
	["node_setCleaverToEquip_00086"] = {
		["ID"] = 86;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "setCleaverToEquip";
		["posX"] = 2640;
		["posY"] = 30;
		["script"] = "function start_function(self)\
   self:setBBVar(\"lastEquippedWeapon\", self:getInventory():getItemByName(\"cleaver.wpn\"))\
end";
	};
	["node_shouldCutChip_00083"] = {
		["ID"] = 83;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shouldCutChip";
		["posX"] = 2130;
		["posY"] = -60;
		["script"] = "function condition(self)\
   return self:getBBVar(\"shouldCutChip\")\
end";
	};
	["node_shouldFacePlayer_00009"] = {
		["ID"] = 9;
		["children"] = {
			[1] = "talkRequest_dummy";
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
	["node_shouldReequip_00075"] = {
		["ID"] = 75;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shouldReequip";
		["posX"] = 1620;
		["posY"] = -90;
		["script"] = "function condition(self)\
   return self:getBBVar(\"lastEquippedWeapon\") ~= nil\
end";
	};
	["node_shouldTurn_00037"] = {
		["ID"] = 37;
		["children"] = {
			[1] = "orientateToPlayer";
			[2] = "orientationNotZero";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 22;
			[2] = 59;
		};
		["guard"] = "shouldNotPatrol";
		["link_type"] = false;
		["name"] = "shouldTurn";
		["posX"] = 1620;
		["posY"] = -330;
		["script"] = "";
	};
	["node_skipIfFacingPlayer_00015"] = {
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
		["posY"] = 270;
		["script"] = "";
	};
	["node_stuffDuringDialog_00081"] = {
		["ID"] = 81;
		["children"] = {
			[1] = "unequipAndConsume";
			[2] = "cutChipFinisher";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 79;
			[2] = 84;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "stuffDuringDialog";
		["posX"] = 1890;
		["posY"] = 60;
		["script"] = "";
	};
	["node_talkRequest_dummy_00006"] = {
		["ID"] = 6;
		["class"] = "Succeeder";
		["connectionsID"] = {
		};
		["guard"] = "talkRequest";
		["link_type"] = false;
		["name"] = "talkRequest_dummy";
		["posX"] = 1380;
		["posY"] = -270;
		["script"] = "stateName = \"activate\"";
	};
	["node_talkToPlayer_00010"] = {
		["ID"] = 10;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "talkToPlayer";
		["posX"] = 1140;
		["posY"] = 330;
		["script"] = "start_function = Entity.talkToPlayer_start";
	};
	["node_tryUnequip_00072"] = {
		["ID"] = 72;
		["child"] = "unequipWeapon";
		["class"] = "ForceSuccess";
		["connectionsID"] = {
			[1] = 69;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "tryUnequip";
		["posX"] = 1140;
		["posY"] = 420;
		["script"] = "";
	};
	["node_tryUnequip_00085"] = {
		["ID"] = 85;
		["class"] = "ForceSuccess";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "tryUnequip";
		["posX"] = 2640;
		["posY"] = -30;
		["script"] = "";
	};
	["node_tryUnequip_00088"] = {
		["ID"] = 88;
		["class"] = "ForceSuccess";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "tryUnequip";
		["posX"] = 2640;
		["posY"] = 210;
		["script"] = "";
	};
	["node_turnBack_00021"] = {
		["ID"] = 21;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "shouldTurn";
		["link_type"] = false;
		["name"] = "turnBack";
		["posX"] = 900;
		["posY"] = 540;
		["script"] = "function running_function(self)\
   local defaultAzimuth = self:getBBVar(\"defaultAzimuth\") or 0\
   self:setOrientationFull(defaultAzimuth)\
   self:orientationWorker()\
end\
\
finish_function = Entity.orientation_finish";
	};
	["node_unequipAndConsume_00070"] = {
		["ID"] = 70;
		["children"] = {
			[1] = "tryUnequip";
			[2] = "consumeItem";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 67;
			[2] = 72;
		};
		["guard"] = "consumeItemNameIsSet";
		["link_type"] = false;
		["name"] = "unequipAndConsume";
		["posX"] = 900;
		["posY"] = 450;
		["script"] = "";
	};
	["node_unequipAndConsume_00079"] = {
		["ID"] = 79;
		["class"] = "Sequence";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "unequipAndConsume";
		["posX"] = 2130;
		["posY"] = 30;
		["script"] = "";
	};
	["node_unequipWeapon_00069"] = {
		["ID"] = 69;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "weaponEquipped";
		["link_type"] = false;
		["name"] = "unequipWeapon";
		["posX"] = 1380;
		["posY"] = 420;
		["script"] = "running_function = Entity.unequipWeapon_running\
finish_function = Entity.unequipWeapon_finish";
	};
	["node_weaponEquipped_00071"] = {
		["ID"] = 71;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "weaponEquipped";
		["posX"] = 1620;
		["posY"] = -150;
		["script"] = "function condition(self)\
   return self:getWeaponSlotItem() ~= nil\
end";
	};
}
return obj1
