-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = -900;
		["posY"] = 300;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 24;
		["posX"] = -450;
		["posY"] = -600;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 32;
		["posX"] = -480;
		["posY"] = 390;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 2;
		["connectID"] = 6;
		["posX"] = 60;
		["posY"] = 900;
		["script"] = "";
		["text"] = "What?";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 1;
		["connectID"] = 60;
		["posX"] = 1290;
		["posY"] = 150;
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
		["text"] = "Wanna talk about the Scarecrow?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["posX"] = 1290;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "Bye";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 2760;
		["posY"] = 30;
		["script"] = "";
		["text"] = "[t_scarecrow:red_about_scarecrow]Can't start the story without a special kick. Get me a shot of Kwagga's Special - and then we can talk.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 1;
		["connectID"] = 12;
		["posX"] = 1290;
		["posY"] = 960;
		["script"] = "";
		["text"] = "I wanted to ask something...";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 1;
		["connectID"] = 17;
		["posX"] = 1710;
		["posY"] = 1260;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 2;
		["connectID"] = 12;
		["posX"] = 3630;
		["posY"] = 840;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["connectID"] = 6;
		["posX"] = 8010;
		["posY"] = 540;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 1;
		["connectID"] = 50;
		["posX"] = 1710;
		["posY"] = 960;
		["script"] = "";
		["text"] = "How did you become a mercenary?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 33;
		["posX"] = 2130;
		["posY"] = 210;
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
		["text"] = "[t_scarecrow:red_give_special_booze]\\[Give Kwagga's Special]Here it is. Hope you're still able to function after taking this draff.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["connectID"] = 68;
		["posX"] = 870;
		["posY"] = -210;
		["script"] = "";
		["text"] = "[t_scarecrow:red_drinks_special_booze]Here's to you... *drinks*";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["animation"] = "dl_look_down_long";
		["connectID"] = 107;
		["posX"] = 4800;
		["posY"] = -420;
		["script"] = "";
		["text"] = "We've sent out a search party... but found no corpses. Don't wanna think what kind of messed up things that freak could do to them...";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 1;
		["connectID"] = 23;
		["posX"] = 1290;
		["posY"] = 600;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scarecrow\", \"red_scarecrow_reward\")\
end\
\
";
		["text"] = "I got rid of the Scarecrow.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 2;
		["connectID"] = 44;
		["posX"] = 1560;
		["posY"] = 600;
		["script"] = "";
		["text"] = "[t_scarecrow:red_scarecrow_reward]All by yourself? Hmm... A resourceful son of a gun you are. Well, I guess I can sleep easy today, knowing that freak won't be around any more.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 1;
		["connectID"] = 27;
		["posX"] = -60;
		["posY"] = -660;
		["script"] = "";
		["text"] = "[t_scarecrow:red_about_scarecrow]Give scarecrow info";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 1;
		["posX"] = -60;
		["posY"] = -510;
		["script"] = "";
		["text"] = "End";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 2;
		["connectID"] = 28;
		["posX"] = 180;
		["posY"] = -660;
		["script"] = "";
		["text"] = "Booze ";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["posX"] = 420;
		["posY"] = -660;
		["script"] = "";
		["text"] = "[t_scarecrow:red_give_special_booze]Pretend i gave it to you";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 2;
		["connectID"] = 30;
		["posX"] = 60;
		["posY"] = -210;
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
		["text"] = "[t_scarecrow:red_ready_for_special_booze]Ah. Love this earthy smell of herbs and grass...";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 2;
		["animation"] = "dl_come_here";
		["connectID"] = 31;
		["posX"] = 330;
		["posY"] = -210;
		["script"] = "";
		["text"] = "Want some?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 1;
		["animation"] = "dl_head_shake";
		["connectID"] = 20;
		["posX"] = 600;
		["posY"] = -210;
		["script"] = "";
		["text"] = "Nah, I'm fine, go ahead.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 2;
		["posX"] = 2400;
		["posY"] = 210;
		["script"] = "";
		["text"] = "I'll try. Let's find a quiet place so no one sees me drinking on the job. Being locked in the Fort's brig sucks ass, trust me. Let's go!";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 35;
		["posX"] = 60;
		["posY"] = -360;
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
		["text"] = "[t_scarecrow:red_wait_for_special_booze]Not here!";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 2;
		["animation"] = "dl_righthand_wave_short";
		["posX"] = 330;
		["posY"] = -360;
		["script"] = "";
		["text"] = "Calm down. Just around the corner.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 1;
		["animation"] = "dl_frustration";
		["connectID"] = 42;
		["posX"] = 3030;
		["posY"] = 30;
		["script"] = "";
		["text"] = "Great, yet another addict, that cannot function without his poison! Can someone on this planet do something without asking for a bottle of booze?";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 2;
		["animation"] = "dl_point_right";
		["connectID"] = 110;
		["posX"] = 3840;
		["posY"] = 30;
		["script"] = "";
		["text"] = "You can find Kwagga here, in the Fort. He's a funny abori selling all kinds of crap. What was it? \"Cheap shit for ten\" or \"All garbage for ten\", or something like that.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 2;
		["connectID"] = 39;
		["posX"] = 1710;
		["posY"] = 30;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scarecrow\", \"red_about_scarecrow\")\
end\
\
";
		["text"] = "And who the hell are you? A bounty hunter?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 1;
		["connectID"] = 40;
		["posX"] = 1980;
		["posY"] = 30;
		["script"] = "";
		["text"] = "A man, who is not afraid to get his hands dirty. Captain Castor is worried about the morale in the Fort. He allowed me to interrogate you and do anything I can, to stop that nonsense you started to spit out recently. By force, if needed.";
		["time"] = 24.5;
		["type"] = "message";
	};
	["message_00040"] = {
		["ID"] = 40;
		["actor"] = 2;
		["animation"] = "dl_hand_at_mouth_yelling";
		["connectID"] = 41;
		["posX"] = 2250;
		["posY"] = 30;
		["script"] = "";
		["text"] = "Seriously? Well go ahead! Make my day, little man! And about that prick Castor... he can go to the nearest place, where the sun doesn't shine! I'm not his slave to be shut up like this! Screw the old one-eyed dog face!";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 2;
		["animation"] = "dl_hand_facepalm";
		["connectID"] = 9;
		["posX"] = 2520;
		["posY"] = 30;
		["script"] = "";
		["text"] = "You know what? I'll tell you the whole thing about the Scarecrow, but the hangover is killing me. I feel that my poor head is going to shatter into tiny pieces if I talk to you for another minute or so.";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 2;
		["animation"] = "dl_righthand_wave_med";
		["connectID"] = 43;
		["posX"] = 3300;
		["posY"] = 30;
		["script"] = "";
		["text"] = "Nah, it's a local tradition, dude. Don't look at me like that! Just go get my medicine!";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 1;
		["connectID"] = 37;
		["posX"] = 3570;
		["posY"] = 30;
		["script"] = "";
		["text"] = "Fine... Where can I find that Kwagga guy?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 1;
		["connectID"] = 45;
		["posX"] = 1830;
		["posY"] = 600;
		["script"] = "";
		["text"] = "No cash for getting rid of your nightmares?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 2;
		["animation"] = "dl_shrug_long";
		["connectID"] = 46;
		["posX"] = 2100;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Nope, go collect your bounty from our good ol' Captain, pal. I'm a poor working man here, barely scraping by. I'll drink one for your health next time though! That's a promise!";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 1;
		["animation"] = "dl_clench_fist";
		["connectID"] = 17;
		["posX"] = 2370;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Better keep your mouth shut about your acquaintance with the Scarecrow or I will have one at your funeral, you stinking drunk.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 2;
		["connectID"] = 116;
		["posX"] = 1980;
		["posY"] = 960;
		["script"] = "";
		["text"] = "My parents were hydroponic farmers in Lermer's Freehold but little Red wasn't particularly good with any farmer stuff, you know. All thumbs with this kind of things.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 2;
		["connectID"] = 52;
		["posX"] = 2520;
		["posY"] = 960;
		["script"] = "";
		["text"] = "So you can imagine how it went from there: young me, ran with a bad crowd till some fellas got punched, some property damaged or... relocated and finaly some annoying prick got shot in the guts and bled to death, but not fast enough... I wasn't welcome in my hometown anymore.";
		["time"] = 27;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 1;
		["connectID"] = 53;
		["posX"] = 2790;
		["posY"] = 960;
		["script"] = "";
		["text"] = "You're telling me that for a guy like you there wasn't much choice of a career here, on K'Tharsis?";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 2;
		["connectID"] = 16;
		["posX"] = 3060;
		["posY"] = 960;
		["script"] = "";
		["text"] = "Exactly. Either Blackthorns or go straight outlaw. At least here, with the Thorns, when you put a bullet into some poor bastard's head, you won't get some trigger itchy bounty hunter at your door next day.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 1;
		["connectID"] = 55;
		["posX"] = 1710;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Do mercenaries get paid well?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 2;
		["connectID"] = 56;
		["posX"] = 1980;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Why asking?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 1;
		["connectID"] = 113;
		["posX"] = 2250;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Maybe I intend to join your gang soon.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 1;
		["connectID"] = 59;
		["posX"] = 2790;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Still, what can I expect from signing a contract with your organization?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 2;
		["animation"] = "dl_talk_2";
		["connectID"] = 16;
		["posX"] = 3060;
		["posY"] = 810;
		["script"] = "";
		["text"] = "If you manage to do so, then you will rake in some poor antigrav' digger full year of salary in one month or so. Plus risk and combat compensation. Most people here can only dream of such income, but most don't have what it takes to be a Blackthorn either.";
		["time"] = 26.5;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 2;
		["connectID"] = 64;
		["posX"] = 1710;
		["posY"] = 270;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scarecrow\", \"red_booze\")\
end\
\
";
		["text"] = "You got the booze?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00066"] = {
		["ID"] = 66;
		["actor"] = 1;
		["animation"] = "dl_head_shake";
		["connectID"] = 67;
		["posX"] = 2130;
		["posY"] = 360;
		["script"] = "";
		["text"] = "No.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
		["actor"] = 2;
		["animation"] = "dl_shrug_short";
		["connectID"] = 17;
		["posX"] = 2400;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Well, my answer is identical, then.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 1;
		["connectID"] = 69;
		["posX"] = 1140;
		["posY"] = -210;
		["script"] = "";
		["text"] = "Now when you had your happy time, let's start with your story.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 2;
		["connectID"] = 81;
		["posX"] = 1410;
		["posY"] = -210;
		["script"] = "";
		["text"] = "Man, you are a real buzzcut, aren't you?  ";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00070"] = {
		["ID"] = 70;
		["actor"] = 2;
		["connectID"] = 74;
		["posX"] = 2910;
		["posY"] = -420;
		["script"] = "";
		["text"] = "While I was seeing mostly red circles and trying not to gun down my own teammates, Dane had his ugly bald head blasted off with some huge double barrel shotgun.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00071"] = {
		["ID"] = 71;
		["actor"] = 1;
		["animation"] = "dl_count_to_one";
		["connectID"] = 75;
		["posX"] = 3450;
		["posY"] = -420;
		["script"] = "";
		["text"] = "A good opportunity to kill that rabid dog, don't you think?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00072"] = {
		["ID"] = 72;
		["actor"] = 1;
		["connectID"] = 73;
		["posX"] = 2370;
		["posY"] = -420;
		["script"] = "";
		["text"] = "Some desert punk was alone by himself and just hiding under the bridge like a troll in fairy tale? Can't believe he took out two trained mercenaries so easily.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00073"] = {
		["ID"] = 73;
		["actor"] = 2;
		["connectID"] = 70;
		["posX"] = 2640;
		["posY"] = -420;
		["script"] = "";
		["text"] = "You see, that Scarecrow fellow, he might have lost his marbles, but he's not an idiot! He threw a flashbang first and that hit right home with us three.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00074"] = {
		["ID"] = 74;
		["actor"] = 2;
		["connectID"] = 71;
		["posX"] = 3180;
		["posY"] = -420;
		["script"] = "";
		["text"] = "First thing I see - that freak is straddling on Miller stabbing him in the face with a shank so fast I coudn't count the strikes even if I wanted. Man, that was some real FUBAR situation, I must tell you.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00075"] = {
		["ID"] = 75;
		["actor"] = 2;
		["connectID"] = 79;
		["posX"] = 3720;
		["posY"] = -420;
		["script"] = "";
		["text"] = "And I didn't waste it. Missed the bastard's head, unfortunately. His armor took some direct hits as if I was shooting some damn BB gun, then he shot back...";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00076"] = {
		["ID"] = 76;
		["actor"] = 2;
		["connectID"] = 77;
		["posX"] = 4260;
		["posY"] = -420;
		["script"] = "";
		["text"] = "I was literally swept aside from the bridge and landed in the water below. Cracked my combat helmet against some damn rocks and almost drowned. Man, I'm glad I was wearing that tin can on my pumpkin that day.";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00077"] = {
		["ID"] = 77;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 4530;
		["posY"] = -420;
		["script"] = "";
		["text"] = "I don't have the slightest idea why the Scarecrow hasn't finished me off. The folks from Hunters Rest fished me out of the river and brought back to Fort. That patrol costed me five broken ribs, huge bruises and soiled pants - just a flesh wound, like our medic says.";
		["time"] = 26;
		["type"] = "message";
	};
	["message_00078"] = {
		["ID"] = 78;
		["actor"] = 2;
		["connectID"] = 72;
		["posX"] = 2100;
		["posY"] = -420;
		["script"] = "";
		["text"] = "Okay-okay, here's what I told Castor many times and I will repeat it again: we went past the Hunter's Rest and were crossing the small river, heading south, to the edge of the desert, when that crazy bastard in his ugly sack hat just literally jumped from under the bridge!";
		["time"] = 26;
		["type"] = "message";
	};
	["message_00079"] = {
		["ID"] = 79;
		["actor"] = 2;
		["connectID"] = 76;
		["posX"] = 3990;
		["posY"] = -420;
		["script"] = "";
		["text"] = "I think it was an 8 gauge boomstick, cause it hit me like a ten ton garbage truck. Right here into my chest armor plate. Had to replace the vest completely!";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00080"] = {
		["ID"] = 80;
		["actor"] = 1;
		["connectID"] = 78;
		["posX"] = 1830;
		["posY"] = -420;
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
		["text"] = "[t_scarecrow:red_interrogation_1]Your failed patrol mission. How come the other two mercs didn't make it?";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00082"] = {
		["ID"] = 82;
		["actor"] = 1;
		["connectID"] = 83;
		["posX"] = 1830;
		["posY"] = -180;
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
		["text"] = "[t_scarecrow:red_interrogation_2]A bird whistled, that you were spreading gossip about you and the Scarecrow being friends before, at your previous job.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 2;
		["animation"] = "dl_hand_negative";
		["connectID"] = 84;
		["posX"] = 2100;
		["posY"] = -180;
		["script"] = "";
		["text"] = "Friends? Goodness gracious, no!";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00084"] = {
		["ID"] = 84;
		["actor"] = 2;
		["animation"] = "dl_frustration";
		["connectID"] = 85;
		["posX"] = 2370;
		["posY"] = -180;
		["script"] = "";
		["text"] = "Listen man, I technically got myself marinated that day! Must deal with a damn PTSD from that encounter!";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00085"] = {
		["ID"] = 85;
		["actor"] = 1;
		["animation"] = "dl_hand_chopfast";
		["connectID"] = 86;
		["posX"] = 2640;
		["posY"] = -180;
		["script"] = "";
		["text"] = "Cut the crap and tell me what you got on the Scarecrow. Any info that helps me to find that psycho!";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00086"] = {
		["ID"] = 86;
		["actor"] = 2;
		["animation"] = "dl_look_down_long";
		["connectID"] = 87;
		["posX"] = 2910;
		["posY"] = -180;
		["script"] = "";
		["text"] = "*Sighs* Well... Where do I start...";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00087"] = {
		["ID"] = 87;
		["actor"] = 1;
		["animation"] = "dl_hand_showleft";
		["connectID"] = 88;
		["posX"] = 3180;
		["posY"] = -180;
		["script"] = "";
		["text"] = "From the beginning.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00088"] = {
		["ID"] = 88;
		["actor"] = 2;
		["connectID"] = 89;
		["posX"] = 3450;
		["posY"] = -180;
		["script"] = "";
		["text"] = "Ugh!";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00089"] = {
		["ID"] = 89;
		["actor"] = 2;
		["connectID"] = 90;
		["posX"] = 3720;
		["posY"] = -180;
		["script"] = "";
		["text"] = "Ok, when I was ten years younger... I worked for Terraform. There was a strange guy, don't know his real name but we called him Crow. He was a newbie mercenary at the Devil's Throat. Just like I was.";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00090"] = {
		["ID"] = 90;
		["actor"] = 1;
		["connectID"] = 91;
		["posX"] = 3990;
		["posY"] = -180;
		["script"] = "";
		["text"] = "Devil's Throat?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 2;
		["connectID"] = 92;
		["posX"] = 4260;
		["posY"] = -180;
		["script"] = "";
		["text"] = "Yes. That's the biggest and deepest antigravium mine on K'Tharsis. The closest place to hell as some people say.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00092"] = {
		["ID"] = 92;
		["actor"] = 2;
		["connectID"] = 94;
		["posX"] = 4530;
		["posY"] = -180;
		["script"] = "";
		["text"] = "Numerous slaves working hard there twenty-four hours a day. And someone should look after them, to keep them busy and to squash revolts. That's what we did. Well, someone has to shovel this shit. Good money, though.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00093"] = {
		["ID"] = 93;
		["actor"] = 2;
		["colors"] = {
			[4] = {
				[1] = 255;
				[2] = 0;
				[3] = 255;
				[4] = 255;
			};
			[6] = {
				[1] = 255;
				[2] = 0;
				[3] = 255;
				[4] = 255;
			};
		};
		["posX"] = 3450;
		["posY"] = -90;
		["script"] = "";
		["text"] = "here driks fro his bottle again";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00094"] = {
		["ID"] = 94;
		["actor"] = 2;
		["animation"] = "dl_look_left";
		["connectID"] = 95;
		["posX"] = 4800;
		["posY"] = -180;
		["script"] = "";
		["text"] = "That guy, Crow, I think he was insane long before he came into Devil's Throat, this work just helped him to release his demons.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00095"] = {
		["ID"] = 95;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["connectID"] = 96;
		["posX"] = 5070;
		["posY"] = -180;
		["script"] = "";
		["text"] = "He was cruel with slaves and ruthless to the ones who dared to rebel. He enjoyed fear. That's why he made this shitty mask from a sack. He terrorized slaves, and then even other mercenaries, laughing like a madman. Fucking creepy.";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00096"] = {
		["ID"] = 96;
		["actor"] = 1;
		["animation"] = "dl_head_scratch";
		["connectID"] = 97;
		["posX"] = 5340;
		["posY"] = -180;
		["script"] = "";
		["text"] = "You think our mysterious raider could be your... friend from before?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00097"] = {
		["ID"] = 97;
		["actor"] = 2;
		["animation"] = "dl_hands_washing";
		["connectID"] = 98;
		["posX"] = 5610;
		["posY"] = -180;
		["script"] = "";
		["text"] = "Could be. One day he just disappeared. I thought slaves killed him and managed to hide his body. Never thought I'll see this fucking sack again. I can't even sleep now, it's haunting me even in my dreams.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00098"] = {
		["ID"] = 98;
		["actor"] = 1;
		["animation"] = "dl_hands_strike";
		["connectID"] = 99;
		["posX"] = 5880;
		["posY"] = -180;
		["script"] = "";
		["text"] = "A fascinating story, but next time try to keep your mouth shut even if you drink yourself into stupor. Otherwise some of the Scarecrow's \"fans\" might want to pay you a visit. And you wouldn't want that, would you?";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00099"] = {
		["ID"] = 99;
		["actor"] = 2;
		["animation"] = "dl_head_2nods";
		["connectID"] = 101;
		["posX"] = 6150;
		["posY"] = -180;
		["script"] = "";
		["text"] = "You can bet on it, pal. Guys here already think I'm a crybaby whimp. But Red will show them, he still can keep his shit together!";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00101"] = {
		["ID"] = 101;
		["actor"] = 2;
		["animation"] = "dl_look_up";
		["connectID"] = 107;
		["posX"] = 6420;
		["posY"] = -180;
		["script"] = "";
		["text"] = "And if you finish off that Scarecrow freak, he might even start sleeping without his medicine again!";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00104"] = {
		["ID"] = 104;
		["actor"] = 2;
		["colors"] = {
			[4] = {
				[1] = 255;
				[2] = 0;
				[3] = 255;
				[4] = 255;
			};
			[6] = {
				[1] = 255;
				[2] = 0;
				[3] = 255;
				[4] = 255;
			};
		};
		["posX"] = 6420;
		["posY"] = -60;
		["script"] = "";
		["text"] = "drinks again";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00106"] = {
		["ID"] = 106;
		["actor"] = 2;
		["connectID"] = 81;
		["posX"] = 6990;
		["posY"] = -450;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scarecrow\", \"red_interrogation_1\")\
      or getQuestTopicVisible(\"scarecrow\", \"red_interrogation_2\")\
end\
\
";
		["text"] = "Anything else?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00108"] = {
		["ID"] = 108;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 6990;
		["posY"] = -330;
		["script"] = "";
		["text"] = "[t_scarecrow:red_scarecrow_lore]Anything else?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00109"] = {
		["ID"] = 109;
		["actor"] = 2;
		["colors"] = {
			[4] = {
				[1] = 255;
				[2] = 0;
				[3] = 0;
				[4] = 255;
			};
			[6] = {
				[1] = 255;
				[2] = 0;
				[3] = 0;
				[4] = 255;
			};
		};
		["posX"] = 5880;
		["posY"] = -300;
		["script"] = "";
		["text"] = "Who knows maybe?";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00110"] = {
		["ID"] = 110;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 4110;
		["posY"] = 30;
		["script"] = "";
		["text"] = "That lizard has a knack for mixing some strong adult beverage though. He still should have some of his special stuff for sale.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00112"] = {
		["ID"] = 112;
		["actor"] = 2;
		["colors"] = {
			[4] = {
				[1] = 255;
				[2] = 255;
				[3] = 0;
				[4] = 255;
			};
			[6] = {
				[1] = 255;
				[2] = 255;
				[3] = 0;
				[4] = 255;
			};
		};
		["posX"] = 2670;
		["posY"] = 210;
		["script"] = "";
		["text"] = "End of dialog - red starts his way to a quiet place to have a drink";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00113"] = {
		["ID"] = 113;
		["actor"] = 2;
		["animation"] = "dl_chuckle";
		["connectID"] = 58;
		["posX"] = 2520;
		["posY"] = 810;
		["script"] = "";
		["text"] = "You? No offence, pal, but you don't look like a mercenary material. Blackthorns don't need such a soft man in their ranks. Go ask our Captain, he'll piss himself laughing.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00116"] = {
		["ID"] = 116;
		["actor"] = 2;
		["connectID"] = 51;
		["posX"] = 2250;
		["posY"] = 960;
		["script"] = "";
		["text"] = "Didn't want to rot in one of those shitty mines as well. Saw my uncle Chad, him dying from antigravium poisoning... wasn't pretty.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 2;
			[2] = 3;
		};
		["posX"] = -630;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00006"] = {
		["ID"] = 6;
		["connectionsID"] = {
			[1] = 7;
			[2] = 22;
			[3] = 10;
			[4] = 8;
		};
		["h"] = 120;
		["posX"] = 1110;
		["posY"] = 900;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00012"] = {
		["ID"] = 12;
		["connectionsID"] = {
			[1] = 54;
			[2] = 18;
			[3] = 15;
		};
		["posX"] = 1560;
		["posY"] = 960;
		["type"] = "switch";
	};
	["switch_00024"] = {
		["ID"] = 24;
		["connectionsID"] = {
			[1] = 25;
			[2] = 26;
		};
		["posX"] = -210;
		["posY"] = -600;
		["type"] = "switch";
	};
	["switch_00032"] = {
		["ID"] = 32;
		["connectionsID"] = {
			[1] = 34;
			[2] = 29;
			[3] = 5;
		};
		["posX"] = -210;
		["posY"] = 390;
		["type"] = "switch";
	};
	["switch_00060"] = {
		["ID"] = 60;
		["connectionsID"] = {
			[1] = 38;
			[2] = 63;
		};
		["posX"] = 1530;
		["posY"] = 150;
		["type"] = "switch";
	};
	["switch_00064"] = {
		["ID"] = 64;
		["connectionsID"] = {
			[1] = 19;
			[2] = 66;
		};
		["posX"] = 1980;
		["posY"] = 270;
		["type"] = "switch";
	};
	["switch_00081"] = {
		["ID"] = 81;
		["connectionsID"] = {
			[1] = 80;
			[2] = 82;
		};
		["posX"] = 1680;
		["posY"] = -210;
		["type"] = "switch";
	};
	["switch_00107"] = {
		["ID"] = 107;
		["connectionsID"] = {
			[1] = 106;
			[2] = 108;
		};
		["posX"] = 6810;
		["posY"] = -390;
		["type"] = "switch";
	};
}
local obj2 = {
	["actor_prefab"] = {
		[1] = "human_male";
		[2] = "human_male";
	};
}
return obj1 ,obj2
