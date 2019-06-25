-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_canStartDialog_00023"] = {
		["ID"] = 23;
		["children"] = {
			[1] = "hasDialog";
			[2] = "talkAllowed";
			[3] = "playerNotTalking";
			[4] = "friendlyToPlayer";
			[5] = "shouldStartDialog";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 25;
			[2] = 27;
			[3] = 32;
			[4] = 34;
			[5] = 43;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "canStartDialog";
		["posX"] = -480;
		["posY"] = 120;
		["script"] = "";
	};
	["node_canWander_00016"] = {
		["ID"] = 16;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "canWander";
		["posX"] = 750;
		["posY"] = 690;
		["script"] = "function condition(self)\
   return self.parameters.zoneSize > 100\
end";
	};
	["node_fallRecovery?_00050"] = {
		["ID"] = 50;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "fallRecovery?";
		["posX"] = 750;
		["posY"] = 870;
		["script"] = "stateName = \"fallRecovery\"";
	};
	["node_fearsEnemy_00045"] = {
		["ID"] = 45;
		["children"] = {
			[1] = "shouldFearEnemy";
			[2] = "isEnemyDetected";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 44;
			[2] = 48;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "fearsEnemy";
		["posX"] = 990;
		["posY"] = 480;
		["script"] = "";
	};
	["node_forceFail_00035"] = {
		["ID"] = 35;
		["class"] = "Failer";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "forceFail";
		["posX"] = 510;
		["posY"] = 0;
		["script"] = "";
	};
	["node_forceSuccess_00036"] = {
		["ID"] = 36;
		["class"] = "Succeeder";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "forceSuccess";
		["posX"] = 510;
		["posY"] = -60;
		["script"] = "";
	};
	["node_friendlyToPlayer_00034"] = {
		["ID"] = 34;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "friendlyToPlayer";
		["posX"] = -240;
		["posY"] = 180;
		["script"] = "function condition(self)\
   return not self:isEnemy(getMC())\
end";
	};
	["node_hasDialog_00027"] = {
		["ID"] = 27;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hasDialog";
		["posX"] = -240;
		["posY"] = 0;
		["script"] = "function condition(entity)\
   return entity.dialog ~= nil\
end";
	};
	["node_inAir_00017"] = {
		["ID"] = 17;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "inAir";
		["posX"] = 750;
		["posY"] = 780;
		["script"] = "stateName = \"inAir\"";
	};
	["node_inZone_00014"] = {
		["ID"] = 14;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "inZone";
		["posX"] = 750;
		["posY"] = 600;
		["script"] = "senseName = \"inZone\"";
	};
	["node_isAlive_00002"] = {
		["ID"] = 2;
		["child"] = "isDead";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 3;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isAlive";
		["posX"] = 510;
		["posY"] = 90;
		["script"] = "";
	};
	["node_isDead_00003"] = {
		["ID"] = 3;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isDead";
		["posX"] = 750;
		["posY"] = 90;
		["script"] = "stateName = \"dead\"";
	};
	["node_isDialogInitiator_00026"] = {
		["ID"] = 26;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isDialogInitiator";
		["posX"] = 240;
		["posY"] = 210;
		["script"] = "condition = Entity.isDialogInitiator";
	};
	["node_isEnemyClose_00008"] = {
		["ID"] = 8;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyClose";
		["posX"] = 750;
		["posY"] = 300;
		["script"] = "senseName = \"enemyClose\"";
	};
	["node_isEnemyDetected_00006"] = {
		["ID"] = 6;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyDetected";
		["posX"] = 750;
		["posY"] = 240;
		["script"] = "senseName = \"enemyDetect\"";
	};
	["node_isEnemyDetected_00010"] = {
		["ID"] = 10;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isEnemyDetected";
		["posX"] = 750;
		["posY"] = 450;
		["script"] = "senseName = \"enemyDetect\"";
	};
	["node_isEnemyDetected_00048"] = {
		["ID"] = 48;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isEnemyDetected";
		["posX"] = 1230;
		["posY"] = 510;
		["script"] = "senseName = \"enemyDetect\"";
	};
	["node_isEnemyFar_00009"] = {
		["ID"] = 9;
		["children"] = {
			[1] = "isEnemyDetected";
			[2] = "isEnemyNotClose";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 10;
			[2] = 11;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyFar";
		["posX"] = 510;
		["posY"] = 480;
		["script"] = "";
	};
	["node_isEnemyFront_00012"] = {
		["ID"] = 12;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyFront";
		["posX"] = 750;
		["posY"] = 360;
		["script"] = "senseName = \"enemyFront\"";
	};
	["node_isEnemyNotClose_00007"] = {
		["ID"] = 7;
		["child"] = "isEnemyClose";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 8;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyNotClose";
		["posX"] = 510;
		["posY"] = 300;
		["script"] = "";
	};
	["node_isEnemyNotClose_00011"] = {
		["ID"] = 11;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isEnemyNotClose";
		["posX"] = 750;
		["posY"] = 510;
		["script"] = "";
	};
	["node_isEnemyNotDetected_00005"] = {
		["ID"] = 5;
		["child"] = "isEnemyDetected";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 6;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyNotDetected";
		["posX"] = 510;
		["posY"] = 240;
		["script"] = "";
	};
	["node_isEnemyNotFront_00013"] = {
		["ID"] = 13;
		["child"] = "isEnemyFront";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 12;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyNotFront";
		["posX"] = 510;
		["posY"] = 360;
		["script"] = "";
	};
	["node_isGetDamage_00004"] = {
		["ID"] = 4;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isGetDamage";
		["posX"] = 750;
		["posY"] = 150;
		["script"] = "stateName = \"damage\"";
	};
	["node_isStuck?_00052"] = {
		["ID"] = 52;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isStuck?";
		["posX"] = 990;
		["posY"] = 1050;
		["script"] = "stateName = \"isStuck\"";
	};
	["node_isTouchingCharacter?_00054"] = {
		["ID"] = 54;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isTouchingCharacter?";
		["posX"] = 1230;
		["posY"] = 990;
		["script"] = "stateName = \"isTouchingCharacter\"";
	};
	["node_not touching character_00053"] = {
		["ID"] = 53;
		["child"] = "isTouchingCharacter?";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 54;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "not touching character";
		["posX"] = 990;
		["posY"] = 990;
		["script"] = "";
	};
	["node_notInAir_00018"] = {
		["ID"] = 18;
		["child"] = "inAir";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 17;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "notInAir";
		["posX"] = 510;
		["posY"] = 780;
		["script"] = "";
	};
	["node_notInZone_00015"] = {
		["ID"] = 15;
		["child"] = "inZone";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 14;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "notInZone";
		["posX"] = 510;
		["posY"] = 600;
		["script"] = "";
	};
	["node_playerDetect_00028"] = {
		["ID"] = 28;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "playerDetect";
		["posX"] = 240;
		["posY"] = 150;
		["script"] = "senseName = \"playerDetect\"";
	};
	["node_playerInDialogDistance_00024"] = {
		["ID"] = 24;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "playerInDialogDistance";
		["posX"] = 240;
		["posY"] = 270;
		["script"] = "senseName = \"playerInDialogDistance\"";
	};
	["node_playerNotTalking_00043"] = {
		["ID"] = 43;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "playerNotTalking";
		["posX"] = -240;
		["posY"] = 120;
		["script"] = "function condition()\
   return not getMC():getState(\"talk\")\
end";
	};
	["node_should be jumping?_00055"] = {
		["ID"] = 55;
		["children"] = {
			[1] = "shouldJump";
			[2] = "stuckJumping?";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 51;
			[2] = 56;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "should be jumping?";
		["posX"] = 510;
		["posY"] = 1020;
		["script"] = "";
	};
	["node_shouldFearEnemy_00044"] = {
		["ID"] = 44;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shouldFearEnemy";
		["posX"] = 1230;
		["posY"] = 450;
		["script"] = "stateName = \"shouldFearEnemy\"";
	};
	["node_shouldJump_00051"] = {
		["ID"] = 51;
		["children"] = {
			[1] = "not touching character";
			[2] = "isStuck?";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 52;
			[2] = 53;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shouldJump";
		["posX"] = 750;
		["posY"] = 1020;
		["script"] = "";
	};
	["node_shouldReequip_00057"] = {
		["ID"] = 57;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shouldReequip";
		["posX"] = 510;
		["posY"] = 1200;
		["script"] = "function condition(self)\
   return self:getBBVar(\"lastEquippedWeapon\") ~= nil\
end";
	};
	["node_shouldStartDialog_00025"] = {
		["ID"] = 25;
		["children"] = {
			[1] = "wantsToTalk";
			[2] = "talkRequest";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 30;
			[2] = 33;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shouldStartDialog";
		["posX"] = -240;
		["posY"] = 240;
		["script"] = "";
	};
	["node_stuckJumping?_00056"] = {
		["ID"] = 56;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "stuckJumping?";
		["posX"] = 750;
		["posY"] = 1110;
		["script"] = "stateName = \"stuckJumping\"";
	};
	["node_talkAllowed_00032"] = {
		["ID"] = 32;
		["child"] = "talkForbidden";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 31;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "talkAllowed";
		["posX"] = -240;
		["posY"] = 60;
		["script"] = "";
	};
	["node_talkForbidden_00031"] = {
		["ID"] = 31;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "talkForbidden";
		["posX"] = 0;
		["posY"] = 60;
		["script"] = "stateName = \"talkForbidden\"";
	};
	["node_talkRequest_00033"] = {
		["ID"] = 33;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "talkRequest";
		["posX"] = 0;
		["posY"] = 270;
		["script"] = "stateName = \"activate\"";
	};
	["node_wantsToTalk_00030"] = {
		["ID"] = 30;
		["children"] = {
			[1] = "playerDetect";
			[2] = "isDialogInitiator";
			[3] = "playerInDialogDistance";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 24;
			[2] = 26;
			[3] = 28;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "wantsToTalk";
		["posX"] = 0;
		["posY"] = 210;
		["script"] = "";
	};
}
return obj1
