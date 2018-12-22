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
		["time"] = 1;
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
		["time"] = 1;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
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
		["text"] = "[t_to_fort:drago_bad_attire]We don't let your kind in here. Go away!";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["posX"] = 1530;
		["posY"] = 360;
		["script"] = "";
		["text"] = "[t_to_fort:finish]A well-dressed traveller is always welcome.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["posX"] = 1110;
		["posY"] = 420;
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
		["text"] = "[t_to_fort:drago_check_attire]Hey!";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 1;
		["connectID"] = 11;
		["posX"] = 720;
		["posY"] = 360;
		["script"] = "";
		["text"] = "[t_to_fort:drago_start]Hello there...";
		["time"] = 2;
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
}
return obj1
