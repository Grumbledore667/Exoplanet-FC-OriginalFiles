-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 2;
		["posX"] = 450;
		["posY"] = 210;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 3;
		["posX"] = 720;
		["posY"] = 210;
		["script"] = "";
		["text"] = "This thing could use a new circuit breaker instead of the busted one.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["connectID"] = 8;
		["posX"] = 1140;
		["posY"] = 150;
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
		["text"] = "Install a new circuit breaker.";
		["time"] = 3;
		["topic"] = "broken_crane:broken_crane_object_repair";
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["posX"] = 1140;
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
		["text"] = "Leave.";
		["time"] = 1.5;
		["topic"] = "broken_crane:broken_crane_object_repair";
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["posX"] = 1560;
		["posY"] = 210;
		["script"] = "";
		["text"] = "I don't have it.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 2;
		["posX"] = 1560;
		["posY"] = 90;
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
		["text"] = "Now the wires won't catch fire after surges.";
		["time"] = 5;
		["topic"] = "broken_crane:self_repair_board";
		["type"] = "message";
	};
	["switch_00003"] = {
		["ID"] = 3;
		["connectionsID"] = {
			[1] = 4;
			[2] = 5;
		};
		["posX"] = 990;
		["posY"] = 210;
		["type"] = "switch";
	};
	["switch_00008"] = {
		["ID"] = 8;
		["connectionsID"] = {
			[1] = 7;
			[2] = 6;
		};
		["posX"] = 1410;
		["posY"] = 150;
		["type"] = "switch";
	};
}
return obj1
