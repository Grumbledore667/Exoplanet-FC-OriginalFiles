-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 2;
		["connectID"] = 33;
		["posX"] = 720;
		["posY"] = 270;
		["script"] = "";
		["text"] = "";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["posX"] = 1170;
		["posY"] = 390;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 1;
		["posX"] = 1170.5;
		["posY"] = 150.5;
		["script"] = "function message:onStart()\13\
end\
\
function message:onStop()\13\
   self:startTrade()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "\\[TRADE]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["switch_00033"] = {
		["ID"] = 33;
		["connectionsID"] = {
			[1] = 32;
			[2] = 8;
		};
		["posX"] = 990;
		["posY"] = 270;
		["type"] = "switch";
	};
}
return obj1
