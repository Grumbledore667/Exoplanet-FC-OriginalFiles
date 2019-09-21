-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 1;
		["connectID"] = 9;
		["posX"] = 660;
		["posY"] = 540;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["posX"] = 660;
		["posY"] = 180;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = 270;
		["posY"] = 360;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 2;
		["connectID"] = 6;
		["posX"] = 1140;
		["posY"] = 480;
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
		["text"] = "Oh, I recognize that glint in your eyes, huma. That thirst for the exploration of the... unknown areas. I can help you with that.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["connectID"] = 7;
		["posX"] = 1410;
		["posY"] = 480;
		["script"] = "";
		["text"] = "How exactly?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 2;
		["connectID"] = 8;
		["posX"] = 1680;
		["posY"] = 480;
		["script"] = "";
		["text"] = "By selling you... let’s call it a magic key. Buy it, and nothing will hinder your ability to explore places... otherwise inaccessible.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 1;
		["connectID"] = 15;
		["posX"] = 2220;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Who are you? Do you have a name?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["connectID"] = 17;
		["posX"] = 2220;
		["posY"] = 510;
		["script"] = "";
		["text"] = "What if one of your customers decides to sell you out to the local law?";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 2220;
		["posY"] = 660;
		["script"] = "";
		["text"] = "Where do you get your merchandise?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 1;
		["connectID"] = 28;
		["posX"] = 2220;
		["posY"] = 990;
		["script"] = "";
		["text"] = "So long.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["connectID"] = 16;
		["posX"] = 2490;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Ah, huma, leave names for the more remarkable personalities. I'm just a humble trader who deals in... special wares. Totally forgettable.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["connectID"] = 27;
		["posX"] = 2760;
		["posY"] = 390;
		["script"] = "";
		["text"] = "I see. You don't want to get noticed by the law.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 2490;
		["posY"] = 510;
		["script"] = "";
		["text"] = "That would be the most unwise thing to do. I wil be set free faster than crucasses multiply. And the snitch will end up with a long sharp object in his kidney one day.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["connectID"] = 20;
		["posX"] = 2490;
		["posY"] = 660;
		["script"] = "";
		["text"] = "An old twongo in outcast camp makes these magic keys. A skilled tinkerer he is. Has a knack for little useful contraptions.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 1;
		["connectID"] = 26;
		["posX"] = 2760;
		["posY"] = 660;
		["script"] = "";
		["text"] = "How can I find that tinkerer of yours?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["connectID"] = 8;
		["posX"] = 3630;
		["posY"] = 660;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 1;
		["connectID"] = 23;
		["posX"] = 2220;
		["posY"] = 810;
		["script"] = "function message:onStart()\
   self:setParam(\"trade_intro_played\", true)\
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
		["text"] = "Show me your wares.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 2;
		["posX"] = 2490;
		["posY"] = 810;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   self:startTrade()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "I keep only the best stuff. Check it yourself.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 8;
		["posX"] = 1140;
		["posY"] = 630;
		["script"] = "";
		["text"] = "Came back for my wares?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 3030;
		["posY"] = 660;
		["script"] = "";
		["text"] = "Don't even try. He won't talk to a stranger and you... you might draw the attention of some very dangerous ngongo madrons while asking around that terrible place he lives in.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 3030;
		["posY"] = 390;
		["script"] = "";
		["text"] = "It is good to deal with such cunning customer as you are, huma. So let's do our business and forget that we saw each other... till the next time.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["posX"] = 2490;
		["posY"] = 990;
		["script"] = "";
		["text"] = "See you, huma. Don't get caught while... exploring.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["posX"] = 2220;
		["posY"] = 240;
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
	["switch_00004"] = {
		["ID"] = 4;
		["connectionsID"] = {
			[1] = 2;
			[2] = 1;
		};
		["posX"] = 510;
		["posY"] = 360;
		["type"] = "switch";
	};
	["switch_00008"] = {
		["ID"] = 8;
		["connectionsID"] = {
			[1] = 29;
			[2] = 11;
			[3] = 12;
			[4] = 13;
			[5] = 22;
			[6] = 14;
		};
		["h"] = 160;
		["posX"] = 2040;
		["posY"] = 510;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00009"] = {
		["ID"] = 9;
		["connectionsID"] = {
			[1] = 5;
			[2] = 24;
		};
		["posX"] = 960;
		["posY"] = 540;
		["type"] = "switch";
	};
}
return obj1
