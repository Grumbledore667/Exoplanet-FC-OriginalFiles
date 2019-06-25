-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 330;
		["posY"] = 300;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 2;
		["animation"] = "dl_frustration";
		["connectID"] = 1;
		["posX"] = 1020;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Can you resurrect dead, huma? The ones that got shredded into a gory mess with metal shrapnel? No, I don't think so. So just leave me alone for I need to make a decision. Maybe my last one.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1020;
		["posY"] = 120;
		["script"] = "";
		["text"] = "You think so, huma? I can see only deadly fall and hard rocks beneath. A fitting end for my sad story. The last escape for a miserable coward.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 2;
		["animation"] = "dl_sneeze";
		["connectID"] = 17;
		["posX"] = 1290;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Not to me, huma. To my friends and the one I loved the most. My beloved one was killed when the bomb exploded under the cursed bridge. And he was carrying our eggs, our little ones... Just two weeks after the mating, but I feel like I already could hear them moving inside the shells...";
		["time"] = 28.5;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 2;
		["posX"] = 750;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Can I help you somehow?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["animation"] = "dl_look_up";
		["connectID"] = 3;
		["posX"] = 750;
		["posY"] = 120;
		["script"] = "";
		["text"] = "Nice view, eh?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["animation"] = "dl_hands_dontknow";
		["connectID"] = 16;
		["posX"] = 750;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Perhaps it's just me, but you seem to have such an unhappy, depressed look about you...";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["connectID"] = 4;
		["posX"] = 1020;
		["posY"] = 420;
		["script"] = "";
		["text"] = "...almost as if something had happened to you, some kind of great suffering.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["animation"] = "dl_look_down_long";
		["connectID"] = 18;
		["posX"] = 1560;
		["posY"] = 420;
		["script"] = "";
		["text"] = "My older brother was wounded... grievously. Now he is dying in fever, abandoned by everyone, in his own filth, dumped into the container shack like a sick dog. I'm neither able to help him nor end his suffering. I just don't have the guts to enter that place anymore.";
		["time"] = 26;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 19;
		["posX"] = 1800;
		["posY"] = 420;
		["script"] = "";
		["text"] = "I wish it was my shift and that I was killed or wounded... I wish I had more guts to convince them to leave this place before it happened. But I didn't.";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 1;
		["posX"] = 2040;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Now, can you imagine what I really feel, huma? You say I'm suffering? No, I just feel... discomfort. I want to escape... I want it all... to end.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 1;
		["posX"] = 750;
		["posY"] = 540;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 6;
			[2] = 5;
			[3] = 8;
			[4] = 20;
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
		[1] = "human_male";
		[2] = "abori";
	};
}
return obj1 ,obj2
