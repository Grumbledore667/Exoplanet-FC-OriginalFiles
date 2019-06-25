-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 1;
		["connectID"] = 2;
		["posX"] = 270;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Watcha doing?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 2;
		["connectID"] = 25;
		["posX"] = 540;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Onta? Banga jish, huma! Abori jaga ranta.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["connectID"] = 7;
		["posX"] = 1350;
		["posY"] = 150;
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
		["text"] = "\\[Give Cold Booze]How about a bottle of cold booze? Could this help us to break the language barrier?";
		["time"] = 10;
		["topic"] = "broken_crane:nut_give_booze";
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 2;
		["connectID"] = 13;
		["posX"] = 1590;
		["posY"] = 150;
		["script"] = "";
		["text"] = "Oh, huma. Shir roma gadron! Jaga boozlo.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["connectID"] = 9;
		["posX"] = 1350;
		["posY"] = 300;
		["script"] = "";
		["text"] = "How come you can't speak Engal while other aboris have no trouble communicating with me? Are you stupid or what?";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 24;
		["posX"] = 1590;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Imra twongo! Onta rem, huma tongue gish avar, nga? Onta - ngongo! Onta tol huma ker gerbah, naber gish. Ngongo huma tongue baha. Ngongo jar sek ngongo'ta, jabron.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 1;
		["connectID"] = 27;
		["posX"] = 1350;
		["posY"] = 930;
		["script"] = "";
		["text"] = "I better get going.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 2;
		["posX"] = 1860;
		["posY"] = 990;
		["script"] = "";
		["text"] = "Sen gerooh, huma.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 1;
		["connectID"] = 16;
		["posX"] = 1860;
		["posY"] = 150;
		["script"] = "";
		["text"] = "So what do you say now?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 2;
		["connectID"] = 25;
		["posX"] = 2760;
		["posY"] = 300;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["posX"] = 1590;
		["posY"] = 30;
		["script"] = "";
		["text"] = "должен выпить бутылку буза и сидеть с ней подпивая.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 2130;
		["posY"] = 150;
		["script"] = "";
		["text"] = "Oh... hm, hertan groh booze, nga?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 1;
		["connectID"] = 14;
		["posX"] = 2400;
		["posY"] = 150;
		["script"] = "";
		["text"] = "I don't feel like it. Guess it was pointless to try.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 1;
		["connectID"] = 20;
		["posX"] = 270;
		["posY"] = 420;
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
		["text"] = "Serves you right, you lazy asshole? Don't pretend you can't understand what I'm saying!";
		["time"] = 8;
		["topic"] = "broken_crane:cog_was_beaten";
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 540;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Stop, huma! Me fight no more! Talk Cog - he know huma tongue good! Alar magon ker!";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 1;
		["connectID"] = 25;
		["posX"] = 810;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Now you make sense. Mess with me again and I will teach you another lesson of \"huma tongue\". That's a promise.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = -180;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Hey!";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 2;
		["posX"] = 270;
		["posY"] = 540;
		["script"] = "";
		["text"] = "На случай если отлупил.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 1;
		["connectID"] = 26;
		["posX"] = 1860;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Great, if only I knew what all this ngongo-twongo gibberish is! Guess I need to buy an upgrade for my translator impant with all local dialects.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 2;
		["connectID"] = 14;
		["posX"] = 2130;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Nir madron twongo, nga.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["posX"] = 1860;
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
		["text"] = "Nga bagga, madron!";
		["time"] = 2.5;
		["topic"] = "broken_crane:cog_was_beaten";
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 2;
		["posX"] = 1860;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Если бил то отвечет это в стиле \"Да вали, мудак\"";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 1;
		["connectID"] = 31;
		["posX"] = 1350;
		["posY"] = 600;
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
		["text"] = "Do you know anything about \"sweet joy\"?";
		["time"] = 4.5;
		["topic"] = "broken_crane:nut_sweet_joy";
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 2;
		["connectID"] = 14;
		["posX"] = 1620;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Nai, nga bagga, huma!";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["colors"] = {
			[4] = {
				[1] = 255;
				[2] = 128;
				[3] = 64;
				[4] = 255;
			};
			[6] = {
				[1] = 255;
				[2] = 128;
				[3] = 64;
				[4] = 255;
			};
		};
		["posX"] = 1350;
		["posY"] = 480;
		["script"] = "";
		["text"] = "После того, как Джек узнает от рабочих про сладкую радость.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["switch_00018"] = {
		["ID"] = 18;
		["connectionsID"] = {
			[1] = 1;
			[2] = 19;
		};
		["posX"] = 90;
		["posY"] = 360;
		["type"] = "switch";
	};
	["switch_00025"] = {
		["ID"] = 25;
		["connectionsID"] = {
			[1] = 6;
			[2] = 8;
			[3] = 30;
			[4] = 10;
		};
		["h"] = 120;
		["posX"] = 1140;
		["posY"] = 300;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00027"] = {
		["ID"] = 27;
		["connectionsID"] = {
			[1] = 28;
			[2] = 11;
		};
		["posX"] = 1650;
		["posY"] = 930;
		["type"] = "switch";
	};
}
local obj2 = {
	["actor_prefab"] = {
		[2] = "abori";
	};
}
return obj1 ,obj2
