-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 2;
		["connectID"] = 2;
		["posX"] = -420;
		["posY"] = 120;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 55;
		["posX"] = -30;
		["posY"] = -90;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["connectID"] = 5;
		["posX"] = -30;
		["posY"] = 300;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["animation"] = "dl_talk_1";
		["connectID"] = 10;
		["posX"] = 1230;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Hey, what's there behind that door?";
		["time"] = 4;
		["topic"] = "ragpicker_heist:bamba_start";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 2;
		["animation"] = "dl_talk_3";
		["connectID"] = 11;
		["posX"] = 1230;
		["posY"] = 780;
		["script"] = "";
		["text"] = "What do you want, huma?";
		["time"] = 3.5;
		["topic"] = "ragpicker_heist:bamba_regular_greeting";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["animation"] = "dl_talk_2";
		["connectID"] = 11;
		["posX"] = 2040;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Actually, I do. If you are dead set on checking out the warehouse, you better go talk to its owner.";
		["time"] = 11;
		["topic"] = "ragpicker_heist:bamba_start";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["connectID"] = 76;
		["posX"] = 1470;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Ragpicker and Drymeat's warehouses, and it's none of your business what else.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["animation"] = "dl_talk_3";
		["connectID"] = 125;
		["posX"] = 3360;
		["posY"] = -120;
		["script"] = "";
		["text"] = "Hey, it's guard armor you're wearing, isn't it?";
		["time"] = 5;
		["topic"] = "ragpicker_heist:bamba_side_job";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 1;
		["posX"] = 3150;
		["posY"] = 870;
		["script"] = "";
		["text"] = "So long.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 2;
		["animation"] = "dl_hand_negative";
		["connectID"] = 15;
		["posX"] = 4170;
		["posY"] = -120;
		["script"] = "";
		["text"] = "It's none of your damn business. I am where I'm supposed to be.";
		["time"] = 7.5;
		["topic"] = "ragpicker_heist:bamba_side_job";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["connectID"] = 11;
		["posX"] = 5430;
		["posY"] = 420;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 17;
		["posX"] = 3360;
		["posY"] = 90;
		["script"] = "";
		["text"] = "You're not exactly the chatty type, are you? How about a bottle of booze to get you talking?";
		["time"] = 10;
		["topic"] = "ragpicker_heist:bamba_drink";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 15;
		["posX"] = 3630;
		["posY"] = 90;
		["script"] = "";
		["text"] = "No, huma. I don't drink on the job. You'd be wrong to assume we're all winos here like those scrapbreakers.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["animation"] = "dl_talk_2";
		["connectID"] = 15;
		["posX"] = 3630;
		["posY"] = 240;
		["script"] = "";
		["text"] = "And then I'll be the one to pay for the wares you stole. Better forget it.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 1;
		["animation"] = "dl_talk_3";
		["connectID"] = 18;
		["posX"] = 3360;
		["posY"] = 240;
		["script"] = "";
		["text"] = "What do you say to me giving you some shards for letting me into the warehouse?";
		["time"] = 9;
		["topic"] = "ragpicker_heist:bamba_bribe";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["animation"] = "dl_frustration";
		["connectID"] = 69;
		["posX"] = 1230;
		["posY"] = 90;
		["script"] = "";
		["text"] = "Leave me alone!";
		["time"] = 2.5;
		["topic"] = "ragpicker_heist:bamba_beaten";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 2;
		["connectID"] = 23;
		["posX"] = 1260;
		["posY"] = -960;
		["script"] = "";
		["text"] = "Huma, any idea what happened here?";
		["time"] = 4;
		["topic"] = "ragpicker_heist:bamba_electrocuted";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 24;
		["posX"] = 1500;
		["posY"] = -960;
		["script"] = "";
		["text"] = "Not at all — wait, something happened?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["animation"] = "dl_frustration";
		["connectID"] = 114;
		["posX"] = 1740;
		["posY"] = -960;
		["script"] = "";
		["text"] = "I almost got electrocuted by that damn wire! How could you miss it?";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 2;
		["animation"] = "dl_talk_2";
		["connectID"] = 27;
		["posX"] = 1260;
		["posY"] = -1170;
		["script"] = "";
		["text"] = "The hell you doing here?";
		["time"] = 3.5;
		["topic"] = "ragpicker_heist:bamba_door_1_unlocked";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 1;
		["animation"] = "dl_talk_3";
		["connectID"] = 63;
		["posX"] = 1500;
		["posY"] = -1170;
		["script"] = "";
		["text"] = "Saw you lying here. Thought I'd call someone to help.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["connectID"] = 30;
		["posX"] = 1200;
		["posY"] = -1710;
		["script"] = "";
		["text"] = "Halt! The hell you doing on private property?";
		["time"] = 5;
		["topic"] = "ragpicker_heist:bamba_search";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 2;
		["animation"] = "dl_talk_2";
		["connectID"] = 121;
		["posX"] = 1440;
		["posY"] = -1710;
		["script"] = "";
		["text"] = "I'll have to call the boss now.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 1;
		["animation"] = "dl_hand_negative";
		["connectID"] = 41;
		["posX"] = 1860;
		["posY"] = -2040;
		["script"] = "";
		["text"] = "You wish! I'll shut you up with my fist then, you dirty abori!";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 105;
		["posX"] = 1860;
		["posY"] = -1800;
		["script"] = "";
		["text"] = "I've got a better idea: I'll part with some of this antigravium here if you pretend you never saw me here. We good?";
		["time"] = 12.5;
		["topic"] = "ragpicker_heist:bamba_search_bribe";
		["topic_check_visible"] = false;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 1;
		["animation"] = "dl_point_self";
		["connectID"] = 108;
		["h"] = 90;
		["posX"] = 1860;
		["posY"] = -1410;
		["script"] = "";
		["text"] = "I'd rather call your boss myself!";
		["time"] = 4;
		["topic"] = "ragpicker_heist:bamba_search_jack_calls_ragpicker";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
		["w"] = 210;
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["connectID"] = 145;
		["posX"] = 2880;
		["posY"] = -1890;
		["script"] = "";
		["text"] = "I'm done. I'm quitting. I'm fed up with this job. First, they make you shuffle wares around ten times a day, then you begin sweeping floors at the warehouse, and the next thing you know is you're setting up traps for bugs.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00040"] = {
		["ID"] = 40;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["connectID"] = 121;
		["posX"] = 2880;
		["posY"] = -1740;
		["script"] = "";
		["text"] = "Well, then I'll have to call Ragpicker.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 2;
		["posX"] = 2100;
		["posY"] = -2040;
		["script"] = "";
		["text"] = "We'll see whose fist goes where, pinkskin!";
		["time"] = 4.5;
		["topic"] = "ragpicker_heist:bamba_search_provoke";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 1;
		["posX"] = 390;
		["posY"] = -210;
		["script"] = "function message:onStart()\
   questSystem:fireEvent(\"turnAggressive\", \"bamba\", getObj(\"bamba\"))\
   getObj(\"bamba\"):hit(200, getMC())\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "KO";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 1;
		["posX"] = 390;
		["posY"] = -30;
		["script"] = "";
		["text"] = "Bye";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["posX"] = 1860;
		["posY"] = -2190;
		["script"] = "";
		["text"] = "Fine, let's do it your way — go call your boss. I'll be talking to him.";
		["time"] = 9;
		["topic"] = "ragpicker_heist:bamba_search_call_ragpicker";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 2;
		["connectID"] = 62;
		["posX"] = 1230;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Hey, it's that bastard!";
		["time"] = 3;
		["topic"] = "ragpicker_heist:bamba_cave_attack";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 2;
		["animation"] = "dl_hand_negative";
		["posX"] = 1500;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Get him!";
		["time"] = 2;
		["topic"] = "ragpicker_heist:bamba_cave_attack";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStop";
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 2;
		["animation"] = "dl_frustration";
		["h"] = 120;
		["posX"] = 1770;
		["posY"] = -1170;
		["script"] = "";
		["text"] = "Cut the smooth talk! I can see you swiped something from the warehouse! Thinking you'll get away with it would be a big mistake. The guards will deal with you now.";
		["time"] = 16.5;
		["topic"] = "ragpicker_heist:bamba_door_1_unlocked_stealing";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
		["w"] = 240;
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 2;
		["animation"] = "dl_hands_dontknow";
		["connectID"] = 65;
		["posX"] = 1260;
		["posY"] = -780;
		["script"] = "";
		["text"] = "The hell was that, huma?";
		["time"] = 3.5;
		["topic"] = "ragpicker_heist:bamba_about_perverts";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00065"] = {
		["ID"] = 65;
		["actor"] = 2;
		["animation"] = "dl_talk_3";
		["connectID"] = 66;
		["posX"] = 1500;
		["posY"] = -780;
		["script"] = "";
		["text"] = "What if I tell Ragpicker the truth?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00066"] = {
		["ID"] = 66;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 124;
		["posX"] = 1740;
		["posY"] = -780;
		["script"] = "";
		["text"] = "What if I really have the hots for you? And I'm willing to lie just to get into your graces?";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 70;
		["posX"] = 3360;
		["posY"] = -300;
		["script"] = "";
		["text"] = "The dummies on the tower where you're supposed to keep watch aren't there anymore. Are you going to keep standing here or what?";
		["time"] = 12.5;
		["topic"] = "ragpicker_heist:bamba_dummy_destroyed";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00070"] = {
		["ID"] = 70;
		["actor"] = 2;
		["animation"] = "dl_frustration";
		["connectID"] = 134;
		["posX"] = 3630;
		["posY"] = -300;
		["script"] = "";
		["text"] = "How could that ngongo Popped Eye let it happen?! Did he finally drink his mind away for good?";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00076"] = {
		["ID"] = 76;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 9;
		["posX"] = 1740;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Mind if I take a peek?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00105"] = {
		["ID"] = 105;
		["actor"] = 2;
		["animation"] = "dl_talk_3";
		["connectID"] = 38;
		["posX"] = 2130;
		["posY"] = -1800;
		["script"] = "";
		["text"] = "Fine. Cough up 500 antigravium, and I'll go blind for a little while.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00106"] = {
		["ID"] = 106;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 39;
		["posX"] = 2610;
		["posY"] = -1890;
		["script"] = "";
		["text"] = "\\[Give 500 Antigravium Shards]Here you go.";
		["time"] = 4;
		["topic"] = "ragpicker_heist:bamba_search_bribe";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00107"] = {
		["ID"] = 107;
		["actor"] = 1;
		["animation"] = "dl_hands_dontknow";
		["connectID"] = 40;
		["posX"] = 2610;
		["posY"] = -1740;
		["script"] = "";
		["text"] = "I don't have this kind of money.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00108"] = {
		["ID"] = 108;
		["actor"] = 1;
		["animation"] = "dl_frustration";
		["h"] = 90;
		["posX"] = 2130;
		["posY"] = -1410;
		["script"] = "";
		["text"] = "Help! They locked me up! I can't get out!";
		["time"] = 5.5;
		["topic"] = "ragpicker_heist:bamba_search_jack_calls_ragpicker";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStop";
		["type"] = "message";
		["w"] = 210;
	};
	["message_00114"] = {
		["ID"] = 114;
		["actor"] = 1;
		["animation"] = "dl_hands_dontknow";
		["posX"] = 1980;
		["posY"] = -960;
		["script"] = "";
		["text"] = "Haven't seen nothing. Not my job to keep an eye on what's going on here.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00118"] = {
		["ID"] = 118;
		["actor"] = 1;
		["animation"] = "dl_hand_negative";
		["connectID"] = 119;
		["posX"] = 3360;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Being nice doesn't seem to be getting me anywhere. Guess I'll have to give you a good kicking.";
		["time"] = 10;
		["topic"] = "ragpicker_heist:bamba_provoke";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00119"] = {
		["ID"] = 119;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["connectID"] = 144;
		["posX"] = 3630;
		["posY"] = 420;
		["script"] = "";
		["text"] = "You got a lot of nerve provoking me like that, huma.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00122"] = {
		["ID"] = 122;
		["actor"] = 1;
		["connectID"] = 123;
		["posX"] = 1860;
		["posY"] = -1590;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return false\
end\
\
";
		["text"] = "[HIDDEN]Silver tongue";
		["time"] = 2;
		["topic"] = "ragpicker_heist:bamba_search_convince";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00123"] = {
		["ID"] = 123;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["posX"] = 2130;
		["posY"] = -1590;
		["script"] = "";
		["text"] = "OK, you can go huma.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00124"] = {
		["ID"] = 124;
		["actor"] = 2;
		["animation"] = "dl_hand_negative";
		["connectID"] = 133;
		["posX"] = 2010;
		["posY"] = -780;
		["script"] = "";
		["text"] = "Yuck! Get lost, you creep!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00125"] = {
		["ID"] = 125;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["connectID"] = 126;
		["posX"] = 3630;
		["posY"] = -120;
		["script"] = "";
		["text"] = "It is. What the hell do you care, huma?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00126"] = {
		["ID"] = 126;
		["actor"] = 1;
		["connectID"] = 14;
		["posX"] = 3900;
		["posY"] = -120;
		["script"] = "";
		["text"] = "It's odd, then, to see you neither guard the gate or the wall nor patrol the area, but rather hang around some private warehouse.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00133"] = {
		["ID"] = 133;
		["actor"] = 2;
		["animation"] = "dl_hand_chopfast";
		["connectID"] = 143;
		["posX"] = 2280;
		["posY"] = -780;
		["script"] = "";
		["text"] = "You're going to make people think I'm a dirty huma lover!";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00134"] = {
		["ID"] = 134;
		["actor"] = 2;
		["animation"] = "dl_cut_throat";
		["posX"] = 3900;
		["posY"] = -300;
		["script"] = "";
		["text"] = "I know what you're thinking, huma. Here's a warning: you get into the warehouse, I break your neck!";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00135"] = {
		["ID"] = 135;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["posX"] = 1260;
		["posY"] = -480;
		["script"] = "";
		["text"] = "Now you're going to keep on annoying me here too, huh? Piss off, huma.";
		["time"] = 8;
		["topic"] = "ragpicker_heist:bamba_tower_bribed";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00136"] = {
		["ID"] = 136;
		["actor"] = 2;
		["colors"] = {
			[4] = {
				[1] = 255;
				[2] = 128;
				[3] = 64;
				[4] = 255;
			};
			[6] = {
				[1] = 255;
				[2] = 128;
				[3] = 64;
				[4] = 255;
			};
		};
		["posX"] = 1260;
		["posY"] = -630;
		["script"] = "";
		["text"] = "Бамба подкуплен, стоит вместе с Popped Eye на вышке. Далее при попытке вступить с ним в диалог отвечает \"Отвали от меня!\" (21)";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00139"] = {
		["ID"] = 139;
		["actor"] = 2;
		["posX"] = 1260;
		["posY"] = -180;
		["script"] = "";
		["text"] = "Get out of here before I've thrown you off the tower!";
		["time"] = 6.5;
		["topic"] = "ragpicker_heist:bamba_tower_dummies_destroyed";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00142"] = {
		["ID"] = 142;
		["actor"] = 2;
		["colors"] = {
			[4] = {
				[1] = 255;
				[2] = 128;
				[3] = 64;
				[4] = 255;
			};
			[6] = {
				[1] = 255;
				[2] = 128;
				[3] = 64;
				[4] = 255;
			};
		};
		["posX"] = 1260;
		["posY"] = -330;
		["script"] = "";
		["text"] = "Джек сообщил Бамбе, что чучела разрушены и пришел на вышку. Далее при попытке вступить с ним в диалог отвечает \"Отвали от меня!\" (21)";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00143"] = {
		["ID"] = 143;
		["actor"] = 2;
		["animation"] = "dl_hand_chopfast";
		["posX"] = 2550;
		["posY"] = -780;
		["script"] = "";
		["text"] = "Off with you, damn pinkskin! Get out of my face!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00144"] = {
		["ID"] = 144;
		["actor"] = 2;
		["animation"] = "dl_clench_fist";
		["posX"] = 3900;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Better be ready to find your teeth on the ground.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00145"] = {
		["ID"] = 145;
		["actor"] = 2;
		["animation"] = "dl_talk_2";
		["posX"] = 3150;
		["posY"] = -1890;
		["script"] = "";
		["text"] = "The owner is welcome to take over doing this stuff now.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["switch_00002"] = {
		["ID"] = 2;
		["connectionsID"] = {
			[1] = 3;
			[2] = 4;
		};
		["posX"] = -180;
		["posY"] = 120;
		["type"] = "switch";
	};
	["switch_00005"] = {
		["ID"] = 5;
		["connectionsID"] = {
			[1] = 29;
			[2] = 26;
			[3] = 22;
			[4] = 64;
			[5] = 135;
			[6] = 139;
			[7] = 21;
			[8] = 61;
			[9] = 6;
			[10] = 8;
		};
		["h"] = 240;
		["posX"] = 1020;
		["posY"] = 420;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00011"] = {
		["ID"] = 11;
		["connectionsID"] = {
			[1] = 20;
			[2] = 13;
		};
		["posX"] = 3000;
		["posY"] = 780;
		["type"] = "switch";
	};
	["switch_00020"] = {
		["ID"] = 20;
		["connectionsID"] = {
			[1] = 69;
			[2] = 12;
			[3] = 16;
			[4] = 19;
			[5] = 118;
		};
		["h"] = 140;
		["name"] = "heist";
		["posX"] = 3150;
		["posY"] = 60;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00038"] = {
		["ID"] = 38;
		["connectionsID"] = {
			[1] = 106;
			[2] = 107;
		};
		["posX"] = 2400;
		["posY"] = -1800;
		["type"] = "switch";
	};
	["switch_00055"] = {
		["ID"] = 55;
		["connectionsID"] = {
			[1] = 56;
			[2] = 57;
		};
		["posX"] = 240;
		["posY"] = -90;
		["type"] = "switch";
	};
	["switch_00121"] = {
		["ID"] = 121;
		["connectionsID"] = {
			[1] = 58;
			[2] = 33;
			[3] = 34;
			[4] = 122;
			[5] = 36;
		};
		["h"] = 140;
		["name"] = "heist_search";
		["posX"] = 1680;
		["posY"] = -1740;
		["type"] = "switch";
		["w"] = 100;
	};
}
local obj2 = {
	["actor_prefab"] = {
		[1] = "human_male";
		[2] = "abori";
	};
}
return obj1 ,obj2
