-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "Eli the warehouse keeper in the Fort is very interested in opening a closed door with a keypad lock that is blocking a storage room with 'special' supplies. The way he puts it, the supplies in this room are crucial to people garrisoned in the Fort. Eli's predecessor, of whom Eli is, to put it mildly, is of an extremely low opinion - someone that goes by the name Barnabas, left the Fort without notifying anyone as to how to open the door to the special storage room. Eli believes that I should try and find another way into the room. I should also search Barnabas' room, maybe it has some notes regarding the code. To find his room I should exit the storehouse through the main exit, turn immediately right and go down the ramp. At the bottom of the ramp if I look up I would be staring directly at the corner of Barnabas' room.\
\
Hm, a closed 'special' section of the storehouse? Count me in!";
	["hidden"] = false;
	["logs"] = {
		["CheckRoom"] = "Eli suggested I should check Barnabas' room. It might contain something useful.";
		["CodeWrong"] = "The code from Barnabas' note isn't working. Gotta talk to Eli, there must be something else.";
		["DoorOpened"] = "I've managed to open the locked door to a special store room. I should take a look inside while I have the opportunity.";
		["Finish"] = "What a bummer. Instead of treasures and military grade weapons the closed room contained rows of cupboards packed full of new clothes and various items for everyday use. Nevertheless, Eli has assured me that these items are of a crucial importance for the Fort. He promised to tell captain Castor all the best about me as well as to give me a good discount on his wares.";
		["ReadCipher"] = "In Barnabas' room I've found a book about ciphers. Some of the paragraphs were marked. The former warehouse manager was probably using a cipher to encrypt the notes containing the code. It isn't very likely that he used a complex cipher, as he had some issues with remembering even a simple 4-digit number, so he must have used the simple one which suggests to take the actual code, add 1 to each digit and write down the result on the note.";
		["ReadNote"] = "I used an RC chipped bug to get out of the closed room Barnabas' diary with numbers 9731 in it. I should try it on the door.";
	};
	["nodes"] = {
		["condition_00001"] = {
			["ID"] = 1;
			["connectionsID"] = {
				[1] = 0;
			};
			["event"] = "discuss";
			["posX"] = -360;
			["posY"] = 270;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00003"] = {
			["ID"] = 3;
			["connectionsID"] = {
				[1] = 2;
			};
			["event"] = "discuss";
			["posX"] = 1620;
			["posY"] = 270;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "finish";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00004"] = {
			["ID"] = 4;
			["connectionsID"] = {
				[1] = 5;
			};
			["event"] = "read";
			["posX"] = 120;
			["posY"] = 120;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "barnabas_code.itm";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00007"] = {
			["ID"] = 7;
			["connectionsID"] = {
				[1] = 8;
			};
			["event"] = "code_denied";
			["posX"] = 600;
			["posY"] = 30;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "var:lock";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00009"] = {
			["ID"] = 9;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 720;
			["posY"] = -240;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(\"CheckRoom\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "code_wrong";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00010"] = {
			["ID"] = 10;
			["connectionsID"] = {
				[1] = 11;
			};
			["event"] = "code_accepted";
			["posX"] = 1110;
			["posY"] = 120;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "var:lock";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00012"] = {
			["ID"] = 12;
			["connectionsID"] = {
			};
			["event"] = "read";
			["posX"] = 990;
			["posY"] = -240;
			["script"] = "function Condition:onCheck(name, obj)\
   if self.q:getActiveStepName() ~= \"lock_opened\" then\
      self:writeLog(\"ReadCipher\")\
      self:setTopicVisible(\"read_cipher\", true)\
   end\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "barnabas_cipher.itm";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00016"] = {
			["ID"] = 16;
			["connectionsID"] = {
			};
			["event"] = "code_accepted";
			["posX"] = 750;
			["posY"] = 390;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"code_wrong\", false)\
   self:setTopicVisible(\"read_cipher\", false)\
   self:setTopicVisible(\"eli_already_opened\", true)\
   self:setTopicVisible(\"finish\", true)\
   for i=1,4 do\
      local crate = self[\"crate\" .. i]\
      enableObject(crate)\
   end\
   return true\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "var:lock";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 2;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 1860;
			["posY"] = 300;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   setGlobalParam(\"eli_buyFromVendorMul\", 0.8)\
   self:writeLog(\"Finish\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["lock_opened"] = {
			["ID"] = 11;
			["connectionsID"] = {
				[1] = 3;
			};
			["name"] = "lock_opened";
			["posX"] = 1380;
			["posY"] = 150;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:writeLog(\"DoorOpened\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 3;
				[2] = 4;
				[3] = 10;
			};
			["name"] = "start";
			["posX"] = -120;
			["posY"] = 300;
			["script"] = "";
			["type"] = "step";
		};
		["try_open"] = {
			["ID"] = 5;
			["connectionsID"] = {
				[1] = 7;
				[2] = 10;
			};
			["name"] = "try_open";
			["posX"] = 390;
			["posY"] = 150;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:writeLog(\"ReadNote\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["wont_open"] = {
			["ID"] = 8;
			["connectionsID"] = {
				[1] = 10;
			};
			["name"] = "wont_open";
			["posX"] = 870;
			["posY"] = 60;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:writeLog(\"CodeWrong\")\
   self:setTopicVisible(\"code_wrong\", true)\
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
   self:setTopicVisible(\"start\", true)\
   self:setTopicVisible(\"finish\", false)\
   self:setTopicVisible(\"code_wrong\", false)\
   self:setTopicVisible(\"read_cipher\", false)\
   self:setTopicVisible(\"eli_already_opened\", false)\
   self:declareVar(\"lock\", \"q_open_sesame_lock\")\
   self:declareVar(\"crate1\", \"q_open_sesame_crate_1\")\
   self:declareVar(\"crate2\", \"q_open_sesame_crate_2\")\
   self:declareVar(\"crate3\", \"q_open_sesame_crate_3\")\
   self:declareVar(\"crate4\", \"q_open_sesame_crate_4\")\
end\
\
function Quest:onStart()\
   self:setTopicVisible(\"start\", false)\
end\
\
function Quest:onFinish()\
end\
\
function Quest:getTopicVisible_start()\
   return isQuestFinished(\"helping_hands\")\
end\
\
";
	["title"] = "Open Sesame";
}
return obj1
