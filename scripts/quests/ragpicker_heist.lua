-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "I found out that the outcast camp clothes trader Ragpicker has a warehouse. I think I could \"borrow\" some useful things there.\
But, in order to get inside, I'll have to get rid of the guard called Bamba somehow.";
	["group_indices"] = {
	};
	["hidden"] = false;
	["logs"] = {
		["bamba_beaten"] = "I started a fight with Bamba.";
		["bamba_door_1_unlocked_stealing"] = "Bamba got on his feet surprisingly fast and caught me at the warehopuse's entrance. He didn't detain me but warned that the guards will get me if any wares will be found missing.";
		["bamba_dummy_destroyed"] = "Told Bamba that his little trick could be discovered and he ran straight back to his proper post. Well, now no one can stop me from taking a look inside the warehouse.";
		["bamba_electrocuted"] = "I had to use my wits, but with the magic of electricity, I managed to knock out Bamba by dropping a poorly attached wire down on him.";
		["bamba_ko"] = "Managed to knock that abori down. Time to check the warehouse he was guarding.";
		["bamba_search"] = "This guy Bamba came round too quickly, caught me when I was about to leave the warehouse, and threatened to call his boss to deal with me together.";
		["bamba_search_bribe"] = "A hefty sum of antigravium helped me avoid a meeting with the warehouse owner. Bamba said he wasn't working there anymore and left without stopping me.";
		["bamba_search_call_ragpicker"] = "I agreed to call the warehouse owner at once.";
		["bamba_search_jack_calls_ragpicker"] = "I decided to take the initiative and called the warehouse owner myself.";
		["bamba_search_provoke"] = "I started a fight with Bamba inside the warehouse.";
		["bamba_side_job"] = "I need to talk to the camp guards' commander. He might have a better task for Bamba than guarding a private warehouse.";
		["crooked_leg_about_bamba"] = "Crooked Leg, the head guard, didn't believe me when I told him Bamba was working on the side as a guard at Ragpicker's warehouse instead of standing on the watchtower. I'll have to check out the watchtower myself.";
		["crooked_leg_reveal"] = "I told Crooked Leg about the dummy scheme, and he promised to check out this information.";
		["popped_eye_dummy_destroyed"] = "When I destroyed one of the dummies on the watchtower, Popped Eye who was sitting nearby got mad at me and demanded that I run and find his mate Bamba.";
		["popped_eye_trick_revealed"] = "It turned out that there was only Bamba's half-witted mate Popped Eye up on the watchtower. Bamba devised this trick – he made two dummy guards to trick their boss and do their own business during guard duty.";
		["ragpicker_beating_fine"] = "When talking to Ragpicker, he wondered why I had clobbered his guard and suggested that I pay for his treatment.";
		["ragpicker_beating_fine_pay"] = "I agreed to pay for Bamba's treatment, to brush the matter under the carpet.";
		["ragpicker_beating_fine_refuse"] = "I refused and Ragpicker threatened that I would regret my decision.";
		["ragpicker_fine_refuse"] = "I told Ragpicker to go to hell. Ragpicker refused to trade with me until I pay for what I had done and he also said he would definitely report my crimes to the guards.";
		["ragpicker_fine_stealing"] = "Ragpicker demanded that I pay the fine for robbery and return his goods back or pay for them.";
		["ragpicker_fine_stealing_buy"] = "I agreed to pay the fine and buy up the stolen goods.";
		["ragpicker_fine_stealing_return"] = "I agreed to pay the fine and return the stolen goods.";
		["ragpicker_fine_trespassing"] = "Ragpicker demanded that I pay him a fine for trespassing at the warehouse.";
		["ragpicker_fine_trespassing_pay"] = "I agreed to pay the fine for trespassing.";
		["ragpicker_jack_called"] = "I managed to convince Ragpicker that Bamba had brought me to the warehouse. Ragpicker interpreted the events in his own way and threw me out from the private property without searching me.";
		["ragpicker_noise"] = "When I knocked down the guard, Ragpicker entered the warehouse, alarmed at the noise, to see what the hell was going on.";
		["ragpicker_theft_convince_fail"] = "I failed to make up a convincing excuse for Ragpicker so I didn't have to hand over the tools to him.";
		["ragpicker_theft_convince_perverts"] = "I managed to convince him that Bamba and I had more interesting things to think about then than his goods.";
		["ragpicker_theft_convince_success"] = "I managed to convince Ragpicker that I had nothing to do with robbery at his warehouse.";
		["ragpicker_theft_discovered"] = "Ragpicker nevertheless discovered that something was missing from his warehouse and accused me of robbery.";
	};
	["nodes"] = {
		["bamba_in_room"] = {
			["ID"] = 51;
			["connectionsID"] = {
				[1] = 15;
				[2] = 16;
				[3] = 38;
				[4] = 50;
				[5] = 54;
				[6] = 73;
				[7] = 90;
			};
			["name"] = "bamba_in_room";
			["posX"] = 1830;
			["posY"] = -930;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local player = getMC()\
   player:setDisableActionStates(true)\
   local bamba = self.objects.bamba\
   bamba:setImmortality(\"protected\")\
   bamba:setAttitudeToMainCharacter(\"NEUTRAL\")\
   bamba.navigator:setPatrolRoute(nil)\
   bamba.statusEffectsManager:destroyEffectsByName(\"electricShock\")\
\
   local door_1 = self.objects.door_1\
   local door_2 = self.objects.door_2\
   if door_1.opened then\
      door_1:activate()\
   end\
\
   door_1:disable()\
   door_2:disable()\
\
   --Skip first greeting in case we never triggered it\
   if self:getTopicVisible(\"bamba_start\") then\
      self:setTopicVisible(\"bamba_start\", false)\
      self:setTopicVisible(\"bamba_regular_greeting\", true)\
      self:setTopicVisible(\"bamba_side_job\", true)\
   end\
   self:setTopicVisible(\"bamba_search\", true)\
   local callbacks = {\
      onPause = {[\"func\"] = function()\
         teleportTo(bamba, self.objects.bamba_search_wp)\
         teleportTo(player, self.objects.player_search_wp)\
         bamba:setDialogInitiator(true)\
      end},\
      onFadeOutEnd = {[\"func\"] = function()\
         player:setDisableActionStates(false)\
      end},\
   }\
   gameplayUI:startFadeToBlackSequence(0.5, 1, 0.5, callbacks)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["bamba_leaves"] = {
			["ID"] = 59;
			["connectionsID"] = {
				[1] = 48;
			};
			["name"] = "bamba_leaves";
			["posX"] = 4410;
			["posY"] = -930;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local bamba = self.objects.bamba\
   bamba.navigator:setPatrolRoute(self.groups.bamba_to_store_wps)\
   bamba:orientTo(self.objects.bamba_store_orient_wp)\
   bamba:setState(\"talkForbidden\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["bamba_outside"] = {
			["ID"] = 52;
			["connectionsID"] = {
				[1] = 9;
				[2] = 10;
				[3] = 11;
				[4] = 12;
				[5] = 31;
				[6] = 35;
				[7] = 84;
				[8] = 85;
				[9] = 86;
				[10] = 87;
				[11] = 88;
				[12] = 89;
				[13] = 98;
				[14] = 113;
			};
			["name"] = "bamba_outside";
			["posX"] = 450;
			["posY"] = -930;
			["script"] = "";
			["type"] = "step";
		};
		["condition_00005"] = {
			["ID"] = 5;
			["connectionsID"] = {
			};
			["event"] = "unauthorized_access";
			["posX"] = -990;
			["posY"] = 90;
			["script"] = "function Condition:onCheck(name, obj)\
   self.objects.twitchy_outcast:orientTo(getMC())\
   gameplayUI.subtitlesUI:addSubtitle(self.twitchy_subtitle, 3, self.objects.twitchy_outcast)\
   self.q:start()\
   self.q:tryActivateSandFleaIntro()\
   return false\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:counter_door_1";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00006"] = {
			["ID"] = 6;
			["connectionsID"] = {
			};
			["event"] = "turnAggressive";
			["posX"] = -240;
			["posY"] = 90;
			["script"] = "function Condition:onCheck(name, obj)\
   --Check for knockout, cause it might happen on this frame while quest\
   --hasn't started yet\
   local bamba = self.objects.bamba\
   if bamba:getState(\"knockout\") then\
      bamba:setImmortality(\"immortal\")\
      bamba:setAttitudeToMainCharacter(\"NEUTRAL\")\
\
      if not self:getParam(\"wire_ko\") then\
         bamba:setKnockout(true, self.bamba_ko_time)\
         bamba.navigator:moveTo(self.objects.bamba_store_wp)\
\
         if not self:getParam(\"bamba_ko\") then\
            addExpToPlayer(self.bamba_knockout_exp)\
            self:writeLogOnce(\"bamba_ko\")\
         end\
         local wire_activator = self.objects.wire_activator\
         if not wire_activator.activated then\
            wire_activator:disable()\
         end\
      end\
   end\
\
   self:setTopicVisible(\"bamba_beaten\", true)\
   self:writeLogOnce(\"bamba_beaten\")\
   self.q:start()\
   self.q:tryActivateSandFleaIntro()\
   return false\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "bamba";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00007"] = {
			["ID"] = 7;
			["connectionsID"] = {
			};
			["event"] = "unauthorized_access";
			["posX"] = -990;
			["posY"] = 210;
			["script"] = "function Condition:onCheck(name, obj)\
   self.objects.ragpicker:orientTo(getMC())\
   gameplayUI.subtitlesUI:addSubtitle(self.ragpicker_subtitle, 3, self.objects.ragpicker)\
   self.q:start()\
   self.q:tryActivateSandFleaIntro()\
   return false\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:counter_door_2";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00008"] = {
			["ID"] = 8;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "trigger_in";
			["posX"] = -480;
			["posY"] = 600;
			["script"] = "function Condition:onCheck(name, obj)\
   if not getMC():isInTrigger(obj) then return false end\
   self.objects.bamba:setImmortality(\"protected\")\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:arena_trigger";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00009"] = {
			["ID"] = 9;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 1110;
			["posY"] = -810;
			["script"] = "function Condition:onCheck(name, obj)\
   if not getMC():isInTrigger(obj) then return false end\
   local bamba = self.objects.bamba\
   if not bamba:getState(\"dead\") and not bamba:getState(\"knockout\") then\
      bamba:setImmortality(\"protected\")\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:arena_trigger";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00010"] = {
			["ID"] = 10;
			["connectionsID"] = {
			};
			["event"] = "trigger_out";
			["posX"] = 1350;
			["posY"] = -810;
			["script"] = "function Condition:onCheck(name, obj)\
   if getMC():isInTrigger(obj) then return false end\
   --Does not let him leave the trigger during fight\
   --Deaggro and return to initial wp\
   local bamba = self.objects.bamba\
   if not bamba:getState(\"dead\") and not bamba:getState(\"knockout\")\
      and bamba:getAttitudeToMainCharacter() == \"ENEMY\" then\
      bamba.navigator:moveTo(self.objects.bamba_store_wp)\
      bamba:setImmortality(\"immortal\")\
      bamba:setAttitudeToMainCharacter(\"NEUTRAL\")\
      bamba:setStatCount(\"health\", bamba:getStatCount(\"healthMax\"))\
      gameplayUI.subtitlesUI:addSubtitle(self.bamba_arena_leave_subtitle, 8, self.objects.bamba)\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:arena_trigger";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00011"] = {
			["ID"] = 11;
			["connectionsID"] = {
				[1] = 51;
			};
			["event"] = "knockout_end";
			["posX"] = 1230;
			["posY"] = -960;
			["script"] = "function Condition:onCheck(name, obj)\
   local wire_ko = self:getParam(\"wire_ko\")\
   self:setParam(\"wire_ko\", false)\
   obj:setStatCount(\"health\", obj:getStatCount(\"healthMax\"))\
\
   if not wire_ko then\
      self:setTopicVisible(\"ragpicker_beating_fine_greeting\", true)\
      self:setTopicVisible(\"ragpicker_beating_fine\", true)\
      self:setTopicVisible(\"ragpicker_beating_fine_pay\", true)\
      self:setTopicVisible(\"ragpicker_beating_fine_refuse\", true)\
   end\
\
   obj:setImmortality(\"protected\")\
   local wire_activator = self.objects.wire_activator\
   if not wire_activator.activated then\
      wire_activator:enable()\
   end\
\
   self.q:saveStolenLoot()\
\
   local player = getMC()\
   local lockpicked = not self.objects.door_1:isLocked()\
   local jackOutside = player:isInTrigger(self.objects.arena_trigger)\
   local jackInside = player:isInTrigger(self.objects.room_1_trigger) or player:isInTrigger(self.objects.room_2_trigger)\
   local lootStolen = self.q:getStolenLootPrice() > 0\
\
   if jackInside then\
      return true\
   end\
\
   self.q:updateLootList()\
   self.q:restoreLocks()\
\
   --'What the fuck happened?'\
   if not lockpicked and jackOutside and wire_ko then\
      obj:setDialogInitiator(true)\
      self:setTopicVisible(\"bamba_electrocuted\", true)\
   --'What were you doing there?'\
   elseif lockpicked and jackOutside then\
      obj:setDialogInitiator(true)\
      self:setTopicVisible(\"bamba_door_1_unlocked\", true)\
   end\
\
   --Notify the guards if Jack is outside after stealing or he beaten bamba up and left\
   if lootStolen and (jackOutside or not wire_ko) then\
      self.q:restoreLocks(true)\
      self.q:applyRagpickerMarkup()\
      self:setTopicVisible(\"cudgel_fine\", true)\
      self:setTopicVisible(\"cudgel_fine\", true)\
      self:setTopicVisible(\"cudgel_fine_stealing_pay\", true)\
      self.objects.cudgel:setDialogInitiator(true)\
      self:setTopicVisible(\"ragpicker_no_trade\", true)\
      self:setTopicVisible(\"bamba_door_1_unlocked_stealing\", true)\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bamba";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00012"] = {
			["ID"] = 12;
			["connectionsID"] = {
			};
			["event"] = "knockout";
			["posX"] = 930;
			["posY"] = -1080;
			["script"] = "function Condition:onCheck(name, obj)\
   obj:setImmortality(\"immortal\")\
   obj:setAttitudeToMainCharacter(\"NEUTRAL\")\
\
   if not self:getParam(\"wire_ko\") then\
      obj:setKnockout(true, self.bamba_ko_time)\
      obj.navigator:moveTo(self.objects.bamba_store_wp)\
\
      self:setTopicVisible(\"bamba_beaten\", true)\
      if not self:getParam(\"log_used_bamba_ko\") then\
         addExpToPlayer(self.bamba_knockout_exp)\
         self:writeLogOnce(\"bamba_ko\")\
      end\
      local wire_activator = self.objects.wire_activator\
      if not wire_activator.activated then\
         wire_activator:disable()\
      end\
   end\
   self.q:tryActivateSandFleaIntro()\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bamba";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00013"] = {
			["ID"] = 13;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -750;
			["posY"] = -180;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"bamba_side_job\", true)\
   self:setTopicVisible(\"bamba_regular_greeting\", true)\
   self.q:start()\
   self.q:tryActivateSandFleaIntro()\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "bamba_start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00015"] = {
			["ID"] = 15;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 1890;
			["posY"] = -1620;
			["script"] = "function Condition:onCheck(name, obj)\
   self.objects.bamba:setImmortality(\"immortal\")\
   self:setTopicVisible(\"bamba_search_call_ragpicker\", true)\
   self:setTopicVisible(\"bamba_search_provoke\", true)\
   self:setTopicVisible(\"bamba_search_bribe\", true)\
   self:writeLogOnce(\"bamba_search\")\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bamba_search";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00016"] = {
			["ID"] = 16;
			["connectionsID"] = {
				[1] = 76;
			};
			["event"] = "discuss";
			["posX"] = 2220;
			["posY"] = -450;
			["script"] = "function Condition:onCheck(name, obj)\
   local bamba = self.objects.bamba\
   giveItemFromPlayerTo(\"antigravium_shards.itm\", bamba, self.bamba_search_bribe)\
   bamba.navigator:setPatrolRoute(self.groups.bamba_bribe_tower_wps)\
   bamba:setIgnoreSleep(true)\
   bamba:setDefaultAnimation(\"idle\")\
   bamba:setState(\"talkForbidden\", true)\
\
   self.objects.door_1:setGuardedBy(bamba, false)\
   self.objects.door_2:setGuardedBy(bamba, false)\
\
   self:setTopicVisible(\"bamba_beaten\", false)\
\
   self:setTopicVisible(\"popped_eye_about_partner\", false)\
   self:setTopicVisible(\"crooked_leg_about_bamba\", false)\
   self:setTopicVisible(\"crooked_leg_reveal\", false)\
   self:setTopicVisible(\"crooked_leg_bamba_okay\", true)\
\
   self:setTopicVisible(\"bamba_tower_bribed\", true)\
\
   self.q:susbscribeRestoreLocks(5, true)\
\
   self.objects.door_1:enable()\
   self.objects.door_2:enable()\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bamba_search_bribe";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00017"] = {
			["ID"] = 17;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 3180;
			["posY"] = 270;
			["script"] = "function Condition:onCheck(name, obj)\
   local bamba = self.objects.bamba\
   if not bamba:isInTrigger(obj) then return false end\
   self.q:bambaAndPoppedOnTower()\
   bamba:setState(\"talkForbidden\", false)\
   bamba:setIgnoreSleep(false)\
\
   self:setTopicVisible(\"popped_eye_tower\", true)\
\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:bamba_last_to_tower_wp";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00020"] = {
			["ID"] = 20;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 3420;
			["posY"] = 270;
			["script"] = "function Condition:onCheck(name, obj)\
   self.q:saveStolenLoot()\
   self.q:restoreLocks(true)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_about_bamba_gone";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00023"] = {
			["ID"] = 23;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 1500;
			["posY"] = 630;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"ragpicker_beating_fine\", true)\
   self:writeLogOnce(\"ragpicker_beating_fine_refuse\")\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_beating_fine_refuse";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00024"] = {
			["ID"] = 24;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 1500;
			["posY"] = 480;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"antigravium_shards.itm\", self.objects.ragpicker, self.ragpicker_beating_fine)\
   self:setTopicVisible(\"ragpicker_beating_fine_greeting\", false)\
   self:setTopicVisible(\"ragpicker_beating_fine\", false)\
   self:setTopicVisible(\"ragpicker_beating_fine_refuse\", false)\
   self:writeLogOnce(\"ragpicker_beating_fine_pay\")\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_beating_fine_pay";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00025"] = {
			["ID"] = 25;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 1260;
			["posY"] = 540;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"ragpicker_first_greeting\", false)\
   self:writeLogOnce(\"ragpicker_beating_fine\")\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_beating_fine_greeting";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00026"] = {
			["ID"] = 26;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 3660;
			["posY"] = 270;
			["script"] = "function Condition:onCheck(name, obj)\
   self.q:bambaAndPoppedInCave(true)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_blame_bamba";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00027"] = {
			["ID"] = 27;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 3930;
			["posY"] = 270;
			["script"] = "function Condition:onCheck(name, obj)\
   self.objects.bamba:setAttitudeToMainCharacter(\"ENEMY\")\
   self.objects.popped_eye:setAttitudeToMainCharacter(\"ENEMY\")\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "bamba_cave_attack";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00031"] = {
			["ID"] = 31;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 690;
			["posY"] = -570;
			["script"] = "function Condition:onCheck(name, obj)\
   self.q:restoreLocks()\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bamba_door_1_unlocked";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00034"] = {
			["ID"] = 34;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "unauthorized_access";
			["posX"] = -480;
			["posY"] = 270;
			["script"] = "function Condition:onCheck(name, obj)\
   local player = getMC()\
   self.objects.bamba:orientTo(player)\
   gameplayUI.subtitlesUI:addSubtitle(self.bamba_subtitle, 6, self.objects.bamba)\
   self.q:tryActivateSandFleaIntro()\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:door_1";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00035"] = {
			["ID"] = 35;
			["connectionsID"] = {
			};
			["event"] = "unauthorized_access";
			["posX"] = 270;
			["posY"] = -1200;
			["script"] = "function Condition:onCheck(name, obj)\
   self.objects.bamba:orientTo(getMC())\
   gameplayUI.subtitlesUI:addSubtitle(self.bamba_subtitle, 6, self.objects.bamba)\
   self.q:tryActivateSandFleaIntro()\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:door_1";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00036"] = {
			["ID"] = 36;
			["connectionsID"] = {
			};
			["event"] = "activate";
			["posX"] = -150;
			["posY"] = -90;
			["script"] = "function Condition:onCheck(name, obj)\
   local bamba = self.objects.bamba\
   addStatusEffectTo(bamba, \"electricShock\")\
   bamba:setKnockout(true, self.bamba_ko_time, \"front\")\
   bamba:setImmortality(\"immortal\")\
   bamba:setAttitudeToMainCharacter(\"NEUTRAL\")\
   addExpToPlayer(self.wire_exp)\
   self:setParam(\"wire_ko\", true)\
   self:writeLog(\"bamba_electrocuted\")\
   self.q:start()\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:wire_activator";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00038"] = {
			["ID"] = 38;
			["connectionsID"] = {
				[1] = 53;
			};
			["event"] = "discuss";
			["posX"] = 2220;
			["posY"] = -960;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"ragpicker_bamba_called\", true)\
   self:writeLogOnce(\"bamba_search_call_ragpicker\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bamba_search_call_ragpicker";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00041"] = {
			["ID"] = 41;
			["connectionsID"] = {
				[1] = 57;
			};
			["event"] = "discuss";
			["posX"] = 3090;
			["posY"] = -960;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_fine";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00042"] = {
			["ID"] = 42;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 2820;
			["posY"] = -780;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLogOnce(\"ragpicker_noise\")\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_noise";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00044"] = {
			["ID"] = 44;
			["connectionsID"] = {
				[1] = 58;
			};
			["event"] = "discuss";
			["posX"] = 3630;
			["posY"] = -690;
			["script"] = "function Condition:onCheck(name, obj)\
   if self:getTopicVisible(\"ragpicker_fine_trespassing\") then\
      self:setTopicVisible(\"cudgel_fine\", true)\
      self:setTopicVisible(\"cudgel_fine_trespassing_pay\", true)\
      self.objects.cudgel:setDialogInitiator(true)\
   elseif self:getTopicVisible(\"ragpicker_fine_stealing\") then\
      self:setTopicVisible(\"cudgel_fine\", true)\
      self:setTopicVisible(\"cudgel_fine_stealing_pay\", true)\
      self.objects.cudgel:setDialogInitiator(true)\
   end\
   self:setTopicVisible(\"cudgel_fine_not_today\", true)\
   self:setTopicVisible(\"ragpicker_no_trade\", true)\
   self:writeLogOnce(\"ragpicker_fine_refuse\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_fine_refuse";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00045"] = {
			["ID"] = 45;
			["connectionsID"] = {
				[1] = 58;
			};
			["event"] = "discuss";
			["posX"] = 3630;
			["posY"] = -1230;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"antigravium_shards.itm\", self.objects.ragpicker, self.fine_trespassing)\
   self:writeLogOnce(\"ragpicker_fine_trespassing_pay\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_fine_trespassing_pay";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00047"] = {
			["ID"] = 47;
			["connectionsID"] = {
			};
			["event"] = "unauthorized_access";
			["posX"] = 4140;
			["posY"] = -1170;
			["script"] = "function Condition:onCheck(name, obj)\
   self.objects.bamba:orientTo(getMC())\
   gameplayUI.subtitlesUI:addSubtitle(self.bamba_subtitle, 6, self.objects.bamba)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:door_2";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00048"] = {
			["ID"] = 48;
			["connectionsID"] = {
				[1] = 52;
			};
			["event"] = "trigger_in";
			["posX"] = 4650;
			["posY"] = -960;
			["script"] = "function Condition:onCheck(name, obj)\
   local bamba = self.objects.bamba\
   if not bamba:isInTrigger(obj) then return false end\
   bamba:setState(\"talkForbidden\", false)\
\
   local stolenLootPrice = self.q:getStolenLootPrice()\
\
   local wire_activator = self.objects.wire_activator\
   if not wire_activator.activated then\
      wire_activator:enable()\
   end\
\
   self.objects.door_1:enable()\
   self.objects.door_1:setGuardedBy(self.objects.bamba, true)\
\
   if getMC():isInTrigger(self.objects.arena_trigger) then\
      bamba:setImmortality(\"protected\")\
   end\
\
   if self:getParam(\"perverts\") then\
      self:setParam(\"perverts\", false)\
      if stolenLootPrice > 0 then\
         self.objects.ragpicker:setDialogInitiator(true)\
         self:setTopicVisible(\"ragpicker_beating_fine\", false)\
         self:setTopicVisible(\"ragpicker_beating_fine_refuse\", false)\
         self:setTopicVisible(\"ragpicker_theft_discovered\", true)\
         self:setTopicVisible(\"ragpicker_theft_convince_fail\", true)\
         self:setTopicVisible(\"ragpicker_theft_convince_perverts\", true)\
         self:setTopicVisible(\"ragpicker_fine_stealing\", true)\
         self:setTopicVisible(\"ragpicker_fine_stealing_buy\", true)\
         self:setTopicVisible(\"ragpicker_fine_refuse\", true)\
         self:setTopicVisible(\"ragpicker_first_greeting\", false)\
      end\
   elseif self:getParam(\"bamba_convinced\") and stolenLootPrice > 0 then\
      self:setParam(\"bamba_convinced\", false)\
      self.objects.ragpicker:setDialogInitiator(true)\
      self:setTopicVisible(\"ragpicker_theft_discovered\", true)\
      self:setTopicVisible(\"ragpicker_theft_convince_fail\", true)\
      self:setTopicVisible(\"ragpicker_theft_convince_success\", true)\
      self:setTopicVisible(\"ragpicker_fine_stealing\", true)\
      self:setTopicVisible(\"ragpicker_fine_stealing_buy\", true)\
      self:setTopicVisible(\"ragpicker_fine_refuse\", true)\
      self:setTopicVisible(\"ragpicker_first_greeting\", false)\
   end\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:bamba_door_front_wp";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00049"] = {
			["ID"] = 49;
			["connectionsID"] = {
				[1] = 59;
			};
			["event"] = "trigger_out";
			["posX"] = 4140;
			["posY"] = -960;
			["script"] = "function Condition:onCheck(name, obj)\
   if getMC():isInTrigger(obj) then return false end\
\
   local upgrade = self.q:getStolenLootPrice() > 0\
   self.q:restoreLocks(upgrade)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:arena_trigger";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00050"] = {
			["ID"] = 50;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 2160;
			["posY"] = -1560;
			["script"] = "function Condition:onCheck(name, obj)\
   self.objects.bamba:setAttitudeToMainCharacter(\"ENEMY\")\
   self.objects.bamba:setImmortality(\"protected\")\
   self:writeLogOnce(\"bamba_search_provoke\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bamba_search_provoke";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00054"] = {
			["ID"] = 54;
			["connectionsID"] = {
				[1] = 53;
			};
			["event"] = "knockout";
			["posX"] = 2220;
			["posY"] = -1140;
			["script"] = "function Condition:onCheck(name, obj)\
   obj:setImmortality(\"immortal\")\
   obj:setAttitudeToMainCharacter(\"NEUTRAL\")\
\
   self:setTopicVisible(\"ragpicker_beating_fine_greeting\", true)\
   self:setTopicVisible(\"ragpicker_beating_fine\", true)\
   self:setTopicVisible(\"ragpicker_beating_fine_pay\", true)\
   self:setTopicVisible(\"ragpicker_beating_fine_refuse\", true)\
   self:setTopicVisible(\"ragpicker_noise\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bamba";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00060"] = {
			["ID"] = 60;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "trigger_out";
			["posX"] = -210;
			["posY"] = 600;
			["script"] = "function Condition:onCheck(name, obj)\
   if getMC():isInTrigger(obj) then return false end\
   self.objects.bamba:setImmortality(\"immortal\")\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:arena_trigger";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00061"] = {
			["ID"] = 61;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 3990;
			["posY"] = -1620;
			["script"] = "function Condition:onCheck(name, obj)\
   if not self.objects.ragpicker:isInTrigger(obj) then return false end\
   self.objects.door_2:open()\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:door_2_back_wp";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00062"] = {
			["ID"] = 62;
			["connectionsID"] = {
				[1] = 58;
			};
			["event"] = "discuss";
			["posX"] = 3630;
			["posY"] = -840;
			["script"] = "function Condition:onCheck(name, obj)\
   local amount = self.fine_stealing + self.q:getStolenLootPrice()\
   giveItemFromPlayerTo(\"antigravium_shards.itm\", self.objects.ragpicker, amount)\
   self:writeLog(\"ragpicker_fine_stealing_buy\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_fine_stealing_buy";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00063"] = {
			["ID"] = 63;
			["connectionsID"] = {
				[1] = 58;
			};
			["event"] = "discuss";
			["posX"] = 3630;
			["posY"] = -1080;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"antigravium_shards.itm\", self.objects.ragpicker, self.fine_stealing)\
   --Return items\
   for itemName, count in pairs(self:getParam(\"stolen_loot\")) do\
      giveItemFromPlayerTo(itemName, self.objects.ragpicker, count)\
   end\
   self:writeLog(\"ragpicker_fine_stealing_return\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_fine_stealing_return";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00067"] = {
			["ID"] = 67;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 420;
			["posY"] = 690;
			["script"] = "function Condition:onCheck(name, obj)\
   self.q:toggleLootInteractors(true)\
   self.objects.counter_door_2:disable()\
   return false\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:room_2_trigger";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00068"] = {
			["ID"] = 68;
			["connectionsID"] = {
			};
			["event"] = "trigger_out";
			["posX"] = 690;
			["posY"] = 690;
			["script"] = "function Condition:onCheck(name, obj)\
   self.q:toggleLootInteractors(false)\
   self.objects.counter_door_2:enable()\
   return false\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:room_2_trigger";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00069"] = {
			["ID"] = 69;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 2100;
			["posY"] = 660;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"antigravium_shards.itm\", self.objects.cudgel, self.fine_trespassing)\
   if not self:getTopicVisible(\"cudgel_fine_stealing_pay\") then\
      self:setTopicVisible(\"cudgel_fine\", false)\
      self:setTopicVisible(\"cudgel_fine_all_payed\", true)\
   end\
   return false\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "cudgel_fine_trespassing_pay";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00070"] = {
			["ID"] = 70;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 2100;
			["posY"] = 810;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"antigravium_shards.itm\", self.objects.cudgel, self.fine_stealing_cudgel)\
   if not self:getTopicVisible(\"cudgel_fine_trespassing_pay\") then\
      self:setTopicVisible(\"cudgel_fine\", false)\
      self:setTopicVisible(\"cudgel_fine_all_payed\", true)\
   end\
   return false\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "cudgel_fine_stealing_pay";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00072"] = {
			["ID"] = 72;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 2100;
			["posY"] = 960;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"ragpicker_no_trade\", false)\
   return false\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "cudgel_fine_all_payed";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00073"] = {
			["ID"] = 73;
			["connectionsID"] = {
				[1] = 53;
			};
			["event"] = "discuss";
			["posX"] = 2220;
			["posY"] = -780;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"ragpicker_jack_called\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bamba_search_jack_calls_ragpicker";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00075"] = {
			["ID"] = 75;
			["connectionsID"] = {
				[1] = 58;
			};
			["event"] = "discuss";
			["posX"] = 2820;
			["posY"] = -1140;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setParam(\"perverts\", true)\
   self:setTopicVisible(\"bamba_about_perverts\", true)\
   self:writeLogOnce(\"ragpicker_jack_called\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_jack_called";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00077"] = {
			["ID"] = 77;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 4230;
			["posY"] = -1620;
			["script"] = "function Condition:onCheck(name, obj)\
   if not self.objects.ragpicker:isInTrigger(obj) then return false end\
   self.objects.door_2:close()\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:door_2_front_wp";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00080"] = {
			["ID"] = 80;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 2880;
			["posY"] = 180;
			["script"] = "function Condition:onCheck(name, obj)\
   if not self.objects.bamba:isInTrigger(obj) then return false end\
   if self.objects.bamba:getAttitudeToMainCharacter() == \"ENEMY\" then return false end\
   local door_1 = self.objects.door_1\
   door_1:open()\
   door_1:disable()\
   return false\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:bamba_door_back_wp";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00083"] = {
			["ID"] = 83;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 2880;
			["posY"] = 330;
			["script"] = "function Condition:onCheck(name, obj)\
   if not self.objects.bamba:isInTrigger(obj) then return false end\
   local door_1 = self.objects.door_1\
   door_1:close()\
   door_1:enable()\
   if self.q:getActiveStep() == \"bamba_leaves\" then\
      door_1:setLockState(true)\
   end\
   return false\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:bamba_door_front_wp";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00084"] = {
			["ID"] = 84;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 540;
			["posY"] = -1890;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLogOnce(\"ragpicker_theft_discovered\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_theft_discovered";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00085"] = {
			["ID"] = 85;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 810;
			["posY"] = -1890;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_theft_convince_fail";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00086"] = {
			["ID"] = 86;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 810;
			["posY"] = -1710;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_theft_convince_perverts";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00087"] = {
			["ID"] = 87;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 810;
			["posY"] = -2070;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_theft_convince_success";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00088"] = {
			["ID"] = 88;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 1080;
			["posY"] = -1800;
			["script"] = "function Condition:onCheck(name, obj)\
   if self:getTopicVisible(\"ragpicker_fine_trespassing\") then\
      self:setTopicVisible(\"cudgel_fine\", true)\
      self:setTopicVisible(\"cudgel_fine_trespassing_pay\", true)\
      self.objects.cudgel:setDialogInitiator(true)\
   elseif self:getTopicVisible(\"ragpicker_fine_stealing\") then\
      self:setTopicVisible(\"cudgel_fine\", true)\
      self:setTopicVisible(\"cudgel_fine_stealing_pay\", true)\
      self.objects.cudgel:setDialogInitiator(true)\
   end\
   self:setTopicVisible(\"cudgel_fine_not_today\", true)\
   self:setTopicVisible(\"ragpicker_no_trade\", true)\
   self:writeLogOnce(\"ragpicker_fine_refuse\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_fine_refuse";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00089"] = {
			["ID"] = 89;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 1080;
			["posY"] = -1950;
			["script"] = "function Condition:onCheck(name, obj)\
   local amount = self.fine_stealing + self.q:getStolenLootPrice()\
   giveItemFromPlayerTo(\"antigravium_shards.itm\", self.objects.ragpicker, amount)\
   self:writeLog(\"ragpicker_fine_stealing_buy\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_fine_stealing_buy";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00090"] = {
			["ID"] = 90;
			["connectionsID"] = {
				[1] = 58;
			};
			["event"] = "discuss";
			["posX"] = 2220;
			["posY"] = -1350;
			["script"] = "function Condition:onCheck(name, obj)\
   obj:setImmortality(\"immortal\")\
   obj:setAttitudeToMainCharacter(\"NEUTRAL\")\
   self:setParam(\"bamba_convinced\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bamba_search_convince";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00091"] = {
			["ID"] = 91;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -780;
			["posY"] = -780;
			["script"] = "function Condition:onCheck(name, obj)\
   self.objects.dummy_activator_1:enable()\
   self.objects.dummy_activator_2:enable()\
   self:setTopicVisible(\"crooked_leg_about_bamba\", true)\
   self:setTopicVisible(\"bamba_side_job\", true)\
   self:writeLogOnce(\"bamba_side_job\")\
   self.q:start()\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "popped_eye_start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00092"] = {
			["ID"] = 92;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -780;
			["posY"] = -1080;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"popped_eye_regular_greeting\", true)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "popped_eye_first_greeting";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00094"] = {
			["ID"] = 94;
			["connectionsID"] = {
			};
			["event"] = "activate";
			["posX"] = -1110;
			["posY"] = -990;
			["script"] = "function Condition:onCheck(name, obj)\
   local dummy = self.objects.dummy_activator_2\
   if dummy.activated then\
      self:setTopicVisible(\"popped_eye_1_dummy_destroyed\", false)\
      self:setTopicVisible(\"popped_eye_2_dummy_destroyed\", true)\
   else\
      self:setTopicVisible(\"popped_eye_1_dummy_destroyed\", true)\
   end\
   self:setTopicVisible(\"popped_eye_first_greeting\", false)\
   self:setTopicVisible(\"popped_eye_regular_greeting\", true)\
   self:setTopicVisible(\"popped_eye_about_partner\", false)\
   self:setTopicVisible(\"bamba_dummy_destroyed\", true)\
   self:setTopicVisible(\"crooked_leg_reveal\", true)\
   self:setTopicVisible(\"crooked_leg_about_bamba\", false)\
   self.objects.popped_eye:setDialogInitiator(true)\
   self:writeLogOnce(\"popped_eye_trick_revealed\")\
   self:writeLogOnce(\"popped_eye_dummy_destroyed\")\
   self:writeLogOnce(\"bamba_side_job\")\
   self.q:start()\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:dummy_activator_1";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00096"] = {
			["ID"] = 96;
			["connectionsID"] = {
			};
			["event"] = "activate";
			["posX"] = -1110;
			["posY"] = -840;
			["script"] = "function Condition:onCheck(name, obj)\
   local dummy = self.objects.dummy_activator_1\
   if dummy.activated then\
      self:setTopicVisible(\"popped_eye_1_dummy_destroyed\", false)\
      self:setTopicVisible(\"popped_eye_2_dummy_destroyed\", true)\
   else\
      self:setTopicVisible(\"popped_eye_1_dummy_destroyed\", true)\
   end\
   self:setTopicVisible(\"popped_eye_first_greeting\", false)\
   self:setTopicVisible(\"popped_eye_regular_greeting\", true)\
   self:setTopicVisible(\"popped_eye_about_partner\", false)\
   self:setTopicVisible(\"bamba_dummy_destroyed\", true)\
   self:setTopicVisible(\"crooked_leg_reveal\", true)\
   self:setTopicVisible(\"crooked_leg_about_bamba\", false)\
   self.objects.popped_eye:setDialogInitiator(true)\
   self:writeLogOnce(\"popped_eye_trick_revealed\")\
   self:writeLogOnce(\"popped_eye_dummy_destroyed\")\
   self:writeLogOnce(\"bamba_side_job\")\
   self.q:start()\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:dummy_activator_2";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00097"] = {
			["ID"] = 97;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -780;
			["posY"] = -930;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLogOnce(\"popped_eye_trick_revealed\")\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "popped_eye_trick_revealed";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00098"] = {
			["ID"] = 98;
			["connectionsID"] = {
				[1] = 76;
			};
			["event"] = "discuss";
			["posX"] = 1440;
			["posY"] = -270;
			["script"] = "function Condition:onCheck(name, obj)\
   local bamba = self.objects.bamba\
   bamba.navigator:setPatrolRoute(self.groups.bamba_to_tower_wps)\
   bamba.navigator:setRunPatrol(true)\
   bamba:setIgnoreSleep(true)\
   bamba:setDefaultAnimation(\"collect_search\")\
   bamba:setState(\"talkForbidden\", true)\
\
   self.objects.door_1:setGuardedBy(bamba, false)\
   self.objects.door_2:setGuardedBy(bamba, false)\
\
   self.objects.bamba:setImmortality(\"immortal\")\
\
   self:setTopicVisible(\"bamba_beaten\", false)\
\
   self:setTopicVisible(\"crooked_leg_about_bamba\", false)\
   self:setTopicVisible(\"crooked_leg_reveal\", false)\
   self:setTopicVisible(\"crooked_leg_bamba_okay\", true)\
\
   self:setTopicVisible(\"bamba_tower_dummies_destroyed\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bamba_dummy_destroyed";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00100"] = {
			["ID"] = 100;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 3660;
			["posY"] = 90;
			["script"] = "function Condition:onCheck(name, obj)\
   self.q:finish()\
   self.q:bambaAndPoppedInCave()\
\
   dialogSystem:subscribeOnStopDialog(self.q.delayCrookedLegConsequence, self.q)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "crooked_leg_reveal";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00101"] = {
			["ID"] = 101;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -480;
			["posY"] = -870;
			["script"] = "function Condition:onCheck(name, obj)\
   addItemToPlayer(\"booze.itm\")\
   useItemForPlayer(\"booze.itm\", true)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "popped_eye_drink_accept";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00102"] = {
			["ID"] = 102;
			["connectionsID"] = {
			};
			["event"] = "trigger_out";
			["posX"] = 2370;
			["posY"] = 810;
			["script"] = "function Condition:onCheck(name, obj)\
   if getMC():isInTrigger(obj) then return false end\
   if self:getTopicVisible(\"cudgel_fine\") then\
      self.objects.cudgel:setDialogInitiator(true)\
   end\
   return false\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:cudgel_fine_trigger";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00105"] = {
			["ID"] = 105;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -510;
			["posY"] = -180;
			["script"] = "function Condition:onCheck(name, obj)\
   self.objects.dummy_activator_1:enable()\
   self.objects.dummy_activator_2:enable()\
   self:setTopicVisible(\"crooked_leg_about_bamba\", true)\
   self:writeLogOnce(\"bamba_side_job\")\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "bamba_side_job";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00106"] = {
			["ID"] = 106;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 420;
			["posY"] = 510;
			["script"] = "function Condition:onCheck(name, obj)\
   if not getMC():isInTrigger(obj) then return false end\
   self.objects.counter_door_1:disable()\
   self.objects.outside_ladder:disable()\
   return false\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:room_1_trigger";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00107"] = {
			["ID"] = 107;
			["connectionsID"] = {
			};
			["event"] = "trigger_out";
			["posX"] = 690;
			["posY"] = 510;
			["script"] = "function Condition:onCheck(name, obj)\
   if getMC():isInTrigger(obj) then return false end\
   self.objects.counter_door_1:enable()\
   self.objects.outside_ladder:enable()\
\
   if self:getTopicVisible(\"bamba_door_1_unlocked\") then\
      self.objects.bamba:setDialogInitiator(true)\
   end\
   return false\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:room_1_trigger";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00108"] = {
			["ID"] = 108;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 4740;
			["posY"] = -1620;
			["script"] = "function Condition:onCheck(name, obj)\
   if not self.objects.ragpicker:isInTrigger(obj) then return false end\
   self.objects.counter_door_2:close()\
   self.objects.ragpicker:orientTo(self.objects.ragpicker_store_wp)\
   self.objects.ragpicker:setState(\"talkForbidden\", false)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:counter_door_2_front_wp";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00109"] = {
			["ID"] = 109;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 4500;
			["posY"] = -1620;
			["script"] = "function Condition:onCheck(name, obj)\
   if not self.objects.ragpicker:isInTrigger(obj) then return false end\
   self.objects.counter_door_2:open()\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:counter_door_2_back_wp";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00110"] = {
			["ID"] = 110;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -180;
			["posY"] = -540;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"bamba_bribe\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bamba_drink";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00111"] = {
			["ID"] = 111;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 60;
			["posY"] = -540;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"bamba_provoke\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bamba_bribe";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00112"] = {
			["ID"] = 112;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -60;
			["posY"] = -390;
			["script"] = "function Condition:onCheck(name, obj)\
   self.objects.bamba:setAttitudeToMainCharacter(\"ENEMY\")\
   self.objects.bamba:setImmortality(\"protected\")\
   self:writeLogOnce(\"bamba_beaten\")\
   self.q:tryActivateSandFleaIntro()\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bamba_provoke";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00113"] = {
			["ID"] = 113;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 690;
			["posY"] = -360;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLogOnce(\"bamba_door_1_unlocked_stealing\")\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bamba_door_1_unlocked_stealing";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00116"] = {
			["ID"] = 116;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 3660;
			["posY"] = -60;
			["script"] = "function Condition:onCheck(name, obj)\
   dialogSystem:subscribeOnStopDialog(self.q.delayCrookedLegConsequence, self.q)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "crooked_leg_about_bamba";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00117"] = {
			["ID"] = 117;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 3930;
			["posY"] = 120;
			["script"] = "function Condition:onCheck(name, obj)\
   self.objects.bamba:setAttitudeToMainCharacter(\"ENEMY\")\
   self.objects.popped_eye:setAttitudeToMainCharacter(\"ENEMY\")\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "popped_eye_cave_attack";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00118"] = {
			["ID"] = 118;
			["connectionsID"] = {
			};
			["event"] = "trigger_out";
			["posX"] = 3660;
			["posY"] = 480;
			["script"] = "function Condition:onCheck(name, obj)\
   self.q:teleportGenericGuards()\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:generic_guards_trigger";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 76;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 2610;
			["posY"] = 300;
			["script"] = "";
			["type"] = "step";
		};
		["leave_room"] = {
			["ID"] = 58;
			["connectionsID"] = {
				[1] = 47;
				[2] = 49;
			};
			["name"] = "leave_room";
			["posX"] = 3900;
			["posY"] = -930;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self.objects.bamba.navigator:moveTo(self.objects.bamba_wait_wp)\
   self.objects.bamba:orientTo(getMC())\
\
   self.q:updateLootList()\
\
   self.q:restoreLocks(false, true)\
   self.objects.door_1:setLockState(false)\
   self.objects.door_2:setLockState(true)\
   self.objects.door_1:enable()\
   self.objects.door_2:enable()\
   self.objects.door_1:setGuardedBy(self.objects.bamba, false)\
\
   self:setTopicVisible(\"ragpicker_fine_trespassing\", false)\
   self:setTopicVisible(\"ragpicker_fine_stealing\", false)\
   self:setTopicVisible(\"ragpicker_fine_trespassing_pay\", false)\
   self:setTopicVisible(\"ragpicker_fine_stealing_return\", false)\
   self:setTopicVisible(\"ragpicker_fine_stealing_buy\", false)\
   self:setTopicVisible(\"ragpicker_fine_refuse\", false)\
   self:setTopicVisible(\"ragpicker_theft_discovered\", false)\
   self:setTopicVisible(\"ragpicker_theft_convince_fail\", false)\
   self:setTopicVisible(\"ragpicker_theft_convince_perverts\", false)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["pay_fine"] = {
			["ID"] = 57;
			["connectionsID"] = {
				[1] = 44;
				[2] = 45;
				[3] = 62;
				[4] = 63;
			};
			["name"] = "pay_fine";
			["posX"] = 3390;
			["posY"] = -930;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   if self.q:getStolenLootPrice() > 0 then\
      self:setTopicVisible(\"ragpicker_fine_stealing\", true)\
      self:setTopicVisible(\"ragpicker_fine_stealing_return\", true)\
      self:setTopicVisible(\"ragpicker_fine_stealing_buy\", true)\
      self.q:applyRagpickerMarkup()\
   else\
      self:setTopicVisible(\"ragpicker_fine_trespassing\", true)\
      self:setTopicVisible(\"ragpicker_fine_trespassing_pay\", true)\
   end\
   self:setTopicVisible(\"ragpicker_fine_refuse\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["ragpicker_in_room"] = {
			["ID"] = 53;
			["connectionsID"] = {
				[1] = 41;
				[2] = 42;
				[3] = 75;
			};
			["name"] = "ragpicker_in_room";
			["posX"] = 2580;
			["posY"] = -930;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local player = getMC()\
   player:setDisableActionStates(true)\
   --Fade sequence to ragpicker dialog\
   local callbacks = {\
      onPause = {[\"func\"] = function()\
         self.objects.bamba:setKnockout(false)\
         teleportTo(self.objects.bamba, self.objects.bamba_search_wp)\
         teleportTo(self.objects.ragpicker, self.objects.ragpicker_search_wp)\
         teleportTo(getMC(), self.objects.player_search_wp)\
         self.objects.ragpicker:setDialogInitiator(true)\
         --Allows to optionally ask about beating bamba fine and only then open door and leave the room\
         dialogSystem:subscribeOnStopDialog(self.onRoomTalkStop, self)\
      end},\
      onFadeOutEnd = {[\"func\"] = function()\
         player:setDisableActionStates(false)\
      end},\
   }\
   gameplayUI:startFadeToBlackSequence(0.5, 1, 0.5, callbacks)\
\
   self:setTopicVisible(\"ragpicker_fine\", true)\
   self:setTopicVisible(\"ragpicker_first_greeting\", false)\
   self:setTopicVisible(\"ragpicker_beating_fine_greeting\", false)\
end\
\
function Step:onFinish()\
end\
\
function Quest:onRoomTalkStop()\
   self.objects.ragpicker.navigator:setPatrolRoute(self.groups.ragpicker_to_store_wps)\
   self.objects.ragpicker:setState(\"talkForbidden\", true)\
end\
\
";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 1;
			["connectionsID"] = {
				[1] = 52;
				[2] = 76;
			};
			["name"] = "start";
			["posX"] = 150;
			["posY"] = 300;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self.q:goToStep(\"bamba_outside\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
	};
	["script"] = "local CTime = (require \"helpers\").CTime\
local SkySystem = (require \"environment.sky\").SkySystem\
function Quest:onCreate()\
   --CONSTANTS--\
   self:declareVar(\"bamba_arena_leave_subtitle\", \"That's right! Run, you funky swindler piece of crap!\")\
   self:declareVar(\"bamba_subtitle\", \"Get your hands off that lock!\")\
   self:declareVar(\"ragpicker_subtitle\", \"Get out!\")\
   self:declareVar(\"twitchy_subtitle\", \"Hey!\")\
   self:declareVar(\"bamba_ko_time\", 90)\
   self:declareVar(\"bamba_search_bribe\", 500)\
   self:declareVar(\"ragpicker_beating_fine\", 200)\
   self:declareVar(\"fine_trespassing\", 200)\
   self:declareVar(\"fine_stealing\", 300)\
   self:declareVar(\"fine_stealing_cudgel\", 500)\
   self:declareVar(\"ragpicker_markup\", 0.2)\
   self:declareVar(\"locks_check_delay\", 5) --Game hours\
   self:declareVar(\"lockpick_price\", 50)\
\
   --EXP--\
   self:declareVar(\"wire_exp\", 50)\
   self:declareVar(\"bamba_knockout_exp\", 50)\
\
   --PARAMS--\
   self:setParam(\"wire_ko\", false)\
\
   getScene():subscribeOnLocationEnter(self.onLocationEnter, self)\
end\
\
local tablex = require \"pl.tablex\"\
function Quest:onLocationEnter()\
   if #self.groups.bamba_to_tower_wps == 0 then return end\
   --Last wp of the tower group\
   self:declareVar(\"bamba_last_to_tower_wp\", self.groups.bamba_to_tower_wps[#self.groups.bamba_to_tower_wps]:getName())\
\
   --Leave room and go to tower\
   local bamba_bribe_tower_wps = tablex.copy(self.groups.bamba_to_tower_wps)\
   table.insert(bamba_bribe_tower_wps, 1, self.objects.bamba_door_back_wp)\
   table.insert(bamba_bribe_tower_wps, 2, self.objects.bamba_door_front_wp)\
   self.groups.bamba_bribe_tower_wps = bamba_bribe_tower_wps\
\
   --Leave room and stand guard\
   self.groups.bamba_to_store_wps = {\
      self.objects.bamba_door_back_wp,\
      self.objects.bamba_door_front_wp,\
      self.objects.bamba_store_wp\
   }\
\
   --Leave room and stand at the counter\
   self.groups.ragpicker_to_store_wps = {\
      self.objects.door_2_back_wp,\
      self.objects.door_2_front_wp,\
      self.objects.counter_door_2_back_wp,\
      self.objects.counter_door_2_front_wp,\
      self.objects.ragpicker_store_wp\
   }\
\
   --Save loot list after init, to later compare it in getStolenLoot\
   self:setParam(\"ragpicker_loot\", self:getLootList())\
   self:setParam(\"stolen_loot\", {})\
\
   if not getMC():isInTrigger(self.room_2_trigger) then\
      self:toggleLootInteractors(false)\
   end\
end\
\
function Quest:onStart()\
end\
\
function Quest:onFinish()\
   self:setTopicVisible(\"bamba_drink\", false)\
   self:setTopicVisible(\"bamba_bribe\", false)\
\
   self:setTopicVisible(\"ragpicker_about_bamba_gone\", true)\
   self:setTopicVisible(\"ragpicker_first_greeting\", false)\
\
   self:setTopicVisible(\"ragpicker_beating_fine_greeting\", false)\
   self:setTopicVisible(\"ragpicker_beating_fine\", false)\
   self:setTopicVisible(\"ragpicker_beating_fine_pay\", false)\
   self:setTopicVisible(\"ragpicker_beating_fine_refuse\", false)\
\
   self.objects.wire_activator:disable()\
end\
\
function Quest:OnSaveState(state)\
   if self.locksCallback then\
      state.locksTime = self.locksCallback.targetTime\
      state.locksUpgrade = self.locksCallback.args[2]\
   end\
end\
\
function Quest:OnLoadState(state)\
   if state.locksTime then\
      self.locksCallback = SkySystem:subscribeDayTime(CTime(state.locksTime, \"gSecond\"), false,\
         self.restoreLocks, self, state.locksUpgrade)\
   end\
end\
\
function Quest:tryActivateSandFleaIntro()\
   if self:getTopicVisible(\"sand_flea_first_greeting\") then\
      self:setTopicVisible(\"sand_flea_heist_greeting\", true)\
      self:setTopicVisible(\"sand_flea_first_greeting\", false)\
   end\
end\
\
function Quest:applyRagpickerMarkup(state)\
   if self:getParam(\"markup_applied\") then return end\
   self:setParam(\"markup_applied\", true)\
   local param = getGlobalParam(\"ragpicker_buyFromVendorMul\")\
   setGlobalParam(\"ragpicker_buyFromVendorMul\", (param or 1) + self.ragpicker_markup)\
end\
\
function Quest:toggleLootInteractors(state)\
   for _, obj in pairs(self.groups.loot_objects) do\
      if state then\
         if not obj.activated then\
            obj:enable()\
         end\
      else\
         obj:disable()\
      end\
   end\
end\
\
function Quest:getLootList()\
   local loot = {}\
   for _, obj in ipairs(self.groups.loot_objects) do\
      local objLoot = obj:getLootTable()\
      for itemName, count in pairs(objLoot) do\
         loot[itemName] = (loot[itemName] or 0) + count\
      end\
   end\
   return loot\
end\
\
function Quest:updateLootList()\
   self:setParam(\"ragpicker_loot\", self:getLootList())\
end\
\
function Quest:saveStolenLoot()\
   local currentLoot = self:getLootList()\
   local stolenLoot = {}\
   for itemName, count in pairs(self:getParam(\"ragpicker_loot\")) do\
      local stolenCount = count - (currentLoot[itemName] or 0)\
      if stolenCount > 0 then\
         stolenLoot[itemName] = stolenCount\
      end\
   end\
   self:setParam(\"stolen_loot\", stolenLoot)\
end\
\
local ItemsData = require \"itemsData\"\
function Quest:getStolenLootPrice()\
   local value = 0\
   for itemName, count in pairs(self:getParam(\"stolen_loot\")) do\
      value = value + (ItemsData.getItemValue(itemName) * count)\
   end\
   return value\
end\
\
function Quest:bambaAndPoppedOnTower()\
   teleportTo(self.objects.bamba, self.objects.bamba_tower_wp)\
\
   self.objects.door_1:setGuardedBy(self.objects.bamba, false)\
   self.objects.door_2:setGuardedBy(self.objects.bamba, false)\
\
   self.objects.popped_eye:setDefaultAnimation(\"idle\")\
   teleportTo(self.objects.popped_eye, self.objects.popped_eye_tower_wp)\
\
   self:hideDummies()\
end\
\
function Quest:bambaAndPoppedInCave(immediateGuardsTP)\
   local bamba = self.objects.bamba\
   bamba:setImmortality(\"protected\")\
   bamba:setState(\"knockoutBeforeDeath\", false)\
   bamba.navigator:setPatrolRoute(nil)\
   bamba:setDialogInitiator(true)\
   bamba:setDefaultAnimation(\"idle\")\
   bamba:setupAppearance(\"bamba_exiled\")\
   teleportTo(bamba, self.objects.bamba_cave_wp)\
\
   self.objects.door_1:setGuardedBy(self.objects.bamba, false)\
   self.objects.door_2:setGuardedBy(self.objects.bamba, false)\
\
   local popped_eye = self.objects.popped_eye\
   popped_eye:setImmortality(\"protected\")\
   popped_eye:setDialogInitiator(true)\
   popped_eye:setDefaultAnimation(\"idle\")\
   popped_eye:setupAppearance(\"popped_eye_exiled\")\
   teleportTo(popped_eye, self.objects.popped_eye_cave_wp)\
\
   self:hideDummies()\
\
   if immediateGuardsTP then\
      self:teleportGenericGuards()\
   else\
      self.objects.generic_guards_trigger:enable()\
   end\
\
   self:setTopicVisible(\"popped_eye_cave_attack\", true)\
   self:setTopicVisible(\"bamba_cave_attack\", true)\
   self:setTopicVisible(\"popped_eye_tower\", false)\
   self:setTopicVisible(\"crooked_leg_bamba_exiled\", true)\
end\
\
function Quest:teleportGenericGuards()\
   teleportTo(self.objects.outcast_guard_19, self.objects.bamba_tower_wp)\
   teleportTo(self.objects.outcast_guard_20, self.objects.popped_eye_tower_wp)\
   self.objects.outcast_guard_19:setDefaultAnimation(\"idle\")\
   self.objects.outcast_guard_20:setDefaultAnimation(\"idle\")\
end\
\
function Quest:hideDummies()\
   hideObject(self.dummy_activator_1)\
   disableObjectCollisions(self.dummy_activator_1)\
   disableObject(self.dummy_activator_1)\
   hideObject(self.dummy_activator_2)\
   disableObjectCollisions(self.dummy_activator_2)\
   disableObject(self.dummy_activator_2)\
end\
\
function Quest:susbscribeRestoreLocks(hours, upgrade)\
   if self.locksCallback then SkySystem:unsubscribeDayTime(self.locksCallback) end\
   local timeUnit = CTime(hours or self.locks_check_delay, \"gHour\")\
   self.locksCallback = SkySystem:subscribeTimePassed(timeUnit, false, self.restoreLocks, self, upgrade)\
end\
\
function Quest:restoreLocks(upgrade, force)\
   if self.locksCallback then SkySystem:unsubscribeDayTime(self.locksCallback) end\
   local player = getMC()\
   if not force\
      and (player:isInTrigger(self.objects.room_1_trigger) or player:isInTrigger(self.objects.room_2_trigger)) then\
      self:susbscribeRestoreLocks(1)\
      return\
   end\
   local door_1 = self.objects.door_1\
   if door_1.opened then\
      door_1:activate()\
   end\
   door_1:setLockType(\"mechanical\")\
   door_1:setLockLevel(upgrade and 4 or door_1.lockLevel)\
   door_1:setLockState(true)\
\
   local door_2 = self.objects.door_2\
   if door_2.opened then\
      door_2:activate()\
   end\
   door_2:setLockType(\"mechanical\")\
   door_2:setLockLevel(upgrade and 4 or door_2.lockLevel)\
   door_2:setLockState(true)\
\
   self.locksCallback = nil\
end\
\
--Delay crooked_leg consequence question visibility\
--so it isn't visible in the same dialog instance\
function Quest:delayCrookedLegConsequence()\
   self:setTopicVisible(\"crooked_leg_about_tower\", true)\
end\
\
function Quest:getTopicVisible_ragpicker_beating_fine_pay()\
   return hasPlayerItem(\"antigravium_shards.itm\", self.ragpicker_beating_fine)\
end\
\
function Quest:getTopicVisible_bamba_search_bribe()\
   return hasPlayerItem(\"antigravium_shards.itm\", self.bamba_search_bribe)\
end\
\
function Quest:getTopicVisible_ragpicker_fine_trespassing_pay()\
   return hasPlayerItem(\"antigravium_shards.itm\", self.fine_trespassing)\
end\
\
function Quest:getTopicVisible_ragpicker_fine_stealing_return()\
   return hasPlayerItem(\"antigravium_shards.itm\", self.fine_stealing)\
end\
\
function Quest:getTopicVisible_cudgel_fine_trespassing_pay()\
   return hasPlayerItem(\"antigravium_shards.itm\", self.fine_trespassing)\
end\
\
function Quest:getTopicVisible_cudgel_fine_stealing_pay()\
   return hasPlayerItem(\"antigravium_shards.itm\", self.fine_stealing_cudgel)\
end\
\
function Quest:getTopicVisible_ragpicker_fine_stealing_buy()\
   local amount = self.fine_stealing + self:getStolenLootPrice()\
   return hasPlayerItem(\"antigravium_shards.itm\", amount)\
end\
\
function Quest:getTopicVisible_ragpicker_blame_bamba()\
   return self:getStolenLootPrice() > 0\
end\
\
function Quest:getTopicVisible_sand_flea_buy_lockpick()\
   return hasPlayerItem(\"antigravium_shards.itm\", self.lockpick_price)\
end\
\
--A pack of topics that should only be available when bamba is outside\
function Quest:getTopicVisible_bamba_dummy_destroyed()\
   return self:getActiveStepName() == \"bamba_outside\"\
end\
\
function Quest:getTopicVisible_bamba_provoke()\
   return self:getActiveStepName() == \"bamba_outside\"\
end\
\
function Quest:getTopicVisible_bamba_drink()\
   return self:getActiveStepName() == \"bamba_outside\"\
end\
\
function Quest:getTopicVisible_bamba_bribe()\
   return self:getActiveStepName() == \"bamba_outside\"\
end\
\
";
	["title"] = "Ragpicker's Store Heist";
	["topics"] = {
		[1] = {
			["log_id"] = "";
			["name"] = "bamba_start";
			["single_use"] = true;
			["visible"] = true;
		};
		[2] = {
			["log_id"] = "";
			["name"] = "bamba_regular_greeting";
			["single_use"] = false;
			["visible"] = false;
		};
		[3] = {
			["log_id"] = "";
			["name"] = "bamba_beaten";
			["single_use"] = false;
			["visible"] = false;
		};
		[4] = {
			["log_id"] = "";
			["name"] = "bamba_cave_attack";
			["single_use"] = true;
			["visible"] = false;
		};
		[5] = {
			["log_id"] = "";
			["name"] = "bamba_door_1_unlocked";
			["single_use"] = true;
			["visible"] = false;
		};
		[6] = {
			["log_id"] = "";
			["name"] = "bamba_electrocuted";
			["single_use"] = true;
			["visible"] = false;
		};
		[7] = {
			["log_id"] = "";
			["name"] = "bamba_search";
			["single_use"] = true;
			["visible"] = false;
		};
		[8] = {
			["log_id"] = "bamba_search_bribe";
			["name"] = "bamba_search_bribe";
			["single_use"] = true;
			["visible"] = false;
		};
		[9] = {
			["log_id"] = "";
			["name"] = "bamba_search_call_ragpicker";
			["single_use"] = true;
			["visible"] = false;
		};
		[10] = {
			["log_id"] = "bamba_search_convince";
			["name"] = "bamba_search_convince";
			["single_use"] = true;
			["visible"] = true;
		};
		[11] = {
			["log_id"] = "";
			["name"] = "bamba_search_provoke";
			["single_use"] = true;
			["visible"] = false;
		};
		[12] = {
			["log_id"] = "";
			["name"] = "bamba_about_perverts";
			["single_use"] = true;
			["visible"] = false;
		};
		[13] = {
			["log_id"] = "";
			["name"] = "ragpicker_first_greeting";
			["single_use"] = true;
			["visible"] = true;
		};
		[14] = {
			["log_id"] = "";
			["name"] = "ragpicker_about_bamba_gone";
			["single_use"] = true;
			["visible"] = false;
		};
		[15] = {
			["log_id"] = "";
			["name"] = "ragpicker_beating_fine_greeting";
			["single_use"] = true;
			["visible"] = false;
		};
		[16] = {
			["log_id"] = "";
			["name"] = "ragpicker_beating_fine";
			["single_use"] = true;
			["visible"] = false;
		};
		[17] = {
			["log_id"] = "";
			["name"] = "ragpicker_beating_fine_pay";
			["single_use"] = true;
			["visible"] = false;
		};
		[18] = {
			["log_id"] = "";
			["name"] = "ragpicker_beating_fine_refuse";
			["single_use"] = true;
			["visible"] = false;
		};
		[19] = {
			["log_id"] = "";
			["name"] = "ragpicker_bamba_called";
			["single_use"] = true;
			["visible"] = false;
		};
		[20] = {
			["log_id"] = "";
			["name"] = "ragpicker_noise";
			["single_use"] = true;
			["visible"] = false;
		};
		[21] = {
			["log_id"] = "";
			["name"] = "ragpicker_fine";
			["single_use"] = true;
			["visible"] = false;
		};
		[22] = {
			["log_id"] = "";
			["name"] = "ragpicker_no_trade";
			["single_use"] = false;
			["visible"] = false;
		};
		[23] = {
			["log_id"] = "";
			["name"] = "ragpicker_fine_stealing";
			["single_use"] = false;
			["visible"] = false;
		};
		[24] = {
			["log_id"] = "";
			["name"] = "ragpicker_fine_trespassing_pay";
			["single_use"] = true;
			["visible"] = false;
		};
		[25] = {
			["log_id"] = "";
			["name"] = "ragpicker_fine_stealing_return";
			["single_use"] = true;
			["visible"] = false;
		};
		[26] = {
			["log_id"] = "";
			["name"] = "ragpicker_fine_stealing_buy";
			["single_use"] = true;
			["visible"] = false;
		};
		[27] = {
			["log_id"] = "";
			["name"] = "ragpicker_fine_refuse";
			["single_use"] = true;
			["visible"] = false;
		};
		[28] = {
			["log_id"] = "";
			["name"] = "cudgel_fine";
			["single_use"] = true;
			["visible"] = false;
		};
		[29] = {
			["log_id"] = "";
			["name"] = "cudgel_fine_trespassing_pay";
			["single_use"] = true;
			["visible"] = false;
		};
		[30] = {
			["log_id"] = "";
			["name"] = "cudgel_fine_stealing_pay";
			["single_use"] = true;
			["visible"] = false;
		};
		[31] = {
			["log_id"] = "";
			["name"] = "cudgel_fine_all_payed";
			["single_use"] = true;
			["visible"] = false;
		};
		[32] = {
			["log_id"] = "";
			["name"] = "ragpicker_blame_bamba";
			["single_use"] = true;
			["visible"] = true;
		};
		[33] = {
			["log_id"] = "";
			["name"] = "bamba_door_1_unlocked_stealing";
			["single_use"] = true;
			["visible"] = false;
		};
		[34] = {
			["log_id"] = "bamba_search_jack_calls_ragpicker";
			["name"] = "bamba_search_jack_calls_ragpicker";
			["single_use"] = true;
			["visible"] = true;
		};
		[35] = {
			["log_id"] = "";
			["name"] = "ragpicker_jack_called";
			["single_use"] = true;
			["visible"] = false;
		};
		[36] = {
			["log_id"] = "";
			["name"] = "ragpicker_theft_discovered";
			["single_use"] = true;
			["visible"] = false;
		};
		[37] = {
			["log_id"] = "";
			["name"] = "ragpicker_theft_convince_fail";
			["single_use"] = true;
			["visible"] = false;
		};
		[38] = {
			["log_id"] = "";
			["name"] = "ragpicker_theft_convince_success";
			["single_use"] = true;
			["visible"] = false;
		};
		[39] = {
			["log_id"] = "";
			["name"] = "ragpicker_theft_convince_perverts";
			["single_use"] = true;
			["visible"] = false;
		};
		[40] = {
			["log_id"] = "";
			["name"] = "bamba_provoke";
			["single_use"] = false;
			["visible"] = false;
		};
		[41] = {
			["log_id"] = "";
			["name"] = "bamba_drink";
			["single_use"] = true;
			["visible"] = true;
		};
		[42] = {
			["log_id"] = "";
			["name"] = "bamba_bribe";
			["single_use"] = true;
			["visible"] = false;
		};
		[43] = {
			["log_id"] = "";
			["name"] = "popped_eye_first_greeting";
			["single_use"] = true;
			["visible"] = true;
		};
		[44] = {
			["log_id"] = "";
			["name"] = "popped_eye_regular_greeting";
			["single_use"] = false;
			["visible"] = false;
		};
		[45] = {
			["log_id"] = "";
			["name"] = "popped_eye_about_partner";
			["single_use"] = true;
			["visible"] = true;
		};
		[46] = {
			["log_id"] = "";
			["name"] = "popped_eye_drink_accept";
			["single_use"] = true;
			["visible"] = true;
		};
		[47] = {
			["log_id"] = "";
			["name"] = "popped_eye_start";
			["single_use"] = true;
			["visible"] = true;
		};
		[48] = {
			["log_id"] = "";
			["name"] = "popped_eye_trick_revealed";
			["single_use"] = true;
			["visible"] = true;
		};
		[49] = {
			["log_id"] = "";
			["name"] = "popped_eye_1_dummy_destroyed";
			["single_use"] = false;
			["visible"] = false;
		};
		[50] = {
			["log_id"] = "";
			["name"] = "popped_eye_2_dummy_destroyed";
			["single_use"] = false;
			["visible"] = false;
		};
		[51] = {
			["log_id"] = "bamba_dummy_destroyed";
			["name"] = "bamba_dummy_destroyed";
			["single_use"] = true;
			["visible"] = false;
		};
		[52] = {
			["log_id"] = "crooked_leg_about_bamba";
			["name"] = "crooked_leg_about_bamba";
			["single_use"] = true;
			["visible"] = false;
		};
		[53] = {
			["log_id"] = "crooked_leg_reveal";
			["name"] = "crooked_leg_reveal";
			["single_use"] = true;
			["visible"] = false;
		};
		[54] = {
			["log_id"] = "";
			["name"] = "bamba_side_job";
			["single_use"] = true;
			["visible"] = false;
		};
		[55] = {
			["log_id"] = "";
			["name"] = "sand_flea_first_greeting";
			["single_use"] = true;
			["visible"] = true;
		};
		[56] = {
			["log_id"] = "";
			["name"] = "sand_flea_heist_greeting";
			["single_use"] = true;
			["visible"] = false;
		};
		[57] = {
			["log_id"] = "";
			["name"] = "ragpicker_fine_trespassing";
			["single_use"] = false;
			["visible"] = false;
		};
		[58] = {
			["log_id"] = "";
			["name"] = "bamba_tower_bribed";
			["single_use"] = false;
			["visible"] = false;
		};
		[59] = {
			["log_id"] = "";
			["name"] = "bamba_tower_dummies_destroyed";
			["single_use"] = false;
			["visible"] = false;
		};
		[60] = {
			["log_id"] = "";
			["name"] = "popped_eye_tower";
			["single_use"] = true;
			["visible"] = false;
		};
		[61] = {
			["log_id"] = "";
			["name"] = "crooked_leg_bamba_exiled";
			["single_use"] = true;
			["visible"] = false;
		};
		[62] = {
			["log_id"] = "";
			["name"] = "crooked_leg_bamba_okay";
			["single_use"] = true;
			["visible"] = false;
		};
		[63] = {
			["log_id"] = "";
			["name"] = "crooked_leg_about_tower";
			["single_use"] = true;
			["visible"] = false;
		};
		[64] = {
			["log_id"] = "";
			["name"] = "popped_eye_cave_attack";
			["single_use"] = true;
			["visible"] = false;
		};
	};
	["variables"] = {
		[1] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "cudgel";
			["value"] = "cudgel";
		};
		[2] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "wire_activator";
			["value"] = "q_ragpicker_heist_wire_activator";
		};
		[3] = {
			["icon"] = "O";
			["kind"] = "object";
			["name"] = "door_1";
			["value"] = "q_ragpicker_heist_door_1";
		};
		[4] = {
			["icon"] = "O";
			["kind"] = "object";
			["name"] = "door_2";
			["value"] = "q_ragpicker_heist_door_2";
		};
		[5] = {
			["icon"] = "O";
			["kind"] = "object";
			["name"] = "counter_door_1";
			["value"] = "q_ragpicker_heist_counter_door_1";
		};
		[6] = {
			["icon"] = "O";
			["kind"] = "object";
			["name"] = "counter_door_2";
			["value"] = "q_ragpicker_heist_counter_door_2";
		};
		[7] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "dummy_activator_1";
			["value"] = "q_ragpicker_heist_dummy_1";
		};
		[8] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "dummy_activator_2";
			["value"] = "q_ragpicker_heist_dummy_2";
		};
		[9] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "arena_trigger";
			["value"] = "q_ragpicker_heist_arena_trigger";
		};
		[10] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "room_1_trigger";
			["value"] = "q_ragpicker_heist_room_1_trigger";
		};
		[11] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "room_2_trigger";
			["value"] = "q_ragpicker_heist_room_2_trigger";
		};
		[12] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "bamba_store_wp";
			["value"] = "q_ragpicker_heist_bamba_store_wp";
		};
		[13] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "bamba_store_orient_wp";
			["value"] = "q_ragpicker_heist_bamba_store_orient_wp";
		};
		[14] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "bamba_door_front_wp";
			["value"] = "q_ragpicker_heist_bamba_door_front_wp";
		};
		[15] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "bamba_door_back_wp";
			["value"] = "q_ragpicker_heist_bamba_door_back_wp";
		};
		[16] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "bamba_wait_wp";
			["value"] = "q_ragpicker_heist_bamba_wait_wp";
		};
		[17] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "ragpicker_store_wp";
			["value"] = "ragpicker_store_wp";
		};
		[18] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "door_2_back_wp";
			["value"] = "q_ragpicker_heist_door_2_back_wp";
		};
		[19] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "door_2_front_wp";
			["value"] = "q_ragpicker_heist_door_2_front_wp";
		};
		[20] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "counter_door_2_back_wp";
			["value"] = "q_ragpicker_heist_counter_door_2_back_wp";
		};
		[21] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "counter_door_2_front_wp";
			["value"] = "q_ragpicker_heist_counter_door_2_front_wp";
		};
		[22] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "player_search_wp";
			["value"] = "q_ragpicker_heist_player_search_wp";
		};
		[23] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "bamba_tower_wp";
			["value"] = "q_ragpicker_heist_bamba_tower_wp";
		};
		[24] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "popped_eye_tower_wp";
			["value"] = "q_ragpicker_heist_popped_eye_tower_wp";
		};
		[25] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "bamba_cave_wp";
			["value"] = "q_ragpicker_heist_bamba_cave_wp";
		};
		[26] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "popped_eye_cave_wp";
			["value"] = "q_ragpicker_heist_popped_eye_cave_wp";
		};
		[27] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "bamba_search_wp";
			["value"] = "q_ragpicker_heist_bamba_search_wp";
		};
		[28] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "ragpicker_search_wp";
			["value"] = "q_ragpicker_heist_ragpicker_search_wp";
		};
		[29] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "ragpicker";
			["value"] = "ragpicker";
		};
		[30] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "popped_eye";
			["value"] = "popped_eye";
		};
		[31] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "outcast_guard_19";
			["value"] = "outcast_guard_19";
		};
		[32] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "outcast_guard_20";
			["value"] = "outcast_guard_20";
		};
		[33] = {
			["icon"] = "G";
			["kind"] = "group";
			["name"] = "loot_objects";
			["value"] = "q_ragpicker_heist_loot";
		};
		[34] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "cudgel_fine_trigger";
			["value"] = "q_ragpicker_heist_cudgel_fine_trigger";
		};
		[35] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "sand_flea";
			["value"] = "sand_flea";
		};
		[36] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "twitchy_outcast";
			["value"] = "twitchy_outcast";
		};
		[37] = {
			["icon"] = "";
			["kind"] = "group";
			["name"] = "bamba_to_tower_wps";
			["value"] = "q_ragpicker_heist_bamba_to_tower_wps";
		};
		[38] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "bamba";
			["value"] = "bamba";
		};
		[39] = {
			["icon"] = "O";
			["kind"] = "object";
			["name"] = "outside_ladder";
			["value"] = "ladder_old_2_28";
		};
		[40] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "generic_guards_trigger";
			["value"] = "q_ragpicker_heist_generic_guards_trigger";
		};
	};
}
return obj1
