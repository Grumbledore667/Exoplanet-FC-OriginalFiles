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
		["FoundClothes"] = "Found my clothes in a small shop in outcast village owned by an abori called Ragpicker. I don't think the owner will be kind enough to give me my stuff back for free.";
		["GotAll"] = "It was a tough one, but I managed to get my stuff back. What a merciless world.";
		["GotHat"] = "I got my old hat back.";
		["GotPants"] = "I got my pants back.";
		["GotShirt"] = "I got my shirt back.";
		["IAttackedRagpicker"] = "I decided to attack Ragpicker on sight. ";
		["IProvokedRagpicker"] = "I provoked Ragpicker to attack. It's time to teach him a lesson.";
		["KilledTrader"] = "I've killed Ragpicker. He's got what he deserved: if you don't want to play fair and rip off robbery victims by selling them their own stuff overpriced, get some muscles to back you up first.";
		["LootersFought"] = "I got into a fight with them.";
		["LootersFound"] = "I found a pair of looters who supposedly stole my stuff - they were beating the living shit out of another victim.";
		["LootersOutrun"] = "I provoked the bandits and outran them.";
		["LootersScared"] = "I persuaded them with the help of a flare gun I found earlier.";
		["NoHat"] = "Though I have to find that guy later to get my hat back. Then I'll be ready.";
		["RagpickerAttackedMe"] = "Ragpicker attacked me. ";
		["StolePants"] = "I stole my pants from the Ragpicker's shop. Don't have any regrets: stealing from thieves is not a crime.";
		["StoleShirt"] = "I stole my shirt from the so called shop in the outcasts village.";
	};
	["nodes"] = {
		["bandits_encounter"] = {
			["ID"] = 4;
			["connectionsID"] = {
				[1] = 36;
			};
			["name"] = "bandits_encounter";
			["posX"] = 840;
			["posY"] = 30;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local bandit1 = getObj(self.bandit_1)\
   local bandit2 = getObj(self.bandit_2)\
   bandit1:setDefaultAnimation(\"idle\")\
   bandit1:setAttitudeToMainCharacter(\"ENEMY\")\
   bandit2:setAttitudeToMainCharacter(\"ENEMY\")\
   bandit2:setDialogInitiator(false)\
\
   self:writeLog(\"LootersFound\")\
   self:writeLog(\"LootersFought\")\
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
		["condition_00009"] = {
			["ID"] = 9;
			["connectionsID"] = {
				[1] = 4;
			};
			["event"] = "turnAggressive";
			["posX"] = 600;
			["posY"] = 120;
			["script"] = "function Condition:onCheck(name, obj)\
   --Aggro both\
   getObj(self.bandit_1).senseScheduler:addEnemy(getMC())\
   getObj(self.bandit_2).senseScheduler:addEnemy(getMC())\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:bandit_1,var:bandit_2";
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
			["script"] = "function Condition:onCheck(name, obj)\
   hideObject(self.shirt_act)\
   local ragpicker = getObj(self.ragpicker)\
   if ragpicker:getState(\"dead\") then\
      self:writeLog(\"GotShirt\")\
   elseif ragpicker:getState(\"inDialog\") then\
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
			["script"] = "function Condition:onCheck(name, obj)\
   if not self:getParam(\"FoundClothes\")\
      and not getObj(self.ragpicker):getState(\"dead\") then\
      self:setParam(\"FoundClothes\", true)\
      self:writeLog(\"FoundClothes\")\
   end\
   self:setTopicVisible(\"big_hat_stolen_gear\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:shirt_act,var:pants_act";
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
			["script"] = "function Condition:onCheck(name, obj)\
   local ragpicker = getObj(self.ragpicker)\
   if not ragpicker:getState(\"dead\") and not ragpicker:getState(\"inDialog\") then\
      runTimer(0, nil, function()\
         self.q:provokeTrader(\"stealing\")\
      end, false)\
      gameplayUI.subtitlesUI:addSubtitle(\"I've warned you! Nobody robs me! Not anymore!\", 6, ragpicker, true)\
   end\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:shirt_act,var:pants_act";
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
			["script"] = "function Condition:onCheck(name, obj)\
   if hasPlayerItem(\"hat_jack.itm\")\
      and hasPlayerItem(\"spacer_jacket.itm\")\
      and hasPlayerItem(\"spacer_pants.itm\") then\
      --This is here only for the uncommon case where player kills looters and does not talk to\
      --old outcast. Anyways this quest structure has to be redone properly.\
      if self.q:getActiveStepName() ~= \"looters_done\" then\
         self:goToStepTimer(\"looters_done\", 0, false)\
      end\
      self:goToStepTimer(\"finish\", 0, false)\
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
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"antigravium_shards.itm\", getObj(self.ragpicker), self.price*2)\
   getObj(self.shirt_act):activate()\
   getObj(self.pants_act):activate()\
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
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"antigravium_shards.itm\", getObj(self.ragpicker), self.price)\
   self:setTopicVisible(\"ragpicker_buy_all\", false)\
   self:setTopicVisible(\"ragpicker_buy_shirt\", false)\
   getObj(self.shirt_act):activate()\
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
			["script"] = "function Condition:onCheck(name, obj)\
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
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"antigravium_shards.itm\", getObj(self.ragpicker), self.price)\
   self:setTopicVisible(\"ragpicker_buy_all\", false)\
   self:setTopicVisible(\"ragpicker_buy_pants\", false)\
   getObj(self.pants_act):activate()\
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
			["script"] = "function Condition:onCheck(name, obj)\
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
			["script"] = "function Condition:onCheck(name, obj)\
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
			["script"] = "function Condition:onCheck(name, obj)\
   hideObject(self.pants_act)\
   local ragpicker = getObj(self.ragpicker)\
   if ragpicker:getState(\"dead\") then\
      self:writeLog(\"GotPants\")\
   elseif ragpicker:getState(\"inDialog\") then\
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
			["event"] = "dwell";
			["posX"] = 630;
			["posY"] = 780;
			["script"] = "function Condition:onCheck(name, obj)\
   local ragpicker = getObj(self.ragpicker)\
   if not ragpicker:isEnemy(getMC()) then\
      ragpicker:orientTo(getMC())\
      gameplayUI.subtitlesUI:addSubtitle(\"Don't try to steal anything, I'm watching you!\", 7, ragpicker)\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:shirt_act,var:pants_act";
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
			["script"] = "function Condition:onCheck(name, obj)\
   local bandit1 = getObj(self.bandit_1)\
   bandit1:setDefaultAnimation(\"idle\")\
   bandit1:orientTo(getMC())\
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
			["posX"] = 660;
			["posY"] = 360;
			["script"] = "function Condition:onCheck(name, obj)\
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
		["condition_00035"] = {
			["ID"] = 35;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 420;
			["posY"] = 360;
			["script"] = "function Condition:onCheck(name, obj)\
   log(\"show_flare_gun\")\
   local player = getMC()\
   equipItemForPlayer(\"flaregun.gun\", player:getWeaponSlot(), false)\
   player.animationsManager:playCycle(\"pistol_idle_2\")\
   player.animationsManager:playAction(\"pistol_idle_2\")\
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
				[1] = 41;
			};
			["event"] = "talk_start";
			["posX"] = 1080;
			["posY"] = 0;
			["script"] = "function Condition:onCheck(name, obj)\
   local bandit1 = getObj(self.bandit_1)\
   local bandit2 = getObj(self.bandit_2)\
   if not bandit1:getState(\"dead\") or not bandit2:getState(\"dead\") then\
      self:writeLog(\"LootersOutrun\")\
      self:setParam(\"looters_outrun\", true)\
      self:setTopicVisible(\"old_outcast_scared_looters\", true)\
   end\
   return true\
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
			};
			["event"] = "dead";
			["posX"] = 1080;
			["posY"] = -150;
			["script"] = "function Condition:onCheck(name, obj)\
   if not self:getParam(\"looterKilled\") then\
      self:setParam(\"looterKilled\", true)\
      return false\
   else\
      self:writeLog(\"DefeatedBandits\")\
      self:setTopicVisible(\"old_outcast_killed_looters\", true)\
      self:setTopicVisible(\"old_outcast_scared_looters\", false)\
      return true\
   end\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:bandit_1,var:bandit_2";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00040"] = {
			["ID"] = 40;
			["connectionsID"] = {
			};
			["event"] = "turnAggressive";
			["posX"] = 900;
			["posY"] = 780;
			["script"] = "function Condition:onCheck(name, obj)\
   self.q:provokeTrader(\"attack\")\
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
			["posX"] = 2400;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["looters_done"] = {
			["ID"] = 41;
			["connectionsID"] = {
				[1] = 3;
			};
			["name"] = "looters_done";
			["posX"] = 1590;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   getObj(self.old_outcast):setFeelVisible(true)\
   self:setTopicVisible(\"big_hat_looters\", true)\
\
   --Have to delay hat recieving like this so the quest won't end immediately\
   --And the autosave won't be corrupted cause of unsaved timers\
   if self:getParam(\"hatRecieved\") then\
      addItemToPlayer(\"hat_jack.itm\")\
   end\
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
				[1] = 41;
			};
			["name"] = "looters_persuaded";
			["posX"] = 600;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local player = getMC()\
   player:setState(\"blockItemUse\", true)\
   player:setState(\"disableAttack\", true)\
   player:setState(\"disableMove\", true)\
   player:setState(\"disableJump\", true)\
   player:setState(\"disableInteraction\", true)\
   gameplayUI:startFadeToBlackSequence(0.5, 1, 1,\
   {\
      onPause = {\
         func = function()\
            unequipSlotForPlayer(player:getWeaponSlot(), true)\
            for i=1,2 do\
               local bandit = getObj(self[\"bandit_\"..i])\
               local tp = getObj(self[\"bandit_\"..i]..\"_evade_tp\")\
               teleportTo(bandit, tp)\
               bandit:setSpawnPos(tp:getPose():getPos())\
               bandit:setAttitudeToMainCharacter(\"ENEMY\")\
            end\
         end\
      },\
      onFadeOutEnd = {\
         func = function()\
            player:setDisableActionStates(false)\
            self:goToStep(\"looters_done\")\
         end\
      }\
   })\
   self:setTopicVisible(\"old_outcast_scared_looters\", true)\
\
   self:writeLog(\"LootersFound\")\
   self:writeLog(\"LootersScared\")\
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
	["script"] = "local random = require \"random\"\
function Quest:onCreate()\
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
   self:declareVar(\"shirt_act\", \"q_my_clothes_shirt_dummy\")\
   self:declareVar(\"pants_act\", \"q_my_clothes_pants_dummy\")\
   self:setTopicVisible(\"activate_bandits\", true)\
   self:setTopicVisible(\"old_outcast_killed_looters\", false)\
   self:setTopicVisible(\"old_outcast_scared_looters\", false)\
   self:setTopicVisible(\"activate_bandits\", true)\
   self:setTopicVisible(\"big_hat_stolen_gear\", false)\
   self:setTopicVisible(\"big_hat_looters\", false)\
   self:setTopicVisible(\"ragpicker_my_clothes\", true)\
   self:setTopicVisible(\"ragpicker_scumbag\", false)\
   self:setTopicVisible(\"ragpicker_provoke\", true)\
   self:setTopicVisible(\"ragpicker_buy_all\", true) --these three are hidden by ragpicker_scumbag\
   self:setTopicVisible(\"ragpicker_buy_shirt\", true)\
   self:setTopicVisible(\"ragpicker_buy_pants\", true)\
   self:setTopicVisible(\"looters_talk\", true)\
end\
\
function Quest:onStart()\
   local coro = require \"coroutines.helpers\"\
   local player = getMC()\
   local abori = getObj(self.old_outcast)\
   abori:setFeelVisible(false) --enabled when he stands up after looters are dealt with\
   local bandit1 = getObj(self.bandit_1)\
   local bandit2 = getObj(self.bandit_2)\
   local bandit3 = getObj(self.bandit_3)\
   if not abori then return end\
\
   if isDebug(\"quest\") then\
      addItemToObj(\"wooden_bat.wpn\", bandit2)\
      equipItemForObj(\"wooden_bat.wpn\", 1, bandit2, true)\
\
      removeItemFromPlayer(\"spacer_jacket.itm\")\
      removeItemFromPlayer(\"spacer_pants.itm\")\
      removeItemFromPlayer(\"hat_jack.itm\")\
      bandit2:setupAppearance(\"q_my_clothes_bandit_2_hat\")\
      addItemToObj(\"hat_jack.itm\", bandit2)\
\
      local q = getQuest(\"my_clothes\")\
      q.hidden = false\
      self:teleportBandits()\
      return\
   end\
   setGlobalParam(\"inScene\", \"start_scene\")\
   showGameplayUI(false)\
   blockUserControl()\
   player:setHeadLookingAllowed(false)\
   player:setDisableActionStates(true)\
   player:setState(\"knockout\", true)\
   player.animationsManager:playCycle(player.animations.knockout.idle, 0)\
\
   runTimerCo(function()\
      gameplayUI.subtitlesUI:addSubtitle(\"Outcast Looter 1: He's got some nice clothes.\", 5)\
\
      coro.wait(0.9)\
      --Async bandit's animation\
      bandit1.animationsManager:stopActionsAndCycles()\
      bandit1.animationsManager:playCycle(\"search_idle\", 0)\
\
      coro.wait(4.1)\
\
      --Remove clothes\
      removeItemFromPlayer(\"spacer_jacket.itm\")\
      removeItemFromPlayer(\"spacer_pants.itm\")\
      gameplayUI.subtitlesUI:addSubtitle(\"Outcast Looter 2: The hat is mine dammit\", 4)\
\
      coro.wait(2)\
\
      --Remove hat and add it to the npc\
      removeItemFromPlayer(\"hat_jack.itm\")\
      bandit2:setupAppearance(\"q_my_clothes_bandit_2_hat\")\
      addItemToObj(\"hat_jack.itm\", bandit2)\
\
      coro.wait(2)\
\
      --bandit3 notices something, bandit1 and bandit3 look around\
      bandit1.animationsManager:playAction(\"search_idle_2\")\
      bandit3.animationsManager:playAction(\"idle_look\")\
      gameplayUI.subtitlesUI:addSubtitle(\"Outcast Looter 3: Hurry up, you slugs, I think I saw someone!\", 5)\
\
      coro.wait(3)\
\
      --bandit1 stands up first\
      bandit1:setDefaultAnimation(\"idle\")\
      bandit1.animationsManager:playAction(\"search_idle_to_idle\")\
\
      coro.wait(1)\
\
      --bandit2 stands up second\
      bandit2:setDefaultAnimation(\"idle\")\
      bandit2.animationsManager:playAction(\"search_idle_to_idle\")\
\
      coro.wait(0.5)\
\
      gameplayUI:startFadeToBlackSequence(1, 3, 1)\
\
      coro.wait(1.5)\
\
      --Jack starts to get up and plays intro speech during black screen\
      player.animationsManager:playCycle(\"sit_ground_idle\")\
      player:playSound(\"Play_Intro_main_hero_03\")\
      runTimer(18, nil, function() player:playSound(\"Play_Intro_main_hero_04\") end, false)\
      --Bandits tp to their next encounter spot\
      addItemToObj(\"wooden_bat.wpn\", bandit2)\
      equipItemForObj(\"wooden_bat.wpn\", 1, bandit2, true)\
      self:teleportBandits()\
\
      coro.wait(2.2)\
\
      --Jack gets up and camera moves to normal distance\
      player.animationsManager:playAction(\"sit_ground_idle_to_idle\")\
      player.animationsManager:playCycle(random.choice(player.animations.idle.default))\
      player:updateCamera()\
\
      coro.wait(0.8)\
\
      --camera can be controlled\
      setGlobalParam(\"inScene\", \"getup_scene\")\
      returnUserControl()\
      player:updateCamera()\
      player:setHeadLookingAllowed(true)\
\
      coro.waitAnimationEnd(player, \"sit_ground_idle_to_idle\")\
\
      --Jack stretches muscles\
      player.animationsManager:playAction(\"idle_stretch\")\
\
      coro.waitAnimationEnd(player, \"idle_stretch\")\
\
      --Start quest and play some animation to prolong the scene\
      local q = getQuest(\"my_clothes\")\
      q.hidden = false\
      fakeQuestStartInfo(q)\
      player.animationsManager:playCycle(\"idle_arms_on_hips\", 1)\
\
      coro.wait(2.5)\
\
      --Jack pokes his scanner\
      player.animationsManager:playCycle(random.choice(player.animations.idle.default))\
      player.animationsManager:playAction(\"idle_gadget_use_long\")\
\
      coro.waitAnimationEventIn(player, \"idle_gadget_use_long\", \"button\")\
\
      --Jack uses a scan\
      local scanner = player:getInventory():getItemByName(\"scanner.itm\")\
      player:runScanWave(scanner, false)\
\
      coro.waitAnimationEnd(player, \"idle_gadget_use_long\")\
\
      --Scene is done\
      self:setParam(\"playedIntro\", true)\
      setGlobalParam(\"inScene\", false)\
      player:setState(\"knockout\", false)\
      player:setDisableActionStates(false)\
      showGameplayUI(true)\
\
      --Fire up tutorial quest and mockup the first hint trigger event\
      getQuest(\"tutorial\"):start()\
      questSystem:fireEvent(\"trigger_in\", \"tutorial_1\", nil)\
\
      coro.wait(3)\
\
      --Add a journal hint\
      gameplayUI.annoyingHintUI:addTask(function()\
         return string.format(\"'%s' opens your journal\", getButtonCurrentKeyName(\"JOURNAL\"))\
      end, \"journal\")\
   end)\
end\
\
function Quest:onFinish()\
   self:writeLog(\"GotAll\")\
end\
\
function Quest:OnLoadState()\
   if self:getActiveStepName() == \"start\" and not self:getParam(\"playedIntro\") then\
      self:onStart()\
   elseif self:getActiveStepName() == \"start\" and self:getParam(\"playedIntro\") then\
      self:teleportBandits()\
   end\
end\
\
function Quest:teleportBandits()\
   for i=1,3 do\
      local bandit = getObj(self[\"bandit_\"..i])\
      local tp = getObj(self[\"bandit_\"..i]..\"_tp\")\
      teleportTo(bandit, tp)\
      bandit:setSpawnPos(tp:getPose():getPos())\
   end\
   getObj(self.bandit_1):setDefaultAnimation(\"1hm_idle_melee\")\
   --dialog initiation with orientation is only available from whitelisted default animations\
   getObj(self.bandit_2):setDefaultAnimation(\"1hm_idle\")\
   getObj(self.bandit_2):setDialogInitiator(true)\
   getObj(self.bandit_3):setAttitudeToMainCharacter(\"ENEMY\")\
end\
\
function Quest:provokeTrader(type)\
   if type == \"stealing\" then\
      self:writeLog(\"RagpickerAttackedMe\")\
   elseif type == \"attack\" then\
      self:writeLog(\"IAttackedRagpicker\")\
   elseif type == \"talk\" then\
      self:writeLog(\"IProvokedRagpicker\")\
   end\
   local ragpicker = getObj(self.ragpicker)\
   ragpicker:setAttitudeToMainCharacter(\"ENEMY\")\
end\
\
function Quest:getTopicVisible_ragpicker_buy_all()\
   return hasPlayerItem(\"antigravium_shards.itm\", self.price * 2)\
end\
\
function Quest:getTopicVisible_ragpicker_buy_shirt()\
   return hasPlayerItem(\"antigravium_shards.itm\", self.price)\
end\
\
function Quest:getTopicVisible_ragpicker_buy_pants()\
   return hasPlayerItem(\"antigravium_shards.itm\", self.price)\
end\
";
	["title"] = "Someone stole my pants";
}
return obj1