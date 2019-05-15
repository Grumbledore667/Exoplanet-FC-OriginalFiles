-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 25;
		["posX"] = -120;
		["posY"] = 210;
		["script"] = "function message:onStart()\
   self:setParam(\"2\", true)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not self:getParam(\"2\")\
end\
\
";
		["text"] = "Even if my eyes are playing tricks on me, my nose isn't. Is this a real bar?";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["connectID"] = 32;
		["posX"] = 960;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Do you have a monopoly on cold drinks in the camp?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 1;
		["connectID"] = 33;
		["posX"] = 960;
		["posY"] = 540;
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
		["text"] = "Do you have Sweet Joy?";
		["time"] = 3.5;
		["topic"] = "broken_crane:braga_sweet_joy";
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["connectID"] = 13;
		["posX"] = 960;
		["posY"] = 690;
		["script"] = "";
		["text"] = "Bye.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["posX"] = 1230;
		["posY"] = 690;
		["script"] = "";
		["text"] = "Come back later. I'm always here.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 2;
		["posX"] = 960;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Если Джек знает про \"сладку радость\" по квесту \"сломанный кран\".";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = 2940;
		["posY"] = 390;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = -600;
		["posY"] = 300;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = -120;
		["posY"] = 420;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"2\")\
end\
\
";
		["text"] = "Hi huma, something to wet your throat?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 2;
		["connectID"] = 39;
		["posX"] = 150;
		["posY"] = 210;
		["script"] = "";
		["text"] = "That's right! My bar is called Braga's. As you might have guessed, I'm Braga. It might not look like much, but I do my best to serve the locals at the most affordable prices possible. Would you like something to wet the whistle?";
		["time"] = 22.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = 2580;
		["posY"] = 240;
		["script"] = "";
		["text"] = "So don't go moaning that my cold booze is too expensive. You won't find anything cheaper within a day's walk!";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["connectID"] = 31;
		["posX"] = 1770;
		["posY"] = 240;
		["script"] = "";
		["text"] = "So you live here?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 2;
		["connectID"] = 29;
		["posX"] = 1500;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Oh, huma, if only you knew how hard it was to get it and fix it! And my electricity bill is through the roof! But with electricity I can stay open 24/7!";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 2;
		["connectID"] = 40;
		["posX"] = 2040;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Of course! I have to make sure the locals don't try to steal the fridge. It's locked, but those bastards would steal anything that's not tied to a steel pole with a 200-pound chain.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["connectID"] = 30;
		["posX"] = 1230;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Monopoly? I prefer to call it an \"exclusive service\". I can't stop them buying a fridge, but there are only two in the camp, and the other one is in Big Hat's lair.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 2;
		["connectID"] = 34;
		["posX"] = 1230;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Sweet Joy? I don't keep that stuff in my bar. I'm for a healthy lifestyle — only good old booze, and none of that junk.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 1;
		["connectID"] = 35;
		["posX"] = 1500;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Do you really think you're supporting a healthy lifestyle by selling alcohol?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = 1770;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Of course! Try surviving a day or two in this camp without a glass of good booze and you'll either lose your mind or catch something nasty!";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 1;
		["connectID"] = 38;
		["posX"] = 960;
		["posY"] = 60;
		["script"] = "";
		["text"] = "Show me what you've got.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 2;
		["posX"] = 1230;
		["posY"] = 60;
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
";
		["text"] = "Sure, choose whatever you like.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = 420;
		["posY"] = 210;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00040"] = {
		["ID"] = 40;
		["actor"] = 2;
		["connectID"] = 28;
		["posX"] = 2310;
		["posY"] = 240;
		["script"] = "";
		["text"] = "My business won't last long without the fridge. I care more about it than about my own child!";
		["time"] = 10;
		["type"] = "message";
	};
	["switch_00004"] = {
		["ID"] = 4;
		["connectionsID"] = {
			[1] = 36;
			[2] = 5;
			[3] = 7;
			[4] = 12;
		};
		["h"] = 120;
		["posX"] = 780;
		["posY"] = 270;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00021"] = {
		["ID"] = 21;
		["connectionsID"] = {
			[1] = 2;
			[2] = 24;
		};
		["posX"] = -330;
		["posY"] = 300;
		["type"] = "switch";
	};
}
return obj1
