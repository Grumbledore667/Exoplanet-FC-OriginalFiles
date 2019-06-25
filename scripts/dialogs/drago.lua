-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 2;
		["posX"] = 60;
		["posY"] = 300;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["posX"] = 480;
		["posY"] = 240;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 480;
		["posY"] = 360;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 24;
		["posX"] = 1530;
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
		["text"] = "We don't let your kind in here. But...";
		["time"] = 5;
		["topic"] = "to_fort:guards_bad_attire";
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["posX"] = 1530;
		["posY"] = 360;
		["script"] = "";
		["text"] = "A well-dressed traveller is always welcome.";
		["time"] = 4;
		["topic"] = "to_fort:finish";
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 1110;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Nice to see you. Don't block the gate though.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["connectID"] = 8;
		["posX"] = 1110;
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
		["text"] = "Hey!";
		["time"] = 1.5;
		["topic"] = "to_fort:guards_check_attire";
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 1;
		["connectID"] = 11;
		["posX"] = 720;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Hello there...";
		["time"] = 2;
		["topic"] = "to_fort:guards_start";
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["posX"] = 2880;
		["posY"] = 300;
		["script"] = "";
		["text"] = "...";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["posX"] = 2880;
		["posY"] = 180;
		["script"] = "";
		["text"] = "Alright. You have a permanent pass, just don't make any trouble.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["connectID"] = 21;
		["posX"] = 2640;
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
		["text"] = "\\[Give 1000 antigravium]Here.";
		["time"] = 2.5;
		["topic"] = "to_fort:guards_bribe";
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 1770;
		["posY"] = 240;
		["script"] = "";
		["text"] = "One thousand...";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 1;
		["connectID"] = 20;
		["posX"] = 2640;
		["posY"] = 300;
		["script"] = "";
		["text"] = "No, that's kind of expensive, don't you think?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 1;
		["connectID"] = 27;
		["posX"] = 2010;
		["posY"] = 240;
		["script"] = "";
		["text"] = "What?";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 2250;
		["posY"] = 240;
		["script"] = "";
		["text"] = "You heard it.";
		["time"] = 2.5;
		["topic"] = "to_fort:guards_about_bribe";
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 1;
		["connectID"] = 44;
		["posX"] = 1530;
		["posY"] = 660;
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
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 1;
		["connectID"] = 35;
		["posX"] = 1530;
		["posY"] = 1890;
		["script"] = "";
		["text"] = "Do you have any tips?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 1;
		["connectID"] = 45;
		["posX"] = 1530;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "What are you doing here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 2;
		["connectID"] = 50;
		["posX"] = 1770;
		["posY"] = 1890;
		["script"] = "";
		["text"] = "Pal, if life didn't give you enough tips by now, what chances do I have?";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 1;
		["connectID"] = 43;
		["posX"] = 1530;
		["posY"] = 1770;
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
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 1;
		["posX"] = 1530;
		["posY"] = 2010;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 1;
		["connectID"] = 46;
		["posX"] = 1530;
		["posY"] = 1650;
		["script"] = "";
		["text"] = "So you're a soldier?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 2;
		["connectID"] = 52;
		["posX"] = 1770;
		["posY"] = 1770;
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
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 1770;
		["posY"] = 660;
		["script"] = "";
		["text"] = "The upper floor of the main building is his place. If he isn't in the room he's probably smoking on the balcony.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 1770;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "We're stuck here like zits on an arse, waiting till someone comes and pops us.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 1770;
		["posY"] = 1650;
		["script"] = "";
		["text"] = "No way. Soldiers are drafted. We're mercenaries. They pay us - we fight for them. Or not - that also has its price.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 2010;
		["posY"] = 1890;
		["script"] = "";
		["text"] = "Always keep in mind, that on this shithole of a planet there are two kind of creatures: those with loaded guns, and those who dig. It goes without saying, which ones have it better.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 2010;
		["posY"] = 1770;
		["script"] = "";
		["text"] = "Before, those lazy-ass aboris would get hanged without questions. Now all they get are favors - a 12-hour workday, and he even allows them to sleep in the fort.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 1;
		["connectID"] = 57;
		["posX"] = 1530;
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
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 1980;
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
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 1980;
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
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 1980;
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
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 1980;
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
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 1980;
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
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 1980;
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
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 2;
		["posX"] = 2670;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["switch_00002"] = {
		["ID"] = 2;
		["connectionsID"] = {
			[1] = 3;
			[2] = 4;
		};
		["posX"] = 330;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00008"] = {
		["ID"] = 8;
		["connectionsID"] = {
			[1] = 9;
			[2] = 10;
		};
		["posX"] = 1380;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00011"] = {
		["ID"] = 11;
		["connectionsID"] = {
			[1] = 13;
			[2] = 12;
		};
		["posX"] = 960;
		["posY"] = 360;
		["type"] = "switch";
	};
	["switch_00022"] = {
		["ID"] = 22;
		["connectionsID"] = {
			[1] = 23;
			[2] = 25;
		};
		["posX"] = 2490;
		["posY"] = 240;
		["type"] = "switch";
	};
	["switch_00036"] = {
		["ID"] = 36;
		["connectionsID"] = {
			[1] = 31;
			[2] = 53;
			[3] = 34;
			[4] = 42;
			[5] = 38;
			[6] = 33;
			[7] = 39;
		};
		["h"] = 180;
		["posX"] = 1380;
		["posY"] = 1140;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00057"] = {
		["ID"] = 57;
		["connectionsID"] = {
			[1] = 60;
			[2] = 55;
			[3] = 56;
			[4] = 54;
			[5] = 58;
			[6] = 59;
		};
		["h"] = 160;
		["posX"] = 1770;
		["posY"] = 1110;
		["type"] = "switch";
		["w"] = 100;
	};
}
return obj1
