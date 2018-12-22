-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 16;
		["posX"] = 210;
		["posY"] = 480;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 1;
		["animation"] = "dl_point_back";
		["connectID"] = 11;
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
		["text"] = "Hey, Master Phil said you must go help the warehouse manager.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 2;
		["animation"] = "dl_hand_facepalm";
		["posX"] = 1440;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Leave me alone huma. I've got a splitting headache after the explosion on the bridge, can't even stand straight.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 1;
		["posX"] = 1170;
		["posY"] = 600;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["connectID"] = 17;
		["posX"] = 480;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Hey, you...";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["animation"] = "dl_head_wipe";
		["connectID"] = 14;
		["posX"] = 750;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Oh, Gods-in-Earth, you are speaking too loud! What the hell do you want?";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 1;
		["connectID"] = 14;
		["posX"] = 1650;
		["posY"] = 330;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = 1920;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Sure, why not. Find yourself a real trade. Riding arphants in the desert isn't a good long-term strategy, compared to a skillful master of his trade, which is always in demand.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 1;
		["connectID"] = 24;
		["posX"] = 1650;
		["posY"] = -150;
		["script"] = "";
		["text"] = "Hi! What is your task here?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = 1920;
		["posY"] = -30;
		["script"] = "";
		["text"] = "Well, it was an old terraform station. Now it's an Eastern Road Campaign base. Building bridges, roads, allowing civilization to reach the faraway podunks, so to speak.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["connectID"] = 22;
		["posX"] = 1650;
		["posY"] = -30;
		["script"] = "";
		["text"] = "What's this place?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = 1920;
		["posY"] = -150;
		["script"] = "";
		["text"] = "I'm a builder, a free worker by the way, with education and stuff! Don't you mix us up with those poor sods in the mines, we even have our own union!";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = 1920;
		["posY"] = 90;
		["script"] = "";
		["text"] = "Well, officially the mercs and their moron of a captain. But around here Master Phil is the one in charge. Great fellow, nothing is done here without his approval.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 1;
		["connectID"] = 25;
		["posX"] = 1650;
		["posY"] = 90;
		["script"] = "";
		["text"] = "Who's in charge here?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 1;
		["connectID"] = 20;
		["posX"] = 1650;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Do you have any tips?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = 1170;
		["posY"] = 360;
		["script"] = "";
		["text"] = "I have a question.";
		["time"] = 3;
		["type"] = "message";
	};
	["switch_00014"] = {
		["ID"] = 14;
		["connectionsID"] = {
			[1] = 28;
			[2] = 10;
			[3] = 15;
		};
		["posX"] = 1020;
		["posY"] = 480;
		["type"] = "switch";
	};
	["switch_00018"] = {
		["ID"] = 18;
		["connectionsID"] = {
			[1] = 21;
			[2] = 23;
			[3] = 26;
			[4] = 27;
			[5] = 19;
		};
		["h"] = 140;
		["posX"] = 1470;
		["posY"] = 30;
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
