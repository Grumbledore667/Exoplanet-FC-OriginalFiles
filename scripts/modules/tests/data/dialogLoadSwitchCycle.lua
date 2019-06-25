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
		["actor"] = 1;
		["connectID"] = 1;
		["posX"] = 720;
		["posY"] = 240;
		["script"] = "";
		["text"] = "message 1";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["posX"] = 720;
		["posY"] = 360;
		["script"] = "";
		["text"] = "message 2";
		["time"] = 2;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 2;
			[2] = 3;
		};
		["name"] = "2switch";
		["posX"] = 570;
		["posY"] = 300;
		["type"] = "switch";
	};
}
return obj1
