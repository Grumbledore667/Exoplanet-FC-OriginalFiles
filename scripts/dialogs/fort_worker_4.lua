-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 210;
		["posY"] = 480;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 1920;
		["posY"] = -30;
		["script"] = "";
		["text"] = "Well, it was an old terraform station. Now it's an Eastern Road Campaign base. Building bridges, roads, allowing civilization to reach the faraway podunks, so to speak.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 1;
		["connectID"] = 32;
		["posX"] = 1650;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Do you have any tips?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 1920;
		["posY"] = 90;
		["script"] = "";
		["text"] = "Well, officially the mercs and their moron of a captain. But around here Master Phil is the one in charge. Great fellow, nothing is done here without his approval.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 1650;
		["posY"] = 330;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 19;
		["posX"] = 750;
		["posY"] = 480;
		["script"] = "";
		["text"] = "What do you want, huma?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 1;
		["connectID"] = 20;
		["posX"] = 1650;
		["posY"] = -30;
		["script"] = "";
		["text"] = "What's this place?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 1920;
		["posY"] = -150;
		["script"] = "";
		["text"] = "I'm a builder, a free worker by the way, with education and stuff! Don't you mix us up with those poor sods in the mines, we even have our own union!";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["connectID"] = 31;
		["posX"] = 1170;
		["posY"] = 480;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"helping_hands\", \"other_workers\")\
end\
\
";
		["text"] = "The warehouse keeper needs your help.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["connectID"] = 22;
		["posX"] = 1650;
		["posY"] = 90;
		["script"] = "";
		["text"] = "Who's in charge here?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 1;
		["connectID"] = 26;
		["posX"] = 1170;
		["posY"] = 360;
		["script"] = "";
		["text"] = "I have a question.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 2;
		["posX"] = 1440;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Not gonna happen. I'm packing my shit and leaving that lousy Fort with the first caravan. Find some else to bother.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 1920;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Sure, why not. Find yourself a real trade. Riding arphants in the desert isn't a good long-term strategy, compared to a skillful master of his trade, which is always in demand.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 1;
		["connectID"] = 27;
		["posX"] = 1650;
		["posY"] = -150;
		["script"] = "";
		["text"] = "Hi! What is your task here?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 1;
		["posX"] = 1170;
		["posY"] = 600;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 1;
		["connectID"] = 24;
		["posX"] = 480;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Hey, dude...";
		["time"] = 2;
		["type"] = "message";
	};
	["switch_00019"] = {
		["ID"] = 19;
		["connectionsID"] = {
			[1] = 30;
			[2] = 28;
			[3] = 34;
		};
		["posX"] = 1020;
		["posY"] = 480;
		["type"] = "switch";
	};
	["switch_00026"] = {
		["ID"] = 26;
		["connectionsID"] = {
			[1] = 33;
			[2] = 25;
			[3] = 29;
			[4] = 21;
			[5] = 23;
		};
		["posX"] = 1470;
		["posY"] = 30;
		["type"] = "switch";
	};
}
return obj1
