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
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 1;
		["connectID"] = 4;
		["posX"] = 570;
		["posY"] = 300;
		["script"] = "";
		["text"] = "The wires look like they were arranged by a suicidal maniac. It'll catch fire if no one fixes it.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 7;
		["posX"] = 990;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Fix using Electrical Tape (1).";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 2;
		["posX"] = 1410;
		["posY"] = 150;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"broken_crane\", \"crane_wiring_repair\")\
end\
\
";
		["text"] = "The wires stop producing sparks.";
		["time"] = 3.5;
		["topic"] = "broken_crane:crane_wiring_repair";
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["posX"] = 990;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Leave.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["posX"] = 1410;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Not enough resources.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["switch_00004"] = {
		["ID"] = 4;
		["connectionsID"] = {
			[1] = 2;
			[2] = 5;
		};
		["posX"] = 840;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00007"] = {
		["ID"] = 7;
		["connectionsID"] = {
			[1] = 3;
			[2] = 6;
		};
		["posX"] = 1260;
		["posY"] = 210;
		["type"] = "switch";
	};
}
return obj1
