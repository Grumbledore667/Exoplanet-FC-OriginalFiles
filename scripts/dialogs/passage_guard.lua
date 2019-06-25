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
		["connectID"] = 1;
		["posX"] = 1020;
		["posY"] = 180;
		["script"] = "";
		["text"] = "No. The scan shows you don't have an ID chip. Move along, pal, the pass to the town is closed for you.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1020;
		["posY"] = 300;
		["script"] = "";
		["text"] = "You don't know that? Where did you come from, lunatic? Lost your mind in the desert? Anyways, I don't have time for chit-chat with outlanders.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1020;
		["posY"] = 420;
		["script"] = "";
		["text"] = "You're still a human... so I won't shoot you dead. Just gonna make you gather your teeth from the ground. Now get lost, drifter!";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["connectID"] = 2;
		["posX"] = 750;
		["posY"] = 180;
		["script"] = "";
		["text"] = "Can you let me through?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["connectID"] = 3;
		["posX"] = 750;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Where does this path lead?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["connectID"] = 4;
		["posX"] = 750;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Hey, what if I will try to make my way with force?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 1;
		["posX"] = 750;
		["posY"] = 540;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 5;
			[2] = 6;
			[3] = 8;
			[4] = 9;
		};
		["posX"] = 600;
		["posY"] = 300;
		["type"] = "switch";
	};
}
return obj1
