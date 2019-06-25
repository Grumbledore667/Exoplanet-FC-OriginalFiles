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
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 2;
		["connectID"] = 10;
		["posX"] = 1020;
		["posY"] = 180;
		["script"] = "";
		["text"] = "Nah, do I look like some crazy pirate to you? Ah, the eyepatch! Man, I just wear it to look cool. I'm digging in the old trash piles. People were much richer in the first wave of colonization, they threw away pretty good stuff: tools, materials.";
		["time"] = 24;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 2;
		["connectID"] = 11;
		["posX"] = 1020;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Well, they call me Kenneth the Mighty Junk Beard. Just kidding, dude. I'm Kenneth. Don't know how to describe my profession.  ";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["connectID"] = 14;
		["posX"] = 1020;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Man, get yourself a sturdy shovel, and instead of coughing your lungs out in one of those horrible antigravium mines, look for the old trash piles. You can make a fortune just by striking the earth in the right place!";
		["time"] = 21;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["connectID"] = 2;
		["posX"] = 750;
		["posY"] = 180;
		["script"] = "";
		["text"] = "Hey, you dug all these pits? Looking for some kind of treasure?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["connectID"] = 3;
		["posX"] = 750;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Who are you actually?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["connectID"] = 4;
		["posX"] = 750;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Got some advice for me?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1290;
		["posY"] = 180;
		["script"] = "";
		["text"] = "They aren't worth much but can fetch a decent price and serve well in the right hands. I do the digging and my partner Kwagga sells my findings in the Fort. Check his store when you get there. All for ten - or something like that, it's hard to miss.";
		["time"] = 26;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 1;
		["connectID"] = 12;
		["posX"] = 1290;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Grave robber?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["animation"] = "dl_stop_twohand";
		["connectID"] = 15;
		["posX"] = 1560;
		["posY"] = 300;
		["script"] = "";
		["text"] = "God forbid! I never touch the dead, may they rest in peace! There's enough abandoned ruins of the First Wave and old construction sites for me to make my living.";
		["time"] = 43.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 1;
		["posX"] = 750;
		["posY"] = 540;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1290;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Well, at least it will bring you some food and booze, like it does for me.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1830;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Let's say I'm a prospector of my own kind. I dig not for the antigravium but for artifacts of human culture and give them a second life. You know, those things, they don't want to rust and rot in the dirt. They are made for work. I make them happy... I like to think so.";
		["time"] = 1;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 5;
			[2] = 6;
			[3] = 8;
			[4] = 13;
		};
		["h"] = 120;
		["posX"] = 600;
		["posY"] = 300;
		["type"] = "switch";
		["w"] = 100;
	};
}
local obj2 = {
	["actor_prefab"] = {
		[2] = "abori";
	};
}
return obj1 ,obj2
