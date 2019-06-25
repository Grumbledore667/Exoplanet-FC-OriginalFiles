-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "Scrap Master offered me a job — help to fix the big crane. The camp needs the crane to lift large loads from the desert. He sent his workers to fix it, but they've been there for a suspiciously long time.\
Once the crane is fixed, I also need to send the workers back to Scrap Master's workshop. Preferably, more or less unhurt.\
As a reward, Scrap Master is offering a worker's robe or ammo.";
	["hidden"] = false;
	["logs"] = {
		["cog_briefing"] = "Turns out they examined the crane and were supposed to fix it, but they didn't have the required spare parts and didn't want to replace them with their own money.\
I'll need industrial Electrical Tape (2) and an automatic triple-phase Circuit Breaker.\
It won't be hard to find the tape, traders in the camp might have it.\
The Circuit Breaker is going to be a problem: Cog doesn't know where to get a new one, and Screw who exchanged it for some dope is now lying unconscious. Maybe I can get something out of him?";
		["cog_briefing_no_scrap"] = "As for the scrap, they promised to search for the needed amount themselves. Thanks for that, at least.";
		["cog_briefing_scrap"] = "Besides, I'll need Electronic Scrap (5). For that, I'll have to rummage through the junkyard. I suppose it might be the workers' little revenge for me teaching them a lesson.";
		["cog_got_booze"] = "The abori drank the booze, got cocky and asked for some roasted bugs.";
		["cog_sweet_joy"] = "Cog doesn't know where Screw got the drug, but he assumed it would be from one of the local traders.";
		["cog_wants_booze"] = "I've discovered that the three aboris haven't even started working. Their foreman, a guy named Cog, didn't explain what the problem was. He agreed to tell me the details when I get him some Cold Booze (2) for him and his friend.\
I can get cold booze at the bar on the market square.";
		["cog_was_beaten"] = "I had to beat up those rogue aboris.";
		["cog_was_beaten_after_booze"] = "The nerve! Of course I had to beat up those rogue aboris.";
		["cog_wasnt_beaten"] = "I managed to talk some sense into him and get a bit more serious about the situation.";
		["done"] = "The crane is fixed and I sent the brigade back to the workshop. Now I need to report to Scrap Master.";
		["finish_cog_was_beaten"] = "Scrap Master was very unhappy that I beat up the lazy aboris. They won't be able to work at full capacity for a while, but I think they deserved it.";
		["finish_cog_wasnt_beaten"] = "Scrap Master was happy that I resolved the issue with the lazy workers without resorting to violence. He needs every pair of hands he can get in his workshop — beaten-up scrap collectors would only hinder the work.";
		["finish_self_repair"] = "Scrap Master was very happy that I fixed the crane myself and a lot quicker than his workers would have. As well as his respect, I earned an extra reward.";
		["finish_workers_repair"] = "Despite the fact that the workers spent an extra day on the crane, Scrap Master was satisfied and gave me my reward.";
		["repair_finish"] = "A day has passed, I should return to Cog and check if they got the crane fixed, then send them back to the workshop.";
		["scrap_master_report_workers"] = "I reported the \"progress\" of Cog's brigade to Scrap Master. He was extremely unhappy that they lost the part needed to fix the crane.";
		["scrap_master_sweet_joy"] = "As for Sweet Joy, Scrap Master doesn't know who the seller might be, but he recommended that I talk to the traders in the camp.\
";
		["screw_sweet_joy"] = "Screw was in no condition to tell me where the Circuit Breaker was. From his mumbling I only managed to get that he's using something called Sweet Joy. He probably exchanged the Circuit Breaker for a dose. I need to find out who in the camp sells this Sweet Joy.\
";
		["self_repair_1"] = "I fixed the first crane part, another one is left.";
		["self_repair_full"] = "I fully fixed the crane by myself. Now I have to send the workers back to the workshop and report to Scrap Master.";
		["trader_sweet_joy"] = "I asked %s about Sweet Joy. The locals don't sell such specific goods, I might have better luck with the traveling traders.";
		["transformer"] = "It appears I can fix the transformer myself with Electrical Tape (2) and Electric Scrap (9).";
		["waga_about_zaba"] = "Waga told me in great detail about Zaba and his \"achievements\". According to Waga, Zaba is ruthless and greedy, an errand boy working for drug dealers who considers himself a real big cheese. The most important thing I found out is that Zaba is terrified of microbes.\
How can I use that against him?";
		["waga_sweet_joy"] = "The traveling trader Waga the Tumbleweed told me that right now a trader called Zaba is staying with the chief of the camp, and that he's the only one who sells Sweet Joy. Waga obviously doesn't like Zaba and advised me to stay alert with him.";
		["wait_repair"] = "I gave all the parts to Cog. He promised to fix the crane in a day. I hope the workers won't \"lose\" anything this time.";
		["zaba_cb_buy_big"] = "I had to buy the Circuit Breaker back with my own money. Judging by the spark in his eyes, he managed to sell the Circuit Breaker for more than it's worth. Well, I'll be smarter next time I have to deal with his kind.";
		["zaba_cb_buy_medium"] = "I tried to trick Zaba to get a lower price, but I failed. Zaba is an experienced businessman and he's heard tons of stories like that. I had to buy the Circuit Breaker back with my own money.";
		["zaba_cb_buy_small"] = "The story about the epidemics terrified Zaba and I managed to pay him less for the Circuit Breaker than that greedy abori wanted. Surprisingly, even in the face of his biggest fear he proved to be incredibly stingy.";
		["zaba_sweet_joy"] = "In the end, it turned out that Zaba the Sweet talker is the only one in the camp who has Sweet Joy, and he also has the Circuit Breaker. I suspect that Zaba doesn't mind cashing in on others' problems and is driving the price of the Circuit Breaker up. There must be a way to buy it cheaper!\
I need to ask people who know Zaba well about him.\
";
	};
	["nodes"] = {
		["condition_00000"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = -1170;
			["posY"] = 270;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "scrap_master_start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00002"] = {
			["ID"] = 2;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 2520;
			["posY"] = 330;
			["script"] = "function Condition:onCheck(name, obj)\
   addItemToPlayer(\"revolver_ammo.itm\", 10)\
   addItemToPlayer(\"shotgun_ammo.itm\", 7)\
   addItemToPlayer(\"22_ammo.itm\", 15)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "scrap_master_finish_ammo";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00006"] = {
			["ID"] = 6;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 390;
			["posY"] = 90;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"scrap_master_report_workers\", false)\
\
   self:writeLog(\"scrap_master_report_workers\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "scrap_master_report_workers";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00008"] = {
			["ID"] = 8;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -600;
			["posY"] = -120;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"cog_wants_booze\", false)\
   self:setTopicVisible(\"cog_regular_greeting\", false)\
   self:setTopicVisible(\"cog_waits_booze\", true)\
   self:setTopicVisible(\"nut_give_booze\", true)\
\
   self:writeLog(\"cog_wants_booze\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "cog_wants_booze";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00011"] = {
			["ID"] = 11;
			["connectionsID"] = {
				[1] = 9;
			};
			["event"] = "discuss";
			["posX"] = 150;
			["posY"] = 270;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "cog_briefing";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00012"] = {
			["ID"] = 12;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -600;
			["posY"] = 30;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"cog_waits_booze\", false)\
   self:setTopicVisible(\"cog_give_booze\", false)\
   self:setTopicVisible(\"cog_got_booze\", true)\
\
   giveItemFromPlayerTo(\"booze_cold.itm\", obj, 1)\
   obj:setBBVar(\"consumeItemName\", \"booze_cold.itm\")\
\
   if self:getParam(\"cog_booze_needed\") == 2 then\
      --Unsafe for save/load, but it's decorative AND during dialog\
      runTimer(1, nil, function()\
         local nut = getObj(\"nut\")\
         giveItemFromPlayerTo(\"booze_cold.itm\", nut, 1)\
         nut:setBBVar(\"consumeItemName\", \"booze_cold.itm\")\
      end, false)\
   end\
\
   addExpToPlayer(self.booze_exp)\
\
   self:writeLog(\"cog_got_booze\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "cog_give_booze";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00015"] = {
			["ID"] = 15;
			["connectionsID"] = {
				[1] = 60;
			};
			["event"] = "discuss";
			["posX"] = -630;
			["posY"] = 660;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "cog_provoke";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00016"] = {
			["ID"] = 16;
			["connectionsID"] = {
			};
			["event"] = "knockout";
			["posX"] = 30;
			["posY"] = 600;
			["script"] = "function Condition:onCheck(name, obj)\
   obj:setImmortality(\"immortal\")\
   obj:setAttitudeToMainCharacter(\"NEUTRAL\")\
   obj:setState(\"shouldFearEnemy\", false)\
   addExpToPlayer(self.knockout_exp)\
   self:setParam(obj:getName() .. \"_ko\", true)\
\
   if self:getParam(\"cog_ko\") and self:getParam(\"nut_ko\") then\
      local cog = getObj(\"cog\")\
      local nut = getObj(\"nut\")\
      cog.navigator:setPatrolRoute({getObj(self.cog_initial_wp)})\
      nut.navigator:setPatrolRoute({getObj(self.nut_initial_wp)})\
\
      if self:getTopicVisible(\"cog_got_booze\") then\
         self:writeLog(\"cog_was_beaten_after_booze\")\
      else\
         self:writeLog(\"cog_was_beaten\")\
      end\
      return true\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "cog,nut";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00018"] = {
			["ID"] = 18;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 90;
			["posY"] = 450;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"cog_after_fight\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "cog_after_fight";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00020"] = {
			["ID"] = 20;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -750;
			["posY"] = -480;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"cog_intro\", false)\
   self:setTopicVisible(\"cog_regular_greeting\", true)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "cog_intro";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00023"] = {
			["ID"] = 23;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -510;
			["posY"] = -480;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"screw_sweet_joy\", false)\
   self:setTopicVisible(\"screw_sweet_joy_2\", true)\
   self:setTopicVisible(\"nut_sweet_joy\", true)\
   self:setTopicVisible(\"cog_sweet_joy\", true)\
   self:setTopicVisible(\"scrap_master_sweet_joy\", true)\
   self:setTopicVisible(\"waga_sweet_joy\", true)\
   self:setTopicVisible(\"braga_sweet_joy\", true)\
   self:setTopicVisible(\"carry_sweet_joy\", true)\
   self:setTopicVisible(\"ragpicker_sweet_joy\", true)\
   self:setTopicVisible(\"zaba_sweet_joy\", true)\
   addExpToPlayer(self.sweet_joy_talk_exp)\
\
   self:writeLog(\"screw_sweet_joy\")\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "screw_sweet_joy";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00026"] = {
			["ID"] = 26;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -30;
			["posY"] = -1020;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"zaba_about_waga\", false)\
   self:setTopicVisible(\"waga_about_zaba\", false)\
   self:setTopicVisible(\"waga_about_zaba_bad\", true)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "zaba_about_waga";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00027"] = {
			["ID"] = 27;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 210;
			["posY"] = -1020;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"waga_about_zaba\", false)\
   self:setTopicVisible(\"waga_about_zaba_bad\", false)\
   self:setTopicVisible(\"zaba_cb_negotiate_small\", true)\
   addExpToPlayer(self.zabas_weakness_exp)\
\
   self:writeLog(\"waga_about_zaba\")\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "waga_about_zabas_weakness";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00030"] = {
			["ID"] = 30;
			["connectionsID"] = {
			};
			["event"] = "buyItemFrom";
			["posX"] = -30;
			["posY"] = -870;
			["script"] = "function Condition:onCheck(name, obj)\
   --Allows to talk with zaba about the circuit breaker\
   self:setTopicVisible(\"zaba_never_bought\", false)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "zaba_the_sweet_talker";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00032"] = {
			["ID"] = 32;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 900;
			["posY"] = -660;
			["script"] = "function Condition:onCheck(name, obj)\
   self.q:disable_sweet_joy_topics()\
\
   self:setTopicVisible(\"zaba_about_cb\", true)\
   addExpToPlayer(self.sweet_joy_talk_exp_zaba)\
\
   self:writeLog(\"zaba_sweet_joy\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "zaba_sweet_joy";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00033"] = {
			["ID"] = 33;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 660;
			["posY"] = -990;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"cog_sweet_joy\", false)\
   addExpToPlayer(self.sweet_joy_talk_exp)\
\
   self:writeLog(\"cog_sweet_joy\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "cog_sweet_joy";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00034"] = {
			["ID"] = 34;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 1140;
			["posY"] = -480;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"zaba_cb_negotiate_small\", false)\
   self:setTopicVisible(\"zaba_cb_negotiate_medium\", false)\
   self:setTopicVisible(\"zaba_cb_negotiate_big\", false)\
   self:setTopicVisible(\"zaba_cb_negotiate_fluff\", false)\
   self:setTopicVisible(\"zaba_cb_buy_small\", true)\
   self:setTopicVisible(\"zaba_cb_buy_medium\", false)\
   self:setTopicVisible(\"zaba_cb_buy_big\", false)\
   self:setTopicVisible(\"zaba_cb_no_money\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "zaba_cb_negotiate_small";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00042"] = {
			["ID"] = 42;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 870;
			["posY"] = -30;
			["script"] = "function Condition:onCheck(name, obj)\
   local cog = getObj(\"cog\")\
   if not self:getTopicVisible(\"cog_got_booze\") then\
      giveItemFromPlayerTo(\"scrap_electric.itm\", cog, 5)\
   end\
   giveItemFromPlayerTo(\"electrical_tape.itm\", cog, 2)\
   giveItemFromPlayerTo(\"circuit_breaker_auto.itm\", cog, 1)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "cog_give_parts";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00044"] = {
			["ID"] = 44;
			["connectionsID"] = {
				[1] = 43;
			};
			["event"] = "discuss";
			["posX"] = 930;
			["posY"] = 120;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "cog_start_repair";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00045"] = {
			["ID"] = 45;
			["connectionsID"] = {
				[1] = 46;
			};
			["event"] = "discuss";
			["posX"] = 930;
			["posY"] = 360;
			["script"] = "function Condition:onCheck(name, obj)\
   removeItemFromPlayer(\"scrap_electric.itm\", 9)\
   removeItemFromPlayer(\"electrical_tape.itm\", 2)\
\
   hideDisableObjectGroup(self.transformer_group_broken, true)\
   showEnableObjectGroup(self.transformer_group_fixed, true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "self_repair_transformer";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00047"] = {
			["ID"] = 47;
			["connectionsID"] = {
				[1] = 46;
			};
			["event"] = "discuss";
			["posX"] = 930;
			["posY"] = 480;
			["script"] = "function Condition:onCheck(name, obj)\
   removeItemFromPlayer(\"circuit_breaker_auto.itm\", 1)\
\
   hideDisableObjectGroup(self.board_group_broken, true)\
   showEnableObjectGroup(self.board_group_fixed, true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "self_repair_board";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00048"] = {
			["ID"] = 48;
			["connectionsID"] = {
				[1] = 50;
			};
			["event"] = "discuss";
			["posX"] = 1440;
			["posY"] = 360;
			["script"] = "function Condition:onCheck(name, obj)\
   removeItemFromPlayer(\"scrap_electric.itm\", 9)\
   removeItemFromPlayer(\"electrical_tape.itm\", 2)\
\
   hideDisableObjectGroup(self.transformer_group_broken, true)\
   showEnableObjectGroup(self.transformer_group_fixed, true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "self_repair_transformer";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00049"] = {
			["ID"] = 49;
			["connectionsID"] = {
				[1] = 50;
			};
			["event"] = "discuss";
			["posX"] = 1440;
			["posY"] = 480;
			["script"] = "function Condition:onCheck(name, obj)\
   removeItemFromPlayer(\"circuit_breaker_auto.itm\", 1)\
\
   hideDisableObjectGroup(self.board_group_broken, true)\
   showEnableObjectGroup(self.board_group_fixed, true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "self_repair_board";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00053"] = {
			["ID"] = 53;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 900;
			["posY"] = -480;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"zaba_cb_negotiate_medium\", false)\
   self:setTopicVisible(\"zaba_cb_buy_medium\", true)\
   self:setTopicVisible(\"zaba_cb_buy_big\", false)\
   self:setTopicVisible(\"zaba_cb_no_money\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "zaba_cb_negotiate_medium";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00054"] = {
			["ID"] = 54;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 660;
			["posY"] = -480;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"zaba_cb_negotiate_medium\", false)\
   self:setTopicVisible(\"zaba_cb_negotiate_big\", false)\
   self:setTopicVisible(\"zaba_cb_buy_big\", true)\
   self:setTopicVisible(\"zaba_cb_buy_medium\", false)\
   self:setTopicVisible(\"zaba_cb_no_money\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "zaba_cb_negotiate_big";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00055"] = {
			["ID"] = 55;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 660;
			["posY"] = -330;
			["script"] = "function Condition:onCheck(name, obj)\
   local zaba = getObj(\"zaba_the_sweet_talker\")\
   giveItemFromPlayerTo(\"antigravium_shards.itm\", zaba, 150)\
   giveItemFromObjTo(\"circuit_breaker_auto.itm\", zaba, getMC(), 1)\
   self:setTopicVisible(\"zaba_about_cb\", false)\
   addExpToPlayer(self.cb_buy_price_small)\
\
   self:writeLog(\"zaba_cb_buy_small\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "zaba_cb_buy_small";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00058"] = {
			["ID"] = 58;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 900;
			["posY"] = -330;
			["script"] = "function Condition:onCheck(name, obj)\
   local zaba = getObj(\"zaba_the_sweet_talker\")\
   giveItemFromPlayerTo(\"antigravium_shards.itm\", zaba, 300)\
   giveItemFromObjTo(\"circuit_breaker_auto.itm\", zaba, getMC(), 1)\
   self:setTopicVisible(\"zaba_about_cb\", false)\
   addExpToPlayer(self.cb_buy_price_medium)\
\
   self:writeLog(\"zaba_cb_buy_medium\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "zaba_cb_buy_medium";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00059"] = {
			["ID"] = 59;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 1140;
			["posY"] = -330;
			["script"] = "function Condition:onCheck(name, obj)\
   local zaba = getObj(\"zaba_the_sweet_talker\")\
   giveItemFromPlayerTo(\"antigravium_shards.itm\", zaba, 400)\
   giveItemFromObjTo(\"circuit_breaker_auto.itm\", zaba, getMC(), 1)\
   self:setTopicVisible(\"zaba_about_cb\", false)\
   addExpToPlayer(self.cb_buy_price_big)\
\
   self:writeLog(\"zaba_cb_buy_big\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "zaba_cb_buy_big";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00061"] = {
			["ID"] = 61;
			["connectionsID"] = {
				[1] = 62;
			};
			["event"] = "discuss";
			["posX"] = 2010;
			["posY"] = 270;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "cog_go_to_shop";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00064"] = {
			["ID"] = 64;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 2190;
			["posY"] = 60;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"scrap_master_crane_fixed\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "scrap_master_crane_fixed";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00066"] = {
			["ID"] = 66;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 2520;
			["posY"] = 210;
			["script"] = "function Condition:onCheck(name, obj)\
   addItemToPlayer(\"worker_jacket.itm\", 1)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "scrap_master_finish_armor";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00067"] = {
			["ID"] = 67;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 660;
			["posY"] = -840;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"waga_sweet_joy\", false)\
   addExpToPlayer(self.sweet_joy_talk_exp_waga)\
\
   self:writeLog(\"waga_sweet_joy\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "waga_sweet_joy";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00068"] = {
			["ID"] = 68;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 900;
			["posY"] = -840;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"braga_sweet_joy\", false)\
   addExpToPlayer(self.sweet_joy_talk_exp_traders)\
\
   self:writeLog(\"trader_sweet_joy\", obj:getLabel())\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "braga_sweet_joy";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00069"] = {
			["ID"] = 69;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 1140;
			["posY"] = -840;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"ragpicker_sweet_joy\", false)\
   addExpToPlayer(self.sweet_joy_talk_exp_traders)\
\
   self:writeLog(\"trader_sweet_joy\", obj:getLabel())\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ragpicker_sweet_joy";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00070"] = {
			["ID"] = 70;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 1380;
			["posY"] = -480;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"zaba_cb_negotiate_fluff\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "zaba_cb_negotiate_fluff";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00072"] = {
			["ID"] = 72;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 2490;
			["posY"] = -120;
			["script"] = "function Condition:onCheck(name, obj)\
   local char = getObj(\"cog\")\
   if char:isInTrigger(obj) then\
      char:setState(\"talkForbidden\", false)\
      char:setIgnoreSleep(false)\
      self:setTopicVisible(\"cog_at_shop\", true)\
      return true\
   end\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:cog_in_shop_wp";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00073"] = {
			["ID"] = 73;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 2730;
			["posY"] = -120;
			["script"] = "function Condition:onCheck(name, obj)\
   local char = getObj(\"nut\")\
   if char:isInTrigger(obj) then\
      char:setState(\"talkForbidden\", false)\
      char:setIgnoreSleep(false)\
      --self:setTopicVisible(\"nut_at_shop\", true)\
      return true\
   end\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:nut_in_shop_wp";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00075"] = {
			["ID"] = 75;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -600;
			["posY"] = -300;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"booze_cold.itm\", obj, 1)\
   obj:setBBVar(\"consumeItemName\", \"booze_cold.itm\")\
   self:setParam(\"cog_booze_needed\", 1)\
   self:setTopicVisible(\"nut_give_booze\", false)\
   addExpToPlayer(self.booze_exp)\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "nut_give_booze";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00076"] = {
			["ID"] = 76;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 900;
			["posY"] = -990;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"scrap_master_sweet_joy\", false)\
   addExpToPlayer(self.sweet_joy_talk_exp)\
\
   self:writeLog(\"scrap_master_sweet_joy\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "scrap_master_sweet_joy";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00077"] = {
			["ID"] = 77;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 0;
			["posY"] = -330;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(\"transformer\")\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "transformer";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00078"] = {
			["ID"] = 78;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 1140;
			["posY"] = -990;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"nut_sweet_joy\", false)\
   addExpToPlayer(self.sweet_joy_talk_exp)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "nut_sweet_joy";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00079"] = {
			["ID"] = 79;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 1440;
			["posY"] = -90;
			["script"] = "function Condition:onCheck(name, obj)\
   local char = getObj(\"cog\")\
   if char:isInTrigger(obj) then\
      char:orientTo(getObj(self.transformer))\
      char:setHeadLookingAllowed(false)\
      char:setIgnoreSleep(false)\
      return true\
   end\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:cog_repair_wp";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00080"] = {
			["ID"] = 80;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 1440;
			["posY"] = 30;
			["script"] = "function Condition:onCheck(name, obj)\
   local char = getObj(\"nut\")\
   if char:isInTrigger(obj) then\
      char:orientTo(getObj(self.board))\
      char:setHeadLookingAllowed(false)\
      char:setIgnoreSleep(false)\
      return true\
   end\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:nut_repair_wp";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00081"] = {
			["ID"] = 81;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 2970;
			["posY"] = -120;
			["script"] = "function Condition:onCheck(name, obj)\
   local char = getObj(\"screw\")\
   if char:isInTrigger(obj) then\
      char:setState(\"talkForbidden\", false)\
      char:setIgnoreSleep(false)\
      self:setTopicVisible(\"screw_at_shop\", true)\
      return true\
   end\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:screw_in_shop_wp";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00082"] = {
			["ID"] = 82;
			["connectionsID"] = {
			};
			["event"] = "trigger_out";
			["posX"] = -90;
			["posY"] = 930;
			["script"] = "function Condition:onCheck(name, obj)\
   if getMC():isInTrigger(obj) then return false end\
   --Does not let these two to leave the trigger during fight\
   --Deaggro and return to initial wp\
   if not self:getParam(\"cog_ko\") then\
      local cog = getObj(\"cog\")\
      cog:setAttitudeToMainCharacter(\"NEUTRAL\")\
      cog.navigator:setPatrolRoute({getObj(self.cog_initial_wp)})\
   end\
   if not self:getParam(\"nut_ko\") then\
      local nut = getObj(\"nut\")\
      nut:setAttitudeToMainCharacter(\"NEUTRAL\")\
      nut.navigator:setPatrolRoute({getObj(self.nut_initial_wp)})\
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
		["condition_00083"] = {
			["ID"] = 83;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = -90;
			["posY"] = 780;
			["script"] = "function Condition:onCheck(name, obj)\
   local MC = getMC()\
   if not MC:isInTrigger(obj) then return false end\
   if not self:getParam(\"cog_ko\") then\
      local cog = getObj(\"cog\")\
      cog.navigator:setPatrolRoute(nil)\
      cog:setAttitudeToMainCharacter(\"ENEMY\")\
      cog.senseScheduler:addEnemy(MC)\
      cog:setState(\"shouldFearEnemy\", false)\
   end\
   if not self:getParam(\"nut_ko\") then\
      local nut = getObj(\"nut\")\
      nut.navigator:setPatrolRoute(nil)\
      nut:setAttitudeToMainCharacter(\"ENEMY\")\
      nut.senseScheduler:addEnemy(MC)\
      nut:setState(\"shouldFearEnemy\", false)\
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
		["condition_00084"] = {
			["ID"] = 84;
			["connectionsID"] = {
			};
			["event"] = "turnAggressive";
			["posX"] = -90;
			["posY"] = 1080;
			["script"] = "function Condition:onCheck(name, obj)\
   obj:setState(\"shouldFearEnemy\", true)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "cog, nut";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00088"] = {
			["ID"] = 88;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -1020;
			["posY"] = 570;
			["script"] = "function Condition:onCheck(name, obj)\
   removeItemFromPlayer(\"electrical_tape.itm\", 1)\
   addExpToPlayer(self.wiring_exp)\
   local ID = string.match(obj:getName(), \"%d+$\")\
   local brokenName = \"q_broken_crane_wiring_broken_\" .. ID\
   hideDisableObjectGroup(brokenName, true)\
   local fixedName = \"q_broken_crane_wiring_fixed_\" .. ID\
   showEnableObjectGroup(fixedName, true)\
   return false\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "crane_wiring_repair";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00089"] = {
			["ID"] = 89;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 210;
			["posY"] = -870;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"zaba_got_cb\", false)\
   --Allows player to talk to Waga about Zabas weakness\
   --without asking that one lore question\
   if not self:getTopicVisible(\"waga_about_zaba_bad\") then\
      self:setTopicVisible(\"waga_about_zaba\", true)\
   end\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "zaba_got_cb";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00090"] = {
			["ID"] = 90;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 1380;
			["posY"] = -900;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"carry_sweet_joy\", false)\
   addExpToPlayer(self.sweet_joy_talk_exp_traders)\
\
   self:writeLog(\"trader_sweet_joy\", obj:getLabel())\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "carry_sweet_joy";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["done"] = {
			["ID"] = 62;
			["connectionsID"] = {
				[1] = 2;
				[2] = 66;
			};
			["name"] = "done";
			["posX"] = 2280;
			["posY"] = 300;
			["script"] = "local SkySystem = (require \"environment.sky\").SkySystem\
local partial = require \"fun\".partial\
local CTime = (require \"helpers\").CTime\
\
function Step:onCheck()\
   return true\
end\
\
--Cog+Nut walk the the shop, screw is teleported there after 12 game hours\
function Step:onStart()\
   self:setTopicVisible(\"cog_repaired\", false)\
   self:setTopicVisible(\"cog_about_crane\", false)\
   self:setTopicVisible(\"scrap_master_workers_still_there\", false)\
   self:setTopicVisible(\"scrap_master_workers_coming\", true)\
\
   local cog = getObj(\"cog\")\
   local nut = getObj(\"nut\")\
   cog:setState(\"talkForbidden\", true)\
   nut:setState(\"talkForbidden\", true)\
   cog:setIgnoreSleep(true)\
   nut:setIgnoreSleep(true)\
\
   if self:getTopicVisible(\"scrap_master_self_repair_full\") then\
      cog.navigator:setPatrolRoute(table.concat(self.cog_to_shop_short_wps, \",\"))\
      nut.navigator:setPatrolRoute(table.concat(self.nut_to_shop_short_wps, \",\"))\
   else\
      cog.navigator:setPatrolRoute(table.concat(self.cog_to_shop_wps, \",\"))\
      nut.navigator:setPatrolRoute(table.concat(self.nut_to_shop_wps, \",\"))\
   end\
\
   self.q.screwCallback = SkySystem:subscribeTimePassed(CTime(12, \"gHour\"),\
      false, partial(self.q.onTimePassedScrewWakeup, self.q))\
\
   self:writeLog(\"done\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["fight"] = {
			["ID"] = 60;
			["connectionsID"] = {
				[1] = 11;
				[2] = 16;
				[3] = 18;
				[4] = 82;
				[5] = 83;
				[6] = 84;
			};
			["name"] = "fight";
			["posX"] = -360;
			["posY"] = 690;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
--Cog+Nut are aggressive, but can't be killed - only knockouted\
--Each of them stops being aggressive and damageable after knockout\
--Both of them are able to talk only after both got knocked out\
function Step:onStart()\
   self:setTopicVisible(\"cog_provoke\", false)\
   self:setTopicVisible(\"cog_waits_booze\", false)\
   self:setTopicVisible(\"cog_was_beaten\", true)\
   self:setTopicVisible(\"cog_after_fight\", true)\
   self:setTopicVisible(\"scrap_master_crane_fixed_had_fight\", true)\
   self:setTopicVisible(\"scrap_master_crane_fixed_regular\", false)\
   local nut = getObj(\"nut\")\
   local cog = getObj(\"cog\")\
   nut:setAttitudeToMainCharacter(\"ENEMY\")\
   nut:setImmortality(\"protected\")\
   cog:setAttitudeToMainCharacter(\"ENEMY\")\
   cog:setImmortality(\"protected\")\
   cog:setState(\"talkForbidden\", true)\
   nut:setState(\"talkForbidden\", true)\
\
   local MC = getMC()\
   cog.senseScheduler:addEnemy(MC)\
   nut.senseScheduler:addEnemy(MC)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["find_parts"] = {
			["ID"] = 9;
			["connectionsID"] = {
				[1] = 42;
				[2] = 44;
				[3] = 45;
				[4] = 47;
			};
			["name"] = "find_parts";
			["posX"] = 420;
			["posY"] = 300;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"cog_briefing\", false)\
   self:setTopicVisible(\"cog_about_crane\", true)\
   self:setTopicVisible(\"screw_sweet_joy\", true)\
   self:setTopicVisible(\"scrap_master_report_workers\", true)\
   self:setTopicVisible(\"scrap_master_about_crane\", true)\
   self:setTopicVisible(\"broken_crane_object_repair\", true)\
\
   if not self:getTopicVisible(\"cog_was_beaten\") then\
      self:writeLogSilent(\"cog_wasnt_beaten\")\
   end\
   self:writeLog(\"cog_briefing\")\
   if self:getTopicVisible(\"cog_was_beaten\") then\
      self:writeLogSilent(\"cog_briefing_scrap\")\
   else\
      self:writeLogSilent(\"cog_briefing_no_scrap\")\
   end\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 2790;
			["posY"] = 300;
			["script"] = "";
			["type"] = "step";
		};
		["repair_finish"] = {
			["ID"] = 51;
			["connectionsID"] = {
				[1] = 61;
			};
			["name"] = "repair_finish";
			["posX"] = 1710;
			["posY"] = 150;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
--Cog+Nut are able to talk again and go the their resting spots\
--until player tells them to go to the shop\
function Step:onStart()\
   hideDisableObjectGroup(self.transformer_group_broken, true)\
   hideDisableObjectGroup(self.board_group_broken, true)\
   showEnableObjectGroup(self.transformer_group_fixed, true)\
   showEnableObjectGroup(self.board_group_fixed, true)\
\
   local cog = getObj(\"cog\")\
   local nut = getObj(\"nut\")\
   removeItemFromObj(\"scrap_electric.itm\", cog, 5)\
   removeItemFromObj(\"electrical_tape.itm\", cog, 2)\
   removeItemFromObj(\"circuit_breaker_auto.itm\", cog, 1)\
\
   cog:setState(\"talkForbidden\", false)\
   nut:setState(\"talkForbidden\", false)\
   cog:setDefaultAnimation(\"idle\")\
   nut:setDefaultAnimation(\"idle\")\
   cog:setHeadLookingAllowed(true)\
   nut:setHeadLookingAllowed(true)\
\
   cog.navigator:setPatrolRoute(self.cog_rest_wp)\
   nut.navigator:setPatrolRoute(self.nut_rest_wp)\
\
   self:setTopicVisible(\"cog_about_crane\", false)\
   self:setTopicVisible(\"cog_repaired\", true)\
   self:setTopicVisible(\"scrap_master_report_workers\", false)\
   self:setTopicVisible(\"scrap_master_sweet_joy\", false)\
   self:setTopicVisible(\"scrap_master_crane_fixed\", true)\
\
   self:writeLog(\"repair_finish\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["self_repair_1"] = {
			["ID"] = 46;
			["connectionsID"] = {
				[1] = 48;
				[2] = 49;
			};
			["name"] = "self_repair_1";
			["posX"] = 1200;
			["posY"] = 450;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"cog_give_parts\", false)\
   self:setTopicVisible(\"cog_self_repair\", true)\
\
   self:writeLog(\"self_repair_1\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["self_repair_full"] = {
			["ID"] = 50;
			["connectionsID"] = {
				[1] = 61;
			};
			["name"] = "self_repair_full";
			["posX"] = 1710;
			["posY"] = 450;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"cog_self_repair\", false)\
   self:setTopicVisible(\"cog_self_repair_full\", true)\
   self:setTopicVisible(\"scrap_master_self_repair_full\", true)\
   self:setTopicVisible(\"scrap_master_report_workers\", false)\
   self:setTopicVisible(\"scrap_master_sweet_joy\", false)\
   self:setTopicVisible(\"scrap_master_crane_fixed\", true)\
   self:setTopicVisible(\"scrap_master_crane_fixed_had_fight\", false)\
   self:setTopicVisible(\"scrap_master_crane_fixed_regular\", false)\
   self:setTopicVisible(\"scrap_master_crane_fixed_by_self\", true)\
\
   self:writeLog(\"self_repair_full\")\
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
				[1] = 8;
				[2] = 11;
				[3] = 12;
				[4] = 15;
			};
			["name"] = "start";
			["posX"] = -900;
			["posY"] = 300;
			["script"] = "";
			["type"] = "step";
		};
		["wait_repair"] = {
			["ID"] = 43;
			["connectionsID"] = {
				[1] = 51;
				[2] = 79;
				[3] = 80;
			};
			["name"] = "wait_repair";
			["posX"] = 1200;
			["posY"] = 150;
			["script"] = "local SkySystem = (require \"environment.sky\").SkySystem\
local partial = require \"fun\".partial\
local CTime = (require \"helpers\").CTime\
\
function Step:onCheck()\
   return true\
end\
\
--Cog+Nut stop talking, go to the broken objects and play an animation for the next 24 game hours\
function Step:onStart()\
   self.q.repairCallback = SkySystem:subscribeTimePassed(CTime(24, \"gHour\"),\
   false, partial(self.q.onTimePassedRepair, self.q))\
   local cog = getObj(\"cog\")\
   local nut = getObj(\"nut\")\
   cog:setState(\"talkForbidden\", true)\
   nut:setState(\"talkForbidden\", true)\
   cog:setIgnoreSleep(true)\
   nut:setIgnoreSleep(true)\
   cog.navigator:setPatrolRoute(table.concat(self.cog_repair_wps, \",\"))\
   nut.navigator:setPatrolRoute(table.concat(self.nut_repair_wps, \",\"))\
   cog:setDefaultAnimation(\"idle_search\")\
   nut:setDefaultAnimation(\"idle_search\")\
\
   self:setTopicVisible(\"broken_crane_object_repair\", false)\
\
   self:writeLog(\"wait_repair\")\
end\
\
function Step:onFinish()\
end\
";
			["type"] = "step";
		};
	};
	["script"] = "local SkySystem = (require \"environment.sky\").SkySystem\
local partial = require \"fun\".partial\
local CTime = (require \"helpers\").CTime\
local tablex = require \"pl.tablex\"\
\
function Quest:onCreate()\
   --EXP\
   self:declareVar(\"sweet_joy_talk_exp\", 25)\
   self:declareVar(\"sweet_joy_talk_exp_traders\", 50)\
   self:declareVar(\"sweet_joy_talk_exp_waga\", 75)\
   self:declareVar(\"sweet_joy_talk_exp_zaba\", 150)\
   self:declareVar(\"zabas_weakness_exp\", 50)\
   self:declareVar(\"knockout_exp\", 25)\
   self:declareVar(\"booze_exp\", 15)\
   self:declareVar(\"cb_buy_price_small\", 150)\
   self:declareVar(\"cb_buy_price_medium\", 100)\
   self:declareVar(\"cb_buy_price_big\", 50)\
   self:declareVar(\"wiring_exp\", 50)\
\
   --TOPICS\
   self:setTopicVisible(\"scrap_master_start\", true)\
   self:setTopicVisible(\"scrap_master_about_crane\", false)\
   self:setTopicVisible(\"scrap_master_report_workers\", false)\
   self:setTopicVisible(\"scrap_master_crane_fixed\", false)\
   self:setTopicVisible(\"scrap_master_crane_fixed_by_self\", false)\
   self:setTopicVisible(\"scrap_master_crane_fixed_had_fight\", false)\
   self:setTopicVisible(\"scrap_master_crane_fixed_regular\", true)\
   self:setTopicVisible(\"scrap_master_workers_still_there\", true)\
   self:setTopicVisible(\"scrap_master_workers_coming\", false)\
   self:setTopicVisible(\"scrap_master_finish_armor\", true)\
   self:setTopicVisible(\"scrap_master_finish_ammo\", true)\
   self:setTopicVisible(\"scrap_master_quest_finished\", false)\
\
   self:setTopicVisible(\"cog_intro\", true)\
   self:setTopicVisible(\"cog_regular_greeting\", false)\
   self:setTopicVisible(\"cog_scrap_master_sent_me\", false)\
   self:setTopicVisible(\"cog_wants_booze\", true)\
   self:setTopicVisible(\"cog_waits_booze\", false)\
   self:setTopicVisible(\"cog_give_booze\", true)\
   self:setTopicVisible(\"nut_give_booze\", false)\
   self:setTopicVisible(\"cog_provoke\", false)\
   self:setTopicVisible(\"cog_got_booze\", false)\
   self:setTopicVisible(\"cog_was_beaten\", false)\
   self:setTopicVisible(\"cog_after_fight\", false)\
   self:setTopicVisible(\"cog_briefing\", true)\
   self:setTopicVisible(\"cog_about_crane\", false)\
   self:setTopicVisible(\"cog_repaired\", false)\
   self:setTopicVisible(\"cog_give_parts\", true)\
   self:setTopicVisible(\"cog_start_repair\", true)\
   self:setTopicVisible(\"cog_self_repair\", false)\
   self:setTopicVisible(\"cog_self_repair_full\", false)\
\
   self:setTopicVisible(\"screw_sweet_joy\", false)\
   self:setTopicVisible(\"screw_sweet_joy_2\", false)\
   self:setTopicVisible(\"nut_sweet_joy\", false)\
   self:setTopicVisible(\"scrap_master_sweet_joy\", false)\
   self:setTopicVisible(\"cog_sweet_joy\", false)\
   self:setTopicVisible(\"zaba_sweet_joy\", false)\
   self:setTopicVisible(\"waga_sweet_joy\", false)\
   self:setTopicVisible(\"braga_sweet_joy\", false)\
   self:setTopicVisible(\"carry_sweet_joy\", false)\
   self:setTopicVisible(\"ragpicker_sweet_joy\", false)\
\
   self:setTopicVisible(\"zaba_never_bought\", true)\
   self:setTopicVisible(\"zaba_about_waga\", true)\
   --cb - circuit breaker\
   self:setTopicVisible(\"zaba_about_cb\", false)\
   self:setTopicVisible(\"zaba_got_cb\", true)\
   self:setTopicVisible(\"zaba_cb_negotiate_small\", false)\
   self:setTopicVisible(\"zaba_cb_negotiate_medium\", true)\
   self:setTopicVisible(\"zaba_cb_negotiate_big\", true)\
   self:setTopicVisible(\"zaba_cb_negotiate_fluff\", true)\
   self:setTopicVisible(\"zaba_cb_buy_small\", false)\
   self:setTopicVisible(\"zaba_cb_buy_medium\", false)\
   self:setTopicVisible(\"zaba_cb_buy_big\", false)\
   self:setTopicVisible(\"zaba_cb_no_money\", false)\
\
   self:setTopicVisible(\"waga_about_zaba\", false)\
   self:setTopicVisible(\"waga_about_zaba_bad\", false)\
   self:setTopicVisible(\"waga_about_zabas_weakness\", true)\
\
   --talking with CRigidTalker objects\
   self:setTopicVisible(\"transformer\", true)\
   self:setTopicVisible(\"broken_crane_object_repair\", false)\
   self:setTopicVisible(\"self_repair_transformer\", true)\
   self:setTopicVisible(\"self_repair_board\", true)\
   self:setTopicVisible(\"crane_wiring_repair\", true)\
\
   self:setTopicVisible(\"cog_at_shop\", false)\
   --self:setTopicVisible(\"nut_at_shop\", false)\
   self:setTopicVisible(\"screw_at_shop\", false)\
\
   --VARS\
   self:setParam(\"cog_ko\", false)\
   self:setParam(\"nut_ko\", false)\
   self:setParam(\"cog_booze_needed\", 2)\
\
   self:declareVar(\"transformer_group_broken\", \"q_broken_crane_transformer_broken\")\
   self:declareVar(\"transformer_group_fixed\", \"q_broken_crane_transformer_fixed\")\
   self:declareVar(\"board_group_broken\", \"q_broken_crane_distributionboard_broken\")\
   self:declareVar(\"board_group_fixed\", \"q_broken_crane_distributionboard_fixed\")\
   self:declareVar(\"transformer\", \"q_broken_crane_transformer\")\
   self:declareVar(\"board\", \"q_broken_crane_distributionboard\")\
\
   self:declareVar(\"cog_rest_wp\", \"q_broken_crane_cog_rest_wp\")\
   self:declareVar(\"nut_rest_wp\", \"q_broken_crane_nut_rest_wp\")\
\
   self:declareVar(\"arena_trigger\", \"q_broken_crane_arena_trigger\")\
   self:declareVar(\"cog_initial_wp\", \"q_broken_crane_cog_initial_wp\")\
   self:declareVar(\"nut_initial_wp\", \"q_broken_crane_nut_initial_wp\")\
\
   getScene():subscribeOnLocationEnter(self.onLocationEnter, self)\
end\
\
function Quest:onLocationEnter()\
   self:declareVar(\"cog_repair_wps\", getObjectsInGroupOrdered(\"q_broken_crane_cog_repair_wps\"))\
   self:declareVar(\"cog_repair_wp\", self.cog_repair_wps[#self.cog_repair_wps])\
   self:declareVar(\"nut_repair_wps\", getObjectsInGroupOrdered(\"q_broken_crane_nut_repair_wps\"))\
   self:declareVar(\"nut_repair_wp\", self.nut_repair_wps[#self.nut_repair_wps])\
\
   self:declareVar(\"cog_to_shop_wps\", getObjectsInGroupOrdered(\"q_broken_crane_cog_to_shop_wps\"))\
   self:declareVar(\"cog_in_shop_wp\", self.cog_to_shop_wps[#self.cog_to_shop_wps])\
   self:declareVar(\"nut_to_shop_wps\", getObjectsInGroupOrdered(\"q_broken_crane_nut_to_shop_wps\"))\
   self:declareVar(\"nut_in_shop_wp\", self.nut_to_shop_wps[#self.nut_to_shop_wps])\
   self:declareVar(\"screw_to_shop_wps\", getObjectsInGroupOrdered(\"q_broken_crane_screw_to_shop_wps\"))\
   self:declareVar(\"screw_in_shop_wp\", self.screw_to_shop_wps[#self.screw_to_shop_wps])\
\
   --Cut first crane section off from to shop wps\
   self:declareVar(\"cog_to_shop_short_wps\", tablex.copy(self.cog_to_shop_wps))\
   self:declareVar(\"nut_to_shop_short_wps\", tablex.copy(self.nut_to_shop_wps))\
   for _=1,8 do\
      table.remove(self.cog_to_shop_short_wps, 1)\
   end\
   for _=1,4 do\
      table.remove(self.nut_to_shop_short_wps, 1)\
   end\
end\
\
function Quest:onStart()\
   self:setTopicVisible(\"scrap_master_start\", false)\
   self:setTopicVisible(\"cog_scrap_master_sent_me\", true)\
   self:setTopicVisible(\"cog_provoke\", true)\
end\
\
function Quest:onFinish()\
   self:disable_sweet_joy_topics()\
   self:setTopicVisible(\"scrap_master_about_crane\", false)\
   self:setTopicVisible(\"scrap_master_quest_finished\", true)\
\
   if not self:getTopicVisible(\"cog_was_beaten\") then\
      addItemToPlayer(\"porter.itm\", 1)\
      self:writeLog(\"finish_cog_wasnt_beaten\")\
   else\
      self:writeLog(\"finish_cog_was_beaten\")\
   end\
\
   if self:getTopicVisible(\"scrap_master_crane_fixed_by_self\") then\
      addItemToPlayer(\"scrap_electric.itm\", 4)\
      self:writeLog(\"finish_self_repair\")\
   else\
      self:writeLog(\"finish_workers_repair\")\
   end\
end\
\
function Quest:OnSaveState(state)\
   if self.repairCallback then\
      state.repairTime = self.repairCallback.targetTime:getAs(\"gSecond\")\
   end\
   if self.screwCallback then\
      state.screwWakeupTime = self.screwCallback.targetTime:getAs(\"gSecond\")\
   end\
end\
\
function Quest:OnLoadState(state)\
   if state.repairTime then\
      self.repairCallback = SkySystem:subscribeDayTime(CTime(state.repairTime, \"gSecond\"),\
         false, partial(self.onTimePassedRepair, self))\
   end\
   if state.screwWakeupTime then\
      self.screwCallback = SkySystem:subscribeDayTime(CTime(state.screwWakeupTime, \"gSecond\"),\
         false, partial(self.onTimePassedScrewWakeup, self))\
   end\
end\
\
function Quest:disable_sweet_joy_topics()\
   self:setTopicVisible(\"screw_sweet_joy\", false)\
   self:setTopicVisible(\"screw_sweet_joy_2\", false)\
   self:setTopicVisible(\"nut_sweet_joy\", false)\
   self:setTopicVisible(\"scrap_master_sweet_joy\", false)\
   self:setTopicVisible(\"cog_sweet_joy\", false)\
   self:setTopicVisible(\"waga_sweet_joy\", false)\
   self:setTopicVisible(\"braga_sweet_joy\", false)\
   self:setTopicVisible(\"carry_sweet_joy\", false)\
   self:setTopicVisible(\"ragpicker_sweet_joy\", false)\
   self:setTopicVisible(\"zaba_sweet_joy\", false)\
end\
\
function Quest:onTimePassedRepair()\
   self.repairCallback = nil\
   self:goToStep(\"repair_finish\")\
end\
\
function Quest:onTimePassedScrewWakeup()\
   self.screwCallback = nil\
   local screw = getObj(\"screw\")\
   screw:setState(\"talkForbidden\", true)\
   screw:setDefaultAnimation(\"idle\")\
   screw:setHeadLookingAllowed(true)\
   screw:setIgnoreSleep(true)\
   screw.navigator:setPatrolRoute(table.concat(self.screw_to_shop_wps, \",\"))\
end\
\
\
function Quest:getTopicVisible_cog_give_booze()\
   return hasPlayerItem(\"booze_cold.itm\", self:getParam(\"cog_booze_needed\"))\
end\
\
function Quest:getTopicVisible_nut_give_booze()\
   return hasPlayerItem(\"booze_cold.itm\", 1)\
end\
\
function Quest:getTopicVisible_zaba_cb_buy_small()\
   return hasPlayerItem(\"antigravium_shards.itm\", 150)\
end\
\
function Quest:getTopicVisible_zaba_cb_buy_medium()\
   return hasPlayerItem(\"antigravium_shards.itm\", 300)\
end\
\
function Quest:getTopicVisible_zaba_cb_buy_big()\
   return hasPlayerItem(\"antigravium_shards.itm\", 400)\
end\
\
function Quest:getTopicVisible_cog_give_parts()\
   if self:getTopicVisible(\"cog_got_booze\") then\
      return hasPlayerItem(\"electrical_tape.itm\", 2) and hasPlayerItem(\"circuit_breaker_auto.itm\", 1)\
   else\
      return hasPlayerItem(\"electrical_tape.itm\", 2) and hasPlayerItem(\"circuit_breaker_auto.itm\", 1)\
         and hasPlayerItem(\"scrap_electric.itm\", 5)\
   end\
end\
\
function Quest:getTopicVisible_self_repair_transformer()\
   return hasPlayerItem(\"electrical_tape.itm\", 2) and hasPlayerItem(\"scrap_electric.itm\", 9)\
end\
\
function Quest:getTopicVisible_self_repair_board()\
   return hasPlayerItem(\"circuit_breaker_auto.itm\", 1)\
end\
\
function Quest:getTopicVisible_crane_wiring_repair()\
   return hasPlayerItem(\"electrical_tape.itm\", 1)\
end\
";
	["title"] = "Broken Crane";
}
return obj1
