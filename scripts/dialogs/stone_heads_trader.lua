-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 2;
		["connectID"] = 33;
		["posX"] = 682.999023438;
		["posY"] = 268.250976562;
		["script"] = "";
		["text"] = "";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["posX"] = 1192.4990234375;
		["posY"] = 336.7509765625;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 1;
		["posX"] = 1193.4990234375;
		["posY"] = 203.7509765625;
		["script"] = "function message:onStart()\
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
		["posX"] = 981.999023438;
		["posY"] = 265.250976562;
		["type"] = "switch";
	};
}
return obj1
