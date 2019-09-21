-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 2;
		["connectID"] = 2;
		["posX"] = 60;
		["posY"] = 90;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["posX"] = 450;
		["posY"] = -120;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["connectID"] = 5;
		["posX"] = 450;
		["posY"] = 270;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 930;
		["posY"] = 150;
		["script"] = "";
		["text"] = "Hey, huma. Name's Flea. I sell lots of useful stuff.";
		["time"] = 6;
		["topic"] = "ragpicker_heist:sand_flea_first_greeting";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["connectID"] = 29;
		["posX"] = 930;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Hey kid.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 1;
		["connectID"] = 69;
		["posX"] = 2700;
		["posY"] = -90;
		["script"] = "";
		["text"] = "Where'd you get lockpicks?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["posX"] = 2700;
		["posY"] = 510;
		["script"] = "";
		["text"] = "So long, kid.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 1200;
		["posY"] = 360;
		["script"] = "";
		["text"] = "What?";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 1;
		["connectID"] = 31;
		["posX"] = 2700;
		["posY"] = 120;
		["script"] = "";
		["text"] = "So what's your story?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 2;
		["connectID"] = 58;
		["posX"] = 2970;
		["posY"] = 120;
		["script"] = "";
		["text"] = "Name's Flea. I sell lots of useful stuff.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 4890;
		["posY"] = 120;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 1;
		["connectID"] = 63;
		["posX"] = 1200;
		["posY"] = 150;
		["script"] = "";
		["text"] = "Like what?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 2;
		["connectID"] = 38;
		["posX"] = 930;
		["posY"] = -150;
		["script"] = "";
		["text"] = "Well, huma, guess you too want to check if that twit Ragpicker keeps something other than rags in his warehouse?";
		["time"] = 11;
		["topic"] = "ragpicker_heist:sand_flea_heist_greeting";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 1;
		["connectID"] = 39;
		["posX"] = 1200;
		["posY"] = -150;
		["script"] = "";
		["text"] = "You've got a good eye, kid. Suppose I got curious about the warehouse — what do you care?";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 2;
		["connectID"] = 50;
		["posX"] = 1470;
		["posY"] = -150;
		["script"] = "";
		["text"] = "Nothing really — but you aren't getting in there without a good lockpick.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00040"] = {
		["ID"] = 40;
		["actor"] = 1;
		["posX"] = 2700;
		["posY"] = -330;
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
		["text"] = "\\[TRADE]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 2;
		["connectID"] = 32;
		["posX"] = 4320;
		["posY"] = -90;
		["script"] = "";
		["text"] = "For now, you're welcome to buy lockpicks from me.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 2040;
		["posY"] = -150;
		["script"] = "";
		["text"] = "Ran across some when rummaging through the garbage the other day. You won't get a better price anywhere in the camp.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 2;
		["connectID"] = 47;
		["posX"] = 3240;
		["posY"] = -90;
		["script"] = "";
		["text"] = "But you're quick, huma! Okay, tell you a secret — I get them from a local tinkerer. Guy makes them out of scrap. Just don't try approaching him yourself.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 1;
		["connectID"] = 48;
		["posX"] = 3510;
		["posY"] = -90;
		["script"] = "";
		["text"] = "Why's that? I bet I could buy cheaper directly from him.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 2;
		["connectID"] = 56;
		["posX"] = 3780;
		["posY"] = -90;
		["script"] = "";
		["text"] = "That ain't gonna work out. He won't even talk to you unless he knows you.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 1;
		["connectID"] = 43;
		["posX"] = 1740;
		["posY"] = -150;
		["script"] = "";
		["text"] = "Let me guess, you want to sell me lockpicks?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 1;
		["connectID"] = 52;
		["posX"] = 2700;
		["posY"] = 330;
		["script"] = "";
		["text"] = "Is it even legal to sell something like lockpicks?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 2;
		["connectID"] = 54;
		["posX"] = 2970;
		["posY"] = 330;
		["script"] = "";
		["text"] = "What law am I breaking? I'm not making anyone stick the pick anywhere, much less someone's locks.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 1;
		["connectID"] = 55;
		["posX"] = 3510;
		["posY"] = 330;
		["script"] = "";
		["text"] = "Someone else's hoverbike, I suppose?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 2;
		["connectID"] = 53;
		["posX"] = 3240;
		["posY"] = 330;
		["script"] = "";
		["text"] = "It's just a tool. Like, you leave home and realize you've lost your keys, or you've broken the key off when trying to start a hoverbike.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 2;
		["connectID"] = 32;
		["posX"] = 3780;
		["posY"] = 330;
		["script"] = "";
		["text"] = "Gods in the Earth, huma! Who do you think I am?! I'm just an abori who sells tools. It's up to you how you're gonna use them. The decisions you make as well as the consequences are all yours.";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 2;
		["connectID"] = 41;
		["posX"] = 4050;
		["posY"] = -90;
		["script"] = "";
		["text"] = "And to get to know him, you gotta have some clout among \"aboris in the know.\" It's up to you to build it up.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 1;
		["connectID"] = 59;
		["posX"] = 3240;
		["posY"] = 120;
		["script"] = "";
		["text"] = "I'm not asking that. Were you born here?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 2;
		["connectID"] = 68;
		["posX"] = 3510;
		["posY"] = 120;
		["script"] = "";
		["text"] = "Sure, where else? I'm Braga's kid. The only one from the brood who made it alive. My parents never gave a rat's ass about me. One's dead now, and the other cares way more about his booze joint than he does about his offspring.";
		["time"] = 23;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 2;
		["connectID"] = 62;
		["posX"] = 4080;
		["posY"] = 120;
		["script"] = "";
		["text"] = "I'm not planning on carrying on like this for long, though, huma. As soon as I've set aside some greenies, I'll scram for Jackpot Town. There's always something to be done there for an abori like me.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 1;
		["connectID"] = 32;
		["posX"] = 4350;
		["posY"] = 120;
		["script"] = "";
		["text"] = "Sounds like a plan. Good luck with that, kid.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 2;
		["connectID"] = 64;
		["posX"] = 1470;
		["posY"] = 150;
		["script"] = "";
		["text"] = "Like knives, roll-ups, water, matches, lockpicks...";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 1;
		["connectID"] = 43;
		["posX"] = 1740;
		["posY"] = 150;
		["script"] = "";
		["text"] = "Where'd you get them lockpicks?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
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
		["posX"] = 1470;
		["posY"] = 30;
		["script"] = "";
		["text"] = "Добавить другие бросовые товары.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 3810;
		["posY"] = 120;
		["script"] = "";
		["text"] = "So I had to make a living doing my own thing, selling all kinds of junk. Works fine by me. Got food, found a safe place to sleep and no one's yelling at me for skipping the chores in his piss-stinking bar.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 1;
		["connectID"] = 46;
		["posX"] = 2970;
		["posY"] = -90;
		["script"] = "";
		["text"] = "Come on, you don't tell me stuff like that is something you can pick up in a dumpster.";
		["time"] = 10;
		["type"] = "message";
	};
	["switch_00002"] = {
		["ID"] = 2;
		["connectionsID"] = {
			[1] = 3;
			[2] = 4;
		};
		["outputSlots"] = 2;
		["posX"] = 300;
		["posY"] = 90;
		["type"] = "switch";
	};
	["switch_00005"] = {
		["ID"] = 5;
		["connectionsID"] = {
			[1] = 37;
			[2] = 6;
			[3] = 12;
		};
		["outputSlots"] = 3;
		["posX"] = 750;
		["posY"] = 270;
		["type"] = "switch";
	};
	["switch_00026"] = {
		["ID"] = 26;
		["connectionsID"] = {
			[1] = 40;
			[2] = 27;
			[3] = 30;
			[4] = 51;
			[5] = 28;
		};
		["h"] = 140;
		["outputSlots"] = 5;
		["posX"] = 2490;
		["posY"] = 150;
		["type"] = "switch";
		["w"] = 100;
	};
}
return obj1
