-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "There is a human fort in the northern part of this area. This fort should offer some opportunities for earning cash and gearing up. The search for my highjacked spaceship should start there as well, so I've got to reach this outpost of the human civilization as soon as possible. And not to kick the bucket on the way. Finding a map and asking the locals about the road there should be a good idea.";
	["hidden"] = false;
	["logs"] = {
		["BadAttire"] = "The fort's guard checked me from head to toe but didn't let me in. They don't want to see dirty drifters inside the perimeter, he said. To enter the fort I have to get some decent clothes first.";
		["Finish"] = "I've reached the fort. Finally I'm back to civilization.";
		["GoodAttire"] = "The guard checked me from head to toe. Good thing that I'm not wearing some shitstained rags. They let me in with no other formalities. ";
		["GotShocked"] = "The energy field at the gates does not let me in. I should talk to the guards.";
		["LetMeIn"] = "The guards let me into the fort, I hope there won't be any checks next time.";
	};
	["nodes"] = {
		["condition_00000"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = 120;
			["posY"] = 30;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00005"] = {
			["ID"] = 5;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 600;
			["posY"] = -90;
			["script"] = "function Condition:onCheck(obj)\
   if self.q.hidden then\
      self.q.hidden = false\
      fakeQuestStartInfo(self.q)\
   end\
   if not self:getParam(\"BadAttire\") then\
      self:writeLog(\"BadAttire\")\
      self:setParam(\"BadAttire\", true)\
   end\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "drago_bad_attire";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00006"] = {
			["ID"] = 6;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 360;
			["posY"] = -90;
			["script"] = "function Condition:onCheck(obj)\
   local top = getPlayer():getInventory().slots.top or false\
   local bottom = getPlayer():getInventory().slots.bottom or false\
   for _, item in pairs( { top, bottom } ) do\
      if not item then\
         return false\
      end\
      for _, blackString in pairs(self.blacklistedAttire) do\
         if string.find( item.name, blackString ) then\
            return false\
         end\
      end\
   end\
   self:setTopicVisible(\"drago_bad_attire\", false)\
   return true\9\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "drago_check_attire";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00007"] = {
			["ID"] = 7;
			["connectionsID"] = {
				[1] = 12;
			};
			["event"] = "discuss";
			["posX"] = 570;
			["posY"] = 150;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "finish";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00009"] = {
			["ID"] = 9;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = 120;
			["posY"] = 180;
			["script"] = "function Condition:onCheck(obj)\
   self.q.hidden = true\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "drago_start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00010"] = {
			["ID"] = 10;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "trigger_in";
			["posX"] = 120;
			["posY"] = 330;
			["script"] = "function Condition:onCheck(obj)\
   self:writeLog(\"GotShocked\")\
   self:setParam(\"GotShocked\", true)\
   getPlayer():playEffect( \"electro_shock\", 1 )\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "q_to_fort_field_1,q_to_fort_field_2";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00011"] = {
			["ID"] = 11;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = 390;
			["posY"] = 390;
			["script"] = "function Condition:onCheck(obj)\
   if not self:getParam(\"GotShocked\") and not self:getParam(\"BadAttire\") then\
      self:writeLog(\"GotShocked\")\
      self:setParam(\"GotShocked\", true)\
   end\
   getPlayer():playEffect( \"electro_shock\", 1 )\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "q_to_fort_field_1,q_to_fort_field_2";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00013"] = {
			["ID"] = 13;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "trigger_in";
			["posX"] = 1020;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "q_to_fort_finish_1,q_to_fort_finish_2,q_to_fort_finish_3";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00014"] = {
			["ID"] = 14;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "trigger_in";
			["posX"] = 120;
			["posY"] = 480;
			["script"] = "function Condition:onCheck(obj)\
   self.q.hidden = true\
   runTimer(0, nil, function() self:goToStep(\"finish\") end, false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "q_to_fort_finish_1,q_to_fort_finish_2,q_to_fort_finish_3";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 1260;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["let_me_in"] = {
			["ID"] = 12;
			["connectionsID"] = {
				[1] = 13;
			};
			["name"] = "let_me_in";
			["posX"] = 810;
			["posY"] = 180;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"drago_check_attire\", false)\
   disableObject(self.field_1)\
   disableObject(self.field_2)\
   if not self:getParam(\"BadAttire\") then\
      self:writeLog(\"GoodAttire\")\
   end\
   self:writeLog(\"LetMeIn\")\
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
				[2] = 13;
			};
			["name"] = "start";
			["posX"] = 360;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:setTopicVisible(\"drago_start\", true)\
   self:setTopicVisible(\"start\", true)\
   self:setTopicVisible(\"drago_check_attire\", true)\
   self:setTopicVisible(\"drago_bad_attire\", true)--is hidden by check_attire\
   self:setTopicVisible(\"finish\", true) --played if bad_attire is not visible\
   self:declareVar(\"blacklistedAttire\", { \"junk\", })\
   self:declareVar(\"field_1\", \"q_to_fort_field_1\")\
   self:declareVar(\"field_2\", \"q_to_fort_field_2\")\
end\
\
function Quest:onStart()\
   self:setTopicVisible(\"start\", false)\
end\
\
function Quest:onFinish()\
   getObj(\"drago\").dialogInitiator = false\
   self:setTopicVisible(\"drago_check_attire\", false)\
   disableObject(self.field_1)\
   disableObject(self.field_2)\
   self:writeLog(\"Finish\")\
end\
\
function Quest:getTopicVisible_drago_check_attire()\
   return true\
end";
	["title"] = "To The Fort";
}
return obj1
