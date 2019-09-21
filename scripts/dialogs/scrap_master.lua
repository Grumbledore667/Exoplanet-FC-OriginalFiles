-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 67;
		["posX"] = -1590;
		["posY"] = 90;
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
		["text"] = "Hey, huma! What brings you to my workshop?";
		["time"] = 5;
		["topic"] = "hidden_scrap_master_wrench:scrap_master_intro";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["connectID"] = 82;
		["posX"] = 1260;
		["posY"] = 1860;
		["script"] = "";
		["text"] = "I need to ask you something.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 1;
		["connectID"] = 286;
		["posX"] = 1260;
		["posY"] = 2550;
		["script"] = "";
		["text"] = "Bye.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 1;
		["connectID"] = 17;
		["posX"] = 1260;
		["posY"] = -2310;
		["script"] = "";
		["text"] = "Do you have work for me?";
		["time"] = 4;
		["topic"] = "broken_crane:scrap_master_start";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["connectID"] = 22;
		["posX"] = 1710;
		["posY"] = -1350;
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
		["text"] = "The crane is fixed.";
		["time"] = 3;
		["topic"] = "broken_crane:scrap_master_crane_fixed";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["connectID"] = 106;
		["posX"] = 1530;
		["posY"] = -2310;
		["script"] = "";
		["text"] = "There's always work in this camp, huma. A few days ago our crane broke, the one we use to lift big loads from the desert. I sent my boys to check what's wrong with that rusty old hunk of junk again.";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 2;
		["connectID"] = 23;
		["posX"] = 1980;
		["posY"] = -1350;
		["script"] = "";
		["text"] = "Finally. How did you manage to do it?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 1;
		["connectID"] = 103;
		["posX"] = 1500;
		["posY"] = -270;
		["script"] = "function message:onStart()\
   self:setParam(\"35\", true)\
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
		["text"] = "Your friend Herbalist sends you his regards.";
		["time"] = 4.5;
		["topic"] = "herbalist_tools:scrap_master_about_tools";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 1;
		["connectID"] = 326;
		["posX"] = 1890;
		["posY"] = 360;
		["script"] = "";
		["text"] = "The herbalist, when he gave me the note, said that you can sell me the tools cheaper - as a friend of a friend.";
		["time"] = 13;
		["topic"] = "herbalist_tools:scrap_master_get_message_discount";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 124;
		["posX"] = 2790;
		["posY"] = -330;
		["script"] = "";
		["text"] = "Here it is.";
		["time"] = 2.5;
		["topic"] = "herbalist_tools:scrap_master_give_message";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 2;
		["connectID"] = 48;
		["posX"] = 2760;
		["posY"] = 720;
		["script"] = "";
		["text"] = "You helped me out a lot with the whole crane business.";
		["time"] = 6.5;
		["topic"] = "broken_crane:scrap_master_quest_finished";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 2;
		["connectID"] = 59;
		["posX"] = 3420;
		["posY"] = 630;
		["script"] = "";
		["text"] = "By fixing it yourself you saved a lot of time.";
		["time"] = 6;
		["topic"] = "broken_crane:scrap_master_self_repair_full";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 2;
		["connectID"] = 59;
		["posX"] = 3420;
		["posY"] = 780;
		["script"] = "";
		["text"] = "By making my workers fix it, though they did take their sweet time doing it. Still, it's better than hauling the scrap to the camp on their backs.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 2;
		["connectID"] = 299;
		["posX"] = 3840;
		["posY"] = 780;
		["script"] = "";
		["text"] = "And you managed all this without a fight, and you can trust me when I tell you that I know it wasn't easy.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 2;
		["connectID"] = 299;
		["posX"] = 3840;
		["posY"] = 630;
		["script"] = "";
		["text"] = "Too bad you didn't manage to avoid using excessive force, despite my warning. It'll take a while before those wankers start working in full capacity, but it'll teach them to restrain their arrogance.";
		["time"] = 17.5;
		["topic"] = "broken_crane:cog_was_beaten";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 2;
		["connectID"] = 258;
		["posX"] = 5520;
		["posY"] = 720;
		["script"] = "";
		["text"] = "Hopefully they'll last a long time for the Herbalist. It's hard to find a set like this these days.";
		["time"] = 10.5;
		["topic"] = "herbalist_tools:scrap_master_buy_tools";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
		["actor"] = 1;
		["connectID"] = 68;
		["posX"] = -1320;
		["posY"] = 90;
		["script"] = "";
		["text"] = "I just wanted to take a look around. What are you doing here?";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 2;
		["connectID"] = 185;
		["posX"] = -1050;
		["posY"] = 90;
		["script"] = "";
		["text"] = "Sorting scrap. Did you think we sit around here baking cakes? Instead of just standing there doing nothing, why don't you give me that wrench marked 15?";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00074"] = {
		["ID"] = 74;
		["actor"] = 2;
		["connectID"] = 207;
		["posX"] = -1140;
		["posY"] = 660;
		["script"] = "";
		["text"] = "What's this? I asked you for a wrench marked 15, and you give me this? You'd be more use as a security guard with your expertise: in fact, they need people like you — just sitting around picking your nose all day.";
		["time"] = 22;
		["topic"] = "hidden_scrap_master_wrench:scrap_master_give_wrench";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00075"] = {
		["ID"] = 75;
		["actor"] = 2;
		["connectID"] = 201;
		["posX"] = -1140;
		["posY"] = 510;
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
		["text"] = "That wasn't so hard now, was it? We could use more people like you.";
		["time"] = 8;
		["topic"] = "hidden_scrap_master_wrench:scrap_master_give_right_wrench";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00081"] = {
		["ID"] = 81;
		["actor"] = 2;
		["posX"] = 1680;
		["posY"] = 2610;
		["script"] = "";
		["text"] = "Go do something useful. You vagabond types wander around here and the next thing you know your tools start going missing.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 1;
		["connectID"] = 84;
		["posX"] = 1830;
		["posY"] = 1590;
		["script"] = "";
		["text"] = "How your scrap sorting going?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00084"] = {
		["ID"] = 84;
		["actor"] = 2;
		["connectID"] = 87;
		["posX"] = 2100;
		["posY"] = 1590;
		["script"] = "";
		["text"] = "Same as always. Lots of work, not enough workers. If the situation with the scalphunters blockade doesn't change soon, traders just won't be able to reach us. Then there'll be no one to sell the sorted scrap to.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00087"] = {
		["ID"] = 87;
		["actor"] = 1;
		["connectID"] = 88;
		["posX"] = 2370;
		["posY"] = 1590;
		["script"] = "";
		["text"] = "How profitable is it, sorting out all this technical scrap?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00088"] = {
		["ID"] = 88;
		["actor"] = 2;
		["connectID"] = 89;
		["posX"] = 2640;
		["posY"] = 1590;
		["script"] = "";
		["text"] = "Huma, us scrap-breakers feed the entire camp. But few people actually appreciate it.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00089"] = {
		["ID"] = 89;
		["actor"] = 1;
		["connectID"] = 90;
		["posX"] = 2910;
		["posY"] = 1590;
		["script"] = "";
		["text"] = "Well, it's not like it's hard work: you just sit there sorting through bits and pieces...";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00090"] = {
		["ID"] = 90;
		["actor"] = 2;
		["connectID"] = 91;
		["posX"] = 3180;
		["posY"] = 1590;
		["script"] = "";
		["text"] = "You're too much, huma! Not hard work, he says! First our salvagers risk their heads collecting scrap in all these godforsaken pits then bring it here on their backs all the way across the desert.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 2;
		["connectID"] = 250;
		["posX"] = 3450;
		["posY"] = 1590;
		["script"] = "";
		["text"] = "Then we slave away day and night trying to work out what can be taken out without damage and sold.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00092"] = {
		["ID"] = 92;
		["actor"] = 1;
		["connectID"] = 93;
		["posX"] = 1830;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "Why were you exiled?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00093"] = {
		["ID"] = 93;
		["actor"] = 2;
		["connectID"] = 298;
		["posX"] = 2100;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "Actually, I'm not an exile. It's just that nobody cares about my family here. So everyone just calls me Scrap Master. I don't mind. Before this, I spent thirty cycles working on an anti-gravium barge shipping water to miners.";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00094"] = {
		["ID"] = 94;
		["actor"] = 1;
		["connectID"] = 96;
		["posX"] = 1830;
		["posY"] = 1890;
		["script"] = "";
		["text"] = "Who's the head of the camp?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00095"] = {
		["ID"] = 95;
		["actor"] = 1;
		["connectID"] = 97;
		["posX"] = 1830;
		["posY"] = 2040;
		["script"] = "";
		["text"] = "Any tips?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00096"] = {
		["ID"] = 96;
		["actor"] = 2;
		["connectID"] = 251;
		["posX"] = 2100;
		["posY"] = 1890;
		["script"] = "";
		["text"] = "Big Hat — our great and irreplaceable chief. He's been running the camp for twenty cycles and life keeps getting better. Who else would be able to run things so efficiently for so long? Look around, huma, isn't this camp a paradise for free aboris?";
		["time"] = 23.5;
		["type"] = "message";
	};
	["message_00097"] = {
		["ID"] = 97;
		["actor"] = 2;
		["connectID"] = 179;
		["posX"] = 2100;
		["posY"] = 2040;
		["script"] = "";
		["text"] = "Don't wander in the desert, make yourself useful, huma. Fix something or start building, I don't know. A trained pair of hands will always be able to feed you, that's what I say.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00102"] = {
		["ID"] = 102;
		["actor"] = 2;
		["connectID"] = 82;
		["posX"] = 4050;
		["posY"] = 2430;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00103"] = {
		["ID"] = 103;
		["actor"] = 2;
		["connectID"] = 241;
		["posX"] = 1800;
		["posY"] = -270;
		["script"] = "";
		["text"] = "Glad the geezer's still chugging along. Shame he got kicked out of the camp. No one to talk to here these days. Is that all he passed on?";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00105"] = {
		["ID"] = 105;
		["actor"] = 1;
		["animation"] = "dl_head_shake";
		["connectID"] = 132;
		["posX"] = 2790;
		["posY"] = -180;
		["script"] = "";
		["text"] = "I don't have it on me.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00106"] = {
		["ID"] = 106;
		["actor"] = 2;
		["connectID"] = 294;
		["posX"] = 1800;
		["posY"] = -2310;
		["script"] = "";
		["text"] = "But I haven't seen them since then. I suspect they haven't fixed anything and are just messing around there. I don't have time to go after them, I'm busy enough at the workshop.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00107"] = {
		["ID"] = 107;
		["actor"] = 2;
		["connectID"] = 109;
		["posX"] = 2370;
		["posY"] = -2310;
		["script"] = "";
		["text"] = "Once the crane's fixed, bring all three of them back to my workshop. I've had enough of their goofing around. We're far enough behind schedule as it is.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00109"] = {
		["ID"] = 109;
		["actor"] = 1;
		["connectID"] = 229;
		["posX"] = 2640;
		["posY"] = -2310;
		["script"] = "";
		["text"] = "Okay, got you. Fix the crane and bring your boys back to the workshop.";
		["time"] = 8;
		["topic"] = "broken_crane:scrap_master_start";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00111"] = {
		["ID"] = 111;
		["actor"] = 1;
		["connectID"] = 230;
		["posX"] = 1710;
		["posY"] = -1920;
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
		["text"] = "Those workers of yours are quite something! They haven't even started fixing it yet.";
		["time"] = 8;
		["topic"] = "broken_crane:scrap_master_report_workers";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00124"] = {
		["ID"] = 124;
		["actor"] = 2;
		["connectID"] = 125;
		["posX"] = 3060;
		["posY"] = -330;
		["script"] = "";
		["text"] = "Thank you, huma, for bringing news from an old friend. I'll send him a reply through my own channels, you don't have to worry about that.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00125"] = {
		["ID"] = 125;
		["actor"] = 1;
		["connectID"] = 126;
		["posX"] = 3330;
		["posY"] = -270;
		["script"] = "";
		["text"] = "Actually, I'm here not only for that. The Herbalist said that you might have a set of armorer's tools which he needs.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00126"] = {
		["ID"] = 126;
		["actor"] = 2;
		["connectID"] = 318;
		["posX"] = 3600;
		["posY"] = -270;
		["script"] = "";
		["text"] = "Yes, I had a set somewhere. Almost new. You can have it if you have the shards to pay for it.";
		["time"] = 11.5;
		["topic"] = "herbalist_tools:scrap_master_about_tools";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00132"] = {
		["ID"] = 132;
		["actor"] = 2;
		["connectID"] = 125;
		["posX"] = 3060;
		["posY"] = -180;
		["script"] = "";
		["text"] = "Did you just lose it or the guards took it away? Why do you waste my time telling me about it if you don't have it, foolish huma!";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00150"] = {
		["ID"] = 150;
		["actor"] = 2;
		["connectID"] = 161;
		["posX"] = 2700;
		["posY"] = -1530;
		["script"] = "";
		["text"] = "Huma, I told you not to touch them! Now they'll be crawling around my workshop like half-dead slimetoads! It'll take me three times longer than it should to sort out the next batch of scrap!";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00151"] = {
		["ID"] = 151;
		["actor"] = 1;
		["animation"] = "dl_hands_strike";
		["connectID"] = 150;
		["posX"] = 2430;
		["posY"] = -1530;
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
		["text"] = "Your workers fixed it themselves. Admittedly, I may have had to beat them around a little.";
		["time"] = 9;
		["topic"] = "broken_crane:scrap_master_crane_fixed_had_fight";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00152"] = {
		["ID"] = 152;
		["actor"] = 1;
		["animation"] = "dl_point_right";
		["connectID"] = 153;
		["posX"] = 2430;
		["posY"] = -1350;
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
		["text"] = "Your workers fixed it themselves. It wasn't easy, but I hope it was worth it.";
		["time"] = 8.5;
		["topic"] = "broken_crane:scrap_master_crane_fixed_regular";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00153"] = {
		["ID"] = 153;
		["actor"] = 2;
		["connectID"] = 238;
		["posX"] = 2700;
		["posY"] = -1350;
		["script"] = "";
		["text"] = "It's high time we blew up all this old scrap, but we don't have a replacement. So we just keep fixing it. As for my boys, huma, I'm surprised you were so patient with them. Sometimes I myself can hardly resist the urge to give those slacking dumbasses a wrench to the face.";
		["time"] = 27.5;
		["type"] = "message";
	};
	["message_00154"] = {
		["ID"] = 154;
		["actor"] = 2;
		["connectID"] = 240;
		["posX"] = 2700;
		["posY"] = -1170;
		["script"] = "";
		["text"] = "Good job, huma! I wasn't expecting that, to be honest. Definitely not that you, huma, would be able to figure out how that pile of junk works. Before you, one such smartass got himself fried up. As for those three good-for-nothings...";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00155"] = {
		["ID"] = 155;
		["actor"] = 1;
		["animation"] = "dl_talk_3";
		["connectID"] = 154;
		["posX"] = 2430;
		["posY"] = -1170;
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
		["text"] = "I fixed the crane myself. It was easier than making your boys get off their asses and take their tools. You need to educate them, because right now all they want to do is beg for booze and slack off work.";
		["time"] = 21.5;
		["topic"] = "broken_crane:scrap_master_crane_fixed_by_self";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00161"] = {
		["ID"] = 161;
		["actor"] = 1;
		["connectID"] = 237;
		["posX"] = 2970;
		["posY"] = -1530;
		["script"] = "";
		["text"] = "I didn't know your boys were that lazy. It's not my job to go around serving cold beer to a bunch of sloppy aboris. If you don't like my methods, you can deal with them yourself next time. Now about my reward.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00162"] = {
		["ID"] = 162;
		["actor"] = 1;
		["connectID"] = 282;
		["posX"] = 3240;
		["posY"] = -1350;
		["script"] = "";
		["text"] = "Fine. You know best how to deal with your workers. Now let's discuss my reward.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00166"] = {
		["ID"] = 166;
		["actor"] = 1;
		["animation"] = "dl_righthand_wave_short";
		["connectID"] = 282;
		["posX"] = 3240;
		["posY"] = -1170;
		["script"] = "";
		["text"] = "It wasn't that hard. I've been fixing spaceships since I was a child, and this is just some aboriginal gizmo. So, what about my reward?";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00168"] = {
		["ID"] = 168;
		["actor"] = 2;
		["connectID"] = 169;
		["posX"] = 4500;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "Here. Come back when you have the time, huma. I always need workers who know how to do more than just tighten screws.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00169"] = {
		["ID"] = 169;
		["actor"] = 1;
		["connectID"] = 258;
		["posX"] = 4770;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "I'll bear that in mind.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00171"] = {
		["ID"] = 171;
		["actor"] = 2;
		["connectID"] = 172;
		["posX"] = 3750;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "Here's what I can offer — choose what you want.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00173"] = {
		["ID"] = 173;
		["actor"] = 1;
		["connectID"] = 168;
		["posX"] = 4200;
		["posY"] = -1110;
		["script"] = "";
		["text"] = "Worker's Robe.";
		["time"] = 2;
		["topic"] = "broken_crane:scrap_master_finish_armor";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00174"] = {
		["ID"] = 174;
		["actor"] = 1;
		["connectID"] = 168;
		["posX"] = 4200;
		["posY"] = -930;
		["script"] = "";
		["text"] = "Ammo.";
		["time"] = 1.5;
		["topic"] = "broken_crane:scrap_master_finish_ammo";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00179"] = {
		["ID"] = 179;
		["actor"] = 1;
		["animation"] = "dl_shrug_long";
		["connectID"] = 180;
		["posX"] = 2370;
		["posY"] = 2040;
		["script"] = "";
		["text"] = "What if I'm bad at everything?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00180"] = {
		["ID"] = 180;
		["actor"] = 2;
		["connectID"] = 102;
		["posX"] = 2640;
		["posY"] = 2040;
		["script"] = "";
		["text"] = "You can always learn, as long as you're alive. Just keep trying. Look, I managed to get even the dumbest aboris to start working. And they aren't dying from hunger, as you can see.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00181"] = {
		["ID"] = 181;
		["actor"] = 1;
		["connectID"] = 182;
		["posX"] = 2700;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "Do you ever put it back together?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00182"] = {
		["ID"] = 182;
		["actor"] = 2;
		["connectID"] = 183;
		["posX"] = 2970;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "Ha! Good point. I used to, but not anymore. Now I only take things apart.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00183"] = {
		["ID"] = 183;
		["actor"] = 2;
		["connectID"] = 102;
		["posX"] = 3240;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "It suits me, as long as everyone minds their own business.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00186"] = {
		["ID"] = 186;
		["actor"] = 1;
		["animation"] = "dl_hand_negative";
		["connectID"] = 190;
		["posX"] = -600;
		["posY"] = 300;
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
		["text"] = "It's not my job to stand around here giving you wrenches. If you need it, go and get it yourself.";
		["time"] = 11;
		["topic"] = "hidden_scrap_master_wrench:scrap_master_skip_wrench";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00187"] = {
		["ID"] = 187;
		["actor"] = 1;
		["posX"] = -600;
		["posY"] = -120;
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
		["text"] = "Fine, I'll get it now.";
		["time"] = 3.5;
		["topic"] = "hidden_scrap_master_wrench:scrap_master_wait_wrench";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00188"] = {
		["ID"] = 188;
		["actor"] = 1;
		["connectID"] = 191;
		["posX"] = -600;
		["posY"] = 150;
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
		["text"] = "[DISABLED]Ключ тебе тут не поможет. Ты посмотри на гайку, она вся окислилась. Тут срезать уже надо - намертво приржавела.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00189"] = {
		["ID"] = 189;
		["actor"] = 2;
		["posX"] = -600;
		["posY"] = 30;
		["script"] = "";
		["text"] = "Скиллчек.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00190"] = {
		["ID"] = 190;
		["actor"] = 2;
		["connectID"] = 3;
		["posX"] = -330;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Proud one aren't you, huma? Alright, let's cut to the chase. What the hell do you want from me?";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00191"] = {
		["ID"] = 191;
		["actor"] = 2;
		["connectID"] = 192;
		["posX"] = -330;
		["posY"] = 150;
		["script"] = "";
		["text"] = "Ты погляди на него, разбирается. Был бы аборигеном, то взял бы тебя в свою бригаду. А так, наверное, у тебя и своих дел хватает.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00192"] = {
		["ID"] = 192;
		["actor"] = 2;
		["connectID"] = 3;
		["posX"] = 150;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Alright, what do you want?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00193"] = {
		["ID"] = 193;
		["actor"] = 2;
		["posX"] = -330;
		["posY"] = 30;
		["script"] = "";
		["text"] = "Игро получает 75 ХР.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00195"] = {
		["ID"] = 195;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 198;
		["posX"] = -1590;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Here's your wrench.";
		["time"] = 2.5;
		["topic"] = "hidden_scrap_master_wrench:scrap_master_give_wrench";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00201"] = {
		["ID"] = 201;
		["actor"] = 2;
		["connectID"] = 202;
		["posX"] = -870;
		["posY"] = 510;
		["script"] = "";
		["text"] = "Ugh, I'm an old gongo! The screw's all rusty. I'll have to cut it.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00202"] = {
		["ID"] = 202;
		["actor"] = 2;
		["connectID"] = 192;
		["posX"] = -600;
		["posY"] = 510;
		["script"] = "";
		["text"] = "Anyway, thanks for helping. It would have taken me half a day to run there and back on my weary old legs.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00207"] = {
		["ID"] = 207;
		["actor"] = 1;
		["animation"] = "dl_head_shake";
		["connectID"] = 208;
		["posX"] = -870;
		["posY"] = 660;
		["script"] = "";
		["text"] = "I'm a spaceship pilot, not a mechanic. I'm not supposed to know everything about all your rusty junk.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00208"] = {
		["ID"] = 208;
		["actor"] = 2;
		["connectID"] = 192;
		["posX"] = -600;
		["posY"] = 660;
		["script"] = "";
		["text"] = "Yeah, a pilot. All you're good for is looking at your touchscreen and pushing buttons. Fat lot of good your bunch are.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00225"] = {
		["ID"] = 225;
		["actor"] = 2;
		["posX"] = 1260;
		["posY"] = -1680;
		["script"] = "";
		["text"] = "Ветка по квесту Сломанный кран. Тут отражен прогресс квеста.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00226"] = {
		["ID"] = 226;
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
		["posX"] = 1710;
		["posY"] = -2070;
		["script"] = "";
		["text"] = "Апдейт квеста про кран. Активируется, когда Джек узнал, что Скрю обменял деталь на сладкую радость.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00227"] = {
		["ID"] = 227;
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
		["posY"] = -2460;
		["script"] = "";
		["text"] = "Брифинг квеста про кран - проигрывается один раз.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00228"] = {
		["ID"] = 228;
		["actor"] = 2;
		["posX"] = 1710;
		["posY"] = -1500;
		["script"] = "";
		["text"] = "Финиш. Тут суммируется результат.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00229"] = {
		["ID"] = 229;
		["actor"] = 2;
		["connectID"] = 296;
		["posX"] = 2910;
		["posY"] = -2310;
		["script"] = "";
		["text"] = "And try not to bust them up so much they're unable to do their job, will you?";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00230"] = {
		["ID"] = 230;
		["actor"] = 2;
		["connectID"] = 231;
		["posX"] = 1980;
		["posY"] = -1920;
		["script"] = "";
		["text"] = "Why am I not surprised... What was their excuse this time?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00231"] = {
		["ID"] = 231;
		["actor"] = 1;
		["connectID"] = 232;
		["posX"] = 2250;
		["posY"] = -1920;
		["script"] = "";
		["text"] = "An abori called Screw exchanged the parts for drugs, circuit breaker and all. Do you have another one?";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00232"] = {
		["ID"] = 232;
		["actor"] = 2;
		["connectID"] = 290;
		["posX"] = 2520;
		["posY"] = -1920;
		["script"] = "";
		["text"] = "The automatic triple-phase circuit breaker? Exchanged it?! Son of a sandflea and slimetoad! I'll make him work another half cycle for nothing but food! And he'll lick the workshop clean!";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00233"] = {
		["ID"] = 233;
		["actor"] = 1;
		["connectID"] = 234;
		["posX"] = 1710;
		["posY"] = -1740;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   --Only after you talk about them loosing the circuit breaker\
   return getQuestTopicVisible(\"broken_crane\", \"scrap_master_sweet_joy\")\
      and not getQuestTopicVisible(\"broken_crane\", \"scrap_master_report_workers\")\
end\
\
";
		["text"] = "Do you know where in the camp I can get Sweet Joy?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00234"] = {
		["ID"] = 234;
		["actor"] = 2;
		["connectID"] = 235;
		["posX"] = 1980;
		["posY"] = -1740;
		["script"] = "";
		["text"] = "Why would you want to melt your brain into goo? What do you need that crap for?";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00235"] = {
		["ID"] = 235;
		["actor"] = 1;
		["connectID"] = 236;
		["posX"] = 2250;
		["posY"] = -1740;
		["script"] = "";
		["text"] = "Your worker exchanged the circuit breaker for this Joy. If I know who sells it, I might be able to find the circuit breaker.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00236"] = {
		["ID"] = 236;
		["actor"] = 2;
		["connectID"] = 258;
		["posX"] = 2520;
		["posY"] = -1740;
		["script"] = "";
		["text"] = "I have no idea. Ask the traders around the camp, someone must know where to get this crap.";
		["time"] = 10;
		["topic"] = "broken_crane:scrap_master_sweet_joy";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00237"] = {
		["ID"] = 237;
		["actor"] = 2;
		["connectID"] = 282;
		["posX"] = 3240;
		["posY"] = -1530;
		["script"] = "";
		["text"] = "Fine, huma, I hope this teaches them a lesson. A deal's a deal.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00238"] = {
		["ID"] = 238;
		["actor"] = 2;
		["connectID"] = 162;
		["posX"] = 2970;
		["posY"] = -1350;
		["script"] = "";
		["text"] = "Now let's see how they like working three shifts with no days off! And as for that idiot Screw, I'll throw him out of my workshop as soon as he pays me back for his \"screw up\". I'm done with him.";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00240"] = {
		["ID"] = 240;
		["actor"] = 2;
		["connectID"] = 166;
		["posX"] = 2970;
		["posY"] = -1170;
		["script"] = "";
		["text"] = "Let's see how they like working three shifts without days off! And as for that idiot Screw, I'll throw him out of my workshop as soon as he pays me back for his \"screw up\". I'm done with him.";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00241"] = {
		["ID"] = 241;
		["actor"] = 1;
		["connectID"] = 243;
		["posX"] = 2040;
		["posY"] = -270;
		["script"] = "";
		["text"] = "Yes, he gave me a note.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00243"] = {
		["ID"] = 243;
		["actor"] = 2;
		["connectID"] = 40;
		["posX"] = 2340;
		["posY"] = -270;
		["script"] = "";
		["text"] = "So hand it over, what are you waiting for?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00247"] = {
		["ID"] = 247;
		["actor"] = 2;
		["connectID"] = 333;
		["posX"] = 2310;
		["posY"] = 930;
		["script"] = "";
		["text"] = "I could reduce the price a bit if you actually delivered me the Herbalist's note, but you lost it.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00248"] = {
		["ID"] = 248;
		["actor"] = 2;
		["connectID"] = 258;
		["posX"] = 5370;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "No shards - no tools, huma.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00250"] = {
		["ID"] = 250;
		["actor"] = 2;
		["connectID"] = 102;
		["posX"] = 3720;
		["posY"] = 1590;
		["script"] = "";
		["text"] = "Come on, spend a few shifts with us, try reaching the daily norm and then we'll see how you feel after.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00251"] = {
		["ID"] = 251;
		["actor"] = 1;
		["animation"] = "dl_head_scratch";
		["connectID"] = 252;
		["posX"] = 2370;
		["posY"] = 1890;
		["script"] = "";
		["text"] = "You don't seem to think very highly of your leader.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00252"] = {
		["ID"] = 252;
		["actor"] = 2;
		["connectID"] = 102;
		["posX"] = 2640;
		["posY"] = 1890;
		["script"] = "";
		["text"] = "Anyone with ears and eyes can understand what's going on. Really, if you want to talk politics, go to the bar. That's all they do over there.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00253"] = {
		["ID"] = 253;
		["actor"] = 1;
		["connectID"] = 3;
		["posX"] = 1830;
		["posY"] = 2190;
		["script"] = "";
		["text"] = "Back.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00255"] = {
		["ID"] = 255;
		["actor"] = 1;
		["connectID"] = 13;
		["posX"] = 1260;
		["posY"] = -1560;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible() and self:hasVisibleChildren()\
end\
\
";
		["text"] = "About the crane...";
		["time"] = 2.5;
		["topic"] = "broken_crane:scrap_master_about_crane";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00257"] = {
		["ID"] = 257;
		["actor"] = 1;
		["connectID"] = 318;
		["posX"] = 1470;
		["posY"] = 330;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"35\")\
end\
\
";
		["text"] = "About the armorer's tools...";
		["time"] = 3;
		["topic"] = "herbalist_tools:scrap_master_about_tools";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00258"] = {
		["ID"] = 258;
		["actor"] = 2;
		["connectID"] = 3;
		["posX"] = 7230;
		["posY"] = -1200;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00259"] = {
		["ID"] = 259;
		["actor"] = 2;
		["connectID"] = 3;
		["posX"] = -1590;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "Hey, huma.";
		["time"] = 2;
		["topic"] = "hidden_scrap_master_wrench:scrap_master_regular_greeting";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00261"] = {
		["ID"] = 261;
		["actor"] = 1;
		["connectID"] = 278;
		["posX"] = 3060;
		["posY"] = -1920;
		["script"] = "";
		["text"] = "How about giving me money to buy spare parts?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00264"] = {
		["ID"] = 264;
		["actor"] = 1;
		["connectID"] = 258;
		["posX"] = 1710;
		["posY"] = -540;
		["script"] = "";
		["text"] = "\\[BACK]We'll talk about it later.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00265"] = {
		["ID"] = 265;
		["actor"] = 1;
		["connectID"] = 185;
		["posX"] = -1590;
		["posY"] = 270;
		["script"] = "";
		["text"] = "About the wrench...";
		["time"] = 2.5;
		["topic"] = "hidden_scrap_master_wrench:scrap_master_waits_wrench";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00266"] = {
		["ID"] = 266;
		["actor"] = 1;
		["posX"] = -2370;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Bye";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00267"] = {
		["ID"] = 267;
		["actor"] = 1;
		["connectID"] = 271;
		["posX"] = -2760;
		["posY"] = -30;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00268"] = {
		["ID"] = 268;
		["actor"] = 2;
		["connectID"] = 273;
		["posX"] = -3150;
		["posY"] = 240;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00269"] = {
		["ID"] = 269;
		["actor"] = 1;
		["connectID"] = 196;
		["posX"] = -2760;
		["posY"] = 420;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00270"] = {
		["ID"] = 270;
		["actor"] = 1;
		["posX"] = -2370;
		["posY"] = -330;
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
		["text"] = "Start broken crane";
		["time"] = 2.5;
		["topic"] = "broken_crane:scrap_master_start";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00278"] = {
		["ID"] = 278;
		["actor"] = 2;
		["connectID"] = 274;
		["posX"] = 3330;
		["posY"] = -1920;
		["script"] = "";
		["text"] = "You sly dog! Do you expect me to just hand you a bunch of money to sit here and hope to see your pink snout again? I'll compensate you when the crane is fixed!";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00279"] = {
		["ID"] = 279;
		["actor"] = 2;
		["connectID"] = 13;
		["posX"] = 3750;
		["posY"] = -1980;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"broken_crane\", \"scrap_master_sweet_joy\")\
      and not getQuestTopicVisible(\"broken_crane\", \"scrap_master_report_workers\")\
end\
\
";
		["text"] = "";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00280"] = {
		["ID"] = 280;
		["actor"] = 2;
		["posX"] = 3750;
		["posY"] = -2100;
		["script"] = "";
		["text"] = "Allow to ask about sweet joy without leaving the hub. Other nodes do not return to the hub because there's no persistent default questions in it and every branch would exit the hub after playing 264.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00281"] = {
		["ID"] = 281;
		["actor"] = 1;
		["connectID"] = 171;
		["posX"] = 1710;
		["posY"] = -1020;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible() and not getQuestTopicVisible(\"broken_crane\", \"scrap_master_crane_fixed\")\
end\
\
";
		["text"] = "The crane is fixed, the workers have stopped slacking off — now about the reward.";
		["time"] = 8.5;
		["topic"] = "broken_crane:scrap_master_workers_coming";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00283"] = {
		["ID"] = 283;
		["actor"] = 2;
		["connectID"] = 258;
		["posX"] = 3750;
		["posY"] = -1320;
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
		["text"] = "Get those dumbasses here and we'll talk about your reward.";
		["time"] = 6;
		["topic"] = "broken_crane:scrap_master_workers_still_there";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00284"] = {
		["ID"] = 284;
		["actor"] = 1;
		["posX"] = -2370;
		["posY"] = -480;
		["script"] = "local coro = require \"coroutines.helpers\"\
function message:onStart()\
   runTimerCo(function()\
      self:fireDiscussEvent(\"hidden_scrap_master_wrench:scrap_master_intro\")\
\
      coro.wait(0)\
\
      self:fireDiscussEvent(\"hidden_scrap_master_wrench:scrap_master_skip_wrench\")\
   end)\
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
		["text"] = "Skip Wrench";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00285"] = {
		["ID"] = 285;
		["actor"] = 2;
		["posX"] = 1680;
		["posY"] = 2460;
		["script"] = "";
		["text"] = "Come again, huma. I'll be glad to see you.";
		["time"] = 5.5;
		["topic"] = "broken_crane:scrap_master_quest_finished";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00290"] = {
		["ID"] = 290;
		["actor"] = 2;
		["connectID"] = 261;
		["posX"] = 2790;
		["posY"] = -1920;
		["script"] = "";
		["text"] = "No, huma, I don't have another circuit breaker. Try and find the one those dumbasses lost. Let's hope it's still in the camp.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00293"] = {
		["ID"] = 293;
		["actor"] = 2;
		["connectID"] = 258;
		["posX"] = 3750;
		["posY"] = -1830;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00294"] = {
		["ID"] = 294;
		["actor"] = 2;
		["connectID"] = 107;
		["posX"] = 2070;
		["posY"] = -2310;
		["script"] = "";
		["text"] = "Go and see what they're doing. Maybe they need help or just a kick up the arse to start working.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00295"] = {
		["ID"] = 295;
		["actor"] = 2;
		["connectID"] = 258;
		["posX"] = 3720;
		["posY"] = -2310;
		["script"] = "";
		["text"] = "It'll be a lot better than buying it from the local bloodsuckers. You'd have to sell a kidney to afford a shirt at their prices!";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00296"] = {
		["ID"] = 296;
		["actor"] = 1;
		["connectID"] = 297;
		["posX"] = 3180;
		["posY"] = -2310;
		["script"] = "";
		["text"] = "I'll try to be gentle with them. What will I get when the crane is fixed?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00297"] = {
		["ID"] = 297;
		["actor"] = 2;
		["connectID"] = 295;
		["posX"] = 3450;
		["posY"] = -2310;
		["script"] = "";
		["text"] = "I think I have a good outfit of your size. I'll even throw in some ammo for you.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00298"] = {
		["ID"] = 298;
		["actor"] = 2;
		["connectID"] = 181;
		["posX"] = 2370;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "Then they wrote the barge off and fired me. Now they won't hire me again because apparently I'm too old. Whatever, I'm not going to lie down and wait to die. I can't even go to sleep without taking something apart first.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00300"] = {
		["ID"] = 300;
		["actor"] = 2;
		["connectID"] = 308;
		["posX"] = 4350;
		["posY"] = 540;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"herbalist_tools\"):getParam(\"scrap_master_price\") == 700\
end\
\
";
		["text"] = "The tools would cost you 700 shards.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00301"] = {
		["ID"] = 301;
		["actor"] = 2;
		["connectID"] = 308;
		["posX"] = 4350;
		["posY"] = 660;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"herbalist_tools\"):getParam(\"scrap_master_price\") == 650\
end\
\
";
		["text"] = "The tools would cost you 650 shards.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00302"] = {
		["ID"] = 302;
		["actor"] = 2;
		["connectID"] = 308;
		["posX"] = 4350;
		["posY"] = 780;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"herbalist_tools\"):getParam(\"scrap_master_price\") == 600\
end\
\
";
		["text"] = "The tools would cost you 600 shards.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00303"] = {
		["ID"] = 303;
		["actor"] = 2;
		["connectID"] = 308;
		["posX"] = 4350;
		["posY"] = 900;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"herbalist_tools\"):getParam(\"scrap_master_price\") == 550\
end\
\
";
		["text"] = "The tools would cost you 550 shards.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00304"] = {
		["ID"] = 304;
		["actor"] = 2;
		["connectID"] = 308;
		["posX"] = 4350;
		["posY"] = 1020;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"herbalist_tools\"):getParam(\"scrap_master_price\") == 500\
end\
\
";
		["text"] = "The tools would cost you 500 shards.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00305"] = {
		["ID"] = 305;
		["actor"] = 2;
		["connectID"] = 308;
		["posX"] = 4350;
		["posY"] = 1140;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"herbalist_tools\"):getParam(\"scrap_master_price\") == 450\
end\
\
";
		["text"] = "The tools would cost you 450 shards.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00306"] = {
		["ID"] = 306;
		["actor"] = 2;
		["connectID"] = 308;
		["posX"] = 4350;
		["posY"] = 1260;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"herbalist_tools\"):getParam(\"scrap_master_price\") == 400\
end\
\
";
		["text"] = "The tools would cost you 400 shards.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00307"] = {
		["ID"] = 307;
		["actor"] = 2;
		["connectID"] = 308;
		["posX"] = 4350;
		["posY"] = 1380;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"herbalist_tools\"):getParam(\"scrap_master_price\") == 350\
end\
\
";
		["text"] = "The tools would cost you 350 shards.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00308"] = {
		["ID"] = 308;
		["actor"] = 2;
		["connectID"] = 309;
		["posX"] = 4680;
		["posY"] = 960;
		["script"] = "";
		["text"] = "Trust me, in the camp you won't find a better price.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00310"] = {
		["ID"] = 310;
		["actor"] = 1;
		["animation"] = "dl_head_nod";
		["connectID"] = 312;
		["posX"] = 5100;
		["posY"] = 840;
		["script"] = "";
		["text"] = "\\[Buy Armorer's Tools.]";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00311"] = {
		["ID"] = 311;
		["actor"] = 1;
		["animation"] = "dl_head_shake";
		["connectID"] = 248;
		["posX"] = 5100;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "It's too much. I don't have enough shards.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00313"] = {
		["ID"] = 313;
		["actor"] = 2;
		["connectID"] = 258;
		["posX"] = 5520;
		["posY"] = 870;
		["script"] = "";
		["text"] = "Come back when you have enough money.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00316"] = {
		["ID"] = 316;
		["actor"] = 1;
		["connectID"] = 17;
		["posX"] = 1890;
		["posY"] = 150;
		["script"] = "";
		["text"] = "Is there anything I can do for you in exchange for a discount on the tools?";
		["time"] = 9;
		["topic"] = "broken_crane:scrap_master_start";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00319"] = {
		["ID"] = 319;
		["actor"] = 1;
		["connectID"] = 341;
		["posX"] = 1590;
		["posY"] = 780;
		["script"] = "";
		["text"] = "What's the latest price on the tools?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00320"] = {
		["ID"] = 320;
		["actor"] = 1;
		["posX"] = -2370;
		["posY"] = -210;
		["script"] = "local coro = require \"coroutines.helpers\"\
function message:onStart()\
   runTimerCo(function()\
      local q = getQuest(\"broken_crane\")\
      self:fireDiscussEvent(\"broken_crane:scrap_master_start\")\
\
      coro.wait(0)\
\
      self:fireDiscussEvent(\"broken_crane:cog_briefing\")\
      q:setTopicVisible(\"cog_was_beaten\", true)\
\
      coro.wait(0)\
\
      self:fireDiscussEvent(\"broken_crane:cog_start_repair\")\
\
      coro.wait(0)\
\
      q:onTimePassedRepair()\
\
      coro.wait(0)\
\
      self:fireDiscussEvent(\"broken_crane:cog_go_to_shop\")\
\
      coro.wait(0)\
\
      self:fireDiscussEvent(\"broken_crane:scrap_master_finish_armor\")\
   end)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuest(\"broken_crane\"):isFinished()\
end\
\
";
		["text"] = "Finish Broken Crane, beating";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00321"] = {
		["ID"] = 321;
		["actor"] = 1;
		["posX"] = -2370;
		["posY"] = -90;
		["script"] = "local coro = require \"coroutines.helpers\"\
function message:onStart()\
   runTimerCo(function()\
      local q = getQuest(\"broken_crane\")\
      self:fireDiscussEvent(\"broken_crane:scrap_master_start\")\
\
      coro.wait(0)\
\
      self:fireDiscussEvent(\"broken_crane:cog_briefing\")\
\
      coro.wait(0)\
\
      self:fireDiscussEvent(\"broken_crane:cog_start_repair\")\
\
      coro.wait(0)\
\
      q:onTimePassedRepair()\
\
      coro.wait(0)\
\
      self:fireDiscussEvent(\"broken_crane:cog_go_to_shop\")\
\
      coro.wait(0)\
\
      self:fireDiscussEvent(\"broken_crane:scrap_master_finish_armor\")\
   end)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuest(\"broken_crane\"):isFinished()\
end\
\
";
		["text"] = "Finish Broken Crane, no beating";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00322"] = {
		["ID"] = 322;
		["actor"] = 1;
		["posX"] = -2370;
		["posY"] = 60;
		["script"] = "local coro = require \"coroutines.helpers\"\
function message:onStart()\
   runTimerCo(function()\
      self:fireDiscussEvent(\"broken_crane:scrap_master_start\")\
\
      coro.wait(0)\
\
      self:fireDiscussEvent(\"broken_crane:cog_briefing\")\
\
      coro.wait(0)\
\
      self:fireDiscussEvent(\"broken_crane:self_repair_transformer\")\
\
      coro.wait(0)\
\
      self:fireDiscussEvent(\"broken_crane:self_repair_board\")\
\
      coro.wait(0)\
\
      self:fireDiscussEvent(\"broken_crane:cog_go_to_shop\")\
\
      coro.wait(0)\
\
      self:fireDiscussEvent(\"broken_crane:scrap_master_finish_armor\")\
   end)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuest(\"broken_crane\"):isFinished()\
end\
\
";
		["text"] = "Finish Broken Crane, self repair";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00324"] = {
		["ID"] = 324;
		["actor"] = 1;
		["connectID"] = 325;
		["posX"] = 1500;
		["posY"] = -90;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"35\")\
end\
\
";
		["text"] = "\\[Give Herbalist's Message]I have here a note for you from the Herbalist.";
		["time"] = 7;
		["topic"] = "herbalist_tools:scrap_master_give_message";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00325"] = {
		["ID"] = 325;
		["actor"] = 2;
		["connectID"] = 3;
		["posX"] = 1800;
		["posY"] = -90;
		["script"] = "";
		["text"] = "Thank you, huma, for bringing news from an old friend. I'll send him a reply through my own channels, you don't have to worry about that.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00326"] = {
		["ID"] = 326;
		["actor"] = 2;
		["connectID"] = 333;
		["posX"] = 2310;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Fair enough. I can make you a small discount as a token of gratitude.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00330"] = {
		["ID"] = 330;
		["actor"] = 2;
		["connectID"] = 333;
		["posX"] = 2310;
		["posY"] = 630;
		["script"] = "";
		["text"] = "You brought me a note from my friend Herbalist, I guess that earns you a small discount.";
		["time"] = 9.5;
		["topic"] = "herbalist_tools:scrap_master_got_message_discount";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00332"] = {
		["ID"] = 332;
		["actor"] = 2;
		["connectID"] = 299;
		["posX"] = 3030;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "In this camp it works like this: you scratch my back and I'll scratch yours. But until then...";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00335"] = {
		["ID"] = 335;
		["actor"] = 2;
		["connectID"] = 332;
		["posX"] = 2760;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "If you want a real price cut then make yourself useful.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00339"] = {
		["ID"] = 339;
		["actor"] = 2;
		["connectID"] = 333;
		["posX"] = 2310;
		["posY"] = 780;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["topic"] = "herbalist_tools:scrap_master_has_message";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00340"] = {
		["ID"] = 340;
		["actor"] = 2;
		["posX"] = 2760;
		["posY"] = 870;
		["script"] = "";
		["text"] = "These two should be compatible with all three in the previous switch";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00341"] = {
		["ID"] = 341;
		["actor"] = 2;
		["connectID"] = 328;
		["posX"] = 1860;
		["posY"] = 780;
		["script"] = "";
		["text"] = "Let's see...";
		["time"] = 2;
		["type"] = "message";
	};
	["switch_00003"] = {
		["ID"] = 3;
		["connectionsID"] = {
			[1] = 14;
			[2] = 255;
			[3] = 323;
			[4] = 8;
			[5] = 9;
		};
		["h"] = 140;
		["posX"] = 1020;
		["posY"] = 240;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00013"] = {
		["ID"] = 13;
		["connectionsID"] = {
			[1] = 111;
			[2] = 233;
			[3] = 16;
			[4] = 281;
			[5] = 264;
		};
		["h"] = 140;
		["posX"] = 1530;
		["posY"] = -1560;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00023"] = {
		["ID"] = 23;
		["connectionsID"] = {
			[1] = 151;
			[2] = 152;
			[3] = 155;
		};
		["posX"] = 2250;
		["posY"] = -1350;
		["type"] = "switch";
	};
	["switch_00040"] = {
		["ID"] = 40;
		["connectionsID"] = {
			[1] = 41;
			[2] = 105;
		};
		["h"] = 140;
		["posX"] = 2580;
		["posY"] = -300;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00048"] = {
		["ID"] = 48;
		["connectionsID"] = {
			[1] = 49;
			[2] = 50;
		};
		["posX"] = 3240;
		["posY"] = 720;
		["type"] = "switch";
	};
	["switch_00059"] = {
		["ID"] = 59;
		["connectionsID"] = {
			[1] = 61;
			[2] = 60;
		};
		["posX"] = 3690;
		["posY"] = 720;
		["type"] = "switch";
	};
	["switch_00082"] = {
		["ID"] = 82;
		["connectionsID"] = {
			[1] = 83;
			[2] = 92;
			[3] = 94;
			[4] = 95;
			[5] = 253;
		};
		["h"] = 140;
		["posX"] = 1650;
		["posY"] = 1860;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00172"] = {
		["ID"] = 172;
		["connectionsID"] = {
			[1] = 173;
			[2] = 174;
		};
		["posX"] = 4020;
		["posY"] = -1020;
		["type"] = "switch";
	};
	["switch_00185"] = {
		["ID"] = 185;
		["connectionsID"] = {
			[1] = 187;
			[2] = 188;
			[3] = 186;
		};
		["posX"] = -780;
		["posY"] = 150;
		["type"] = "switch";
	};
	["switch_00196"] = {
		["ID"] = 196;
		["connectionsID"] = {
			[1] = 0;
			[2] = 265;
			[3] = 195;
			[4] = 259;
		};
		["h"] = 120;
		["posX"] = -1770;
		["posY"] = 420;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00198"] = {
		["ID"] = 198;
		["connectionsID"] = {
			[1] = 75;
			[2] = 74;
		};
		["posX"] = -1290;
		["posY"] = 600;
		["type"] = "switch";
	};
	["switch_00271"] = {
		["ID"] = 271;
		["connectionsID"] = {
			[1] = 284;
			[2] = 270;
			[3] = 320;
			[4] = 321;
			[5] = 322;
			[6] = 266;
		};
		["h"] = 160;
		["posX"] = -2520;
		["posY"] = -30;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00273"] = {
		["ID"] = 273;
		["connectionsID"] = {
			[1] = 267;
			[2] = 269;
		};
		["posX"] = -2910;
		["posY"] = 240;
		["type"] = "switch";
	};
	["switch_00274"] = {
		["ID"] = 274;
		["connectionsID"] = {
			[1] = 279;
			[2] = 293;
		};
		["posX"] = 3600;
		["posY"] = -1920;
		["type"] = "switch";
	};
	["switch_00282"] = {
		["ID"] = 282;
		["connectionsID"] = {
			[1] = 283;
			[2] = 171;
		};
		["posX"] = 3570;
		["posY"] = -1230;
		["type"] = "switch";
	};
	["switch_00286"] = {
		["ID"] = 286;
		["connectionsID"] = {
			[1] = 285;
			[2] = 81;
		};
		["posX"] = 1500;
		["posY"] = 2550;
		["type"] = "switch";
	};
	["switch_00299"] = {
		["ID"] = 299;
		["connectionsID"] = {
			[1] = 300;
			[2] = 301;
			[3] = 302;
			[4] = 303;
			[5] = 304;
			[6] = 305;
			[7] = 306;
			[8] = 307;
		};
		["h"] = 200;
		["posX"] = 4110;
		["posY"] = 810;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00309"] = {
		["ID"] = 309;
		["connectionsID"] = {
			[1] = 310;
			[2] = 311;
		};
		["posX"] = 4950;
		["posY"] = 960;
		["type"] = "switch";
	};
	["switch_00312"] = {
		["ID"] = 312;
		["connectionsID"] = {
			[1] = 63;
			[2] = 313;
		};
		["posX"] = 5370;
		["posY"] = 840;
		["type"] = "switch";
	};
	["switch_00318"] = {
		["ID"] = 318;
		["connectionsID"] = {
			[1] = 316;
			[2] = 36;
			[3] = 319;
		};
		["posX"] = 1710;
		["posY"] = 330;
		["type"] = "switch";
	};
	["switch_00323"] = {
		["ID"] = 323;
		["connectionsID"] = {
			[1] = 35;
			[2] = 324;
			[3] = 257;
		};
		["name"] = "tools";
		["posX"] = 1320;
		["posY"] = 30;
		["type"] = "switch";
	};
	["switch_00328"] = {
		["ID"] = 328;
		["connectionsID"] = {
			[1] = 330;
			[2] = 339;
			[3] = 247;
		};
		["posX"] = 2130;
		["posY"] = 780;
		["type"] = "switch";
	};
	["switch_00333"] = {
		["ID"] = 333;
		["connectionsID"] = {
			[1] = 46;
			[2] = 335;
		};
		["posX"] = 2610;
		["posY"] = 780;
		["type"] = "switch";
	};
}
local obj2 = {
	["actor_prefab"] = {
		[1] = "human_male";
	};
}
return obj1 ,obj2
