-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["posX"] = -720;
		["posY"] = 660;
		["script"] = "";
		["text"] = "bye";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00205"] = {
		["ID"] = 205;
		["actor"] = 1;
		["connectID"] = 4;
		["posX"] = -1110;
		["posY"] = 540;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00206"] = {
		["ID"] = 206;
		["actor"] = 1;
		["connectID"] = 4;
		["posX"] = -720;
		["posY"] = 540;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestActiveStepName(\"lost_arphant\") == \"molly_walk_to_zak\"\
end\
\
";
		["text"] = "found your molly";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00211"] = {
		["ID"] = 211;
		["actor"] = 1;
		["connectID"] = 4;
		["posX"] = -720;
		["posY"] = 420;
		["script"] = "function message:onStart()\
   getQuest(\"lost_arphant\"):start()\
   self:setDialogParam(\"n211\", 1)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   if(not self:getDialogParam(\"n211\")) then\
      return true\
   end\
   return false\
end\
\
";
		["text"] = "start quest lost arphant";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00213"] = {
		["ID"] = 213;
		["actor"] = 2;
		["connectID"] = 212;
		["posX"] = -1530;
		["posY"] = 600;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00214"] = {
		["ID"] = 214;
		["actor"] = 1;
		["connectID"] = 364;
		["posX"] = -570;
		["posY"] = 930;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00217"] = {
		["ID"] = 217;
		["actor"] = 1;
		["connectID"] = 220;
		["posX"] = 240;
		["posY"] = -540;
		["script"] = "";
		["text"] = "Uh... What password?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00218"] = {
		["ID"] = 218;
		["actor"] = 1;
		["connectID"] = 224;
		["posX"] = 240;
		["posY"] = -420;
		["script"] = "";
		["text"] = "I ran into some trouble on the way here. And they didn't mention any passwords, that's for sure. Where's the package?";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00219"] = {
		["ID"] = 219;
		["actor"] = 1;
		["connectID"] = 228;
		["posX"] = 240;
		["posY"] = -300;
		["script"] = "";
		["text"] = "Where am I? What the hell is this place? And who the hell are you?!";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00220"] = {
		["ID"] = 220;
		["actor"] = 2;
		["connectID"] = 221;
		["posX"] = 480;
		["posY"] = -540;
		["script"] = "";
		["text"] = "Oh god damn it! You're not from Vasquez, are you?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00221"] = {
		["ID"] = 221;
		["actor"] = 1;
		["connectID"] = 222;
		["posX"] = 720;
		["posY"] = -540;
		["script"] = "";
		["text"] = "No. Who is that? And who are you?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00222"] = {
		["ID"] = 222;
		["actor"] = 2;
		["connectID"] = 223;
		["posX"] = 960;
		["posY"] = -540;
		["script"] = "";
		["text"] = "I guess no harm in introducing myself. My name is Zacharia Wilson, but you can call me Zak. I'm a licensed bounty hunter.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00223"] = {
		["ID"] = 223;
		["actor"] = 2;
		["connectID"] = 233;
		["posX"] = 1200;
		["posY"] = -540;
		["script"] = "";
		["text"] = "Concerning Vasquez, I'm surprised you never heard of him. Everyone knows our head of the guild around here.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00224"] = {
		["ID"] = 224;
		["actor"] = 2;
		["animation"] = "dl_stop_onehand";
		["connectID"] = 225;
		["posX"] = 480;
		["posY"] = -420;
		["script"] = "";
		["text"] = "Nice try pal. Tell me, would you try to break out of jail by pretending to be sick too? Get out of here!";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00225"] = {
		["ID"] = 225;
		["actor"] = 1;
		["connectID"] = 226;
		["posX"] = 720;
		["posY"] = -420;
		["script"] = "";
		["text"] = "Was worth a try.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00226"] = {
		["ID"] = 226;
		["actor"] = 2;
		["connectID"] = 227;
		["posX"] = 960;
		["posY"] = -420;
		["script"] = "";
		["text"] = "Ha! K'Tharsis as usual: fool or be fooled! Well, won't hold it against you. Actually glad to meet someone after a dozen days in the desert.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00227"] = {
		["ID"] = 227;
		["actor"] = 2;
		["connectID"] = 233;
		["posX"] = 1200;
		["posY"] = -420;
		["script"] = "";
		["text"] = "My name is Zacharia Wilson by the way, but you can call me Zak. I'm a licensed bounty hunter, don't expect me to be conned so easily.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00228"] = {
		["ID"] = 228;
		["actor"] = 2;
		["connectID"] = 229;
		["posX"] = 480;
		["posY"] = -300;
		["script"] = "";
		["text"] = "That's what I call a classic case of saloon amnesia!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00229"] = {
		["ID"] = 229;
		["actor"] = 1;
		["connectID"] = 230;
		["posX"] = 720;
		["posY"] = -300;
		["script"] = "";
		["text"] = "Saloon amnesia? What are you talking about?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00230"] = {
		["ID"] = 230;
		["actor"] = 2;
		["connectID"] = 231;
		["posX"] = 960;
		["posY"] = -300;
		["script"] = "";
		["text"] = "You know, like in that old-ass joke: a Sheriff, an abori and an off-worlder walk into a saloon...";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00231"] = {
		["ID"] = 231;
		["actor"] = 1;
		["connectID"] = 232;
		["posX"] = 1200;
		["posY"] = -300;
		["script"] = "";
		["text"] = "What?";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00232"] = {
		["ID"] = 232;
		["actor"] = 2;
		["connectID"] = 239;
		["posX"] = 1440;
		["posY"] = -300;
		["script"] = "";
		["text"] = "...well anyways, the punchline is when the off-worlder wakes up penniless in the middle of the desert with a head-splitting headache and no recollection of the night.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00233"] = {
		["ID"] = 233;
		["actor"] = 2;
		["connectID"] = 234;
		["posX"] = 1620;
		["posY"] = -480;
		["script"] = "";
		["text"] = "You don't look like you're from around here, do you? Almost no tan and all.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00234"] = {
		["ID"] = 234;
		["actor"] = 1;
		["connectID"] = 235;
		["posX"] = 1920;
		["posY"] = -390;
		["script"] = "";
		["text"] = "Can't say that I am. Does it matter?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00235"] = {
		["ID"] = 235;
		["actor"] = 2;
		["connectID"] = 240;
		["posX"] = 240;
		["posY"] = -60;
		["script"] = "";
		["text"] = "Not really. But I wouldn't talk about it if I were you. Trust me, off-worlders aren't that welcome here.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00237"] = {
		["ID"] = 237;
		["actor"] = 1;
		["connectID"] = 241;
		["posX"] = 870;
		["posY"] = -120;
		["script"] = "";
		["text"] = "Jack Sharp, freelance space trader at your service.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00238"] = {
		["ID"] = 238;
		["actor"] = 1;
		["connectID"] = 243;
		["posX"] = 870;
		["posY"] = 0;
		["script"] = "";
		["text"] = "John Smith. Just passing through.";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00239"] = {
		["ID"] = 239;
		["actor"] = 2;
		["connectID"] = 234;
		["posX"] = 1680;
		["posY"] = -300;
		["script"] = "";
		["text"] = "Just like you. You're obviously not from around here.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00240"] = {
		["ID"] = 240;
		["actor"] = 2;
		["connectID"] = 236;
		["posX"] = 480;
		["posY"] = -60;
		["script"] = "";
		["text"] = "Why won't you tell me about yourself, off-worlder?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00241"] = {
		["ID"] = 241;
		["actor"] = 2;
		["connectID"] = 242;
		["posX"] = 1110;
		["posY"] = -120;
		["script"] = "";
		["text"] = "Oh, a high-flying bird! Well, space means you've got a spaceship somewhere around here, right?";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00242"] = {
		["ID"] = 242;
		["actor"] = 2;
		["connectID"] = 244;
		["posX"] = 1350;
		["posY"] = -120;
		["script"] = "";
		["text"] = "I mean the direction you came from is a dead end. The only way you could've got there without crossing my camp is if you can fly.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00243"] = {
		["ID"] = 243;
		["actor"] = 2;
		["connectID"] = 244;
		["posX"] = 1110;
		["posY"] = 0;
		["script"] = "";
		["text"] = "Well, I completely support your right to anonymity. But there's just one nagging question - how did you manage to turn up there without passing through my camp?";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00244"] = {
		["ID"] = 244;
		["actor"] = 1;
		["connectID"] = 245;
		["posX"] = 1590;
		["posY"] = -60;
		["script"] = "";
		["text"] = "That's the problem. My spaceship was hijacked and I was thrown out of it in this desert.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00245"] = {
		["ID"] = 245;
		["actor"] = 2;
		["connectID"] = 247;
		["posX"] = 1830;
		["posY"] = -60;
		["script"] = "";
		["text"] = "Damn, this is starting to get interesting. And how did it happen?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00248"] = {
		["ID"] = 248;
		["actor"] = 1;
		["connectID"] = 250;
		["posX"] = 2220;
		["posY"] = -120;
		["script"] = "";
		["text"] = "Well... they kind of threw me out of the airlock. \\[Tell the whole story]";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00249"] = {
		["ID"] = 249;
		["actor"] = 1;
		["connectID"] = 251;
		["posX"] = 2220;
		["posY"] = 0;
		["script"] = "";
		["text"] = "That's a tale for some other time. I can only think about what should I do right now.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00250"] = {
		["ID"] = 250;
		["actor"] = 2;
		["connectID"] = 252;
		["posX"] = 2460;
		["posY"] = -120;
		["script"] = "";
		["text"] = "Wow, I did hear cooler stories in saloons after a second bottle of cactus booze, but yours sounds like at least half of it is true.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00251"] = {
		["ID"] = 251;
		["actor"] = 2;
		["connectID"] = 252;
		["posX"] = 2460;
		["posY"] = 0;
		["script"] = "";
		["text"] = "You should be glad you're alive, for starters. If I were hijacking your ship I'd make sure not to leave key witnesses.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00252"] = {
		["ID"] = 252;
		["actor"] = 1;
		["connectID"] = 366;
		["posX"] = 2730;
		["posY"] = -60;
		["script"] = "";
		["text"] = "In any case I'm screwed. I don't know anything about this place.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00253"] = {
		["ID"] = 253;
		["actor"] = 1;
		["connectID"] = 254;
		["posX"] = 360;
		["posY"] = 600;
		["script"] = "";
		["text"] = "I need some info.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00256"] = {
		["ID"] = 256;
		["actor"] = 1;
		["connectID"] = 262;
		["posX"] = 900;
		["posY"] = 480;
		["script"] = "";
		["text"] = "You said you're a bounty hunter. What do you actually do?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00258"] = {
		["ID"] = 258;
		["actor"] = 1;
		["connectID"] = 263;
		["posX"] = 900;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Your camp is a mess. It looks like an aftermath of a bunch of bulls passing through a china shop.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00260"] = {
		["ID"] = 260;
		["actor"] = 1;
		["connectID"] = 264;
		["posX"] = 900;
		["posY"] = 720;
		["script"] = "";
		["text"] = "When we met you thought I was here to collect some sort of package.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00262"] = {
		["ID"] = 262;
		["actor"] = 2;
		["connectID"] = 270;
		["posX"] = 1140;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Naturally, good deeds. Like helping old ladies across the street, and helping get kittens off the trees. And exterminating crucasses as well.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00263"] = {
		["ID"] = 263;
		["actor"] = 2;
		["animation"] = "dl_point_back";
		["connectID"] = 390;
		["posX"] = 1140;
		["posY"] = 600;
		["script"] = "";
		["text"] = "[t_lost_arphant:mention_arphant]A loud big boom and a startled arphant. That ran away.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00264"] = {
		["ID"] = 264;
		["actor"] = 2;
		["animation"] = "dl_hand_facepalm";
		["connectID"] = 274;
		["posX"] = 1140;
		["posY"] = 720;
		["script"] = "";
		["text"] = "Damn, this lonesome trip through the White Erg made me too talkative.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00265"] = {
		["ID"] = 265;
		["actor"] = 2;
		["connectID"] = 297;
		["posX"] = 1140;
		["posY"] = 840;
		["script"] = "";
		["text"] = "And this group doesn't want to be found, right?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00270"] = {
		["ID"] = 270;
		["actor"] = 1;
		["animation"] = "dl_hands_dontknow";
		["connectID"] = 271;
		["posX"] = 1380;
		["posY"] = 480;
		["script"] = "";
		["text"] = "What?";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00271"] = {
		["ID"] = 271;
		["actor"] = 2;
		["animation"] = "dl_talk_2";
		["connectID"] = 390;
		["posX"] = 1620;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Relax, I'm just messing with you. Just don't think all we're good for is scouring the planet for folks to kill for money.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00272"] = {
		["ID"] = 272;
		["actor"] = 1;
		["connectID"] = 273;
		["posX"] = 3450;
		["posY"] = 540;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"zak_molly_questions1\")\
end\
\
";
		["text"] = "What's an arphant?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00273"] = {
		["ID"] = 273;
		["actor"] = 2;
		["connectID"] = 282;
		["posX"] = 3690;
		["posY"] = 540;
		["script"] = "";
		["text"] = "My mount, Molly.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00274"] = {
		["ID"] = 274;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 275;
		["posX"] = 1380;
		["posY"] = 720;
		["script"] = "";
		["text"] = "Sorry pal, I don't trust you enough to discuss the details of my work.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00275"] = {
		["ID"] = 275;
		["actor"] = 1;
		["connectID"] = 276;
		["posX"] = 1620;
		["posY"] = 720;
		["script"] = "";
		["text"] = "I had a thought that we could help each other.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00276"] = {
		["ID"] = 276;
		["actor"] = 2;
		["connectID"] = 277;
		["posX"] = 1860;
		["posY"] = 720;
		["script"] = "";
		["text"] = "Crap... Allright, you don't look like one of those terraform rats.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00277"] = {
		["ID"] = 277;
		["actor"] = 2;
		["connectID"] = 278;
		["posX"] = 2100;
		["posY"] = 720;
		["script"] = "";
		["text"] = "The thing is, I need to deliver something to one of Vasquez's errand boys. The meeting place is right here, but this asshole still didn't show up.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00278"] = {
		["ID"] = 278;
		["actor"] = 1;
		["connectID"] = 279;
		["posX"] = 2340;
		["posY"] = 720;
		["script"] = "";
		["text"] = "And by something you mean... ?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00279"] = {
		["ID"] = 279;
		["actor"] = 2;
		["connectID"] = 280;
		["posX"] = 2580;
		["posY"] = 720;
		["script"] = "";
		["text"] = "No idea. I got this box, it's closed and it stays closed when I hand it over. I wouldn't mess with it if I were you.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00280"] = {
		["ID"] = 280;
		["actor"] = 2;
		["connectID"] = 281;
		["posX"] = 2820;
		["posY"] = 720;
		["script"] = "";
		["text"] = "Ain't gonna stop you though, I know Vasquez's shenanigans. Last clown who tried to open such a package blew up.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00281"] = {
		["ID"] = 281;
		["actor"] = 2;
		["connectID"] = 390;
		["posX"] = 3060;
		["posY"] = 720;
		["script"] = "";
		["text"] = "[t_lost_arphant:mention_arphant]In any case I'm stuck here for a couple of days. My arphant is god knows where and I must sit here and look after this junk.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00282"] = {
		["ID"] = 282;
		["actor"] = 1;
		["connectID"] = 283;
		["posX"] = 3930;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Why aren't you looking for it?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00283"] = {
		["ID"] = 283;
		["actor"] = 2;
		["connectID"] = 284;
		["posX"] = 4170;
		["posY"] = 540;
		["script"] = "";
		["text"] = "I have to guard that box. My life literally depends on it.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00284"] = {
		["ID"] = 284;
		["actor"] = 2;
		["connectID"] = 285;
		["posX"] = 4410;
		["posY"] = 540;
		["script"] = "";
		["text"] = "I have to make sure it gets collected by the right man, and he still didn't show up. Don't even ask what's in it.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00285"] = {
		["ID"] = 285;
		["actor"] = 1;
		["connectID"] = 286;
		["posX"] = 4650;
		["posY"] = 540;
		["script"] = "";
		["text"] = "What are you gonna do?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00286"] = {
		["ID"] = 286;
		["actor"] = 2;
		["connectID"] = 390;
		["posX"] = 4890;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Gotta follow the instructions. If by certain time the messenger is a no show, I have to destroy the package.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00288"] = {
		["ID"] = 288;
		["actor"] = 1;
		["connectID"] = 441;
		["posX"] = 1170;
		["posY"] = 1440;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"zak_molly_questions2\")\
end\
\
";
		["text"] = "How do I lead her to you?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00289"] = {
		["ID"] = 289;
		["actor"] = 2;
		["connectID"] = 443;
		["posX"] = 1560;
		["posY"] = 1380;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuestParam(\"lost_arphant\", \"ZakHasWhistle\")\
end\
\
";
		["text"] = "Usually special whistles are used to give commands to arphants, but I can't find mine. No worries though, Molly is exceptionally smart. Just tell her \"GO TO ZAK STRIPY!\". It's a command she understands.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00290"] = {
		["ID"] = 290;
		["actor"] = 1;
		["connectID"] = 315;
		["posX"] = 1170;
		["posY"] = 1260;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"zak_molly_questions1\")\
end\
\
";
		["text"] = "Where should I look for her?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00294"] = {
		["ID"] = 294;
		["actor"] = 2;
		["connectID"] = 295;
		["posX"] = 1140;
		["posY"] = 360;
		["script"] = "";
		["text"] = "If galaxy had an ass, this planet would be right in the middle of it. It's a former mining colony, and now even we locals don't know the official status.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00295"] = {
		["ID"] = 295;
		["actor"] = 2;
		["connectID"] = 390;
		["posX"] = 1380;
		["posY"] = 360;
		["script"] = "";
		["text"] = "A perfect place if you want to disappear.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00297"] = {
		["ID"] = 297;
		["actor"] = 1;
		["connectID"] = 298;
		["posX"] = 1380;
		["posY"] = 840;
		["script"] = "";
		["text"] = "Right.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00298"] = {
		["ID"] = 298;
		["actor"] = 2;
		["connectID"] = 299;
		["posX"] = 1620;
		["posY"] = 840;
		["script"] = "";
		["text"] = "Hm... Well the most obvious choice would be to put up a bounty on their heads and a reward for any information regarding their whereabouts.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00299"] = {
		["ID"] = 299;
		["actor"] = 2;
		["connectID"] = 300;
		["posX"] = 1860;
		["posY"] = 840;
		["script"] = "";
		["text"] = "But it will certainly alarm them and make it much harder to find them.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00300"] = {
		["ID"] = 300;
		["actor"] = 2;
		["connectID"] = 301;
		["posX"] = 2100;
		["posY"] = 840;
		["script"] = "";
		["text"] = "Them not knowing you're looking for them is your advantage.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00301"] = {
		["ID"] = 301;
		["actor"] = 2;
		["connectID"] = 302;
		["posX"] = 2340;
		["posY"] = 840;
		["script"] = "";
		["text"] = "And probably your only advantage, since you don't look like you have big money.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00302"] = {
		["ID"] = 302;
		["actor"] = 2;
		["connectID"] = 303;
		["posX"] = 2580;
		["posY"] = 840;
		["script"] = "";
		["text"] = "And you need a lot for a bounty that would make professionals take interest.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00303"] = {
		["ID"] = 303;
		["actor"] = 1;
		["connectID"] = 304;
		["posX"] = 2820;
		["posY"] = 840;
		["script"] = "";
		["text"] = "So bounty is a bust.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00304"] = {
		["ID"] = 304;
		["actor"] = 2;
		["connectID"] = 305;
		["posX"] = 3060;
		["posY"] = 840;
		["script"] = "";
		["text"] = "In your case - yes. At least officially. But there might be another way.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00305"] = {
		["ID"] = 305;
		["actor"] = 2;
		["connectID"] = 306;
		["posX"] = 3300;
		["posY"] = 840;
		["script"] = "";
		["text"] = "Find Vasquez in the city. He's kind of our leader and is also one of the influential people around here.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00306"] = {
		["ID"] = 306;
		["actor"] = 2;
		["connectID"] = 307;
		["posX"] = 3540;
		["posY"] = 840;
		["script"] = "";
		["text"] = "Maybe he can help you, for a service. Quid pro quo. But it won't be as easy as wasting a bunch of bandit morons or finding the wife of a miner, that's for sure.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00307"] = {
		["ID"] = 307;
		["actor"] = 1;
		["connectID"] = 308;
		["posX"] = 2580;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "Why would he help me? I'm not even local, why should he trust me?";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00308"] = {
		["ID"] = 308;
		["actor"] = 2;
		["animation"] = "dl_chuckle";
		["connectID"] = 309;
		["posX"] = 2820;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "Trust? Ha! You don't know him. He doesn't even trust himself. It's just after a certain incident we're kind of low on people.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00309"] = {
		["ID"] = 309;
		["actor"] = 2;
		["connectID"] = 310;
		["posX"] = 3060;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "I mean, not counting the non-thinking muscle types, those are in ample supply.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00310"] = {
		["ID"] = 310;
		["actor"] = 2;
		["connectID"] = 311;
		["posX"] = 3300;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "And that's where you and your off-world experience could come in handy.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00311"] = {
		["ID"] = 311;
		["actor"] = 1;
		["connectID"] = 312;
		["posX"] = 3540;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "Ok, where do I find this guy?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00312"] = {
		["ID"] = 312;
		["actor"] = 2;
		["connectID"] = 313;
		["posX"] = 3780;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "He's usually in a saloon, or a brothel, or in-between. The former is like an office, and the latter is like a hotel. Ask the locals, everyone knows Vasquez.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00313"] = {
		["ID"] = 313;
		["actor"] = 1;
		["connectID"] = 314;
		["posX"] = 4020;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "Thanks for advice.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00314"] = {
		["ID"] = 314;
		["actor"] = 2;
		["connectID"] = 444;
		["posX"] = 4260;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "No need to thank me. Who knows, maybe this way I'm recruiting new blood, that's gonna sit in the desert instead of me next time.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00315"] = {
		["ID"] = 315;
		["actor"] = 2;
		["animation"] = "dl_shrug_long";
		["connectID"] = 436;
		["posX"] = 1410;
		["posY"] = 1260;
		["script"] = "";
		["text"] = "I don't know. But she likes melons and hates bitebugs, maybe that can help you somehow.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00316"] = {
		["ID"] = 316;
		["actor"] = 1;
		["connectID"] = 408;
		["posX"] = 360;
		["posY"] = 1740;
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
		["text"] = "[t_lost_arphant:zak_about_molly]So about that arphant of yours...";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00317"] = {
		["ID"] = 317;
		["actor"] = 2;
		["animation"] = "dl_hands_washing";
		["connectID"] = 431;
		["posX"] = 750;
		["posY"] = 1680;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"zak_molly_questions1\")\
end\
\
";
		["text"] = "Did you find her? Sh-she's ok?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00319"] = {
		["ID"] = 319;
		["actor"] = 1;
		["connectID"] = 323;
		["posX"] = 1170;
		["posY"] = 1620;
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
		["text"] = "[t_lost_arphant:zak_found_molly]I found Molly, but she's stuck in a hole and can't get out.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00320"] = {
		["ID"] = 320;
		["actor"] = 1;
		["connectID"] = 360;
		["posX"] = 1170;
		["posY"] = 1860;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return false\
end\
\
";
		["text"] = "[HIDDEN]Bad news. Sorry man, but your arphant is dead.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00323"] = {
		["ID"] = 323;
		["actor"] = 2;
		["animation"] = "dl_frustration";
		["connectID"] = 328;
		["posX"] = 1410;
		["posY"] = 1620;
		["script"] = "";
		["text"] = "Ah shit, if only I could get out there and not impersonate a clocking hen here. Damn you Vasquez and your spy games.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00324"] = {
		["ID"] = 324;
		["actor"] = 2;
		["connectID"] = 325;
		["posX"] = 2250;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "What? No...";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00325"] = {
		["ID"] = 325;
		["actor"] = 2;
		["connectID"] = 331;
		["posX"] = 2490;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "How... How did that happen?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00326"] = {
		["ID"] = 326;
		["actor"] = 2;
		["connectID"] = 442;
		["posX"] = 1410;
		["posY"] = 1140;
		["script"] = "";
		["text"] = "Pal, Molly is 4 tons of peaceful charisma. Wouldn't hurt a fly, unprovoked.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00327"] = {
		["ID"] = 327;
		["actor"] = 2;
		["connectID"] = 436;
		["posX"] = 2130;
		["posY"] = 1140;
		["script"] = "";
		["text"] = "The cutest arphant you've ever seen. A striped one - a real rarity.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00328"] = {
		["ID"] = 328;
		["actor"] = 1;
		["connectID"] = 329;
		["posX"] = 1650;
		["posY"] = 1620;
		["script"] = "";
		["text"] = "So what should I do?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00329"] = {
		["ID"] = 329;
		["actor"] = 2;
		["animation"] = "dl_head_scratch";
		["connectID"] = 330;
		["posX"] = 1890;
		["posY"] = 1620;
		["script"] = "";
		["text"] = "I don't know, try to make some sort of a ramp. Something that can help her climb out of it.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00330"] = {
		["ID"] = 330;
		["actor"] = 2;
		["connectID"] = 436;
		["posX"] = 2130;
		["posY"] = 1620;
		["script"] = "";
		["text"] = "Can't tell you exactly since I don't know what the whole situation looks like. But Molly is pretty agile, she'll climb out once she has a way.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00332"] = {
		["ID"] = 332;
		["actor"] = 1;
		["connectID"] = 356;
		["posX"] = 2880;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "I killed her... I didn't know she was yours.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00333"] = {
		["ID"] = 333;
		["actor"] = 1;
		["connectID"] = 344;
		["posX"] = 2880;
		["posY"] = 1620;
		["script"] = "";
		["text"] = "It looked like a bunch of hungry aborigines killed her.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00334"] = {
		["ID"] = 334;
		["actor"] = 1;
		["connectID"] = 354;
		["posX"] = 2880;
		["posY"] = 1860;
		["script"] = "";
		["text"] = "I don't know, I just found an arphant corpse that matches your description.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00337"] = {
		["ID"] = 337;
		["actor"] = 2;
		["connectID"] = 443;
		["posX"] = 1560;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "Arphants are smart. Just tell her \"GO TO ZAK STRIPY!\". It's a command.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00339"] = {
		["ID"] = 339;
		["actor"] = 2;
		["connectID"] = 436;
		["posX"] = 2070;
		["posY"] = 1440;
		["script"] = "";
		["text"] = "I just hope everything's ok with her... If only I didn't have to guard this cursed box I would have already found her myself.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00344"] = {
		["ID"] = 344;
		["actor"] = 2;
		["animation"] = "dl_cut_throat";
		["connectID"] = 436;
		["posX"] = 3120;
		["posY"] = 1620;
		["script"] = "";
		["text"] = "They are dead. They just don't know it yet. I'll find those fuckers and feed them their own guts.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00346"] = {
		["ID"] = 346;
		["actor"] = 2;
		["connectID"] = 348;
		["posX"] = 1620;
		["posY"] = 1800;
		["script"] = "";
		["text"] = "That's a crappy joke. You know I can't leave the package unattended. How do I know you're not pulling my leg?";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00349"] = {
		["ID"] = 349;
		["actor"] = 1;
		["connectID"] = 324;
		["posX"] = 2010;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "\\[Give Molly's tag]I found this on her...";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00350"] = {
		["ID"] = 350;
		["actor"] = 1;
		["connectID"] = 353;
		["posX"] = 2010;
		["posY"] = 1980;
		["script"] = "";
		["text"] = "Fine, I'll bring you proof.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00351"] = {
		["ID"] = 351;
		["actor"] = 1;
		["connectID"] = 352;
		["posX"] = 2010;
		["posY"] = 1860;
		["script"] = "";
		["text"] = "You got me, I was pulling your leg.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00352"] = {
		["ID"] = 352;
		["actor"] = 2;
		["posX"] = 2250;
		["posY"] = 1860;
		["script"] = "";
		["text"] = "Asshole.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00353"] = {
		["ID"] = 353;
		["actor"] = 2;
		["posX"] = 2250;
		["posY"] = 1980;
		["script"] = "";
		["text"] = "I hope you're kidding.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00354"] = {
		["ID"] = 354;
		["actor"] = 2;
		["connectID"] = 355;
		["posX"] = 3120;
		["posY"] = 1860;
		["script"] = "";
		["text"] = "Fuck. I knew this whole trip was a bad idea. Take this, I have to think. And I need a drink.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00355"] = {
		["ID"] = 355;
		["actor"] = 1;
		["connectID"] = 436;
		["posX"] = 3360;
		["posY"] = 1860;
		["script"] = "";
		["text"] = "Hang in there.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00356"] = {
		["ID"] = 356;
		["actor"] = 2;
		["connectID"] = 357;
		["posX"] = 3120;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "...Wait, you're serious?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00357"] = {
		["ID"] = 357;
		["actor"] = 2;
		["connectID"] = 358;
		["posX"] = 3360;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "Son of a bitch...";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00358"] = {
		["ID"] = 358;
		["actor"] = 2;
		["posX"] = 3600;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "You should leave. Fast. I need some space. Gotta process this.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00359"] = {
		["ID"] = 359;
		["actor"] = 2;
		["connectID"] = 348;
		["posX"] = 1620;
		["posY"] = 1920;
		["script"] = "";
		["text"] = "Very funny. That's probably some other arphant you found.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00363"] = {
		["ID"] = 363;
		["actor"] = 2;
		["connectID"] = 366;
		["posX"] = -150;
		["posY"] = 1230;
		["script"] = "";
		["text"] = "Hey, good to see you pal. As you can see I'm still here, getting this mess in order. You need something?";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00367"] = {
		["ID"] = 367;
		["actor"] = 1;
		["connectID"] = 368;
		["posX"] = 360;
		["posY"] = 2730;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isFirstTime() and self:isTopicVisible()\
end\
\
";
		["text"] = "[t_lost_arphant:molly_with_zak]I see you two have reunited.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00368"] = {
		["ID"] = 368;
		["actor"] = 2;
		["animation"] = "dl_head_wipe";
		["connectID"] = 374;
		["posX"] = 600;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "Yeah pal, that lifted a mountain from my mind. For me, Molly is more family than just a horse. You wouldn't believe what kind of bad situations this arphant pulled me out of.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00369"] = {
		["ID"] = 369;
		["actor"] = 1;
		["connectID"] = 375;
		["posX"] = 990;
		["posY"] = 2610;
		["script"] = "";
		["text"] = "Was glad to help.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00371"] = {
		["ID"] = 371;
		["actor"] = 1;
		["connectID"] = 375;
		["posX"] = 990;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "Great, just don't forget who helped you.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00373"] = {
		["ID"] = 373;
		["actor"] = 1;
		["animation"] = "dl_raisedfinger_right";
		["connectID"] = 375;
		["posX"] = 990;
		["posY"] = 2850;
		["script"] = "";
		["text"] = "Hard work earns substantial rewards. Catch my drift?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00375"] = {
		["ID"] = 375;
		["actor"] = 2;
		["animation"] = "dl_head_2nods";
		["connectID"] = 377;
		["posX"] = 1260;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "Can't thank you enough pal, this was the worst moment of my life - this conflict between my duty and my heart was tearing me apart.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00379"] = {
		["ID"] = 379;
		["actor"] = 1;
		["animation"] = "dl_hand_showright";
		["connectID"] = 381;
		["posX"] = 1650;
		["posY"] = 2670;
		["script"] = "";
		["text"] = "Who knows, you might have done the same for me.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00380"] = {
		["ID"] = 380;
		["actor"] = 1;
		["animation"] = "dl_hand_negative";
		["connectID"] = 381;
		["posX"] = 1650;
		["posY"] = 2790;
		["script"] = "";
		["text"] = "Thanks don't pay bills.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00381"] = {
		["ID"] = 381;
		["actor"] = 2;
		["connectID"] = 440;
		["posX"] = 1920;
		["posY"] = 2730;
		["script"] = "";
		["text"] = "[t_lost_arphant:zak_reward]You've really helped me man, thanks. Take this as a reward.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00383"] = {
		["ID"] = 383;
		["actor"] = 1;
		["connectID"] = 294;
		["posX"] = 900;
		["posY"] = 360;
		["script"] = "";
		["text"] = "What can you tell me about this planet?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00385"] = {
		["ID"] = 385;
		["actor"] = 1;
		["animation"] = "dl_hands_strike";
		["connectID"] = 265;
		["posX"] = 900;
		["posY"] = 840;
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
		["text"] = "Suppose I want to find a small private spaceship and a certain well-armed group of people, FAST. Where should I start?";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00386"] = {
		["ID"] = 386;
		["actor"] = 1;
		["connectID"] = 392;
		["posX"] = 360;
		["posY"] = 2850;
		["script"] = "";
		["text"] = "Gotta go.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00390"] = {
		["ID"] = 390;
		["actor"] = 2;
		["connectID"] = 254;
		["posX"] = 5310;
		["posY"] = 30;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00392"] = {
		["ID"] = 392;
		["actor"] = 2;
		["connectID"] = 436;
		["posX"] = 4650;
		["posY"] = 960;
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
		["text"] = "[t_lost_arphant:zak_start]Hey, can you do me a favor? If you see Molly, lead her to me alright?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00394"] = {
		["ID"] = 394;
		["actor"] = 1;
		["connectID"] = 366;
		["posX"] = 900;
		["posY"] = 990;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00395"] = {
		["ID"] = 395;
		["actor"] = 2;
		["animation"] = "dl_come_here";
		["connectID"] = 216;
		["posX"] = -150;
		["posY"] = -420;
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
		["text"] = "Hey pal, where the hell have you been? Give me the password and take your damn package, I've got shit to do!";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00407"] = {
		["ID"] = 407;
		["actor"] = 1;
		["connectID"] = 440;
		["posX"] = 1170;
		["posY"] = 2010;
		["script"] = "";
		["text"] = "I'll see what i can do.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00409"] = {
		["ID"] = 409;
		["actor"] = 2;
		["connectID"] = 431;
		["posX"] = 750;
		["posY"] = 1800;
		["script"] = "";
		["text"] = "Help her get out, pal. I won't forget this!";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00411"] = {
		["ID"] = 411;
		["actor"] = 1;
		["connectID"] = 426;
		["posX"] = 360;
		["posY"] = 2490;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"zak_give_whistle\")\
end\
\
";
		["text"] = "\\[Give whistle]Is this your whistle?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00426"] = {
		["ID"] = 426;
		["actor"] = 2;
		["connectID"] = 440;
		["posX"] = 600;
		["posY"] = 2490;
		["script"] = "function message:onStart()\
\9giveItemFromPlayerTo(\"zak_whistle.itm\", getObj(\"zak\"))\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "[t_lost_arphant:zak_give_whistle]Yes it is! Must have dropped it somewhere. Thanks! Here, take this ammo.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00432"] = {
		["ID"] = 432;
		["actor"] = 1;
		["connectID"] = 326;
		["posX"] = 1170;
		["posY"] = 1140;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"zak_molly_questions1\")\
end\
\
";
		["text"] = "Who the hell is Molly?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00433"] = {
		["ID"] = 433;
		["actor"] = 2;
		["connectID"] = 327;
		["posX"] = 1890;
		["posY"] = 1140;
		["script"] = "";
		["text"] = "It's my personal arphant. A big and smart K'Tharsian animal that you can ride and transport things with. See that thing nearby? That's her platform.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00434"] = {
		["ID"] = 434;
		["actor"] = 1;
		["connectID"] = 435;
		["posX"] = 360;
		["posY"] = 2610;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return hasPlayerItem(\"scanner_broken.itm\")\
end\
\
";
		["text"] = "My scanner is broken. You know where I can have it fixed?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00435"] = {
		["ID"] = 435;
		["actor"] = 2;
		["connectID"] = 440;
		["posX"] = 600;
		["posY"] = 2610;
		["script"] = "";
		["text"] = "Hm, down the road and over the bridge you will find Hunter's Rest, maybe there's someone who can help you.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00436"] = {
		["ID"] = 436;
		["actor"] = 2;
		["connectID"] = 431;
		["posX"] = 4920;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00437"] = {
		["ID"] = 437;
		["actor"] = 2;
		["connectID"] = 438;
		["posX"] = 1140;
		["posY"] = 240;
		["script"] = "";
		["text"] = "[t_to_fort:start]Yeah there is a fort there.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00438"] = {
		["ID"] = 438;
		["actor"] = 1;
		["connectID"] = 390;
		["posX"] = 1380;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Gotta find it.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00439"] = {
		["ID"] = 439;
		["actor"] = 1;
		["connectID"] = 437;
		["posX"] = 900;
		["posY"] = 240;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"to_fort\", \"start\")\
end\
\
";
		["text"] = "Is there a human city or a settlement here somewhere?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00440"] = {
		["ID"] = 440;
		["actor"] = 2;
		["connectID"] = 366;
		["posX"] = 2520;
		["posY"] = 2490;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00442"] = {
		["ID"] = 442;
		["actor"] = 1;
		["animation"] = "dl_head_scratch";
		["connectID"] = 433;
		["posX"] = 1650;
		["posY"] = 1140;
		["script"] = "";
		["text"] = "4 tons? What?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00443"] = {
		["ID"] = 443;
		["actor"] = 2;
		["connectID"] = 339;
		["posX"] = 1830;
		["posY"] = 1440;
		["script"] = "";
		["text"] = "Maybe give her a melon if she looks scared.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00445"] = {
		["ID"] = 445;
		["actor"] = 2;
		["connectID"] = 390;
		["posX"] = 4650;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "[TO LORE HUB]";
		["time"] = 0;
		["type"] = "message";
	};
	["switch_00004"] = {
		["ID"] = 4;
		["connectionsID"] = {
			[1] = 211;
			[2] = 206;
			[3] = 5;
		};
		["posX"] = -870;
		["posY"] = 540;
		["type"] = "switch";
	};
	["switch_00212"] = {
		["ID"] = 212;
		["connectionsID"] = {
			[1] = 205;
			[2] = 214;
		};
		["posX"] = -1290;
		["posY"] = 600;
		["type"] = "switch";
	};
	["switch_00216"] = {
		["ID"] = 216;
		["connectionsID"] = {
			[1] = 217;
			[2] = 218;
			[3] = 219;
		};
		["posX"] = 90;
		["posY"] = -420;
		["type"] = "switch";
	};
	["switch_00236"] = {
		["ID"] = 236;
		["connectionsID"] = {
			[1] = 237;
			[2] = 238;
		};
		["posX"] = 720;
		["posY"] = -60;
		["type"] = "switch";
	};
	["switch_00247"] = {
		["ID"] = 247;
		["connectionsID"] = {
			[1] = 248;
			[2] = 249;
		};
		["posX"] = 2070;
		["posY"] = -60;
		["type"] = "switch";
	};
	["switch_00254"] = {
		["ID"] = 254;
		["connectionsID"] = {
			[1] = 439;
			[2] = 383;
			[3] = 256;
			[4] = 258;
			[5] = 260;
			[6] = 272;
			[7] = 385;
			[8] = 394;
		};
		["h"] = 200;
		["posX"] = 630;
		["posY"] = 570;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00331"] = {
		["ID"] = 331;
		["connectionsID"] = {
			[1] = 333;
			[2] = 332;
			[3] = 334;
		};
		["posX"] = 2730;
		["posY"] = 1740;
		["type"] = "switch";
	};
	["switch_00348"] = {
		["ID"] = 348;
		["connectionsID"] = {
			[1] = 349;
			[2] = 351;
			[3] = 350;
		};
		["posX"] = 1860;
		["posY"] = 1860;
		["type"] = "switch";
	};
	["switch_00360"] = {
		["ID"] = 360;
		["connectionsID"] = {
			[1] = 346;
			[2] = 359;
		};
		["posX"] = 1440;
		["posY"] = 1860;
		["type"] = "switch";
	};
	["switch_00364"] = {
		["ID"] = 364;
		["connectionsID"] = {
			[1] = 395;
			[2] = 363;
		};
		["posX"] = -304.506286621;
		["posY"] = 936.249572754;
		["type"] = "switch";
	};
	["switch_00366"] = {
		["ID"] = 366;
		["connectionsID"] = {
			[1] = 253;
			[2] = 316;
			[3] = 411;
			[4] = 367;
			[5] = 434;
			[6] = 386;
		};
		["h"] = 160;
		["posX"] = 150;
		["posY"] = 1200;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00374"] = {
		["ID"] = 374;
		["connectionsID"] = {
			[1] = 369;
			[2] = 371;
			[3] = 373;
		};
		["posX"] = 840;
		["posY"] = 2730;
		["type"] = "switch";
	};
	["switch_00377"] = {
		["ID"] = 377;
		["connectionsID"] = {
			[1] = 379;
			[2] = 380;
		};
		["posX"] = 1500;
		["posY"] = 2730;
		["type"] = "switch";
	};
	["switch_00408"] = {
		["ID"] = 408;
		["connectionsID"] = {
			[1] = 317;
			[2] = 409;
		};
		["posX"] = 600;
		["posY"] = 1740;
		["type"] = "switch";
	};
	["switch_00431"] = {
		["ID"] = 431;
		["connectionsID"] = {
			[1] = 432;
			[2] = 290;
			[3] = 288;
			[4] = 319;
			[5] = 320;
			[6] = 407;
		};
		["h"] = 160;
		["posX"] = 990;
		["posY"] = 1710;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00441"] = {
		["ID"] = 441;
		["connectionsID"] = {
			[1] = 289;
			[2] = 337;
		};
		["posX"] = 1410;
		["posY"] = 1440;
		["type"] = "switch";
	};
	["switch_00444"] = {
		["ID"] = 444;
		["connectionsID"] = {
			[1] = 392;
			[2] = 445;
		};
		["posX"] = 4500;
		["posY"] = 1020;
		["type"] = "switch";
	};
}
local obj2 = {
	["actor_prefab"] = {
		[1] = "human_male";
		[2] = "human_male";
	};
}
return obj1 ,obj2
