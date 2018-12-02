-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 12;
		["posX"] = 300;
		["posY"] = 300;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 2;
		["posX"] = 750;
		["posY"] = 120;
		["script"] = "local random = require \"random\"\
function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return random.random(0, 6) > 5\
end\
\
";
		["text"] = "The Sacrifice... We must do it! It will save us!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 2;
		["connectID"] = 10;
		["posX"] = 750;
		["posY"] = 270;
		["script"] = "local random = require \"random\"\
function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return random.random(0, 6) > 4\
end\
\
";
		["text"] = "Don't hold onto this life, huma, for it is impossible to keep.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 2;
		["connectID"] = 11;
		["posX"] = 750;
		["posY"] = 420;
		["script"] = "local random = require \"random\"\
function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return random.random(0, 6) > 3\
end\
\
";
		["text"] = "Ah, it hurts so much!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["posX"] = 990;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Prepare yourself to pass the judgement in the world beyond - this is our only hope.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 2;
		["posX"] = 990;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Gods-in-the-Earth are testing me! I will never turn my back on them! I will prove them my worth!";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["posX"] = 750;
		["posY"] = 570;
		["script"] = "local random = require \"random\"\
function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return random.random(0, 6) > 2\
end\
\
";
		["text"] = "Pain...";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 2;
		["connectID"] = 15;
		["posX"] = 750;
		["posY"] = 720;
		["script"] = "local random = require \"random\"\
function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return random.random(0, 6) > 1\
end\
\
";
		["text"] = "No matter what you believe in or if you don't, Gods-in-the-Earth will forever stay in power!";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["posX"] = 990;
		["posY"] = 720;
		["script"] = "";
		["text"] = "Praise the Gods and serve them! Or you will doom yourself and everyone around you! Then you will regret your arrogance for the whole eternity!";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 2;
		["posX"] = 750;
		["posY"] = 870;
		["script"] = "";
		["text"] = "Open your eyes! Go to the Altar and perform the Ritual before it's too late!";
		["time"] = 8.5;
		["type"] = "message";
	};
	["switch_00012"] = {
		["ID"] = 12;
		["connectionsID"] = {
			[1] = 2;
			[2] = 3;
			[3] = 4;
			[4] = 13;
			[5] = 14;
			[6] = 16;
		};
		["h"] = 160;
		["posX"] = 570;
		["posY"] = 270;
		["type"] = "switch";
		["w"] = 100;
	};
}
local obj2 = {
	["actor_prefab"] = {
		[2] = "abori";
	};
}
return obj1 ,obj2
