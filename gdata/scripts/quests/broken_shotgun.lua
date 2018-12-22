-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "";
	["hidden"] = true;
	["nodes"] = {
		["condition_00000"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "get";
			["posX"] = 90;
			["posY"] = 480;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "broken_shotgun.itm";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00002"] = {
			["ID"] = 2;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 600;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "finish";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00004"] = {
			["ID"] = 4;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = 120;
			["posY"] = 90;
			["script"] = "function Condition:onCheck(obj)\
   self:setParam(\"discount\", self:getParam(\"discount\") + 1)\
   removeBoozeFromPlayer( 1 )\
   getPlayer():addExp(100)\
   self.q:setParam(\"gave_booze\", true)\
   self:setTopicVisible(\"vasily_give_drink\", false)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "vasily_give_drink";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00005"] = {
			["ID"] = 5;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = -150;
			["posY"] = 240;
			["script"] = "function Condition:onCheck(obj)\
   self:setTopicVisible(\"vasily_give_drink\", true)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "vasily_gotta_drink";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00008"] = {
			["ID"] = 8;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 120;
			["posY"] = -60;
			["script"] = "function Condition:onCheck(obj)\
   self:setParam(\"discount\", self:getParam(\"discount\") + 1)\
   removeBoozeFromPlayer( 1 )\
   getPlayer():addExp(100)\
   self.q:setParam(\"gave_booze\", true)\
   self:setTopicVisible(\"vasily_give_drink\", false)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "vasily_give_drink";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00009"] = {
			["ID"] = 9;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -150;
			["posY"] = 90;
			["script"] = "function Condition:onCheck(obj)\
   self:setTopicVisible(\"vasily_give_drink\", true)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "vasily_gotta_drink";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 870;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 1;
			["connectionsID"] = {
				[1] = 2;
			};
			["name"] = "start";
			["posX"] = 360;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:declareVar(\"shotgun_fix_price\", 300)\
   self:setParam(\"gave_booze\", false)\
   self:setParam(\"discount\", 0)\
   self:setTopicVisible(\"vasily_gotta_drink\", true)\
   self:setTopicVisible(\"vasily_give_drink\", false)\
   self:setTopicVisible(\"vasily_ask_shotgun\", false)\
   self:setTopicVisible(\"vasily_can_fix_shotgun\", false) --activated after giving him the toolbox\
   self:setTopicVisible(\"finish\", true)\
end\
\
function Quest:onStart()\
   self:setTopicVisible(\"vasily_ask_shotgun\", true)\
end\
\
function Quest:onFinish()\
   local price = self.shotgun_fix_price - self:getParam(\"discount\") * 150\
   removeItemFromPlayer(\"broken_shotgun.itm\")\
   if price > 0 then\
      removeItemFromPlayer(\"antigravium_shards.itm\", price)\
   end\
   addItemToPlayer(\"shotgun.gun\")\
end\
\
function Quest:getTopicVisible_vasily_give_drink()\
   return hasPlayerBooze( 1 )\
end\
\
function Quest:getTopicVisible_vasily_ask_shotgun()\
   return hasPlayerItem( \"broken_shotgun.itm\" )\
end\
\
function Quest:getTopicVisible_vasily_can_fix_shotgun()\
   return hasPlayerItem( \"broken_shotgun.itm\" )\
end\
\
function Quest:getTopicVisible_finish()\
   local price = self.shotgun_fix_price - self:getParam(\"discount\") * 150\
   if price > 0 then\
      if hasPlayerItemCount(\"antigravium_shards.itm\", price) then\
         return true\
      end\
   else\
      return true\
   end\
   return false\
end";
	["title"] = "Broken Shotgun";
}
return obj1
