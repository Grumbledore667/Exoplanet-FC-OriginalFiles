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
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 9;
		["posX"] = 782.000244141;
		["posY"] = 144.500015259;
		["script"] = "";
		["text"] = "How's it going?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 10;
		["posX"] = 787.000305176;
		["posY"] = 245;
		["script"] = "";
		["text"] = "What's this place?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["connectID"] = 11;
		["posX"] = 784.000244141;
		["posY"] = 347.5;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"mines\")\
end\
\
";
		["text"] = "You've worked the mines?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["connectID"] = 12;
		["posX"] = 785.000305176;
		["posY"] = 452.5;
		["script"] = "";
		["text"] = "Who's in charge here?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["connectID"] = 13;
		["posX"] = 779.250305176;
		["posY"] = 559.25;
		["script"] = "";
		["text"] = "Do you have any tips?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 1;
		["posX"] = 771.000305176;
		["posY"] = 663;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1048.00024414;
		["posY"] = 137.500015259;
		["script"] = "function message:onStart()\
   self:setParam(\"mines\", true)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "The life in the mines was really tough. It's easier out here, we can finally see the sunlight, but finding food is hard, and there is always a risk of being found.";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1048.00024414;
		["posY"] = 246.5;
		["script"] = "";
		["text"] = "A hole in the rock, that's what it is. At least it shields us from the sun and crucasses won't bite off your leg at night.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1051.00024414;
		["posY"] = 349.5;
		["script"] = "";
		["text"] = "Cursed antigravium dust makes you puke out your own lungs after a couple of months.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1046.00024414;
		["posY"] = 452.5;
		["script"] = "";
		["text"] = "Old Mug. He was our chief in the mines too. If it wasn't for him we would still be rotting deep in the mines.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1040.00024414;
		["posY"] = 559.5;
		["script"] = "";
		["text"] = "Tips? Well, keep your gunpowder dry and have a gun nearby, or else you'll end up as a bitebug food very soon.";
		["time"] = 12;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 2;
			[2] = 3;
			[3] = 4;
			[4] = 5;
			[5] = 6;
			[6] = 7;
		};
		["posX"] = 600;
		["posY"] = 300;
		["type"] = "switch";
	};
}
return obj1
