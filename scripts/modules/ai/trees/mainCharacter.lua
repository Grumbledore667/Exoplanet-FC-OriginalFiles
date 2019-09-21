-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_any attack button?_00214"] = {
		["ID"] = 214;
		["children"] = {
			[1] = "isAttackPressed";
			[2] = "isAimPressed";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 215;
			[2] = 216;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "any attack button?";
		["posX"] = 2400;
		["posY"] = 1140;
		["script"] = "";
	};
	["node_attack cooldown?_00291"] = {
		["ID"] = 291;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "attack cooldown?";
		["posX"] = 3990;
		["posY"] = 870;
		["script"] = "stateName = \"attackCooldown\"";
	};
	["node_attack selector_00210"] = {
		["ID"] = 210;
		["children"] = {
			[1] = "ranged selector";
			[2] = "melee sequence";
			[3] = "misc sequence";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 209;
			[2] = 217;
			[3] = 218;
		};
		["guard"] = "attackGuard";
		["link_type"] = false;
		["name"] = "attack selector";
		["posX"] = 1830;
		["posY"] = 1110;
		["script"] = "";
	};
	["node_attackGuard_00019"] = {
		["ID"] = 19;
		["children"] = {
			[1] = "isNotClimbLadderDown";
			[2] = "isNotClimbLadder";
			[3] = "isNotInteringOrTalking";
			[4] = "isNotResting";
			[5] = "isNotJumping";
			[6] = "node_246";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 28;
			[2] = 29;
			[3] = 30;
			[4] = 31;
			[5] = 32;
			[6] = 246;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "attackGuard";
		["posX"] = 720;
		["posY"] = -660;
		["script"] = "";
	};
	["node_autoreload on?_00226"] = {
		["ID"] = 226;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "autoreload on?";
		["posX"] = 3990;
		["posY"] = 990;
		["script"] = "function condition()\
   return getGameOption(\"autoReload\")\
end";
	};
	["node_bullets in magazine?_00230"] = {
		["ID"] = 230;
		["child"] = "empty magazine?";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 225;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "bullets in magazine?";
		["posX"] = 3720;
		["posY"] = 660;
		["script"] = "";
	};
	["node_can interrupt reload_00255"] = {
		["ID"] = 255;
		["children"] = {
			[1] = "isAttackPressed";
			[2] = "bullets in magazine?";
			[3] = "isNotWaitReloadEnd";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 230;
			[2] = 253;
			[3] = 254;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "can interrupt reload";
		["posX"] = 3450;
		["posY"] = 690;
		["script"] = "";
	};
	["node_canAnything_00145"] = {
		["ID"] = 145;
		["children"] = {
			[1] = "isNotConsoleVisible";
			[2] = "isNotDebugUIVisible";
			[3] = "isNotEditboxHasFocus";
			[4] = "isGameplayRootWindow";
			[5] = "isNotInScene";
			[6] = "isNotRemoteControl";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 154;
			[2] = 157;
			[3] = 159;
			[4] = 161;
			[5] = 163;
			[6] = 165;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "canAnything";
		["posX"] = 2460;
		["posY"] = -2160;
		["script"] = "";
	};
	["node_canAnything_00167"] = {
		["ID"] = 167;
		["class"] = "Sequence";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "canAnything";
		["posX"] = 2760;
		["posY"] = -1650;
		["script"] = "";
	};
	["node_canAnything_00170"] = {
		["ID"] = 170;
		["class"] = "Sequence";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "canAnything";
		["posX"] = 2760;
		["posY"] = -1530;
		["script"] = "";
	};
	["node_canAnything_00189"] = {
		["ID"] = 189;
		["class"] = "Sequence";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "canAnything";
		["posX"] = 2760;
		["posY"] = -1170;
		["script"] = "";
	};
	["node_canAttack_00171"] = {
		["ID"] = 171;
		["children"] = {
			[1] = "canAnything";
			[2] = "noWindowWithCursor";
			[3] = "isNotDisableAttack";
			[4] = "isNotWaitReloadEnd";
			[5] = "isNotInAir";
			[6] = "isNotStateSprintMode";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 170;
			[2] = 172;
			[3] = 175;
			[4] = 177;
			[5] = 180;
			[6] = 193;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "canAttack";
		["posX"] = 2490;
		["posY"] = -1410;
		["script"] = "";
	};
	["node_canAttack_00200"] = {
		["ID"] = 200;
		["class"] = "Sequence";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "canAttack";
		["posX"] = -60;
		["posY"] = -450;
		["script"] = "";
	};
	["node_canInteract_00166"] = {
		["ID"] = 166;
		["children"] = {
			[1] = "canAnything";
			[2] = "isNotDisableInteraction";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 167;
			[2] = 169;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "canInteract";
		["posX"] = 2490;
		["posY"] = -1620;
		["script"] = "";
	};
	["node_canJump_00191"] = {
		["ID"] = 191;
		["children"] = {
			[1] = "canAnything";
			[2] = "noWindowWithCursor";
			[3] = "isNotDisableJump";
			[4] = "isNotInAir";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 187;
			[2] = 189;
			[3] = 192;
			[4] = 194;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "canJump";
		["posX"] = 2490;
		["posY"] = -1110;
		["script"] = "";
	};
	["node_canJump_00196"] = {
		["ID"] = 196;
		["class"] = "Sequence";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "canJump";
		["posX"] = -60;
		["posY"] = -720;
		["script"] = "";
	};
	["node_canMove_00118"] = {
		["ID"] = 118;
		["children"] = {
			[1] = "canAnything";
			[2] = "noWindowWithCursor";
			[3] = "isNotDisableMove";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 145;
			[2] = 147;
			[3] = 149;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "canMove";
		["posX"] = 2190;
		["posY"] = -1830;
		["script"] = "";
	};
	["node_canMove_00150"] = {
		["ID"] = 150;
		["class"] = "Sequence";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "canMove";
		["posX"] = 1620;
		["posY"] = -1830;
		["script"] = "";
	};
	["node_cant interrupt reload_00256"] = {
		["ID"] = 256;
		["child"] = "can interrupt reload";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 255;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "cant interrupt reload";
		["posX"] = 3180;
		["posY"] = 690;
		["script"] = "";
	};
	["node_checkOnChangeState_00091"] = {
		["ID"] = 91;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "checkOnChangeState";
		["posX"] = 2070;
		["posY"] = 1530;
		["script"] = "function start_function(self)\
   local nc = self.notificationCenter\
   local onChangeAny = nc:notification(\"onChangeButtonState\") or nc:notification(\"onChangeState\")\
   self:setBBVar(\"onChangeAny\", onChangeAny)\
end";
	};
	["node_climbLadderGuard_00067"] = {
		["ID"] = 67;
		["children"] = {
			[1] = "isClimbLadder";
			[2] = "isClimbLadderDown";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 70;
			[2] = 72;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "climbLadderGuard";
		["posX"] = 3420;
		["posY"] = -630;
		["script"] = "";
	};
	["node_climbLadder_00008"] = {
		["ID"] = 8;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "climbLadderGuard";
		["link_type"] = false;
		["name"] = "climbLadder";
		["posX"] = 990;
		["posY"] = 930;
		["script"] = "running_function = Entity.climb_ladder_running\
finish_function = Entity.climb_ladder_finish";
	};
	["node_commonSprint_00123"] = {
		["ID"] = 123;
		["children"] = {
			[1] = "isSprintButton";
			[2] = "isForwardButton";
			[3] = "isNotTired";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 124;
			[2] = 125;
			[3] = 127;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "commonSprint";
		["posX"] = 1620;
		["posY"] = -1590;
		["script"] = "";
	};
	["node_consume_00258"] = {
		["ID"] = 258;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "consuming?";
		["link_type"] = false;
		["name"] = "consume";
		["posX"] = 2070;
		["posY"] = 660;
		["script"] = "running_function = Entity.consume_running\
finish_function = Entity.consume_finish\
";
	};
	["node_consume_00260"] = {
		["ID"] = 260;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "consume";
		["posX"] = 990;
		["posY"] = 870;
		["script"] = "running_function = Entity.consume_running\
finish_function = Entity.consume_finish\
";
	};
	["node_consume_00305"] = {
		["ID"] = 305;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "consume";
		["posX"] = 1530;
		["posY"] = -30;
		["script"] = "running_function = Entity.consume_running\
finish_function = Entity.consume_finish\
";
	};
	["node_consuming?_00259"] = {
		["ID"] = 259;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "consuming?";
		["posX"] = 2070;
		["posY"] = 510;
		["script"] = "stateName = \"consuming\"";
	};
	["node_cook_00006"] = {
		["ID"] = 6;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "isCooking";
		["link_type"] = false;
		["name"] = "cook";
		["posX"] = 2070;
		["posY"] = 600;
		["script"] = "running_function = Entity.cook_running\
finish_function = Entity.cook_finish\
";
	};
	["node_customRestarter_00099"] = {
		["ID"] = 99;
		["child"] = "moveRunning";
		["class"] = "Decorator";
		["connectionsID"] = {
			[1] = 101;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "customRestarter";
		["posX"] = 1260;
		["posY"] = 1620;
		["script"] = "local Decorator = require \"ai.Node\"\
--local NodeState = require \"ai.NodeState\"\
\
function running(self)\
   local nc = self.entity.notificationCenter\
   local onChangeAny = nc:notification(\"onChangeButtonState\") or\
                       nc:notification(\"onChangeState\")\
   if onChangeAny then\
      self.child:reset()\
   end\
   return self.child:update()\
end\
\
function finish(self)\
   Decorator.finish(self)\
   self.entity:move_stop()\
end";
	};
	["node_dead_00096"] = {
		["ID"] = 96;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "isDead";
		["link_type"] = false;
		["name"] = "dead";
		["posX"] = 990;
		["posY"] = -150;
		["script"] = "running_function = true";
	};
	["node_do stuff during talk_00284"] = {
		["ID"] = 284;
		["children"] = {
			[1] = "unequip";
			[2] = "consume";
			[3] = "dummyRunning";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 283;
			[2] = 285;
			[3] = 305;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "do stuff during talk";
		["posX"] = 1260;
		["posY"] = -60;
		["script"] = "";
	};
	["node_dummyRunning_00083"] = {
		["ID"] = 83;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "dummyRunning";
		["posX"] = 2070;
		["posY"] = 720;
		["script"] = "running_function = true";
	};
	["node_dummyRunning_00285"] = {
		["ID"] = 285;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "dummyRunning";
		["posX"] = 1530;
		["posY"] = 30;
		["script"] = "running_function = true";
	};
	["node_empty magazine?_00225"] = {
		["ID"] = 225;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "empty magazine?";
		["posX"] = 3990;
		["posY"] = 660;
		["script"] = "function condition(self)\
   return self:getWeaponSlotItem():isMagazineEmpty()\
end";
	};
	["node_equipping?_00266"] = {
		["ID"] = 266;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "equipping?";
		["posX"] = 1740;
		["posY"] = 1260;
		["script"] = "stateName = \"equipping\"";
	};
	["node_exit from reload_00242"] = {
		["ID"] = 242;
		["class"] = "Failer";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "exit from reload";
		["posX"] = 2670;
		["posY"] = 840;
		["script"] = "";
	};
	["node_fire a shot_00243"] = {
		["ID"] = 243;
		["children"] = {
			[1] = "isAttackPressed";
			[2] = "shoot or try reload";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 212;
			[2] = 236;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "fire a shot";
		["posX"] = 2670;
		["posY"] = 930;
		["script"] = "";
	};
	["node_get hit or attack_00221"] = {
		["ID"] = 221;
		["children"] = {
			[1] = "hit recovery";
			[2] = "unequip";
			[3] = "preventReturn";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 206;
			[2] = 222;
			[3] = 261;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "get hit or attack";
		["posX"] = 1260;
		["posY"] = 1140;
		["script"] = "";
	};
	["node_get up_00279"] = {
		["ID"] = 279;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "getting up?";
		["link_type"] = false;
		["name"] = "get up";
		["posX"] = 990;
		["posY"] = 540;
		["script"] = "running_function = Entity.get_up_running\
finish_function = Entity.get_up_finish\
";
	};
	["node_getting up?_00280"] = {
		["ID"] = 280;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "getting up?";
		["posX"] = 690;
		["posY"] = 300;
		["script"] = "stateName = \"getting up\"";
	};
	["node_gun equipped?_00211"] = {
		["ID"] = 211;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "hasWeaponEquipped";
		["h"] = 60;
		["link_type"] = false;
		["name"] = "gun equipped?";
		["posX"] = 2370;
		["posY"] = 600;
		["script"] = "function condition(self)\
   return self:getWeaponSlotItem():isRangedWeapon()\
end";
		["w"] = 240;
	};
	["node_hasMeleeWeaponEquipped_00198"] = {
		["ID"] = 198;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "hasWeaponEquipped";
		["h"] = 60;
		["link_type"] = false;
		["name"] = "hasMeleeWeaponEquipped";
		["posX"] = 420;
		["posY"] = -390;
		["script"] = "function condition(self)\
   return self:getWeaponSlotItem():isMeleeWeapon()\
end";
		["w"] = 240;
	};
	["node_hasMeleeWeaponEquipped_00213"] = {
		["ID"] = 213;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["h"] = 60;
		["link_type"] = "internal";
		["name"] = "hasMeleeWeaponEquipped";
		["posX"] = 2400;
		["posY"] = 1080;
		["script"] = "function condition(self)\
   return self:getWeaponSlotItem():isMeleeWeapon()\
end";
		["w"] = 240;
	};
	["node_hasWeaponEquipped_00197"] = {
		["ID"] = 197;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hasWeaponEquipped";
		["posX"] = -60;
		["posY"] = -570;
		["script"] = "function condition(self)\
   return self:getWeaponSlotItem() ~= nil\
end";
	};
	["node_hit recovery?_00278"] = {
		["ID"] = 278;
		["class"] = "ReactiveGuard";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "hit recovery?";
		["posX"] = 1560;
		["posY"] = 930;
		["script"] = "";
	};
	["node_hit recovery_00222"] = {
		["ID"] = 222;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "hit recovery?";
		["link_type"] = false;
		["name"] = "hit recovery";
		["posX"] = 1560;
		["posY"] = 990;
		["script"] = "running_function = Entity.hit_recovery_running\
finish_function = Entity.hit_recovery_finish";
	};
	["node_interact_00007"] = {
		["ID"] = 7;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "interacting?";
		["link_type"] = false;
		["name"] = "interact";
		["posX"] = 990;
		["posY"] = 210;
		["script"] = "running_function = Entity.interact_running\
finish_function = Entity.interact_finish";
	};
	["node_interacting?_00304"] = {
		["ID"] = 304;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "interacting?";
		["posX"] = 690;
		["posY"] = 210;
		["script"] = "stateName = \"interacting\"";
	};
	["node_isAimMode_00108"] = {
		["ID"] = 108;
		["children"] = {
			[1] = "isAiming";
			[2] = "prevCamOffsetNot3";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 105;
			[2] = 107;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isAimMode";
		["posX"] = 1350;
		["posY"] = -2130;
		["script"] = "";
	};
	["node_isAimPressed_00204"] = {
		["ID"] = 204;
		["class"] = "ButtonCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isAimPressed";
		["posX"] = 420;
		["posY"] = -330;
		["script"] = "buttonName = \"AIM\"";
	};
	["node_isAimPressed_00216"] = {
		["ID"] = 216;
		["class"] = "ButtonCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isAimPressed";
		["posX"] = 2670;
		["posY"] = 1140;
		["script"] = "buttonName = \"AIM\"";
	};
	["node_isAiming_00105"] = {
		["ID"] = 105;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isAiming";
		["posX"] = 1620;
		["posY"] = -2190;
		["script"] = "stateName = \"aiming\"";
	};
	["node_isAlive_00098"] = {
		["ID"] = 98;
		["child"] = "isDead";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 97;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isAlive";
		["posX"] = -570;
		["posY"] = -1110;
		["script"] = "";
	};
	["node_isAnyAttack_00202"] = {
		["ID"] = 202;
		["children"] = {
			[1] = "isAttackPressed";
			[2] = "isMeleeAltAttack";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 201;
			[2] = 203;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isAnyAttack";
		["posX"] = -60;
		["posY"] = -390;
		["script"] = "";
	};
	["node_isAttackPressed_00201"] = {
		["ID"] = 201;
		["class"] = "ButtonCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isAttackPressed";
		["posX"] = 180;
		["posY"] = -420;
		["script"] = "buttonName = \"ATTACK\"";
	};
	["node_isAttackPressed_00212"] = {
		["ID"] = 212;
		["class"] = "ButtonCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isAttackPressed";
		["posX"] = 2940;
		["posY"] = 900;
		["script"] = "buttonName = \"ATTACK\"";
	};
	["node_isAttackPressed_00215"] = {
		["ID"] = 215;
		["class"] = "ButtonCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isAttackPressed";
		["posX"] = 2670;
		["posY"] = 1080;
		["script"] = "buttonName = \"ATTACK\"";
	};
	["node_isAttackPressed_00220"] = {
		["ID"] = 220;
		["class"] = "ButtonCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isAttackPressed";
		["posX"] = 2400;
		["posY"] = 1290;
		["script"] = "buttonName = \"ATTACK\"";
	};
	["node_isAttackPressed_00253"] = {
		["ID"] = 253;
		["class"] = "ButtonCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isAttackPressed";
		["posX"] = 3720;
		["posY"] = 600;
		["script"] = "buttonName = \"ATTACK\"";
	};
	["node_isAttacking_00016"] = {
		["ID"] = 16;
		["children"] = {
			[1] = "hasWeaponEquipped";
			[2] = "isHealthAboveZero";
			[3] = "canAttack";
			[4] = "isAnyAttack";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 197;
			[2] = 199;
			[3] = 200;
			[4] = 202;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isAttacking";
		["posX"] = -300;
		["posY"] = -480;
		["script"] = "";
	};
	["node_isAttacking_00033"] = {
		["ID"] = 33;
		["class"] = "Sequence";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isAttacking";
		["posX"] = 1230;
		["posY"] = -540;
		["script"] = "";
	};
	["node_isBackButton_00132"] = {
		["ID"] = 132;
		["class"] = "ButtonCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isBackButton";
		["posX"] = 2160;
		["posY"] = -1290;
		["script"] = "buttonName = \"BACK\"";
	};
	["node_isClimbLadderDown_00010"] = {
		["ID"] = 10;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isClimbLadderDown";
		["posX"] = -300;
		["posY"] = -990;
		["script"] = "stateName = \"climbing_ladder_down\"";
	};
	["node_isClimbLadderDown_00072"] = {
		["ID"] = 72;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isClimbLadderDown";
		["posX"] = 3660;
		["posY"] = -600;
		["script"] = "stateName = \"climbing_ladder_down\"";
	};
	["node_isClimbLadder_00012"] = {
		["ID"] = 12;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isClimbLadder";
		["posX"] = -300;
		["posY"] = -930;
		["script"] = "stateName = \"climbing_ladder\"";
	};
	["node_isClimbLadder_00070"] = {
		["ID"] = 70;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isClimbLadder";
		["posX"] = 3660;
		["posY"] = -660;
		["script"] = "stateName = \"climbing_ladder\"";
	};
	["node_isConsoleVisible_00151"] = {
		["ID"] = 151;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isConsoleVisible";
		["posX"] = 3000;
		["posY"] = -2250;
		["script"] = "local gui\
function condition()\
   gui = gui or gameplayUI\
   return gui:isConsoleVisible()\
end";
	};
	["node_isCooking_00018"] = {
		["ID"] = 18;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isCooking";
		["posX"] = -300;
		["posY"] = -360;
		["script"] = "stateName = \"cooking\"";
	};
	["node_isDead_00097"] = {
		["ID"] = 97;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isDead";
		["posX"] = -300;
		["posY"] = -1110;
		["script"] = "stateName = \"dead\"";
	};
	["node_isDebugUIVisible_00153"] = {
		["ID"] = 153;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isDebugUIVisible";
		["posX"] = 3000;
		["posY"] = -2190;
		["script"] = "local gui\
function condition()\
   gui = gui or gameplayUI\
   return gui.debugUI:isVisible()\
end";
	};
	["node_isDisableAttack_00173"] = {
		["ID"] = 173;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isDisableAttack";
		["posX"] = 3030;
		["posY"] = -1410;
		["script"] = "stateName = \"disableAttack\"";
	};
	["node_isDisableInteraction_00168"] = {
		["ID"] = 168;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isDisableInteraction";
		["posX"] = 3030;
		["posY"] = -1590;
		["script"] = "stateName = \"disableInteraction\"";
	};
	["node_isDisableJump_00182"] = {
		["ID"] = 182;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isDisableJump";
		["posX"] = 3030;
		["posY"] = -1050;
		["script"] = "stateName = \"disableJump\"";
	};
	["node_isDisableMove_00148"] = {
		["ID"] = 148;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isDisableMove";
		["posX"] = 2730;
		["posY"] = -1770;
		["script"] = "stateName = \"disableMove\"";
	};
	["node_isEditboxHasFocus_00155"] = {
		["ID"] = 155;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEditboxHasFocus";
		["posX"] = 3000;
		["posY"] = -2130;
		["script"] = "local gui\
function condition()\
   gui = gui or gameplayUI\
   return gui:editBoxHasFocus()\
end";
	};
	["node_isForwardButton_00125"] = {
		["ID"] = 125;
		["class"] = "ButtonCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isForwardButton";
		["posX"] = 1890;
		["posY"] = -1590;
		["script"] = "buttonName = \"FORWARD\"";
	};
	["node_isGameplayRootWindow_00154"] = {
		["ID"] = 154;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isGameplayRootWindow";
		["posX"] = 2730;
		["posY"] = -2070;
		["script"] = "local gui\
function condition()\
   gui = gui or gameplayUI\
   return gui:isGameplayRootWindow()\
end";
	};
	["node_isHealthAboveZero_00199"] = {
		["ID"] = 199;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isHealthAboveZero";
		["posX"] = -60;
		["posY"] = -510;
		["script"] = "function condition(self)\
   return self:getHealth() > 0\
end";
	};
	["node_isHealthAboveZero_00207"] = {
		["ID"] = 207;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isHealthAboveZero";
		["posX"] = 2220;
		["posY"] = -510;
		["script"] = "function condition(self)\
   return self:getHealth() > 0\
end";
	};
	["node_isInAir_00176"] = {
		["ID"] = 176;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isInAir";
		["posX"] = 3030;
		["posY"] = -1290;
		["script"] = "stateName = \"inAir\"";
	};
	["node_isInScene_00162"] = {
		["ID"] = 162;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isInScene";
		["posX"] = 3000;
		["posY"] = -2010;
		["script"] = "function condition()\
   return getGlobalParam(\"inScene\")\
end";
	};
	["node_isInteractingOrTalking_00013"] = {
		["ID"] = 13;
		["children"] = {
			[1] = "isInteracting";
			[2] = "talk?";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 78;
			[2] = 80;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isInteractingOrTalking";
		["posX"] = -300;
		["posY"] = -870;
		["script"] = "";
	};
	["node_isInteracting_00078"] = {
		["ID"] = 78;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isInteracting";
		["posX"] = -60;
		["posY"] = -900;
		["script"] = "stateName = \"interacting\"";
	};
	["node_isJumpPressed_00195"] = {
		["ID"] = 195;
		["class"] = "ButtonCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isJumpPressed";
		["posX"] = -60;
		["posY"] = -780;
		["script"] = "buttonName = \"JUMP\"";
	};
	["node_isJumping_00015"] = {
		["ID"] = 15;
		["children"] = {
			[1] = "isJumpPressed";
			[2] = "canJump";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 195;
			[2] = 196;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isJumping";
		["posX"] = -300;
		["posY"] = -750;
		["script"] = "";
	};
	["node_isJumping_00039"] = {
		["ID"] = 39;
		["class"] = "Sequence";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isJumping";
		["posX"] = 1710;
		["posY"] = -510;
		["script"] = "";
	};
	["node_isLanding_00094"] = {
		["ID"] = 94;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isLanding";
		["posX"] = -300;
		["posY"] = -1050;
		["script"] = "stateName = \"landing\"";
	};
	["node_isLeftButton_00130"] = {
		["ID"] = 130;
		["class"] = "ButtonCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isLeftButton";
		["posX"] = 2160;
		["posY"] = -1410;
		["script"] = "buttonName = \"LEFT\"";
	};
	["node_isMeleeAltAttack_00203"] = {
		["ID"] = 203;
		["children"] = {
			[1] = "hasMeleeWeaponEquipped";
			[2] = "isAimPressed";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 198;
			[2] = 204;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isMeleeAltAttack";
		["posX"] = 180;
		["posY"] = -360;
		["script"] = "";
	};
	["node_isNonForwardButton_00129"] = {
		["ID"] = 129;
		["children"] = {
			[1] = "isLeftButton";
			[2] = "isRightButton";
			[3] = "isBackButton";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 130;
			[2] = 131;
			[3] = 132;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNonForwardButton";
		["posX"] = 1890;
		["posY"] = -1350;
		["script"] = "";
	};
	["node_isNotAimMode_00113"] = {
		["ID"] = 113;
		["child"] = "isAimMode";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 108;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotAimMode";
		["posX"] = 1080;
		["posY"] = -2130;
		["script"] = "";
	};
	["node_isNotAimMode_00114"] = {
		["ID"] = 114;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotAimMode";
		["posX"] = 1620;
		["posY"] = -1950;
		["script"] = "";
	};
	["node_isNotAimMode_00140"] = {
		["ID"] = 140;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotAimMode";
		["posX"] = 1350;
		["posY"] = -1170;
		["script"] = "";
	};
	["node_isNotAiming_00106"] = {
		["ID"] = 106;
		["child"] = "isAiming";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 105;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotAiming";
		["posX"] = 1350;
		["posY"] = -2190;
		["script"] = "";
	};
	["node_isNotAttacking_00026"] = {
		["ID"] = 26;
		["child"] = "isAttacking";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 16;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotAttacking";
		["posX"] = -570;
		["posY"] = -480;
		["script"] = "";
	};
	["node_isNotClimbLadderDown_00020"] = {
		["ID"] = 20;
		["child"] = "isClimbLadderDown";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 10;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotClimbLadderDown";
		["posX"] = -570;
		["posY"] = -990;
		["script"] = "";
	};
	["node_isNotClimbLadderDown_00028"] = {
		["ID"] = 28;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotClimbLadderDown";
		["posX"] = 990;
		["posY"] = -810;
		["script"] = "";
	};
	["node_isNotClimbLadderDown_00037"] = {
		["ID"] = 37;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotClimbLadderDown";
		["posX"] = 1710;
		["posY"] = -750;
		["script"] = "";
	};
	["node_isNotClimbLadderDown_00044"] = {
		["ID"] = 44;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotClimbLadderDown";
		["posX"] = 2220;
		["posY"] = -750;
		["script"] = "";
	};
	["node_isNotClimbLadderDown_00048"] = {
		["ID"] = 48;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotClimbLadderDown";
		["posX"] = 2700;
		["posY"] = -720;
		["script"] = "";
	};
	["node_isNotClimbLadder_00021"] = {
		["ID"] = 21;
		["child"] = "isClimbLadder";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 12;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotClimbLadder";
		["posX"] = -570;
		["posY"] = -930;
		["script"] = "";
	};
	["node_isNotClimbLadder_00029"] = {
		["ID"] = 29;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotClimbLadder";
		["posX"] = 990;
		["posY"] = -750;
		["script"] = "";
	};
	["node_isNotClimbLadder_00035"] = {
		["ID"] = 35;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotClimbLadder";
		["posX"] = 1710;
		["posY"] = -690;
		["script"] = "";
	};
	["node_isNotClimbLadder_00045"] = {
		["ID"] = 45;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotClimbLadder";
		["posX"] = 2220;
		["posY"] = -690;
		["script"] = "";
	};
	["node_isNotClimbLadder_00050"] = {
		["ID"] = 50;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotClimbLadder";
		["posX"] = 2700;
		["posY"] = -660;
		["script"] = "";
	};
	["node_isNotConsoleVisible_00157"] = {
		["ID"] = 157;
		["child"] = "isConsoleVisible";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 151;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotConsoleVisible";
		["posX"] = 2730;
		["posY"] = -2250;
		["script"] = "";
	};
	["node_isNotCooking_00027"] = {
		["ID"] = 27;
		["child"] = "isCooking";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 18;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotCooking";
		["posX"] = -570;
		["posY"] = -360;
		["script"] = "";
	};
	["node_isNotDebugUIVisible_00159"] = {
		["ID"] = 159;
		["child"] = "isDebugUIVisible";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 153;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotDebugUIVisible";
		["posX"] = 2730;
		["posY"] = -2190;
		["script"] = "";
	};
	["node_isNotDisableAttack_00172"] = {
		["ID"] = 172;
		["child"] = "isDisableAttack";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 173;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotDisableAttack";
		["posX"] = 2760;
		["posY"] = -1410;
		["script"] = "";
	};
	["node_isNotDisableInteraction_00169"] = {
		["ID"] = 169;
		["child"] = "isDisableInteraction";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 168;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotDisableInteraction";
		["posX"] = 2760;
		["posY"] = -1590;
		["script"] = "";
	};
	["node_isNotDisableJump_00187"] = {
		["ID"] = 187;
		["child"] = "isDisableJump";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 182;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotDisableJump";
		["posX"] = 2760;
		["posY"] = -1050;
		["script"] = "";
	};
	["node_isNotDisableMove_00149"] = {
		["ID"] = 149;
		["child"] = "isDisableMove";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 148;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotDisableMove";
		["posX"] = 2460;
		["posY"] = -1770;
		["script"] = "";
	};
	["node_isNotEditboxHasFocus_00161"] = {
		["ID"] = 161;
		["child"] = "isEditboxHasFocus";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 155;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotEditboxHasFocus";
		["posX"] = 2730;
		["posY"] = -2130;
		["script"] = "";
	};
	["node_isNotInAir_00177"] = {
		["ID"] = 177;
		["child"] = "isInAir";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 176;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotInAir";
		["posX"] = 2760;
		["posY"] = -1290;
		["script"] = "";
	};
	["node_isNotInAir_00192"] = {
		["ID"] = 192;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotInAir";
		["posX"] = 2760;
		["posY"] = -990;
		["script"] = "";
	};
	["node_isNotInScene_00163"] = {
		["ID"] = 163;
		["child"] = "isInScene";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 162;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotInScene";
		["posX"] = 2730;
		["posY"] = -2010;
		["script"] = "";
	};
	["node_isNotInteringOrTalking_00022"] = {
		["ID"] = 22;
		["child"] = "isInteractingOrTalking";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 13;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotInteringOrTalking";
		["posX"] = -570;
		["posY"] = -870;
		["script"] = "";
	};
	["node_isNotInteringOrTalking_00030"] = {
		["ID"] = 30;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotInteringOrTalking";
		["posX"] = 990;
		["posY"] = -690;
		["script"] = "";
	};
	["node_isNotInteringOrTalking_00036"] = {
		["ID"] = 36;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotInteringOrTalking";
		["posX"] = 1710;
		["posY"] = -630;
		["script"] = "";
	};
	["node_isNotInteringOrTalking_00042"] = {
		["ID"] = 42;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotInteringOrTalking";
		["posX"] = 2220;
		["posY"] = -630;
		["script"] = "";
	};
	["node_isNotInteringOrTalking_00051"] = {
		["ID"] = 51;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotInteringOrTalking";
		["posX"] = 2700;
		["posY"] = -600;
		["script"] = "";
	};
	["node_isNotJumping_00023"] = {
		["ID"] = 23;
		["child"] = "isJumping";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 15;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotJumping";
		["posX"] = -570;
		["posY"] = -750;
		["script"] = "";
	};
	["node_isNotJumping_00032"] = {
		["ID"] = 32;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotJumping";
		["posX"] = 990;
		["posY"] = -570;
		["script"] = "";
	};
	["node_isNotNonForwardButton_00133"] = {
		["ID"] = 133;
		["child"] = "isNonForwardButton";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 129;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotNonForwardButton";
		["posX"] = 1620;
		["posY"] = -1350;
		["script"] = "";
	};
	["node_isNotReloading_00135"] = {
		["ID"] = 135;
		["child"] = "isReloading";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 134;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotReloading";
		["posX"] = 1620;
		["posY"] = -1470;
		["script"] = "";
	};
	["node_isNotRemoteControl_00165"] = {
		["ID"] = 165;
		["child"] = "isRemoteControl";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 164;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotRemoteControl";
		["posX"] = 2730;
		["posY"] = -1950;
		["script"] = "";
	};
	["node_isNotResting_00024"] = {
		["ID"] = 24;
		["child"] = "isResting";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 14;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotResting";
		["posX"] = -570;
		["posY"] = -810;
		["script"] = "";
	};
	["node_isNotResting_00031"] = {
		["ID"] = 31;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotResting";
		["posX"] = 990;
		["posY"] = -630;
		["script"] = "";
	};
	["node_isNotResting_00034"] = {
		["ID"] = 34;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotResting";
		["posX"] = 1710;
		["posY"] = -570;
		["script"] = "";
	};
	["node_isNotResting_00041"] = {
		["ID"] = 41;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotResting";
		["posX"] = 2220;
		["posY"] = -570;
		["script"] = "";
	};
	["node_isNotStateSprintMode_00180"] = {
		["ID"] = 180;
		["child"] = "isStateSprintMode";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 181;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotStateSprintMode";
		["posX"] = 2760;
		["posY"] = -1230;
		["script"] = "";
	};
	["node_isNotSwimming_00117"] = {
		["ID"] = 117;
		["child"] = "isSwimming";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 115;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotSwimming";
		["posX"] = 1620;
		["posY"] = -1890;
		["script"] = "";
	};
	["node_isNotSwimming_00136"] = {
		["ID"] = 136;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotSwimming";
		["posX"] = 1620;
		["posY"] = -1410;
		["script"] = "";
	};
	["node_isNotTired_00127"] = {
		["ID"] = 127;
		["child"] = "isTired";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 126;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotTired";
		["posX"] = 1890;
		["posY"] = -1530;
		["script"] = "";
	};
	["node_isNotWaitReloadEnd_00175"] = {
		["ID"] = 175;
		["child"] = "isWaitReloadEnd";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 174;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotWaitReloadEnd";
		["posX"] = 2760;
		["posY"] = -1350;
		["script"] = "";
	};
	["node_isNotWaitReloadEnd_00254"] = {
		["ID"] = 254;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotWaitReloadEnd";
		["posX"] = 3720;
		["posY"] = 720;
		["script"] = "";
	};
	["node_isNotWalkButton_00110"] = {
		["ID"] = 110;
		["child"] = "isWalkButton";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 109;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotWalkButton";
		["posX"] = 1350;
		["posY"] = -2070;
		["script"] = "";
	};
	["node_isNotWalkButton_00112"] = {
		["ID"] = 112;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotWalkButton";
		["posX"] = 1620;
		["posY"] = -2010;
		["script"] = "";
	};
	["node_isNotWeaponRunOnly_00121"] = {
		["ID"] = 121;
		["child"] = "isWeaponRunOnly";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 122;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotWeaponRunOnly";
		["posX"] = 1620;
		["posY"] = -1710;
		["script"] = "";
	};
	["node_isNotWeaponRunOnly_00138"] = {
		["ID"] = 138;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotWeaponRunOnly";
		["posX"] = 1620;
		["posY"] = -1230;
		["script"] = "";
	};
	["node_isNotWeaponWalkOnly_00120"] = {
		["ID"] = 120;
		["child"] = "isWeaponWalkOnly";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 119;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isNotWeaponWalkOnly";
		["posX"] = 1620;
		["posY"] = -1770;
		["script"] = "";
	};
	["node_isNotWeaponWalkOnly_00137"] = {
		["ID"] = 137;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isNotWeaponWalkOnly";
		["posX"] = 1620;
		["posY"] = -1290;
		["script"] = "";
	};
	["node_isReloading_00134"] = {
		["ID"] = 134;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isReloading";
		["posX"] = 1890;
		["posY"] = -1470;
		["script"] = "stateName = \"reloading\"";
	};
	["node_isReloading_00245"] = {
		["ID"] = 245;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isReloading";
		["posX"] = 1230;
		["posY"] = -480;
		["script"] = "stateName = \"reloading\"";
	};
	["node_isReloading_00252"] = {
		["ID"] = 252;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isReloading";
		["posX"] = 3180;
		["posY"] = 630;
		["script"] = "stateName = \"reloading\"";
	};
	["node_isRemoteControl_00164"] = {
		["ID"] = 164;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isRemoteControl";
		["posX"] = 3000;
		["posY"] = -1950;
		["script"] = "stateName = \"remoteControl\"";
	};
	["node_isResting_00014"] = {
		["ID"] = 14;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isResting";
		["posX"] = -300;
		["posY"] = -810;
		["script"] = "stateName = \"resting\"";
	};
	["node_isResting_00052"] = {
		["ID"] = 52;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isResting";
		["posX"] = 2700;
		["posY"] = -540;
		["script"] = "stateName = \"resting\"";
	};
	["node_isRightButton_00131"] = {
		["ID"] = 131;
		["class"] = "ButtonCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isRightButton";
		["posX"] = 2160;
		["posY"] = -1350;
		["script"] = "buttonName = \"RIGHT\"";
	};
	["node_isRunMode_00111"] = {
		["ID"] = 111;
		["children"] = {
			[1] = "isNotWalkButton";
			[2] = "isNotAimMode";
			[3] = "isNotSwimming";
			[4] = "canMove";
			[5] = "isNotWeaponWalkOnly";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 112;
			[2] = 114;
			[3] = 117;
			[4] = 120;
			[5] = 150;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isRunMode";
		["posX"] = 1350;
		["posY"] = -1890;
		["script"] = "";
	};
	["node_isSprintButton_00124"] = {
		["ID"] = 124;
		["class"] = "ButtonCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isSprintButton";
		["posX"] = 1890;
		["posY"] = -1650;
		["script"] = "buttonName = \"SPRINT\"";
	};
	["node_isSprintMode_00128"] = {
		["ID"] = 128;
		["children"] = {
			[1] = "isRunMode";
			[2] = "commonSprint";
			[3] = "isNotReloading";
			[4] = "isNotSwimming";
			[5] = "isNotNonForwardButton";
			[6] = "isNotWeaponWalkOnly";
			[7] = "isNotWeaponRunOnly";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 111;
			[2] = 123;
			[3] = 133;
			[4] = 135;
			[5] = 136;
			[6] = 137;
			[7] = 138;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isSprintMode";
		["posX"] = 1080;
		["posY"] = -1800;
		["script"] = "";
	};
	["node_isStateSprintMode_00181"] = {
		["ID"] = 181;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isStateSprintMode";
		["posX"] = 3030;
		["posY"] = -1230;
		["script"] = "stateName = \"sprintMode\"";
	};
	["node_isSwimMode_00139"] = {
		["ID"] = 139;
		["children"] = {
			[1] = "isNotAimMode";
			[2] = "isSwimming";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 140;
			[2] = 143;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isSwimMode";
		["posX"] = 1080;
		["posY"] = -1140;
		["script"] = "";
	};
	["node_isSwimSprintMode_00142"] = {
		["ID"] = 142;
		["children"] = {
			[1] = "canMove";
			[2] = "commonSprint";
			[3] = "isNotNonForwardButton";
			[4] = "isNotWeaponWalkOnly";
			[5] = "isNotWeaponRunOnly";
			[6] = "isSwimMode";
			[7] = "isSwimming";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 123;
			[2] = 133;
			[3] = 137;
			[4] = 138;
			[5] = 139;
			[6] = 144;
			[7] = 150;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isSwimSprintMode";
		["posX"] = 810;
		["posY"] = -1320;
		["script"] = "";
	};
	["node_isSwimming_00115"] = {
		["ID"] = 115;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isSwimming";
		["posX"] = 1890;
		["posY"] = -1890;
		["script"] = "stateName = \"swimming\"";
	};
	["node_isSwimming_00143"] = {
		["ID"] = 143;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isSwimming";
		["posX"] = 1350;
		["posY"] = -1110;
		["script"] = "stateName = \"swimming\"";
	};
	["node_isSwimming_00144"] = {
		["ID"] = 144;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isSwimming";
		["posX"] = 1080;
		["posY"] = -1080;
		["script"] = "stateName = \"swimming\"";
	};
	["node_isTired_00126"] = {
		["ID"] = 126;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isTired";
		["posX"] = 2160;
		["posY"] = -1530;
		["script"] = "stateName = \"tired\"";
	};
	["node_isWaitReloadEnd_00174"] = {
		["ID"] = 174;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isWaitReloadEnd";
		["posX"] = 3030;
		["posY"] = -1350;
		["script"] = "stateName = \"waitReloadEnd\"";
	};
	["node_isWalkButton_00109"] = {
		["ID"] = 109;
		["class"] = "ButtonCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isWalkButton";
		["posX"] = 1620;
		["posY"] = -2070;
		["script"] = "buttonName = \"WALK\"";
	};
	["node_isWeaponRunOnly_00122"] = {
		["ID"] = 122;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isWeaponRunOnly";
		["posX"] = 1890;
		["posY"] = -1710;
		["script"] = "function condition(self)\
   local weapon = self:getWeaponSlotItem()\
   return weapon and weapon:getMovementRestriction() == \"run\"\
end";
	};
	["node_isWeaponWalkOnly_00119"] = {
		["ID"] = 119;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isWeaponWalkOnly";
		["posX"] = 1890;
		["posY"] = -1770;
		["script"] = "function condition(self)\
   local weapon = self:getWeaponSlotItem()\
   return weapon and weapon:getMovementRestriction() == \"walk\"\
end";
	};
	["node_isWindowWithCursor_00146"] = {
		["ID"] = 146;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isWindowWithCursor";
		["posX"] = 2730;
		["posY"] = -1830;
		["script"] = "local GUIUtils = require \"ui.utils\"\
\
function condition()\
   return GUIUtils.interactiveWindowsVisible()\
end";
	};
	["node_itemToEquip_00263"] = {
		["ID"] = 263;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "itemToEquip";
		["posX"] = 1740;
		["posY"] = 1380;
		["script"] = "function condition(self)\
   return self:getBBVar(\"itemToEquip\") ~= nil\
end";
	};
	["node_itemToUnequip_00264"] = {
		["ID"] = 264;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "itemToUnequip";
		["posX"] = 1740;
		["posY"] = 1440;
		["script"] = "function condition(self)\
   return self:getBBVar(\"itemToUnequip\") ~= nil\
end";
	};
	["node_jumpGuard_00038"] = {
		["ID"] = 38;
		["children"] = {
			[1] = "isNotClimbLadderDown";
			[2] = "isNotClimbLadder";
			[3] = "isNotInteringOrTalking";
			[4] = "isNotResting";
			[5] = "isJumping";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 34;
			[2] = 35;
			[3] = 36;
			[4] = 37;
			[5] = 39;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "jumpGuard";
		["posX"] = 1470;
		["posY"] = -630;
		["script"] = "";
	};
	["node_jump_00003"] = {
		["ID"] = 3;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "jumpGuard";
		["link_type"] = false;
		["name"] = "jump";
		["posX"] = 990;
		["posY"] = 30;
		["script"] = "start_function = Entity.jump\
running_function = true";
	};
	["node_landing_00095"] = {
		["ID"] = 95;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "isLanding";
		["link_type"] = false;
		["name"] = "landing";
		["posX"] = 990;
		["posY"] = -30;
		["script"] = "running_function = Entity.landing_running\
finish_function = Entity.landing_finish";
	};
	["node_melee attack_00002"] = {
		["ID"] = 2;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "melee attack";
		["posX"] = 2400;
		["posY"] = 1200;
		["script"] = "running_function = Entity.attack_melee_running\
finish_function = Entity.attack_melee_finish";
	};
	["node_melee sequence_00217"] = {
		["ID"] = 217;
		["children"] = {
			[1] = "no attack cooldown?";
			[2] = "hasMeleeWeaponEquipped";
			[3] = "any attack button?";
			[4] = "melee attack";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 2;
			[2] = 213;
			[3] = 214;
			[4] = 293;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "melee sequence";
		["posX"] = 2130;
		["posY"] = 1110;
		["script"] = "";
	};
	["node_misc attack_00219"] = {
		["ID"] = 219;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "misc attack";
		["posX"] = 2400;
		["posY"] = 1350;
		["script"] = "start_function = Entity.attack_misc_start\
finish_function = Entity.attack_misc_finish";
	};
	["node_misc sequence_00218"] = {
		["ID"] = 218;
		["children"] = {
			[1] = "isAttackPressed";
			[2] = "misc attack";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 219;
			[2] = 220;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "misc sequence";
		["posX"] = 2130;
		["posY"] = 1320;
		["script"] = "";
	};
	["node_moveAction_00104"] = {
		["ID"] = 104;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "moveAction";
		["posX"] = 1260;
		["posY"] = 1200;
		["script"] = "start_function = Entity.move_start\
\
function running_function(self)\
   local nc = self.notificationCenter\
   local onChangeAny = nc:notification(\"onChangeButtonState\") or nc:notification(\"onChangeState\")\
   if onChangeAny then\
      self:move_start()\
   end\
   return true\
end\
\
finish_function = Entity.move_stop";
	};
	["node_moveBBVar_00004"] = {
		["ID"] = 4;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "moveBBVar";
		["posX"] = 2070;
		["posY"] = 1590;
		["script"] = "start_function = Entity.move_start\
\
function running_function(self)\
   local onChangeAny = self:getBBVar(\"onChangeAny\")\
   return not onChangeAny\
end\
";
	};
	["node_moveCoroutine_00103"] = {
		["ID"] = 103;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "moveCoroutine";
		["posX"] = 1260;
		["posY"] = 1680;
		["script"] = "function running_function(self)\
   local nc = self.notificationCenter\
   local onChangeAny\
   self:move_start()\
   coro.waitNextTick()\
   while true do\
      onChangeAny = nc:notification(\"onChangeButtonState\") or nc:notification(\"onChangeState\")\
      if onChangeAny then\
         self:move_start()\
      end\
      coro.waitNextTick()\
   end\
end\
\
finish_function = Entity.move_stop";
	};
	["node_moveFinisher_00076"] = {
		["ID"] = 76;
		["child"] = "preventExit";
		["class"] = "Finisher";
		["connectionsID"] = {
			[1] = 77;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "moveFinisher";
		["posX"] = 1260;
		["posY"] = 1560;
		["script"] = "function finish_function(self)\
   self:move_stop()\
   self:setBBVar(\"onChangeAny\", nil)\
end";
	};
	["node_moveGuard_00043"] = {
		["ID"] = 43;
		["children"] = {
			[1] = "isNotClimbLadderDown";
			[2] = "isNotClimbLadder";
			[3] = "isNotInteringOrTalking";
			[4] = "isNotResting";
			[5] = "isHealthAboveZero";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 41;
			[2] = 42;
			[3] = 44;
			[4] = 45;
			[5] = 207;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "moveGuard";
		["posX"] = 1980;
		["posY"] = -630;
		["script"] = "-- this guard is mostly useless";
	};
	["node_moveRunning_00101"] = {
		["ID"] = 101;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "moveRunning";
		["posX"] = 1530;
		["posY"] = 1620;
		["script"] = "start_function = Entity.move_start\
running_function = true";
	};
	["node_moveStandDo_00205"] = {
		["ID"] = 205;
		["children"] = {
			[1] = "get hit or attack";
			[2] = "moveAction";
		};
		["class"] = "Parallel";
		["connectionsID"] = {
			[1] = 104;
			[2] = 221;
		};
		["guard"] = "moveGuard";
		["link_type"] = false;
		["name"] = "moveStandDo";
		["posX"] = 990;
		["posY"] = 1170;
		["script"] = "orchestrator = \"resume\"\
policy = \"selector\"";
	};
	["node_no attack cooldown?_00292"] = {
		["ID"] = 292;
		["child"] = "attack cooldown?";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 291;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "no attack cooldown?";
		["posX"] = 3720;
		["posY"] = 870;
		["script"] = "";
	};
	["node_no attack cooldown?_00293"] = {
		["ID"] = 293;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "no attack cooldown?";
		["posX"] = 2400;
		["posY"] = 1020;
		["script"] = "";
	};
	["node_noWindowWithCursor_00147"] = {
		["ID"] = 147;
		["child"] = "isWindowWithCursor";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 146;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "noWindowWithCursor";
		["posX"] = 2460;
		["posY"] = -1830;
		["script"] = "";
	};
	["node_noWindowWithCursor_00193"] = {
		["ID"] = 193;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "noWindowWithCursor";
		["posX"] = 2760;
		["posY"] = -1470;
		["script"] = "";
	};
	["node_noWindowWithCursor_00194"] = {
		["ID"] = 194;
		["class"] = "Invertor";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "noWindowWithCursor";
		["posX"] = 2760;
		["posY"] = -1110;
		["script"] = "";
	};
	["node_node_246_00246"] = {
		["ID"] = 246;
		["children"] = {
			[1] = "isAttacking";
			[2] = "isReloading";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 33;
			[2] = 245;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "node_246";
		["posX"] = 990;
		["posY"] = -510;
		["script"] = "";
	};
	["node_playerBT_00000"] = {
		["ID"] = 0;
		["child"] = "root";
		["class"] = "BehaviorTree";
		["connectionsID"] = {
			[1] = 1;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "playerBT";
		["posX"] = 450;
		["posY"] = 630;
		["script"] = "";
	};
	["node_prevCamOffsetNot3_00107"] = {
		["ID"] = 107;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "prevCamOffsetNot3";
		["posX"] = 1620;
		["posY"] = -2130;
		["script"] = "function condition(self)\
   return self.prevCamOffset ~= 3\
end";
	};
	["node_prevent misc attack_00234"] = {
		["ID"] = 234;
		["child"] = "fire a shot";
		["class"] = "ForceSuccess";
		["connectionsID"] = {
			[1] = 243;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "prevent misc attack";
		["posX"] = 2400;
		["posY"] = 930;
		["script"] = "--[[\
Don't let parent selector try executing melee (which has\
weapon type requirement) and misc (main reason) which does NOT\
have weapon type requirement. It's either that or putting checks\
or guards in misc attack.\
]]";
	};
	["node_preventExit_00077"] = {
		["ID"] = 77;
		["child"] = "restartOnChangeState";
		["class"] = "UntilFailure";
		["connectionsID"] = {
			[1] = 93;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "preventExit";
		["posX"] = 1530;
		["posY"] = 1560;
		["script"] = "";
	};
	["node_preventRestart_00089"] = {
		["ID"] = 89;
		["child"] = "restIdle";
		["class"] = "UntilFailure";
		["connectionsID"] = {
			[1] = 87;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "preventRestart";
		["posX"] = 1530;
		["posY"] = 660;
		["script"] = "";
	};
	["node_preventReturn_00206"] = {
		["ID"] = 206;
		["child"] = "attack selector";
		["class"] = "ForceFailure";
		["connectionsID"] = {
			[1] = 210;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "preventReturn";
		["posX"] = 1560;
		["posY"] = 1110;
		["script"] = "";
	};
	["node_ranged attack_00208"] = {
		["ID"] = 208;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "ranged attack";
		["posX"] = 3720;
		["posY"] = 930;
		["script"] = "running_function = Entity.attack_ranged_running\
finish_function = Entity.attack_ranged_finish";
	};
	["node_ranged selector_00209"] = {
		["ID"] = 209;
		["children"] = {
			[1] = "reload evaluator";
			[2] = "prevent misc attack";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 234;
			[2] = 240;
		};
		["guard"] = "gun equipped?";
		["link_type"] = false;
		["name"] = "ranged selector";
		["posX"] = 2130;
		["posY"] = 870;
		["script"] = "policy = \"selector\"\
orchestrator = \"resume\"";
	};
	["node_reload allowed_00257"] = {
		["ID"] = 257;
		["children"] = {
			[1] = "isReloading";
			[2] = "cant interrupt reload";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 252;
			[2] = 256;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "reload allowed";
		["posX"] = 2910;
		["posY"] = 660;
		["script"] = "";
	};
	["node_reload evaluator_00240"] = {
		["ID"] = 240;
		["children"] = {
			[1] = "reload";
			[2] = "exit from reload";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 238;
			[2] = 242;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "reload evaluator";
		["posX"] = 2400;
		["posY"] = 810;
		["script"] = "";
	};
	["node_reload_00238"] = {
		["ID"] = 238;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "reload allowed";
		["link_type"] = false;
		["name"] = "reload";
		["posX"] = 2670;
		["posY"] = 780;
		["script"] = "running_function = Entity.reload_running\
finish_function = Entity.reload_finish";
	};
	["node_restFinisher_00082"] = {
		["ID"] = 82;
		["child"] = "rest";
		["class"] = "Finisher";
		["connectionsID"] = {
			[1] = 81;
		};
		["guard"] = "restGuard";
		["link_type"] = false;
		["name"] = "restFinisher";
		["posX"] = 990;
		["posY"] = 630;
		["script"] = "finish_function = Entity.rest_finish";
	};
	["node_restGuard_00049"] = {
		["ID"] = 49;
		["children"] = {
			[1] = "isNotClimbLadderDown";
			[2] = "isNotClimbLadder";
			[3] = "isNotInteringOrTalking";
			[4] = "isResting";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 48;
			[2] = 50;
			[3] = 51;
			[4] = 52;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "restGuard";
		["posX"] = 2460;
		["posY"] = -630;
		["script"] = "";
	};
	["node_restIdle_00087"] = {
		["ID"] = 87;
		["children"] = {
			[1] = "cook";
			[2] = "consume";
			[3] = "dummyRunning";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 6;
			[2] = 83;
			[3] = 258;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "restIdle";
		["posX"] = 1800;
		["posY"] = 660;
		["script"] = "";
	};
	["node_restStart_00005"] = {
		["ID"] = 5;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "restStart";
		["posX"] = 1530;
		["posY"] = 600;
		["script"] = "running_function = Entity.rest_running\
";
	};
	["node_rest_00081"] = {
		["ID"] = 81;
		["children"] = {
			[1] = "restStart";
			[2] = "preventRestart";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 5;
			[2] = 89;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "rest";
		["posX"] = 1260;
		["posY"] = 630;
		["script"] = "";
	};
	["node_restartOnChangeState_00093"] = {
		["ID"] = 93;
		["children"] = {
			[1] = "checkOnChangeState";
			[2] = "moveBBVar";
		};
		["class"] = "Parallel";
		["connectionsID"] = {
			[1] = 4;
			[2] = 91;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "restartOnChangeState";
		["posX"] = 1800;
		["posY"] = 1560;
		["script"] = "orchestrator = \"resume\"\
policy = \"sequence\"";
	};
	["node_root_00001"] = {
		["ID"] = 1;
		["children"] = {
			[1] = "dead";
			[2] = "talking";
			[3] = "landing";
			[4] = "jump";
			[5] = "interact";
			[6] = "get up";
			[7] = "restFinisher";
			[8] = "consume";
			[9] = "climbLadder";
			[10] = "side_step";
			[11] = "moveStandDo";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 3;
			[2] = 7;
			[3] = 8;
			[4] = 82;
			[5] = 95;
			[6] = 96;
			[7] = 205;
			[8] = 260;
			[9] = 279;
			[10] = 282;
			[11] = 299;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "root";
		["posX"] = 720;
		["posY"] = 630;
		["script"] = "";
	};
	["node_run autoreload_00227"] = {
		["ID"] = 227;
		["children"] = {
			[1] = "autoreload on?";
			[2] = "tryReload";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 226;
			[2] = 228;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "run autoreload";
		["posX"] = 3720;
		["posY"] = 990;
		["script"] = "";
	};
	["node_shoot finisher_00281"] = {
		["ID"] = 281;
		["child"] = "shoot";
		["class"] = "Finisher";
		["connectionsID"] = {
			[1] = 235;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shoot finisher";
		["posX"] = 3210;
		["posY"] = 930;
		["script"] = "function finish_function(self)\
   self:setState(\"disableAttack\", false)\
end";
	};
	["node_shoot or try reload_00236"] = {
		["ID"] = 236;
		["children"] = {
			[1] = "shoot finisher";
			[2] = "tryReload";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 237;
			[2] = 281;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shoot or try reload";
		["posX"] = 2940;
		["posY"] = 960;
		["script"] = "";
	};
	["node_shoot_00235"] = {
		["ID"] = 235;
		["children"] = {
			[1] = "no attack cooldown?";
			[2] = "ranged attack";
			[3] = "run autoreload";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 208;
			[2] = 227;
			[3] = 292;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shoot";
		["posX"] = 3450;
		["posY"] = 930;
		["script"] = "";
	};
	["node_side_step?_00302"] = {
		["ID"] = 302;
		["class"] = "ReactiveGuard";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "side_step?";
		["posX"] = 1230;
		["posY"] = 1020;
		["script"] = "";
	};
	["node_side_step_00299"] = {
		["ID"] = 299;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "side_step?";
		["link_type"] = false;
		["name"] = "side_step";
		["posX"] = 990;
		["posY"] = 1020;
		["script"] = "running_function = Entity.side_step_running\
finish_function = Entity.side_step_finish";
	};
	["node_sleepAtBed?_00268"] = {
		["ID"] = 268;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "sleepAtBed?";
		["posX"] = -300;
		["posY"] = -240;
		["script"] = "stateName = \"sleepAtBed\"";
	};
	["node_talk start_00273"] = {
		["ID"] = 273;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "talk start";
		["posX"] = 1260;
		["posY"] = -120;
		["script"] = "start_function = Entity.talking_start";
	};
	["node_talk?_00080"] = {
		["ID"] = 80;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "talk?";
		["posX"] = -60;
		["posY"] = -840;
		["script"] = "stateName = \"talk\"";
	};
	["node_talking_00282"] = {
		["ID"] = 282;
		["children"] = {
			[1] = "talk start";
			[2] = "do stuff during talk";
		};
		["class"] = "Sequence";
		["connectionsID"] = {
			[1] = 273;
			[2] = 284;
		};
		["guard"] = "talk?";
		["link_type"] = false;
		["name"] = "talking";
		["posX"] = 990;
		["posY"] = -90;
		["script"] = "";
	};
	["node_tryReload_00228"] = {
		["ID"] = 228;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "empty magazine?";
		["link_type"] = false;
		["name"] = "tryReload";
		["posX"] = 3990;
		["posY"] = 1050;
		["script"] = "start_function = Entity.tryReload\
";
	};
	["node_tryReload_00237"] = {
		["ID"] = 237;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "empty magazine?";
		["link_type"] = "internal";
		["name"] = "tryReload";
		["posX"] = 3210;
		["posY"] = 990;
		["script"] = "start_function = Entity.tryReload\
";
	};
	["node_un_equipping?_00265"] = {
		["ID"] = 265;
		["children"] = {
			[1] = "equipping?";
			[2] = "unequipping?";
			[3] = "itemToEquip";
			[4] = "itemToUnequip";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 262;
			[2] = 263;
			[3] = 264;
			[4] = 266;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "un_equipping?";
		["posX"] = 1500;
		["posY"] = 1350;
		["script"] = "";
	};
	["node_unequip_00261"] = {
		["ID"] = 261;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "un_equipping?";
		["link_type"] = false;
		["name"] = "unequip";
		["posX"] = 1560;
		["posY"] = 1050;
		["script"] = "running_function = Entity.unequip_running\
finish_function = Entity.unequip_finish";
	};
	["node_unequip_00283"] = {
		["ID"] = 283;
		["class"] = "CoroutineAction";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "unequip";
		["posX"] = 1530;
		["posY"] = -90;
		["script"] = "running_function = Entity.unequip_running\
finish_function = Entity.unequip_finish";
	};
	["node_unequipping?_00262"] = {
		["ID"] = 262;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "unequipping?";
		["posX"] = 1740;
		["posY"] = 1320;
		["script"] = "stateName = \"unequipping\"";
	};
}
return obj1
