-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "Old Outcast I saved is ready to make me a new attire if I bring him 2 cloth rags.";
	["hidden"] = false;
	["logs"] = {
		["Finish"] = "The old guy made me some really primitive tunic and boots. Thanks for that, but I have to find something better soon.";
	};
	["nodes"] = {
		["condition_00000"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = 90;
			["posY"] = 150;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00004"] = {
			["ID"] = 4;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 480;
			["posY"] = 90;
			["script"] = "function Condition:onCheck(name, obj)\
   removeItemFromPlayer(\"cloth.itm\", self.clothReq)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "old_outcast_give_cloth";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00006"] = {
			["ID"] = 6;
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
		["condition_00007"] = {
			["ID"] = 7;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = 90;
			["posY"] = 300;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"start\", false)\
   self:setTopicVisible(\"old_outcast_get_cloth\", false)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "skip";
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
				[1] = 6;
			};
			["name"] = "start";
			["posX"] = 360;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:setTopicVisible(\"skip\", true)\
   self:setTopicVisible(\"start\", true)\
   self:setTopicVisible(\"old_outcast_get_cloth\", true)\
   self:setTopicVisible(\"old_outcast_give_cloth\", true)\
   self:setTopicVisible(\"old_outcast_got_cloth\", true) --is hidden by give_cloth\
   self:setTopicVisible(\"finish\", true)\
   self:setTopicVisible(\"old_outcast_real_bushman\", false)\
   self:declareVar(\"clothReq\", 2)\
end\
\
function Quest:onStart()\
   self:setTopicVisible(\"start\", false)\
end\
\
function Quest:onFinish()\
   local player = getMC()\
   local pTop = player:getInventory():getSlotItem(\"top\")\
   local pBottom = player:getInventory():getSlotItem(\"bottom\")\
   local top = addItemToPlayer(\"junk_top_1.itm\")\
   local bottom = addItemToPlayer(\"junk_legs_1.itm\")\
   if not pTop then\
      equipItemForPlayer(\"junk_top_1.itm\", \"top\", false)\
   end\
   if not pBottom then\
      equipItemForPlayer(\"junk_legs_1.itm\", \"bottom\", false)\
   end\
   if not pTop or not pBottom then\
      player.animationsManager:playAction(\"idle_arms_on_hips\")\
   end\
   self:setTopicVisible(\"old_outcast_get_cloth\", false)\
   self:setTopicVisible(\"old_outcast_real_bushman\", true)\
end\
\
\
function Quest:getTopicVisible_old_outcast_give_cloth()\
   return hasPlayerItem(\"cloth.itm\", self.clothReq)\
end\
\
function Quest:getTopicVisible_old_outcast_real_bushman()\
   local player = getMC()\
   local top = player:getInventory():getSlotItem(\"top\")\
   local bottom = player:getInventory():getSlotItem(\"bottom\")\
   return top and top:getItemName():find(\"junk\")\
          or bottom and bottom:getItemName():find(\"junk\") \
end\
\
function Quest:getTopicVisible_skip()\
   local player = getMC()\
   local top = player:getInventory():getSlotItem(\"top\")\
   local bottom = player:getInventory():getSlotItem(\"bottom\")\
   return top ~= nil and bottom ~= nil\
end";
	["title"] = "Aborigine Armor";
}
return obj1
