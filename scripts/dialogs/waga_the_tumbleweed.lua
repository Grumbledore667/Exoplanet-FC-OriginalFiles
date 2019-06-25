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
		["posX"] = 1200;
		["posY"] = 1920;
		["script"] = "";
		["text"] = "\\[END]Later. ";
		["time"] = 2;
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
		["posX"] = 1770;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Is there a story behind your name?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 2;
		["connectID"] = 48;
		["posX"] = 2010;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Nothin' special. People named me that way when I was still young: could not stay at one place for two days in a row. What a jackass I were, could have ended up in a gang of drifters or scalp hunters if not for one quite memorable encounter.";
		["time"] = 25;
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 1;
		["connectID"] = 49;
		["posX"] = 2250;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "So whom did you meet? Some kind of religious preacher? The fortune telling shaman has told you that becoming a wandering merchant is your fate?";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 2;
		["connectID"] = 50;
		["posX"] = 2490;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Nah, I don't belive in these allmighty Gods-in-the-Earth crap and other tales. One day I've met the Hunchback Boma! The old man lost his right arm, was as blind as a molerat, but still peddled his wares all across the White and Red Ergs.";
		["time"] = 23;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 2;
		["connectID"] = 51;
		["posX"] = 2730;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Man, was I impressed. That abori was a living legend: he was already in the business before my grandfather hatched from his egg! He survived two wars, countless uprisings, brought his wares to the besieged fortresses and most secluded nomad tribes. ";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 2;
		["connectID"] = 52;
		["posX"] = 2970;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Some say he even had the Great Swamp Cannibal tribes in the list of his usual customers. Been said he found the legendary Hidden City of Awanna, traded with it's strange inhabitants and brought the relics of the Golden Age back. ";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 1;
		["connectID"] = 53;
		["posX"] = 3210;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Sounds like a bunch of gossips and legends, probably made up by your legendary Boma himself to boost his sales and get some free drinks from the suckers for the storytelling.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 2;
		["connectID"] = 54;
		["posX"] = 3450;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Think what you want, huma, but even if one tenth of the tales about Hunchback Boma is true, the old man was and stays a great role model for me!";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 2;
		["connectID"] = 62;
		["posX"] = 3690;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "When we met we talked the whole night through. Then I realized that becoming a bandit is like putting yourself on a short leash: with every crime fewer and fewer doors will be open for you.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 2;
		["connectID"] = 56;
		["posX"] = 4170;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "So I decided to become a wandering merchant like Boma, to explore this vast world on my own. I also took his advice to take my nickname as a trademark: Waga the Tumbleweed - sounds good enough and describes well both my personality and my trade.";
		["time"] = 24;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 1;
		["connectID"] = 57;
		["posX"] = 4410;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "But what about the Boma? Where is he now?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 2;
		["connectID"] = 58;
		["posX"] = 4650;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Nobody knows. Haven't seen him since that night. They say one day he just left the last village he visited, wandered into the desert as he usually did and never returned. Some drunken caravaneers were bragging about meeting him but I don't believe those lying tongues. ";
		["time"] = 24.5;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 2;
		["connectID"] = 100;
		["posX"] = 4890;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "I thik he has finally found the most beatiful place on K'Tharsis and is resting there forever. It's better to become a legend through great effort, than a sorry pile of bones in an untended grave in a backyard of some rundown village and never try.";
		["time"] = 24;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 2;
		["connectID"] = 55;
		["posX"] = 3930;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Boma has told me that being a good merchant never was his main goal. He was simply exploring the world, searching for new amazing places and interesting people. He hoped to find the most beatiful place on K'Tharsis some day and settle there once he gets tired of wandering.";
		["time"] = 25.5;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 1;
		["connectID"] = 64;
		["posX"] = 1770;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "Is it hard to be a wandering merchant on this planet?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 2;
		["connectID"] = 65;
		["posX"] = 2010;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "Well, as you might think, I have nothing to compare with. K'Tharsis is my birthplace, here I will live and here I will die. I'm trying to have the best of my time here though.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00065"] = {
		["ID"] = 65;
		["actor"] = 2;
		["connectID"] = 66;
		["posX"] = 2250;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "I guess it depends on the person: for me it's more about life style than profits. I like my freedom and I take pride in my ability to get where I want unharmed. To deliver the goods that are needed most.";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00066"] = {
		["ID"] = 66;
		["actor"] = 1;
		["connectID"] = 67;
		["posX"] = 2490;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "Never thought to set up a shop in a town? Should be safer, easier and more profitable.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
		["actor"] = 2;
		["connectID"] = 68;
		["posX"] = 2730;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "No way! I'd better have bright stars as my ceiling and open desert as a room than smelling the stench of a town. Even if I visit a town - I prefer to camp outside. I'm a nomad by nature. Staying in one place will kill me in a week.";
		["time"] = 26;
		["type"] = "message";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 2;
		["connectID"] = 100;
		["posX"] = 2970;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "Besides, the towns have their dangers as well - robbers, sanitary service's inspections, taxes and such. At least I know the dangers of the desert and how to avoid them.";
		["time"] = 16;
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
		["time"] = 20.5;
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
		["time"] = 6.5;
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
		["posX"] = 1770;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "What'cha doing at here? You are not an outcast as I see.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00077"] = {
		["ID"] = 77;
		["actor"] = 2;
		["connectID"] = 80;
		["posX"] = 2010;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "Trading of course. These outcasts are digging up some valuable tech stuff and I bring them simple things in return: some booze, food and medicine. I can easily re-sell their findings and make a good profit in fort or even in the New Hope. ";
		["time"] = 23.5;
		["type"] = "message";
	};
	["message_00078"] = {
		["ID"] = 78;
		["actor"] = 1;
		["connectID"] = 79;
		["posX"] = 2490;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "So you are heading out soon? Need a company?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00079"] = {
		["ID"] = 79;
		["actor"] = 2;
		["connectID"] = 81;
		["posX"] = 2730;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "Oh, I know what you need, huma. And yes, I won't mind leading you to the Hunters Rest or maybe even to the fort, but I must finish one deal here first, and you aren't prepared for this journey yet.";
		["time"] = 21;
		["type"] = "message";
	};
	["message_00080"] = {
		["ID"] = 80;
		["actor"] = 2;
		["connectID"] = 78;
		["posX"] = 2250;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "Not this time though. Seems like the poor fellas here currently have a handful of troubles and barely go outside searching for good salvage.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00081"] = {
		["ID"] = 81;
		["actor"] = 1;
		["connectID"] = 83;
		["posX"] = 2970;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "May I ask what is this important deal of yours?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 2;
		["connectID"] = 84;
		["posX"] = 3210;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "Don't get offended, huma, but this information isn't for your ears. Talk to me later, when it's done and when you will be ready to enter the desert.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00084"] = {
		["ID"] = 84;
		["actor"] = 2;
		["connectID"] = 85;
		["posX"] = 3450;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "I'm heading down there to the border of the White Erg first to make a detour. The Cutthroat Pass is blocked by a gang of scalp hunters, so if I were you, I would keep my distance from them. They are true savages and will attack you on sight.";
		["time"] = 25.5;
		["type"] = "message";
	};
	["message_00085"] = {
		["ID"] = 85;
		["actor"] = 2;
		["connectID"] = 100;
		["posX"] = 3690;
		["posY"] = 1470;
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
		["posX"] = 6360;
		["posY"] = 240;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00092"] = {
		["ID"] = 92;
		["actor"] = 2;
		["posX"] = 1440;
		["posY"] = 1920;
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
	["message_00097"] = {
		["ID"] = 97;
		["actor"] = 1;
		["connectID"] = 96;
		["posX"] = 1200;
		["posY"] = 1290;
		["script"] = "";
		["text"] = "Tell me more about yourself.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00098"] = {
		["ID"] = 98;
		["actor"] = 1;
		["connectID"] = 122;
		["posX"] = 1200;
		["posY"] = 570;
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
		["text"] = "Do you have any Sweet Joy?";
		["time"] = 4;
		["topic"] = "broken_crane:waga_sweet_joy";
		["type"] = "message";
	};
	["message_00099"] = {
		["ID"] = 99;
		["actor"] = 1;
		["connectID"] = 148;
		["posX"] = 1200;
		["posY"] = 810;
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
		["text"] = "Zaba isn't a big fan of yours. I wonder why.";
		["time"] = 6;
		["topic"] = "broken_crane:waga_about_zaba_bad";
		["type"] = "message";
	};
	["message_00100"] = {
		["ID"] = 100;
		["actor"] = 2;
		["connectID"] = 96;
		["posX"] = 5400;
		["posY"] = 1320;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00101"] = {
		["ID"] = 101;
		["actor"] = 1;
		["connectID"] = 33;
		["posX"] = 1770;
		["posY"] = 1650;
		["script"] = "";
		["text"] = "Back.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00120"] = {
		["ID"] = 120;
		["actor"] = 2;
		["connectID"] = 121;
		["posX"] = 2280;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Zaba is stationed with the local chief, Big Hat. But I recommend that you stay away from that sleazeball, huma. Whatever sweet tale he tells you, his stuff ruins lives.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00121"] = {
		["ID"] = 121;
		["actor"] = 2;
		["connectID"] = 125;
		["posX"] = 2550;
		["posY"] = 570;
		["script"] = "";
		["text"] = "If you really have to deal with Zaba, be on your guard. You try that stuff once and you end up broke and miserable in a ditch in no time.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00122"] = {
		["ID"] = 122;
		["actor"] = 2;
		["connectID"] = 124;
		["posX"] = 1470;
		["posY"] = 570;
		["script"] = "";
		["text"] = "No, huma, not my department. I don't sell that junk.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00123"] = {
		["ID"] = 123;
		["actor"] = 2;
		["connectID"] = 120;
		["posX"] = 2010;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Well, if you need it that badly, you can try. There's one guy in the camp who might have it. I don't want to give him any more publicity, but Zaba is the only one who might sell that crap.";
		["time"] = 21;
		["type"] = "message";
	};
	["message_00124"] = {
		["ID"] = 124;
		["actor"] = 1;
		["connectID"] = 123;
		["posX"] = 1740;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Do you know where I can get it?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00125"] = {
		["ID"] = 125;
		["actor"] = 1;
		["connectID"] = 91;
		["posX"] = 2820;
		["posY"] = 570;
		["script"] = "";
		["text"] = "I got it. Thanks for the warning.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00127"] = {
		["ID"] = 127;
		["actor"] = 2;
		["connectID"] = 134;
		["posX"] = 1260;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "Надо же! И почему я не удивлен, что этот отброс опять наговорил обо мне кучу гадостей? Наверное, просто потому, что он мне завидует? Хоть я и обычный бродячий торговец, но сам себе хозяин. А Заба - шестерка на побегушках у производителей наркоты.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00128"] = {
		["ID"] = 128;
		["actor"] = 1;
		["connectID"] = 135;
		["posX"] = 2340;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "И что такого особенного в этой маске?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00129"] = {
		["ID"] = 129;
		["actor"] = 2;
		["connectID"] = 141;
		["posX"] = 3420;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "В итоге вся нижняя челюсть сгнила и зубы выпали. Так он эту маску и нацепил на себя. Теперь боится еще что-нибудь подцепить, ходит только в респераторе.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00130"] = {
		["ID"] = 130;
		["actor"] = 2;
		["connectID"] = 129;
		["posX"] = 3150;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "Естественно, эти \"лекарства\" никого не спасли, зато Заба нажил себе приличное состояние, которое потом и спустил, чтобы вылечиться от заразы. Как ни старался, а все-таки подцепил язву от своих клиентов.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00131"] = {
		["ID"] = 131;
		["actor"] = 2;
		["connectID"] = 128;
		["posX"] = 2070;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "Ты, кстати, спроси у него почему он постоянно в маске? Хотя хрен он тебе правду скажет.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00132"] = {
		["ID"] = 132;
		["actor"] = 2;
		["connectID"] = 138;
		["posX"] = 3960;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "Я ему как-то напомнил о том кто он есть, а то он слишком высоко стал задирать нос. Ночевали на постоялом дворе вместе, и я бросил ему на ноги протухшую шкуру слизнежабы.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00133"] = {
		["ID"] = 133;
		["actor"] = 2;
		["posX"] = 5040;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "Тут, хума, ты можешь быть спокоен. У кого ни спроси в двух пустынях, никто меня дурным словом не помянет. Можешь сам в этом убедиться.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00134"] = {
		["ID"] = 134;
		["actor"] = 1;
		["connectID"] = 136;
		["posX"] = 1530;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "Похоже, это у него неплохо получается. Я не видел, чтобы он сильно страдал из-за характера своей работы.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00135"] = {
		["ID"] = 135;
		["actor"] = 2;
		["connectID"] = 137;
		["posX"] = 2610;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "В маске ничего особенного, а вот в подвигах, после которых он стал ее носить... В общем, хума, я не любитель поливать других грязью за глаза, но Заба давно потерял уважение среди вольных торговцев.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00136"] = {
		["ID"] = 136;
		["actor"] = 2;
		["connectID"] = 131;
		["posX"] = 1800;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "Ну да. Если тебе нравится, что товар, который ты продаешь, тебе не принадлежит, и твоя работа - это обирать всяких бедолаг, попавших в зависимость от дряни, то, наверное, Заба должен быть просто счастлив. Как раз подходящее занятие для такого гниющего куска дерьма, как он.";
		["time"] = 23;
		["type"] = "message";
	};
	["message_00137"] = {
		["ID"] = 137;
		["actor"] = 2;
		["connectID"] = 130;
		["posX"] = 2880;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "Циклов пять назад в становище Пустой Скалы разразилась эпидемия селикатной язвы. Заба, узнав об этом, немедленно туда отправился и начал продавать свои товары под видом лекарств.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00138"] = {
		["ID"] = 138;
		["actor"] = 2;
		["connectID"] = 140;
		["posX"] = 4230;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "А потом его разбудил и говорю: \"Заба, смотри: похоже. у тебя ноги гнить стали!\". Видел бы ты его реакцию. Остальные постояльцы думали, что на нас целый рейдерский отряд номадов напал - так он орал и бесился.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00139"] = {
		["ID"] = 139;
		["actor"] = 1;
		["connectID"] = 133;
		["posX"] = 4770;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "Да уж, занимательная история. Надеюсь, про тебя мне похожую никто не расскажет.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00140"] = {
		["ID"] = 140;
		["actor"] = 2;
		["connectID"] = 139;
		["posX"] = 4500;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "С тех пор мы с ним не очень ладим.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00141"] = {
		["ID"] = 141;
		["actor"] = 1;
		["connectID"] = 132;
		["posX"] = 3690;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "А тебя-то он за что невзлюбил?";
		["time"] = 4;
		["topic"] = "broken_crane:waga_about_zaba";
		["type"] = "message";
	};
	["message_00142"] = {
		["ID"] = 142;
		["actor"] = 1;
		["connectID"] = 146;
		["posX"] = 3900;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Why does he hold a grudge against you?";
		["time"] = 5;
		["topic"] = "broken_crane:waga_about_zabas_weakness";
		["type"] = "message";
	};
	["message_00143"] = {
		["ID"] = 143;
		["actor"] = 1;
		["connectID"] = 154;
		["posX"] = 4980;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Well, that was an interesting story. I hope no one tells me something similar about you.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00144"] = {
		["ID"] = 144;
		["actor"] = 2;
		["connectID"] = 147;
		["posX"] = 2280;
		["posY"] = 810;
		["script"] = "";
		["text"] = "By the way, ask him about that mask he's always wearing. Although it's not like that old bastard will tell you the truth.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00145"] = {
		["ID"] = 145;
		["actor"] = 2;
		["connectID"] = 143;
		["posX"] = 4710;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Ever since then, we haven't got on too well.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00146"] = {
		["ID"] = 146;
		["actor"] = 2;
		["connectID"] = 156;
		["posX"] = 4170;
		["posY"] = 810;
		["script"] = "";
		["text"] = "I once reminded him who he really was, because that son of a sandflea was getting too big for his boots. We were staying at an inn and I threw a rotting slimetoad skin at him.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00147"] = {
		["ID"] = 147;
		["actor"] = 1;
		["connectID"] = 149;
		["posX"] = 2550;
		["posY"] = 810;
		["script"] = "";
		["text"] = "What's so special about this mask?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00148"] = {
		["ID"] = 148;
		["actor"] = 2;
		["connectID"] = 152;
		["posX"] = 1470;
		["posY"] = 810;
		["script"] = "";
		["text"] = "You don't say! Why am I not surprised that that bastard trashes me? Maybe he's just jealous of me? I'm just a traveling trader, but at least I'm my own man. Zaba, on the other hand, is an errand boy working for drug lords.";
		["time"] = 23;
		["type"] = "message";
	};
	["message_00149"] = {
		["ID"] = 149;
		["actor"] = 2;
		["connectID"] = 150;
		["posX"] = 2820;
		["posY"] = 810;
		["script"] = "";
		["text"] = "It's not the mask, it's what he did that caused him to wear it... You know, huma, I don't like badmouthing people behind their backs, but Zaba lost respect even among free traders a long time ago.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00150"] = {
		["ID"] = 150;
		["actor"] = 2;
		["connectID"] = 155;
		["posX"] = 3090;
		["posY"] = 810;
		["script"] = "";
		["text"] = "About five cycles ago, there was an epidemic of silicate plague in the Empty Rock camp. As soon as Zaba heard about it, he went there to sell his stuff as medicine.";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00151"] = {
		["ID"] = 151;
		["actor"] = 2;
		["connectID"] = 142;
		["posX"] = 3630;
		["posY"] = 810;
		["script"] = "";
		["text"] = "In the end, his lower jaw and teeth were completely rotten. So he started wearing this mask. Now he's so afraid of catching something else, he's always wearing a facepiece.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00152"] = {
		["ID"] = 152;
		["actor"] = 1;
		["connectID"] = 153;
		["posX"] = 1740;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Seems like he's doing alright. I wouldn't say he's too upset about his work.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00153"] = {
		["ID"] = 153;
		["actor"] = 2;
		["connectID"] = 144;
		["posX"] = 2010;
		["posY"] = 810;
		["script"] = "";
		["text"] = "You bet. If it doesn't bother him that his goods don't belong to him and his work is to bleed these poor addicts dry, Zaba must be on cloud nine. Yeah, just the right kind of work for a rotting piece of crap like him.";
		["time"] = 23.5;
		["type"] = "message";
	};
	["message_00154"] = {
		["ID"] = 154;
		["actor"] = 2;
		["connectID"] = 91;
		["posX"] = 5250;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Don't worry about that, huma. No one in the two deserts would say a bad word about me. You can see for yourself.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00155"] = {
		["ID"] = 155;
		["actor"] = 2;
		["connectID"] = 151;
		["posX"] = 3360;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Naturally, it didn't save anyone and Zaba earned a great fortune that he later had to spend on treatment for this plague. He caught it from his clients, despite his best efforts not to.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00156"] = {
		["ID"] = 156;
		["actor"] = 2;
		["connectID"] = 145;
		["posX"] = 4440;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Then I woke him and said to him, \"Zaba, look: I think your feet are starting to rot!\" If only you could have seen his reaction. He was screaming so loudly the other guests thought it was a raider attack.";
		["time"] = 21;
		["type"] = "message";
	};
	["message_00157"] = {
		["ID"] = 157;
		["actor"] = 1;
		["connectID"] = 158;
		["posX"] = 1200;
		["posY"] = 390;
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
		["text"] = "I had a conversation with an abori called Zaba...";
		["time"] = 5.5;
		["topic"] = "broken_crane:waga_about_zaba";
		["type"] = "message";
	};
	["message_00158"] = {
		["ID"] = 158;
		["actor"] = 2;
		["connectID"] = 159;
		["posX"] = 1470;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Oh, well, I hope you haven't bought anything from this maggot. He was probalby trashing me again, right?";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00159"] = {
		["ID"] = 159;
		["actor"] = 2;
		["connectID"] = 152;
		["posX"] = 1710;
		["posY"] = 390;
		["script"] = "";
		["text"] = "In fact, Zaba must be so jealous of me. I'm just a traveling trader, but at least I'm my own man. Zaba, on the other hand, is an errand boy working for drug lords.";
		["time"] = 18;
		["type"] = "message";
	};
	["switch_00033"] = {
		["ID"] = 33;
		["connectionsID"] = {
			[1] = 32;
			[2] = 69;
			[3] = 71;
			[4] = 157;
			[5] = 98;
			[6] = 99;
			[7] = 97;
			[8] = 8;
		};
		["h"] = 200;
		["posX"] = 990;
		["posY"] = 300;
		["type"] = "switch";
		["w"] = 100;
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
	["switch_00096"] = {
		["ID"] = 96;
		["connectionsID"] = {
			[1] = 46;
			[2] = 63;
			[3] = 75;
			[4] = 101;
		};
		["h"] = 120;
		["posX"] = 1530;
		["posY"] = 1290;
		["type"] = "switch";
		["w"] = 100;
	};
}
return obj1
