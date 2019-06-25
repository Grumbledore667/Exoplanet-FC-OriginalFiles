-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 360;
		["posY"] = 300;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 750;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Good to see you alive, traveller! Speak!";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 2;
		["animation"] = "dl_head_wipe";
		["connectID"] = 35;
		["posX"] = 1230;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Oh, I forgot my manners completely! Please forgive my rudeness, dear traveler, and welcome to our humble village! I'm the Elder, merely by coincidence also being the oldest abori here. People here call me Big Hat.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 2;
		["animation"] = "dl_righthand_wave_long";
		["connectID"] = 6;
		["posX"] = 750;
		["posY"] = 210;
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
		["text"] = "Finally, a new face! How did you manage to get past those scalp hunters blocking the pass, huma? Are they preparing for a new assault?";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["animation"] = "dl_raisedfinger_right";
		["connectID"] = 3;
		["posX"] = 990;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Those \"scalp hunters\" seem to give you a massive headache. We can discuss that later, but actually I'd better learn more about this settlement and your people first. ";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["connectID"] = 12;
		["posX"] = 1650;
		["posY"] = 630;
		["script"] = "";
		["text"] = "Big Hat? I don't see any headgear on you...";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["animation"] = "dl_shrug_short";
		["connectID"] = 145;
		["posX"] = 2610;
		["posY"] = 630;
		["script"] = "";
		["text"] = "Oh, well it got worn out over time and started to give an impression of an old rotting and peeling mushroom. I kept it in my chest for a while, but the next time I checked it was completely destroyed by mold and bugs.";
		["time"] = 23;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 1;
		["animation"] = "dl_head_nod";
		["connectID"] = 10;
		["posX"] = 2370;
		["posY"] = 630;
		["script"] = "";
		["text"] = "Can't say that I disagree, but where is the famous hat now?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["animation"] = "dl_chuckle";
		["connectID"] = 13;
		["posX"] = 1890;
		["posY"] = 630;
		["script"] = "";
		["text"] = "Ah, that's an old story! When I came here and established this camp, I was wearing a fancy leather hat with a wide brim. I was an outcast of course and could not use my Blood Name any more, so those who came later and settled here nicknamed me by that hat.";
		["time"] = 27;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["animation"] = "dl_shrug_long";
		["connectID"] = 11;
		["posX"] = 2130;
		["posY"] = 630;
		["script"] = "";
		["text"] = "I didn't mind. And who would in my place? If I did they could come up with something more ranchy. Big Hat sounds better than Wrinkled Ass or Bulged Eye, don't you think? Kinda suitable for my current position as an Elder.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 2;
		["connectID"] = 19;
		["posX"] = 2370;
		["posY"] = 780;
		["script"] = "";
		["text"] = "*sigh* You see, the aboris who have gathered here are all outcasts. Not the best bunch, I dare to say: criminals exiled from their tribes, unlucky lone survivors of some kind of disaster or massacre. Broken and damaged bodies and souls. ";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 2;
		["animation"] = "dl_stop_onehand";
		["connectID"] = 18;
		["posX"] = 1890;
		["posY"] = 780;
		["script"] = "";
		["text"] = "No need to be polite, huma. I know how it looks for an outsider - an old mining site populated by abori drifters. Mud, dust, filth, poverty and diseases are eating my people alive. But I'm not the only one responsible for the sorry conditions we live in.";
		["time"] = 25;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 1;
		["connectID"] = 16;
		["posX"] = 1650;
		["posY"] = 780;
		["script"] = "";
		["text"] = "This place does not look like a thriving community...";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 1;
		["animation"] = "dl_hands_dontknow";
		["connectID"] = 14;
		["posX"] = 2130;
		["posY"] = 780;
		["script"] = "";
		["text"] = "If not you, then who is?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["connectID"] = 146;
		["posX"] = 2610;
		["posY"] = 780;
		["script"] = "";
		["text"] = "The others call us \"living debris\" for a reason. It's easy to become an outcast when you don't have any special skills or charisma that can help you blend into another group. And here it only goes downwards.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["connectID"] = 101;
		["posX"] = 1890;
		["posY"] = -330;
		["script"] = "";
		["text"] = "The nearest human town is \"New Hope\". Pretty lousy mining town, if you ask me, but I haven't been there for ten pulsations, maybe more. Hm, your best shot would be the big fort guarding the caravan route to the north.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["animation"] = "dl_shrug_long";
		["connectID"] = 142;
		["posX"] = 3330;
		["posY"] = -330;
		["script"] = "";
		["text"] = "Hm, don't know what kind of \"plants\" you use to connect to that thing, but when I was wandering in my younger days I was using only the stars and maps drawn on a hornhog hide for navigation.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 1;
		["connectID"] = 102;
		["posX"] = 2370;
		["posY"] = -330;
		["script"] = "";
		["text"] = "I'll do that. But how do I get to that Fort?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 1;
		["connectID"] = 34;
		["posX"] = 1650;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "I'll see you later.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["connectID"] = 20;
		["posX"] = 1650;
		["posY"] = -330;
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
		["text"] = "How can I get to a nearest human town?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["connectID"] = 39;
		["posX"] = 1650;
		["posY"] = 930;
		["script"] = "";
		["text"] = "Any work for me here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["posX"] = 1890;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "Be careful out there, huma!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 93;
		["posX"] = 1890;
		["posY"] = 930;
		["script"] = "";
		["text"] = "I don't think we can afford another mouth to feed. Maybe later...";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00093"] = {
		["ID"] = 93;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 5100;
		["posY"] = 330;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00094"] = {
		["ID"] = 94;
		["actor"] = 1;
		["connectID"] = 95;
		["posX"] = 3090;
		["posY"] = 780;
		["script"] = "";
		["text"] = "Have you tried motivating them somehow? You don't give an impression of a useless outcast: you are not sick, not starving, not looking depressed. You've survived long enough and got some valuable experience. Why not teach the younger outcasts how to rise from their misery?";
		["time"] = 23;
		["type"] = "message";
	};
	["message_00095"] = {
		["ID"] = 95;
		["actor"] = 2;
		["connectID"] = 147;
		["posX"] = 3330;
		["posY"] = 780;
		["script"] = "";
		["text"] = "Oh, I did. Once I was dedicated to give all my knowledge and time to it, and we've trained a bunch of good scrap gatherers. The village was making a solid profit on salvaging tech-things from those constantly emerging taboo bubbles and that old cargo carrier in the desert down below.";
		["time"] = 26.5;
		["type"] = "message";
	};
	["message_00096"] = {
		["ID"] = 96;
		["actor"] = 1;
		["connectID"] = 129;
		["posX"] = 3810;
		["posY"] = 780;
		["script"] = "";
		["text"] = "What happened?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00101"] = {
		["ID"] = 101;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 2130;
		["posY"] = -330;
		["script"] = "";
		["text"] = "Ask there if someone will accompany you to the town or better join a caravan. ";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00102"] = {
		["ID"] = 102;
		["actor"] = 2;
		["connectID"] = 139;
		["posX"] = 2610;
		["posY"] = -330;
		["script"] = "";
		["text"] = "Go down to the lake, then turn west. Make your way through the mountain path called Cutthroat Passage. Find the caravan trail leading north, away from the desert, then proceed, following the big river.";
		["time"] = 18;
		["topic"] = "to_fort:start";
		["type"] = "message";
	};
	["message_00103"] = {
		["ID"] = 103;
		["actor"] = 1;
		["connectID"] = 113;
		["posX"] = 1650;
		["posY"] = 480;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"angry_bugs\", \"big_hat_about_scalpers\")\
end\
\
";
		["text"] = "Tell me more about those scalp hunters.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00104"] = {
		["ID"] = 104;
		["actor"] = 2;
		["animation"] = "dl_clench_fist";
		["connectID"] = 149;
		["posX"] = 2370;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Damn! Those savages, may the Skyfallen Demons rip them apart! They've murdered half of our people here! Showed up two full-moons ago and blocked the Cutthroat Pass. Killed our hunters on their way home.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00105"] = {
		["ID"] = 105;
		["actor"] = 1;
		["connectID"] = 106;
		["posX"] = 2850;
		["posY"] = 480;
		["script"] = "";
		["text"] = "You speak of them as of real monsters. Why can't you fight back?";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00106"] = {
		["ID"] = 106;
		["actor"] = 2;
		["connectID"] = 150;
		["posX"] = 3090;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Fight back? With what? They may look like a bunch of bandits but they are better armed and trained. Most importantly, they are used to fight and we're used to hide and cover.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00107"] = {
		["ID"] = 107;
		["actor"] = 1;
		["connectID"] = 108;
		["posX"] = 3570;
		["posY"] = 480;
		["script"] = "";
		["text"] = "If they are so strong, why haven't they destroyed your camp yet?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00108"] = {
		["ID"] = 108;
		["actor"] = 2;
		["connectID"] = 109;
		["posX"] = 3810;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Partially because they are superstitious. They are afraid of the taboo, couldn't get near a single bubble when they arrived... but they're getting used to it. Getting closer to our fences every night. The other reason is my trump card. ";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00109"] = {
		["ID"] = 109;
		["actor"] = 2;
		["connectID"] = 153;
		["posX"] = 4050;
		["posY"] = 480;
		["script"] = "";
		["text"] = "I have a very powerful gun they fear. Well, I think they still do. I've burned half-a-dozen of them with it in one shot. Now they're considering their chances carefully and won't be attacking head-on. Waiting for us to starve and give up.";
		["time"] = 23.5;
		["type"] = "message";
	};
	["message_00110"] = {
		["ID"] = 110;
		["actor"] = 1;
		["connectID"] = 111;
		["posX"] = 4530;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Can I see this powerful gun of yours?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00111"] = {
		["ID"] = 111;
		["actor"] = 2;
		["animation"] = "dl_hand_negative";
		["connectID"] = 93;
		["posX"] = 4770;
		["posY"] = 480;
		["script"] = "";
		["text"] = "I doubt so. No offense, but I don't trust you enough. You are unlikely to be scalphunters spy - I can sooner imagine you becoming a skin for their drum - but the safety of our village depends on this gun. I won't take any chances. And no one here will tell you where I keep it. ";
		["time"] = 30;
		["type"] = "message";
	};
	["message_00112"] = {
		["ID"] = 112;
		["actor"] = 1;
		["connectID"] = 104;
		["posX"] = 2130;
		["posY"] = 480;
		["script"] = "";
		["text"] = "I haven't gone through the mountain pass... I just fell... and found your camp. So what's the deal with the scalp hunters?";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00113"] = {
		["ID"] = 113;
		["actor"] = 2;
		["animation"] = "dl_raisedfinger_right";
		["connectID"] = 112;
		["posX"] = 1890;
		["posY"] = 480;
		["script"] = "";
		["text"] = "No, you tell me! How did you manage to sneak past their patrols in the Pass? Please, this is important! This knowledge may save many lives! If only we could find a safe way to the canyon!";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00114"] = {
		["ID"] = 114;
		["actor"] = 1;
		["connectID"] = 138;
		["posX"] = 1650;
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
		["text"] = "A bunch of aborigines robbed me when I was unconcious.";
		["time"] = 6;
		["topic"] = "my_clothes:big_hat_looters";
		["type"] = "message";
	};
	["message_00115"] = {
		["ID"] = 115;
		["actor"] = 2;
		["connectID"] = 143;
		["posX"] = 2370;
		["posY"] = -30;
		["script"] = "";
		["text"] = "Can you prove what you say? What if they say otherwise? You see, I truly feel for the old one and I might feel sorry for your stolen gear, but if you don't have anything to prove your accusations, I can't do anything about that.";
		["time"] = 23.5;
		["type"] = "message";
	};
	["message_00116"] = {
		["ID"] = 116;
		["actor"] = 1;
		["connectID"] = 120;
		["posX"] = 1650;
		["posY"] = -180;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"my_clothes\", \"big_hat_stolen_gear\")\
end\
\
";
		["text"] = "I've met a trader out there who is selling my stolen gear as legal second hand wares! ";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00117"] = {
		["ID"] = 117;
		["actor"] = 2;
		["connectID"] = 118;
		["posX"] = 3090;
		["posY"] = -30;
		["script"] = "";
		["text"] = "We have only three rules here: don't steal from the other villagers, don't start a fight without permission and share with everyone what you have found. That's all. You are not one of our vilagers. The old outcast has chosen to live alone - he's not one of us as well. Can't do anything about it. ";
		["time"] = 29.5;
		["type"] = "message";
	};
	["message_00118"] = {
		["ID"] = 118;
		["actor"] = 1;
		["animation"] = "dl_head_tap";
		["connectID"] = 127;
		["posX"] = 3330;
		["posY"] = -30;
		["script"] = "";
		["text"] = "A nifty set of rules. And I can bet my left ass cheek that you are the one who distributes the loot you have found here. This shithole of a village exists only to serve your selfish interests!";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00119"] = {
		["ID"] = 119;
		["actor"] = 2;
		["animation"] = "dl_hands_dontknow";
		["connectID"] = 115;
		["posX"] = 2130;
		["posY"] = -30;
		["script"] = "";
		["text"] = "So what do you want from me? Punish them? Give you your... allegedly your... gear back? Beg for your forgiveness?";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00120"] = {
		["ID"] = 120;
		["actor"] = 2;
		["animation"] = "dl_shrug_long";
		["connectID"] = 93;
		["posX"] = 1890;
		["posY"] = -180;
		["script"] = "";
		["text"] = "Well, this is a cruel world and everyone is doing his best to see another day. I'm sure you can find a way to get your gear back, just don't make any ruckus here. We are poor but not defenseless.";
		["time"] = 21;
		["type"] = "message";
	};
	["message_00122"] = {
		["ID"] = 122;
		["actor"] = 1;
		["animation"] = "dl_hand_chopfast";
		["connectID"] = 117;
		["posX"] = 2850;
		["posY"] = -30;
		["script"] = "";
		["text"] = "The hell are you talking about? Rules? This was some straight up robbery and two bastards beating the crap out of an old being. What kind of rules allow rotten acts like that?";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00127"] = {
		["ID"] = 127;
		["actor"] = 2;
		["connectID"] = 144;
		["posX"] = 3570;
		["posY"] = -30;
		["script"] = "";
		["text"] = "This might be true, but if you want to survive in this area, huma, you must learn one thing: loners don't matter. We are a group, a tribe of some sort - not the most powerful or wealthy - but we stay together as a pack and protect our kin.";
		["time"] = 26;
		["type"] = "message";
	};
	["message_00128"] = {
		["ID"] = 128;
		["actor"] = 2;
		["connectID"] = 93;
		["posX"] = 4050;
		["posY"] = -30;
		["script"] = "";
		["text"] = "We are a tribe of outcasts and this \"shithole\"  - as you call it - is ours. Obey our rules or die alone in the desert. I'm not threatening you, but just keep it in mind. Ask yourself: is your gear and pride worth taking chances against our tribe?";
		["time"] = 26;
		["type"] = "message";
	};
	["message_00129"] = {
		["ID"] = 129;
		["actor"] = 2;
		["connectID"] = 148;
		["posX"] = 4050;
		["posY"] = 780;
		["script"] = "";
		["text"] = "Don't think you want to know all the details... First the taboo bubbles stopped appearing regularly. We cannot scavenge good stuff for sale now.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00130"] = {
		["ID"] = 130;
		["actor"] = 2;
		["animation"] = "dl_hands_washing";
		["connectID"] = 93;
		["posX"] = 4530;
		["posY"] = 780;
		["script"] = "";
		["text"] = "We've lost all reliable sources of sellable goods and food and there's a bunch of heartless murderers at our throats. As if being an outcast for years is not enough for the Gods-in-the-Earth to test our faith.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00138"] = {
		["ID"] = 138;
		["actor"] = 1;
		["connectID"] = 119;
		["posX"] = 1890;
		["posY"] = -30;
		["script"] = "";
		["text"] = "They were also beating up the Old Outcast. Could have killed the poor old timer if I hadn't interfered. Seems like they came from this camp...";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00139"] = {
		["ID"] = 139;
		["actor"] = 2;
		["animation"] = "dl_raisedfinger_left";
		["connectID"] = 140;
		["posX"] = 2850;
		["posY"] = -330;
		["script"] = "";
		["text"] = "But I must warn you: this path has become really dangerous. A lone traveler will make an easy prey for scalphunters, bandits and other scum roaming the Windscream Canyon, not to speak of dangerous beasts.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00140"] = {
		["ID"] = 140;
		["actor"] = 1;
		["animation"] = "dl_head_nod";
		["connectID"] = 21;
		["posX"] = 3090;
		["posY"] = -330;
		["script"] = "";
		["text"] = "Well, thanks for the warning, I think with some better gear and weapons I will manage. If only my implants could connect to the navigation satellite...";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00141"] = {
		["ID"] = 141;
		["actor"] = 2;
		["connectID"] = 93;
		["posX"] = 3810;
		["posY"] = -330;
		["script"] = "";
		["text"] = "I saw him coming through recently. Waga was his name? I think he's still hanging around by the big fireplace. If I were you, I would ask him about the path to the fort as well. This fella knows all secret trails and shortcuts even better than we do.";
		["time"] = 25.5;
		["type"] = "message";
	};
	["message_00142"] = {
		["ID"] = 142;
		["actor"] = 2;
		["animation"] = "dl_look_up";
		["connectID"] = 141;
		["posX"] = 3570;
		["posY"] = -330;
		["script"] = "";
		["text"] = "The stars are always on the sky at night and the wandering merchant, who is visiting our village, might have a map for sale.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00143"] = {
		["ID"] = 143;
		["actor"] = 2;
		["connectID"] = 122;
		["posX"] = 2610;
		["posY"] = -30;
		["script"] = "";
		["text"] = "In fact, even if you had something solid. Nothing of what they did is against our rules.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00144"] = {
		["ID"] = 144;
		["actor"] = 2;
		["connectID"] = 128;
		["posX"] = 3810;
		["posY"] = -30;
		["script"] = "";
		["text"] = "This is our strength. You may be the best warrior in the Desert but you won't stand a chance against a tribe. The tribe sets the rules and loners obey. Or suffer like that old outcast you were talking about.";
		["time"] = 21;
		["type"] = "message";
	};
	["message_00145"] = {
		["ID"] = 145;
		["actor"] = 2;
		["connectID"] = 93;
		["posX"] = 2850;
		["posY"] = 630;
		["script"] = "";
		["text"] = "To be honest, I'm glad it's gone. It was too old-fashioned and now I find the design too silly.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00146"] = {
		["ID"] = 146;
		["actor"] = 2;
		["connectID"] = 94;
		["posX"] = 2850;
		["posY"] = 780;
		["script"] = "";
		["text"] = "So there are no great hunters or craftsmen here. No abori who is motivated enough to work an extra hour when he's got a bulb of booze and a piece of rotten meat once a day.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00147"] = {
		["ID"] = 147;
		["actor"] = 2;
		["connectID"] = 96;
		["posX"] = 3570;
		["posY"] = 780;
		["script"] = "";
		["text"] = "We even made a hunting party of young ones. Pretty successful for our standards, got meat in every pot almost every day. But then things went south...";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00148"] = {
		["ID"] = 148;
		["actor"] = 2;
		["connectID"] = 130;
		["posX"] = 4290;
		["posY"] = 780;
		["script"] = "";
		["text"] = "Then a mad human has settled in the container carrier's wreck and boobie-trapped the surroundings. Can't loot there either now. Then a pack of scalp hunters appeared and cut down our hunting party.";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00149"] = {
		["ID"] = 149;
		["actor"] = 2;
		["connectID"] = 105;
		["posX"] = 2610;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Picking us one by one when we dare to leave the fences. They are the main reason of the disaster you can witness here.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00150"] = {
		["ID"] = 150;
		["actor"] = 2;
		["connectID"] = 107;
		["posX"] = 3330;
		["posY"] = 480;
		["script"] = "";
		["text"] = "I wasn't much of a fighter even in my younger days, as the others here. Have you seen our guards? Skinny sand fleas armed with a cactus bat or a rusty metal pipe - not a threat for a murderer who wears a necklace made of severed fingers.";
		["time"] = 25;
		["type"] = "message";
	};
	["message_00153"] = {
		["ID"] = 153;
		["actor"] = 2;
		["animation"] = "dl_hands_strike";
		["connectID"] = 110;
		["posX"] = 4290;
		["posY"] = 480;
		["script"] = "";
		["text"] = "We'll see who gives up first!";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00154"] = {
		["ID"] = 154;
		["actor"] = 1;
		["connectID"] = 155;
		["posX"] = 1650;
		["posY"] = 210;
		["script"] = "function message:onStart()\
   getQuest(\"angry_bugs\"):setTopicVisible(\"big_hat_about_scalpers\", false)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"angry_bugs\", \"big_hat_reward\")\
          or getQuestTopicVisible(\"angry_bugs\", \"big_hat_reward_alt\")\
end\
\
";
		["text"] = "Actually, I got rid of a big camp of those scalp hunters in a cave nearby.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00155"] = {
		["ID"] = 155;
		["actor"] = 2;
		["animation"] = "dl_chuckle";
		["connectID"] = 168;
		["posX"] = 1890;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Seriously? Don't tell me you went in with guns blazing and shot them all up - I won't believe you.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00156"] = {
		["ID"] = 156;
		["actor"] = 1;
		["connectID"] = 157;
		["posX"] = 2280;
		["posY"] = 270;
		["script"] = "function message:onStart()\
   getQuest(\"angry_bugs\"):setTopicVisible(\"big_hat_reward\", false)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"angry_bugs\", \"big_hat_reward\")\
end\
\
";
		["text"] = "No, if you want the story, here it is... I used an old bughunter's trick which I learnt from Old Outcast. The one with the stink shroom and a bug hive.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00157"] = {
		["ID"] = 157;
		["actor"] = 2;
		["animation"] = "dl_head_scratch";
		["connectID"] = 158;
		["posX"] = 2520;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Holy shit! Let me guess, they got eaten by a furious swarm of bugs? You're quite a risk-taker... Could have ended as a fertilizer for the stink shrooms or a supper for the bitebugs.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00158"] = {
		["ID"] = 158;
		["actor"] = 2;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 159;
		["posX"] = 2760;
		["posY"] = 210;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   addItemToPlayer(\"junk_top_2.itm\")\
   addItemToPlayer(\"junk_legs_2.itm\")\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Let me thank you for it with this.";
		["time"] = 5;
		["topic"] = "angry_bugs:big_hat_reward";
		["type"] = "message";
	};
	["message_00159"] = {
		["ID"] = 159;
		["actor"] = 1;
		["connectID"] = 164;
		["posX"] = 3000;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Thanks, I guess, do you maybe have some spare ammo for me?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00161"] = {
		["ID"] = 161;
		["actor"] = 1;
		["connectID"] = 165;
		["posX"] = 3630;
		["posY"] = 90;
		["script"] = "function message:onStart()\
   addItemToPlayer(\"flare_ammo.itm\", 5)\
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
		["text"] = "\\[Take 5 flares]";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00162"] = {
		["ID"] = 162;
		["actor"] = 1;
		["connectID"] = 165;
		["posX"] = 3630;
		["posY"] = 210;
		["script"] = "function message:onStart()\
   addItemToPlayer(\"22_ammo.itm\", 10)\
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
		["text"] = "\\[Take 10 SCAMP rounds]";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00163"] = {
		["ID"] = 163;
		["actor"] = 1;
		["connectID"] = 165;
		["posX"] = 3630;
		["posY"] = 330;
		["script"] = "function message:onStart()\
   addItemToPlayer(\"revolver_ammo.itm\", 10)\
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
		["text"] = "\\[Take 10 revolver rounds]";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00164"] = {
		["ID"] = 164;
		["actor"] = 2;
		["animation"] = "dl_head_2nods";
		["connectID"] = 160;
		["posX"] = 3240;
		["posY"] = 210;
		["script"] = "";
		["text"] = "We do, we used to scavenge all sorts of different things. Well, you can have some. It's not much use for us since we don't have any guns.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00165"] = {
		["ID"] = 165;
		["actor"] = 2;
		["animation"] = "dl_bow_2";
		["connectID"] = 93;
		["posX"] = 3900;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Thank you, again. Maybe now we'll have another chance to get this \"shithole\" right.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00167"] = {
		["ID"] = 167;
		["actor"] = 1;
		["connectID"] = 169;
		["posX"] = 2280;
		["posY"] = 150;
		["script"] = "function message:onStart()\
   getQuest(\"angry_bugs\"):setTopicVisible(\"big_hat_reward_alt\", false)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"angry_bugs\", \"big_hat_reward_alt\")\
end\
\
";
		["text"] = "Your choice, but that's exactly what I did.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00169"] = {
		["ID"] = 169;
		["actor"] = 2;
		["connectID"] = 158;
		["posX"] = 2520;
		["posY"] = 150;
		["script"] = "";
		["text"] = "Well I'll be damned if that's not some incredibly good news! For all of us here!";
		["time"] = 6;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 4;
			[2] = 2;
		};
		["posX"] = 600;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00035"] = {
		["ID"] = 35;
		["connectionsID"] = {
			[1] = 28;
			[2] = 116;
			[3] = 114;
			[4] = 154;
			[5] = 103;
			[6] = 8;
			[7] = 17;
			[8] = 29;
			[9] = 27;
		};
		["h"] = 220;
		["posX"] = 1500;
		["posY"] = 300;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00160"] = {
		["ID"] = 160;
		["connectionsID"] = {
			[1] = 161;
			[2] = 162;
			[3] = 163;
		};
		["posX"] = 3480;
		["posY"] = 210;
		["type"] = "switch";
	};
	["switch_00168"] = {
		["ID"] = 168;
		["connectionsID"] = {
			[1] = 167;
			[2] = 156;
		};
		["posX"] = 2130;
		["posY"] = 210;
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
