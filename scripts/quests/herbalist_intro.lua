-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "";
	["group_indices"] = {
	};
	["hidden"] = true;
	["nodes"] = {
		["at_cave"] = {
			["ID"] = 4;
			["connectionsID"] = {
				[1] = 2;
			};
			["name"] = "at_cave";
			["posX"] = 780;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local abori = self.objects.herbalist\
   abori:setState(\"talkForbidden\", false)\
   abori:setIgnoreSleep(false)\
   abori.navigator:setPatrolConvoyObj(nil)\
\
   self:setTopicVisible(\"herbalist_finish\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["condition_00000"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = -510;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "herbalist_start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00002"] = {
			["ID"] = 2;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 1020;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "herbalist_finish";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00005"] = {
			["ID"] = 5;
			["connectionsID"] = {
				[1] = 4;
			};
			["event"] = "trigger_in";
			["posX"] = 510;
			["posY"] = 240;
			["script"] = "function Condition:onCheck(name, obj)\
   if self.objects.herbalist:isInTrigger(obj) then\
      return true\
   end\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:herbalist_cave_wp";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00007"] = {
			["ID"] = 7;
			["connectionsID"] = {
				[1] = 6;
			};
			["event"] = "discuss";
			["posX"] = 0;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "herbalist_give_staff";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 1290;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["gave_staff"] = {
			["ID"] = 6;
			["connectionsID"] = {
				[1] = 5;
			};
			["name"] = "gave_staff";
			["posX"] = 270;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local abori = self.objects.herbalist\
   abori:setDefaultAnimation(\"polearm_idle_hurt\")\
   abori:setState(\"talkForbidden\", true)\
   abori:setIgnoreSleep(true)\
   abori.navigator:setRunPatrol(true)\
   abori.navigator:setPatrolRoute(self.groups.herbalist_cave_wps)\
   abori.navigator:setPatrolConvoyObj(getMC())\
\
   abori:setupAppearance(\"herbalist_staff\")\
   abori:setDialogAnimationAllowed(false)\
\
   giveItemFromPlayerTo(\"herbalist_staff.itm\", abori, 1)\
\
   self:setTopicVisible(\"herbalist_about_staff\", false)\
   self:setTopicVisible(\"herbalist_give_staff\", false)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 1;
			["connectionsID"] = {
				[1] = 7;
			};
			["name"] = "start";
			["posX"] = -240;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   getScene():subscribeOnLocationEnter(self.onLocationEnter, self)\
end\
\
function Quest:onLocationEnter()\
   if #self.groups.herbalist_cave_wps == 0 then return end\
   self:declareVar(\"herbalist_cave_wp\", self.groups.herbalist_cave_wps[#self.groups.herbalist_cave_wps]:getName())\
end\
\
function Quest:onStart()\
   self:setTopicVisible(\"herbalist_start\", false)\
   self:setTopicVisible(\"herbalist_about_staff\", true)\
   self:setTopicVisible(\"herbalist_give_staff\", true)\
end\
\
function Quest:onFinish()\
   self:setTopicVisible(\"herbalist_finish\", false)\
end\
\
function Quest:getTopicVisible_herbalist_give_staff()\
   return hasPlayerItem(\"herbalist_staff.itm\")\
end\
\
";
	["title"] = "";
	["topics"] = {
		[1] = {
			["log_id"] = "";
			["name"] = "herbalist_start";
			["single_use"] = true;
			["visible"] = true;
		};
		[2] = {
			["log_id"] = "";
			["name"] = "herbalist_about_staff";
			["single_use"] = false;
			["visible"] = false;
		};
		[3] = {
			["log_id"] = "";
			["name"] = "herbalist_give_staff";
			["single_use"] = true;
			["visible"] = false;
		};
		[4] = {
			["log_id"] = "";
			["name"] = "herbalist_finish";
			["single_use"] = true;
			["visible"] = false;
		};
	};
	["variables"] = {
		[1] = {
			["icon"] = "";
			["kind"] = "object";
			["name"] = "herbalist";
			["value"] = "herbalist";
		};
		[2] = {
			["icon"] = "G";
			["kind"] = "group";
			["name"] = "herbalist_cave_wps";
			["value"] = "q_herbalist_intro_herbalist_cave_wps";
		};
	};
}
return obj1
