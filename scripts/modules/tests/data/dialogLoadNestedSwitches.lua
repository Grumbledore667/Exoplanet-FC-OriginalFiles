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
		["posX"] = 900;
		["posY"] = 150;
		["script"] = "";
		["text"] = "message 1";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["posX"] = 900;
		["posY"] = 270;
		["script"] = "";
		["text"] = "message 2";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 2;
		["connectID"] = 7;
		["posX"] = 750;
		["posY"] = 450;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["posX"] = 1080;
		["posY"] = 390;
		["script"] = "";
		["text"] = "message 3";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 1;
		["posX"] = 1080;
		["posY"] = 510;
		["script"] = "";
		["text"] = "message 4";
		["time"] = 2;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 6;
			[2] = 5;
		};
		["name"] = "2switch";
		["posX"] = 570;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00006"] = {
		["ID"] = 6;
		["connectionsID"] = {
			[1] = 2;
			[2] = 3;
		};
		["posX"] = 750;
		["posY"] = 210;
		["type"] = "switch";
	};
	["switch_00007"] = {
		["ID"] = 7;
		["connectionsID"] = {
			[1] = 8;
			[2] = 9;
		};
		["posX"] = 930;
		["posY"] = 450;
		["type"] = "switch";
	};
}
return obj1
