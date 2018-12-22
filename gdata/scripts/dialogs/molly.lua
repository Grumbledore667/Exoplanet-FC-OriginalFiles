-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["posX"] = 750;
		["posY"] = -60;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestActiveStepName(\"lost_arphant\") == \"clear_way\"\
end\
\
";
		["text"] = "[t_lost_arphant:molly_give_melon]give melon. let's go to zak!";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["posX"] = 750;
		["posY"] = 420;
		["script"] = "";
		["text"] = "END";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["posX"] = 750;
		["posY"] = 60;
		["script"] = "function message:onStart()\
   getObj(\"arphant_molly\"):die()\
   removeItemFromPlayer(\"poisoned_melon.itm\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
--   return getQuestActiveStepName(\"lost_arphant\") == \"start\"\
--      and hasPlayerItem(\"poisoned_melon.itm\")\
   return false\
end\
\
";
		["text"] = "\\[give poisoned melon]";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["connectID"] = 397;
		["posX"] = -283.500125885;
		["posY"] = 461.874816895;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00217"] = {
		["ID"] = 217;
		["actor"] = 1;
		["posX"] = 750;
		["posY"] = 180;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return false\
end\
\
";
		["text"] = "";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00218"] = {
		["ID"] = 218;
		["actor"] = 1;
		["posX"] = 750;
		["posY"] = 300;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible()\
end\
\
";
		["text"] = "[t_lost_arphant:molly_give_weed]give tranquilizer";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00398"] = {
		["ID"] = 398;
		["actor"] = 1;
		["connectID"] = 2;
		["posX"] = 180;
		["posY"] = 180;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00399"] = {
		["ID"] = 399;
		["actor"] = 1;
		["connectID"] = 410;
		["posX"] = 120;
		["posY"] = 990;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00403"] = {
		["ID"] = 403;
		["actor"] = 1;
		["posX"] = 780;
		["posY"] = 990;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible()\
end\
\
";
		["text"] = "[t_lost_arphant:molly_give_weed]\\[Give tranquilizer]";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00405"] = {
		["ID"] = 405;
		["actor"] = 1;
		["posX"] = 780;
		["posY"] = 1140;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00410"] = {
		["ID"] = 410;
		["actor"] = 2;
		["connectID"] = 414;
		["posX"] = 360;
		["posY"] = 990;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible()\
end\
\
";
		["text"] = "[t_lost_arphant:molly_talk]";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00415"] = {
		["ID"] = 415;
		["actor"] = 1;
		["connectID"] = 429;
		["posX"] = 1410;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Ah... You're stuck...";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00417"] = {
		["ID"] = 417;
		["actor"] = 1;
		["connectID"] = 419;
		["posX"] = 780;
		["posY"] = 840;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible()\
end\
\
";
		["text"] = "[t_lost_arphant:molly_go_to_zak]Let's go to Zak, stripy!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00420"] = {
		["ID"] = 420;
		["actor"] = 2;
		["connectID"] = 415;
		["posX"] = 1170;
		["posY"] = 750;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"molly_stuck\")\
end\
\
";
		["text"] = "...";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00421"] = {
		["ID"] = 421;
		["actor"] = 2;
		["connectID"] = 422;
		["posX"] = 1170;
		["posY"] = 960;
		["script"] = "";
		["text"] = "...";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00423"] = {
		["ID"] = 423;
		["actor"] = 1;
		["connectID"] = 425;
		["posX"] = 1560;
		["posY"] = 900;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible()\
end\
\
";
		["text"] = "[t_lost_arphant:molly_give_melon]Alright, how about now? \\[Give melon]";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00424"] = {
		["ID"] = 424;
		["actor"] = 1;
		["connectID"] = 428;
		["posX"] = 1560;
		["posY"] = 1020;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuestTopicVisible(\"lost_arphant\", \"molly_give_melon\")\
end\
\
";
		["text"] = "Hmm. What can I do to make you follow the command...";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00425"] = {
		["ID"] = 425;
		["actor"] = 1;
		["posX"] = 1800;
		["posY"] = 900;
		["script"] = "";
		["text"] = "Let's go to Zak, stripy!\
";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00426"] = {
		["ID"] = 426;
		["actor"] = 1;
		["connectID"] = 429;
		["posX"] = 1560;
		["posY"] = 1140;
		["script"] = "";
		["text"] = "BACK";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00428"] = {
		["ID"] = 428;
		["actor"] = 1;
		["connectID"] = 429;
		["posX"] = 1800;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "Maybe some treat... A melon, right!";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00429"] = {
		["ID"] = 429;
		["actor"] = 2;
		["connectID"] = 414;
		["posX"] = 2550;
		["posY"] = 960;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00430"] = {
		["ID"] = 430;
		["actor"] = 1;
		["connectID"] = 432;
		["posX"] = 780;
		["posY"] = 630;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"molly_stuck\")\
end\
\
";
		["text"] = "So... You're really stuck here...";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00432"] = {
		["ID"] = 432;
		["actor"] = 2;
		["posX"] = 1020;
		["posY"] = 630;
		["script"] = "";
		["text"] = "...";
		["time"] = 1;
		["type"] = "message";
	};
	["switch_00002"] = {
		["ID"] = 2;
		["connectionsID"] = {
			[1] = 3;
			[2] = 8;
			[3] = 217;
			[4] = 218;
			[5] = 4;
		};
		["h"] = 140;
		["posX"] = 480;
		["posY"] = 150;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00397"] = {
		["ID"] = 397;
		["connectionsID"] = {
			[1] = 398;
			[2] = 399;
		};
		["posX"] = 5.49987792969;
		["posY"] = 461.874816895;
		["type"] = "switch";
	};
	["switch_00414"] = {
		["ID"] = 414;
		["connectionsID"] = {
			[1] = 430;
			[2] = 417;
			[3] = 403;
			[4] = 405;
		};
		["h"] = 120;
		["posX"] = 600;
		["posY"] = 990;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00419"] = {
		["ID"] = 419;
		["connectionsID"] = {
			[1] = 420;
			[2] = 421;
		};
		["posX"] = 1020;
		["posY"] = 840;
		["type"] = "switch";
	};
	["switch_00422"] = {
		["ID"] = 422;
		["connectionsID"] = {
			[1] = 423;
			[2] = 424;
			[3] = 426;
		};
		["posX"] = 1410;
		["posY"] = 960;
		["type"] = "switch";
	};
}
return obj1
