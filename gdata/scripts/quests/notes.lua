-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "I'll just write down all kinds of noteworthy information here.";
	["hidden"] = true;
	["nodes"] = {
		["condition_00003"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 300;
			["posY"] = 40;
			["script"] = "function Condition:onCheck(obj)\
   self:writeLog(\"In a cozy cave near Outpost 74 lives a friendly cannibal that goes by the name 'Mister Green'. This fellow's a real connosieur and loves to conduct various culinary experiments. He said that if I bring him exotic ingredients for his cooking, he will reward me with some useful stuff.\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "mrgreen";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 2;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 740;
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
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
end\
\
function Quest:onStart()\
   runTimer(0, self, function(self) self.hidden = false end, false)\
end\
\
function Quest:onFinish()\
end\
\
";
	["title"] = "Notes";
}
return obj1
