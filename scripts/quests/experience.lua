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
			["event"] = "dead";
			["posX"] = 450;
			["posY"] = 120;
			["script"] = "function Condition:onCheck(name, obj)\
   if obj and (obj.killer == getPlayer() or obj.killer == getMC()) then\
      local reward = 0\
      if obj.getScriptClass then\
         local class = obj:getScriptClass()\
         if class == \"CBandit\" then\
            if obj:getPrefabName() == \"human_male.cfg\" then\
               reward = self.banditHuma\
            elseif obj:getPrefabName() == \"abori.cfg\" then\
               reward = self.banditAbori\
            end\
         elseif class == \"CCrucas\" or class == \"CCrucasEating\" then\
            reward = self.crucas\
         elseif class == \"CCrucasWeak\" then\
            reward = self.crucas - 25\
         elseif class == \"CKabarog\" then\
            reward = self.hornhog\
         elseif class == \"CKabarogWeak\" then\
            reward = self.hornhog - 100\
         elseif class == \"CBug\" then\
            reward = self.bug\
         elseif class == \"CBugGreen\" then\
            reward = self.bugGreen\
         elseif class == \"CSwiftStrider\" then\
            reward = self.swiftStrider\
         end\
         \
         --log(string.format(\"%s died, getting %d experience!\", class, reward))\
         if reward > 0 then\
            getPlayer():addExp(reward * getGlobalParam(\"expKillMultiplier\"))\
         end\
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
			["posX"] = 630;
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
   self:declareVar(\"banditHuma\", 200)\
   self:declareVar(\"banditAbori\", 200)\
   self:declareVar(\"crucas\", 100)\
   self:declareVar(\"hornhog\", 250)\
   self:declareVar(\"bug\", 50)\
   self:declareVar(\"swiftStrider\", 50)\
   self:declareVar(\"bugGreen\", 50)\
   self:start()\
end\
\
function Quest:onStart()\
end\
\
function Quest:onFinish()\
end\
\
";
	["title"] = "Experience";
}
return obj1
