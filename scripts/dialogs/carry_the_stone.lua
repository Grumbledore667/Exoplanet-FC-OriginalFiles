-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 6;
		["posX"] = -2370;
		["posY"] = -330;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 2;
		["posX"] = -1590;
		["posY"] = -1230;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 1;
		["connectID"] = 105;
		["posX"] = -1830;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 1;
		["connectID"] = 116;
		["posX"] = -1170;
		["posY"] = -1440;
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
		["text"] = "start quest";
		["time"] = 2;
		["topic"] = "scan_it:start";
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 1;
		["posX"] = -1170;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = -360;
		["posY"] = -1680;
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
		["text"] = "I found item 1";
		["time"] = 3;
		["topic"] = "scan_it:item1";
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = -360;
		["posY"] = -1560;
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
		["text"] = "I found item 2";
		["time"] = 3;
		["topic"] = "scan_it:item2";
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 1;
		["posX"] = -1170;
		["posY"] = -1140;
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
		["text"] = "finish quest";
		["time"] = 2;
		["topic"] = "scan_it:finish";
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 1;
		["connectID"] = 16;
		["posX"] = -1170;
		["posY"] = -1290;
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
		["text"] = "about scan_it";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 1;
		["connectID"] = 2;
		["posX"] = -360;
		["posY"] = -1080;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 16;
		["posX"] = 300;
		["posY"] = -1380;
		["script"] = "";
		["text"] = "good";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = -360;
		["posY"] = -1440;
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
		["text"] = "I found item 3\
";
		["time"] = 3;
		["topic"] = "scan_it:item3";
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = -360;
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
		["text"] = "I found item 4";
		["time"] = 3;
		["topic"] = "scan_it:item4";
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = -360;
		["posY"] = -1200;
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
		["text"] = "I found item 5";
		["time"] = 3;
		["topic"] = "scan_it:item5";
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 2;
		["animation"] = "dl_raisedfinger_right";
		["connectID"] = 131;
		["posX"] = -1440;
		["posY"] = 990;
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
		["text"] = "Hey there, huma, do Carry the Stone's eyes betray him despite not taking a single sip of boozlo today or... is that an original AvalonTech T280-S on your wrist?";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 1;
		["connectID"] = 115;
		["posX"] = 270;
		["posY"] = -870;
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
		["text"] = "How I and my old scanner can help you?";
		["time"] = 5.5;
		["topic"] = "scan_it:start";
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 1;
		["connectID"] = 170;
		["posX"] = 210;
		["posY"] = 4350;
		["script"] = "";
		["text"] = "I want to ask something...";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["connectID"] = 149;
		["posX"] = 210;
		["posY"] = 4710;
		["script"] = "";
		["text"] = "I've got to go.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 1;
		["connectID"] = 107;
		["posX"] = 1080;
		["posY"] = 3930;
		["script"] = "";
		["text"] = "You look different from the rest of the aborigines in this camp. Do you live here as well?";
		["time"] = 10.5;
		["topic"] = "scan_it:about_lemfather_1";
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 1;
		["connectID"] = 108;
		["posX"] = 1080;
		["posY"] = 4230;
		["script"] = "";
		["text"] = "Carry the Stone... That's some strange name. Can't guess the meaning...";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["connectID"] = 29;
		["posX"] = 3870;
		["posY"] = 4260;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 1;
		["connectID"] = 79;
		["posX"] = 1080;
		["posY"] = 4830;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 2;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 151;
		["posX"] = 6150;
		["posY"] = -870;
		["script"] = "";
		["text"] = "Here you go, huma: the best Carry could do with his limited resources here. You are lucky to have a T280-S! Just look how compact and lightweight it is. My boss gave me this huge backpack instead of a wrist-worn gear of yours!";
		["time"] = 22.5;
		["topic"] = "scan_it:recieve_detector";
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 1;
		["connectID"] = 37;
		["posX"] = 270;
		["posY"] = 450;
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
		["text"] = "About those samples from anomalies you wanted...";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 1;
		["connectID"] = 92;
		["posX"] = 1230;
		["posY"] = 360;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scan_it\", \"give_item5\")\
end\
\
";
		["text"] = "Found this halved absinthe bottle. Is not finishing your booze an anomaly on K'tharsis?";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 1;
		["connectID"] = 71;
		["posX"] = 1230;
		["posY"] = 960;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scan_it\", \"give_item3\")\
end\
\
";
		["text"] = "I found this thing that could get you a twenty years vacation in prison.\
";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00040"] = {
		["ID"] = 40;
		["actor"] = 1;
		["connectID"] = 93;
		["posX"] = 1230;
		["posY"] = 210;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scan_it\", \"give_item4\")\
end\
\
";
		["text"] = "Found this purple melon...";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 1;
		["connectID"] = 44;
		["posX"] = 1230;
		["posY"] = -90;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scan_it\", \"give_item1\")\
end\
\
";
		["text"] = "I found this metal box in one of the anomalies.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 1;
		["connectID"] = 70;
		["posX"] = 1230;
		["posY"] = 60;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scan_it\", \"give_item2\")\
end\
\
";
		["text"] = "I found this strange knife cut in half. What could possibly do that kind of damage?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 1;
		["connectID"] = 79;
		["posX"] = 1230;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "I haven't found anything yet...";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 2;
		["colors"] = {
			[4] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
			[6] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
		};
		["connectID"] = 95;
		["posX"] = 1470;
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
		["text"] = "Good! Give it to Carry the Stone then.";
		["time"] = 5;
		["topic"] = "scan_it:give_item1";
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 1;
		["connectID"] = 59;
		["posX"] = 1620;
		["posY"] = -510;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scan_it\", \"give_sandwich\")\
end\
\
";
		["text"] = "There was this sandwich inside.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 1;
		["connectID"] = 68;
		["posX"] = 1620;
		["posY"] = -270;
		["script"] = "";
		["text"] = "\\[Lie] It was empty when I found it.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 1860;
		["posY"] = -510;
		["script"] = "";
		["text"] = "Nice, give it to Carry the Stone! It must be consu... Carry means, conserved at once! Dry air is bad for those samples you know!";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 1;
		["colors"] = {
			[4] = {
				[1] = 234;
				[2] = 234;
				[3] = 0;
				[4] = 255;
			};
			[6] = {
				[1] = 234;
				[2] = 234;
				[3] = 0;
				[4] = 255;
			};
		};
		["connectID"] = 120;
		["posX"] = 2250;
		["posY"] = -630;
		["script"] = "";
		["text"] = "\\[Eat it right in front of him.]";
		["time"] = 4.5;
		["topic"] = "scan_it:force_bad_ending";
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 1;
		["connectID"] = 64;
		["posX"] = 2250;
		["posY"] = -510;
		["script"] = "";
		["text"] = "\\[Threaten to eat it.]";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 1;
		["colors"] = {
			[4] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
			[6] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
		};
		["connectID"] = 95;
		["posX"] = 2250;
		["posY"] = -390;
		["script"] = "";
		["text"] = "Okay, here, you can have it.";
		["time"] = 4;
		["topic"] = "scan_it:give_sandwich";
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 2;
		["animation"] = "dl_raisedfinger_left";
		["connectID"] = 60;
		["posX"] = 2490;
		["posY"] = -510;
		["script"] = "";
		["text"] = "Hey! It's dangerous to eat samples! Who knows how those exotic particles will affect your body in the future? Give the sample to Carry the Stone at once, so he can stop the contamination!";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00065"] = {
		["ID"] = 65;
		["actor"] = 2;
		["animation"] = "dl_hands_strike";
		["connectID"] = 67;
		["posX"] = 2730;
		["posY"] = -630;
		["script"] = "";
		["text"] = "Stupid huma, why'd you do this? It was an important scientific material! No greenies for you!\
";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
		["actor"] = 2;
		["animation"] = "dl_head_nod";
		["colors"] = {
			[4] = {
				[1] = 227;
				[2] = 233;
				[3] = 1;
				[4] = 255;
			};
			[6] = {
				[1] = 227;
				[2] = 233;
				[3] = 1;
				[4] = 255;
			};
		};
		["connectID"] = 95;
		["posX"] = 3000;
		["posY"] = -270;
		["script"] = "";
		["text"] = "Shit. Carry the Stone will remember that.";
		["time"] = 4.5;
		["topic"] = "scan_it:sandwich_gone";
		["type"] = "message";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 2;
		["animation"] = "dl_count_to_one";
		["colors"] = {
			[4] = {
				[1] = 227;
				[2] = 233;
				[3] = 1;
				[4] = 255;
			};
			[6] = {
				[1] = 227;
				[2] = 233;
				[3] = 1;
				[4] = 255;
			};
		};
		["connectID"] = 67;
		["posX"] = 1860;
		["posY"] = -270;
		["script"] = "";
		["text"] = "Really? Why would an empty box hide itself in anomaly? There should be some important stuff in there! You took it for yourself, greedy huma! No greenies for you!";
		["time"] = 15.5;
		["topic"] = "scan_it:force_bad_ending";
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 1;
		["connectID"] = 56;
		["posX"] = 1230;
		["posY"] = -390;
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
		["text"] = "I found this empty box.";
		["time"] = 3.5;
		["topic"] = "scan_it:give_item1_empty";
		["type"] = "message";
	};
	["message_00070"] = {
		["ID"] = 70;
		["actor"] = 2;
		["colors"] = {
			[4] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
			[6] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
		};
		["connectID"] = 95;
		["posX"] = 1470;
		["posY"] = 60;
		["script"] = "";
		["text"] = "Well, those anomalies tend to cut all sort of items placed on the borders when they appear. Don't worry, there shouldn't be any new ones popping here for a while, otherwise Carry wouldn't send you to look for the samples.";
		["time"] = 21;
		["topic"] = "scan_it:give_item2";
		["type"] = "message";
	};
	["message_00071"] = {
		["ID"] = 71;
		["actor"] = 2;
		["animation"] = "dl_shrug_long";
		["connectID"] = 73;
		["posX"] = 1470;
		["posY"] = 960;
		["script"] = "";
		["text"] = "Well, that's how it works in those Core Worlds, you know. Here on K'tharsis we use any technology we want. Hand it over to your friend Carry and forget about it.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00072"] = {
		["ID"] = 72;
		["actor"] = 1;
		["connectID"] = 76;
		["posX"] = 1860;
		["posY"] = 870;
		["script"] = "";
		["text"] = "Does your boss even know about this? Or is he always involved into dealing with \"dark technologies\"?";
		["time"] = 9.5;
		["topic"] = "broken_scanner:about_lemfather_1";
		["type"] = "message";
	};
	["message_00074"] = {
		["ID"] = 74;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["colors"] = {
			[4] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
			[6] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
		};
		["connectID"] = 75;
		["posX"] = 1860;
		["posY"] = 1320;
		["script"] = "";
		["text"] = "Here, take it.";
		["time"] = 2.5;
		["topic"] = "scan_it:give_item3";
		["type"] = "message";
	};
	["message_00075"] = {
		["ID"] = 75;
		["actor"] = 2;
		["connectID"] = 95;
		["posX"] = 2100;
		["posY"] = 1320;
		["script"] = "";
		["text"] = "Good huma, enjoy your greenies. Let's forget we had this conversation here, huma. What happens in outcast camp, stays in outcast camp.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00076"] = {
		["ID"] = 76;
		["actor"] = 2;
		["animation"] = "dl_hands_washing";
		["connectID"] = 77;
		["posX"] = 2100;
		["posY"] = 870;
		["script"] = "";
		["text"] = "Well... If you're not gonna tell anyone, then who cares? Listen, huma, let's just keep it between the two of us. Carry the Stone will make it worth, just tell him what do you want in exchange for the damn thing already!";
		["time"] = 21;
		["type"] = "message";
	};
	["message_00077"] = {
		["ID"] = 77;
		["actor"] = 1;
		["connectID"] = 78;
		["posX"] = 2340;
		["posY"] = 870;
		["script"] = "";
		["text"] = "Let me see... Maybe there is a way I can keep quiet about it.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00079"] = {
		["ID"] = 79;
		["actor"] = 2;
		["connectID"] = 25;
		["posX"] = 4860;
		["posY"] = 2460;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00080"] = {
		["ID"] = 80;
		["actor"] = 1;
		["connectID"] = 85;
		["posX"] = 2760;
		["posY"] = 600;
		["script"] = "";
		["text"] = "You've got to tell me everything about these neocortex modules. What are you gonna use it for?";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00081"] = {
		["ID"] = 81;
		["actor"] = 1;
		["colors"] = {
			[4] = {
				[1] = 227;
				[2] = 233;
				[3] = 1;
				[4] = 255;
			};
			[6] = {
				[1] = 227;
				[2] = 233;
				[3] = 1;
				[4] = 255;
			};
		};
		["connectID"] = 112;
		["posX"] = 2760;
		["posY"] = 750;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scan_it\", \"threat_dance\")\
end\
\
";
		["text"] = "I'm bored. If you want this thing, then show me some fancy tribal dance first.";
		["time"] = 8.5;
		["topic"] = "scan_it:force_bad_ending";
		["type"] = "message";
	};
	["message_00082"] = {
		["ID"] = 82;
		["actor"] = 1;
		["colors"] = {
			[4] = {
				[1] = 227;
				[2] = 233;
				[3] = 1;
				[4] = 255;
			};
			[6] = {
				[1] = 227;
				[2] = 233;
				[3] = 1;
				[4] = 255;
			};
		};
		["connectID"] = 113;
		["posX"] = 2760;
		["posY"] = 900;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scan_it\", \"threat_money\")\
end\
\
";
		["text"] = "Something tells me your boss won't be happy if he gets a word about your shady deals here. I need more cash for my silence.";
		["time"] = 14;
		["topic"] = "scan_it:force_bad_ending";
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 1;
		["animation"] = "dl_hand_negative";
		["colors"] = {
			[4] = {
				[1] = 255;
				[2] = 128;
				[3] = 128;
				[4] = 255;
			};
			[6] = {
				[1] = 255;
				[2] = 128;
				[3] = 128;
				[4] = 255;
			};
		};
		["connectID"] = 89;
		["posX"] = 2760;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "I think I'm gonna keep it for myself after all.";
		["time"] = 6;
		["topic"] = "scan_it:force_worst_ending";
		["type"] = "message";
	};
	["message_00084"] = {
		["ID"] = 84;
		["actor"] = 1;
		["colors"] = {
			[4] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
			[6] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
		};
		["connectID"] = 91;
		["posX"] = 2760;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Fine, you can have it.";
		["time"] = 3.5;
		["topic"] = "scan_it:give_item3";
		["type"] = "message";
	};
	["message_00085"] = {
		["ID"] = 85;
		["actor"] = 2;
		["connectID"] = 230;
		["posX"] = 3000;
		["posY"] = 600;
		["script"] = "";
		["text"] = "It's not me, it's Professor Lemfather himself. And if Carry were you, huma, he would not stick his long nose in any of Lemfather's affairs. When Professor sends Carry to find this stuff - Carry obeys.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00086"] = {
		["ID"] = 86;
		["actor"] = 2;
		["connectID"] = 78;
		["posX"] = 4620;
		["posY"] = 750;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00087"] = {
		["ID"] = 87;
		["actor"] = 2;
		["animation"] = "dl_head_wipe";
		["connectID"] = 224;
		["posX"] = 3480;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Alright, alright, Carry will show you... a Seeking Hornhog. It's... a mating call dance... Carry doesn't know any others. Don't get too aroused by it, you, ugly huma!";
		["time"] = 15;
		["topic"] = "scan_it:threat_dance";
		["type"] = "message";
	};
	["message_00088"] = {
		["ID"] = 88;
		["actor"] = 2;
		["animation"] = "dl_head_2nods";
		["connectID"] = 86;
		["posX"] = 3480;
		["posY"] = 900;
		["script"] = "";
		["text"] = "Yes, Carry will remember this for sure! Take your greenies, jabo'nga. Now Carry's gonna eat raw bitebugs and drink from the dirty pools on his way back to the lab because of you, greedy huma!";
		["time"] = 18.5;
		["topic"] = "scan_it:threat_money";
		["type"] = "message";
	};
	["message_00089"] = {
		["ID"] = 89;
		["actor"] = 2;
		["animation"] = "dl_clench_fist";
		["connectID"] = 95;
		["posX"] = 3000;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "That's a serious fucking mistake.";
		["time"] = 3.5;
		["topic"] = "scan_it:take_cortex";
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 2;
		["animation"] = "dl_head_wipe";
		["connectID"] = 95;
		["posX"] = 3000;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Whew... Let's forget we had this conversation here, huma. What happens in outcast camp, stays in outcast camp.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00092"] = {
		["ID"] = 92;
		["actor"] = 2;
		["animation"] = "dl_count_to_one";
		["colors"] = {
			[4] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
			[6] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
		};
		["connectID"] = 240;
		["posX"] = 1470;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Well, we're gonna fix it right away! Here's to your health, huma!";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00093"] = {
		["ID"] = 93;
		["actor"] = 2;
		["colors"] = {
			[4] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
			[6] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
		};
		["connectID"] = 95;
		["posX"] = 1470;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Baha'jah, it's rotten already. Carry's gonna throw it away. Still, you get your reward, huma - Carry always keeps his word.";
		["time"] = 11.5;
		["topic"] = "scan_it:give_item4";
		["type"] = "message";
	};
	["message_00098"] = {
		["ID"] = 98;
		["actor"] = 2;
		["animation"] = "dl_shrug_long";
		["colors"] = {
			[4] = {
				[1] = 227;
				[2] = 233;
				[3] = 1;
				[4] = 255;
			};
			[6] = {
				[1] = 227;
				[2] = 233;
				[3] = 1;
				[4] = 255;
			};
		};
		["connectID"] = 101;
		["posX"] = 5430;
		["posY"] = 600;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible() and getQuestTopicVisible(\"scan_it\", \"finish\")\
end\
\
";
		["text"] = "Well, you're one hell of a son of a bitch huma, but you haven't failed me.";
		["time"] = 9;
		["topic"] = "scan_it:finish_bad";
		["type"] = "message";
	};
	["message_00100"] = {
		["ID"] = 100;
		["actor"] = 2;
		["animation"] = "dl_head_nod";
		["colors"] = {
			[4] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
			[6] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
		};
		["connectID"] = 101;
		["posX"] = 5430;
		["posY"] = 750;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scan_it\", \"finish\")\
end\
\
";
		["text"] = "Pleasure dealing business with you, huma. You'll get far on K'Tharsis with this attitude.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00101"] = {
		["ID"] = 101;
		["actor"] = 2;
		["animation"] = "dl_hand_showforward";
		["colors"] = {
			[4] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
			[6] = {
				[1] = 130;
				[2] = 219;
				[3] = 136;
				[4] = 255;
			};
		};
		["connectID"] = 163;
		["posX"] = 5700;
		["posY"] = 660;
		["script"] = "";
		["text"] = "Anyways, the job is done. Here's the reward. You should be happy, huma, few in this cursed camp can get more greenies for digging in anomalies.";
		["time"] = 14;
		["topic"] = "scan_it:finish";
		["type"] = "message";
	};
	["message_00104"] = {
		["ID"] = 104;
		["actor"] = 2;
		["connectID"] = 37;
		["posX"] = 5430;
		["posY"] = 900;
		["script"] = "";
		["text"] = "return";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00106"] = {
		["ID"] = 106;
		["actor"] = 2;
		["connectID"] = 25;
		["posX"] = -1440;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "Carry the Stone is listening, huma.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00107"] = {
		["ID"] = 107;
		["actor"] = 2;
		["connectID"] = 218;
		["posX"] = 1320;
		["posY"] = 3930;
		["script"] = "";
		["text"] = "Listen, huma, you have insulted Carry! The sorry creatures here are exiles: misfits, outlaws, drug addicts and all sorts of bastards. Lazy and foul folk. Carry the Stone has not lost his name though! He is a hard worker! The real quargo, who can take care of himself. Show some respect!";
		["time"] = 26.5;
		["type"] = "message";
	};
	["message_00108"] = {
		["ID"] = 108;
		["actor"] = 2;
		["connectID"] = 32;
		["posX"] = 1320;
		["posY"] = 4230;
		["script"] = "";
		["text"] = "That's a long story. A sad one as well. Maybe... Carry the Stone will tell it some day, when he knows you better, huma.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00112"] = {
		["ID"] = 112;
		["actor"] = 2;
		["animation"] = "dl_hand_chopfast";
		["connectID"] = 146;
		["posX"] = 3000;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Are you hecking joking, huma? People die for these kind of jokes here, ya know?";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00113"] = {
		["ID"] = 113;
		["actor"] = 2;
		["animation"] = "dl_head_scratch";
		["connectID"] = 148;
		["posX"] = 3000;
		["posY"] = 900;
		["script"] = "";
		["text"] = "Damn, you know how to use leverage... Fine, Carry can give you two hundred shinies. That's all he has on him right now.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00114"] = {
		["ID"] = 114;
		["actor"] = 2;
		["connectID"] = 2;
		["posX"] = -690;
		["posY"] = -1440;
		["script"] = "";
		["text"] = "Have this";
		["time"] = 2;
		["topic"] = "scan_it:recieve_detector";
		["type"] = "message";
	};
	["message_00115"] = {
		["ID"] = 115;
		["actor"] = 2;
		["connectID"] = 134;
		["posX"] = 510;
		["posY"] = -870;
		["script"] = "";
		["text"] = "Well, it's as simple as eating a bitebug on a stick, huma: Carry the Stone will modify your good old T280-s and you will scan some anomalies around the Dead Lake for him.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00116"] = {
		["ID"] = 116;
		["actor"] = 2;
		["connectID"] = 114;
		["posX"] = -930;
		["posY"] = -1440;
		["script"] = "";
		["text"] = "Explains";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00119"] = {
		["ID"] = 119;
		["actor"] = 2;
		["animation"] = "dl_cut_throat";
		["colors"] = {
			[4] = {
				[1] = 255;
				[2] = 128;
				[3] = 128;
				[4] = 255;
			};
			[6] = {
				[1] = 255;
				[2] = 128;
				[3] = 128;
				[4] = 255;
			};
		};
		["connectID"] = 150;
		["posX"] = 5430;
		["posY"] = 450;
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
		["text"] = "Mind Carry the Stone's words, huma: with that attitude you won't last long on K'Tharsis. Show this cartridge to a wrong person, and you'll get your throat slit while taking next nap.";
		["time"] = 17;
		["topic"] = "scan_it:finish_worst";
		["type"] = "message";
	};
	["message_00120"] = {
		["ID"] = 120;
		["actor"] = 2;
		["animation"] = "dl_clench_fist";
		["connectID"] = 65;
		["posX"] = 2490;
		["posY"] = -630;
		["script"] = "";
		["text"] = "Hey! That's not funny at all!";
		["time"] = 4;
		["topic"] = "scan_it:ate_sandwich";
		["type"] = "message";
	};
	["message_00121"] = {
		["ID"] = 121;
		["actor"] = 2;
		["posX"] = 5910;
		["posY"] = 450;
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
		["text"] = "No, Carry does not care what is going to happen to you now. Get lost, stupid huma.";
		["time"] = 9.5;
		["topic"] = "scan_it:finish_worst_no_more_job";
		["type"] = "message";
	};
	["message_00122"] = {
		["ID"] = 122;
		["actor"] = 2;
		["connectID"] = 128;
		["posX"] = 1380;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "Hmm...";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00123"] = {
		["ID"] = 123;
		["actor"] = 1;
		["connectID"] = 129;
		["posX"] = 270;
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
		["text"] = "Can you help me fix my scanner?";
		["time"] = 4.5;
		["topic"] = "broken_scanner:can_fix";
		["type"] = "message";
	};
	["message_00124"] = {
		["ID"] = 124;
		["actor"] = 1;
		["connectID"] = 130;
		["posX"] = 1140;
		["posY"] = 1830;
		["script"] = "";
		["text"] = "I don't have any.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00125"] = {
		["ID"] = 125;
		["actor"] = 2;
		["connectID"] = 127;
		["posX"] = 750;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "Yes, with some electronic scrap it should be good as new.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00126"] = {
		["ID"] = 126;
		["actor"] = 1;
		["connectID"] = 122;
		["posX"] = 1140;
		["posY"] = 1680;
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
		["text"] = "\\[Give electronic scrap]";
		["time"] = 2.5;
		["topic"] = "broken_scanner:give_items";
		["type"] = "message";
	};
	["message_00128"] = {
		["ID"] = 128;
		["actor"] = 2;
		["connectID"] = 79;
		["posX"] = 1620;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "Here you go!";
		["time"] = 2.5;
		["topic"] = "broken_scanner:fixes_scanner";
		["type"] = "message";
	};
	["message_00129"] = {
		["ID"] = 129;
		["actor"] = 2;
		["connectID"] = 125;
		["posX"] = 510;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "Let me see...";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00130"] = {
		["ID"] = 130;
		["actor"] = 2;
		["connectID"] = 79;
		["posX"] = 1380;
		["posY"] = 1830;
		["script"] = "";
		["text"] = "Come back when you find some.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00131"] = {
		["ID"] = 131;
		["actor"] = 1;
		["animation"] = "dl_stop_twohand";
		["connectID"] = 132;
		["posX"] = -1200;
		["posY"] = 990;
		["script"] = "";
		["text"] = "Yeah-yeah, I know: an old-ass model with a touchscreen. I just don't tend to sell my organs for upgrading annually when they dish out a new toy with more bells and whistles.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00132"] = {
		["ID"] = 132;
		["actor"] = 2;
		["animation"] = "dl_hand_chopfast";
		["connectID"] = 225;
		["posX"] = -960;
		["posY"] = 990;
		["script"] = "";
		["text"] = "Exactly how Carry the Stone feels! Screw those disgusting organic BrainSync interfaces! This fancy wetware stuff is for Core Worlds' pussies!";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00133"] = {
		["ID"] = 133;
		["actor"] = 2;
		["connectID"] = 25;
		["posX"] = -480;
		["posY"] = 990;
		["script"] = "";
		["text"] = "Listen, Carry the Stone can offer you an opportunity to put your T280-S to good use. Let him know if you are interested in some greenies.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00134"] = {
		["ID"] = 134;
		["actor"] = 2;
		["connectID"] = 135;
		["posX"] = 750;
		["posY"] = -870;
		["script"] = "";
		["text"] = "Even a child can do that in no time! The goal is to record the data and gather the samples emitting exotic particles found only in those bubbles. Carry the Stone will pay for your efforts generously, of course.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00135"] = {
		["ID"] = 135;
		["actor"] = 1;
		["animation"] = "dl_count_to_one";
		["connectID"] = 136;
		["posX"] = 990;
		["posY"] = -870;
		["script"] = "";
		["text"] = "Fine, but I won't just let a random aborigine who pretends to be a gear junkie to tinker with my stuff. I need a solid motivation to risk it.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00136"] = {
		["ID"] = 136;
		["actor"] = 2;
		["animation"] = "dl_hand_negative";
		["connectID"] = 226;
		["posX"] = 1230;
		["posY"] = -870;
		["script"] = "";
		["text"] = "Carry the Stone is not a junkie at all! Maybe he likes to savour a bottle or two during the long working day, but his skills are even better when he is relaxed!";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00137"] = {
		["ID"] = 137;
		["actor"] = 1;
		["connectID"] = 138;
		["posX"] = 1710;
		["posY"] = -870;
		["script"] = "";
		["text"] = "To be honest those anomalies creep me out. Are they dangerous?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00138"] = {
		["ID"] = 138;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 139;
		["posX"] = 1950;
		["posY"] = -870;
		["script"] = "";
		["text"] = "No, the worst that can happen to you is a little sting of static electricity. Nothing a big strong huma like you can't handle!";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00139"] = {
		["ID"] = 139;
		["actor"] = 1;
		["connectID"] = 140;
		["posX"] = 2190;
		["posY"] = -870;
		["script"] = "";
		["text"] = "Then why can't you just do it yourself?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00140"] = {
		["ID"] = 140;
		["actor"] = 2;
		["animation"] = "dl_shrug_long";
		["connectID"] = 141;
		["posX"] = 2430;
		["posY"] = -870;
		["script"] = "";
		["text"] = "Unfortunately, poor Carry simply doesn't have a working scanner and recorder on him... anymore. Check those bullet holes on his backpack! Those Scalphunter bastards usually can't hit a thing, but sometimes even the brainscrewer addict can deal enough damage with a ngabang in his shaking hands...";
		["time"] = 24;
		["type"] = "message";
	};
	["message_00141"] = {
		["ID"] = 141;
		["actor"] = 1;
		["connectID"] = 142;
		["posX"] = 2670;
		["posY"] = -870;
		["script"] = "";
		["text"] = "Perfect! Will I get shot as well by some crazy fuckers while on this scientific trip around that lake? What else should I know about this \"simple\" task?";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00142"] = {
		["ID"] = 142;
		["actor"] = 2;
		["connectID"] = 227;
		["posX"] = 2910;
		["posY"] = -870;
		["script"] = "";
		["text"] = "The Scalphunters are a superstitious bunch, huma, they fear the anomalies like crystal moss fears water. Just watch for the bubbles and activate my module near them.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00143"] = {
		["ID"] = 143;
		["actor"] = 2;
		["connectID"] = 243;
		["posX"] = 3390;
		["posY"] = -870;
		["script"] = "";
		["text"] = "Then perform an active scan, as you usually do, to pinpoint the exact location of the sample - they can be really small, you know.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00144"] = {
		["ID"] = 144;
		["actor"] = 1;
		["animation"] = "dl_hand_facepalm";
		["connectID"] = 35;
		["posX"] = 5910;
		["posY"] = -870;
		["script"] = "";
		["text"] = "Normal anomaly... This entire planet is crazy! Fine, gimme your hunka junk module already. I hope it won't drain the batteries too fast.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00145"] = {
		["ID"] = 145;
		["actor"] = 2;
		["connectID"] = 144;
		["posX"] = 5670;
		["posY"] = -870;
		["script"] = "";
		["text"] = "Carry the Stone hopes you won't spend hours digging in that big transparent dome near the camp. He thinks you are smart enough to tell apart an E.D.E.N. generator from a normal anomaly bubble...";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00146"] = {
		["ID"] = 146;
		["actor"] = 1;
		["connectID"] = 87;
		["posX"] = 3240;
		["posY"] = 750;
		["script"] = "";
		["text"] = "You've sent me looking for this stuff, obviously knowing I can find something like these canned brains and still hold me for a dumbass outsider. In my book, this is worth a little humiliation, don't you think? If Carry the Stone wants to lay his dirty little hands on this dark-tech shit - he dances. Got it?";
		["time"] = 30;
		["type"] = "message";
	};
	["message_00147"] = {
		["ID"] = 147;
		["actor"] = 2;
		["animation"] = "idle_dance_2";
		["connectID"] = 223;
		["posX"] = 3960;
		["posY"] = 750;
		["script"] = "";
		["text"] = "...";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00148"] = {
		["ID"] = 148;
		["actor"] = 1;
		["connectID"] = 88;
		["posX"] = 3240;
		["posY"] = 900;
		["script"] = "";
		["text"] = "I would make it four hundred, but I'm not a savage like you guys on this planet. Remember my generosity!";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00149"] = {
		["ID"] = 149;
		["actor"] = 2;
		["posX"] = 450;
		["posY"] = 4710;
		["script"] = "";
		["text"] = "Well, you know where to find Carry the Stone.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00150"] = {
		["ID"] = 150;
		["actor"] = 1;
		["animation"] = "dl_hands_strike";
		["connectID"] = 121;
		["posX"] = 5670;
		["posY"] = 450;
		["script"] = "";
		["text"] = "Are you threatening me, aboriginal asshole?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00151"] = {
		["ID"] = 151;
		["actor"] = 2;
		["connectID"] = 25;
		["posX"] = 6390;
		["posY"] = -870;
		["script"] = "";
		["text"] = "You probably gonna need a shovel as well, huma. Carry thinks, you don't want to dig in anomalies with those soft pink hands of yours. Look around in this camp, here you can buy or... ahem... borrow some tools. These outcast fools don't look like they are fond of hard work anyways.";
		["time"] = 27;
		["topic"] = "scan_it:about_lemfather_1";
		["type"] = "message";
	};
	["message_00152"] = {
		["ID"] = 152;
		["actor"] = 1;
		["connectID"] = 154;
		["posX"] = 3480;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Some egghead from this shithole of a planet won't scare me that easily. Talk or say goodbye to these canned brains!";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00154"] = {
		["ID"] = 154;
		["actor"] = 2;
		["connectID"] = 155;
		["posX"] = 3720;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Now Carry the Stone thinks you are not as smart as you look, huma. Keep your part of the deal, otherwise Carry can only pray to the Huntress for your poor soul.";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00155"] = {
		["ID"] = 155;
		["actor"] = 2;
		["connectID"] = 86;
		["posX"] = 3960;
		["posY"] = 600;
		["script"] = "";
		["text"] = "If Lemfather finds out that you just ran away with his stuff, he won't go easy on you, and trust Carry, Professor can be very... inventive when it comes to punishing those he considers thieves.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00156"] = {
		["ID"] = 156;
		["actor"] = 2;
		["connectID"] = 29;
		["posX"] = 600;
		["posY"] = 4440;
		["script"] = "";
		["text"] = "Carry the Stone listens.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00157"] = {
		["ID"] = 157;
		["actor"] = 1;
		["connectID"] = 158;
		["posX"] = 1080;
		["posY"] = 4380;
		["script"] = "";
		["text"] = "Do you always refer to yourself in third person?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00158"] = {
		["ID"] = 158;
		["actor"] = 2;
		["connectID"] = 219;
		["posX"] = 1320;
		["posY"] = 4380;
		["script"] = "";
		["text"] = "A bad habit. Carry got it in Education Centre, when he learned the huma language. Now it is easier to learn a new language, than fix this one. Carry tried a couple of times, but then got tired. Languages are not his thing, Carry thinks.";
		["time"] = 23.5;
		["type"] = "message";
	};
	["message_00160"] = {
		["ID"] = 160;
		["actor"] = 1;
		["connectID"] = 162;
		["posX"] = 1080;
		["posY"] = 4680;
		["script"] = "";
		["text"] = "What can you tell me about this camp?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00162"] = {
		["ID"] = 162;
		["actor"] = 2;
		["connectID"] = 236;
		["posX"] = 1320;
		["posY"] = 4680;
		["script"] = "";
		["text"] = "What Carry the Stone could tell you about this shithole your own eyes won't see? Long ago this was a big mining camp, but one day all significant antigravium veins were depleted and the miners moved somewhere else.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00163"] = {
		["ID"] = 163;
		["actor"] = 1;
		["connectID"] = 164;
		["posX"] = 5940;
		["posY"] = 660;
		["script"] = "";
		["text"] = "What are you going to do now?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00164"] = {
		["ID"] = 164;
		["actor"] = 2;
		["connectID"] = 79;
		["posX"] = 6180;
		["posY"] = 660;
		["script"] = "";
		["text"] = "Carry the Stone needs to figure out how to get back to town and then to the lab in one piece. Won't be that easy with those Scalphunters lurking in the Cutthroat's Pass. But he'll manage... somehow.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00165"] = {
		["ID"] = 165;
		["actor"] = 2;
		["animation"] = "dl_hand_negative";
		["connectID"] = 25;
		["posX"] = 600;
		["posY"] = 4290;
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
		["text"] = "Carry the Stone's mouth is shut for you, stupid huma. You've snatched the neocortex module for yourself. Now Carry must deal with Lemfather's rage, and you will deal with all your problems alone.";
		["time"] = 17.5;
		["topic"] = "scan_it:lore_blocked";
		["type"] = "message";
	};
	["message_00166"] = {
		["ID"] = 166;
		["actor"] = 2;
		["posX"] = 600;
		["posY"] = 4170;
		["script"] = "";
		["text"] = "If bad ending with neocortex";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00167"] = {
		["ID"] = 167;
		["actor"] = 2;
		["connectID"] = 214;
		["posX"] = 1320;
		["posY"] = 4530;
		["script"] = "";
		["text"] = "Oh, they call him Professor Lemfather. Many fools think, he's some kind of \"mad scientist\" who locked himself up in the old atmosphere processor tower. Some think he's a con man, trying to fool the travellers: an old huma, who wants to look wise and important and takes gifts for his advice.";
		["time"] = 27;
		["type"] = "message";
	};
	["message_00168"] = {
		["ID"] = 168;
		["actor"] = 1;
		["connectID"] = 167;
		["posX"] = 1080;
		["posY"] = 4530;
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
		["text"] = "What can you tell me about your boss?";
		["time"] = 5;
		["topic"] = "scan_it:about_lemfather_2";
		["type"] = "message";
	};
	["message_00171"] = {
		["ID"] = 171;
		["actor"] = 1;
		["connectID"] = 172;
		["posX"] = 1080;
		["posY"] = 4080;
		["script"] = "";
		["text"] = "I'm surprised by your tech knowledge. Where have you learned so much about scanners and such things?";
		["time"] = 9.5;
		["topic"] = "scan_it:about_lemfather_1";
		["type"] = "message";
	};
	["message_00172"] = {
		["ID"] = 172;
		["actor"] = 2;
		["connectID"] = 222;
		["posX"] = 1320;
		["posY"] = 4080;
		["script"] = "";
		["text"] = "Back in the lab Carry assembled and disassembled lots of things, read a lot of magazines and articles from holonet. Carry has an intuitive understanding of how things work, his boss, Professor Lemfather says.\
";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00175"] = {
		["ID"] = 175;
		["actor"] = 1;
		["connectID"] = 208;
		["posX"] = 1380;
		["posY"] = 2640;
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
		["text"] = "\\[Lie]I met Swift Strider in a bar, drunk as a skunk.";
		["time"] = 6.5;
		["topic"] = "family_relic:strider_killed";
		["type"] = "message";
	};
	["message_00176"] = {
		["ID"] = 176;
		["actor"] = 1;
		["connectID"] = 199;
		["posX"] = 1380;
		["posY"] = 2040;
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
		["text"] = "Swift Strider is dead.";
		["time"] = 3;
		["topic"] = "family_relic:strider_dead";
		["type"] = "message";
	};
	["message_00177"] = {
		["ID"] = 177;
		["actor"] = 1;
		["connectID"] = 233;
		["posX"] = 1380;
		["posY"] = 2280;
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
		["text"] = "Don't really know...";
		["time"] = 2.5;
		["topic"] = "family_relic:strider_unknown";
		["type"] = "message";
	};
	["message_00178"] = {
		["ID"] = 178;
		["actor"] = 1;
		["connectID"] = 209;
		["posX"] = 1380;
		["posY"] = 2490;
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
		["text"] = "Saved his ass, he should be at the fort now.";
		["time"] = 6;
		["topic"] = "family_relic:strider_reported";
		["type"] = "message";
	};
	["message_00181"] = {
		["ID"] = 181;
		["actor"] = 1;
		["connectID"] = 205;
		["posX"] = 1380;
		["posY"] = 2790;
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
		["text"] = "I've finished him off.";
		["time"] = 3;
		["topic"] = "family_relic:strider_killed";
		["type"] = "message";
	};
	["message_00183"] = {
		["ID"] = 183;
		["actor"] = 2;
		["animation"] = "dl_hands_strike";
		["connectID"] = 207;
		["posX"] = 1860;
		["posY"] = 2640;
		["script"] = "";
		["text"] = "Carry the Stone is not a fool, huma: his brother treasured this old rusty axe as the only reminder of his elders. He would not part with it willingly, unless there wasn't another choice. He would not leave the Great Ergs as well, for he was born and raised here and knows no other life outside of the two great deserts.";
		["time"] = 31.5;
		["type"] = "message";
	};
	["message_00185"] = {
		["ID"] = 185;
		["actor"] = 2;
		["connectID"] = 231;
		["posX"] = 510;
		["posY"] = 2460;
		["script"] = "";
		["text"] = "Really? What makes you think that Carry is into this tribal junk? You probably expect that now Chief Big Fat Ass will tell you where to find some Ancient Tribal Treasure or something?";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00186"] = {
		["ID"] = 186;
		["actor"] = 2;
		["connectID"] = 198;
		["posX"] = 1860;
		["posY"] = 2040;
		["script"] = "";
		["text"] = "Well... Carry the Stone is not impressed. That thickhead had it coming long ago! Playing caravan guard for ten cycles has taught him nothing. Damn... he was always taking the most dangerous jobs, as if he wanted to prove something or felt immortal... May the Huntress watch his soul now.";
		["time"] = 26;
		["type"] = "message";
	};
	["message_00187"] = {
		["ID"] = 187;
		["actor"] = 2;
		["connectID"] = 201;
		["posX"] = 2250;
		["posY"] = 2190;
		["script"] = "";
		["text"] = "Yeah, that's Strider's style: play tough, get screwed then ask strangers for help!";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00188"] = {
		["ID"] = 188;
		["actor"] = 2;
		["animation"] = "dl_chuckle";
		["connectID"] = 210;
		["posX"] = 1860;
		["posY"] = 2490;
		["script"] = "";
		["text"] = "Oh, great! The best news Carry got in ten cycles from his big brother. Strider is finally quitting his dangerous job! But wait? He's a cripple now, and who is going to feed his stupid mouth? Little brother Carry, of course! Just perfect!";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00189"] = {
		["ID"] = 189;
		["actor"] = 2;
		["connectID"] = 206;
		["posX"] = 1860;
		["posY"] = 2790;
		["script"] = "";
		["text"] = "Well... Carry the Stone is not impressed. That thickhead had it coming long ago! Playing caravan guard for ten cycles has taught him nothing. Damn... he was always taking the most dangerous jobs, as if he wanted to prove something or felt immortal... May the Huntress watch his soul now.";
		["time"] = 26;
		["type"] = "message";
	};
	["message_00190"] = {
		["ID"] = 190;
		["actor"] = 1;
		["connectID"] = 185;
		["posX"] = 270;
		["posY"] = 2460;
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
		["text"] = "\\[Give Rusty Axe]I've met your brother Swift Strider. He said this old hatchet now belongs to you.";
		["time"] = 10;
		["topic"] = "family_relic:finish";
		["type"] = "message";
	};
	["message_00192"] = {
		["ID"] = 192;
		["actor"] = 2;
		["connectID"] = 193;
		["posX"] = 990;
		["posY"] = 2460;
		["script"] = "";
		["text"] = "Can Carry ask you, huma, what actually happened to his shithead of a brother, that made Strider part with his favorite toy?";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00195"] = {
		["ID"] = 195;
		["actor"] = 1;
		["connectID"] = 187;
		["posX"] = 2010;
		["posY"] = 2190;
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
		["text"] = "I healed him though. Might still be alive. When I left he was quite optimistic about fighting off the vultures and dying in combat.";
		["time"] = 13;
		["topic"] = "family_relic:strider_saved";
		["type"] = "message";
	};
	["message_00196"] = {
		["ID"] = 196;
		["actor"] = 1;
		["connectID"] = 197;
		["posX"] = 2010;
		["posY"] = 2340;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuestTopicVisible(\"family_relic\", \"strider_saved\")\
end\
\
";
		["text"] = "He asked for water and I provided some. Though it's not my job to heal stranger aboris... And I left. Got other things to do. And your Brother isn't a nicest person I've met on this planet, you know...";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00197"] = {
		["ID"] = 197;
		["actor"] = 2;
		["connectID"] = 201;
		["posX"] = 2250;
		["posY"] = 2340;
		["script"] = "";
		["text"] = "Oh, Carry the Stone knows! He knows that Strider is an asshole, but a tough one. If there is any chance to survive - then he will.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00198"] = {
		["ID"] = 198;
		["actor"] = 2;
		["animation"] = "dl_hands_strike";
		["connectID"] = 232;
		["posX"] = 2100;
		["posY"] = 2040;
		["script"] = "";
		["text"] = "That Stupid Swift Strider! What? You expect Carry to break in tears? That will never happen! Strider was a shitty brother. Always thought he was better, stronger, that he knows better.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00199"] = {
		["ID"] = 199;
		["actor"] = 1;
		["connectID"] = 186;
		["posX"] = 1620;
		["posY"] = 2040;
		["script"] = "";
		["text"] = "The caravan he was guarding was ambushed by some raiders not so far from the town. He was severely wounded but managed to stay alive long enough to tell me the story and send the axe to you.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00201"] = {
		["ID"] = 201;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 79;
		["posX"] = 2490;
		["posY"] = 2280;
		["script"] = "";
		["text"] = "Carry won't thank you for helping his shithead brother though, huma. Strider is the biggest pain in Carry's ass since they both crawled on the parents' hut's floor. The one he can perfectly live without.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00205"] = {
		["ID"] = 205;
		["actor"] = 1;
		["connectID"] = 189;
		["posX"] = 1620;
		["posY"] = 2790;
		["script"] = "";
		["text"] = "He was mortally wounded and suffering: lost both of his legs and will to live. Strider asked me for the last favor and I've put him out of his misery. Didn't have the time to dig a grave.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00206"] = {
		["ID"] = 206;
		["actor"] = 2;
		["animation"] = "dl_stop_twohand";
		["connectID"] = 234;
		["posX"] = 2100;
		["posY"] = 2790;
		["script"] = "";
		["text"] = "Don't worry, huma, there will be no revenge from Carry the Stone. In fact he must thank you for taking care of this matter, for Strider obviously cannot do it now.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00207"] = {
		["ID"] = 207;
		["actor"] = 2;
		["connectID"] = 79;
		["posX"] = 2100;
		["posY"] = 2640;
		["script"] = "";
		["text"] = "Strider is probably bitebug fodder now, for one reason or another. And Carry knows that you are a liar, huma. One day, may the Huntress witness, your lies will cost you your skin.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00208"] = {
		["ID"] = 208;
		["actor"] = 1;
		["connectID"] = 183;
		["posX"] = 1620;
		["posY"] = 2640;
		["script"] = "";
		["text"] = "He told me that he regrets being such a bad brother to you. He sent you this axe and his apologies for all he has done and said. As far as I know, he was departing with a caravan to seek a new life in another part of this desert globe. This was his last adieu for you.";
		["time"] = 30;
		["type"] = "message";
	};
	["message_00209"] = {
		["ID"] = 209;
		["actor"] = 1;
		["animation"] = "dl_shrug_long";
		["connectID"] = 188;
		["posX"] = 1620;
		["posY"] = 2490;
		["script"] = "";
		["text"] = "He lost his both legs though. You got to take care of your brother from now on.\
";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00210"] = {
		["ID"] = 210;
		["actor"] = 2;
		["connectID"] = 79;
		["posX"] = 2100;
		["posY"] = 2490;
		["script"] = "";
		["text"] = "Don't look at Carry like that, huma! We shall talk about my worthless brother later in fort, If Carry manages to get there in one piece.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00211"] = {
		["ID"] = 211;
		["actor"] = 1;
		["connectID"] = 212;
		["posX"] = 1800;
		["posY"] = 4680;
		["script"] = "";
		["text"] = "Isn't it better than dwelling outside in the wilderness, where the beasts can have you for breakfast any time they want?";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00212"] = {
		["ID"] = 212;
		["actor"] = 2;
		["connectID"] = 237;
		["posX"] = 2040;
		["posY"] = 4680;
		["script"] = "";
		["text"] = "Only marginally, huma. You don't know what kind of beasts a group like this can produce, given time and enough prey. And prey is here everywhere: weak souls and minds, supported by weakened bodies.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00213"] = {
		["ID"] = 213;
		["actor"] = 2;
		["connectID"] = 238;
		["posX"] = 2520;
		["posY"] = 4680;
		["script"] = "";
		["text"] = "For many of the outcasts it would be better to die quickly than exist here without hope or purpose. The leader of this camp, the guy they call Big Hat, tries to change their ways... But he cannot save those who already gave up.";
		["time"] = 23;
		["type"] = "message";
	};
	["message_00214"] = {
		["ID"] = 214;
		["actor"] = 2;
		["connectID"] = 215;
		["posX"] = 1560;
		["posY"] = 4530;
		["script"] = "";
		["text"] = "Tribals fear him as a \"skyfallen demon\", who can send ball lightning to kill his enemies at great distances and can get into your brains to make you kill your family and eat your own eggs. Stupid ignorant fools!";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00215"] = {
		["ID"] = 215;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 216;
		["posX"] = 1800;
		["posY"] = 4530;
		["script"] = "";
		["text"] = "What do YOU think about this Lemfather guy then?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00216"] = {
		["ID"] = 216;
		["actor"] = 2;
		["connectID"] = 217;
		["posX"] = 2040;
		["posY"] = 4530;
		["script"] = "";
		["text"] = "Carry works for Professor for five cycles now. He thinks Lemfaher is a very powerful huma, with friends and connections in high places. Lemfather's intellect is unrivaled on K'Tharsis. Even in the Core Worlds few could understand the purpose and importance of his experiments and his theories.";
		["time"] = 24.5;
		["type"] = "message";
	};
	["message_00217"] = {
		["ID"] = 217;
		["actor"] = 2;
		["connectID"] = 235;
		["posX"] = 2280;
		["posY"] = 4530;
		["script"] = "";
		["text"] = "Carry has no idea though, why Professor prefers to live as a hermit, here on K'Tharsis, when he could be the head of the largest research institutions on Terra or Avalon.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00218"] = {
		["ID"] = 218;
		["actor"] = 2;
		["connectID"] = 32;
		["posX"] = 1560;
		["posY"] = 3930;
		["script"] = "";
		["text"] = "Carry is stuck here, he admits, but he does not belong here. Once he finishes his job, he is going to leave this terrible place and never return. Carry advises you to follow his example as well. These outcasts are like sand fever victims: stick with them for a while, and you become one of them.";
		["time"] = 29.5;
		["type"] = "message";
	};
	["message_00219"] = {
		["ID"] = 219;
		["actor"] = 2;
		["animation"] = "dl_shrug_short";
		["connectID"] = 32;
		["posX"] = 1560;
		["posY"] = 4380;
		["script"] = "";
		["text"] = "Anyways, Carry is not having a conversation with humas very often, besides Professor. And Professor does not care at all how Carry speaks, as long as Carry fixes stuff in the lab and brings what he's asked to find.\
";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00220"] = {
		["ID"] = 220;
		["actor"] = 1;
		["connectID"] = 221;
		["posX"] = 1800;
		["posY"] = 4080;
		["script"] = "";
		["text"] = "In your case that means you are some kind a genius in tech. Don't get too full of yourself though, that also means you are probably a complete chucklehead in other fields.";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00221"] = {
		["ID"] = 221;
		["actor"] = 2;
		["animation"] = "dl_hands_strike";
		["connectID"] = 32;
		["posX"] = 2040;
		["posY"] = 4080;
		["script"] = "";
		["text"] = "Shit! Carry always felt, that Lemfather makes fun of him when he calls him so!";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00222"] = {
		["ID"] = 222;
		["actor"] = 2;
		["animation"] = "dl_head_tap";
		["connectID"] = 220;
		["posX"] = 1560;
		["posY"] = 4080;
		["script"] = "";
		["text"] = "Carry can always imagine in his head, how the current flows in a microscheme or how some mechanical parts must interact in order to produce the result he wants. Then he simply builds it. Professor calls Carry an \"engineering savant\". What is a \"savant\", Carry wonders?";
		["time"] = 24;
		["type"] = "message";
	};
	["message_00223"] = {
		["ID"] = 223;
		["actor"] = 2;
		["animation"] = "dl_clench_fist";
		["connectID"] = 86;
		["posX"] = 4200;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Are you satisfied now? Don't look at me like this, pervert!";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00224"] = {
		["ID"] = 224;
		["actor"] = 2;
		["animation"] = "idle_look";
		["connectID"] = 147;
		["posX"] = 3720;
		["posY"] = 750;
		["script"] = "";
		["text"] = "It's so embarrassing!";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00225"] = {
		["ID"] = 225;
		["actor"] = 2;
		["connectID"] = 133;
		["posX"] = -720;
		["posY"] = 990;
		["script"] = "";
		["text"] = "True pros use only the old school holo-display and laser projectors! Touchscreens and tactile keyboards, huma, that's what I'm talking about!";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00226"] = {
		["ID"] = 226;
		["actor"] = 2;
		["animation"] = "dl_stop_onehand";
		["connectID"] = 137;
		["posX"] = 1470;
		["posY"] = -870;
		["script"] = "";
		["text"] = "No worries, we don't even need to open up your precious device. An external module will do the trick! Are you afraid of a simple walk around the lake or what, huma?";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00227"] = {
		["ID"] = 227;
		["actor"] = 2;
		["connectID"] = 143;
		["posX"] = 3150;
		["posY"] = -870;
		["script"] = "";
		["text"] = "Then follow the sound of the detector: it increases in frequency and pitch as you get closer to a good sample.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00230"] = {
		["ID"] = 230;
		["actor"] = 2;
		["connectID"] = 152;
		["posX"] = 3240;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Carry asks a huma with a scanner to help - huma helps. No questions - and everyone lives happily ever after. Ask questions - and soon you get thrown into disintegrator in the back of the lab.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00231"] = {
		["ID"] = 231;
		["actor"] = 2;
		["connectID"] = 192;
		["posX"] = 750;
		["posY"] = 2460;
		["script"] = "";
		["text"] = "Carry the Stone does not play these games, huma. He'll take it only out of respect for the legwork you did in order to deliver this rusty \"family heirloom\" here.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00232"] = {
		["ID"] = 232;
		["actor"] = 2;
		["connectID"] = 79;
		["posX"] = 2340;
		["posY"] = 2040;
		["script"] = "";
		["text"] = "Last time Carry and Strider met, they ended up fighting and were thrown out of the saloon. Carry is glad that Strider is bitebug fodder now!";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00233"] = {
		["ID"] = 233;
		["actor"] = 1;
		["connectID"] = 194;
		["posX"] = 1620;
		["posY"] = 2280;
		["script"] = "";
		["text"] = "The caravan he was guarding was ambushed by some raiders not so far from the town. He was severely wounded but managed to stay alive long enough to tell me the story and send the axe to you.\
";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00234"] = {
		["ID"] = 234;
		["actor"] = 2;
		["connectID"] = 79;
		["posX"] = 2340;
		["posY"] = 2790;
		["script"] = "";
		["text"] = "You did more than the most of the locals would do. But words of gratitude is all Carry can and will offer... for killing his brother.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00235"] = {
		["ID"] = 235;
		["actor"] = 2;
		["connectID"] = 32;
		["posX"] = 2520;
		["posY"] = 4530;
		["script"] = "";
		["text"] = "Lemfather does not like to discuss his ways and Carry does not insist. Professor can be terrifying when you get on his angry side. Mind this, if you ever get a chance to talk to him.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00236"] = {
		["ID"] = 236;
		["actor"] = 2;
		["connectID"] = 211;
		["posX"] = 1560;
		["posY"] = 4680;
		["script"] = "";
		["text"] = "Now the outcasts took over and live here. Well, if you can call it living.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00237"] = {
		["ID"] = 237;
		["actor"] = 2;
		["connectID"] = 213;
		["posX"] = 2280;
		["posY"] = 4680;
		["script"] = "";
		["text"] = "Look closer, and you will notice how the weak prey upon the weakest, and those seek someone to devour in their turn. Disgusting!";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00238"] = {
		["ID"] = 238;
		["actor"] = 2;
		["connectID"] = 32;
		["posX"] = 2760;
		["posY"] = 4680;
		["script"] = "";
		["text"] = "You might not know, but for the tribal aboris being an outcast is like standing with one foot in their grave.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00240"] = {
		["ID"] = 240;
		["actor"] = 1;
		["connectID"] = 241;
		["posX"] = 1710;
		["posY"] = 360;
		["script"] = "";
		["text"] = "What? Just like that?";
		["time"] = 3;
		["topic"] = "scan_it:give_item5";
		["type"] = "message";
	};
	["message_00241"] = {
		["ID"] = 241;
		["actor"] = 2;
		["animation"] = "dl_chuckle";
		["connectID"] = 95;
		["posX"] = 1950;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Ooohhh... Yes!";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00242"] = {
		["ID"] = 242;
		["actor"] = 2;
		["connectID"] = 145;
		["posX"] = 5430;
		["posY"] = -870;
		["script"] = "";
		["text"] = "Gather at least five samples then bring them to Carry the Stone. That should be enough to make you fifty greenies richer. Plus - a brand new energy implant.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00244"] = {
		["ID"] = 244;
		["actor"] = 1;
		["connectID"] = 248;
		["posX"] = 3990;
		["posY"] = -960;
		["script"] = "";
		["text"] = "Umm... My scan function is kind of busted.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00245"] = {
		["ID"] = 245;
		["actor"] = 2;
		["connectID"] = 244;
		["posX"] = 3720;
		["posY"] = -960;
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
		["text"] = "";
		["time"] = 1;
		["topic"] = "broken_scanner:can_fix";
		["type"] = "message";
	};
	["message_00248"] = {
		["ID"] = 248;
		["actor"] = 2;
		["connectID"] = 249;
		["posX"] = 4230;
		["posY"] = -960;
		["script"] = "";
		["text"] = "Wait... really? Let Carry see... Oh it's nothing! I'll just use this...";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00249"] = {
		["ID"] = 249;
		["actor"] = 2;
		["connectID"] = 250;
		["posX"] = 4470;
		["posY"] = -960;
		["script"] = "";
		["text"] = "And this....";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00250"] = {
		["ID"] = 250;
		["actor"] = 2;
		["connectID"] = 251;
		["posX"] = 4710;
		["posY"] = -960;
		["script"] = "";
		["text"] = "And done! For free!";
		["time"] = 2;
		["topic"] = "broken_scanner:fixes_scanner";
		["type"] = "message";
	};
	["message_00251"] = {
		["ID"] = 251;
		["actor"] = 1;
		["connectID"] = 252;
		["posX"] = 4950;
		["posY"] = -960;
		["script"] = "";
		["text"] = "Wow, that was fast!";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00252"] = {
		["ID"] = 252;
		["actor"] = 2;
		["connectID"] = 242;
		["posX"] = 5190;
		["posY"] = -960;
		["script"] = "";
		["text"] = "Just don't let me down with the task.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00253"] = {
		["ID"] = 253;
		["actor"] = 1;
		["connectID"] = 254;
		["posX"] = 270;
		["posY"] = 3060;
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
		["text"] = "Do you know anything about Sweet Joy?";
		["time"] = 4;
		["topic"] = "broken_crane:carry_sweet_joy";
		["type"] = "message";
	};
	["message_00254"] = {
		["ID"] = 254;
		["actor"] = 2;
		["connectID"] = 255;
		["posX"] = 540;
		["posY"] = 3060;
		["script"] = "";
		["text"] = "I know one thing — after I tried that junk, the next day I found myself in a vat of electrolyte. After that, I stopped my experiments. Now I only use good old blueship.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00255"] = {
		["ID"] = 255;
		["actor"] = 2;
		["connectID"] = 256;
		["posX"] = 810;
		["posY"] = 3060;
		["script"] = "";
		["text"] = "If you're desperate, huma, try asking the traveling traders. I don't think the locals have it — the production technology is too complicated for them.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00256"] = {
		["ID"] = 256;
		["actor"] = 2;
		["connectID"] = 79;
		["posX"] = 1080;
		["posY"] = 3060;
		["script"] = "";
		["text"] = "All they know is how to add all sorts of crap to moonshine.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["switch_00002"] = {
		["ID"] = 2;
		["connectionsID"] = {
			[1] = 9;
			[2] = 15;
			[3] = 13;
			[4] = 10;
		};
		["h"] = 120;
		["posX"] = -1320;
		["posY"] = -1230;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00006"] = {
		["ID"] = 6;
		["connectionsID"] = {
			[1] = 3;
			[2] = 7;
		};
		["posX"] = -2100;
		["posY"] = -330;
		["type"] = "switch";
	};
	["switch_00016"] = {
		["ID"] = 16;
		["connectionsID"] = {
			[1] = 11;
			[2] = 12;
			[3] = 20;
			[4] = 21;
			[5] = 22;
			[6] = 17;
		};
		["h"] = 160;
		["posX"] = -540;
		["posY"] = -1320;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00025"] = {
		["ID"] = 25;
		["connectionsID"] = {
			[1] = 26;
			[2] = 36;
			[3] = 123;
			[4] = 190;
			[5] = 253;
			[6] = 27;
			[7] = 28;
		};
		["h"] = 180;
		["posX"] = -150;
		["posY"] = 1050;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00029"] = {
		["ID"] = 29;
		["connectionsID"] = {
			[1] = 30;
			[2] = 171;
			[3] = 31;
			[4] = 157;
			[5] = 168;
			[6] = 160;
			[7] = 33;
		};
		["h"] = 180;
		["posX"] = 930;
		["posY"] = 4380;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00037"] = {
		["ID"] = 37;
		["connectionsID"] = {
			[1] = 69;
			[2] = 41;
			[3] = 42;
			[4] = 40;
			[5] = 38;
			[6] = 39;
			[7] = 43;
		};
		["h"] = 180;
		["posX"] = 1020;
		["posY"] = 420;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00056"] = {
		["ID"] = 56;
		["connectionsID"] = {
			[1] = 49;
			[2] = 57;
		};
		["posX"] = 1470;
		["posY"] = -390;
		["type"] = "switch";
	};
	["switch_00060"] = {
		["ID"] = 60;
		["connectionsID"] = {
			[1] = 61;
			[2] = 62;
			[3] = 63;
		};
		["posX"] = 2100;
		["posY"] = -510;
		["type"] = "switch";
	};
	["switch_00073"] = {
		["ID"] = 73;
		["connectionsID"] = {
			[1] = 72;
			[2] = 74;
		};
		["posX"] = 1710;
		["posY"] = 960;
		["type"] = "switch";
	};
	["switch_00078"] = {
		["ID"] = 78;
		["connectionsID"] = {
			[1] = 80;
			[2] = 81;
			[3] = 82;
			[4] = 83;
			[5] = 84;
		};
		["h"] = 140;
		["posX"] = 2580;
		["posY"] = 840;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00095"] = {
		["ID"] = 95;
		["connectionsID"] = {
			[1] = 119;
			[2] = 98;
			[3] = 100;
			[4] = 104;
		};
		["h"] = 120;
		["posX"] = 5280;
		["posY"] = 660;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00105"] = {
		["ID"] = 105;
		["connectionsID"] = {
			[1] = 23;
			[2] = 106;
		};
		["posX"] = -1590;
		["posY"] = 1050;
		["type"] = "switch";
	};
	["switch_00127"] = {
		["ID"] = 127;
		["connectionsID"] = {
			[1] = 126;
			[2] = 124;
		};
		["posX"] = 990;
		["posY"] = 1740;
		["type"] = "switch";
	};
	["switch_00170"] = {
		["ID"] = 170;
		["connectionsID"] = {
			[1] = 165;
			[2] = 156;
		};
		["posX"] = 450;
		["posY"] = 4350;
		["type"] = "switch";
	};
	["switch_00193"] = {
		["ID"] = 193;
		["connectionsID"] = {
			[1] = 176;
			[2] = 177;
			[3] = 178;
			[4] = 175;
			[5] = 181;
		};
		["h"] = 140;
		["posX"] = 1230;
		["posY"] = 2430;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00194"] = {
		["ID"] = 194;
		["connectionsID"] = {
			[1] = 195;
			[2] = 196;
		};
		["posX"] = 1860;
		["posY"] = 2280;
		["type"] = "switch";
	};
	["switch_00243"] = {
		["ID"] = 243;
		["connectionsID"] = {
			[1] = 245;
			[2] = 242;
		};
		["posX"] = 3630;
		["posY"] = -870;
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
