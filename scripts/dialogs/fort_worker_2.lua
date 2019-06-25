-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["posX"] = 1110;
		["posY"] = 210;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible() and self:isFirstTime() and getQuestTopicVisible(\"helping_hands\", \"worker1\")\
end\
\
";
		["text"] = "worker1_phil_said";
		["time"] = 1.5;
		["topic"] = "helping_hands:worker1_phil_said";
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["posX"] = 1110;
		["posY"] = 330;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["connectID"] = 16;
		["posX"] = 660;
		["posY"] = 540;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["connectID"] = 2;
		["posX"] = 660;
		["posY"] = 420;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["connectID"] = 29;
		["posX"] = 1620;
		["posY"] = 540;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"helping_hands\", \"worker1\")\
end\
\
";
		["text"] = "You're needed in the warehouse.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 7;
		["posX"] = 210;
		["posY"] = 480;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["animation"] = "dl_head_2nods";
		["connectID"] = 11;
		["posX"] = 2610;
		["posY"] = 660;
		["script"] = "";
		["text"] = "If it's Phil's orders then I'll go. Just lemme finish the bottle first.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 1;
		["animation"] = "dl_come_here";
		["connectID"] = 12;
		["posX"] = 2880;
		["posY"] = 660;
		["script"] = "";
		["text"] = "Come on, chop-chop!";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["animation"] = "dl_righthand_wave_short";
		["posX"] = 3150;
		["posY"] = 660;
		["script"] = "";
		["text"] = "Gimme a break, huma. The warehouse ain't getting nowhere. You go mind your own business, I'll be there soon.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 1;
		["posX"] = 1620;
		["posY"] = 660;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["connectID"] = 17;
		["posX"] = 930;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Have a minute?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["connectID"] = 14;
		["posX"] = 1200;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Speak, huma.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = 2370;
		["posY"] = -240;
		["script"] = "";
		["text"] = "Well, it was an old terraform station. Now it's an Eastern Road Campaign base. Building bridges, roads, allowing civilization to reach the faraway podunks, so to speak.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 1;
		["connectID"] = 24;
		["posX"] = 2100;
		["posY"] = -360;
		["script"] = "";
		["text"] = "Hi! What is your task here?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 1;
		["connectID"] = 25;
		["posX"] = 2100;
		["posY"] = -120;
		["script"] = "";
		["text"] = "Who's in charge here?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 2100;
		["posY"] = -240;
		["script"] = "";
		["text"] = "What's this place?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = 1620;
		["posY"] = 420;
		["script"] = "";
		["text"] = "I have a question.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = 2370;
		["posY"] = -360;
		["script"] = "";
		["text"] = "I'm a builder, a free worker by the way, with education and stuff! Don't you mix us up with those poor sods in the mines, we even have our own union!";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = 2370;
		["posY"] = -120;
		["script"] = "";
		["text"] = "Well, officially the mercs and their moron of a captain. But around here Master Phil is the one in charge. Great fellow, nothing is done here without his approval.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 1;
		["connectID"] = 27;
		["posX"] = 2100;
		["posY"] = 0;
		["script"] = "";
		["text"] = "Do you have any tips?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = 2370;
		["posY"] = 0;
		["script"] = "";
		["text"] = "Sure, why not. Find yourself a real trade. Riding arphants in the desert isn't a good long-term strategy, compared to a skillful master of his trade, which is always in demand.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["connectID"] = 14;
		["posX"] = 2100;
		["posY"] = 120;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 2;
		["animation"] = "dl_chuckle";
		["connectID"] = 30;
		["posX"] = 1890;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Oh yeah? Says who?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 1;
		["animation"] = "dl_point_self";
		["connectID"] = 36;
		["posX"] = 2340;
		["posY"] = 300;
		["script"] = "";
		["text"] = "I do.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 1;
		["connectID"] = 37;
		["posX"] = 2340;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Captain Castor.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 1;
		["connectID"] = 38;
		["posX"] = 2340;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Eli.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 1;
		["connectID"] = 10;
		["posX"] = 2340;
		["posY"] = 660;
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
		["text"] = "Your boss says you're to help Eli.";
		["time"] = 4.5;
		["topic"] = "helping_hands:worker1_phil_said";
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 1;
		["connectID"] = 14;
		["posX"] = 2340;
		["posY"] = 780;
		["script"] = "";
		["text"] = "Nevermind.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 2;
		["animation"] = "dl_hand_negative";
		["connectID"] = 30;
		["posX"] = 2610;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Really? And who are you to boss me around? Get lost, pinkface. I'm on vacation.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 2;
		["animation"] = "dl_clench_fist";
		["connectID"] = 30;
		["posX"] = 2610;
		["posY"] = 420;
		["script"] = "";
		["text"] = "That meathead can kiss my ass after all the hard work he has done protecting our guys.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 2;
		["animation"] = "dl_frustration";
		["connectID"] = 30;
		["posX"] = 2610;
		["posY"] = 540;
		["script"] = "";
		["text"] = "That old cheapskate? When I asked him for some antifungal cream he said I can't have any. He can go fuck himself with a supply tube. Sideways.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["switch_00002"] = {
		["ID"] = 2;
		["connectionsID"] = {
			[1] = 3;
			[2] = 4;
		};
		["posX"] = 960;
		["posY"] = 270;
		["type"] = "switch";
	};
	["switch_00007"] = {
		["ID"] = 7;
		["connectionsID"] = {
			[1] = 6;
			[2] = 5;
		};
		["posX"] = 510;
		["posY"] = 480;
		["type"] = "switch";
	};
	["switch_00014"] = {
		["ID"] = 14;
		["connectionsID"] = {
			[1] = 23;
			[2] = 8;
			[3] = 15;
		};
		["posX"] = 1470;
		["posY"] = 540;
		["type"] = "switch";
	};
	["switch_00018"] = {
		["ID"] = 18;
		["connectionsID"] = {
			[1] = 20;
			[2] = 22;
			[3] = 21;
			[4] = 26;
			[5] = 28;
		};
		["h"] = 140;
		["posX"] = 1920;
		["posY"] = -180;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00030"] = {
		["ID"] = 30;
		["connectionsID"] = {
			[1] = 31;
			[2] = 32;
			[3] = 33;
			[4] = 34;
			[5] = 35;
		};
		["h"] = 140;
		["posX"] = 2190;
		["posY"] = 510;
		["type"] = "switch";
		["w"] = 100;
	};
}
local obj2 = {
	["actor_prefab"] = {
		[1] = "human_male";
		[2] = "abori";
	};
}
return obj1 ,obj2
