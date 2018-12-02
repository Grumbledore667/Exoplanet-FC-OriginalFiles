-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 2;
		["posX"] = 1320;
		["posY"] = 450;
		["script"] = "";
		["text"] = "[t_to_fort:finish]Nice jacket! Come on in.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 2;
		["connectID"] = 14;
		["posX"] = 1320;
		["posY"] = 330;
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
		["text"] = "[t_to_fort:guards_bad_attire]Can't let you in though, we have enough people on welfare.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 4;
		["posX"] = 278.5;
		["posY"] = 539.5;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["connectID"] = 8;
		["posX"] = 510;
		["posY"] = 540;
		["script"] = "";
		["text"] = "[t_to_fort:guards_start]Hi...";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 900;
		["posY"] = 1230;
		["script"] = "";
		["text"] = "Hello, enjoying the weather?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 2;
		["connectID"] = 7;
		["posX"] = -141.5;
		["posY"] = 479.5;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 10;
		["posX"] = 900;
		["posY"] = 390;
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
		["text"] = "[t_to_fort:guards_check_attire]Greetings!";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 1;
		["posX"] = 278.5;
		["posY"] = 419.5;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["connectID"] = 13;
		["posX"] = 1320;
		["posY"] = 570;
		["script"] = "";
		["text"] = "I surely am. What is it? Like 200 degrees?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 1560;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Heh. At least there are no sandstorms these days...";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 2;
		["connectID"] = 15;
		["posX"] = 1560;
		["posY"] = 330;
		["script"] = "";
		["text"] = "[t_to_fort:guards_about_bribe]But a donation of 1000 antigravium to the fort's budget will grant you free passage no matter your outfit.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 1950;
		["posY"] = 270;
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
		["text"] = "[t_to_fort:guards_bribe]\\[Give 1000 antigravium]Yeah, sure.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = 1950;
		["posY"] = 390;
		["script"] = "";
		["text"] = "No, that's kind of expensive, don't you think?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["posX"] = 2190;
		["posY"] = 390;
		["script"] = "";
		["text"] = "The price gets higher with every outsider that comes in and turns out to be a criminal.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["posX"] = 2190;
		["posY"] = 270;
		["script"] = "";
		["text"] = "I'll add you to the list, just don't make me regret it.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 1;
		["connectID"] = 31;
		["posX"] = 1320;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "Do you have any tips?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 1;
		["posX"] = 1320;
		["posY"] = 2070;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["connectID"] = 38;
		["posX"] = 1320;
		["posY"] = 1590;
		["script"] = "";
		["text"] = "What are you doing here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 1800;
		["posY"] = 1830;
		["script"] = "";
		["text"] = "Before, those lazy-ass aboris would get hanged without questions. Now all they get are favors - a 12-hour workday, and he even allows them to sleep in the fort.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 2;
		["connectID"] = 32;
		["posX"] = 1560;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "Pal, if life didn't give you enough tips by now, what chances do I have?";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 1800;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "Always keep in mind, that on this shithole of a planet there are two kind of creatures: those with loaded guns, and those who dig. It goes without saying, which ones have it better.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 1;
		["connectID"] = 36;
		["posX"] = 1320;
		["posY"] = 1830;
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
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 2850;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 2;
		["connectID"] = 29;
		["posX"] = 1560;
		["posY"] = 1830;
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
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 1560;
		["posY"] = 1710;
		["script"] = "";
		["text"] = "No way. Soldiers are drafted. We're mercenaries. They pay us - we fight for them. Or not - that also has its price.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 1560;
		["posY"] = 1590;
		["script"] = "";
		["text"] = "We're stuck here like zits on an arse, waiting till someone comes and pops us.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 1;
		["connectID"] = 37;
		["posX"] = 1320;
		["posY"] = 1710;
		["script"] = "";
		["text"] = "So you're a soldier?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 1;
		["connectID"] = 42;
		["posX"] = 1320;
		["posY"] = 690;
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
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 1560;
		["posY"] = 690;
		["script"] = "";
		["text"] = "The upper floor of the main building is his place. If he isn't in the room he's probably smoking on the balcony.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 1770;
		["posY"] = 1410;
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
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 1770;
		["posY"] = 810;
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
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 1770;
		["posY"] = 1170;
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
		["actor"] = 1;
		["connectID"] = 44;
		["posX"] = 1320;
		["posY"] = 1140;
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
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 1770;
		["posY"] = 1050;
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
		["connectID"] = 35;
		["posX"] = 1770;
		["posY"] = 930;
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
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 1770;
		["posY"] = 1290;
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
	["switch_00007"] = {
		["ID"] = 7;
		["connectionsID"] = {
			[1] = 11;
			[2] = 3;
		};
		["posX"] = 128.5;
		["posY"] = 479.5;
		["type"] = "switch";
	};
	["switch_00008"] = {
		["ID"] = 8;
		["connectionsID"] = {
			[1] = 9;
			[2] = 5;
		};
		["posX"] = 758.5;
		["posY"] = 539.5;
		["type"] = "switch";
	};
	["switch_00010"] = {
		["ID"] = 10;
		["connectionsID"] = {
			[1] = 2;
			[2] = 1;
		};
		["posX"] = 1170;
		["posY"] = 390;
		["type"] = "switch";
	};
	["switch_00015"] = {
		["ID"] = 15;
		["connectionsID"] = {
			[1] = 16;
			[2] = 17;
		};
		["posX"] = 1800;
		["posY"] = 330;
		["type"] = "switch";
	};
	["switch_00022"] = {
		["ID"] = 22;
		["connectionsID"] = {
			[1] = 12;
			[2] = 41;
			[3] = 48;
			[4] = 28;
			[5] = 39;
			[6] = 34;
			[7] = 25;
			[8] = 27;
		};
		["posX"] = 1170;
		["posY"] = 1170;
		["type"] = "switch";
	};
	["switch_00044"] = {
		["ID"] = 44;
		["connectionsID"] = {
			[1] = 46;
			[2] = 50;
			[3] = 49;
			[4] = 47;
			[5] = 51;
			[6] = 45;
		};
		["posX"] = 1560;
		["posY"] = 1110;
		["type"] = "switch";
	};
}
return obj1
