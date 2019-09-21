-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 2;
		["connectID"] = 41;
		["posX"] = -4410;
		["posY"] = 120;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 1;
		["posX"] = -3930;
		["posY"] = -30;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 1;
		["connectID"] = 54;
		["posX"] = -3930;
		["posY"] = 240;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 60;
		["posX"] = -1320;
		["posY"] = -450;
		["script"] = "";
		["text"] = "Do you know one of your guards is making money on the side?";
		["time"] = 7.5;
		["topic"] = "ragpicker_heist:crooked_leg_about_bamba";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 2;
		["connectID"] = 65;
		["posX"] = -3510;
		["posY"] = 120;
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
		["text"] = "Hey, pinkface, what's the nosing around about?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 2;
		["connectID"] = 13;
		["posX"] = -3090;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Huma, report!";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 1;
		["connectID"] = 81;
		["posX"] = -1320;
		["posY"] = -240;
		["script"] = "";
		["text"] = "Take a good look at that remote watchtower!";
		["time"] = 5;
		["topic"] = "ragpicker_heist:crooked_leg_reveal";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 2;
		["connectID"] = 75;
		["posX"] = -1050;
		["posY"] = -450;
		["script"] = "";
		["text"] = "And who might be that poor bastard, whose legs I'm about to break if I don't find him at his station?";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 1;
		["posX"] = -1320;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Bye.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 2;
		["connectID"] = 13;
		["posX"] = 2760;
		["posY"] = 90;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 1;
		["animation"] = "dl_talk_1";
		["connectID"] = 67;
		["posX"] = -2430;
		["posY"] = 120;
		["script"] = "";
		["text"] = "And what gives you the right to boss me around?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00065"] = {
		["ID"] = 65;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 66;
		["posX"] = -3240;
		["posY"] = 120;
		["script"] = "";
		["text"] = "Just looking. Why so suspicious?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00066"] = {
		["ID"] = 66;
		["actor"] = 2;
		["connectID"] = 112;
		["posX"] = -2970;
		["posY"] = 120;
		["script"] = "";
		["text"] = "I'm not suspicious but I'm vigilant! It's my job to keep the camp secure. And I don't have much love for strangers roaming about the area.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
		["actor"] = 2;
		["connectID"] = 108;
		["posX"] = -2160;
		["posY"] = 120;
		["script"] = "";
		["text"] = "My position as the camp's guard superintendent, huma. And you better watch your tongue unless you want me to call the guys and feed you to the sandsharks.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 1;
		["connectID"] = 76;
		["posX"] = -240;
		["posY"] = -450;
		["script"] = "";
		["text"] = "You could as well go check who is actually manning it...";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00071"] = {
		["ID"] = 71;
		["actor"] = 1;
		["connectID"] = 62;
		["posX"] = 300;
		["posY"] = -450;
		["script"] = "";
		["text"] = "I might have no other choice...";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00073"] = {
		["ID"] = 73;
		["actor"] = 2;
		["connectID"] = 69;
		["posX"] = -510;
		["posY"] = -450;
		["script"] = "";
		["text"] = "Bamba? Who are you to badmouth one of my best guards? There he is, manning the far watchtower with his partner. I can clearly see them from here, huma.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00075"] = {
		["ID"] = 75;
		["actor"] = 1;
		["animation"] = "dl_point_back";
		["connectID"] = 73;
		["posX"] = -780;
		["posY"] = -450;
		["script"] = "";
		["text"] = "I saw guard Bamba near Ragpicker's warehouse. If that's the station you assigned him to, then fine.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00076"] = {
		["ID"] = 76;
		["actor"] = 2;
		["animation"] = "dl_hand_negative";
		["connectID"] = 71;
		["posX"] = 30;
		["posY"] = -450;
		["script"] = "";
		["text"] = "Then you, huma, will go and check it before trying to sell me your bullshit!";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00077"] = {
		["ID"] = 77;
		["actor"] = 2;
		["connectID"] = 115;
		["posX"] = 1920;
		["posY"] = -240;
		["script"] = "";
		["text"] = "I'll check Ragpicker out, too, huma. If it turns out you didn't just invent your story, then he'll get what he deserves.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00079"] = {
		["ID"] = 79;
		["actor"] = 1;
		["animation"] = "dl_talk_3";
		["connectID"] = 123;
		["posX"] = 30;
		["posY"] = -240;
		["script"] = "";
		["text"] = "They've set up dummies to stand in for themselves while they're doing devil knows what. One's been boozing it up, and the other leaving the station for his side gig.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00080"] = {
		["ID"] = 80;
		["actor"] = 1;
		["connectID"] = 77;
		["posX"] = 1650;
		["posY"] = -240;
		["script"] = "";
		["text"] = "I'd also suggest you pay a visit to Ragpicker and do something about him luring away your men to work at his shop.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00081"] = {
		["ID"] = 81;
		["actor"] = 2;
		["animation"] = "dl_clench_fist";
		["connectID"] = 122;
		["posX"] = -1050;
		["posY"] = -240;
		["script"] = "";
		["text"] = "Slimetoad screw you, huma! What the hell have you done with the guards on it?";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00082"] = {
		["ID"] = 82;
		["actor"] = 1;
		["connectID"] = 62;
		["posX"] = -780;
		["posY"] = -60;
		["script"] = "";
		["text"] = "Relax, I can see you're a tough guy. Looks like I'm sufficiently protected while I'm here.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 2;
		["animation"] = "dl_talk_2";
		["connectID"] = 82;
		["posX"] = -1050;
		["posY"] = -60;
		["script"] = "";
		["text"] = "Firstly, I maintain discipline here in the camp; secondly, I protect it from the enemy, external and internal alike; thirdly, who the hell are you to make me report to you?!";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00084"] = {
		["ID"] = 84;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 83;
		["posX"] = -1320;
		["posY"] = -60;
		["script"] = "";
		["text"] = "What's your job here exactly?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00085"] = {
		["ID"] = 85;
		["actor"] = 2;
		["connectID"] = 62;
		["posX"] = -270;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Hope you aren't one of those, or you might end up nailed to the gate. That's all you need to know, huma.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00086"] = {
		["ID"] = 86;
		["actor"] = 2;
		["connectID"] = 116;
		["posX"] = -840;
		["posY"] = 420;
		["script"] = "";
		["text"] = "We're in a difficult situation here. Those bloodthirsty Scalphunter savages have locked us in from the outside, and they're getting closer by the day.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00087"] = {
		["ID"] = 87;
		["actor"] = 1;
		["animation"] = "dl_talk_3";
		["connectID"] = 99;
		["posX"] = -1320;
		["posY"] = 270;
		["script"] = "";
		["text"] = "What's the status?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00088"] = {
		["ID"] = 88;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 94;
		["posX"] = -1320;
		["posY"] = 990;
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
		["text"] = "What about the guards at that remote watchtower?";
		["time"] = 5;
		["topic"] = "ragpicker_heist:crooked_leg_about_tower";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00089"] = {
		["ID"] = 89;
		["actor"] = 2;
		["connectID"] = 103;
		["posX"] = -810;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "You were right huma... I guess my eyes are not as good as they used to be.";
		["time"] = 9.5;
		["topic"] = "ragpicker_heist:crooked_leg_bamba_exiled";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00090"] = {
		["ID"] = 90;
		["actor"] = 2;
		["connectID"] = 62;
		["posX"] = -270;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "If you ever stumble across the two madrons, I'd be very grateful if you gave them what they deserve, and in full!";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 2;
		["connectID"] = 95;
		["posX"] = -810;
		["posY"] = 840;
		["script"] = "";
		["text"] = "All good there. Bamba and his partner, the whats-his-name with googly eyes, are at their station.";
		["time"] = 9;
		["topic"] = "ragpicker_heist:crooked_leg_bamba_okay";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00095"] = {
		["ID"] = 95;
		["actor"] = 2;
		["connectID"] = 62;
		["posX"] = -540;
		["posY"] = 840;
		["script"] = "";
		["text"] = "Now you, huma — if I hear you talk smack about my boys again, I'll cut out your tongue!";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00100"] = {
		["ID"] = 100;
		["actor"] = 2;
		["connectID"] = 104;
		["posX"] = -840;
		["posY"] = 180;
		["script"] = "";
		["text"] = "We've found a couple of bad eggs among my subordinates, total degenerates! They'd been deceiving me and their fellow outcasats. And all that when we're having it so hard at the camp!";
		["time"] = 17;
		["topic"] = "ragpicker_heist:crooked_leg_bamba_exiled";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00103"] = {
		["ID"] = 103;
		["actor"] = 2;
		["connectID"] = 90;
		["posX"] = -540;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "Bamba and his partner, the whats-his-name with googly eyes, tried to fuck all of us over. I wanted to make an example out of those bastards. I hoped they'd beg me to finish them off. But they managed to flee.";
		["time"] = 21;
		["type"] = "message";
	};
	["message_00104"] = {
		["ID"] = 104;
		["actor"] = 2;
		["connectID"] = 105;
		["posX"] = -570;
		["posY"] = 180;
		["script"] = "";
		["text"] = "Bamba and his partner, the whats-his-name with googly eyes, tried to fuck all of us over. I wanted to make an example out of those bastards. I hoped they'd beg me to finish them off. But they managed to flee.";
		["time"] = 21;
		["type"] = "message";
	};
	["message_00105"] = {
		["ID"] = 105;
		["actor"] = 2;
		["connectID"] = 86;
		["posX"] = -270;
		["posY"] = 180;
		["script"] = "";
		["text"] = "If you ever stumble across the two madrons, I'd be very grateful if you gave them what they deserve, and in full!";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00107"] = {
		["ID"] = 107;
		["actor"] = 2;
		["animation"] = "dl_chintouch_loop";
		["connectID"] = 114;
		["posX"] = 1110;
		["posY"] = -240;
		["script"] = "";
		["text"] = "While those two have never complained about nothing. Strange... All right, guess I'll have to go and check that myself.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00108"] = {
		["ID"] = 108;
		["actor"] = 2;
		["connectID"] = 13;
		["posX"] = -1890;
		["posY"] = 120;
		["script"] = "";
		["text"] = "Now tell me what your business here is, or go somewhere else to \"look\" before you get hurt.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00112"] = {
		["ID"] = 112;
		["actor"] = 2;
		["animation"] = "dl_hand_chopfast";
		["connectID"] = 64;
		["posX"] = -2700;
		["posY"] = 120;
		["script"] = "";
		["text"] = "Report: who are you and what the hell do you want here?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00113"] = {
		["ID"] = 113;
		["actor"] = 2;
		["animation"] = "dl_chintouch_loop";
		["connectID"] = 107;
		["posX"] = 840;
		["posY"] = -240;
		["script"] = "";
		["text"] = "The guards at the other tower complain all the time. They get too hot in the day, and too cold at night, and the tower rocks around like mad when the wind blows...";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00114"] = {
		["ID"] = 114;
		["actor"] = 2;
		["animation"] = "dl_chintouch_end";
		["connectID"] = 80;
		["posX"] = 1380;
		["posY"] = -240;
		["script"] = "";
		["text"] = "However, if it turns out you've made it all up just to watch me climb some doggone ladders, you better take off right now, huma.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00115"] = {
		["ID"] = 115;
		["actor"] = 2;
		["connectID"] = 62;
		["posX"] = 2190;
		["posY"] = -240;
		["script"] = "";
		["text"] = "As for those two guards... If I find out that they were really screwing me over, then lashing and dishonourable discharge won't be enough for them. It's been a while since we had a nice public execution!";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00116"] = {
		["ID"] = 116;
		["actor"] = 2;
		["connectID"] = 85;
		["posX"] = -570;
		["posY"] = 420;
		["script"] = "";
		["text"] = "All the while, we've got plenty of fearmongers, rabble-rousers, and double-crossers inside the camp.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00117"] = {
		["ID"] = 117;
		["actor"] = 1;
		["connectID"] = 79;
		["posX"] = -240;
		["posY"] = -240;
		["script"] = "";
		["text"] = "Hey, wait, don't jump on me like that! Listen, Bamba and his partner have played you like a damn fiddle.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00118"] = {
		["ID"] = 118;
		["actor"] = 2;
		["connectID"] = 117;
		["posX"] = -510;
		["posY"] = -240;
		["script"] = "";
		["text"] = "You did... WHAT?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00119"] = {
		["ID"] = 119;
		["actor"] = 2;
		["animation"] = "dl_chintouch_start";
		["connectID"] = 113;
		["posX"] = 570;
		["posY"] = -240;
		["script"] = "";
		["text"] = "Wait... hm... to think of it...";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00122"] = {
		["ID"] = 122;
		["actor"] = 1;
		["connectID"] = 118;
		["posX"] = -780;
		["posY"] = -240;
		["script"] = "";
		["text"] = "Me? Just knocked a \"watcher\" down.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00123"] = {
		["ID"] = 123;
		["actor"] = 1;
		["connectID"] = 119;
		["posX"] = 300;
		["posY"] = -240;
		["script"] = "";
		["text"] = "I gave those dummy \"watchers\" a good kick in the back.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["switch_00013"] = {
		["ID"] = 13;
		["connectionsID"] = {
			[1] = 53;
			[2] = 57;
			[3] = 84;
			[4] = 87;
			[5] = 88;
			[6] = 61;
		};
		["h"] = 160;
		["posX"] = -1590;
		["posY"] = 300;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00041"] = {
		["ID"] = 41;
		["connectionsID"] = {
			[1] = 10;
			[2] = 22;
		};
		["posX"] = -4080;
		["posY"] = 120;
		["type"] = "switch";
	};
	["switch_00054"] = {
		["ID"] = 54;
		["connectionsID"] = {
			[1] = 55;
			[2] = 56;
		};
		["posX"] = -3660;
		["posY"] = 270;
		["type"] = "switch";
	};
	["switch_00094"] = {
		["ID"] = 94;
		["connectionsID"] = {
			[1] = 91;
			[2] = 89;
		};
		["posX"] = -1020;
		["posY"] = 990;
		["type"] = "switch";
	};
	["switch_00099"] = {
		["ID"] = 99;
		["connectionsID"] = {
			[1] = 100;
			[2] = 86;
		};
		["posX"] = -1020;
		["posY"] = 270;
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
