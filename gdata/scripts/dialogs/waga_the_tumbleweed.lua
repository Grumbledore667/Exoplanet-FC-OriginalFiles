-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 2;
		["connectID"] = 33;
		["posX"] = 720;
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
		["text"] = "Greetings, huma! Need some supplies or something to make you feel better? All day and night, wherever his feet have carried him, Waga the Tumbleweed is at your service! ";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["connectID"] = 92;
		["posX"] = 1170;
		["posY"] = 630;
		["script"] = "";
		["text"] = "\\[END]Later. ";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 1;
		["posX"] = 1170;
		["posY"] = -210;
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
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["connectID"] = 33;
		["posX"] = 720;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Oh, a returning customer! How humble Waga can help you?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 1;
		["connectID"] = 47;
		["posX"] = 1170;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Is there a story behind your name?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 2;
		["connectID"] = 48;
		["posX"] = 1410;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Nothin' special. People named me that way when I was still young: could not stay at one place for two days in a row. What a jackass I were, could have ended up in a gang of drifters or scalp hunters if not for one quite memorable encounter.";
		["time"] = 24.5;
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 1;
		["connectID"] = 49;
		["posX"] = 1650;
		["posY"] = 270;
		["script"] = "";
		["text"] = "So whom did you meet? Some kind of religious preacher? The fortune telling shaman has told you that becoming a wandering merchant is your fate?";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 2;
		["connectID"] = 50;
		["posX"] = 1890;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Nah, I don't belive in these allmighty Gods-in-the-Earth crap and other tales. One day I've met the Hunchback Boma! The old man lost his right arm, was as blind as a molerat, but still peddled his wares all across the White and Red Ergs.";
		["time"] = 23.5;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 2;
		["connectID"] = 51;
		["posX"] = 2130;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Man, was I impressed. That abori was a living legend: he was already in the business before my grandfather hatched from his egg! He survived two wars, countless uprisings, brought his wares to the besieged fortresses and most secluded nomad tribes. ";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 2;
		["connectID"] = 52;
		["posX"] = 2370;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Some say he even had the Great Swamp Cannibal tribes in the list of his usual customers. Been said he found the legendary Hidden City of Awanna, traded with it's strange inhabitants and brought the relics of the Golden Age back. ";
		["time"] = 23;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 1;
		["connectID"] = 53;
		["posX"] = 2610;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Sounds like a bunch of gossips and legends, probably made up by your legendary Boma himself to boost his sales and get some free drinks from the suckers for the storytelling.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 2;
		["connectID"] = 54;
		["posX"] = 2850;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Think what you want, huma, but even if one tenth of the tales about Hunchback Boma is true, the old man was and stays a great role model for me!";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 2;
		["connectID"] = 62;
		["posX"] = 3090;
		["posY"] = 270;
		["script"] = "";
		["text"] = "When we met we talked the whole night through. Then I realized that becoming a bandit is like putting yourself on a short leash: with every crime fewer and fewer doors will be open for you.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 2;
		["connectID"] = 56;
		["posX"] = 3570;
		["posY"] = 270;
		["script"] = "";
		["text"] = "So I decided to become a wandering merchant like Boma, to explore this vast world on my own. I also took his advice to take my nickname as a trademark: Waga the Tumbleweed - sounds good enough and describes well both my personality and my trade.";
		["time"] = 24;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 1;
		["connectID"] = 57;
		["posX"] = 3810;
		["posY"] = 270;
		["script"] = "";
		["text"] = "But what about the Boma? Where is he now?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 2;
		["connectID"] = 58;
		["posX"] = 4050;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Nobody knows. Haven't seen him since that night. They say one day he just left the last village he visited, wandered into the desert as he usually did and never returned. Some drunken caravaneers were bragging about meeting him but I don't believe those lying tongues. ";
		["time"] = 24.5;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 2;
		["connectID"] = 91;
		["posX"] = 4290;
		["posY"] = 270;
		["script"] = "";
		["text"] = "I thik he has finally found the most beatiful place on K'Tharsis and is resting there forever. It's better to become a legend through great effort, than a sorry pile of bones in an untended grave in a backyard of some rundown village and never try.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 2;
		["connectID"] = 55;
		["posX"] = 3330;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Boma has told me that being a good merchant never was his main goal. He was simply exploring the world, searching for new amazing places and interesting people. He hoped to find the most beatiful place on K'Tharsis some day and settle there once he gets tired of wandering.";
		["time"] = 26.5;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 1;
		["connectID"] = 64;
		["posX"] = 1170;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Is it hard to be a wandering merchant on this planet?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 2;
		["connectID"] = 65;
		["posX"] = 1410;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Well, as you might think, I have nothing to compare with. K'Tharsis is my birthplace, here I will live and here I will die. I'm trying to have the best of my time here though.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00065"] = {
		["ID"] = 65;
		["actor"] = 2;
		["connectID"] = 66;
		["posX"] = 1650;
		["posY"] = 390;
		["script"] = "";
		["text"] = "I guess it depends on the person: for me it's more about life style than profits. I like my freedom and I take pride in my ability to get where I want unharmed. To deliver the goods that are needed most.";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00066"] = {
		["ID"] = 66;
		["actor"] = 1;
		["connectID"] = 67;
		["posX"] = 1890;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Never thought to set up a shop in a town? Should be safer, easier and more profitable.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
		["actor"] = 2;
		["connectID"] = 68;
		["posX"] = 2130;
		["posY"] = 390;
		["script"] = "";
		["text"] = "No way! I'd better have bright stars as my ceiling and open desert as a room than smelling the stench of a town. Even if I visit a town - I prefer to camp outside. I'm a nomad by nature. Staying in one place will kill me in a week.";
		["time"] = 26;
		["type"] = "message";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 2;
		["connectID"] = 91;
		["posX"] = 2370;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Besides, the towns have their dangers as well - robbers, sanitary service's inspections, taxes and such. At least I know the dangers of the desert and how to avoid them.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 1;
		["connectID"] = 70;
		["posX"] = 1170;
		["posY"] = -90;
		["script"] = "function message:onStart()\
   self:setParam(\"asked_map\", true)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getNPC():getTradeInventory():getItemByName(\"windscream_canyon_map.itm\")\
      and self:isFirstTime()\
end\
\
";
		["text"] = "I need a map. Do you have one for sale?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00070"] = {
		["ID"] = 70;
		["actor"] = 2;
		["connectID"] = 91;
		["posX"] = 1410;
		["posY"] = -90;
		["script"] = "";
		["text"] = "Yes, I've got one. Printed by Terraform's own typography. Some friends of my friends found and cracked open a full container of those. Accidentally of course. I'll make a discount for you - only 200 shards and it's yours!";
		["time"] = 26.5;
		["type"] = "message";
	};
	["message_00071"] = {
		["ID"] = 71;
		["actor"] = 1;
		["connectID"] = 93;
		["posX"] = 1170;
		["posY"] = 90;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"asked_map\")\
      and self:getNPC():getTradeInventory():getItemByName(\"windscream_canyon_map.itm\")\
end\
\
";
		["text"] = "\\[Buy a map of Windscream Canyon area for 200 antigravium shards]";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00074"] = {
		["ID"] = 74;
		["actor"] = 2;
		["connectID"] = 91;
		["posX"] = 1530;
		["posY"] = 30;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   local waga = self:getNPC()\
   local player = getMC()\
   player:getInventory():giveItemToByName(\"antigravium_shards.itm\", waga:getTradeInventory(), 200)\
   giveTradeItemFromObjTo(\"windscream_canyon_map.itm\", waga, player, 1)\
   self:setParam(\"asked_map\", false)\
end\
\
function message:isVisible()\
   return hasPlayerItem(\"antigravium_shards.itm\", 200)\
end\
\
";
		["text"] = "Wise decision, huma. Without a map you can run into some really nasty places. Trust me, you won't survive there as you are now.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00075"] = {
		["ID"] = 75;
		["actor"] = 1;
		["connectID"] = 77;
		["posX"] = 1170;
		["posY"] = 510;
		["script"] = "";
		["text"] = "What'cha doing at here? You are not an outcast as I see.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00077"] = {
		["ID"] = 77;
		["actor"] = 2;
		["connectID"] = 80;
		["posX"] = 1410;
		["posY"] = 510;
		["script"] = "";
		["text"] = "Trading of course. These outcasts are digging up some valuable tech stuff and I bring them simple things in return: some booze, food and medicine. I can easily re-sell their findings and make a good profit in fort or even in the New Hope. ";
		["time"] = 23.5;
		["type"] = "message";
	};
	["message_00078"] = {
		["ID"] = 78;
		["actor"] = 1;
		["connectID"] = 79;
		["posX"] = 1890;
		["posY"] = 510;
		["script"] = "";
		["text"] = "So you are heading out soon? Need a company?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00079"] = {
		["ID"] = 79;
		["actor"] = 2;
		["connectID"] = 81;
		["posX"] = 2130;
		["posY"] = 510;
		["script"] = "";
		["text"] = "Oh, I know what you need, huma. And yes, I won't mind leading you to the Hunters Rest or maybe even to the fort, but I must finish one deal here first, and you aren't prepared for this journey yet.";
		["time"] = 21;
		["type"] = "message";
	};
	["message_00080"] = {
		["ID"] = 80;
		["actor"] = 2;
		["connectID"] = 78;
		["posX"] = 1650;
		["posY"] = 510;
		["script"] = "";
		["text"] = "Not this time though. Seems like the poor fellas here currently have a handful of troubles and barely go outside searching for good salvage.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00081"] = {
		["ID"] = 81;
		["actor"] = 1;
		["connectID"] = 83;
		["posX"] = 2370;
		["posY"] = 510;
		["script"] = "";
		["text"] = "May I ask what is this important deal of yours?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 2;
		["connectID"] = 84;
		["posX"] = 2610;
		["posY"] = 510;
		["script"] = "";
		["text"] = "Don't get offended, huma, but this information isn't for your ears. Talk to me later, when it's done and when you will be ready to enter the desert. ";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00084"] = {
		["ID"] = 84;
		["actor"] = 2;
		["connectID"] = 85;
		["posX"] = 2850;
		["posY"] = 510;
		["script"] = "";
		["text"] = "I'm heading down there to the border of the White Erg first to make a detour. The Cutthroat Pass is blocked by a gang of scalp hunters, so if I were you, I would keep my distance from them. They are true savages and will attack you on sight.";
		["time"] = 25;
		["type"] = "message";
	};
	["message_00085"] = {
		["ID"] = 85;
		["actor"] = 2;
		["connectID"] = 91;
		["posX"] = 3090;
		["posY"] = 510;
		["script"] = "";
		["text"] = "Better find some heat resistant gear, decent amount of drinking water and learn the \"desert walk\" in order to avoid sandsharks. Then hit me up again and we'll move out.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00089"] = {
		["ID"] = 89;
		["actor"] = 2;
		["connectID"] = 90;
		["posX"] = 330;
		["posY"] = 330;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 2;
		["connectID"] = 33;
		["posX"] = 5100;
		["posY"] = 270;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00092"] = {
		["ID"] = 92;
		["actor"] = 2;
		["posX"] = 1410;
		["posY"] = 630;
		["script"] = "";
		["text"] = "May the desert be kind to you.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00094"] = {
		["ID"] = 94;
		["actor"] = 2;
		["connectID"] = 91;
		["posX"] = 1530;
		["posY"] = 150;
		["script"] = "";
		["text"] = "Come again when you have the money. The map will be waiting for you.";
		["time"] = 8;
		["type"] = "message";
	};
	["switch_00033"] = {
		["ID"] = 33;
		["connectionsID"] = {
			[1] = 32;
			[2] = 69;
			[3] = 71;
			[4] = 46;
			[5] = 63;
			[6] = 75;
			[7] = 8;
		};
		["posX"] = 990;
		["posY"] = 270;
		["type"] = "switch";
	};
	["switch_00090"] = {
		["ID"] = 90;
		["connectionsID"] = {
			[1] = 1;
			[2] = 34;
		};
		["posX"] = 570;
		["posY"] = 330;
		["type"] = "switch";
	};
	["switch_00093"] = {
		["ID"] = 93;
		["connectionsID"] = {
			[1] = 74;
			[2] = 94;
		};
		["posX"] = 1410;
		["posY"] = 90;
		["type"] = "switch";
	};
}
return obj1
