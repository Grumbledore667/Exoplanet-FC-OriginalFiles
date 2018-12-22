-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "While I was unconscious, greeting this \"beautiful\" planet with my face, some morons stole my hat, my jacket and even my pants! I have to get them back or at least punish the ones responsible for my current \"birthday suit\".";
	["hidden"] = true;
	["logs"] = {
		["BoughtPants"] = "I bought back my pants.";
		["BoughtShirt"] = "I bought back my shirt.";
		["DefeatedBandits"] = "I killed the looters who robbed me.";
		["FoundBandits"] = "I found a group of looters who supposedly stole my stuff - they were beating the living shit out of another victim.";
		["FoundClothes"] = "Found my clothes in a small shop in outcast village owned by an abori called Ragpicker. I don't think the owner will be kind enough to give me my stuff back for free.";
		["GotAll"] = "It was a tough one, but I managed to get my stuff back. What a merciless world.";
		["GotHat"] = "I got my old hat back.";
		["GotPants"] = "I got my pants back.";
		["GotShirt"] = "I got my shirt back.";
		["IAttackedRagpicker"] = "I decided to attack this scummy trader on sight. ";
		["IProvokedRagpicker"] = "I provoked Ragpicker to attack. It's time to teach him a lesson.";
		["KilledTrader"] = "I've killed Ragpicker. He's got what he deserved: if you don't want to play fair and rip off robbery victims by selling them their own stuff overpriced, get some muscles to back you up first.";
		["NoHat"] = "Though I have to find that guy later to get my hat back. Then I'll be ready.";
		["RagpickerAttackedMe"] = "Ragpicker attacked me. ";
		["ScaredBandits"] = "I persuaded them with the help of a flare gun I found earlier.";
		["StolePants"] = "I stole my pants from the Ragpicker's shop. Don't have any regrets: stealing from thieves is not a crime.";
		["StoleShirt"] = "I stole my shirt from the so called shop in the outcasts village.";
	};
	["nodes"] = {
		["bandits_encounter"] = {
			["ID"] = 4;
			["connectionsID"] = {
				[1] = 7;
				[2] = 36;
			};
			["name"] = "bandits_encounter";
			["posX"] = 840;
			["posY"] = 30;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   getObj(self.old_outcast):setFeelVisible(false)\
   for i=1,2 do\
      activateObject(self.q[\"bandit_\"..i])\
   end\
   getObj(self.bandit_2):setDialogInitiator(false)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["condition_00000"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "trigger_in";
			["posX"] = 90;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "start_trigger";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00006"] = {
			["ID"] = 6;
			["connectionsID"] = {
				[1] = 4;
			};
			["event"] = "discuss";
			["posX"] = 600;
			["posY"] = -30;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "activate_bandits";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00007"] = {
			["ID"] = 7;
			["connectionsID"] = {
				[1] = 8;
			};
			["event"] = "dead";
			["posX"] = 1050;
			["posY"] = 90;
			["script"] = "";
			["targetsAll"] = "q_my_clothes_bandit_1,q_my_clothes_bandit_2";
			["targetsAny"] = "";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00009"] = {
			["ID"] = 9;
			["connectionsID"] = {
				[1] = 4;
			};
			["event"] = "activate";
			["posX"] = 600;
			["posY"] = 120;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "q_my_clothes_bandit_1,q_my_clothes_bandit_2";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00010"] = {
			["ID"] = 10;
			["connectionsID"] = {
			};
			["event"] = "get";
			["posX"] = 1590;
			["posY"] = 510;
			["script"] = "function Condition:onCheck(obj)\
   hideObject(self.shirt_dummy)\
   local ragpicker = getObj(self.ragpicker)\
   if ragpicker:getState(\"dead\") then\
      self:writeLog(\"GotShirt\")\
   elseif ragpicker:getState(\"talk\") then\
      self:writeLog(\"BoughtShirt\")\
   else\
      self:writeLog(\"StoleShirt\")\
   end\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "spacer_jacket.itm";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00011"] = {
			["ID"] = 11;
			["connectionsID"] = {
			};
			["event"] = "find";
			["posX"] = 90;
			["posY"] = 780;
			["script"] = "function Condition:onCheck(obj)\
   if not self:getParam(\"FoundClothes\") then\
      self:setParam(\"FoundClothes\", true)\
      self:writeLog(\"FoundClothes\")\
   end\
   self:setTopicVisible(\"big_hat_stolen_gear\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "q_my_clothes_shirt, q_my_clothes_pants";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00013"] = {
			["ID"] = 13;
			["connectionsID"] = {
			};
			["event"] = "activate";
			["posX"] = 900;
			["posY"] = 630;
			["script"] = "function Condition:onCheck(obj)\
   local ragpicker = getObj(self.ragpicker)\
   if not ragpicker:getState(\"dead\")\
      and not ragpicker:getState(\"talk\") then\
      runTimer(0, self, function(self)\
         self.q:provokeTrader( \"stealing\" )\
      end, false)\
      gameplayUI:addSubtitle(\"I've warned you! Nobody robs me! Not anymore!\", 6, ragpicker, true)\
   end\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "q_my_clothes_pants, q_my_clothes_shirt";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00015"] = {
			["ID"] = 15;
			["connectionsID"] = {
			};
			["event"] = "get";
			["posX"] = 1590;
			["posY"] = 360;
			["script"] = "function Condition:onCheck(obj)\
   if hasPlayerItem(\"hat_jack.itm\")\
      and hasPlayerItem(\"spacer_jacket.itm\")\
      and hasPlayerItem(\"spacer_pants.itm\") then\
      runTimer(0, nil, function()\
         self.q:finish()\
      end, false)\
      return true\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "hat_jack.itm,spacer_jacket.itm,spacer_pants.itm";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00019"] = {
			["ID"] = 19;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 360;
			["posY"] = 1020;
			["script"] = "function Condition:onCheck(obj)\
   giveItemToNPC( \"antigravium_shards.itm\", self.ragpicker, self.price * 2 )\
   getObj(self.shirt_activator):activate()\
   getObj(self.pants_activator):activate()\
   self:setTopicVisible(\"ragpicker_scumbag\", false)\
   self:setTopicVisible(\"big_hat_stolen_gear\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_buy_all";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00020"] = {
			["ID"] = 20;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 630;
			["posY"] = 1020;
			["script"] = "function Condition:onCheck(obj)\
   giveItemToNPC( \"antigravium_shards.itm\", self.ragpicker, self.price )\
   self:setTopicVisible(\"ragpicker_buy_all\", false)\
   self:setTopicVisible(\"ragpicker_buy_shirt\", false)\
   getObj(self.shirt_activator):activate()\
   if hasPlayerItem(\"spacer_pants.itm\") then\
      self:setTopicVisible(\"ragpicker_scumbag\", false)\
      self:setTopicVisible(\"big_hat_stolen_gear\", false)\
   end\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_buy_shirt";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00022"] = {
			["ID"] = 22;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 360;
			["posY"] = 780;
			["script"] = "function Condition:onCheck(obj)\
   if not self:getParam(\"FoundClothes\") then\
      self:setParam(\"FoundClothes\", true)\
      self:writeLog(\"FoundClothes\")\
   end\
   self:setTopicVisible(\"ragpicker_my_clothes\", false)\
   self:setTopicVisible(\"ragpicker_scumbag\", true)\
   self:setTopicVisible(\"big_hat_stolen_gear\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_my_clothes";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00023"] = {
			["ID"] = 23;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 900;
			["posY"] = 1020;
			["script"] = "function Condition:onCheck(obj)\
   giveItemToNPC( \"antigravium_shards.itm\", self.ragpicker, self.price )\
   self:setTopicVisible(\"ragpicker_buy_all\", false)\
   self:setTopicVisible(\"ragpicker_buy_pants\", false)\
   getObj(self.pants_activator):activate()\
   if hasPlayerItem(\"spacer_jacket.itm\") then\
      self:setTopicVisible(\"ragpicker_scumbag\", false)\
      self:setTopicVisible(\"big_hat_stolen_gear\", false)\
   end\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_buy_pants";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00025"] = {
			["ID"] = 25;
			["connectionsID"] = {
			};
			["event"] = "dead";
			["posX"] = 1170;
			["posY"] = 780;
			["script"] = "function Condition:onCheck(obj)\
   self:writeLog(\"KilledTrader\")\
   self:setTopicVisible(\"big_hat_stolen_gear\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00026"] = {
			["ID"] = 26;
			["connectionsID"] = {
			};
			["event"] = "get";
			["posX"] = 840;
			["posY"] = -330;
			["script"] = "function Condition:onCheck(obj)\
   self:writeLog(\"GotHat\")\
   getObj(self.q.bandit_2):setupAppearance(\"q_my_clothes_bandit_2\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "hat_jack.itm";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00027"] = {
			["ID"] = 27;
			["connectionsID"] = {
			};
			["event"] = "get";
			["posX"] = 1590;
			["posY"] = 660;
			["script"] = "function Condition:onCheck(obj)\
   hideObject(self.pants_dummy)\
   local ragpicker = getObj(self.ragpicker)\
   if ragpicker:getState(\"dead\") then\
      self:writeLog(\"GotPants\")\
   elseif ragpicker:getState(\"talk\") then\
      self:writeLog(\"BoughtPants\")\
   else\
      self:writeLog(\"StolePants\")\
   end\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "spacer_pants.itm";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00028"] = {
			["ID"] = 28;
			["connectionsID"] = {
			};
			["event"] = "start_activate";
			["posX"] = 630;
			["posY"] = 780;
			["script"] = "function Condition:onCheck(obj)\
   local ragpicker = getObj(self.ragpicker)\
   if not ragpicker.activated then\
      ragpicker:orientTo( getPlayer() )\
      gameplayUI:addSubtitle(\"Don't try to steal anything, I'm watching you!\", 7, ragpicker)\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "q_my_clothes_shirt, q_my_clothes_pants";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00029"] = {
			["ID"] = 29;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 600;
			["posY"] = -180;
			["script"] = "function Condition:onCheck(obj)\
   local bandit1 = getObj(self.bandit_1)\
   bandit1.idleAnims = { \"idle_weapon.caf\" }\
   bandit1:idle_start()\
   bandit1:orientTo( getPlayer() )\
   local bandit2 = getObj(self.bandit_2)\
   bandit2.idleAnims = { \"idle_weapon.caf\" }\
   bandit2:idle_start()\
   bandit2:orientTo( getPlayer() )\
\
   self:writeLog(\"FoundBandits\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "looters_talk";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00033"] = {
			["ID"] = 33;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 900;
			["posY"] = 360;
			["script"] = "function Condition:onCheck(obj)\
   self:writeLog(\"NoHat\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bandit_2_no_hat";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00034"] = {
			["ID"] = 34;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 660;
			["posY"] = 360;
			["script"] = "function Condition:onCheck(obj)\
   self:writeLog(\"ScaredBandits\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "bandits_scared";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00035"] = {
			["ID"] = 35;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 420;
			["posY"] = 360;
			["script"] = "function Condition:onCheck(obj)\
   log(\"show_flare_gun\")\
   local player = getPlayer()\
   local weapon = player:getInventory():getItemByName(\"flaregun.gun\")\
   player:useItem( weapon )\
   player.animationsManager:loopAnimation(\"idle_pistol_2.caf\")\
   player.animationsManager:playAnimation(\"idle_pistol_2.caf\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "show_flare_gun";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00036"] = {
			["ID"] = 36;
			["connectionsID"] = {
				[1] = 37;
			};
			["event"] = "talk_start";
			["posX"] = 1050;
			["posY"] = -120;
			["script"] = "function Condition:onCheck(obj)\
   --Assume bandits weren't killed nor presuaded, just outrun.\
   local abori = getObj(self.q.old_outcast)\
   if self.q:getActiveStepName() == \"bandits_encounter\"\
      and not abori:fear_() then\
      return true\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "old_outcast";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00039"] = {
			["ID"] = 39;
			["connectionsID"] = {
				[1] = 38;
			};
			["event"] = "dead";
			["posX"] = 1500;
			["posY"] = -120;
			["script"] = "";
			["targetsAll"] = "q_my_clothes_bandit_1,q_my_clothes_bandit_2";
			["targetsAny"] = "";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00040"] = {
			["ID"] = 40;
			["connectionsID"] = {
			};
			["event"] = "activate";
			["posX"] = 900;
			["posY"] = 780;
			["script"] = "function Condition:onCheck(obj)\
   self.q:provokeTrader( \"attack\" )\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 1980;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["killed_bandits"] = {
			["ID"] = 8;
			["connectionsID"] = {
				[1] = 3;
			};
			["name"] = "killed_bandits";
			["posX"] = 1290;
			["posY"] = 120;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self.q:old_outcast_standup()\
   self:writeLog(\"DefeatedBandits\")\
   self:setTopicVisible(\"old_outcast_killed_looters\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["killed_bandits_later"] = {
			["ID"] = 38;
			["connectionsID"] = {
				[1] = 3;
			};
			["name"] = "killed_bandits_later";
			["posX"] = 1740;
			["posY"] = -90;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:writeLog(\"DefeatedBandits\")\
   self:setTopicVisible(\"old_outcast_killed_looters\", true)\
   self:setTopicVisible(\"old_outcast_scared_looters\", false)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["looters_persuaded"] = {
			["ID"] = 31;
			["connectionsID"] = {
				[1] = 3;
			};
			["name"] = "looters_persuaded";
			["posX"] = 600;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local player = getPlayer()\
   player:setState( \"blockItemUse\", true )\
   player:setState( \"disableAttack\", true )\
   player:setState( \"disableMove\", true )\
   player:setState( \"disableJump\", true )\
   player:setState( \"disableInteraction\", true )\
   gameplayUI:startFadeToBlackSequence( 0.5, 1, 1 )\
   runTimer(1, nil, function()\
      for i=1,2 do\
         local bandit = getObj(self[\"bandit_\"..i])\
         moveObjectTo(self[\"bandit_\"..i], self[\"bandit_\"..i]..\"_evade_tp\")\
         local tp = getObj(self[\"bandit_\"..i]..\"_evade_tp\")\
         bandit:getPose():setRot(tp:getPose():getRot())\
         bandit:setSpawnPos( tp:getPose():getPos() )\
         activateObject(self[\"bandit_\"..i])\
      end\
      activateObject(self[\"bandit_3\"])\
   end, false)\
   runTimer(2, nil, function()\
      player:setDisableActionStates( false )\
      self.q:old_outcast_standup()\
      --cause natural autosave onfinish will be broken because of unsaved timers\
      getScene():tryAutoSave()\
   end, false)\
   self:setTopicVisible(\"old_outcast_scared_looters\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["looters_outrun"] = {
			["ID"] = 37;
			["connectionsID"] = {
				[1] = 39;
			};
			["name"] = "looters_outrun";
			["posX"] = 1290;
			["posY"] = -90;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self.q:old_outcast_standup()\
   self:setTopicVisible(\"old_outcast_scared_looters\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 1;
			["connectionsID"] = {
				[1] = 6;
				[2] = 9;
				[3] = 31;
			};
			["name"] = "start";
			["posX"] = 360;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:declareVar(\"old_outcast\", \"old_outcast\")\
   self:declareVar(\"bandit_1\", \"q_my_clothes_bandit_1\")\
   self:declareVar(\"bandit_2\", \"q_my_clothes_bandit_2\")\
   self:declareVar(\"bandit_3\", \"q_my_clothes_bandit_3\")\
   self:declareVar(\"ragpicker\", \"ragpicker\")\
   self:declareVar(\"bandit_1_tp\", \"q_my_clothes_bandit_1_tp\")\
   self:declareVar(\"bandit_2_tp\", \"q_my_clothes_bandit_2_tp\")\
   self:declareVar(\"bandit_3_tp\", \"q_my_clothes_bandit_3_tp\")\
   self:declareVar(\"bandit_1_evade_tp\", \"q_my_clothes_bandit_1_evade_tp\")\
   self:declareVar(\"bandit_1_evade_tp\", \"q_my_clothes_bandit_2_evade_tp\")\
   self:declareVar(\"price\", 200)\
   self:declareVar(\"shirt_activator\", \"q_my_clothes_shirt\")\
   self:declareVar(\"pants_activator\", \"q_my_clothes_pants\")\
   self:declareVar(\"shirt_dummy\", \"q_my_clothes_shirt_dummy\")\
   self:declareVar(\"pants_dummy\", \"q_my_clothes_pants_dummy\")\
   self:setTopicVisible(\"activate_bandits\", true)\
   self:setTopicVisible(\"old_outcast_killed_looters\", false)\
   self:setTopicVisible(\"old_outcast_scared_looters\", false)\
   self:setTopicVisible(\"activate_bandits\", true)\
   self:setTopicVisible(\"big_hat_stolen_gear\", false)\
   self:setTopicVisible(\"ragpicker_my_clothes\", true)\
   self:setTopicVisible(\"ragpicker_scumbag\", false)\
   self:setTopicVisible(\"ragpicker_provoke\", true)\
   self:setTopicVisible(\"ragpicker_buy_all\", true) --these three are hidden by ragpicker_scumbag\
   self:setTopicVisible(\"ragpicker_buy_shirt\", true)\
   self:setTopicVisible(\"ragpicker_buy_pants\", true)\
end\
\
function Quest:onStart()\
   local player = getPlayer()\
   local abori = getObj(self.old_outcast)\
   local bandit1 = getObj(self.bandit_1)\
   local bandit2 = getObj(self.bandit_2)\
   local bandit3 = getObj(self.bandit_3)\
   if not abori then return end\
\
   if isDebug(\"quest\") then\
      local item = bandit2:addItem( \"wooden_bat.wpn\" )\
      bandit2.itemsManager:equipSlotWithItem( 1, item.id )\
      bandit2.weapon = \"wooden_bat.wpn\"\
\
      removeItemFromPlayer( \"spacer_jacket.itm\" )\
      removeItemFromPlayer( \"spacer_pants.itm\" )\
      removeItemFromPlayer( \"hat_jack.itm\" )\
      bandit2:setupAppearance(\"q_my_clothes_bandit_2_hat\")\
      bandit2.itemsManager:addItem( \"hat_jack.itm\" )\
\
      local q = getQuest(\"my_clothes\")\
      q.hidden = false\
      setGlobalParam(\"playedIntro\", true)\
      self:teleportBandits()\
      return\
   end\
   setGlobalParam(\"inScene\", \"start_scene\")\
   setUserControl( false )\
   player.headLooking = false\
   player:setDisableActionStates( true )\
   player:setState(\"knockout\", true)\
   player.animationsManager:loopAnimationDelay( player.animations.knockout.idle, 0 )\
   --Stack up continuous subtitle dialog\
   gameplayUI:addSubtitle( \"Outcast Looter 1: He's got some nice clothes.\", 5 )\
   gameplayUI:addSubtitle( \"Outcast Looter 2: The hat is mine dammit\", 4 )\
   gameplayUI:addSubtitle( \"Outcast Looter 3: Hurry up, you slugs, I think I saw someone!\", 5 )\
   runTimer(5, nil, function()\
      setGlobalParam(\"playedIntro\", true)\
      removeItemFromPlayer( \"spacer_jacket.itm\" )\
      removeItemFromPlayer( \"spacer_pants.itm\" )\
   end, false)\
   runTimer(7, nil, function()\
      removeItemFromPlayer( \"hat_jack.itm\" )\
      bandit2:setupAppearance(\"q_my_clothes_bandit_2_hat\")\
      bandit2.itemsManager:addItem( \"hat_jack.itm\" )\
   end, false)\
   runTimer(9, self, function(self)\
      bandit1.animationsManager:playAnimation(\"search_2.caf\")\
      bandit3.animationsManager:playAnimation(\"idle_look.caf\")\
   end, false)\
   runTimer(12, self, function(self)\
      bandit1.animationsManager:loopAnimation(\"idle.caf\")\
      bandit1.animationsManager:playAnimation(\"search_to_idle.caf\")\
   end, false)\
   runTimer(13, self, function(self)\
      bandit2.animationsManager:loopAnimation(\"idle.caf\")\
      bandit2.animationsManager:playAnimation(\"search_to_idle.caf\")\
   end, false)\
   runTimer(13.5, self, function(self)\
      gameplayUI:startFadeToBlackSequence( 1, 1, 1 )\
   end, false)\
\
   --Bandits tp to their next encounter spot\
   --Commence with edited old starting script\
   runTimer(15, player, function(player)\
      setGlobalParam(\"inScene\", false)\
      setUserControl( true )\
      local item = bandit2:addItem( \"wooden_bat.wpn\" )\
      bandit2.itemsManager:equipSlotWithItem( 1, item.id )\
      bandit2.weapon = \"wooden_bat.wpn\"\
      self:teleportBandits()\
\
      player.headLooking = true\
      player:setState(\"knockout\", false)\
      player:playSound(\"Intro_main_hero_03.wav\")\
      runTimer(18, player, function(player) player:playSound(\"Intro_main_hero_04.wav\") end, false)\
      player.animationsManager:loopAnimation(\"getup_idle.caf\")\
      player.animationsManager:playAnimation(\"getup_start.caf\")\
      player.animationsManager:loopAnimation(randChoice(player.animations.idle.default))\
      local function getup_start_end(player)\
         player.animationsManager:playAnimation(\"getup_end.caf\")\
         local function getup_end_end(player)\
            local q = getQuest(\"my_clothes\")\
            q.hidden = false\
            fakeQuestStartInfo(q)\
            player:setDisableActionStates( false )\
         end\
         player.animationsManager:subscribeAnimationEnd(\"getup_end.caf\", player, getup_end_end)\
      end\
      player.animationsManager:subscribeAnimationEnd(\"getup_start.caf\", player, getup_start_end)\
      runTimer(25, nil, function() gameplayUI:setupAnnoyingHint( string.format( \"'%s' opens your journal\", getButtonCurrentKeyName(\"JOURNAL\") ), \"journal\" ) end, false)\
   end, false)\
end\
\
function Quest:onFinish()\
   self:writeLog(\"GotAll\")\
end\
\
function Quest:OnLoadState()\
   local abori = getObj(self.old_outcast)\
   if self:getActiveStepName() == \"start\" and not getGlobalParam(\"playedIntro\") then\
      self:onStart()\
   elseif self:getActiveStepName() == \"start\" and getGlobalParam(\"playedIntro\") then\
      self:teleportBandits()\
   end\
end\
\
function Quest:teleportBandits()\
   for i=1,3 do\
      local bandit = getObj(self[\"bandit_\"..i])\
      moveObjectTo(self[\"bandit_\"..i], self[\"bandit_\"..i]..\"_tp\")\
      local tp = getObj(self[\"bandit_\"..i]..\"_tp\")\
      bandit:getPose():setRot(tp:getPose():getRot())\
      bandit:setSpawnPos( tp:getPose():getPos() )\
      if i < 3 then\
         local anim = \"melee__fire_\" .. i .. \".caf\"\
         bandit.idleAnims = { anim }\
         bandit:idle_start()\
      end\
   end\
   getObj(self.bandit_2):setDialogInitiator(true)\
end\
\
function Quest:old_outcast_standup()\
   local abori = getObj(self.old_outcast)\
   abori.animationsManager:playAnimation(\"scared_to_idle.caf\")\
   abori.idleAnimation = \"idle\"\
   abori:idle_start()\
   abori:setFeelVisible(true)\
   abori.dialogState = \"dialog\"\
   abori.subtitles = nil\
   abori.headLooking = true\
end\
\
function Quest:provokeTrader( type )\
   if type == \"stealing\" then\
      self:writeLog(\"RagpickerAttackedMe\")\
   elseif type == \"attack\" then\
      self:writeLog(\"IAttackedRagpicker\")\
   elseif type == \"talk\" then\
      self:writeLog(\"IProvokedRagpicker\")\
   end\
   local ragpicker = getObj(self.ragpicker)\
   ragpicker:setRole( ROLE_NPC_AGR )\
   ragpicker.senseScheduler:refreshRoles()\
   ragpicker.dialogState = \"blocked\"\
   ragpicker:activate( true )\
end\
\
function Quest:getTopicVisible_ragpicker_buy_all()\
   return hasPlayerItemCount(\"antigravium_shards.itm\", self.price * 2)\
end\
\
function Quest:getTopicVisible_ragpicker_buy_shirt()\
   return hasPlayerItemCount(\"antigravium_shards.itm\", self.price)\
end\
\
function Quest:getTopicVisible_ragpicker_buy_pants()\
   return hasPlayerItemCount(\"antigravium_shards.itm\", self.price)\
end\
";
	["title"] = "Someone stole my pants";
}
return obj1
