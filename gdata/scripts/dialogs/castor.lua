-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["animation"] = "dl_hands_strike";
		["connectID"] = 42;
		["posX"] = 0;
		["posY"] = 0;
		["script"] = "";
		["text"] = "Hell yes, I am. A captain of this heap of scrap metal some asshole back in the Company called a Fort.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["posX"] = 0;
		["posY"] = 1830;
		["script"] = "";
		["text"] = "Bye.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 63;
		["posX"] = 240;
		["posY"] = 600;
		["script"] = "";
		["text"] = "[t_wet_work:give_tokens]Great. Now we have some time untill those bastards start to show up in the Windscream canyon again.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["connectID"] = 34;
		["posX"] = -900;
		["posY"] = 240;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["connectID"] = 30;
		["posX"] = 0;
		["posY"] = 300;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible() and self:isFirstTime() and not self:getParam(\"not_terminal\")\
end\
\
";
		["text"] = "[t_wet_work:terminal]I've seen the request in Bounty Hunter Terminal. Cash for dead bandits. Is it still active?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 2;
		["animation"] = "dl_head_nod";
		["connectID"] = 32;
		["posX"] = 240;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Yeah. You see, we can't provoke the Stone Heads, so I won't send any bandit subjugation parties now. But a freelancer like you could easily get some shinies. If you know how to hold a gun and aren't afraid of some wet work.";
		["time"] = 22.5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["connectID"] = 46;
		["posX"] = 750;
		["posY"] = 360;
		["script"] = "";
		["text"] = "All you need is to bring me some tokens to prove that you have dealt with some of the criminal scum plaguing this region.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = 0;
		["posY"] = 600;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"wet_work\"):getTopicVisible(\"give_tokens\")\
end\
\
";
		["text"] = "I've got some bandit tokens.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 0;
		["posX"] = -270;
		["posY"] = 0;
		["script"] = "function message:onStart()\
   getQuest(\"wet_work\"):setTopicVisible(\"intro\", false)\
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
		["text"] = "[t_wet_work:intro]Are you captain Castor?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 1;
		["connectID"] = 43;
		["posX"] = 270;
		["posY"] = 0;
		["script"] = "";
		["text"] = "Any trouble with the natives? Cause I saw their camp across the rift... They behave rather cocky.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 2;
		["connectID"] = 44;
		["posX"] = 540;
		["posY"] = 0;
		["script"] = "";
		["text"] = "We are in a stalemate with the Stone Heads now: They aren't gonna attack the Fort since they'll only get blasted by our turrets and we won't advance without an order from our headquarters.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 2;
		["animation"] = "dl_raisedfinger_right";
		["connectID"] = 60;
		["posX"] = 810;
		["posY"] = 0;
		["script"] = "";
		["text"] = "Despite the fact that there was... an incident with our workers and we shot a couple of their scouts dead, the peace treaty is still active.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 1;
		["connectID"] = 47;
		["posX"] = 1200;
		["posY"] = 300;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"wet_work\"):getTopicVisible(\"give_tokens\")\
end\
\
";
		["text"] = "Actually I already have some.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 2;
		["animation"] = "dl_hands_strike";
		["connectID"] = 63;
		["posX"] = 1440;
		["posY"] = 300;
		["script"] = "";
		["text"] = "[t_wet_work:give_tokens]Good. Travelers can feel a bit safer now thanks to you, kid. Here is your cash.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 1;
		["connectID"] = 49;
		["posX"] = 0;
		["posY"] = 750;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"wet_work\"):isStarted()\
end\
\
";
		["text"] = "What kind of tokens were you talking about?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 2;
		["connectID"] = 50;
		["posX"] = 240;
		["posY"] = 750;
		["script"] = "";
		["text"] = "For abori bandits it's their thumbs. An abori without his thumbs would be banished by his kin, if he doesn't kill himself out of shame before that, as it's a great disgrace for a warrior to not be able to hold a weapon.";
		["time"] = 22.5;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 1;
		["connectID"] = 52;
		["posX"] = 480;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Fine, at least its not their junk. Don't tell me I need to scalp humans!";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 2;
		["animation"] = "dl_stop_twohand";
		["connectID"] = 63;
		["posX"] = 720;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Man, who do you think we are? Stone age savages? For human bandits you need to cut out only the cerebral ID chip. Just a little cut on the temple and it's done. Well, you need to drill through an eye socket for older models, but once the target's dead that shouldn't be a problem.";
		["time"] = 28.5;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 1;
		["connectID"] = 55;
		["posX"] = 0;
		["posY"] = 450;
		["script"] = "function message:onStart()\
   self:setParam(\"not_terminal\", true)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuest(\"wet_work\"):isStarted()\
end\
\
";
		["text"] = "Any job offers I can take on?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 2;
		["animation"] = "dl_head_nod";
		["connectID"] = 56;
		["posX"] = 240;
		["posY"] = 450;
		["script"] = "";
		["text"] = "Sure, If you know how to hold a gun and aren't afraid of some wet work of course.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 2;
		["connectID"] = 32;
		["posX"] = 480;
		["posY"] = 450;
		["script"] = "";
		["text"] = "[t_wet_work:start]You see, we can't provoke the Stone Heads, so I won't send any bandit subjugation parties now. But a freelancer like you could easily earn some shinies. If you know how to hold a gun and aren't afraid of some wet work of course.";
		["time"] = 23;
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 2;
		["animation"] = "dl_bow_1";
		["connectID"] = 3;
		["posX"] = -510;
		["posY"] = 540;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuest(\"wet_work\"):getTopicVisible(\"intro\")\
end\
\
";
		["text"] = "Hello there.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 1;
		["connectID"] = 63;
		["posX"] = 1200;
		["posY"] = 420;
		["script"] = "";
		["text"] = "I see.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 2;
		["connectID"] = 63;
		["posX"] = 1080;
		["posY"] = 0;
		["script"] = "";
		["text"] = "I consider that their chief is trying to bargain for better terms of leasing his lands to the Company. Just a matter of bureaucracy and time in the end, as usual. We must stay calm and prevent further escalation of the conflict.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 1;
		["connectID"] = 64;
		["posX"] = 0;
		["posY"] = 900;
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
		["text"] = "[t_ktharsis_harsh:castor_report]I found a gravely wounded abori named Swift Strider in the aftermath of a caravan ambush.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 2;
		["animation"] = "dl_head_nod";
		["connectID"] = 63;
		["posX"] = 390;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "I'll send someone to pick him up and investigate the matter.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 2;
		["connectID"] = 3;
		["posX"] = 6120;
		["posY"] = 630;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00066"] = {
		["ID"] = 66;
		["actor"] = 2;
		["connectID"] = 63;
		["posX"] = 390;
		["posY"] = 900;
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
		["text"] = "[HIDDEN]Actually, my men have just returned with an injured abori that fits the description of the one you're talking about. He should be in one of the unused cargo containers.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
		["actor"] = 1;
		["connectID"] = 80;
		["posX"] = 0;
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
		["text"] = "[t_scarecrow:castor_about_scarecrow]About that Scarecrow bounty...";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00070"] = {
		["ID"] = 70;
		["actor"] = 2;
		["animation"] = "dl_raisedfinger_right";
		["connectID"] = 115;
		["posX"] = 420;
		["posY"] = 1200;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scarecrow\", \"castor_briefing\")\
end\
\
";
		["text"] = "Look, kiddo, before we continue, you should know this: the last bounty hunter who asked me about that freak has never returned to collect his shards. And hell, that fellow knew how to hold a gun.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00071"] = {
		["ID"] = 71;
		["actor"] = 1;
		["connectID"] = 97;
		["posX"] = 1230;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Thanks for the warning, Captain, I'll be careful. First of all, The Scarecrow. Why the name?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00074"] = {
		["ID"] = 74;
		["actor"] = 2;
		["animation"] = "dl_hands_dontknow";
		["connectID"] = 114;
		["posX"] = 4470;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "I trust my men, but this guy, Red, you see, he got drunk and started spewing all kinds of nonsense... like that he knew the Scarecrow from his previous job at the Devil's Throat security.";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00075"] = {
		["ID"] = 75;
		["actor"] = 1;
		["connectID"] = 77;
		["posX"] = 1620;
		["posY"] = 1350;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scarecrow\", \"castor_finish\")\
end\
\
";
		["text"] = "\\[Give scarecrow chip]I have his ID chip. I thought that would make a better proof than his rotting corpse.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00076"] = {
		["ID"] = 76;
		["actor"] = 1;
		["animation"] = "dl_head_shake";
		["connectID"] = 112;
		["posX"] = 1620;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "Not yet.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00077"] = {
		["ID"] = 77;
		["actor"] = 2;
		["animation"] = "dl_chuckle";
		["connectID"] = 117;
		["posX"] = 1890;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "Ha, the old model they installed back in the days, right trough the eye socket! Digging in dead people's brains, huh? Reminds me of my own stormy youth: being a bounty hunter is fun before you grow some gray hair and your back starts to hurt.";
		["time"] = 24;
		["type"] = "message";
	};
	["message_00081"] = {
		["ID"] = 81;
		["actor"] = 2;
		["connectID"] = 82;
		["posX"] = 1170;
		["posY"] = 1380;
		["script"] = "";
		["text"] = "Is he dead?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 2;
		["connectID"] = 85;
		["posX"] = 720;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "Slavers, of course, are hellish bastards... But at least they keep stray aborigines to themselves and away from roaming the neighborhood.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00084"] = {
		["ID"] = 84;
		["actor"] = 2;
		["animation"] = "dl_shrug_long";
		["connectID"] = 86;
		["posX"] = 240;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "And? How does that have anything to do with me? You want a medal or something?";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00085"] = {
		["ID"] = 85;
		["actor"] = 1;
		["animation"] = "dl_point_forward";
		["connectID"] = 90;
		["posX"] = 960;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "So... You, the Captain, knew about Wade's business all along and simply let it happen?";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00086"] = {
		["ID"] = 86;
		["actor"] = 2;
		["animation"] = "dl_raisedfinger_left";
		["connectID"] = 83;
		["posX"] = 480;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "Wade was the worst kind of scum, but he never picked on the fort dwellers or our property.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00087"] = {
		["ID"] = 87;
		["actor"] = 2;
		["connectID"] = 91;
		["posX"] = 1440;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "Wade was tied with a powerful criminal syndicate from the Jackpot town. And if they find out that you got rid of Wade...";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00088"] = {
		["ID"] = 88;
		["actor"] = 1;
		["connectID"] = 84;
		["posX"] = 0;
		["posY"] = 1680;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lemonade_wade\", \"castor_finish\")\
end\
\
";
		["text"] = "I got rid of a slaver gang boss that goes by the name of Lemonade Wade!";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00089"] = {
		["ID"] = 89;
		["actor"] = 2;
		["animation"] = "dl_head_nod";
		["connectID"] = 63;
		["posX"] = 1920;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "[t_lemonade_wade:castor_finish]You can count on me, kiddo, but you should keep your mouth shut about your Wade's \"retirement\" around locals. The Syndicate will offer a good chunk of crystals to find those who meddle in their business.";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00090"] = {
		["ID"] = 90;
		["actor"] = 2;
		["animation"] = "dl_shrug_short";
		["connectID"] = 87;
		["posX"] = 1200;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "Something like that. But in my position you can't make enemies out of everyone whose practices you don't like.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 1;
		["animation"] = "dl_cough";
		["connectID"] = 89;
		["posX"] = 1680;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "Well, I hope you aren't going to tell them about me, if they come looking.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00097"] = {
		["ID"] = 97;
		["actor"] = 2;
		["connectID"] = 107;
		["posX"] = 1500;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "That's what people call him. They say he wears an old sack with eyeholes for a mask, like a scarecrow in the fields, you know... Don't ask me why!";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00098"] = {
		["ID"] = 98;
		["actor"] = 1;
		["connectID"] = 99;
		["posX"] = 2040;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Any ideas where should I start looking for that psycho? Are there any survivors I can talk to, to figure out where he lurks?";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00099"] = {
		["ID"] = 99;
		["actor"] = 2;
		["animation"] = "dl_talk_3";
		["connectID"] = 105;
		["posX"] = 2310;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Only a few have seen the Scarecrow and still draw their breath. Recently, a caravan was attacked by this madman and some nomads made it alive. When they first arrived to the Fort, I thought I've never seen nomad folk being so scared in my life.";
		["time"] = 24.5;
		["type"] = "message";
	};
	["message_00100"] = {
		["ID"] = 100;
		["actor"] = 1;
		["connectID"] = 101;
		["posX"] = 2850;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Is that all? ";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00101"] = {
		["ID"] = 101;
		["actor"] = 2;
		["animation"] = "dl_righthand_wave_med";
		["connectID"] = 113;
		["posX"] = 3120;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Look, we don't run a rehabilitation clinic for the victims of that desert maniac here. People come and go, we don't keep track of them. Besides, I wouldn't trust every drifter that claims he saw the Scarecrow and survived.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00102"] = {
		["ID"] = 102;
		["actor"] = 2;
		["connectID"] = 74;
		["posX"] = 4200;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "And one more thing, before you go. The guy called Red, one of my mercs, I've sent him and two other veterans to check the caravan road a week ago. Three mercs went on patrol, one returned and now claims that they were attacked by the Scarecrow.";
		["time"] = 24.5;
		["type"] = "message";
	};
	["message_00103"] = {
		["ID"] = 103;
		["actor"] = 1;
		["animation"] = "dl_chuckle";
		["connectID"] = 104;
		["posX"] = 5280;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Now I see why you are willing to pay that hefty sum of antigravium for this gig. The Scarecrow can kill the caravaneers and other travelers in packs, but not the mighty mercenaries!";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00104"] = {
		["ID"] = 104;
		["actor"] = 2;
		["animation"] = "dl_hand_showleft";
		["connectID"] = 63;
		["posX"] = 5550;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "[t_scarecrow:castor_briefing]Well said, kiddo, now shut up and get to work. I want this crazy son of a bitch dead and forgotten as soon as possible.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00105"] = {
		["ID"] = 105;
		["actor"] = 2;
		["connectID"] = 100;
		["posX"] = 2580;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Obviously I've already interviewed the witnesses, but you should do it yourself before jumping to any conclusions. I doubt they will enjoy telling the story again though.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00106"] = {
		["ID"] = 106;
		["actor"] = 2;
		["connectID"] = 71;
		["posX"] = 960;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Now, what do you want to know?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00107"] = {
		["ID"] = 107;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["connectID"] = 98;
		["posX"] = 1770;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "The bastard is crazy: he doesn't rob, he doesn't take hostages, doesn't negotiate. He just kills for no reason! I think this sick animal just enjoys the killing. And then puts the corpses on display near the road...";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00108"] = {
		["ID"] = 108;
		["actor"] = 1;
		["connectID"] = 109;
		["posX"] = 3660;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "So my only lead would be those caravan survivors?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00109"] = {
		["ID"] = 109;
		["actor"] = 2;
		["connectID"] = 102;
		["posX"] = 3930;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Yes. There are three nomad caravan guards, who managed to get here relatively unscathed. They should provide you with information about the Scarecrow's most recent attack.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00110"] = {
		["ID"] = 110;
		["actor"] = 2;
		["animation"] = "dl_hands_strike";
		["connectID"] = 103;
		["posX"] = 5010;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Kick his ass, if you need to. Tell the mercs I have authorized that.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00112"] = {
		["ID"] = 112;
		["actor"] = 2;
		["connectID"] = 63;
		["posX"] = 1890;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "I pay for results, not for some idle chit-chat, kiddo. Talk to me when you have the Scarecrow's dead corpse to present.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00113"] = {
		["ID"] = 113;
		["actor"] = 2;
		["animation"] = "dl_hand_facepalm";
		["connectID"] = 108;
		["posX"] = 3390;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "The locals would gladly tell you some wild stories for a bottle of cheap booze. Hell, this Scarecrow, he might even have some sick admirers here, willing to send fools right into his arms.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00114"] = {
		["ID"] = 114;
		["actor"] = 2;
		["animation"] = "dl_hand_chopslow";
		["connectID"] = 110;
		["posX"] = 4740;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "I don't care what he did for a living before he enlisted in Blackthorns, but now his loose tongue is lowering the morale in the Fort. Find him and make him stop this nonsense.";
		["time"] = 24;
		["type"] = "message";
	};
	["message_00115"] = {
		["ID"] = 115;
		["actor"] = 2;
		["connectID"] = 106;
		["posX"] = 690;
		["posY"] = 1200;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scarecrow\", \"castor_briefing\")\
end\
\
";
		["text"] = "So better prepare yourself, before you realize you have bitten more than you can chew. Do you get me?";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00117"] = {
		["ID"] = 117;
		["actor"] = 2;
		["animation"] = "dl_head_wipe";
		["connectID"] = 63;
		["posX"] = 2160;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "[t_scarecrow:castor_finish]Anyways, I hope we never hear about this Scarecrow nonsense again. Here's your reward, hunter. You've earned it.";
		["time"] = 9;
		["type"] = "message";
	};
	["switch_00003"] = {
		["ID"] = 3;
		["connectionsID"] = {
			[1] = 29;
			[2] = 53;
			[3] = 37;
			[4] = 48;
			[5] = 61;
			[6] = 67;
			[7] = 88;
			[8] = 6;
		};
		["h"] = 200;
		["posX"] = -240;
		["posY"] = 510;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00034"] = {
		["ID"] = 34;
		["connectionsID"] = {
			[1] = 41;
			[2] = 57;
		};
		["posX"] = -660;
		["posY"] = 240;
		["type"] = "switch";
	};
	["switch_00046"] = {
		["ID"] = 46;
		["connectionsID"] = {
			[1] = 45;
			[2] = 59;
		};
		["posX"] = 1020;
		["posY"] = 360;
		["type"] = "switch";
	};
	["switch_00064"] = {
		["ID"] = 64;
		["connectionsID"] = {
			[1] = 66;
			[2] = 62;
		};
		["posX"] = 240;
		["posY"] = 900;
		["type"] = "switch";
	};
	["switch_00080"] = {
		["ID"] = 80;
		["connectionsID"] = {
			[1] = 70;
			[2] = 81;
		};
		["posX"] = 270;
		["posY"] = 1320;
		["type"] = "switch";
	};
	["switch_00082"] = {
		["ID"] = 82;
		["connectionsID"] = {
			[1] = 75;
			[2] = 76;
		};
		["posX"] = 1470;
		["posY"] = 1380;
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
