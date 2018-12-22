-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 1;
		["connectID"] = 1;
		["posX"] = 300;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Visiting someone you knew?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 2;
		["animation"] = "dl_look_down_long";
		["connectID"] = 2;
		["posX"] = 570;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Oh, huma, I knew everyone buried here. In fact, when we started to work on the construction of that cursed bridge, there was no graveyard here. I wonder if I will join them soon...";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 3;
		["posX"] = 840;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Do not despair, things will get better!";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["posX"] = 1110;
		["posY"] = 300;
		["script"] = "";
		["text"] = "I don't have the strength to hope for something anymore, huma. I accept my fate, whatever it is.   ";
		["time"] = 11.5;
		["type"] = "message";
	};
}
local obj2 = {
	["actor_prefab"] = {
		[2] = "abori";
	};
}
return obj1 ,obj2
