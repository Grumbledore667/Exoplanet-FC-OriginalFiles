-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "I'll keep here a list of all landmarks that are worthy of visiting again.";
	["hidden"] = false;
	["nodes"] = {
		["finish"] = {
			["ID"] = 2;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 520;
			["posY"] = 300;
			["script"] = "";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 2;
			};
			["name"] = "start";
			["posX"] = 300;
			["posY"] = 300;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   runTimer(0, self, function() getPlayer():stopSound(\"quest_start.wav\") end, false)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onStart()\
end\
\
function Quest:onFinish()\
end\
\
";
	["title"] = "Travel Destinations";
}
return obj1
