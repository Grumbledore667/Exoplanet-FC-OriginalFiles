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
		["posX"] = 750;
		["posY"] = 180;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return rand(10) > 6\
end\
\
";
		["text"] = "Leave us be, stranger.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 2;
		["posX"] = 750;
		["posY"] = 300;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return rand(10) > 5\
end\
\
";
		["text"] = "We don't have words for you, outlander.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 2;
		["posX"] = 750;
		["posY"] = 420;
		["script"] = "";
		["text"] = "This mouth is closed for you.";
		["time"] = 4;
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
return obj1
