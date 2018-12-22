-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
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
		["connectID"] = 41;
		["posX"] = 600;
		["posY"] = 570;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["connectID"] = 2;
		["posX"] = 600;
		["posY"] = 450;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 7;
		["posX"] = 150;
		["posY"] = 510;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["posX"] = 3090;
		["posY"] = 690;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   runTimer(1, nil, function()\
       gameplayUI:addSubtitle(\"*mumbles* Damn humas, gonna wear an abori out wherever he is.\", 5, self:getNPC())\
   end, false)\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Yea, yea. I'm coming.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 1;
		["connectID"] = 10;
		["posX"] = 2820;
		["posY"] = 690;
		["script"] = "";
		["text"] = "So you're coming or what?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["connectID"] = 11;
		["posX"] = 2550;
		["posY"] = 690;
		["script"] = "";
		["text"] = "Great, more work. The minute my lower back stops aching I get to carry heavy shit again!";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
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
   return self:isTopicVisible() and self:isFirstTime() and getQuestTopicVisible(\"helping_hands\", \"worker2\")\
end\
\
";
		["text"] = "[t_helping_hands:worker2_phil_said]worker2_phil_said";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 40;
		["posX"] = 2550;
		["posY"] = 330;
		["script"] = "";
		["text"] = "Really? And who are you to boss me around? Get lost, pinkface. I'm on vacation.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["connectID"] = 40;
		["posX"] = 2550;
		["posY"] = 450;
		["script"] = "";
		["text"] = "We dont take orders from that asshole. He can play soldiers with his chickenshit mercs, but we dont give a shit about what he needs now.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 2280;
		["posY"] = 450;
		["script"] = "";
		["text"] = "Captain Castor's orders.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 2310;
		["posY"] = -90;
		["script"] = "";
		["text"] = "Well, officially the mercs and their moron of a captain. But around here Master Phil is the one in charge. Great fellow, nothing is done here without his approval.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["connectID"] = 22;
		["posX"] = 1560;
		["posY"] = 450;
		["script"] = "";
		["text"] = "I have a question.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 1;
		["connectID"] = 26;
		["posX"] = 2040;
		["posY"] = 30;
		["script"] = "";
		["text"] = "Do you have any tips?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 1;
		["posX"] = 2040;
		["posY"] = 150;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 2310;
		["posY"] = 30;
		["script"] = "";
		["text"] = "Sure, why not. Find yourself a real trade. Riding arphants in the desert isn't a good long-term strategy, compared to a skillful master of his trade, which is always in demand.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 1;
		["posX"] = 1560;
		["posY"] = 690;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 2310;
		["posY"] = -210;
		["script"] = "";
		["text"] = "Well, it was an old terraform station. Now it's an Eastern Road Campaign base. Building bridges, roads, allowing civilization to reach the faraway podunks, so to speak.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 2;
		["connectID"] = 40;
		["posX"] = 1830;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Really? And why should I do that. I'm a builder not some cheap-ass loader.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 1;
		["connectID"] = 21;
		["posX"] = 2040;
		["posY"] = -90;
		["script"] = "";
		["text"] = "Who's in charge here?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 2310;
		["posY"] = -330;
		["script"] = "";
		["text"] = "I'm a builder, a free worker by the way, with education and stuff! Don't you mix us up with those poor sods in the mines, we even have our own union!";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = 2280;
		["posY"] = 330;
		["script"] = "";
		["text"] = "Because I said so.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["connectID"] = 47;
		["posX"] = 2550;
		["posY"] = 570;
		["script"] = "";
		["text"] = "He should have started with some hard cash on the table. That old cheap tick. But I have better things to do anyway. ";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 1;
		["connectID"] = 28;
		["posX"] = 2040;
		["posY"] = -210;
		["script"] = "";
		["text"] = "What's this place?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 1;
		["connectID"] = 43;
		["posX"] = 2280;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Nevermind.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 1;
		["connectID"] = 29;
		["posX"] = 1560;
		["posY"] = 570;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"helping_hands\", \"worker2\")\
end\
\
";
		["text"] = "You have to go help clean up the warehouse.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 1;
		["connectID"] = 31;
		["posX"] = 2040;
		["posY"] = -330;
		["script"] = "";
		["text"] = "Hi! What is your task here?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 1;
		["connectID"] = 42;
		["posX"] = 870;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Have a minute?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 2;
		["connectID"] = 43;
		["posX"] = 1140;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Speak, huma.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 1;
		["connectID"] = 15;
		["posX"] = 2280;
		["posY"] = 690;
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
		["text"] = "[t_helping_hands:worker2_phil_said]Your boss' orders. Master Phil says you're to help Eli.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 1;
		["connectID"] = 34;
		["posX"] = 2280;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Warehouse keeper Eli asks for help.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 1;
		["connectID"] = 48;
		["posX"] = 2820;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Like what? Sleeping the whole day or drinking yourself into a coma?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 2;
		["connectID"] = 40;
		["posX"] = 3090;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Good idea, huma! That's exactly what I'm going to do.";
		["time"] = 6;
		["type"] = "message";
	};
	["switch_00002"] = {
		["ID"] = 2;
		["connectionsID"] = {
			[1] = 17;
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
		["posX"] = 450;
		["posY"] = 510;
		["type"] = "switch";
	};
	["switch_00022"] = {
		["ID"] = 22;
		["connectionsID"] = {
			[1] = 39;
			[2] = 35;
			[3] = 30;
			[4] = 24;
			[5] = 25;
		};
		["posX"] = 1860;
		["posY"] = -150;
		["type"] = "switch";
	};
	["switch_00040"] = {
		["ID"] = 40;
		["connectionsID"] = {
			[1] = 33;
			[2] = 20;
			[3] = 46;
			[4] = 44;
			[5] = 36;
		};
		["posX"] = 2130;
		["posY"] = 540;
		["type"] = "switch";
	};
	["switch_00043"] = {
		["ID"] = 43;
		["connectionsID"] = {
			[1] = 23;
			[2] = 38;
			[3] = 27;
		};
		["posX"] = 1410;
		["posY"] = 570;
		["type"] = "switch";
	};
}
return obj1
