-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["posX"] = 810;
		["posY"] = 90;
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
		["posX"] = 825.249694824;
		["posY"] = 635.74987793;
		["script"] = "";
		["text"] = "END";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["posX"] = 810;
		["posY"] = 210;
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
		["posX"] = 821.24987793;
		["posY"] = 346.624755859;
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
		["posX"] = 810;
		["posY"] = 480;
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
		["posX"] = 235.499603271;
		["posY"] = 322.24987793;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00399"] = {
		["ID"] = 399;
		["actor"] = 1;
		["connectID"] = 410;
		["posX"] = 97.74949646;
		["posY"] = 823.750244141;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00401"] = {
		["ID"] = 401;
		["actor"] = 1;
		["posX"] = 780;
		["posY"] = 870;
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
		["text"] = "[t_lost_arphant:molly_give_melon]\\[Give melon] Let's go to Zak, stripy!";
		["time"] = 4.5;
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
		["posY"] = 1230;
		["script"] = "";
		["text"] = "END";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00410"] = {
		["ID"] = 410;
		["actor"] = 2;
		["connectID"] = 414;
		["posX"] = 340.249511719;
		["posY"] = 848.250244141;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00411"] = {
		["ID"] = 411;
		["actor"] = 1;
		["connectID"] = 412;
		["posX"] = 780;
		["posY"] = 750;
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
		["text"] = "[t_lost_arphant:molly_give_melon_stuck]\\[Give melon] Let's go to Zak, stripy!";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00412"] = {
		["ID"] = 412;
		["actor"] = 2;
		["connectID"] = 413;
		["posX"] = 1020;
		["posY"] = 750;
		["script"] = "";
		["text"] = "...";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00413"] = {
		["ID"] = 413;
		["actor"] = 1;
		["posX"] = 1260;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Oh, right... You can't get out.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00415"] = {
		["ID"] = 415;
		["actor"] = 1;
		["connectID"] = 416;
		["posX"] = 780;
		["posY"] = 1110;
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
		["text"] = "[t_lost_arphant:molly_stuck]So... You're stuck...";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00416"] = {
		["ID"] = 416;
		["actor"] = 2;
		["connectID"] = 414;
		["posX"] = 1020;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "...";
		["time"] = 1.5;
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
		["posX"] = 538.499938965;
		["posY"] = 306.5;
		["type"] = "switch";
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
			[1] = 411;
			[2] = 401;
			[3] = 403;
			[4] = 415;
			[5] = 405;
		};
		["posX"] = 570;
		["posY"] = 840;
		["type"] = "switch";
	};
}
return obj1
