-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = -900;
		["posY"] = -90;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible()\
end\
\
";
		["text"] = "[t_vasily_tools:vasily_intro]Hm? What now? I'm busy!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 6;
		["posX"] = -450;
		["posY"] = -210;
		["script"] = "";
		["text"] = "I need your armor and hoverbike!";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 5;
		["posX"] = -450;
		["posY"] = -90;
		["script"] = "";
		["text"] = "That wasn't very nice.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["connectID"] = 7;
		["posX"] = -450;
		["posY"] = 30;
		["script"] = "";
		["text"] = "Looks like your hoverbike cooling circuit is busted. And the gyro is so twisted as if you crash landed from a height of 30 meters.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 2;
		["posX"] = -210;
		["posY"] = -90;
		["script"] = "";
		["text"] = "Frankly I don't give a damn. If you've got nothin' to do, go shoot some crucasses or dive into a bughill. Stop bothering me if you don't wanna get squashed.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 2;
		["posX"] = -210;
		["posY"] = -210;
		["script"] = "";
		["text"] = "Ha. Very funny. Shit-for-brains spacers. Stoned out of their minds and screwing around the desert. Get lost, addict.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 2;
		["connectID"] = 8;
		["posX"] = -210;
		["posY"] = 30;
		["script"] = "";
		["text"] = "I'm not blind, smartass. Let me guess: you're gonna tell me now you can fix that with some duct tape and cactus resin?";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 1;
		["connectID"] = 11;
		["posX"] = 180;
		["posY"] = -30;
		["script"] = "";
		["text"] = "Not really. I'm not that good in field repairs.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 1;
		["connectID"] = 12;
		["posX"] = 180;
		["posY"] = 90;
		["script"] = "";
		["text"] = "I fixed spaceships all my life. Trust me, your tin can isn't trickier than a two-stage Alkuberre antigrav drive.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 420;
		["posY"] = -30;
		["script"] = "";
		["text"] = "And here I thought you might be useful.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["connectID"] = 13;
		["posX"] = 420;
		["posY"] = 90;
		["script"] = "";
		["text"] = "Is that so?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 1;
		["connectID"] = 14;
		["posX"] = 660;
		["posY"] = 90;
		["script"] = "";
		["text"] = "Put resin into the tubes and kill the perforated cooling circuit. You have an open frame, so if you don't speed too much the air cooling is gonna suffice.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 1;
		["connectID"] = 15;
		["posX"] = 900;
		["posY"] = 90;
		["script"] = "";
		["text"] = "And slowly but surely drive to the nearest mechanic.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["connectID"] = 16;
		["posX"] = 1140;
		["posY"] = 90;
		["script"] = "";
		["text"] = "And how am I supposed to calibrate the gyro, with my fingers? And un-dent it with a crowbar?";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["connectID"] = 17;
		["posX"] = 1380;
		["posY"] = 90;
		["script"] = "";
		["text"] = "Yeah, some tools would definitely help.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = 1650;
		["posY"] = -30;
		["script"] = "";
		["text"] = "If only I still had my tools. I'm no tourist, I always have a full set. But my toolbox fell off when those assholes in the canyon started shooting.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 1890;
		["posY"] = -30;
		["script"] = "";
		["text"] = "Shooting?";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["connectID"] = 88;
		["posX"] = 2130;
		["posY"] = -30;
		["script"] = "";
		["text"] = "[t_vasily_tools:start]That's a story for another time. Better yet, maybe you can bring me my tools if you find them?";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["connectID"] = 73;
		["posX"] = -900;
		["posY"] = 630;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isFirstTime() and self:isTopicVisible()\
end\
\
";
		["text"] = "[t_vasily_tools:vasily_get_lost]Get lost while I'm asking nicely. I'm not in the mood for smalltalk.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["connectID"] = 24;
		["posX"] = -1320;
		["posY"] = 600;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["posX"] = 2520;
		["posY"] = 90;
		["script"] = "";
		["text"] = "I'll see what I can do.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 2;
		["connectID"] = 73;
		["posX"] = -900;
		["posY"] = 780;
		["script"] = "";
		["text"] = "";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["connectID"] = 91;
		["posX"] = 1350;
		["posY"] = 360;
		["script"] = "";
		["text"] = "What are you doing here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["connectID"] = 95;
		["posX"] = 1350;
		["posY"] = 480;
		["script"] = "";
		["text"] = "How long till the nearest town?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 1;
		["connectID"] = 79;
		["posX"] = 960;
		["posY"] = 1650;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isFirstTime() and self:isTopicVisible()\
end\
\
";
		["text"] = "[t_vasily_tools:vasily_teach]Can you teach me something?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 1;
		["connectID"] = 80;
		["posX"] = 1350;
		["posY"] = 600;
		["script"] = "";
		["text"] = "You're huge! How did you manage to get to that size?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 1;
		["posX"] = 960;
		["posY"] = 2700;
		["script"] = "";
		["text"] = "I'll be going.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 1;
		["connectID"] = 26;
		["posX"] = 1350;
		["posY"] = 840;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 1;
		["connectID"] = 87;
		["posX"] = 960;
		["posY"] = 570;
		["script"] = "";
		["text"] = "I have a couple of questions...";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 1;
		["connectID"] = 40;
		["posX"] = 1380;
		["posY"] = 1050;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible()\
end\
\
";
		["text"] = "[t_broken_shotgun:vasily_ask_shotgun]...this broken shotgun?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 2;
		["connectID"] = 117;
		["posX"] = 1770;
		["posY"] = 990;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not self:isTopicVisible()\
end\
\
";
		["text"] = "[t_broken_shotgun:vasily_can_fix_shotgun]With what? I told you, I don't have my tools.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 2;
		["connectID"] = 42;
		["posX"] = 1770;
		["posY"] = 1110;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible()\
end\
\
";
		["text"] = "[t_broken_shotgun:vasily_can_fix_shotgun]Let's see...";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 2;
		["connectID"] = 44;
		["posX"] = 2010;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "You brought me my tools.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 2;
		["connectID"] = 47;
		["posX"] = 2400;
		["posY"] = 1050;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"broken_shotgun\"):getParam(\"gave_booze\")\
end\
\
";
		["text"] = "You gave me booze.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 2;
		["connectID"] = 47;
		["posX"] = 2400;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 2;
		["connectID"] = 50;
		["posX"] = 2820;
		["posY"] = 1050;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return isQuestFinished(\"vasily_tools\")\
end\
\
";
		["text"] = "You brought me scrap.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 2;
		["connectID"] = 50;
		["posX"] = 2820;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 2;
		["connectID"] = 56;
		["posX"] = 3240;
		["posY"] = 990;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"broken_shotgun\"):getParam(\"discount\") == 0\
end\
\
";
		["text"] = "Three hundred antigravium shards.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 2;
		["connectID"] = 56;
		["posX"] = 3240;
		["posY"] = 1110;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"broken_shotgun\"):getParam(\"discount\") == 1\
end\
\
";
		["text"] = "Hundred and fifty shinies.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 2;
		["connectID"] = 56;
		["posX"] = 3240;
		["posY"] = 1230;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"broken_shotgun\"):getParam(\"discount\") == 2\
end\
\
";
		["text"] = "For you - for free!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 1;
		["connectID"] = 76;
		["posX"] = 3660;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "Let's do it.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 1;
		["connectID"] = 117;
		["posX"] = 3660;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "I'll think about it.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 1;
		["connectID"] = 60;
		["posX"] = 1350;
		["posY"] = 1920;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isFirstTime() and self:isTopicVisible()\
end\
\
";
		["text"] = "[t_vasily_tools:vasily_give_tools]...your tools.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 2;
		["connectID"] = 67;
		["posX"] = 1590;
		["posY"] = 1920;
		["script"] = "";
		["text"] = "Excellent. Now I can actually fix that clunker. If only I had enough scrap...";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 2;
		["connectID"] = 62;
		["posX"] = -480;
		["posY"] = 630;
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
		["text"] = "[t_broken_shotgun:vasily_gotta_drink]I gotta drink something. You got any booze?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 1;
		["connectID"] = 65;
		["posX"] = -60;
		["posY"] = 570;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"broken_shotgun\", \"vasily_give_drink\")\
end\
\
";
		["text"] = "Here you go.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 1;
		["connectID"] = 66;
		["posX"] = -60;
		["posY"] = 690;
		["script"] = "";
		["text"] = "No, not really.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00065"] = {
		["ID"] = 65;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 180;
		["posY"] = 570;
		["script"] = "";
		["text"] = "[t_broken_shotgun:vasily_give_drink]Now you're speaking my language!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00066"] = {
		["ID"] = 66;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 180;
		["posY"] = 690;
		["script"] = "";
		["text"] = "Good-for-nothing spacers...";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
		["actor"] = 1;
		["connectID"] = 99;
		["posX"] = 1830;
		["posY"] = 1920;
		["script"] = "";
		["text"] = "What about the stuff on the shelves?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 1;
		["connectID"] = 71;
		["posX"] = 2490;
		["posY"] = 1860;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible()\
end\
\
";
		["text"] = "[t_vasily_tools:vasily_give_scrap]Actually, I have the scrap right here.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00070"] = {
		["ID"] = 70;
		["actor"] = 1;
		["connectID"] = 117;
		["posX"] = 2490;
		["posY"] = 1980;
		["script"] = "";
		["text"] = "I'll keep it in mind.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00071"] = {
		["ID"] = 71;
		["actor"] = 2;
		["connectID"] = 117;
		["posX"] = 2730;
		["posY"] = 1800;
		["script"] = "";
		["text"] = "A resourceful man, aren't you. You have my thanks.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00072"] = {
		["ID"] = 72;
		["actor"] = 1;
		["connectID"] = 71;
		["posX"] = 1350;
		["posY"] = 1800;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isFirstTime() and self:isTopicVisible()\
end\
\
";
		["text"] = "[t_vasily_tools:vasily_give_scrap]...some scrap for you.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00074"] = {
		["ID"] = 74;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = -480;
		["posY"] = 750;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00075"] = {
		["ID"] = 75;
		["actor"] = 1;
		["connectID"] = 63;
		["posX"] = 960;
		["posY"] = 2100;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"broken_shotgun\", \"vasily_give_drink\")\
end\
\
";
		["text"] = "You still want that drink?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00077"] = {
		["ID"] = 77;
		["actor"] = 2;
		["posX"] = 4050;
		["posY"] = 990;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible()\
end\
\
";
		["text"] = "[t_broken_shotgun:finish]Here you go!";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00078"] = {
		["ID"] = 78;
		["actor"] = 2;
		["connectID"] = 117;
		["posX"] = 4050;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "Come back when you have enough shinies.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00079"] = {
		["ID"] = 79;
		["actor"] = 2;
		["connectID"] = 117;
		["posX"] = 1230;
		["posY"] = 1650;
		["script"] = "";
		["text"] = "Not here and not now.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00080"] = {
		["ID"] = 80;
		["actor"] = 2;
		["connectID"] = 81;
		["posX"] = 1590;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Exercise and proper diet.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00081"] = {
		["ID"] = 81;
		["actor"] = 1;
		["connectID"] = 82;
		["posX"] = 1830;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Get out of here!";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00082"] = {
		["ID"] = 82;
		["actor"] = 2;
		["connectID"] = 116;
		["posX"] = 2070;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Partly genetics, partly consequences of a rough childhood. I don't know all the details. Enough about that.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 1;
		["connectID"] = 90;
		["posX"] = 1350;
		["posY"] = 720;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible()\
end\
\
";
		["text"] = "[t_vasily_tools:vasily_location]Where should I look for your tools again?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00084"] = {
		["ID"] = 84;
		["actor"] = 1;
		["connectID"] = 89;
		["posX"] = 2520;
		["posY"] = -150;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isFirstTime() and not getQuestTopicVisible(\"vasily_tools\", \"vasily_give_tools\")\
end\
\
";
		["text"] = "[t_vasily_tools:vasily_location]Where should I look for them?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00089"] = {
		["ID"] = 89;
		["actor"] = 2;
		["connectID"] = 88;
		["posX"] = 2760;
		["posY"] = -150;
		["script"] = "";
		["text"] = "[t_vasily_tools:vasily_location]Somewhere at the bottom of the canyon of the wind turbines.";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00090"] = {
		["ID"] = 90;
		["actor"] = 2;
		["connectID"] = 116;
		["posX"] = 1590;
		["posY"] = 720;
		["script"] = "";
		["text"] = "Somewhere at the bottom of the canyon of the wind turbines.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 2;
		["connectID"] = 92;
		["posX"] = 1590;
		["posY"] = 360;
		["script"] = "";
		["text"] = "I'm hunting some god damned Black Death!";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00092"] = {
		["ID"] = 92;
		["actor"] = 1;
		["connectID"] = 94;
		["posX"] = 1830;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Huh?";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00094"] = {
		["ID"] = 94;
		["actor"] = 2;
		["connectID"] = 116;
		["posX"] = 2070;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Better ask the abori. It's my pal Msasi, he's the one who invited me to hunt down some rare beast. Who would've known it would turn out this way.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00095"] = {
		["ID"] = 95;
		["actor"] = 2;
		["connectID"] = 96;
		["posX"] = 1590;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Half a day on a hoverbike. One more day on a good arphant. A week on foot, with all chances to die on the way, especially if you're not from around here.";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00096"] = {
		["ID"] = 96;
		["actor"] = 2;
		["connectID"] = 97;
		["posX"] = 1830;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Better go to the fort and wait for a trading caravan there.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00097"] = {
		["ID"] = 97;
		["actor"] = 1;
		["connectID"] = 98;
		["posX"] = 2070;
		["posY"] = 480;
		["script"] = "";
		["text"] = "And how do I get to this fort?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00098"] = {
		["ID"] = 98;
		["actor"] = 2;
		["connectID"] = 116;
		["posX"] = 2310;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Go up the river, you won't miss it. When you see the big bridge you'll know.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00099"] = {
		["ID"] = 99;
		["actor"] = 2;
		["connectID"] = 68;
		["posX"] = 2070;
		["posY"] = 1920;
		["script"] = "";
		["text"] = "That's not nearly enough. If you come into possession of, say half a dozen mechanical scrap, bring it to me. I won't forget the favor.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00102"] = {
		["ID"] = 102;
		["actor"] = 1;
		["connectID"] = 103;
		["posX"] = 960;
		["posY"] = 1350;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:hasVisibleChildren()\
end\
\
";
		["text"] = "Can you help me fix...";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00105"] = {
		["ID"] = 105;
		["actor"] = 1;
		["connectID"] = 117;
		["posX"] = 1380;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00106"] = {
		["ID"] = 106;
		["actor"] = 1;
		["connectID"] = 107;
		["posX"] = 1380;
		["posY"] = 1350;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible()\
end\
\
";
		["text"] = "[t_broken_scanner:vasily_can_fix_scanner]...my scanner?";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00107"] = {
		["ID"] = 107;
		["actor"] = 2;
		["connectID"] = 108;
		["posX"] = 1620;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "Let me see...";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00108"] = {
		["ID"] = 108;
		["actor"] = 2;
		["connectID"] = 110;
		["posX"] = 1860;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "Well, seems like case of a blown fuse. I can replace it with my eyes closed. Bring me some electronic scrap and I'll fix it for you.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00111"] = {
		["ID"] = 111;
		["actor"] = 1;
		["connectID"] = 114;
		["posX"] = 2250;
		["posY"] = 1290;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible()\
end\
\
";
		["text"] = "[t_broken_scanner:vasily_fix_scanner]\\[Give electronic scrap]";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00112"] = {
		["ID"] = 112;
		["actor"] = 1;
		["connectID"] = 115;
		["posX"] = 2250;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "I don't have any.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00114"] = {
		["ID"] = 114;
		["actor"] = 2;
		["posX"] = 2490;
		["posY"] = 1290;
		["script"] = "";
		["text"] = "Here you go!";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00115"] = {
		["ID"] = 115;
		["actor"] = 2;
		["posX"] = 2490;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "Come back when you find some.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00116"] = {
		["ID"] = 116;
		["actor"] = 2;
		["connectID"] = 87;
		["posX"] = 2970;
		["posY"] = 510;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00117"] = {
		["ID"] = 117;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 4350;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00119"] = {
		["ID"] = 119;
		["actor"] = 1;
		["connectID"] = 120;
		["posX"] = 960;
		["posY"] = 1860;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:hasVisibleChildren()\
end\
\
";
		["text"] = "Hey, i found...";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00121"] = {
		["ID"] = 121;
		["actor"] = 1;
		["connectID"] = 144;
		["posX"] = 960;
		["posY"] = 2340;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isFirstTime() and self:isTopicVisible()\
end\
\
";
		["text"] = "[t_find_terminal:vasily_help]I need your help, big guy.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00122"] = {
		["ID"] = 122;
		["actor"] = 2;
		["connectID"] = 145;
		["posX"] = 1440;
		["posY"] = 2340;
		["script"] = "";
		["text"] = "Hm. Yeah, I remember there was one. Is it far?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00125"] = {
		["ID"] = 125;
		["actor"] = 1;
		["connectID"] = 127;
		["posX"] = 960;
		["posY"] = 2520;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible()\
end\
\
";
		["text"] = "[t_find_terminal:vasily_give_booze]Here's your booze. It's time to head to the terminal.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00126"] = {
		["ID"] = 126;
		["actor"] = 1;
		["connectID"] = 149;
		["posX"] = 2850;
		["posY"] = 2370;
		["script"] = "";
		["text"] = "Can't you do without it somehow?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00127"] = {
		["ID"] = 127;
		["actor"] = 2;
		["connectID"] = 158;
		["posX"] = 1200;
		["posY"] = 2520;
		["script"] = "";
		["text"] = "You have no idea how much I hate this stuff. But I can't help it.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00131"] = {
		["ID"] = 131;
		["actor"] = 2;
		["connectID"] = 137;
		["posX"] = -900;
		["posY"] = 360;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible()\
end\
\
";
		["text"] = "[t_find_terminal:vasily_find_battery]Ugh! I hate walking.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00132"] = {
		["ID"] = 132;
		["actor"] = 1;
		["connectID"] = 139;
		["posX"] = -420;
		["posY"] = 360;
		["script"] = "";
		["text"] = "If I had a hoverbike I wouldn't even bother you.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00137"] = {
		["ID"] = 137;
		["actor"] = 2;
		["connectID"] = 132;
		["posX"] = -660;
		["posY"] = 360;
		["script"] = "";
		["text"] = "If my bike wasn't broken - would have hooked this thing and - bam! The whole shebang would be over before you know it. ";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00139"] = {
		["ID"] = 139;
		["actor"] = 2;
		["connectID"] = 152;
		["posX"] = -180;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Right.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00143"] = {
		["ID"] = 143;
		["actor"] = 1;
		["connectID"] = 60;
		["posX"] = 2520;
		["posY"] = -30;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible()\
end\
\
";
		["text"] = "[t_vasily_tools:vasily_give_tools]This toolbox?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00144"] = {
		["ID"] = 144;
		["actor"] = 1;
		["connectID"] = 122;
		["posX"] = 1200;
		["posY"] = 2340;
		["script"] = "";
		["text"] = "In one of the caves nearby I found a terminal, which used to stand here in the camp.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00145"] = {
		["ID"] = 145;
		["actor"] = 1;
		["connectID"] = 146;
		["posX"] = 1680;
		["posY"] = 2340;
		["script"] = "";
		["text"] = "Not really. Shouldn't take more than an hour of your time.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00146"] = {
		["ID"] = 146;
		["actor"] = 2;
		["connectID"] = 147;
		["posX"] = 1920;
		["posY"] = 2340;
		["script"] = "";
		["text"] = "Two bottles!";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00147"] = {
		["ID"] = 147;
		["actor"] = 1;
		["connectID"] = 148;
		["posX"] = 2160;
		["posY"] = 2340;
		["script"] = "";
		["text"] = "What?";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00148"] = {
		["ID"] = 148;
		["actor"] = 2;
		["connectID"] = 124;
		["posX"] = 2400;
		["posY"] = 2340;
		["script"] = "";
		["text"] = "You deaf or something? I need two bottles of strong booze of any kind.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00149"] = {
		["ID"] = 149;
		["actor"] = 2;
		["connectID"] = 150;
		["posX"] = 3090;
		["posY"] = 2370;
		["script"] = "";
		["text"] = "Nope. Can you run through the desert all day without water?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00150"] = {
		["ID"] = 150;
		["actor"] = 2;
		["connectID"] = 117;
		["posX"] = 3330;
		["posY"] = 2370;
		["script"] = "";
		["text"] = "So am I, without a couple of bottles of \"fuel\" for my \"reactor\".";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00152"] = {
		["ID"] = 152;
		["actor"] = 2;
		["connectID"] = 154;
		["posX"] = 60;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Okay, I had a look inside: the assholes who stole this terminal only managed to bend the casing. So it's quite functional.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00154"] = {
		["ID"] = 154;
		["actor"] = 2;
		["connectID"] = 155;
		["posX"] = 300;
		["posY"] = 360;
		["script"] = "";
		["text"] = "But the isotope battery won't last for long, so tell Msasi that you need a new one.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00155"] = {
		["ID"] = 155;
		["actor"] = 2;
		["connectID"] = 157;
		["posX"] = 540;
		["posY"] = 360;
		["script"] = "";
		["text"] = "And don't bother me with such nonsense anymore. I'm not a human tractor.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00157"] = {
		["ID"] = 157;
		["actor"] = 1;
		["posX"] = 780;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Got it.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00158"] = {
		["ID"] = 158;
		["actor"] = 2;
		["posX"] = 1440;
		["posY"] = 2520;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   --This will start fade sequence after the msssage is played\
   getQuest(\"find_terminal\"):goToStep(\"spawn_terminal\")\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Alright, show me where the cave is.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 2;
			[2] = 3;
			[3] = 4;
		};
		["posX"] = -630;
		["posY"] = -90;
		["type"] = "switch";
	};
	["switch_00008"] = {
		["ID"] = 8;
		["connectionsID"] = {
			[1] = 9;
			[2] = 10;
		};
		["posX"] = 30;
		["posY"] = 30;
		["type"] = "switch";
	};
	["switch_00024"] = {
		["ID"] = 24;
		["connectionsID"] = {
			[1] = 0;
			[2] = 131;
			[3] = 20;
			[4] = 25;
		};
		["posX"] = -1080;
		["posY"] = 600;
		["type"] = "switch";
	};
	["switch_00026"] = {
		["ID"] = 26;
		["connectionsID"] = {
			[1] = 37;
			[2] = 102;
			[3] = 31;
			[4] = 75;
			[5] = 119;
			[6] = 125;
			[7] = 121;
			[8] = 33;
		};
		["posX"] = 540;
		["posY"] = 750;
		["type"] = "switch";
	};
	["switch_00040"] = {
		["ID"] = 40;
		["connectionsID"] = {
			[1] = 39;
			[2] = 41;
		};
		["posX"] = 1620;
		["posY"] = 1050;
		["type"] = "switch";
	};
	["switch_00044"] = {
		["ID"] = 44;
		["connectionsID"] = {
			[1] = 45;
			[2] = 46;
		};
		["posX"] = 2250;
		["posY"] = 1110;
		["type"] = "switch";
	};
	["switch_00047"] = {
		["ID"] = 47;
		["connectionsID"] = {
			[1] = 48;
			[2] = 49;
		};
		["posX"] = 2670;
		["posY"] = 1110;
		["type"] = "switch";
	};
	["switch_00050"] = {
		["ID"] = 50;
		["connectionsID"] = {
			[1] = 51;
			[2] = 52;
			[3] = 53;
		};
		["posX"] = 3090;
		["posY"] = 1110;
		["type"] = "switch";
	};
	["switch_00056"] = {
		["ID"] = 56;
		["connectionsID"] = {
			[1] = 57;
			[2] = 58;
		};
		["posX"] = 3510;
		["posY"] = 1110;
		["type"] = "switch";
	};
	["switch_00062"] = {
		["ID"] = 62;
		["connectionsID"] = {
			[1] = 63;
			[2] = 64;
		};
		["posX"] = -210;
		["posY"] = 630;
		["type"] = "switch";
	};
	["switch_00068"] = {
		["ID"] = 68;
		["connectionsID"] = {
			[1] = 69;
			[2] = 70;
		};
		["posX"] = 2340;
		["posY"] = 1920;
		["type"] = "switch";
	};
	["switch_00073"] = {
		["ID"] = 73;
		["connectionsID"] = {
			[1] = 61;
			[2] = 74;
		};
		["posX"] = -630;
		["posY"] = 690;
		["type"] = "switch";
	};
	["switch_00076"] = {
		["ID"] = 76;
		["connectionsID"] = {
			[1] = 77;
			[2] = 78;
		};
		["posX"] = 3900;
		["posY"] = 1050;
		["type"] = "switch";
	};
	["switch_00087"] = {
		["ID"] = 87;
		["connectionsID"] = {
			[1] = 28;
			[2] = 29;
			[3] = 32;
			[4] = 83;
			[5] = 36;
		};
		["posX"] = 1200;
		["posY"] = 540;
		["type"] = "switch";
	};
	["switch_00088"] = {
		["ID"] = 88;
		["connectionsID"] = {
			[1] = 84;
			[2] = 143;
			[3] = 23;
		};
		["posX"] = 2370;
		["posY"] = -30;
		["type"] = "switch";
	};
	["switch_00103"] = {
		["ID"] = 103;
		["connectionsID"] = {
			[1] = 38;
			[2] = 106;
			[3] = 105;
		};
		["posX"] = 1230;
		["posY"] = 1350;
		["type"] = "switch";
	};
	["switch_00110"] = {
		["ID"] = 110;
		["connectionsID"] = {
			[1] = 111;
			[2] = 112;
		};
		["posX"] = 2100;
		["posY"] = 1350;
		["type"] = "switch";
	};
	["switch_00120"] = {
		["ID"] = 120;
		["connectionsID"] = {
			[1] = 72;
			[2] = 59;
		};
		["posX"] = 1200;
		["posY"] = 1860;
		["type"] = "switch";
	};
	["switch_00124"] = {
		["ID"] = 124;
		["connectionsID"] = {
			[1] = 125;
			[2] = 126;
		};
		["posX"] = 2670;
		["posY"] = 2340;
		["type"] = "switch";
	};
}
return obj1
