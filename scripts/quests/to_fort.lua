-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "There is a human fort in the northern part of this area. It should offer some opportunities for earning cash and gearing up. The search for my highjacked spaceship should start there as well.";
	["hidden"] = false;
	["logs"] = {
		["AboutBribe"] = "The guard also mentioned that I could donate 1000 antigravium for the access.";
		["BadAttire"] = "The fort's guard checked me from head to toe but didn't let me in. They don't want to see dirty drifters inside the perimeter. To enter the fort I have to get some decent clothes first.";
		["Bribed"] = "I made a generous donation of 1000 antigravium to either the settlement's budget or the guard's pockets. He promised no further checks or fees.";
		["Finish"] = "I've reached the fort. I'm finally back to civilization.";
		["GoodAttire"] = "The guard checked me from head to toe. Good thing that I'm not wearing some shitstained rags. They've let me in with no other formalities, I hope there won't be any checks next time. ";
		["GotShocked"] = "The energy field at the gates does not let me in. I should talk to the guards.";
		["GotToFindFort"] = "I've got to reach this outpost of the human civilization as soon as possible. Finding a map or asking the locals for directions should be a good idea.";
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
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(\"GotToFindFort\")\
   return true\
end\
\
";
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
			["script"] = "function Condition:onCheck(name, obj)\
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
			["targetsAny"] = "guards_bad_attire";
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
			["script"] = "function Condition:onCheck(name, obj)\
   self.q:resetDialogInitiators()\
   local top = getMC():getInventory():getSlotItem(\"top\") or false\
   local bottom = getMC():getInventory():getSlotItem(\"bottom\") or false\
   for _, item in pairs({ top, bottom }) do\
      if not item then\
         return false\
      end\
      for _, blackString in pairs(self.blacklistedAttire) do\
         if string.find(item:getItemName(), blackString) then\
            return false\
         end\
      end\
   end\
   self:setTopicVisible(\"guards_bad_attire\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "guards_check_attire";
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
			["script"] = "function Condition:onCheck(name, obj)\
   if not self:getParam(\"BadAttire\") then\
      self:writeLog(\"GoodAttire\")\
   end\
   return true\
end\
\
";
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
			["script"] = "function Condition:onCheck(name, obj)\
   self.q.hidden = true\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "guards_start";
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
			["targetsAny"] = "var:finish_trig_1,var:finish_trig_2,var:finish_trig_3";
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
			["posY"] = 330;
			["script"] = "function Condition:onCheck(name, obj)\
   self.q.hidden = true\
   runTimer(0, nil, function() self:goToStep(\"finish\") end, false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:finish_trig_1,var:finish_trig_2,var:finish_trig_3";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00015"] = {
			["ID"] = 15;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = -180;
			["posY"] = 180;
			["script"] = "function Condition:onCheck(name, obj)\
   if not self.q:isStarted() then\
      self.q:start()\
   end\
   if not self:getParam(\"GotShocked\") and not self:getParam(\"BadAttire\") then\
      self:writeLog(\"GotShocked\")\
      self:setParam(\"GotShocked\", true)\
   end\
   local player = getPlayer()\
   player:playEffect(\"electro_shock\", 1)\
\
   player:pushFrom(obj:getPose():getPos(), 20000, 0.5)\
\
   --Non-lethal damage\
   local damage = math.min(5, player:getStatCount(\"health\") - 1)\
   player:hit(damage, obj)\
   return false\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:field_trig_1,var:field_trig_2";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00016"] = {
			["ID"] = 16;
			["connectionsID"] = {
				[1] = 12;
			};
			["event"] = "discuss";
			["posX"] = 570;
			["posY"] = 330;
			["script"] = "function Condition:onCheck(name, obj)\
   removeItemFromPlayer(\"antigravium_shards.itm\", 1000)\
   self:writeLog(\"Bribed\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "guards_bribe";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00017"] = {
			["ID"] = 17;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 420;
			["posY"] = 480;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(\"AboutBribe\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "guards_about_bribe";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00019"] = {
			["ID"] = 19;
			["connectionsID"] = {
			};
			["event"] = "trigger_in";
			["posX"] = -180;
			["posY"] = 30;
			["script"] = "function Condition:onCheck(name, obj)\
   if not self.q:isFinished() then\
      getPlayer():playSound(self.commentary_wav)\
   end\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:commentary_trigger_1,var:commentary_trigger_2";
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
   self:setTopicVisible(\"guards_check_attire\", false)\
   disableObject(self.field_trig_1)\
   disableObject(self.field_trig_2)\
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
				[3] = 16;
			};
			["name"] = "start";
			["posX"] = 360;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:setTopicVisible(\"guards_start\", true)\
   self:setTopicVisible(\"start\", true)\
   self:setTopicVisible(\"guards_check_attire\", true)\
   self:setTopicVisible(\"guards_bad_attire\", true)--hidden by check_attire\
   self:setTopicVisible(\"guards_bribe\", true)--hidden by bad_attire\
   self:setTopicVisible(\"finish\", true) --played if bad_attire is not visible\
   self:declareVar(\"blacklistedAttire\", { \"junk\", })\
   self:declareVar(\"field_trig_1\", \"q_to_fort_field_1\")\
   self:declareVar(\"field_trig_2\", \"q_to_fort_field_2\")\
   self:declareVar(\"finish_trig_1\", \"q_to_fort_finish_1\")\
   self:declareVar(\"finish_trig_2\", \"q_to_fort_finish_2\")\
   self:declareVar(\"finish_trig_3\", \"q_to_fort_finish_3\")\
\
   self:declareVar(\"commentary_trigger_1\", \"q_to_fort_big_guns_commentary_trigger_1\")\
   self:declareVar(\"commentary_trigger_2\", \"q_to_fort_big_guns_commentary_trigger_2\")\
   self:declareVar(\"commentary_wav\", \"Play_comm_a_fort_with_big_guns\")\
end\
\
function Quest:onStart()\
   self:setTopicVisible(\"start\", false)\
end\
\
function Quest:onFinish()\
   self:resetDialogInitiators()\
   self:setTopicVisible(\"guards_check_attire\", false)\
   disableObject(self.field_trig_1)\
   disableObject(self.field_trig_2)\
   self:writeLog(\"Finish\")\
end\
\
function Quest:getTopicVisible_guards_check_attire()\
   return true\
end\
\
function Quest:getTopicVisible_guards_bribe()\
   return hasPlayerItem(\"antigravium_shards.itm\", 1000)\
end\
\
\
function Quest:resetDialogInitiators()\
   getObj(\"drago\"):setDialogInitiator(false)\
   getObj(\"barnie\"):setDialogInitiator(false)\
   getObj(\"john\"):setDialogInitiator(false)\
   getObj(\"the_other_john\"):setDialogInitiator(false)\
end";
	["title"] = "To The Fort";
}
return obj1
