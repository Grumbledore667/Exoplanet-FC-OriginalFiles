-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 2;
		["connectID"] = 12;
		["posX"] = 540;
		["posY"] = 240;
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
		["text"] = "What is it?";
		["time"] = 2.5;
		["topic"] = "to_fort:guards_check_attire";
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 2;
		["connectID"] = 19;
		["posX"] = 960;
		["posY"] = 180;
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
		["text"] = "Ah, bugger off you dirty hobo. This isn't a flophouse. ";
		["time"] = 6.5;
		["topic"] = "to_fort:guards_bad_attire";
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["posX"] = -90;
		["posY"] = 270;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = -510;
		["posY"] = 330;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 1;
		["connectID"] = 13;
		["posX"] = -90;
		["posY"] = 390;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 2;
		["posX"] = 960;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Aight, pass granted...";
		["time"] = 2.5;
		["topic"] = "to_fort:finish";
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["connectID"] = 42;
		["posX"] = 570;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "My job is to guard the gates and not to listen to random people.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 1;
		["connectID"] = 11;
		["posX"] = 150;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Hey...";
		["time"] = 1.5;
		["topic"] = "to_fort:guards_start";
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 1;
		["connectID"] = 17;
		["posX"] = 1590;
		["posY"] = 120;
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
		["text"] = "\\[Give 1000 antigravium]Here.";
		["time"] = 2.5;
		["topic"] = "to_fort:guards_bribe";
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = 1590;
		["posY"] = 240;
		["script"] = "";
		["text"] = "No, that's kind of expensive, don't you think?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["posX"] = 1830;
		["posY"] = 120;
		["script"] = "";
		["text"] = "You're in and this conversation never happened.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["posX"] = 1830;
		["posY"] = 240;
		["script"] = "";
		["text"] = "You can keep your complaints to yourself, maybe they'll keep you warm during your next night in a cave.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["connectID"] = 14;
		["posX"] = 1200;
		["posY"] = 180;
		["script"] = "";
		["text"] = "Though we could make a deal. Let's say you get a hold of 1000 greens and I let you in even with a bare ass.";
		["time"] = 13.5;
		["topic"] = "to_fort:guards_about_bribe";
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 1;
		["connectID"] = 22;
		["posX"] = 990;
		["posY"] = 1710;
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
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["connectID"] = 42;
		["posX"] = 2370;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 2;
		["connectID"] = 27;
		["posX"] = 1230;
		["posY"] = 1710;
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
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 1230;
		["posY"] = 1590;
		["script"] = "";
		["text"] = "No way. Soldiers are drafted. We're mercenaries. They pay us - we fight for them. Or not - that also has its price.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 1230;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "We're stuck here like zits on an arse, waiting till someone comes and pops us.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 1;
		["connectID"] = 23;
		["posX"] = 990;
		["posY"] = 1590;
		["script"] = "";
		["text"] = "So you're a soldier?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 1470;
		["posY"] = 1710;
		["script"] = "";
		["text"] = "Before, those lazy-ass aboris would get hanged without questions. Now all they get are favors - a 12-hour workday, and he even allows them to sleep in the fort.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["connectID"] = 30;
		["posX"] = 990;
		["posY"] = 600;
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
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 1230;
		["posY"] = 600;
		["script"] = "";
		["text"] = "The upper floor of the main building is his place. If he isn't in the room he's probably smoking on the balcony.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 1;
		["connectID"] = 41;
		["posX"] = 990;
		["posY"] = 1830;
		["script"] = "";
		["text"] = "Do you have any tips?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00040"] = {
		["ID"] = 40;
		["actor"] = 1;
		["connectID"] = 24;
		["posX"] = 990;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "What are you doing here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 2;
		["connectID"] = 44;
		["posX"] = 1230;
		["posY"] = 1830;
		["script"] = "";
		["text"] = "Pal, if life didn't give you enough tips by now, what chances do I have?";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 1;
		["posX"] = 990;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 1470;
		["posY"] = 1830;
		["script"] = "";
		["text"] = "Always keep in mind, that on this shithole of a planet there are two kind of creatures: those with loaded guns, and those who dig. It goes without saying, which ones have it better.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 1440;
		["posY"] = 750;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"SayRandom\") == 1\
end\
\
";
		["text"] = "Hey pal, lend a hundred greenies, no? And if I find some on you, eh? Haha, I'm just messing with ya.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 1;
		["connectID"] = 51;
		["posX"] = 990;
		["posY"] = 1080;
		["script"] = "local random = require \"random\"\
function message:onStart()\
   self:setParam(\"SayRandom\", random.random(6))\
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
		["text"] = "How's it going?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 1440;
		["posY"] = 1110;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"SayRandom\") == 4\
end\
\
";
		["text"] = "What a dull watch. Go and mess up some damn abori? Hm...";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 1440;
		["posY"] = 1230;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"SayRandom\") == 6\
end\
\
";
		["text"] = "You look too clean. Not a local, are you? We don't take your types kindly around here.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 1440;
		["posY"] = 990;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"SayRandom\") == 3\
end\
\
";
		["text"] = "Love my job. When I don't have to do anything.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 1440;
		["posY"] = 1350;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"SayRandom\") == 7\
end\
\
";
		["text"] = "I'm on duty! Don't stand here screwing around, move along!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 1440;
		["posY"] = 870;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"SayRandom\") == 2\
end\
\
";
		["text"] = "Desperate for a drink, man. Too bad cap won't let us have any while on duty.";
		["time"] = 9;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 4;
			[2] = 7;
		};
		["posX"] = -240;
		["posY"] = 330;
		["type"] = "switch";
	};
	["switch_00011"] = {
		["ID"] = 11;
		["connectionsID"] = {
			[1] = 2;
			[2] = 10;
		};
		["posX"] = 398.69230769231;
		["posY"] = 386.61538461538;
		["type"] = "switch";
	};
	["switch_00012"] = {
		["ID"] = 12;
		["connectionsID"] = {
			[1] = 3;
			[2] = 8;
		};
		["posX"] = 810;
		["posY"] = 240;
		["type"] = "switch";
	};
	["switch_00014"] = {
		["ID"] = 14;
		["connectionsID"] = {
			[1] = 15;
			[2] = 16;
		};
		["posX"] = 1440;
		["posY"] = 180;
		["type"] = "switch";
	};
	["switch_00042"] = {
		["ID"] = 42;
		["connectionsID"] = {
			[1] = 28;
			[2] = 46;
			[3] = 40;
			[4] = 25;
			[5] = 20;
			[6] = 39;
			[7] = 43;
		};
		["h"] = 180;
		["posX"] = 840;
		["posY"] = 1080;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00051"] = {
		["ID"] = 51;
		["connectionsID"] = {
			[1] = 45;
			[2] = 52;
			[3] = 49;
			[4] = 47;
			[5] = 48;
			[6] = 50;
		};
		["h"] = 160;
		["posX"] = 1230;
		["posY"] = 1050;
		["type"] = "switch";
		["w"] = 100;
	};
}
return obj1
