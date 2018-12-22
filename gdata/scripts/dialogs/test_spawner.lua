-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 210;
		["posY"] = 360;
		["script"] = "function message:onStart()\
   self:setParam(\"class\", nil)\
   self:setParam(\"prefab\", nil)\
   self:setParam(\"count\", nil)\
   self:setParam(\"weapon\", nil)\
   self:setParam(\"armor\", nil)\
   self:setParam(\"shield\", nil)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "reset";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 14;
		["posX"] = 630;
		["posY"] = -240;
		["script"] = "function message:onStart()\
   self:setParam(\"class\", \"CBandit\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Bandits";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 7;
		["posX"] = 630;
		["posY"] = 120;
		["script"] = "function message:onStart()\
   self:setParam(\"class\", \"CCrucas\")\
   self:setParam(\"prefab\", \"crucas.cfg\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Crucases";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["connectID"] = 7;
		["posX"] = 630;
		["posY"] = 240;
		["script"] = "function message:onStart()\
   self:setParam(\"class\", \"CKabarog\")\
   self:setParam(\"prefab\", \"kabarog.cfg\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Kabarogs";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["connectID"] = 7;
		["posX"] = 630;
		["posY"] = 360;
		["script"] = "function message:onStart()\
   self:setParam(\"class\", \"CArphant\")\
   self:setParam(\"prefab\", \"arphant.cfg\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Arphants";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["posX"] = 630;
		["posY"] = 870;
		["script"] = "";
		["text"] = "Exit";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 1440;
		["posY"] = 60;
		["script"] = "function message:onStart()\
   self:setParam(\"count\", 1)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "1";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 1440;
		["posY"] = 180;
		["script"] = "function message:onStart()\
   self:setParam(\"count\", 2)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "2";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 1440;
		["posY"] = 300;
		["script"] = "function message:onStart()\
   self:setParam(\"count\", 3)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "3";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 1440;
		["posY"] = 420;
		["script"] = "function message:onStart()\
   self:setParam(\"count\", 4)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "4";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 1440;
		["posY"] = 540;
		["script"] = "function message:onStart()\
   self:setParam(\"count\", 5)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "5";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 1;
		["connectID"] = 7;
		["posX"] = 1020;
		["posY"] = -360;
		["script"] = "function message:onStart()\
   self:setParam(\"prefab\", \"human_male.cfg\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Human";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["connectID"] = 7;
		["posX"] = 1020;
		["posY"] = -240;
		["script"] = "function message:onStart()\
   self:setParam(\"prefab\", \"abori.cfg\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Abori";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 1;
		["connectID"] = 7;
		["posX"] = 630;
		["posY"] = 480;
		["script"] = "function message:onStart()\
   self:setParam(\"class\", \"CBug\")\
   self:setParam(\"prefab\", \"killerbug.cfg\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Killerbugs";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 1;
		["connectID"] = 0;
		["posX"] = 630;
		["posY"] = 660;
		["script"] = "function message:onStart()\
   local spawner = getObj(\"test_spawner\")\
   spawner:deactivate()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Clear";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["connectID"] = 27;
		["posX"] = 1860;
		["posY"] = 150;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"class\") == \"CBandit\"\
end\
\
";
		["text"] = "Set up weapons";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 2;
		["connectID"] = 70;
		["posX"] = 1860;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Continue to spawn";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 1;
		["connectID"] = 0;
		["posX"] = 1440;
		["posY"] = 660;
		["script"] = "";
		["text"] = "Reset";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 1;
		["connectID"] = 0;
		["posX"] = 1020;
		["posY"] = -120;
		["script"] = "";
		["text"] = "Reset";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["connectID"] = 57;
		["posX"] = 2670;
		["posY"] = -900;
		["script"] = "function message:onStart()\
   self:setParam(\"weapons\", \"pickaxe.wpn\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Pickaxe (10)";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["connectID"] = 57;
		["posX"] = 2670;
		["posY"] = -780;
		["script"] = "function message:onStart()\
   self:setParam(\"weapons\", \"abori_knife.wpn\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Abori Knife (35)";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 1;
		["connectID"] = 57;
		["posX"] = 2670;
		["posY"] = -540;
		["script"] = "function message:onStart()\
   self:setParam(\"weapons\", \"axe.wpn\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = " Axe (50)";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 1;
		["connectID"] = 57;
		["posX"] = 2670;
		["posY"] = -420;
		["script"] = "function message:onStart()\
   self:setParam(\"weapons\", \"cleaver.wpn\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Cleaver (60)";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 1;
		["connectID"] = 0;
		["posX"] = 2280;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Reset";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 1;
		["connectID"] = 35;
		["posX"] = 2280;
		["posY"] = -540;
		["script"] = "";
		["text"] = "Melee";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 1;
		["connectID"] = 37;
		["posX"] = 2280;
		["posY"] = 150;
		["script"] = "";
		["text"] = "Ranged";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 1;
		["connectID"] = 27;
		["posX"] = 2670;
		["posY"] = -300;
		["script"] = "";
		["text"] = "Back";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 1;
		["connectID"] = 57;
		["posX"] = 2670;
		["posY"] = -120;
		["script"] = "function message:onStart()\
   self:setParam(\"weapons\", \"scamp_22.gun\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Scamp (30)";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 1;
		["connectID"] = 57;
		["posX"] = 2670;
		["posY"] = 0;
		["script"] = "function message:onStart()\
   self:setParam(\"weapons\", \"revolver.gun\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Revolver (45)";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00040"] = {
		["ID"] = 40;
		["actor"] = 1;
		["connectID"] = 27;
		["posX"] = 2670;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Back";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 1;
		["connectID"] = 57;
		["posX"] = 2670;
		["posY"] = 120;
		["script"] = "function message:onStart()\
   self:setParam(\"weapons\", \"shotgun.gun\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Shotgun (15*10)";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 1;
		["connectID"] = 57;
		["posX"] = 2670;
		["posY"] = 240;
		["script"] = "function message:onStart()\
   self:setParam(\"weapons\", \"carbine.gun\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Carbine (70)";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 1;
		["connectID"] = 62;
		["posX"] = 3810;
		["posY"] = -1080;
		["script"] = "function message:onStart()\
   self:setParam(\"armor\", \"junk_top_2.itm,junk_legs_2.itm\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Junk 2 (4)";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 1;
		["connectID"] = 62;
		["posX"] = 3810;
		["posY"] = -960;
		["script"] = "function message:onStart()\
   self:setParam(\"armor\", \"worker_jacket.itm,worker_pants.itm\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = " Worker (10)";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 1;
		["connectID"] = 62;
		["posX"] = 3810;
		["posY"] = -840;
		["script"] = "function message:onStart()\
   self:setParam(\"armor\", \"bounty_hunter_jacket_1.itm,bounty_hunter_pants_1.itm\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Bounty Hunter 1 (20)";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 1;
		["connectID"] = 62;
		["posX"] = 3810;
		["posY"] = -720;
		["script"] = "function message:onStart()\
   self:setParam(\"armor\", \"bounty_hunter_jacket_2.itm,bounty_hunter_pants_2.itm\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Bounty Hunter 2 (30)";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 1;
		["connectID"] = 27;
		["posX"] = 3810;
		["posY"] = -480;
		["script"] = "";
		["text"] = "Back";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 2;
		["connectID"] = 44;
		["posX"] = 3390;
		["posY"] = -720;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"prefab\") == \"human_male.cfg\"\
end\
\
";
		["text"] = "Set up armor for human males";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 2;
		["connectID"] = 62;
		["posX"] = 3390;
		["posY"] = -90;
		["script"] = "";
		["text"] = "Continue the setup";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 1;
		["connectID"] = 62;
		["posX"] = 3810;
		["posY"] = -600;
		["script"] = "function message:onStart()\
   self:setParam(\"armor\", \"bounty_hunter_jacket_3.itm,bounty_hunter_pants_3.itm\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Bounty Hunter 3 (40)";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 1;
		["connectID"] = 70;
		["posX"] = 4470;
		["posY"] = -1080;
		["script"] = "function message:onStart()\
   self:setParam(\"shield\", 50)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Shield 50";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 1;
		["connectID"] = 70;
		["posX"] = 4470;
		["posY"] = -960;
		["script"] = "function message:onStart()\
   self:setParam(\"shield\", 100)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Shield 100";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00065"] = {
		["ID"] = 65;
		["actor"] = 1;
		["connectID"] = 70;
		["posX"] = 4470;
		["posY"] = -840;
		["script"] = "function message:onStart()\
   self:setParam(\"shield\", 150)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Shield 150";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00066"] = {
		["ID"] = 66;
		["actor"] = 1;
		["connectID"] = 27;
		["posX"] = 4470;
		["posY"] = -360;
		["script"] = "";
		["text"] = "Back";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
		["actor"] = 1;
		["connectID"] = 70;
		["posX"] = 4470;
		["posY"] = -720;
		["script"] = "function message:onStart()\
   self:setParam(\"shield\", 200)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Shield 200";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 1;
		["connectID"] = 70;
		["posX"] = 4470;
		["posY"] = -600;
		["script"] = "function message:onStart()\
   self:setParam(\"shield\", 250)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Shield 250";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 1;
		["connectID"] = 70;
		["posX"] = 4470;
		["posY"] = -480;
		["script"] = "function message:onStart()\
   self:setParam(\"shield\", 300)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Shield 300";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00070"] = {
		["ID"] = 70;
		["actor"] = 2;
		["posX"] = 5370;
		["posY"] = 90;
		["script"] = "function message:onStart()\
   local spawner = getObj(\"test_spawner\")\
   spawner.characterType = self:getParam(\"prefab\")\
   spawner.characterClass = self:getParam(\"class\")\
   spawner.spawnCountMax = self:getParam(\"count\")\
   spawner.aliveCountMax = 100\
   spawner.weapons = { self:getParam(\"weapons\") }\
   spawner.parameters.lootItems = self:getParam(\"armor\")\
   spawner.lootItems = loadParamItemCounts(spawner, \"lootItems\", {})\
   spawner.energyMax = self:getParam(\"shield\")\
   spawner.active = false\
   spawner.spawnTime = 0\
   spawner.spawnCount = 0\
   spawner:activate()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Spawning";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00071"] = {
		["ID"] = 71;
		["actor"] = 1;
		["connectID"] = 62;
		["posX"] = 3810;
		["posY"] = -1200;
		["script"] = "function message:onStart()\
   self:setParam(\"armor\", nil)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "No armor";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00072"] = {
		["ID"] = 72;
		["actor"] = 1;
		["connectID"] = 57;
		["posX"] = 2670;
		["posY"] = -660;
		["script"] = "function message:onStart()\
   self:setParam(\"weapons\", \"machete.wpn\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Machete (40)";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00073"] = {
		["ID"] = 73;
		["actor"] = 2;
		["connectID"] = 0;
		["posX"] = -90;
		["posY"] = 360;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00074"] = {
		["ID"] = 74;
		["actor"] = 1;
		["connectID"] = 70;
		["posX"] = 4470;
		["posY"] = -1200;
		["script"] = "function message:onStart()\
   self:setParam(\"shield\", 0)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "No Shield";
		["time"] = 1;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 2;
			[2] = 3;
			[3] = 4;
			[4] = 5;
			[5] = 17;
			[6] = 18;
			[7] = 6;
		};
		["posX"] = 480;
		["posY"] = 330;
		["type"] = "switch";
	};
	["switch_00007"] = {
		["ID"] = 7;
		["connectionsID"] = {
			[1] = 8;
			[2] = 9;
			[3] = 10;
			[4] = 12;
			[5] = 13;
			[6] = 24;
		};
		["posX"] = 1290;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00014"] = {
		["ID"] = 14;
		["connectionsID"] = {
			[1] = 15;
			[2] = 16;
			[3] = 26;
		};
		["posX"] = 870;
		["posY"] = -240;
		["type"] = "switch";
	};
	["switch_00019"] = {
		["ID"] = 19;
		["connectionsID"] = {
			[1] = 21;
			[2] = 22;
		};
		["posX"] = 1710;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00027"] = {
		["ID"] = 27;
		["connectionsID"] = {
			[1] = 33;
			[2] = 34;
			[3] = 32;
		};
		["posX"] = 2130;
		["posY"] = 150;
		["type"] = "switch";
	};
	["switch_00035"] = {
		["ID"] = 35;
		["connectionsID"] = {
			[1] = 28;
			[2] = 29;
			[3] = 72;
			[4] = 30;
			[5] = 31;
			[6] = 36;
		};
		["posX"] = 2520;
		["posY"] = -540;
		["type"] = "switch";
	};
	["switch_00037"] = {
		["ID"] = 37;
		["connectionsID"] = {
			[1] = 38;
			[2] = 39;
			[3] = 41;
			[4] = 42;
			[5] = 40;
		};
		["posX"] = 2520;
		["posY"] = 120;
		["type"] = "switch";
	};
	["switch_00044"] = {
		["ID"] = 44;
		["connectionsID"] = {
			[1] = 71;
			[2] = 45;
			[3] = 46;
			[4] = 47;
			[5] = 48;
			[6] = 60;
			[7] = 49;
		};
		["posX"] = 3660;
		["posY"] = -750;
		["type"] = "switch";
	};
	["switch_00057"] = {
		["ID"] = 57;
		["connectionsID"] = {
			[1] = 56;
			[2] = 59;
		};
		["posX"] = 3150;
		["posY"] = -240;
		["type"] = "switch";
	};
	["switch_00062"] = {
		["ID"] = 62;
		["connectionsID"] = {
			[1] = 74;
			[2] = 63;
			[3] = 64;
			[4] = 65;
			[5] = 67;
			[6] = 68;
			[7] = 69;
			[8] = 66;
		};
		["posX"] = 4320;
		["posY"] = -660;
		["type"] = "switch";
	};
}
return obj1
