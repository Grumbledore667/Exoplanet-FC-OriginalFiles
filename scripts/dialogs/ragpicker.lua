-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 2;
		["posX"] = -2880;
		["posY"] = 120;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 7;
		["posX"] = 1230;
		["posY"] = -720;
		["script"] = "";
		["text"] = "Hey, these clothes are mine!";
		["time"] = 3.5;
		["topic"] = "my_clothes:ragpicker_my_clothes";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = -1320;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Oh, a new face! Well, I hope you have some shards in your pockets. Otherwise don't just stand here and scare away my customers.";
		["time"] = 13;
		["topic"] = "ragpicker_heist:ragpicker_first_greeting";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 2;
		["connectID"] = 8;
		["posX"] = 1470;
		["posY"] = -720;
		["script"] = "";
		["text"] = "Yeah, those look like they were made for you! 200 shards each and they're yours.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["animation"] = "dl_frustration";
		["connectID"] = 9;
		["posX"] = 1710;
		["posY"] = -720;
		["script"] = "";
		["text"] = "Bollocks!";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 10;
		["posX"] = 1950;
		["posY"] = -720;
		["script"] = "";
		["text"] = "No, this is called capitalism, huma.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 1;
		["animation"] = "dl_clench_fist";
		["connectID"] = 20;
		["posX"] = 2370;
		["posY"] = -570;
		["script"] = "";
		["text"] = "\\[Provoke]Try to stop me from taking my shit back! I'll beat you up if I have to.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["connectID"] = 60;
		["posX"] = 2370;
		["posY"] = -420;
		["script"] = "";
		["text"] = "\\[BACK].";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 1;
		["connectID"] = 326;
		["posX"] = 2370;
		["posY"] = -960;
		["script"] = "";
		["text"] = "How much do you want for the clothes?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 3090;
		["posY"] = -1320;
		["script"] = "";
		["text"] = "\\[Give 400 Antigravium Shards] I'll take everything.";
		["time"] = 4.5;
		["topic"] = "my_clothes:ragpicker_buy_all";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 3090;
		["posY"] = -1170;
		["script"] = "";
		["text"] = "\\[Give 200 Antigravium Shards] Give me my shirt back.";
		["time"] = 5.5;
		["topic"] = "my_clothes:ragpicker_buy_shirt";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 3090;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "\\[Give 200 Antigravium Shards] Give me my pants back.";
		["time"] = 5.5;
		["topic"] = "my_clothes:ragpicker_buy_pants";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 1;
		["connectID"] = 10;
		["posX"] = 3090;
		["posY"] = -720;
		["script"] = "";
		["text"] = "\\[BACK] I need to think about it.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["connectID"] = 33;
		["posX"] = 3360;
		["posY"] = -1170;
		["script"] = "";
		["text"] = "Come again.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["posX"] = 2610;
		["posY"] = -570;
		["script"] = "";
		["text"] = "Last person who tried to rob me ended up dead.";
		["time"] = 6;
		["topic"] = "my_clothes:ragpicker_provoke";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStop";
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = -1320;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Are you buying anything or just looking?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 1;
		["connectID"] = 28;
		["posX"] = -2520;
		["posY"] = -570;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 1;
		["connectID"] = 27;
		["posX"] = -2490;
		["posY"] = 180;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["posX"] = -2100;
		["posY"] = -630;
		["script"] = "function message:onStart()\
   local saveDM = isDebug(\"quest\")\
   setDebugMode(\"quest\", true)\
   local q = getQuest(\"my_clothes\")\
   q.hidden = false\
   q:start()\
   runTimer(0, nil, function()\
      setDebugMode(\"quest\", saveDM)\
   end, false)\
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
		["text"] = "Quick-Start \"My clothes\"";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 1;
		["posX"] = -2100;
		["posY"] = -510;
		["script"] = "";
		["text"] = "Exit";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 1;
		["animation"] = "dl_shrug_long";
		["connectID"] = 32;
		["posX"] = 3090;
		["posY"] = -870;
		["script"] = "";
		["text"] = "Ugh... But I don't have any money.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["connectID"] = 14;
		["posX"] = 3330;
		["posY"] = -870;
		["script"] = "";
		["text"] = "Your problem, not mine.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 1;
		["animation"] = "dl_look_down_long";
		["connectID"] = 34;
		["posX"] = 3600;
		["posY"] = -1170;
		["script"] = "";
		["text"] = "Yeah, maybe I will...";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 3840;
		["posY"] = -1170;
		["script"] = "";
		["text"] = "*grins*";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 1;
		["connectID"] = 39;
		["posX"] = 1080;
		["posY"] = 840;
		["script"] = "";
		["text"] = "What a stench! Do you sell corpses or something?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 1;
		["connectID"] = 41;
		["posX"] = 1560;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "I'm looking for a thief who stole these clothes from me. You better tell me where he hides his sorry ass, or else...";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 1;
		["posX"] = 1080;
		["posY"] = 1230;
		["script"] = "";
		["text"] = "Later.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 2;
		["connectID"] = 59;
		["posX"] = 1320;
		["posY"] = 840;
		["script"] = "";
		["text"] = "Well, just look at this arrogant huma! No one in the history of my shop has ever complained about my wares and now he stands here and wrinkles his little nose!";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 2;
		["connectID"] = 49;
		["posX"] = 1800;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "A thief? I'm not dealing with any thieves here, huma, only with honest prospectors and thrash diggers. You're insulting me! I will never expose my suppliers to someone like you!";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 1;
		["connectID"] = 54;
		["posX"] = 2190;
		["posY"] = 930;
		["script"] = "";
		["text"] = "So 100 antigravium shards won't make you change your mind?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 1;
		["connectID"] = 45;
		["posX"] = 1080;
		["posY"] = 1050;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isFirstTime()\
end\
\
";
		["text"] = "Where have you got those human clothes?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 2;
		["connectID"] = 37;
		["posX"] = 1320;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "Bought'em from some fellow passing by recently. Why?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 1;
		["animation"] = "dl_hands_strike";
		["connectID"] = 53;
		["posX"] = 2190;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "How about some broken ribs and lost teeth? Is it worth covering some filtly coward who only steals from helpless victims?";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 1;
		["connectID"] = 52;
		["posX"] = 2190;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "I will complain to your elder and we'll see what he thinks of your little stinking business.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 2430;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Go ahead. You will learn a lot about this village's law enforcement, retarded huma.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 2430;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "My, my, feeling lucky today, scrub? I won't be the one to start the fight, but you will be the one to bite a mouthful of dust in the end.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 2;
		["connectID"] = 62;
		["posX"] = 2430;
		["posY"] = 930;
		["script"] = "";
		["text"] = "You know what, huma, I'll make a fair proposition to you. See, a bag of four hundred is perfectly shaped to be held in one hand. I like that feeling.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 1;
		["animation"] = "dl_hand_chopslow";
		["connectID"] = 56;
		["posX"] = 2910;
		["posY"] = 930;
		["script"] = "";
		["text"] = "You are out of your mind! I'm not paying you shit.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 3150;
		["posY"] = 930;
		["script"] = "";
		["text"] = "Well, poor huma, you will stay ignorant then.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 1560;
		["posY"] = 840;
		["script"] = "";
		["text"] = "I sell whatever I can find around here, and if you don't like the light appetizing smell of \"ripe\" meat, then bugger off, sissy pinkface.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 4350;
		["posY"] = 300;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 1;
		["connectID"] = 10;
		["posX"] = 1230;
		["posY"] = -570;
		["script"] = "";
		["text"] = "Hey, scumbag.";
		["time"] = 2;
		["topic"] = "my_clothes:ragpicker_scumbag";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 2;
		["connectID"] = 55;
		["posX"] = 2670;
		["posY"] = 930;
		["script"] = "";
		["text"] = "Getting such amount of greenies from you might be the turning point where we become closest friends and have no longer any secrets from each other.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 1;
		["connectID"] = 68;
		["posX"] = 1080;
		["posY"] = 720;
		["script"] = "";
		["text"] = "Do you know anything about Sweet Joy?";
		["time"] = 4.5;
		["topic"] = "broken_crane:ragpicker_sweet_joy";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
		["actor"] = 1;
		["connectID"] = 69;
		["posX"] = 1560;
		["posY"] = 720;
		["script"] = "";
		["text"] = "Do you happen to know where I can find it?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 2;
		["connectID"] = 67;
		["posX"] = 1320;
		["posY"] = 720;
		["script"] = "";
		["text"] = "Huma, do I look like a drug dealer? I'm not interested in that junk! I deal in fine clothes and accessories — a refined business, unlike selling dope to drooling idiots.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 1800;
		["posY"] = 720;
		["script"] = "";
		["text"] = "I don't think any of the locals make or sell it. Try asking traveling traders.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00071"] = {
		["ID"] = 71;
		["actor"] = 1;
		["connectID"] = 74;
		["posX"] = 1230;
		["posY"] = -120;
		["script"] = "function message:onStart()\
   self:setParam(\"71\", true)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isFirstTime()\
end\
\
";
		["text"] = "Do you have by chance a set of armorer's tools?";
		["time"] = 6;
		["topic"] = "herbalist_tools:ragpicker_about_tools";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00073"] = {
		["ID"] = 73;
		["actor"] = 1;
		["connectID"] = 74;
		["posX"] = 1230;
		["posY"] = 30;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"71\")\
end\
\
";
		["text"] = "Do you still have armorer's tools for sale?";
		["time"] = 5;
		["topic"] = "herbalist_tools:ragpicker_about_tools";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00074"] = {
		["ID"] = 74;
		["actor"] = 2;
		["connectID"] = 300;
		["posX"] = 1530;
		["posY"] = -60;
		["script"] = "";
		["text"] = "What are you going to do with them, huma? Start a competing enterprise sewing pants?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00076"] = {
		["ID"] = 76;
		["actor"] = 1;
		["connectID"] = 78;
		["posX"] = 2460;
		["posY"] = -120;
		["script"] = "";
		["text"] = "\\[Buy Armorer's Tools for 1000 Antigravium Shards]Yes, I'm buying.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00077"] = {
		["ID"] = 77;
		["actor"] = 1;
		["connectID"] = 60;
		["posX"] = 2460;
		["posY"] = 0;
		["script"] = "";
		["text"] = "It's too expensive for me.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00079"] = {
		["ID"] = 79;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 2880;
		["posY"] = -210;
		["script"] = "";
		["text"] = "Here you go, may they serve you well!";
		["time"] = 5;
		["topic"] = "herbalist_tools:ragpicker_buy_tools";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00080"] = {
		["ID"] = 80;
		["actor"] = 2;
		["connectID"] = 305;
		["posX"] = 2880;
		["posY"] = -60;
		["script"] = "";
		["text"] = "Are you pulling my leg, huma?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 2;
		["connectID"] = 84;
		["posX"] = -1560;
		["posY"] = -420;
		["script"] = "";
		["text"] = "Why did you have to beat up my guard? I don't know what happened between you, but I'm not going to pay for his treatment from my pocket!";
		["time"] = 12;
		["topic"] = "ragpicker_heist:ragpicker_beating_fine_greeting";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00084"] = {
		["ID"] = 84;
		["actor"] = 1;
		["connectID"] = 85;
		["posX"] = -1290;
		["posY"] = -420;
		["script"] = "";
		["text"] = "Are you sure it was me?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00085"] = {
		["ID"] = 85;
		["actor"] = 2;
		["connectID"] = 86;
		["posX"] = -1020;
		["posY"] = -420;
		["script"] = "";
		["text"] = "Don't try to fool me, huma! Pay 200 shards immediately or face the consequences!";
		["time"] = 8.5;
		["topic"] = "ragpicker_heist:ragpicker_beating_fine_greeting";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00087"] = {
		["ID"] = 87;
		["actor"] = 1;
		["connectID"] = 89;
		["posX"] = -570;
		["posY"] = -540;
		["script"] = "";
		["text"] = "\\[Pay 200 Antigravium Shards]I'll pay.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00088"] = {
		["ID"] = 88;
		["actor"] = 1;
		["connectID"] = 92;
		["posX"] = -570;
		["posY"] = -330;
		["script"] = "";
		["text"] = "I'm not paying for your guard. And if I were you I would fire his weak ass.";
		["time"] = 9.5;
		["topic"] = "ragpicker_heist:ragpicker_beating_fine_refuse";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00090"] = {
		["ID"] = 90;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = -150;
		["posY"] = -480;
		["script"] = "";
		["text"] = "When are you going to have enough shards?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = -150;
		["posY"] = -630;
		["script"] = "";
		["text"] = "Good. Consider it settled.";
		["time"] = 3;
		["topic"] = "ragpicker_heist:ragpicker_beating_fine_pay";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00092"] = {
		["ID"] = 92;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = -300;
		["posY"] = -330;
		["script"] = "";
		["text"] = "I won't forget this huma!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00093"] = {
		["ID"] = 93;
		["actor"] = 2;
		["connectID"] = 136;
		["posX"] = -1500;
		["posY"] = -2100;
		["script"] = "";
		["text"] = "What's all that noise?! Stop immediately, before you smash the whole warehouse!";
		["time"] = 6.5;
		["topic"] = "ragpicker_heist:ragpicker_noise";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00097"] = {
		["ID"] = 97;
		["actor"] = 2;
		["connectID"] = 98;
		["posX"] = -930;
		["posY"] = -2010;
		["script"] = "";
		["text"] = "Let's see what you managed to steal.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00099"] = {
		["ID"] = 99;
		["actor"] = 2;
		["connectID"] = 102;
		["posX"] = -450;
		["posY"] = -2100;
		["script"] = "";
		["text"] = "Strange... Well unless you swallowed something... but then it's even worse for you. In any case, you will have to pay a fine for trespassing - 200 shards.";
		["time"] = 15;
		["topic"] = "ragpicker_heist:ragpicker_fine_trespassing";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00101"] = {
		["ID"] = 101;
		["actor"] = 2;
		["connectID"] = 102;
		["posX"] = -450;
		["posY"] = -1890;
		["script"] = "";
		["text"] = "Got you, thief! I knew you were stealing from me. You either part with all you stole plus compensate for all the losses, or you'll have to deal with the guards, who won't go easy on you. They'll slap you with fines on my behalf, on their behalf, on Big Hat's grandma's behalf.";
		["time"] = 27.5;
		["topic"] = "ragpicker_heist:ragpicker_fine_stealing";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00103"] = {
		["ID"] = 103;
		["actor"] = 1;
		["connectID"] = 110;
		["posX"] = -30;
		["posY"] = -2340;
		["script"] = "";
		["text"] = "\\[Pay 300 Antigravium Shards and leave items behind]I hope you choke on the shards. Here, take the items too.";
		["time"] = 10.5;
		["topic"] = "ragpicker_heist:ragpicker_fine_stealing_return";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00104"] = {
		["ID"] = 104;
		["actor"] = 1;
		["connectID"] = 116;
		["posX"] = -30;
		["posY"] = -1980;
		["script"] = "";
		["text"] = "\\[Pay 300 Antigravium Shards + full items price]Alright, I'll just buy all the items and pay the fine.";
		["time"] = 10;
		["topic"] = "ragpicker_heist:ragpicker_fine_stealing_buy";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00105"] = {
		["ID"] = 105;
		["actor"] = 1;
		["animation"] = "dl_hand_chopfast";
		["connectID"] = 125;
		["posX"] = -30;
		["posY"] = -1800;
		["script"] = "";
		["text"] = "I'm not paying for anything, so you can go to hell!";
		["time"] = 6.5;
		["topic"] = "ragpicker_heist:ragpicker_fine_refuse";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00106"] = {
		["ID"] = 106;
		["actor"] = 1;
		["connectID"] = 114;
		["posX"] = -30;
		["posY"] = -2700;
		["script"] = "";
		["text"] = "\\[Pay 200 Antigravium Shards]I hope you choke on the shards.";
		["time"] = 4.5;
		["topic"] = "ragpicker_heist:ragpicker_fine_trespassing";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00111"] = {
		["ID"] = 111;
		["actor"] = 2;
		["connectID"] = 102;
		["posX"] = 420;
		["posY"] = -1890;
		["script"] = "";
		["text"] = "You don't have enough for the fine! No problem, the guards will find out about this and make you find enough to pay the fine!";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00112"] = {
		["ID"] = 112;
		["actor"] = 2;
		["connectID"] = 122;
		["posX"] = 420;
		["posY"] = -2400;
		["script"] = "";
		["text"] = "That's better.";
		["time"] = 2;
		["topic"] = "ragpicker_heist:ragpicker_fine_stealing_return";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00113"] = {
		["ID"] = 113;
		["actor"] = 2;
		["connectID"] = 122;
		["posX"] = 420;
		["posY"] = -2760;
		["script"] = "";
		["text"] = "That's better.";
		["time"] = 2;
		["topic"] = "ragpicker_heist:ragpicker_fine_trespassing_pay";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00115"] = {
		["ID"] = 115;
		["actor"] = 2;
		["connectID"] = 122;
		["posX"] = 420;
		["posY"] = -2040;
		["script"] = "";
		["text"] = "That's better.";
		["time"] = 2;
		["topic"] = "ragpicker_heist:ragpicker_fine_stealing_buy";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00118"] = {
		["ID"] = 118;
		["actor"] = 2;
		["connectID"] = 102;
		["posX"] = 420;
		["posY"] = -2610;
		["script"] = "";
		["text"] = "You don't have enough for the fine! No problem, the guards will find out about this and make you find enough to pay the fine!";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00120"] = {
		["ID"] = 120;
		["actor"] = 2;
		["connectID"] = 102;
		["posX"] = 420;
		["posY"] = -2250;
		["script"] = "";
		["text"] = "You don't have enough for the fine! No problem, the guards will find out about this and make you find enough to pay the fine!";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00121"] = {
		["ID"] = 121;
		["actor"] = 2;
		["posX"] = 1110;
		["posY"] = -1950;
		["script"] = "";
		["text"] = "And stay away from my warehouse!";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00123"] = {
		["ID"] = 123;
		["actor"] = 2;
		["connectID"] = 132;
		["posX"] = 1110;
		["posY"] = -2130;
		["script"] = "";
		["text"] = "And since you're also responsible for beating up Bamba, you're the one who'll pay his medical expenses!";
		["time"] = 9.5;
		["topic"] = "ragpicker_heist:ragpicker_beating_fine";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00125"] = {
		["ID"] = 125;
		["actor"] = 2;
		["connectID"] = 122;
		["posX"] = 240;
		["posY"] = -1800;
		["script"] = "";
		["text"] = "Arrogant pinkface! That does it - I'm going with this to the guards. And you can forget about my shop until you pay everything down to the last shard you owe me!";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00128"] = {
		["ID"] = 128;
		["actor"] = 1;
		["connectID"] = 131;
		["posX"] = 1530;
		["posY"] = -2220;
		["script"] = "";
		["text"] = "Alright, I'll pay.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00129"] = {
		["ID"] = 129;
		["actor"] = 2;
		["posX"] = 2220;
		["posY"] = -2010;
		["script"] = "";
		["text"] = "I won't forget this, huma!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00130"] = {
		["ID"] = 130;
		["actor"] = 2;
		["connectID"] = 129;
		["posX"] = 1950;
		["posY"] = -2160;
		["script"] = "";
		["text"] = "You don't even have the shards!";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00133"] = {
		["ID"] = 133;
		["actor"] = 2;
		["posX"] = 1950;
		["posY"] = -2310;
		["script"] = "";
		["text"] = "There we go. And stay away from my warehouse!";
		["time"] = 5.5;
		["topic"] = "ragpicker_heist:ragpicker_beating_fine_pay";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00134"] = {
		["ID"] = 134;
		["actor"] = 1;
		["connectID"] = 129;
		["posX"] = 1530;
		["posY"] = -2010;
		["script"] = "";
		["text"] = "I'm not paying for your guard.";
		["time"] = 4;
		["topic"] = "ragpicker_heist:ragpicker_beating_fine_refuse";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00135"] = {
		["ID"] = 135;
		["actor"] = 2;
		["connectID"] = 136;
		["posX"] = -1500;
		["posY"] = -1920;
		["script"] = "";
		["text"] = "What the hell is happening here?";
		["time"] = 4;
		["topic"] = "ragpicker_heist:ragpicker_bamba_called";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00136"] = {
		["ID"] = 136;
		["actor"] = 2;
		["connectID"] = 97;
		["posX"] = -1200;
		["posY"] = -2010;
		["script"] = "";
		["text"] = "What are you doing in my warehouse, huma? Tried robbing me, did you? Turn out your pockets: let's see if any of my goods have found their way there. You're not going anywhere!";
		["time"] = 17;
		["topic"] = "ragpicker_heist:ragpicker_fine";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00171"] = {
		["ID"] = 171;
		["actor"] = 2;
		["posX"] = -1200;
		["posY"] = -2160;
		["script"] = "";
		["text"] = "Топик этой ноды задает видимость последующих двух топиков - между ней и ними что-нибудь должно быть, дабы топики успели обработаться. Таковы текущие ограничения системы.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00173"] = {
		["ID"] = 173;
		["actor"] = 2;
		["connectID"] = 175;
		["posX"] = -1560;
		["posY"] = -60;
		["script"] = "";
		["text"] = "Hey, haven't you seen my guard by chance?";
		["time"] = 6;
		["topic"] = "ragpicker_heist:ragpicker_about_bamba_gone";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00176"] = {
		["ID"] = 176;
		["actor"] = 1;
		["connectID"] = 180;
		["posX"] = -1140;
		["posY"] = -150;
		["script"] = "";
		["text"] = "I don't know where he went, but I saw him coming out of your warehouse with a tightly packed bag.";
		["time"] = 9.5;
		["topic"] = "ragpicker_heist:ragpicker_blame_bamba";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00177"] = {
		["ID"] = 177;
		["actor"] = 1;
		["connectID"] = 304;
		["posX"] = -1140;
		["posY"] = 0;
		["script"] = "";
		["text"] = "How should I know? It's your guard.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00179"] = {
		["ID"] = 179;
		["actor"] = 1;
		["connectID"] = 89;
		["posX"] = 1080;
		["posY"] = 300;
		["script"] = "";
		["text"] = "I'm here to pay a fine for beating up Bamba.";
		["time"] = 6;
		["topic"] = "ragpicker_heist:ragpicker_beating_fine";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00180"] = {
		["ID"] = 180;
		["actor"] = 2;
		["connectID"] = 324;
		["posX"] = -870;
		["posY"] = -150;
		["script"] = "";
		["text"] = "Motherfucker! I knew that sooner or later he'll just leave to his tower without a warning and leave the warehouse unprotected! You can't trust anyone in this damn camp!";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00181"] = {
		["ID"] = 181;
		["actor"] = 1;
		["connectID"] = 182;
		["posX"] = 1080;
		["posY"] = -1440;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   if not getQuestTopicVisible(\"ragpicker_heist\", \"ragpicker_no_trade\") then\
      self:startTrade()\
   end\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "\\[TRADE]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00182"] = {
		["ID"] = 182;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 1350;
		["posY"] = -1440;
		["script"] = "";
		["text"] = "I'm not selling you anything until you've paid all the fines!";
		["time"] = 6.5;
		["topic"] = "ragpicker_heist:ragpicker_no_trade";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00189"] = {
		["ID"] = 189;
		["actor"] = 2;
		["connectID"] = 258;
		["posX"] = -1560;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "Hey, huma, some goods have vanished from my warehouse and I suspect that you are involved in this.";
		["time"] = 10;
		["topic"] = "ragpicker_heist:ragpicker_theft_discovered";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00191"] = {
		["ID"] = 191;
		["actor"] = 1;
		["connectID"] = 266;
		["posX"] = -510;
		["posY"] = -1170;
		["script"] = "";
		["text"] = "In that case, I can tell you a funny observation of my own.";
		["time"] = 6.5;
		["topic"] = "ragpicker_heist:ragpicker_theft_convince_success";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00192"] = {
		["ID"] = 192;
		["actor"] = 1;
		["connectID"] = 197;
		["posX"] = -510;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "And it didn't occur to you that your guard is the one stealing for you and just tries to set me up to cover his ass?";
		["time"] = 11;
		["topic"] = "ragpicker_heist:ragpicker_theft_convince_fail";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00193"] = {
		["ID"] = 193;
		["actor"] = 1;
		["connectID"] = 285;
		["posX"] = -510;
		["posY"] = -870;
		["script"] = "";
		["text"] = "In the end Bamba was disgruntled with our meeting... I can assure you that at that moment the last thing we were thinking about was your goods.";
		["time"] = 10;
		["topic"] = "ragpicker_heist:ragpicker_theft_convince_perverts";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00194"] = {
		["ID"] = 194;
		["actor"] = 2;
		["connectID"] = 264;
		["posX"] = 240;
		["posY"] = -1170;
		["script"] = "";
		["text"] = "Aren't you a slippery one, huma! Just like a dead slimetoad. Fine, I know how to deal with types like you! And I'll fire this bum Bamba! He can go to his tower and die there of hunger on his laughable salary!";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00195"] = {
		["ID"] = 195;
		["actor"] = 2;
		["connectID"] = 268;
		["posX"] = 30;
		["posY"] = -870;
		["script"] = "";
		["text"] = "By the way, I can tell you a couple of convenient places for such meetings. So you don't have to sneak into warehouses.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00196"] = {
		["ID"] = 196;
		["actor"] = 2;
		["connectID"] = 123;
		["h"] = 100;
		["posX"] = 810;
		["posY"] = -1110;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
		["w"] = 124;
	};
	["message_00197"] = {
		["ID"] = 197;
		["actor"] = 2;
		["connectID"] = 102;
		["posX"] = -240;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "You think I'm an idiot, huma? You're not gonna get away with this! I have a witness that saw how you came out of my warehouse, and I have no reason to trust some wandering huma over my own guard! You'll have to pay for what you stole!";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00212"] = {
		["ID"] = 212;
		["actor"] = 1;
		["connectID"] = 36;
		["posX"] = -570;
		["posY"] = 0;
		["script"] = "";
		["text"] = "Next time, choose a more reliable guard. Or pay them more.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00258"] = {
		["ID"] = 258;
		["actor"] = 1;
		["connectID"] = 259;
		["posX"] = -1290;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "And why did you think I'm responsible?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00259"] = {
		["ID"] = 259;
		["actor"] = 2;
		["connectID"] = 190;
		["posX"] = -1020;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "Bamba described a huma that was screwing around the warehouse. There aren't many of your species hanging around lately, so brown fur, blue eyes and greedy hands fit your description!";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00262"] = {
		["ID"] = 262;
		["actor"] = 1;
		["connectID"] = 194;
		["posX"] = 0;
		["posY"] = -1170;
		["script"] = "";
		["text"] = "It's about as trustworthy as Bamba's testimony. So stop pestering me until you have some hard evidence.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00264"] = {
		["ID"] = 264;
		["actor"] = 1;
		["connectID"] = 196;
		["posX"] = 510;
		["posY"] = -1170;
		["script"] = "";
		["text"] = "It's up to you. Just don't tell me I hit the bullseye with the horhog dicks.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00266"] = {
		["ID"] = 266;
		["actor"] = 1;
		["connectID"] = 262;
		["posX"] = -240;
		["posY"] = -1170;
		["script"] = "";
		["text"] = "A certain someone saw you and your guard dressed up in dresses, jumping on dried hornhog dicks. Seems like you guys forgot to close the door.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00268"] = {
		["ID"] = 268;
		["actor"] = 1;
		["connectID"] = 196;
		["posX"] = 300;
		["posY"] = -870;
		["script"] = "";
		["text"] = "No thanks, I'll figure it out on my own.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00285"] = {
		["ID"] = 285;
		["actor"] = 2;
		["connectID"] = 195;
		["posX"] = -240;
		["posY"] = -870;
		["script"] = "";
		["text"] = "I understand perfectly. But next time, arrange your games in some other place, and not in my warehouse!";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00300"] = {
		["ID"] = 300;
		["actor"] = 1;
		["connectID"] = 301;
		["posX"] = 1770;
		["posY"] = -60;
		["script"] = "";
		["text"] = "What I'm going to sew is not really any of your business.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00301"] = {
		["ID"] = 301;
		["actor"] = 2;
		["connectID"] = 75;
		["posX"] = 2040;
		["posY"] = -60;
		["script"] = "";
		["text"] = "Phew, how rude! For you, huma, armorer's tools will cost 1000 shards. Interested?";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00304"] = {
		["ID"] = 304;
		["actor"] = 2;
		["connectID"] = 212;
		["posX"] = -870;
		["posY"] = 0;
		["script"] = "";
		["text"] = "I was just asking.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00305"] = {
		["ID"] = 305;
		["actor"] = 2;
		["posX"] = 3150;
		["posY"] = -60;
		["script"] = "";
		["text"] = "You don't have enough greenies! Come back when you have enough.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00315"] = {
		["ID"] = 315;
		["actor"] = 2;
		["connectID"] = 319;
		["posX"] = -1530;
		["posY"] = -1470;
		["script"] = "";
		["text"] = "What the hell is going on here?! What's with the screams huma?";
		["time"] = 5.5;
		["topic"] = "ragpicker_heist:ragpicker_jack_called";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00316"] = {
		["ID"] = 316;
		["actor"] = 2;
		["connectID"] = 323;
		["posX"] = -300;
		["posY"] = -1470;
		["script"] = "";
		["text"] = "You damn perverts! Get out of here! And Bamba, you and I are going to have a little talk about this. I won't tolerate you turning my warehouse into a love nest!";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00317"] = {
		["ID"] = 317;
		["actor"] = 1;
		["animation"] = "dl_talk_1";
		["connectID"] = 320;
		["posX"] = -1020;
		["posY"] = -1470;
		["script"] = "";
		["text"] = "This weirdo called me and said that if we go to the warehouse, he will show me some \"cool thing\". Then he locked the door and refused to let me out of here.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00318"] = {
		["ID"] = 318;
		["actor"] = 2;
		["posX"] = 180;
		["posY"] = -1470;
		["script"] = "";
		["text"] = "No no and no! Don't look at me, I'm not judging you. Just get out of my warehouse!";
		["time"] = 10;
		["topic"] = "ragpicker_heist:ragpicker_jack_called";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStop";
		["type"] = "message";
	};
	["message_00319"] = {
		["ID"] = 319;
		["actor"] = 1;
		["animation"] = "dl_head_wipe";
		["connectID"] = 317;
		["posX"] = -1260;
		["posY"] = -1470;
		["script"] = "";
		["text"] = "I decided to call for help, since we have a situation here.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00320"] = {
		["ID"] = 320;
		["actor"] = 1;
		["animation"] = "dl_hand_facepalm";
		["connectID"] = 321;
		["posX"] = -780;
		["posY"] = -1470;
		["script"] = "";
		["text"] = "I had doubts that I even want to see this \"thing\" of his, so I decided to call for help before it was too late.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00321"] = {
		["ID"] = 321;
		["actor"] = 3;
		["connectID"] = 316;
		["posX"] = -540;
		["posY"] = -1470;
		["script"] = "";
		["text"] = "What are you talking about, huma? It wasn't at all like that!";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00323"] = {
		["ID"] = 323;
		["actor"] = 3;
		["connectID"] = 318;
		["posX"] = -60;
		["posY"] = -1470;
		["script"] = "";
		["text"] = "For fuck's sake! You got it all wrong, Ragpicker! I am not one of these huma-lovers...";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00324"] = {
		["ID"] = 324;
		["actor"] = 1;
		["connectID"] = 36;
		["posX"] = -600;
		["posY"] = -150;
		["script"] = "";
		["text"] = "You better change the locks.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00325"] = {
		["ID"] = 325;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = -1320;
		["posY"] = 180;
		["script"] = "";
		["text"] = "So, pinkface, what do you want?";
		["time"] = 1;
		["topic"] = "my_clothes:ragpicker_greeting_angry";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00326"] = {
		["ID"] = 326;
		["actor"] = 2;
		["connectID"] = 14;
		["posX"] = 2640;
		["posY"] = -960;
		["script"] = "";
		["text"] = "Each piece would cost you a measly 200 shards.";
		["time"] = 1;
		["type"] = "message";
	};
	["switch_00002"] = {
		["ID"] = 2;
		["connectionsID"] = {
			[1] = 25;
			[2] = 26;
		};
		["posX"] = -2640;
		["posY"] = 120;
		["type"] = "switch";
	};
	["switch_00010"] = {
		["ID"] = 10;
		["connectionsID"] = {
			[1] = 13;
			[2] = 11;
			[3] = 12;
		};
		["posX"] = 2220;
		["posY"] = -570;
		["type"] = "switch";
	};
	["switch_00014"] = {
		["ID"] = 14;
		["connectionsID"] = {
			[1] = 15;
			[2] = 16;
			[3] = 17;
			[4] = 31;
			[5] = 18;
		};
		["h"] = 140;
		["posX"] = 2940;
		["posY"] = -990;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00027"] = {
		["ID"] = 27;
		["connectionsID"] = {
			[1] = 172;
			[2] = 325;
			[3] = 5;
			[4] = 23;
		};
		["h"] = 120;
		["posX"] = -1980;
		["posY"] = 180;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00028"] = {
		["ID"] = 28;
		["connectionsID"] = {
			[1] = 29;
			[2] = 30;
		};
		["posX"] = -2280;
		["posY"] = -570;
		["type"] = "switch";
	};
	["switch_00036"] = {
		["ID"] = 36;
		["connectionsID"] = {
			[1] = 181;
			[2] = 70;
			[3] = 72;
			[4] = 179;
			[5] = 63;
			[6] = 35;
			[7] = 44;
			[8] = 38;
		};
		["h"] = 200;
		["posX"] = 870;
		["posY"] = 210;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00049"] = {
		["ID"] = 49;
		["connectionsID"] = {
			[1] = 43;
			[2] = 50;
			[3] = 51;
		};
		["posX"] = 2040;
		["posY"] = 1050;
		["type"] = "switch";
	};
	["switch_00070"] = {
		["ID"] = 70;
		["connectionsID"] = {
			[1] = 3;
			[2] = 61;
		};
		["name"] = "my_clothes";
		["posX"] = 1080;
		["posY"] = -630;
		["type"] = "switch";
	};
	["switch_00072"] = {
		["ID"] = 72;
		["connectionsID"] = {
			[1] = 71;
			[2] = 73;
		};
		["name"] = "tools";
		["posX"] = 1080;
		["posY"] = -30;
		["type"] = "switch";
	};
	["switch_00075"] = {
		["ID"] = 75;
		["connectionsID"] = {
			[1] = 76;
			[2] = 77;
		};
		["posX"] = 2310;
		["posY"] = -60;
		["type"] = "switch";
	};
	["switch_00078"] = {
		["ID"] = 78;
		["connectionsID"] = {
			[1] = 79;
			[2] = 80;
		};
		["posX"] = 2730;
		["posY"] = -120;
		["type"] = "switch";
	};
	["switch_00086"] = {
		["ID"] = 86;
		["connectionsID"] = {
			[1] = 87;
			[2] = 88;
		};
		["posX"] = -750;
		["posY"] = -420;
		["type"] = "switch";
	};
	["switch_00089"] = {
		["ID"] = 89;
		["connectionsID"] = {
			[1] = 91;
			[2] = 90;
		};
		["posX"] = -300;
		["posY"] = -540;
		["type"] = "switch";
	};
	["switch_00098"] = {
		["ID"] = 98;
		["connectionsID"] = {
			[1] = 99;
			[2] = 101;
		};
		["posX"] = -600;
		["posY"] = -2010;
		["type"] = "switch";
	};
	["switch_00102"] = {
		["ID"] = 102;
		["connectionsID"] = {
			[1] = 106;
			[2] = 103;
			[3] = 104;
			[4] = 105;
		};
		["h"] = 120;
		["posX"] = -180;
		["posY"] = -2010;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00110"] = {
		["ID"] = 110;
		["connectionsID"] = {
			[1] = 112;
			[2] = 120;
		};
		["posX"] = 240;
		["posY"] = -2340;
		["type"] = "switch";
	};
	["switch_00114"] = {
		["ID"] = 114;
		["connectionsID"] = {
			[1] = 113;
			[2] = 118;
		};
		["posX"] = 240;
		["posY"] = -2700;
		["type"] = "switch";
	};
	["switch_00116"] = {
		["ID"] = 116;
		["connectionsID"] = {
			[1] = 115;
			[2] = 111;
		};
		["posX"] = 240;
		["posY"] = -1980;
		["type"] = "switch";
	};
	["switch_00122"] = {
		["ID"] = 122;
		["connectionsID"] = {
			[1] = 123;
			[2] = 121;
		};
		["posX"] = 930;
		["posY"] = -2040;
		["type"] = "switch";
	};
	["switch_00131"] = {
		["ID"] = 131;
		["connectionsID"] = {
			[1] = 133;
			[2] = 130;
		};
		["posX"] = 1800;
		["posY"] = -2220;
		["type"] = "switch";
	};
	["switch_00132"] = {
		["ID"] = 132;
		["connectionsID"] = {
			[1] = 128;
			[2] = 134;
		};
		["posX"] = 1380;
		["posY"] = -2130;
		["type"] = "switch";
	};
	["switch_00172"] = {
		["ID"] = 172;
		["connectionsID"] = {
			[1] = 93;
			[2] = 135;
			[3] = 315;
			[4] = 189;
			[5] = 83;
			[6] = 173;
		};
		["h"] = 160;
		["name"] = "heist";
		["posX"] = -1770;
		["posY"] = -1050;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00175"] = {
		["ID"] = 175;
		["connectionsID"] = {
			[1] = 176;
			[2] = 177;
		};
		["posX"] = -1290;
		["posY"] = -60;
		["type"] = "switch";
	};
	["switch_00190"] = {
		["ID"] = 190;
		["connectionsID"] = {
			[1] = 191;
			[2] = 192;
			[3] = 193;
		};
		["posX"] = -660;
		["posY"] = -1020;
		["type"] = "switch";
	};
}
local obj2 = {
	["actor_prefab"] = {
		[1] = "human_male";
	};
}
return obj1 ,obj2
