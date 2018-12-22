-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 300;
		["posY"] = 300;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 16;
		["posX"] = 781.99987793;
		["posY"] = 144.499954224;
		["script"] = "";
		["text"] = "How's it going?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 10;
		["posX"] = 788;
		["posY"] = 245.499664307;
		["script"] = "";
		["text"] = "What are you doing here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["connectID"] = 11;
		["posX"] = 790;
		["posY"] = 348.499664307;
		["script"] = "";
		["text"] = "So you're a soldier?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["connectID"] = 12;
		["posX"] = 780;
		["posY"] = 450;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getGlobalParam(\"asked_about_castor\")\
end\
\
";
		["text"] = "Who's in charge here?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["connectID"] = 13;
		["posX"] = 779.250305176;
		["posY"] = 559.25;
		["script"] = "";
		["text"] = "Do you have any tips?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 1;
		["posX"] = 771.000305176;
		["posY"] = 663;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 1302.00024414;
		["posY"] = -544.99987793;
		["script"] = "";
		["text"] = "Hey pal, lend a hundred greenies, no? And if I find some on you, eh? Haha, I'm just messing with ya.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1048;
		["posY"] = 246.499664307;
		["script"] = "";
		["text"] = "We're stuck here like zits on an arse, waiting till someone comes and pops us.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1051;
		["posY"] = 349.499664307;
		["script"] = "";
		["text"] = "No way. Soldiers are drafted. We're mercenaries. They pay us - we fight for them. Or not - that also has its price.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["connectID"] = 14;
		["posX"] = 1050;
		["posY"] = 450;
		["script"] = "function message:onStart()\
   setGlobalParam(\"asked_about_castor\", true)\
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
		["text"] = "Captain Castor. A ruthless son of a bitch, with a steel discipline he is. Though lately he seems to be getting soft.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["connectID"] = 15;
		["posX"] = 1040;
		["posY"] = 560.499694824;
		["script"] = "";
		["text"] = "Pal, if life didn't give you enough tips by now, what chances do I have?";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1306;
		["posY"] = 453.499633789;
		["script"] = "";
		["text"] = "Before, those lazy-ass aboris would get hanged without questions. Now all they get are favors - a 12-hour workday, and he even allows them to sleep in the fort.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1300;
		["posY"] = 560.499694824;
		["script"] = "";
		["text"] = "Always keep in mind, that on this shithole of a planet there are two kind of creatures: those with loaded guns, and those who dig. It goes without saying, which ones have it better.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 2576.00024414;
		["posY"] = -221.249862671;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 1300.00012207;
		["posY"] = -439.99987793;
		["script"] = "";
		["text"] = "Desperate for a drink, man. Too bad cap won't let us have any while on duty.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 1299.00012207;
		["posY"] = -335.99987793;
		["script"] = "";
		["text"] = "Love my job. When I don't have to do anything.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 1294.00012207;
		["posY"] = -231.99987793;
		["script"] = "";
		["text"] = "What a dull watch. Go and mess up some damn abori? Hm...";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 1288.00012207;
		["posY"] = -117.999919891;
		["script"] = "";
		["text"] = "You look too clean. Not a local, are you? We don't take kindly your types around here.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 1283.00012207;
		["posY"] = -1.99993896484;
		["script"] = "";
		["text"] = "I'm on duty! Don't stand here screwing around, move along!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["connectID"] = 24;
		["posX"] = 450;
		["posY"] = -180;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return isQuestActive(\"wet_work\") or getGlobalParam(\"asked_about_castor\")\
end\
\
";
		["text"] = "Where can I find captain Castor?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 720;
		["posY"] = -180;
		["script"] = "";
		["text"] = "The upper floor of the main building is his place. If he isn't in the room he's probably smoking on the balcony.";
		["time"] = 12;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 23;
			[2] = 2;
			[3] = 3;
			[4] = 4;
			[5] = 5;
			[6] = 6;
			[7] = 7;
		};
		["posX"] = 600;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00016"] = {
		["ID"] = 16;
		["connectionsID"] = {
			[1] = 9;
			[2] = 18;
			[3] = 19;
			[4] = 20;
			[5] = 21;
			[6] = 22;
		};
		["posX"] = 1011.00024414;
		["posY"] = -60.4998693466;
		["type"] = "switch";
	};
}
return obj1
