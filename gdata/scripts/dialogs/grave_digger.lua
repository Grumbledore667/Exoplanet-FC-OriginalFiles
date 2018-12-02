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
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 2;
		["animation"] = "dl_hand_negative";
		["posX"] = 750;
		["posY"] = 150;
		["script"] = "local random = require \"random\"\
function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return random.random(0, 10) > 6\
end\
\
";
		["text"] = "Stop rummaging around, huma! Show some respect for the dead!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["posX"] = 750;
		["posY"] = 300;
		["script"] = "local random = require \"random\"\
function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return random.random(0, 10) > 5\
end\
\
";
		["text"] = "This is not how our ancestors were sending the dead to the Gods-in-Earth. No songs, no parting gifts, no feast, no grave in the deepest burial cave. But it's all we can do now... Pray with us, huma, so their souls will find a way to the Om'tana Ragga.";
		["time"] = 25.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["posX"] = 750;
		["posY"] = 450;
		["script"] = "";
		["text"] = "The best ones die first: Om'tana Ragga have decided to give them well deserved rest. We aren't worthy to meet them yet. We must live and endure, before our time comes.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 2;
			[2] = 3;
			[3] = 4;
		};
		["posX"] = 600;
		["posY"] = 300;
		["type"] = "switch";
	};
}
local obj2 = {
	["actor_prefab"] = {
		[2] = "abori";
	};
}
return obj1 ,obj2
