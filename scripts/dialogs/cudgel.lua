-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 6;
		["posX"] = 30;
		["posY"] = -630;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["posX"] = 30;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = -360;
		["posY"] = -660;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["connectID"] = 16;
		["posX"] = 1680;
		["posY"] = -1200;
		["script"] = "";
		["text"] = "Did you happen to come across a crazy old abori with grass on his hat on the way here?";
		["time"] = 8;
		["topic"] = "herbalist_tools:cudgel_about_herbalist";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["connectID"] = 13;
		["posX"] = 690;
		["posY"] = 510;
		["script"] = "";
		["text"] = "Hey...";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 1;
		["posX"] = 1140;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Bye";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 1;
		["connectID"] = 207;
		["posX"] = 2100;
		["posY"] = -1350;
		["script"] = "";
		["text"] = "Yeah I saw him. He seemed a little strange to me.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 1;
		["animation"] = "dl_head_scratch";
		["connectID"] = 207;
		["posX"] = 2100;
		["posY"] = -1200;
		["script"] = "";
		["text"] = "I might have seen him but didn't notice a hat. Not sure about his age either - I can't distinguish aborigine faces. Why do you ask?";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 1;
		["animation"] = "dl_head_shake";
		["connectID"] = 20;
		["posX"] = 2100;
		["posY"] = -1080;
		["script"] = "";
		["text"] = "No, I didn't see anyone.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["posX"] = 2460;
		["posY"] = -1080;
		["script"] = "";
		["text"] = "Be careful. He's a dangerous fellow and there's a reward for any information about him.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["connectID"] = 138;
		["posX"] = 2730;
		["posY"] = -1260;
		["script"] = "";
		["text"] = "So where have you seen him? Any information about him is important to us.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 2;
		["connectID"] = 23;
		["posX"] = 3540;
		["posY"] = -1260;
		["script"] = "";
		["text"] = "Hmm... that sounds like him. We will verify your report, huma. Did he give you anything?";
		["time"] = 9.5;
		["topic"] = "herbalist_tools:cudgel_about_message";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 142;
		["posX"] = 3960;
		["posY"] = -1350;
		["script"] = "";
		["text"] = "\\[Give Herbalist's Message]Yes, he gave me this note.";
		["time"] = 5;
		["topic"] = "herbalist_tools:cudgel_give_message";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 1;
		["animation"] = "dl_head_shake";
		["connectID"] = 199;
		["posX"] = 3960;
		["posY"] = -1200;
		["script"] = "";
		["text"] = "No, he didn’t give me anything.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 2;
		["connectID"] = 28;
		["posX"] = 690;
		["posY"] = -720;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["connectID"] = 29;
		["posX"] = 990;
		["posY"] = -720;
		["script"] = "";
		["text"] = "You must pay a fine for your transgressions!";
		["time"] = 3.5;
		["topic"] = "ragpicker_heist:cudgel_fine";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 1;
		["connectID"] = 38;
		["posX"] = 1440;
		["posY"] = -930;
		["script"] = "";
		["text"] = "\\[Pay 200 Antigravium Shards] I want to pay a fine for trespassing.";
		["time"] = 7;
		["topic"] = "ragpicker_heist:cudgel_fine_trespassing_pay";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 1;
		["connectID"] = 38;
		["posX"] = 1440;
		["posY"] = -780;
		["script"] = "";
		["text"] = "\\[Pay 500 Antigravium Shards] I want to pay the fine for theft.";
		["time"] = 5;
		["topic"] = "ragpicker_heist:cudgel_fine_stealing_pay";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 1;
		["connectID"] = 38;
		["posX"] = 1440;
		["posY"] = -630;
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
		["text"] = "[HIDDEN]\\[Pay 300 Antigravium Shards + full items price] I want to pay the fine for theft and for the items that I stole.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 1;
		["animation"] = "dl_head_shake";
		["connectID"] = 197;
		["posX"] = 1440;
		["posY"] = -480;
		["script"] = "";
		["text"] = "Not today.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["posX"] = 2130;
		["posY"] = -840;
		["script"] = "";
		["text"] = "Yes, you can go.";
		["time"] = 2;
		["topic"] = "ragpicker_heist:cudgel_fine_all_payed";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 2;
		["connectID"] = 29;
		["posX"] = 2130;
		["posY"] = -690;
		["script"] = "";
		["text"] = "Not so fast, huma, you still have fines to pay!";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 1;
		["connectID"] = 35;
		["posX"] = 1740;
		["posY"] = -780;
		["script"] = "";
		["text"] = "Was that all?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00137"] = {
		["ID"] = 137;
		["actor"] = 1;
		["connectID"] = 22;
		["posX"] = 3270;
		["posY"] = -1260;
		["script"] = "";
		["text"] = "He collected all kinds of grass and roots there.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00138"] = {
		["ID"] = 138;
		["actor"] = 1;
		["animation"] = "dl_point_back";
		["connectID"] = 137;
		["posX"] = 3000;
		["posY"] = -1260;
		["script"] = "";
		["text"] = "He is in the area, not far from this camp actually.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00141"] = {
		["ID"] = 141;
		["actor"] = 1;
		["animation"] = "dl_head_nod";
		["connectID"] = 10;
		["posX"] = 1410;
		["posY"] = -1200;
		["script"] = "";
		["text"] = "That's right, why?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00142"] = {
		["ID"] = 142;
		["actor"] = 2;
		["connectID"] = 144;
		["posX"] = 4230;
		["posY"] = -1350;
		["script"] = "";
		["text"] = "Excellent! On behalf of the camp guards and our leader Big Hat personally, we express our gratitude for your assistance! We'll definitely remember this.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00143"] = {
		["ID"] = 143;
		["actor"] = 2;
		["posX"] = 5040;
		["posY"] = -1350;
		["script"] = "";
		["text"] = "Now make yourself scarce before we start getting seriously interested in why you communicate with dangerous dissidents and assist them with their secret correspondence.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00144"] = {
		["ID"] = 144;
		["actor"] = 1;
		["animation"] = "dl_hand_chopfast";
		["connectID"] = 198;
		["posX"] = 4500;
		["posY"] = -1350;
		["script"] = "";
		["text"] = "That's it? You promised a reward for valuable information!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00164"] = {
		["ID"] = 164;
		["actor"] = 2;
		["connectID"] = 173;
		["posX"] = 2160;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Ahm, and if he asks what do we need, could you ask him to send some leftovers to the gate guards, please!";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00165"] = {
		["ID"] = 165;
		["actor"] = 2;
		["connectID"] = 164;
		["posX"] = 1920;
		["posY"] = 480;
		["script"] = "function message:onStart()\
   setGlobalParam(\"asked_about_bighat\", true)\
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
		["text"] = "Big Hat, our Elder lives in his cave in that big rock, there, on the far side of the camp. Show the old one some respect! If it weren't for him, we all would be living like beasts, always at each other's throats.";
		["time"] = 22.5;
		["type"] = "message";
	};
	["message_00166"] = {
		["ID"] = 166;
		["actor"] = 2;
		["connectID"] = 169;
		["posX"] = 1920;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Look around: what do you see? Desperation... It's a graveyard full of walking dead, who think they're still alive. If I were you, I would steal, lie and kill, just to not end up in a place like this.";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00167"] = {
		["ID"] = 167;
		["actor"] = 2;
		["connectID"] = 170;
		["posX"] = 1920;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Maybe cause I've cut open a bunch of huma-lovers back there in my village? Or maybe my entire tribe died out from a weird disease you damn humans brought upon us?!";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00168"] = {
		["ID"] = 168;
		["actor"] = 2;
		["connectID"] = 173;
		["posX"] = 1920;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Doing? We live here, huma. This is our place, the best outcasts like us can afford. Still better than taking the chance every day out there in the wilderness.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00169"] = {
		["ID"] = 169;
		["actor"] = 2;
		["connectID"] = 173;
		["posX"] = 2160;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Get a gun, huma, and take what you want by force. If only I was wiser when I was younger...";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00170"] = {
		["ID"] = 170;
		["actor"] = 2;
		["connectID"] = 173;
		["posX"] = 2160;
		["posY"] = 360;
		["script"] = "";
		["text"] = "It's none of your business, huma.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00172"] = {
		["ID"] = 172;
		["actor"] = 1;
		["connectID"] = 165;
		["posX"] = 1680;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Who's in charge here?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00173"] = {
		["ID"] = 173;
		["actor"] = 2;
		["connectID"] = 171;
		["posX"] = 2610;
		["posY"] = 450;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00174"] = {
		["ID"] = 174;
		["actor"] = 1;
		["connectID"] = 167;
		["posX"] = 1680;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Why were you cast out?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00175"] = {
		["ID"] = 175;
		["actor"] = 1;
		["connectID"] = 168;
		["posX"] = 1680;
		["posY"] = 240;
		["script"] = "";
		["text"] = "What are you doing here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00177"] = {
		["ID"] = 177;
		["actor"] = 1;
		["connectID"] = 166;
		["posX"] = 1680;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Do you have any tips?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00178"] = {
		["ID"] = 178;
		["actor"] = 1;
		["posX"] = 1680;
		["posY"] = 720;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00179"] = {
		["ID"] = 179;
		["actor"] = 2;
		["connectID"] = 141;
		["posX"] = 1110;
		["posY"] = -1200;
		["script"] = "";
		["text"] = "Hey huma, you're not from around here, are you? A newcomer to our camp?";
		["time"] = 6;
		["topic"] = "herbalist_tools:cudgel_about_herbalist";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00182"] = {
		["ID"] = 182;
		["actor"] = 1;
		["connectID"] = 171;
		["posX"] = 1140;
		["posY"] = 420;
		["script"] = "";
		["text"] = "I have a couple of questions.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00197"] = {
		["ID"] = 197;
		["actor"] = 2;
		["posX"] = 1710;
		["posY"] = -480;
		["script"] = "";
		["text"] = "Don't drag it out, huma, otherwise you and I will have a different kind of talk.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00198"] = {
		["ID"] = 198;
		["actor"] = 2;
		["connectID"] = 143;
		["posX"] = 4770;
		["posY"] = -1350;
		["script"] = "";
		["text"] = "We expressed our gratitude! Special gratitude! On behalf of Big Hat himself! What other reward do you need?";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00199"] = {
		["ID"] = 199;
		["actor"] = 2;
		["connectID"] = 208;
		["posX"] = 4230;
		["posY"] = -1200;
		["script"] = "";
		["text"] = "If this troublemaker asks you to bring something to the camp, a message, or a parcel, then be sure to tell the guards. Otherwise, it may all end badly for you.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00200"] = {
		["ID"] = 200;
		["actor"] = 2;
		["connectID"] = 179;
		["posX"] = 720;
		["posY"] = -1200;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00202"] = {
		["ID"] = 202;
		["actor"] = 1;
		["animation"] = "dl_hand_chopfast";
		["connectID"] = 205;
		["posX"] = 1680;
		["posY"] = -60;
		["script"] = "";
		["text"] = "That's it? You promised a reward for valuable information!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00203"] = {
		["ID"] = 203;
		["actor"] = 2;
		["connectID"] = 202;
		["posX"] = 1410;
		["posY"] = -60;
		["script"] = "";
		["text"] = "Excellent! On behalf of the camp guards and our leader Big Hat personally, we express our gratitude for your assistance! We'll definitely remember this.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00204"] = {
		["ID"] = 204;
		["actor"] = 2;
		["connectID"] = 13;
		["posX"] = 2220;
		["posY"] = -60;
		["script"] = "";
		["text"] = "Now make yourself scarce before we start getting seriously interested in why you communicate with dangerous dissidents and assist them with their secret correspondence.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00205"] = {
		["ID"] = 205;
		["actor"] = 2;
		["connectID"] = 204;
		["posX"] = 1950;
		["posY"] = -60;
		["script"] = "";
		["text"] = "We expressed our gratitude! Special gratitude! On behalf of Big Hat himself! What other reward do you need?";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00206"] = {
		["ID"] = 206;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 203;
		["posX"] = 1140;
		["posY"] = -60;
		["script"] = "";
		["text"] = "\\[Give Herbalist's Message]So I saw that old abori and he asked me to give this note to someone.";
		["time"] = 10;
		["topic"] = "herbalist_tools:cudgel_give_message";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00207"] = {
		["ID"] = 207;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 2460;
		["posY"] = -1260;
		["script"] = "";
		["text"] = "Be careful. He's a dangerous fellow and there's a reward for any information about him.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00208"] = {
		["ID"] = 208;
		["actor"] = 1;
		["animation"] = "dl_head_nod";
		["posX"] = 4500;
		["posY"] = -1200;
		["script"] = "";
		["text"] = "I'll keep it in mind.";
		["time"] = 4;
		["type"] = "message";
	};
	["switch_00004"] = {
		["ID"] = 4;
		["connectionsID"] = {
			[1] = 5;
			[2] = 3;
		};
		["posX"] = -120;
		["posY"] = -660;
		["type"] = "switch";
	};
	["switch_00006"] = {
		["ID"] = 6;
		["connectionsID"] = {
			[1] = 200;
			[2] = 27;
			[3] = 12;
		};
		["posX"] = 360;
		["posY"] = -660;
		["type"] = "switch";
	};
	["switch_00013"] = {
		["ID"] = 13;
		["connectionsID"] = {
			[1] = 206;
			[2] = 182;
			[3] = 15;
		};
		["posX"] = 990;
		["posY"] = 510;
		["type"] = "switch";
	};
	["switch_00016"] = {
		["ID"] = 16;
		["connectionsID"] = {
			[1] = 17;
			[2] = 18;
			[3] = 19;
		};
		["posX"] = 1950;
		["posY"] = -1200;
		["type"] = "switch";
	};
	["switch_00023"] = {
		["ID"] = 23;
		["connectionsID"] = {
			[1] = 24;
			[2] = 25;
		};
		["posX"] = 3810;
		["posY"] = -1260;
		["type"] = "switch";
	};
	["switch_00029"] = {
		["ID"] = 29;
		["connectionsID"] = {
			[1] = 30;
			[2] = 31;
			[3] = 32;
			[4] = 33;
		};
		["h"] = 120;
		["posX"] = 1290;
		["posY"] = -720;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00035"] = {
		["ID"] = 35;
		["connectionsID"] = {
			[1] = 34;
			[2] = 37;
		};
		["posX"] = 1980;
		["posY"] = -780;
		["type"] = "switch";
	};
	["switch_00171"] = {
		["ID"] = 171;
		["connectionsID"] = {
			[1] = 175;
			[2] = 174;
			[3] = 172;
			[4] = 177;
			[5] = 178;
		};
		["h"] = 140;
		["posX"] = 1410;
		["posY"] = 450;
		["type"] = "switch";
		["w"] = 100;
	};
}
local obj2 = {
	["actor_prefab"] = {
		[1] = "human_male";
	};
}
return obj1 ,obj2
