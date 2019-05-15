-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 2;
		["posX"] = 480;
		["posY"] = 210;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 4;
		["posX"] = 750;
		["posY"] = 210;
		["script"] = "";
		["text"] = "It looks like a transformer. Without it, the crane engines won't be getting enough power from the system. I could try fixing it using what I have at hand, but there's no guarantee it'll work.";
		["time"] = 19;
		["topic"] = "broken_crane:transformer";
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["connectID"] = 7;
		["posX"] = 1170;
		["posY"] = 120;
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
		["text"] = "Fix using Electric Scrap (9) and Electrical Tape (2).";
		["time"] = 7;
		["topic"] = "broken_crane:broken_crane_object_repair";
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["posX"] = 1170;
		["posY"] = 270;
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
		["text"] = "Leave.";
		["time"] = 1.5;
		["topic"] = "broken_crane:broken_crane_object_repair";
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 2;
		["posX"] = 1590;
		["posY"] = 60;
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
		["text"] = "The transformer starts humming evenly.";
		["time"] = 4;
		["topic"] = "broken_crane:self_repair_transformer";
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 1;
		["posX"] = 1590;
		["posY"] = 180;
		["script"] = "";
		["text"] = "Not enough resources.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["switch_00004"] = {
		["ID"] = 4;
		["connectionsID"] = {
			[1] = 5;
			[2] = 6;
		};
		["posX"] = 1020;
		["posY"] = 210;
		["type"] = "switch";
	};
	["switch_00007"] = {
		["ID"] = 7;
		["connectionsID"] = {
			[1] = 8;
			[2] = 9;
		};
		["posX"] = 1440;
		["posY"] = 120;
		["type"] = "switch";
	};
}
return obj1
