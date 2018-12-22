-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 1;
		["connectID"] = 1;
		["posX"] = 210;
		["posY"] = 840;
		["script"] = "function message:onStart()\
   self:setDialogParam(\"secondTime\", true)\
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
		["text"] = "What smells so good here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 2;
		["animation"] = "dl_point_right";
		["connectID"] = 2;
		["posX"] = 480;
		["posY"] = 840;
		["script"] = "";
		["text"] = "It's my special spice! Go ahead, take a bite. Vasily ain't gonna eat anything other than his firewater, at least until he fixes his clunker. Can't have a good meat go to waste!";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 4;
		["posX"] = 1890;
		["posY"] = -120;
		["script"] = "";
		["text"] = "Who are you?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 2;
		["connectID"] = 12;
		["posX"] = 2130;
		["posY"] = -120;
		["script"] = "";
		["text"] = "I'm Msasi, a hunter.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["connectID"] = 13;
		["posX"] = 1890;
		["posY"] = 0;
		["script"] = "";
		["text"] = "What is this place?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["connectID"] = 15;
		["posX"] = 1890;
		["posY"] = 120;
		["script"] = "";
		["text"] = "What are you doing here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 1;
		["connectID"] = 16;
		["posX"] = 1890;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Can you teach me anything?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["posX"] = 1140;
		["posY"] = 2130;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = 2370;
		["posY"] = -120;
		["script"] = "";
		["text"] = "What do you hunt?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["connectID"] = 14;
		["posX"] = 2130;
		["posY"] = 0;
		["script"] = "";
		["text"] = "You can't read? Welcome to the Hunter's Rest. Be respectful and others will treat you accordingly, huma.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 1;
		["connectID"] = 21;
		["posX"] = 2370;
		["posY"] = 0;
		["script"] = "";
		["text"] = "Did you build this camp?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 2130;
		["posY"] = 120;
		["script"] = "";
		["text"] = "Roasting meat, waiting for my good-for-nothing apprentices and watching over Vasily so he doesn't explode.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 2;
		["connectID"] = 126;
		["posX"] = 2130;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Not now, I need to deal with some things first.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 1;
		["connectID"] = 23;
		["posX"] = 2370;
		["posY"] = 120;
		["script"] = "";
		["text"] = "What happened?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 28;
		["posX"] = 2610;
		["posY"] = -120;
		["script"] = "";
		["text"] = "Everything! Shooting anything that moves for about 50 cycles now. But now I lost all interest hunting regular beasts. I'm working with individual orders now.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 2610;
		["posY"] = 0;
		["script"] = "";
		["text"] = "No, of course not! A lot of people have been here: caravans, wandering merchants, other hunters. They gathered all the stuff from the ruined settlement and made this hut.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 2850;
		["posY"] = 0;
		["script"] = "";
		["text"] = "It protects from the wind and local beasts, what else a hunter needs? Maybe a good company near a campfire.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 2;
		["animation"] = "dl_talk_2";
		["connectID"] = 24;
		["posX"] = 2610;
		["posY"] = 120;
		["script"] = "";
		["text"] = "A whole lot. I was told I could find here a rare black crucass that eats people and no matter how much they hunt him they can't catch him. So I decided to try and get the trophy.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 126;
		["posX"] = 2850;
		["posY"] = 120;
		["script"] = "";
		["text"] = "I also have a bunch of apprentices, whom I sent away on errands. They still ain't here.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 1;
		["connectID"] = 27;
		["posX"] = 3090;
		["posY"] = 0;
		["script"] = "";
		["text"] = "Do you live here?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 2;
		["connectID"] = 126;
		["posX"] = 3330;
		["posY"] = 0;
		["script"] = "";
		["text"] = "No. There are other camps such as this, near the desert. But the rules are the same.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["connectID"] = 29;
		["posX"] = 2850;
		["posY"] = -120;
		["script"] = "";
		["text"] = "Jackpot town has a lot of rich idiots who want to eat exotic meat or hang exotic heads on the wall. I'm the one who makes their wishes come true, for a certain price, of course.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 30;
		["posX"] = 3090;
		["posY"] = -120;
		["script"] = "";
		["text"] = "Is that who this huge guy is? Your client?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 2;
		["connectID"] = 31;
		["posX"] = 3330;
		["posY"] = -120;
		["script"] = "";
		["text"] = "No, Vasily is an old friend. I invited him to hunt a black crucass. A rare and valuable beast. I'm planning to sell its hide to a certain millionaire.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 2;
		["connectID"] = 126;
		["posX"] = 3570;
		["posY"] = -120;
		["script"] = "";
		["text"] = "And Vasily is a very reliable man. A very good hunting partner for such an occasion.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 1;
		["posX"] = 1170;
		["posY"] = 0;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   self:startTrade()\
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
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 1;
		["connectID"] = 34;
		["posX"] = 1170;
		["posY"] = 150;
		["script"] = "";
		["text"] = "I have a couple of questions...";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 1;
		["connectID"] = 89;
		["posX"] = 1890;
		["posY"] = 360;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 1;
		["connectID"] = 38;
		["posX"] = 1890;
		["posY"] = 600;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"little_helpers\", \"msasi_needs_power_cell\")\
end\
\
";
		["text"] = "I'm looking for a job.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 2;
		["connectID"] = 39;
		["posX"] = 2130;
		["posY"] = 600;
		["script"] = "";
		["text"] = "That's not a question, but I might have something for you.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["connectID"] = 40;
		["posX"] = 2370;
		["posY"] = 600;
		["script"] = "";
		["text"] = "I managed to spill some melon juice on a miniature power cell. I quickly forgot about it, but imagine my surprise when I saw a couple of bitebugs dragging the power cell towards one of their hives.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00040"] = {
		["ID"] = 40;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 2610;
		["posY"] = 600;
		["script"] = "";
		["text"] = "[t_little_helpers:msasi_needs_power_cell]I tried to intervene but the little buggers ran into a small hole, too small for me to crawl through.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 1;
		["connectID"] = 42;
		["posX"] = 3000;
		["posY"] = 450;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"little_helpers\", \"start\")\
end\
\
";
		["text"] = "And what do you expect me to do? Crawl into this hole instead of you?";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 2;
		["connectID"] = 43;
		["posX"] = 3240;
		["posY"] = 450;
		["script"] = "";
		["text"] = "Not exactly. The hole is just too small. But there is another way.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 2;
		["animation"] = "dl_point_forward";
		["connectID"] = 65;
		["posX"] = 3480;
		["posY"] = 450;
		["script"] = "";
		["text"] = "I have noticed that you have a scanner, which means you also have a device that is capable of interfacing with a neurochip. And that basically means that you can remote control bitebugs, if you catch some alive!";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 1;
		["animation"] = "dl_talk_3";
		["connectID"] = 48;
		["posX"] = 4830;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Let's say I find this small cave. How do I get the power cell out of there?";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 2;
		["animation"] = "dl_righthand_wave_med";
		["connectID"] = 49;
		["posX"] = 5070;
		["posY"] = 390;
		["script"] = "";
		["text"] = "I'm sure you'll figure it out. The bitebugs can carry items 30 times heavier than they are, and that particular power cell isn't that big.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 1;
		["connectID"] = 89;
		["posX"] = 5310;
		["posY"] = 390;
		["script"] = "";
		["text"] = "I'll see what I can do.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 1;
		["connectID"] = 52;
		["posX"] = 1140;
		["posY"] = 1740;
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
		["text"] = "[t_little_helpers:finish]I found the power cell.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 2;
		["connectID"] = 53;
		["posX"] = 1380;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "[t_find_terminal:msasi_found_battery]*grins* See? Wasn't that hard, was it?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 1;
		["animation"] = "dl_righthand_wave_short";
		["connectID"] = 54;
		["posX"] = 1620;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "This whole planet is fucking mad!";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 2;
		["animation"] = "dl_chuckle";
		["connectID"] = 89;
		["posX"] = 1860;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "*laughs* You haven't seen the half of it. Welcome to K'Tharsis, huma! Here is your reward.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 2;
		["connectID"] = 56;
		["posX"] = -270;
		["posY"] = 900;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 2;
		["connectID"] = 2;
		["posX"] = 210;
		["posY"] = 960;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getDialogParam(\"secondTime\")\
end\
\
";
		["text"] = "Oh, it's you, huma.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 1;
		["connectID"] = 92;
		["posX"] = 3000;
		["posY"] = 600;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"little_helpers\", \"finish\")\
end\
\
";
		["text"] = "\\[Show power cell] Is that the power cell you're talking about?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 2;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 89;
		["posX"] = 3480;
		["posY"] = 600;
		["script"] = "";
		["text"] = "[t_little_helpers:finish]Excellent! Here is your reward.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 1;
		["connectID"] = 62;
		["posX"] = 3000;
		["posY"] = 750;
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
		["text"] = "[HIDDEN]Actually I did stumble upon some small power cell.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 2;
		["connectID"] = 63;
		["posX"] = 3240;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Really? And where is it now?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 1;
		["connectID"] = 64;
		["posX"] = 3480;
		["posY"] = 750;
		["script"] = "";
		["text"] = "I don't have it on me. I guess I've misplaced it.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 2;
		["posX"] = 3720;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Well, when you do find it, bring it to me. You'll get a shiny reward.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00066"] = {
		["ID"] = 66;
		["actor"] = 1;
		["animation"] = "dl_head_nod";
		["connectID"] = 67;
		["posX"] = 3870;
		["posY"] = 510;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getGlobalParam(\"firstTimeBug\") == false\
end\
\
";
		["text"] = "Yeah, I know, I've already tried it.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
		["actor"] = 2;
		["connectID"] = 71;
		["posX"] = 4110;
		["posY"] = 510;
		["script"] = "";
		["text"] = "You did? That makes it much easier.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 2;
		["animation"] = "dl_point_back";
		["connectID"] = 47;
		["posX"] = 4590;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Make sure to check out that cleft in the rocks that is overgrown with bluethorns - those glowing blue plants - that's where the little buggers escaped with my power cell.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 1;
		["connectID"] = 70;
		["posX"] = 3870;
		["posY"] = 390;
		["script"] = "";
		["text"] = "That escalated quickly. Care to elaborate?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00070"] = {
		["ID"] = 70;
		["actor"] = 2;
		["connectID"] = 71;
		["posX"] = 4110;
		["posY"] = 390;
		["script"] = "";
		["text"] = "In short, there is a neurochip that you can implant into living bugs and take over their motor functions. ";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00071"] = {
		["ID"] = 71;
		["actor"] = 2;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 68;
		["posX"] = 4350;
		["posY"] = 390;
		["script"] = "";
		["text"] = "[t_little_helpers:start]Here, take these chips. Just don't waste them.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00072"] = {
		["ID"] = 72;
		["actor"] = 1;
		["connectID"] = 118;
		["posX"] = 1140;
		["posY"] = 810;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"find_terminal\", \"start\")\
end\
\
";
		["text"] = "Does this planet even have a comm system?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00073"] = {
		["ID"] = 73;
		["actor"] = 2;
		["connectID"] = 109;
		["posX"] = 1620;
		["posY"] = 810;
		["script"] = "";
		["text"] = "You think we're savages or something?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00074"] = {
		["ID"] = 74;
		["actor"] = 1;
		["animation"] = "dl_point_back";
		["connectID"] = 117;
		["posX"] = 1140;
		["posY"] = 960;
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
		["text"] = "[t_find_terminal:msasi_found]I found the terminal in a cave not so far away.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00077"] = {
		["ID"] = 77;
		["actor"] = 1;
		["connectID"] = 119;
		["posX"] = 1140;
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
		["text"] = "[t_find_terminal:msasi_find_battery_first]The terminal is here.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00080"] = {
		["ID"] = 80;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 112;
		["posX"] = 1770;
		["posY"] = 1560;
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
		["text"] = "[t_find_terminal:msasi_found_battery]I found it.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00082"] = {
		["ID"] = 82;
		["actor"] = 2;
		["connectID"] = 111;
		["posX"] = 1770;
		["posY"] = 1200;
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
		["text"] = "[t_find_terminal:msasi_lost_battery]Yeah, about the battery. We don't have it anymore. My bad.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 2;
		["connectID"] = 89;
		["posX"] = 1770;
		["posY"] = 1320;
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
		["text"] = "[t_find_terminal:msasi_do_little_helpers]As for the battery - you know what to do.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00086"] = {
		["ID"] = 86;
		["actor"] = 2;
		["animation"] = "dl_point_left";
		["connectID"] = 89;
		["posX"] = 2730;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "Now just plug it in and we'll have a working terminal.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00087"] = {
		["ID"] = 87;
		["actor"] = 1;
		["connectID"] = 88;
		["posX"] = 1140;
		["posY"] = 1950;
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
		["text"] = "[t_find_terminal:finish]The terminal is perfectly fine.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00088"] = {
		["ID"] = 88;
		["actor"] = 2;
		["connectID"] = 114;
		["posX"] = 1380;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "Nice.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00089"] = {
		["ID"] = 89;
		["actor"] = 2;
		["connectID"] = 2;
		["posX"] = 4410;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 2;
		["connectID"] = 86;
		["posX"] = 1770;
		["posY"] = 1440;
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
		["text"] = "[t_find_terminal:msasi_returned_battery_before]Here, that's the one you found for me earlier.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00092"] = {
		["ID"] = 92;
		["actor"] = 2;
		["connectID"] = 59;
		["posX"] = 3240;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Oh, so you've found it already?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00093"] = {
		["ID"] = 93;
		["actor"] = 2;
		["connectID"] = 94;
		["posX"] = 2100;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "Here, have some ammo for the trouble.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00095"] = {
		["ID"] = 95;
		["actor"] = 1;
		["connectID"] = 120;
		["posX"] = 2490;
		["posY"] = 1830;
		["script"] = "";
		["text"] = "[t_find_terminal:msasi_ammo_22]I'll take 25 rounds of 22 cal. ammo.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00096"] = {
		["ID"] = 96;
		["actor"] = 1;
		["connectID"] = 120;
		["posX"] = 2490;
		["posY"] = 2070;
		["script"] = "";
		["text"] = "[t_find_terminal:msasi_ammo_shotgun]I'll take 12 shotgun shells.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00098"] = {
		["ID"] = 98;
		["actor"] = 1;
		["connectID"] = 120;
		["posX"] = 2490;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "[t_find_terminal:msasi_ammo_revolver]I'll take 20 rounds of revolver ammo.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00100"] = {
		["ID"] = 100;
		["actor"] = 1;
		["connectID"] = 101;
		["posX"] = 2100;
		["posY"] = 810;
		["script"] = "";
		["text"] = "What for?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00101"] = {
		["ID"] = 101;
		["actor"] = 2;
		["connectID"] = 110;
		["posX"] = 2340;
		["posY"] = 810;
		["script"] = "";
		["text"] = "I have no idea. Maybe they thought they could make it spit out greens.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00104"] = {
		["ID"] = 104;
		["actor"] = 2;
		["connectID"] = 106;
		["posX"] = 1860;
		["posY"] = 960;
		["script"] = "";
		["text"] = "You know what? Ask Vasily to bring the terminal back here and check on the insides.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00105"] = {
		["ID"] = 105;
		["actor"] = 2;
		["connectID"] = 104;
		["posX"] = 1620;
		["posY"] = 960;
		["script"] = "";
		["text"] = "Yeah, sounds a lot like locals. It's not the worst that could have come to their stoned minds. ";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00106"] = {
		["ID"] = 106;
		["actor"] = 2;
		["connectID"] = 107;
		["posX"] = 2100;
		["posY"] = 960;
		["script"] = "";
		["text"] = "It's about time for the big guy to take a walk. He already started talking to his damn hoverbike.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00107"] = {
		["ID"] = 107;
		["actor"] = 1;
		["connectID"] = 108;
		["posX"] = 2340;
		["posY"] = 960;
		["script"] = "";
		["text"] = "Are you sure he can handle it?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00108"] = {
		["ID"] = 108;
		["actor"] = 2;
		["animation"] = "dl_chuckle";
		["connectID"] = 89;
		["posX"] = 2580;
		["posY"] = 960;
		["script"] = "";
		["text"] = "You're joking, right? He has an exoskeleton in his spacesuit. He can carry three times as much, as long as he has enough \"fuel\" for the trip.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00109"] = {
		["ID"] = 109;
		["actor"] = 2;
		["connectID"] = 100;
		["posX"] = 1860;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Not so long ago we had our own postal terminal here in this camp. But some morons stole it while I was away. ";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00110"] = {
		["ID"] = 110;
		["actor"] = 2;
		["connectID"] = 89;
		["posX"] = 2580;
		["posY"] = 810;
		["script"] = "";
		["text"] = "[t_find_terminal:start]Let me know if you find it. The thing weighs half a ton, they couldn't have gotten too far with it.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00111"] = {
		["ID"] = 111;
		["actor"] = 2;
		["connectID"] = 39;
		["posX"] = 2010;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Shouldn't have left such a valuable thing unattended.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00112"] = {
		["ID"] = 112;
		["actor"] = 2;
		["connectID"] = 113;
		["posX"] = 2010;
		["posY"] = 1560;
		["script"] = "";
		["text"] = "Excellent! Let's see...";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00113"] = {
		["ID"] = 113;
		["actor"] = 2;
		["animation"] = "dl_head_nod";
		["connectID"] = 86;
		["posX"] = 2250;
		["posY"] = 1560;
		["script"] = "";
		["text"] = "[t_little_helpers:finish]Yes, it's exactly the one I've brought from the city.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00114"] = {
		["ID"] = 114;
		["actor"] = 2;
		["connectID"] = 115;
		["posX"] = 1620;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "I missed this useful contraption - it is simply indispensable if you want to mail in something small. ";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00115"] = {
		["ID"] = 115;
		["actor"] = 2;
		["connectID"] = 93;
		["posX"] = 1860;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "Don't forget to check 'Jobs' and 'Wanted' tabs. Surely, such a sleek guy like yourself could find there a couple of lucrative opportunities.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00117"] = {
		["ID"] = 117;
		["actor"] = 1;
		["connectID"] = 105;
		["posX"] = 1380;
		["posY"] = 960;
		["script"] = "";
		["text"] = "Looked like someone tried to open it. I mean crack it open, with brute force.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00118"] = {
		["ID"] = 118;
		["actor"] = 1;
		["animation"] = "dl_hands_dontknow";
		["connectID"] = 73;
		["posX"] = 1380;
		["posY"] = 810;
		["script"] = "";
		["text"] = "A post office? Telegraph? Maybe, oh, I don't know, carrier pigeons?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00119"] = {
		["ID"] = 119;
		["actor"] = 1;
		["connectID"] = 79;
		["posX"] = 1380;
		["posY"] = 1290;
		["script"] = "";
		["text"] = "Vasily says that he fixed everything he could and the terminal should work even better than before, but we need a new battery.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00120"] = {
		["ID"] = 120;
		["actor"] = 2;
		["connectID"] = 89;
		["posX"] = 2760;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "Good choice!";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00122"] = {
		["ID"] = 122;
		["actor"] = 1;
		["connectID"] = 79;
		["posX"] = 1140;
		["posY"] = 1410;
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
		["text"] = "[t_find_terminal:msasi_find_battery_second]About the battery...";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00123"] = {
		["ID"] = 123;
		["actor"] = 1;
		["connectID"] = 124;
		["posX"] = 1890;
		["posY"] = -270;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"to_fort\", \"start\")\
end\
\
";
		["text"] = "Is there a human city or a settlement here somewhere?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00124"] = {
		["ID"] = 124;
		["actor"] = 2;
		["animation"] = "dl_head_2nods";
		["connectID"] = 125;
		["posX"] = 2130;
		["posY"] = -270;
		["script"] = "";
		["text"] = "[t_to_fort:start]Well, yes. Head north from this camp and follow the river. You'll see it.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00125"] = {
		["ID"] = 125;
		["actor"] = 2;
		["connectID"] = 126;
		["posX"] = 2370;
		["posY"] = -270;
		["script"] = "";
		["text"] = "I think you'll manage to find a way in.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00126"] = {
		["ID"] = 126;
		["actor"] = 2;
		["connectID"] = 34;
		["posX"] = 4110;
		["posY"] = -570;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["switch_00002"] = {
		["ID"] = 2;
		["connectionsID"] = {
			[1] = 32;
			[2] = 35;
			[3] = 37;
			[4] = 72;
			[5] = 74;
			[6] = 77;
			[7] = 122;
			[8] = 51;
			[9] = 87;
			[10] = 8;
		};
		["h"] = 240;
		["posX"] = 780;
		["posY"] = 810;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00034"] = {
		["ID"] = 34;
		["connectionsID"] = {
			[1] = 123;
			[2] = 3;
			[3] = 5;
			[4] = 6;
			[5] = 7;
			[6] = 36;
		};
		["h"] = 160;
		["posX"] = 1440;
		["posY"] = 150;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00056"] = {
		["ID"] = 56;
		["connectionsID"] = {
			[1] = 0;
			[2] = 57;
		};
		["posX"] = 30;
		["posY"] = 900;
		["type"] = "switch";
	};
	["switch_00060"] = {
		["ID"] = 60;
		["connectionsID"] = {
			[1] = 41;
			[2] = 58;
			[3] = 61;
		};
		["posX"] = 2850;
		["posY"] = 600;
		["type"] = "switch";
	};
	["switch_00065"] = {
		["ID"] = 65;
		["connectionsID"] = {
			[1] = 69;
			[2] = 66;
		};
		["posX"] = 3720;
		["posY"] = 450;
		["type"] = "switch";
	};
	["switch_00079"] = {
		["ID"] = 79;
		["connectionsID"] = {
			[1] = 82;
			[2] = 83;
			[3] = 91;
			[4] = 80;
		};
		["h"] = 120;
		["posX"] = 1620;
		["posY"] = 1380;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00094"] = {
		["ID"] = 94;
		["connectionsID"] = {
			[1] = 95;
			[2] = 98;
			[3] = 96;
		};
		["posX"] = 2340;
		["posY"] = 1950;
		["type"] = "switch";
	};
}
local obj2 = {
	["actor_prefab"] = {
		[1] = "human_male";
		[2] = "abori";
	};
}
return obj1 ,obj2
