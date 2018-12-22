-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "";
	["hidden"] = true;
	["nodes"] = {
		["condition_00003"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["event"] = "read";
			["posX"] = 450;
			["posY"] = 30;
			["script"] = "function Condition:onCheck(obj)\
   if obj then\
      local name = obj:getItemName()\
      if name and not self:getParam(name) then\
         if name == \"miner_journal.itm\" then\
            local sm = getPlayer().skillsManager\
            if sm:get( \"mining\" ) < 20 then\
               sm:set( \"mining\", 20 )\
            else\
               sm:inc( \"mining\", 5 )\
            end\
            getPlayer():addExp(getGlobalParam(\"expReading\") + 100)\
         else\
            getPlayer():addExp(getGlobalParam(\"expReading\"))\
         end\
         self:setParam(name, true)\
      end\
   end\
   return false\
end\
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
			["posX"] = 600;
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
   runTimer(0, nil, function() self:start() end, false)\
end\
\
function Quest:onStart()\
end\
\
function Quest:onFinish()\
end\
\
";
	["title"] = "Readables";
}
return obj1
