-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 450;
		["posY"] = 330;
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
		["text"] = "Welcome to my humble shop, stranger! Weed, booze and other joyful substances - only the best and the freshest. Choose to your liking!";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 1;
		["connectID"] = 2;
		["posX"] = 720;
		["posY"] = 330;
		["script"] = "";
		["text"] = "So you're just straight up drug dealing here? But what about the authorities?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = 990;
		["posY"] = 330;
		["script"] = "";
		["text"] = "What about them? I pay taxes! Relax spacer, this is K'Tharsis. As long as those in power get their share - nobody's going to care about what kind of poison you numb youself with.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["posX"] = 1440;
		["posY"] = 420;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   self:startTrade()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "\\[TRADE]";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["posX"] = 1440;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Alright, bye.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = 720;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Greetings!";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 2;
		["connectID"] = 9;
		["posX"] = 30;
		["posY"] = 510;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 0;
		["type"] = "message";
	};
	["switch_00004"] = {
		["ID"] = 4;
		["connectionsID"] = {
			[1] = 5;
			[2] = 6;
		};
		["posX"] = 1290;
		["posY"] = 480;
		["type"] = "switch";
	};
	["switch_00009"] = {
		["ID"] = 9;
		["connectionsID"] = {
			[1] = 0;
			[2] = 7;
		};
		["posX"] = 300;
		["posY"] = 510;
		["type"] = "switch";
	};
}
return obj1
