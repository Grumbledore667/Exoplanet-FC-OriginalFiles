-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "A list of survival hints.";
	["hidden"] = false;
	["nodes"] = {
		["condition_00001"] = {
			["ID"] = 1;
			["connectionsID"] = {
				[1] = 0;
			};
			["event"] = "trigger_in";
			["posX"] = 360;
			["posY"] = 330;
			["script"] = "function Condition:onCheck(obj)\
   if stringx.startswith(string.lower(obj:getName()), \"tutorial_\") then\
      if obj.contents then\
         runTimer(0, {self=self, txt=obj.contents}, function(args) args.self:writeLog(args.txt) end, false)\
      end\
      return true\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "*";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00004"] = {
			["ID"] = 4;
			["connectionsID"] = {
				[1] = 2;
			};
			["event"] = "trigger_in";
			["posX"] = 870;
			["posY"] = 330;
			["script"] = "function Condition:onCheck(obj)\
   if stringx.startswith(string.lower(obj:getName()), \"tutorial_\") then\
      if obj.contents then\
         self:writeLog(obj.contents)\
      end\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "*";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 2;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 1140;
			["posY"] = 360;
			["script"] = "";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 4;
			};
			["name"] = "start";
			["posX"] = 630;
			["posY"] = 360;
			["script"] = "";
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
	["title"] = "Survival Guide";
}
return obj1
