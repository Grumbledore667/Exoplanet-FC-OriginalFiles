-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 300;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Talking to prisoners is not allowed. State your business or leave immediately: this is not a fucking menagerie!";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 10;
		["posX"] = 788;
		["posY"] = 245.499664307;
		["script"] = "";
		["text"] = "What are you doing here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["connectID"] = 11;
		["posX"] = 780;
		["posY"] = 360;
		["script"] = "";
		["text"] = "So you're a soldier?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["connectID"] = 12;
		["posX"] = 780;
		["posY"] = 510;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getGlobalParam(\"asked_about_castor\")\
end\
\
";
		["text"] = "Who can give me a permission to talk to prisoners?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["connectID"] = 13;
		["posX"] = 780;
		["posY"] = 630;
		["script"] = "";
		["text"] = "Do you have any tips?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 1;
		["posX"] = 780;
		["posY"] = 750;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1050;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Are you blind or retarded? I'm guarding the brig.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1050;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Yes. I always was and always will be. Me and the Old Man Castor are the only professionals on this site. The rest are farmers' sons and some local criminal scum playing \"Wild Geese\". I remember Castor since the first Orha campaign: a young sergeant always red faced from shouting at us rookies. I'm still alive only thanks to the Old Man.";
		["time"] = 32;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["connectID"] = 14;
		["posX"] = 1050;
		["posY"] = 510;
		["script"] = "function message:onStart()\
   setGlobalParam(\"asked_about_castor\", true)\
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
		["text"] = "Captain Castor. But why would he? You think this is some kind of civ's fancy prison with chaplain, psychoanalyst and stuff? This is a brig on a military site, kiddo. There is martial law here and these bastards are waiting for severe punishment, not just serving their time. Talking to them won't make any difference.";
		["time"] = 28.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1020;
		["posY"] = 630;
		["script"] = "";
		["text"] = "Tips? Well, kiddo, always keep a good knife at hand. Knives don't jam.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1320;
		["posY"] = 510;
		["script"] = "";
		["text"] = "You can try to convince the Old Man to give you permission though and I really hope that he will make you work your ass off for it.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["connectID"] = 24;
		["posX"] = 450;
		["posY"] = -180;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return isQuestActive(\"wet_work\") or getGlobalParam(\"asked_about_castor\")\
end\
\
";
		["text"] = "Where can I find captain Castor?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 720;
		["posY"] = -180;
		["script"] = "";
		["text"] = "The upper floor of the main building is his place. If he isn't in the room he's probably smoking on the balcony.";
		["time"] = 12;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 23;
			[2] = 3;
			[3] = 4;
			[4] = 5;
			[5] = 6;
			[6] = 7;
		};
		["posX"] = 600;
		["posY"] = 300;
		["type"] = "switch";
	};
}
return obj1
