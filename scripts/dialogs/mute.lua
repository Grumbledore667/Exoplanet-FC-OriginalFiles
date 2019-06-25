-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 60;
		["posY"] = 540;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["connectID"] = 17;
		["posX"] = 450;
		["posY"] = 480;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not self:getParam(\"intro_passed\")\
end\
\
";
		["text"] = "Hey, you...";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["animation"] = "dl_idle";
		["connectID"] = 29;
		["posX"] = 690;
		["posY"] = 480;
		["script"] = "";
		["text"] = "*The gaunt abori remains silent. He seems to be barely noticing your presence.*";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["animation"] = "dl_hand_chopslow";
		["connectID"] = 30;
		["posX"] = 930;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Don't you dare to ignore me!";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 2;
		["animation"] = "dl_hands_washing";
		["connectID"] = 31;
		["posX"] = 1170;
		["posY"] = 480;
		["script"] = "";
		["text"] = "*The abori focuses his weary eyes on you. Still not uttering a single word. He is studying you as if he has found a new subspecies of sand flea trying to speak.*";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 1;
		["animation"] = "dl_hand_chopfast";
		["connectID"] = 34;
		["posX"] = 1530;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Screw you then, stupid aborigine!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 1;
		["animation"] = "dl_hands_dontknow";
		["connectID"] = 35;
		["posX"] = 1530;
		["posY"] = 420;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   self:setParam(\"intro_passed\", true)\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Are you mute?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["animation"] = "dl_shrug_short";
		["posX"] = 1770;
		["posY"] = 540;
		["script"] = "";
		["text"] = "*The aborigine sighs and gets his tired indifferent posture back.*";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 2;
		["animation"] = "dl_head_nod";
		["connectID"] = 40;
		["posX"] = 1770;
		["posY"] = 420;
		["script"] = "";
		["text"] = "*The aborigine nods slowly. It seems he has learned this gesture deliberately in order to communicate with humans.*";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 1;
		["connectID"] = 38;
		["posX"] = 450;
		["posY"] = 600;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"intro_passed\")\
end\
\
";
		["text"] = "Hey, Mute!";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 2;
		["animation"] = "dl_frustration";
		["connectID"] = 40;
		["posX"] = 690;
		["posY"] = 600;
		["script"] = "";
		["text"] = "*The abori is wincing as if he is telling you not to shout so loud into his ear: he is mute, for God's sake, not deaf!*";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 1;
		["connectID"] = 48;
		["posX"] = 2250;
		["posY"] = 450;
		["script"] = "";
		["text"] = "How did you become mute?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 1;
		["connectID"] = 43;
		["posX"] = 2250;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Who is the boss here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 2;
		["animation"] = "dl_righthand_wave_short";
		["connectID"] = 53;
		["posX"] = 2490;
		["posY"] = 570;
		["script"] = "";
		["text"] = "*The abori waves his hand in the direction of the the guy who looks just a little bit more confident than the other inhabitants of the camp. That must be their leader.*";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 1;
		["connectID"] = 49;
		["posX"] = 2250;
		["posY"] = 690;
		["script"] = "";
		["text"] = "What are you doing here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 1;
		["connectID"] = 50;
		["posX"] = 2250;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Do you have anything for sale?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 1;
		["connectID"] = 47;
		["posX"] = 2250;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "I'll be on my way.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 2;
		["animation"] = "dl_bow_1";
		["posX"] = 2490;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "*The aborigine sighs and gets his tired indifferent posture back.*";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 2;
		["animation"] = "dl_look_right";
		["connectID"] = 53;
		["posX"] = 2490;
		["posY"] = 450;
		["script"] = "";
		["text"] = "*The abori tugs at his slave collar then looks away. He is not in a mood to tell you his story. Not now.*";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 2;
		["animation"] = "dl_point_back";
		["connectID"] = 51;
		["posX"] = 2490;
		["posY"] = 690;
		["script"] = "";
		["text"] = "*The aborigine points at the pile of boxes and baskets he is standing next to.*";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 2;
		["animation"] = "dl_point_self";
		["posX"] = 2490;
		["posY"] = 810;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   self:setParam(\"trade_intro_played\", true)\
   self:startTrade()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "*The abori waves for you to come closer, inviting you to check what he has to offer.*";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 1;
		["connectID"] = 52;
		["posX"] = 2730;
		["posY"] = 690;
		["script"] = "";
		["text"] = "Are you guarding these things?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 2;
		["animation"] = "dl_head_2nods";
		["connectID"] = 53;
		["posX"] = 2970;
		["posY"] = 690;
		["script"] = "";
		["text"] = "*The aborigine nods.*";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 2;
		["connectID"] = 40;
		["posX"] = 3330;
		["posY"] = 690;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 1;
		["posX"] = 2250;
		["posY"] = 930;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   self:startTrade()\
end\
\
function message:isVisible()\
   return self:getParam(\"trade_intro_played\")\
end\
\
";
		["text"] = "\\[TRADE]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["switch_00031"] = {
		["ID"] = 31;
		["connectionsID"] = {
			[1] = 33;
			[2] = 32;
		};
		["posX"] = 1410;
		["posY"] = 480;
		["type"] = "switch";
	};
	["switch_00036"] = {
		["ID"] = 36;
		["connectionsID"] = {
			[1] = 16;
			[2] = 37;
		};
		["posX"] = 300;
		["posY"] = 540;
		["type"] = "switch";
	};
	["switch_00040"] = {
		["ID"] = 40;
		["connectionsID"] = {
			[1] = 41;
			[2] = 42;
			[3] = 44;
			[4] = 45;
			[5] = 54;
			[6] = 46;
		};
		["h"] = 160;
		["posX"] = 2100;
		["posY"] = 600;
		["type"] = "switch";
		["w"] = 100;
	};
}
local obj2 = {
	["actor_prefab"] = {
		[1] = "human_male";
		[2] = "abori";
	};
}
return obj1 ,obj2
