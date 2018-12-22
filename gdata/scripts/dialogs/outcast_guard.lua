-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 360;
		["posY"] = 270;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isFirstTime()\
end\
\
";
		["text"] = "Hey, huma, you better behave yourself! We are poor, but that doesn't mean we can't beat your ugly pink face into a pulp!";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 31;
		["posX"] = 780;
		["posY"] = 0;
		["script"] = "function message:onStart()\
   self:setParam(\"random\", math.random(2))\
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
		["text"] = "How's it going?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 10;
		["posX"] = 780;
		["posY"] = 270;
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
		["posY"] = 390;
		["script"] = "";
		["text"] = "Why were you cast out?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["connectID"] = 12;
		["posX"] = 780;
		["posY"] = 510;
		["script"] = "";
		["text"] = "Who's in charge here?";
		["time"] = 3;
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
		["connectID"] = 36;
		["posX"] = 1020;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Doing? We live here, huma. This is our place, the best outcasts like us can afford. Still better than taking the chance every day out there in the wilderness.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 2;
		["connectID"] = 30;
		["posX"] = 1020;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Maybe cause I've cut open a bunch of huma-lovers back there in my village? Or maybe my entire tribe died out from a weird disease you damn humans brought upon us?!";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["connectID"] = 14;
		["posX"] = 1020;
		["posY"] = 510;
		["script"] = "function message:onStart()\
   setGlobalParam(\"asked_about_bighat\", true)\
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
		["text"] = "Big Hat, our Elder lives in the cave behind that container wall. And show the old one some respect! If it weren't for him, we all would be living like beasts, always at each other's throats.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["connectID"] = 15;
		["posX"] = 1020;
		["posY"] = 630;
		["script"] = "";
		["text"] = "Look around: what do you see? Desperation... It's a graveyard full of walking dead, who think they're still alive. If I were you, I would steal, lie and kill, just to not end up in a place like this.";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 1260;
		["posY"] = 510;
		["script"] = "";
		["text"] = "Ahm, and if he asks what do we need, could you ask him to send some leftowers to the gate guards, please!";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 1260;
		["posY"] = 630;
		["script"] = "";
		["text"] = "Get a gun, huma, and take what you want by force. If only I was wiser when I was younger...";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = -30;
		["posY"] = 330;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 360;
		["posY"] = 390;
		["script"] = "";
		["text"] = "What do you want, huma?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 1020;
		["posY"] = -240;
		["script"] = "";
		["text"] = "In his cave, behind the container wall. That's where we hide when the scalphunters come to raid us.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["connectID"] = 28;
		["posX"] = 780;
		["posY"] = -240;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getGlobalParam(\"asked_about_bighat\")\
end\
\
";
		["text"] = "Where can I find your leader, Big Hat?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 1260;
		["posY"] = 390;
		["script"] = "";
		["text"] = "It's none of your business, huma.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 1230;
		["posY"] = -120;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not isQuestFinished( \"angry_bugs\" ) and  self:getParam(\"random\") == 1\
end\
\
";
		["text"] = "Those damn scalp hunters can launch another attack on the village. We must keep our eyes peeled!";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 1230;
		["posY"] = 0;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return isQuestFinished( \"angry_bugs\" ) and  self:getParam(\"random\") == 1\
end\
\
";
		["text"] = "I've heard some crafty huma has driwen away those savages in Cutthroat Pass. Never thought this would be possible. Thanks to you we, guards, can finally can get some sleep. Here's one to wet your whistle, friend!";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 1230;
		["posY"] = 120;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"random\") == 2\
end\
\
";
		["text"] = "Thank Gods-in-Earth, we made these junk walls and traps. At least they keep wild beasts at bay. If only we had better weapons...";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1980;
		["posY"] = 180;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 29;
			[2] = 2;
			[3] = 3;
			[4] = 4;
			[5] = 5;
			[6] = 6;
			[7] = 7;
		};
		["posX"] = 600;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00026"] = {
		["ID"] = 26;
		["connectionsID"] = {
			[1] = 0;
			[2] = 27;
		};
		["posX"] = 210;
		["posY"] = 330;
		["type"] = "switch";
	};
	["switch_00031"] = {
		["ID"] = 31;
		["connectionsID"] = {
			[1] = 32;
			[2] = 33;
			[3] = 34;
		};
		["posX"] = 1080;
		["posY"] = 0;
		["type"] = "switch";
	};
}
return obj1
