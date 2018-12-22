-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "Aborigine Msasi from Hunters Rest Camp asks to search for a stolen postal terminal. According to him, the device weighs more than half a ton, so it's unlikely that thieves were able to drag it too far away. Perhaps I should look for drag marks on the ground in the vicinity of the camp.";
	["hidden"] = false;
	["logs"] = {
		["Finish"] = "Msasi gave me some hunting supplies for the trouble. Seems worthy of remembering that such terminals are useful for those who want to earn extra money. Makes sense to check 'Jobs' and 'Wanted' tabs every now and then.";
		["FoundBattery"] = "I found the battery. I need to head back to the camp.";
		["PlugBattery"] = "All I need to do is plug the battery into the terminal.";
		["TerminalBrought"] = "After I supplied the big man with a drink, he hauled a very heavy terminal and erected it in its place unexpectedly quickly. These military-style exoskeleton suits really are something! Vasily examined the terminal and informed me that thieves have only managed to bend it's outer casing. The device should work normally, but the isotopic battery has been damaged, and will give out the ghost soon. I should talk to Msasi about a new one.";
		["TerminalFixed"] = "The battery problem has been solved - the terminal will be working on this new one for years to come, unless, of course, it gets stolen again. I should tell Msasi that the job is done.";
		["TerminalFound"] = "I found the terminal in a strange cave near the Hunters Rest. I can't even budge it by myself. I should tell Msasi about it. Together we'll figure it out.";
		["VasilyBooze"] = "Vasily needs \"fuel\" to do the job. Two bottles of strong booze should be enough. Does anyone on this damn planet ever do something without a drink?";
		["VasilyHelp"] = "Msasi says we should ask Vasily to help with heavy lifting before his broken hoverbike drives him insane. He's a big guy, but how is he gonna handle such a load?";
	};
	["nodes"] = {
		["condition_00000"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = -210;
			["posY"] = -270;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00002"] = {
			["ID"] = 2;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 1710;
			["posY"] = 150;
			["script"] = "function Condition:onCheck(obj)\
   addItemsToPlayer(\"revolver_ammo.itm\", 20)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "msasi_ammo_revolver";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00004"] = {
			["ID"] = 4;
			["connectionsID"] = {
				[1] = 5;
			};
			["event"] = "find";
			["posX"] = 300;
			["posY"] = -360;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "var:terminalBroken";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00007"] = {
			["ID"] = 7;
			["connectionsID"] = {
				[1] = 18;
			};
			["event"] = "discuss";
			["posX"] = 810;
			["posY"] = -270;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "msasi_found";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00009"] = {
			["ID"] = 9;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -270;
			["posY"] = 0;
			["script"] = "function Condition:onCheck(obj)\
   self:setTopicVisible(\"vasily_give_booze\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "vasily_give_booze";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00017"] = {
			["ID"] = 17;
			["connectionsID"] = {
				[1] = 11;
			};
			["event"] = "activate";
			["posX"] = 1200;
			["posY"] = 150;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "var:terminalFixed";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00019"] = {
			["ID"] = 19;
			["connectionsID"] = {
				[1] = 8;
			};
			["event"] = "discuss";
			["posX"] = 1320;
			["posY"] = -270;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "vasily_help";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00030"] = {
			["ID"] = 30;
			["connectionsID"] = {
				[1] = 16;
			};
			["event"] = "discuss";
			["posX"] = 690;
			["posY"] = 60;
			["script"] = "function Condition:onCheck(obj)\
   addItemsToPlayer(\"power_cell.itm\", 1)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "msasi_done_little_helpers";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00031"] = {
			["ID"] = 31;
			["connectionsID"] = {
				[1] = 16;
			};
			["event"] = "discuss";
			["posX"] = 690;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "msasi_found_battery";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00032"] = {
			["ID"] = 32;
			["connectionsID"] = {
				[1] = 33;
			};
			["event"] = "get";
			["posX"] = 240;
			["posY"] = 300;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "power_cell.itm";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00034"] = {
			["ID"] = 34;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 1710;
			["posY"] = 0;
			["script"] = "function Condition:onCheck(obj)\
   addItemsToPlayer(\"22_ammo.itm\", 25)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "msasi_ammo_22";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00035"] = {
			["ID"] = 35;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 1710;
			["posY"] = 300;
			["script"] = "function Condition:onCheck(obj)\
   addItemsToPlayer(\"shotgun_ammo.itm\", 12)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "msasi_ammo_shotgun";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00036"] = {
			["ID"] = 36;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 330;
			["posY"] = 0;
			["script"] = "function Condition:onCheck(obj)\
   self:setTopicVisible(\"msasi_find_battery_first\", false)\
   self:setTopicVisible(\"msasi_find_battery_second\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "msasi_find_battery_first";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00037"] = {
			["ID"] = 37;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 90;
			["posY"] = 0;
			["script"] = "function Condition:onCheck(obj)\
   self:setTopicVisible(\"vasily_find_battery\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "vasily_find_battery";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00039"] = {
			["ID"] = 39;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "find";
			["posX"] = -210;
			["posY"] = -420;
			["script"] = "function Condition:onCheck(obj)\
   if not self:getParam(\"FoundTerminalBefore\") then\
      self:setParam(\"FoundTerminalBefore\", true)\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:terminalBroken";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 1980;
			["posY"] = 180;
			["script"] = "";
			["type"] = "step";
		};
		["found"] = {
			["ID"] = 5;
			["connectionsID"] = {
				[1] = 7;
			};
			["name"] = "found";
			["posX"] = 570;
			["posY"] = -240;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"msasi_found\", true)\
   self:writeLog(\"TerminalFound\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["need_booze"] = {
			["ID"] = 8;
			["connectionsID"] = {
				[1] = 10;
			};
			["name"] = "need_booze";
			["posX"] = 1590;
			["posY"] = -240;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"vasily_give_booze\", true)\
   self:writeLog(\"VasilyBooze\")\
   --next step is activated by dialog onStop to start fading in on the end of the dialog message\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["need_help"] = {
			["ID"] = 18;
			["connectionsID"] = {
				[1] = 19;
			};
			["name"] = "need_help";
			["posX"] = 1080;
			["posY"] = -240;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"vasily_help\", true)\
   self:writeLog(\"VasilyHelp\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["plug_battery"] = {
			["ID"] = 16;
			["connectionsID"] = {
				[1] = 17;
			};
			["name"] = "plug_battery";
			["posX"] = 960;
			["posY"] = 180;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   enableObject(self.terminalFixed)\
   showObject(\"q_find_terminal_wire\")\
   self:setTopicVisible(\"msasi_find_battery_second\", false)\
   self:writeLog(\"PlugBattery\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["return_battery"] = {
			["ID"] = 33;
			["connectionsID"] = {
				[1] = 31;
			};
			["name"] = "return_battery";
			["posX"] = 480;
			["posY"] = 330;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:writeLog(\"FoundBattery\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["spawn_terminal"] = {
			["ID"] = 10;
			["connectionsID"] = {
				[1] = 30;
				[2] = 31;
				[3] = 32;
			};
			["name"] = "spawn_terminal";
			["posX"] = 0;
			["posY"] = 180;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local player = getPlayer()\
   player:setState( \"blockItemUse\", true )\
   player:setState( \"disableAttack\", true )\
   player:setState( \"disableMove\", true )\
   player:setState( \"disableJump\", true )\
   player:setState( \"disableInteraction\", true )\
   removeBoozeFromPlayer( 2, \"strong\" )\
   runTimer(0, nil, function()\
      gameplayUI:startFadeToBlackSequence( 1, 1, 1 )\
   end, false)\
   runTimer(1.5, self.q, function(self)\
      getPlayer():startTalk( getObj(\"vasily\") )\
      player:setDisableActionStates( false )\
      disableObject(self.terminalBroken)\
      hideObject(self.terminalBroken)\
      disableObjectCollisions(self.terminalBroken)\
      hideDisableObjectGroup( self.terminalBrokenTools, true )\
\
      showObject(self.terminalFixed)\
   end, false)\
   self:setTopicVisible(\"vasily_help\", false)\
   self:setTopicVisible(\"vasily_find_battery\", true)\
   self:setTopicVisible(\"msasi_find_battery_first\", true)\
   self:writeLog(\"TerminalBrought\")\
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
				[1] = 4;
				[2] = 5;
			};
			["name"] = "start";
			["posX"] = 60;
			["posY"] = -240;
			["script"] = "";
			["type"] = "step";
		};
		["terminal_fixed"] = {
			["ID"] = 11;
			["connectionsID"] = {
				[1] = 2;
				[2] = 34;
				[3] = 35;
			};
			["name"] = "terminal_fixed";
			["posX"] = 1470;
			["posY"] = 180;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"finish\", true)\
   self:writeLog(\"TerminalFixed\")\
   showEnableObjectGroup( self.terminalFixedHolo )\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:declareVar(\"terminalBroken\", \"q_find_terminal_terminal_broken\")\
   self:declareVar(\"terminalBrokenTools\", \"q_find_terminal_terminal_broken_tools\")\
   self:declareVar(\"terminalFixed\", \"q_find_terminal_terminal_fixed\")\
   self:declareVar(\"terminalFixedHolo\", \"q_find_terminal_terminal_fixed_hologram\")\
   self:declareVar(\"prereq\", \"little_helpers\")\
   self:setTopicVisible(\"start\", true)\
   self:setTopicVisible(\"msasi_found\", false)\
   self:setTopicVisible(\"vasily_help\", false)\
   self:setTopicVisible(\"vasily_give_booze\", false)\
   self:setTopicVisible(\"vasily_find_battery\", false)\
   self:setTopicVisible(\"msasi_find_battery_first\", false)\
   self:setTopicVisible(\"msasi_find_battery_second\", false)\
   self:setTopicVisible(\"msasi_lost_battery\", true)--these four hidden by find_battery and custom\
   self:setTopicVisible(\"msasi_do_little_helpers\", true)\
   self:setTopicVisible(\"msasi_done_little_helpers\", true)\
   self:setTopicVisible(\"msasi_found_battery\", true)\
   self:setTopicVisible(\"finish\", false)\
   self:setTopicVisible(\"msasi_ammo_22\", true) --these three are hidden by finish\
   self:setTopicVisible(\"msasi_ammo_revolver\", true)\
   self:setTopicVisible(\"msasi_ammo_shotgun\", true)\
end\
\
function Quest:onStart()\
   if self:getParam(\"FoundTerminalBefore\") then\
      self:goToStep(\"found\")\
   end\
   self:setTopicVisible(\"start\", false)\
end\
\
function Quest:onFinish()\
   self:writeLog(\"Finish\")\
   self:setTopicVisible(\"finish\", false)\
end\
\
function Quest:OnLoadState()\
   if self:isStepPassed( \"need_booze\" ) then\
      hideDisableObjectGroup( self.terminalBrokenTools, true )\
   end\
   if self:isStepPassed( \"plug_battery\" ) then\
      showEnableObjectGroup( self.terminalFixedHolo, true )\
   end\
end\
\
function Quest:getTopicVisible_vasily_give_booze()\
   return hasPlayerBooze( 2, \"strong\" )\
end\
\
function Quest:getTopicVisible_msasi_lost_battery()\
   return not isQuestActive(self.prereq)\
          and not isQuestFinished(self.prereq)\
          and not hasPlayerItem(\"power_cell.itm\")\
end\
\
function Quest:getTopicVisible_msasi_done_little_helpers()\
   return isQuestFinished(self.prereq)\
end\
\
function Quest:getTopicVisible_msasi_do_little_helpers()\
   return isQuestActive(self.prereq)\
          and not hasPlayerItem(\"power_cell.itm\")\
end\
\
function Quest:getTopicVisible_msasi_found_battery()\
   return hasPlayerItem(\"power_cell.itm\")\
end";
	["title"] = "Find Terminal";
}
return obj1
