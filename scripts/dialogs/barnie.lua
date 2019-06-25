-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 1;
		["connectID"] = 15;
		["posX"] = -630;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Hi...";
		["time"] = 2;
		["topic"] = "to_fort:guards_start";
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 2;
		["connectID"] = 16;
		["posX"] = 180;
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
		["text"] = "Trying to enter the fort? No pass will be granted to strange drifters!";
		["time"] = 7.5;
		["topic"] = "to_fort:guards_bad_attire";
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["posX"] = -870;
		["posY"] = 240;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 2;
		["connectID"] = 14;
		["posX"] = -240;
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
		["time"] = 2;
		["topic"] = "to_fort:guards_check_attire";
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = -240;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "You can pass, you're fine.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 2;
		["posX"] = 180;
		["posY"] = 360;
		["script"] = "";
		["text"] = "A stranger, but a respectable one. Welcome.";
		["time"] = 1.5;
		["topic"] = "to_fort:finish";
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["connectID"] = 13;
		["posX"] = -1290;
		["posY"] = 300;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 2;
		["posX"] = 420;
		["posY"] = 240;
		["script"] = "";
		["text"] = "You can try to come to agreement with other guards though, I personally don't need any trouble.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 1;
		["connectID"] = 1;
		["posX"] = -870;
		["posY"] = 360;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 420;
		["posY"] = 660;
		["script"] = "";
		["text"] = "The upper floor of the main building is his place. If he isn't in the room he's probably smoking on the balcony.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 630;
		["posY"] = 1260;
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
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 660;
		["posY"] = 1770;
		["script"] = "";
		["text"] = "Before, those lazy-ass aboris would get hanged without questions. Now all they get are favors - a 12-hour workday, and he even allows them to sleep in the fort.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 1350;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 420;
		["posY"] = 1650;
		["script"] = "";
		["text"] = "No way. Soldiers are drafted. We're mercenaries. They pay us - we fight for them. Or not - that also has its price.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["connectID"] = 22;
		["posX"] = 180;
		["posY"] = 1650;
		["script"] = "";
		["text"] = "So you're a soldier?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 630;
		["posY"] = 1380;
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
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 630;
		["posY"] = 1140;
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
		["time"] = 1;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 630;
		["posY"] = 780;
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
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["connectID"] = 39;
		["posX"] = 180;
		["posY"] = 1110;
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
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 630;
		["posY"] = 1020;
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
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 630;
		["posY"] = 900;
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
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = 180;
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
		["posX"] = 180;
		["posY"] = 1890;
		["script"] = "";
		["text"] = "Do you have any tips?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 1;
		["connectID"] = 42;
		["posX"] = 180;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "What are you doing here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 2;
		["connectID"] = 40;
		["posX"] = 420;
		["posY"] = 1890;
		["script"] = "";
		["text"] = "Pal, if life didn't give you enough tips by now, what chances do I have?";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 1;
		["connectID"] = 41;
		["posX"] = 180;
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
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 1;
		["posX"] = 180;
		["posY"] = 2010;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00040"] = {
		["ID"] = 40;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 660;
		["posY"] = 1890;
		["script"] = "";
		["text"] = "Always keep in mind, that on this shithole of a planet there are two kind of creatures: those with loaded guns, and those who dig. It goes without saying, which ones have it better.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 2;
		["connectID"] = 20;
		["posX"] = 420;
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
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 420;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "We're stuck here like zits on an arse, waiting till someone comes and pops us.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["switch_00013"] = {
		["ID"] = 13;
		["connectionsID"] = {
			[1] = 6;
			[2] = 17;
		};
		["posX"] = -1020;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00014"] = {
		["ID"] = 14;
		["connectionsID"] = {
			[1] = 4;
			[2] = 11;
		};
		["posX"] = 30;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00015"] = {
		["ID"] = 15;
		["connectionsID"] = {
			[1] = 7;
			[2] = 10;
		};
		["posX"] = -390;
		["posY"] = 360;
		["type"] = "switch";
	};
	["switch_00036"] = {
		["ID"] = 36;
		["connectionsID"] = {
			[1] = 32;
			[2] = 28;
			[3] = 34;
			[4] = 23;
			[5] = 37;
			[6] = 33;
			[7] = 38;
		};
		["h"] = 180;
		["posX"] = 30;
		["posY"] = 1140;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00039"] = {
		["ID"] = 39;
		["connectionsID"] = {
			[1] = 27;
			[2] = 31;
			[3] = 29;
			[4] = 25;
			[5] = 19;
			[6] = 24;
		};
		["h"] = 160;
		["posX"] = 420;
		["posY"] = 1080;
		["type"] = "switch";
		["w"] = 100;
	};
}
return obj1
