-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["posX"] = 450;
		["posY"] = 450;
		["script"] = "";
		["text"] = "bye";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00205"] = {
		["ID"] = 205;
		["actor"] = 1;
		["connectID"] = 4;
		["posX"] = 30;
		["posY"] = 330;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00206"] = {
		["ID"] = 206;
		["actor"] = 1;
		["connectID"] = 207;
		["posX"] = 451.369628906;
		["posY"] = 330.998596191;
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
	["message_00207"] = {
		["ID"] = 207;
		["actor"] = 2;
		["connectID"] = 208;
		["posX"] = 690;
		["posY"] = 330;
		["script"] = "";
		["text"] = "thanks. want help pack?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00209"] = {
		["ID"] = 209;
		["actor"] = 1;
		["posX"] = 1080;
		["posY"] = 270;
		["script"] = "";
		["text"] = "yes";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00210"] = {
		["ID"] = 210;
		["actor"] = 1;
		["posX"] = 1080;
		["posY"] = 390;
		["script"] = "";
		["text"] = "no";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00211"] = {
		["ID"] = 211;
		["actor"] = 1;
		["posX"] = 450;
		["posY"] = 210;
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
		["posX"] = -388.506256104;
		["posY"] = 390.499664307;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00214"] = {
		["ID"] = 214;
		["actor"] = 1;
		["connectID"] = 364;
		["posX"] = -567.506256104;
		["posY"] = 909.499633789;
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
		["posY"] = 720;
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
		["posY"] = 840;
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
		["posY"] = 960;
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
		["posY"] = 720;
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
		["posY"] = 720;
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
		["posY"] = 720;
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
		["posY"] = 720;
		["script"] = "";
		["text"] = "Concerning Vasquez, I'm surprised you never heard of him. Everyone knows our head of the guild around here.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00224"] = {
		["ID"] = 224;
		["actor"] = 2;
		["connectID"] = 225;
		["posX"] = 480;
		["posY"] = 840;
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
		["posY"] = 840;
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
		["posY"] = 840;
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
		["posY"] = 840;
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
		["posY"] = 960;
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
		["posY"] = 960;
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
		["posY"] = 960;
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
		["posY"] = 960;
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
		["posY"] = 960;
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
		["posY"] = 780;
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
		["posY"] = 840;
		["script"] = "";
		["text"] = "Can't say that I am. Does it matter?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00235"] = {
		["ID"] = 235;
		["actor"] = 2;
		["connectID"] = 240;
		["posX"] = 2160;
		["posY"] = 840;
		["script"] = "";
		["text"] = "Not really. But I wouldn't talk about it if I were you. Trust me, off-worlders aren't that welcome here.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00237"] = {
		["ID"] = 237;
		["actor"] = 1;
		["connectID"] = 241;
		["posX"] = 2790;
		["posY"] = 780;
		["script"] = "";
		["text"] = "Jack Sharp, freelance space trader at your service.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00238"] = {
		["ID"] = 238;
		["actor"] = 1;
		["connectID"] = 243;
		["posX"] = 2790;
		["posY"] = 900;
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
		["posY"] = 960;
		["script"] = "";
		["text"] = "Just like you. You're obviously not from around here.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00240"] = {
		["ID"] = 240;
		["actor"] = 2;
		["connectID"] = 236;
		["posX"] = 2400;
		["posY"] = 840;
		["script"] = "";
		["text"] = "Why won't you tell me about yourself, off-worlder?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00241"] = {
		["ID"] = 241;
		["actor"] = 2;
		["connectID"] = 242;
		["posX"] = 3030;
		["posY"] = 780;
		["script"] = "";
		["text"] = "Oh, a high-flying bird! Well, space means you've got a spaceship somewhere around here, right?";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00242"] = {
		["ID"] = 242;
		["actor"] = 2;
		["connectID"] = 244;
		["posX"] = 3270;
		["posY"] = 780;
		["script"] = "";
		["text"] = "I mean the direction you came from is a dead end. The only way you could've got there without crossing my camp is if you can fly.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00243"] = {
		["ID"] = 243;
		["actor"] = 2;
		["connectID"] = 244;
		["posX"] = 3030;
		["posY"] = 900;
		["script"] = "";
		["text"] = "Well, I completely support your right to anonymity. But there's just one nagging question - how did you manage to turn up there without passing through my camp?";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00244"] = {
		["ID"] = 244;
		["actor"] = 1;
		["connectID"] = 245;
		["posX"] = 3510;
		["posY"] = 840;
		["script"] = "";
		["text"] = "That's the problem. My spaceship was hijacked and I was thrown out of it in this desert.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00245"] = {
		["ID"] = 245;
		["actor"] = 2;
		["connectID"] = 247;
		["posX"] = 3750;
		["posY"] = 840;
		["script"] = "";
		["text"] = "Damn, this is starting to get interesting. And how did it happen?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00248"] = {
		["ID"] = 248;
		["actor"] = 1;
		["connectID"] = 250;
		["posX"] = 4140;
		["posY"] = 780;
		["script"] = "";
		["text"] = "Well... they kind of threw me out of the airlock. \\[Tell the whole story]";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00249"] = {
		["ID"] = 249;
		["actor"] = 1;
		["connectID"] = 251;
		["posX"] = 4140;
		["posY"] = 900;
		["script"] = "";
		["text"] = "That's a tale for some other time. I can only think about what should I do right now.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00250"] = {
		["ID"] = 250;
		["actor"] = 2;
		["connectID"] = 252;
		["posX"] = 4380;
		["posY"] = 780;
		["script"] = "";
		["text"] = "Wow, I did hear cooler stories in saloons after a second bottle of cactus booze, but yours sounds like at least half of it is true.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00251"] = {
		["ID"] = 251;
		["actor"] = 2;
		["connectID"] = 252;
		["posX"] = 4380;
		["posY"] = 900;
		["script"] = "";
		["text"] = "You should be glad you're alive, for starters. If I were hijacking your ship I'd make sure not to leave key witnesses.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00252"] = {
		["ID"] = 252;
		["actor"] = 1;
		["connectID"] = 253;
		["posX"] = 4650;
		["posY"] = 840;
		["script"] = "";
		["text"] = "In any case I'm screwed. I don't know anything about this place.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00253"] = {
		["ID"] = 253;
		["actor"] = 1;
		["connectID"] = 254;
		["posX"] = 4950;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "I need some info.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00255"] = {
		["ID"] = 255;
		["actor"] = 1;
		["connectID"] = 261;
		["posX"] = 6371.49414062;
		["posY"] = -660.250488281;
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
		["text"] = "What is this place? Any survival tips? Any places of interest?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00256"] = {
		["ID"] = 256;
		["actor"] = 1;
		["connectID"] = 262;
		["posX"] = 5490;
		["posY"] = 810;
		["script"] = "";
		["text"] = "You said you're a bounty hunter. What do you actually do?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00258"] = {
		["ID"] = 258;
		["actor"] = 1;
		["connectID"] = 263;
		["posX"] = 5490;
		["posY"] = 930;
		["script"] = "";
		["text"] = "Your camp is a mess. It looks like an aftermath of a bunch of bulls passing through a china shop.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00260"] = {
		["ID"] = 260;
		["actor"] = 1;
		["connectID"] = 264;
		["posX"] = 5490;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "When we met you thought I was here to collect some sort of package.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00261"] = {
		["ID"] = 261;
		["actor"] = 2;
		["posX"] = 6656.49414062;
		["posY"] = -680.250488281;
		["script"] = "";
		["text"] = "White Erg and Canyon, the Outpost, the train and the spaceport.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00262"] = {
		["ID"] = 262;
		["actor"] = 2;
		["connectID"] = 270;
		["posX"] = 5730;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Naturally, good deeds. Like helping old ladies across the street, and helping get kittens off the trees. And exterminating crucasses as well.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00263"] = {
		["ID"] = 263;
		["actor"] = 2;
		["connectID"] = 361;
		["posX"] = 5730;
		["posY"] = 930;
		["script"] = "";
		["text"] = "A loud big boom and a startled arphant. That ran away.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00264"] = {
		["ID"] = 264;
		["actor"] = 2;
		["connectID"] = 274;
		["posX"] = 5730;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "Damn, this lonesome trip through the White Erg made me too talkative.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00265"] = {
		["ID"] = 265;
		["actor"] = 2;
		["connectID"] = 297;
		["posX"] = 5730;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "And this group doesn't want to be found, right?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00268"] = {
		["ID"] = 268;
		["actor"] = 1;
		["connectID"] = 296;
		["posX"] = 6368.49414062;
		["posY"] = -799.250488281;
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
		["text"] = "What can you tell me about this area?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00270"] = {
		["ID"] = 270;
		["actor"] = 1;
		["connectID"] = 271;
		["posX"] = 5970;
		["posY"] = 810;
		["script"] = "";
		["text"] = "What?";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00271"] = {
		["ID"] = 271;
		["actor"] = 2;
		["connectID"] = 390;
		["posX"] = 6210;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Relax, I'm just messing with you. Just don't think all we're good for is scouring the planet for folks to kill for money.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00272"] = {
		["ID"] = 272;
		["actor"] = 1;
		["connectID"] = 273;
		["posX"] = 7140;
		["posY"] = 600;
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
		["text"] = "[t_lost_arphant:zak_who_is_molly]An arphant?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00273"] = {
		["ID"] = 273;
		["actor"] = 2;
		["connectID"] = 282;
		["posX"] = 7380;
		["posY"] = 600;
		["script"] = "";
		["text"] = "My mount, Molly.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00274"] = {
		["ID"] = 274;
		["actor"] = 2;
		["connectID"] = 275;
		["posX"] = 5970;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "Sorry pal, I don't trust you enough to discuss the details of my work.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00275"] = {
		["ID"] = 275;
		["actor"] = 1;
		["connectID"] = 276;
		["posX"] = 6210;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "I had a thought that we could help each other.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00276"] = {
		["ID"] = 276;
		["actor"] = 2;
		["connectID"] = 277;
		["posX"] = 6450;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "Crap... Allright, you don't look like one of those terraform rats.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00277"] = {
		["ID"] = 277;
		["actor"] = 2;
		["connectID"] = 278;
		["posX"] = 6690;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "The thing is, I need to deliver something to one of Vasquez's errand boys. The meeting place is right here, but this asshole still didn't show up.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00278"] = {
		["ID"] = 278;
		["actor"] = 1;
		["connectID"] = 279;
		["posX"] = 6930;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "And by something you mean... ?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00279"] = {
		["ID"] = 279;
		["actor"] = 2;
		["connectID"] = 280;
		["posX"] = 7170;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "No idea. I got this box, it's closed and it stays closed when I hand it over. I wouldn't mess with it if I were you.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00280"] = {
		["ID"] = 280;
		["actor"] = 2;
		["connectID"] = 281;
		["posX"] = 7410;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "Ain't gonna stop you though, I know Vasquez's shenanigans. Last clown who tried to open such a package blew up.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00281"] = {
		["ID"] = 281;
		["actor"] = 2;
		["connectID"] = 361;
		["posX"] = 7650;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "In any case I'm stuck here for a couple of days. My arphant is god knows where and I must sit here and look after this junk.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00282"] = {
		["ID"] = 282;
		["actor"] = 1;
		["connectID"] = 283;
		["posX"] = 7620;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Why aren't you looking for it?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00283"] = {
		["ID"] = 283;
		["actor"] = 2;
		["connectID"] = 284;
		["posX"] = 7860;
		["posY"] = 600;
		["script"] = "";
		["text"] = "I have to guard that box. My life literally depends on it.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00284"] = {
		["ID"] = 284;
		["actor"] = 2;
		["connectID"] = 285;
		["posX"] = 8100;
		["posY"] = 600;
		["script"] = "";
		["text"] = "I have to make sure it gets collected by the right man, and he still didn't show up. Don't even ask what's in it.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00285"] = {
		["ID"] = 285;
		["actor"] = 1;
		["connectID"] = 286;
		["posX"] = 8340;
		["posY"] = 600;
		["script"] = "";
		["text"] = "What are you gonna do?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00286"] = {
		["ID"] = 286;
		["actor"] = 2;
		["connectID"] = 387;
		["posX"] = 8580;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Gotta follow the instructions. If by certain time the messenger is a no show, I have to destroy the package.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00288"] = {
		["ID"] = 288;
		["actor"] = 1;
		["connectID"] = 289;
		["posX"] = 10710;
		["posY"] = 990;
		["script"] = "";
		["text"] = "How do I lead her to you?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00289"] = {
		["ID"] = 289;
		["actor"] = 2;
		["connectID"] = 293;
		["posX"] = 10950;
		["posY"] = 990;
		["script"] = "";
		["text"] = "Usually special whistles are used to give commands to arphants, but I can't find mine. No worries though, Molly is exceptionally smart. Just tell her \"GO TO ZAK STRIPY!\". It's a command she understands.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00290"] = {
		["ID"] = 290;
		["actor"] = 1;
		["connectID"] = 315;
		["posX"] = 10710;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "Where should I look for her?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00293"] = {
		["ID"] = 293;
		["actor"] = 2;
		["connectID"] = 292;
		["posX"] = 11190;
		["posY"] = 990;
		["script"] = "";
		["text"] = "I hope she's ok...";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00294"] = {
		["ID"] = 294;
		["actor"] = 2;
		["connectID"] = 295;
		["posX"] = 5730;
		["posY"] = 690;
		["script"] = "";
		["text"] = "If galaxy had an ass, this planet would be right in the middle of it. It's a former mining colony, and now even we locals don't know the official status.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00295"] = {
		["ID"] = 295;
		["actor"] = 2;
		["connectID"] = 390;
		["posX"] = 5970;
		["posY"] = 690;
		["script"] = "";
		["text"] = "A perfect place if you want to disappear.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00296"] = {
		["ID"] = 296;
		["actor"] = 2;
		["posX"] = 6648.49414062;
		["posY"] = -791.250488281;
		["script"] = "";
		["text"] = "???";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00297"] = {
		["ID"] = 297;
		["actor"] = 1;
		["connectID"] = 298;
		["posX"] = 5970;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Right.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00298"] = {
		["ID"] = 298;
		["actor"] = 2;
		["connectID"] = 299;
		["posX"] = 6210;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Hm... Well the most obvious choice would be to put up a bounty on their heads and a reward for any information regarding their whereabouts.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00299"] = {
		["ID"] = 299;
		["actor"] = 2;
		["connectID"] = 300;
		["posX"] = 6450;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "But it will certainly alarm them and make it much harder to find them.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00300"] = {
		["ID"] = 300;
		["actor"] = 2;
		["connectID"] = 301;
		["posX"] = 6690;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Them not knowing you're looking for them is your advantage.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00301"] = {
		["ID"] = 301;
		["actor"] = 2;
		["connectID"] = 302;
		["posX"] = 6930;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "And probably your only advantage, since you don't look like you have big money.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00302"] = {
		["ID"] = 302;
		["actor"] = 2;
		["connectID"] = 303;
		["posX"] = 7170;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "And you need a lot for a bounty that would make professionals take interest.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00303"] = {
		["ID"] = 303;
		["actor"] = 1;
		["connectID"] = 304;
		["posX"] = 7410;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "So bounty is a bust.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00304"] = {
		["ID"] = 304;
		["actor"] = 2;
		["connectID"] = 305;
		["posX"] = 7650;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "In your case - yes. At least officially. But there might be another way.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00305"] = {
		["ID"] = 305;
		["actor"] = 2;
		["connectID"] = 306;
		["posX"] = 7890;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Find Vasquez in the city. He's kind of our leader and is also one of the influential people around here.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00306"] = {
		["ID"] = 306;
		["actor"] = 2;
		["connectID"] = 307;
		["posX"] = 8130;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Maybe he can help you, for a service. Quid pro quo. But it won't be as easy as wasting a bunch of bandit morons or finding the wife of a miner, that's for sure.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00307"] = {
		["ID"] = 307;
		["actor"] = 1;
		["connectID"] = 308;
		["posX"] = 8370;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Why would he help me? I'm not even local, why should he trust me?";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00308"] = {
		["ID"] = 308;
		["actor"] = 2;
		["connectID"] = 309;
		["posX"] = 8610;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Trust? Ha! You don't know him. He doesn't even trust himself. It's just after a certain incident we're kind of low on people.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00309"] = {
		["ID"] = 309;
		["actor"] = 2;
		["connectID"] = 310;
		["posX"] = 8850;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "I mean, not counting the non-thinking muscle types, those are in ample supply.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00310"] = {
		["ID"] = 310;
		["actor"] = 2;
		["connectID"] = 311;
		["posX"] = 9090;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "And that's where you and your off-world experience could come in handy.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00311"] = {
		["ID"] = 311;
		["actor"] = 1;
		["connectID"] = 312;
		["posX"] = 9330;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Ok, where do I find this guy?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00312"] = {
		["ID"] = 312;
		["actor"] = 2;
		["connectID"] = 313;
		["posX"] = 9570;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "He's usually in a saloon, or a brothel, or in-between. The former is like an office, and the latter is like a hotel. Ask the locals, everyone knows Vasquez.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00313"] = {
		["ID"] = 313;
		["actor"] = 1;
		["connectID"] = 314;
		["posX"] = 9810;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Thanks for advice.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00314"] = {
		["ID"] = 314;
		["actor"] = 2;
		["connectID"] = 392;
		["posX"] = 10050;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "No need to thank me. Who knows, maybe this way I'm recruiting new blood, that's gonna sit in the desert instead of me next time.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00315"] = {
		["ID"] = 315;
		["actor"] = 2;
		["connectID"] = 292;
		["posX"] = 10950;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "I don't know. But she likes melons and dislikes bitebugs, maybe that can help you in locating her.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00316"] = {
		["ID"] = 316;
		["actor"] = 1;
		["connectID"] = 408;
		["posX"] = 390;
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
		["connectID"] = 431;
		["posX"] = 810;
		["posY"] = 1680;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not self:getDialogParam(\"told_found_molly\")\
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
		["posX"] = 1290;
		["posY"] = 1350;
		["script"] = "function message:onStart()\
   self:setDialogParam(\"told_found_molly\", true)\
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
		["text"] = "[t_lost_arphant:zak_found_molly]I found Molly, but she's stuck in a hole and can't get out.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00320"] = {
		["ID"] = 320;
		["actor"] = 1;
		["connectID"] = 360;
		["posX"] = 1290;
		["posY"] = 1650;
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
		["text"] = "[t_lost_arphant:zak_molly_dead]Bad news. Sorry man, but your arphant is dead.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00321"] = {
		["ID"] = 321;
		["actor"] = 1;
		["connectID"] = 326;
		["posX"] = 1290;
		["posY"] = 1950;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuest(\"lost_arphant\"):getTopicVisible(\"zak_found_molly\")\
end\
\
";
		["text"] = "Not yet. How does she look like and what should I do when I find her again?";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00323"] = {
		["ID"] = 323;
		["actor"] = 2;
		["connectID"] = 328;
		["posX"] = 1530;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "Ah shit, if only I could get out there and not impersonate a clocking hen here. Damn you Vasquez and your spy games.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00324"] = {
		["ID"] = 324;
		["actor"] = 2;
		["connectID"] = 325;
		["posX"] = 2400;
		["posY"] = 1560;
		["script"] = "";
		["text"] = "What? No...";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00325"] = {
		["ID"] = 325;
		["actor"] = 2;
		["connectID"] = 331;
		["posX"] = 2640;
		["posY"] = 1560;
		["script"] = "";
		["text"] = "How... How did that happen?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00326"] = {
		["ID"] = 326;
		["actor"] = 2;
		["connectID"] = 327;
		["posX"] = 1530;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "Pal, Molly is 4 tons of peaceful charisma. Wouldn't hurt a fly, unprovoked.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00327"] = {
		["ID"] = 327;
		["actor"] = 2;
		["connectID"] = 337;
		["posX"] = 1770;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "The cutest arphant you've ever seen. Which also has stripes - a real rarity.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00328"] = {
		["ID"] = 328;
		["actor"] = 1;
		["connectID"] = 329;
		["posX"] = 1770;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "So what should I do?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00329"] = {
		["ID"] = 329;
		["actor"] = 2;
		["connectID"] = 330;
		["posX"] = 2010;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "I don't know, try to make some sort of a ramp. Something that can help her climb out of it.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00330"] = {
		["ID"] = 330;
		["actor"] = 2;
		["connectID"] = 436;
		["posX"] = 2250;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "Can't tell you exactly since I don't know what the whole situation looks like. But Molly is pretty agile, she'll climb out once she has a way.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00332"] = {
		["ID"] = 332;
		["actor"] = 1;
		["connectID"] = 356;
		["posX"] = 3030;
		["posY"] = 1560;
		["script"] = "";
		["text"] = "I killed her... I didn't know she was yours.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00333"] = {
		["ID"] = 333;
		["actor"] = 1;
		["connectID"] = 344;
		["posX"] = 3030;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "It looked like a bunch of hungry aborigines killed her.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00334"] = {
		["ID"] = 334;
		["actor"] = 1;
		["connectID"] = 354;
		["posX"] = 3030;
		["posY"] = 1710;
		["script"] = "";
		["text"] = "I don't know, I just found an arphant corpse that matches your description.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00337"] = {
		["ID"] = 337;
		["actor"] = 2;
		["connectID"] = 339;
		["posX"] = 2010;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "Arphants are smart. Just tell her \"GO TO ZAK STRIPY!\". It's a command.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00339"] = {
		["ID"] = 339;
		["actor"] = 2;
		["connectID"] = 341;
		["posX"] = 2250;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "I just hope everything's ok with her... If only I didn't have to guard this cursed box I would have already found her.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00341"] = {
		["ID"] = 341;
		["actor"] = 1;
		["connectID"] = 436;
		["posX"] = 2490;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "Got it, I'll see what I can find.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00344"] = {
		["ID"] = 344;
		["actor"] = 2;
		["posX"] = 3270;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "They are dead. They just don't know it yet. I'll find those fuckers and feed them their own guts.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00346"] = {
		["ID"] = 346;
		["actor"] = 2;
		["connectID"] = 348;
		["posX"] = 1740;
		["posY"] = 1590;
		["script"] = "";
		["text"] = "That's a crappy joke. You know I can't leave the package unattended. How do I know you're not pulling my leg?";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00349"] = {
		["ID"] = 349;
		["actor"] = 1;
		["connectID"] = 324;
		["posX"] = 2160;
		["posY"] = 1560;
		["script"] = "";
		["text"] = "\\[Give Molly's tag]I found this on her...";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00350"] = {
		["ID"] = 350;
		["actor"] = 1;
		["connectID"] = 353;
		["posX"] = 2160;
		["posY"] = 1800;
		["script"] = "";
		["text"] = "Fine, I'll bring you proof.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00351"] = {
		["ID"] = 351;
		["actor"] = 1;
		["connectID"] = 352;
		["posX"] = 2160;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "You got me, I was pulling your leg.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00352"] = {
		["ID"] = 352;
		["actor"] = 2;
		["posX"] = 2400;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "Asshole.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00353"] = {
		["ID"] = 353;
		["actor"] = 2;
		["posX"] = 2400;
		["posY"] = 1800;
		["script"] = "";
		["text"] = "I hope you're kidding.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00354"] = {
		["ID"] = 354;
		["actor"] = 2;
		["connectID"] = 355;
		["posX"] = 3270;
		["posY"] = 1710;
		["script"] = "";
		["text"] = "Fuck. I knew this whole trip was a bad idea. Take this, I have to think. And I need a drink.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00355"] = {
		["ID"] = 355;
		["actor"] = 1;
		["posX"] = 3510;
		["posY"] = 1710;
		["script"] = "";
		["text"] = "Hang in there.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00356"] = {
		["ID"] = 356;
		["actor"] = 2;
		["connectID"] = 357;
		["posX"] = 3270;
		["posY"] = 1560;
		["script"] = "";
		["text"] = "...Wait, you're serious?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00357"] = {
		["ID"] = 357;
		["actor"] = 2;
		["connectID"] = 358;
		["posX"] = 3510;
		["posY"] = 1560;
		["script"] = "";
		["text"] = "Son of a bitch...";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00358"] = {
		["ID"] = 358;
		["actor"] = 2;
		["posX"] = 3750;
		["posY"] = 1560;
		["script"] = "";
		["text"] = "You should leave. Fast. I need some space. Gotta process this.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00359"] = {
		["ID"] = 359;
		["actor"] = 2;
		["connectID"] = 348;
		["posX"] = 1740;
		["posY"] = 1710;
		["script"] = "";
		["text"] = "Very funny. That's probably some other arphant you found.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00362"] = {
		["ID"] = 362;
		["actor"] = 1;
		["connectID"] = 389;
		["posX"] = 7140;
		["posY"] = 720;
		["script"] = "";
		["text"] = "I have another question.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00363"] = {
		["ID"] = 363;
		["actor"] = 2;
		["connectID"] = 366;
		["posX"] = -150;
		["posY"] = 1020;
		["script"] = "function message:onStart()\
   self:setDialogParam(\"second\", 1)\
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
		["text"] = "Hey, good to see you pal. As you can see I'm still here, getting this mess in order. You need something?";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00367"] = {
		["ID"] = 367;
		["actor"] = 1;
		["connectID"] = 368;
		["posX"] = 360;
		["posY"] = 2550;
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
		["connectID"] = 374;
		["posX"] = 600;
		["posY"] = 2550;
		["script"] = "";
		["text"] = "Yeah pal, that lifted a mountain from my mind. For me, Molly is more family than just a horse. You wouldn't believe what kind of bad situations this arphant pulled me out of.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00369"] = {
		["ID"] = 369;
		["actor"] = 1;
		["connectID"] = 375;
		["posX"] = 1020;
		["posY"] = 2430;
		["script"] = "";
		["text"] = "Was glad to help.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00371"] = {
		["ID"] = 371;
		["actor"] = 1;
		["connectID"] = 375;
		["posX"] = 1020;
		["posY"] = 2550;
		["script"] = "";
		["text"] = "Great, just don't forget who helped you.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00373"] = {
		["ID"] = 373;
		["actor"] = 1;
		["connectID"] = 375;
		["posX"] = 1020;
		["posY"] = 2670;
		["script"] = "";
		["text"] = "Hard work earns substantial rewards. Catch my drift?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00375"] = {
		["ID"] = 375;
		["actor"] = 2;
		["connectID"] = 377;
		["posX"] = 1290;
		["posY"] = 2550;
		["script"] = "";
		["text"] = "Can't thank you enough pal, this was the worst moment of my life - this conflict between my duty and my heart was tearing me apart.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00378"] = {
		["ID"] = 378;
		["actor"] = 1;
		["connectID"] = 381;
		["posX"] = 1740;
		["posY"] = 2430;
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
		["text"] = "Get to the point.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00379"] = {
		["ID"] = 379;
		["actor"] = 1;
		["connectID"] = 381;
		["posX"] = 1740;
		["posY"] = 2550;
		["script"] = "";
		["text"] = "Who knows, you might have done the same for me.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00380"] = {
		["ID"] = 380;
		["actor"] = 1;
		["connectID"] = 381;
		["posX"] = 1740;
		["posY"] = 2670;
		["script"] = "";
		["text"] = "Thanks don't pay bills.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00381"] = {
		["ID"] = 381;
		["actor"] = 2;
		["posX"] = 2010;
		["posY"] = 2550;
		["script"] = "";
		["text"] = "[t_lost_arphant:zak_reward]You've really helped me man, thanks. Take this as a reward.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00382"] = {
		["ID"] = 382;
		["actor"] = 1;
		["posX"] = 10710;
		["posY"] = 1380;
		["script"] = "";
		["text"] = "I'll see what I can do.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00383"] = {
		["ID"] = 383;
		["actor"] = 1;
		["connectID"] = 294;
		["posX"] = 5490;
		["posY"] = 690;
		["script"] = "";
		["text"] = "What can you tell me about this planet?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00385"] = {
		["ID"] = 385;
		["actor"] = 1;
		["connectID"] = 265;
		["posX"] = 5490;
		["posY"] = 1170;
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
		["posX"] = 360;
		["posY"] = 2790;
		["script"] = "";
		["text"] = "Gotta go.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00387"] = {
		["ID"] = 387;
		["actor"] = 2;
		["connectID"] = 254;
		["posX"] = 5070;
		["posY"] = 90;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00389"] = {
		["ID"] = 389;
		["actor"] = 2;
		["connectID"] = 387;
		["posX"] = 9018.99414062;
		["posY"] = 728.249389648;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00390"] = {
		["ID"] = 390;
		["actor"] = 2;
		["connectID"] = 387;
		["posX"] = 6570;
		["posY"] = 570;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00391"] = {
		["ID"] = 391;
		["actor"] = 1;
		["connectID"] = 393;
		["posX"] = 5490;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00392"] = {
		["ID"] = 392;
		["actor"] = 2;
		["connectID"] = 292;
		["posX"] = 10290;
		["posY"] = 1170;
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
		["text"] = "[t_lost_arphant:start]Hey, can you do me a favor? If you see Molly, lead her to me alright?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00393"] = {
		["ID"] = 393;
		["actor"] = 2;
		["connectID"] = 392;
		["posX"] = 10110;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00394"] = {
		["ID"] = 394;
		["actor"] = 1;
		["connectID"] = 436;
		["posX"] = 5490;
		["posY"] = 1290;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   if self:getDialogParam(\"second\") then\
      return true\
   end\
   return false\
end\
\
";
		["text"] = "I want to talk about something else.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00395"] = {
		["ID"] = 395;
		["actor"] = 2;
		["connectID"] = 216;
		["posX"] = -150;
		["posY"] = 840;
		["script"] = "function message:onStart()\
   setQuestParam(\"lost_arphant\", \"talked_to_zak\", true)\
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
		["connectID"] = 436;
		["posX"] = 1290;
		["posY"] = 2100;
		["script"] = "";
		["text"] = "I'm still working on it.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00409"] = {
		["ID"] = 409;
		["actor"] = 2;
		["connectID"] = 431;
		["posX"] = 810;
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
		["posY"] = 1980;
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
		["text"] = "\\[Show whistle] Is this your whistle?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00426"] = {
		["ID"] = 426;
		["actor"] = 2;
		["connectID"] = 436;
		["posX"] = 600;
		["posY"] = 1980;
		["script"] = "";
		["text"] = "[t_lost_arphant:zak_give_whistle]Yes it is! Must have dropped it somewhere. Here, take this ammo.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00432"] = {
		["ID"] = 432;
		["actor"] = 1;
		["connectID"] = 433;
		["posX"] = 10710;
		["posY"] = 1260;
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
		["text"] = "[t_lost_arphant:zak_who_is_molly]Who the hell is Molly?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00433"] = {
		["ID"] = 433;
		["actor"] = 2;
		["connectID"] = 292;
		["posX"] = 10950;
		["posY"] = 1260;
		["script"] = "";
		["text"] = "Molly is my personal arphant. It's a big and smart K'Tharsian animal that you can ride and transport things. See that thing nearby? That's her platform.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00434"] = {
		["ID"] = 434;
		["actor"] = 1;
		["connectID"] = 435;
		["posX"] = 360;
		["posY"] = 2250;
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
		["connectID"] = 436;
		["posX"] = 600;
		["posY"] = 2250;
		["script"] = "";
		["text"] = "Hm, down the road and over the bridge you will find Hunter's Rest, maybe there's someone there who can help you.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00436"] = {
		["ID"] = 436;
		["actor"] = 2;
		["connectID"] = 366;
		["posX"] = 6000;
		["posY"] = 2160;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00437"] = {
		["ID"] = 437;
		["actor"] = 2;
		["connectID"] = 438;
		["posX"] = 5730;
		["posY"] = 570;
		["script"] = "";
		["text"] = "[t_to_fort:start]Yeah there is a fort there.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00438"] = {
		["ID"] = 438;
		["actor"] = 1;
		["connectID"] = 390;
		["posX"] = 5970;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Gotta find it.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00439"] = {
		["ID"] = 439;
		["actor"] = 1;
		["connectID"] = 437;
		["posX"] = 5490;
		["posY"] = 570;
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
	["switch_00004"] = {
		["ID"] = 4;
		["connectionsID"] = {
			[1] = 211;
			[2] = 206;
			[3] = 5;
		};
		["posX"] = 300;
		["posY"] = 330;
		["type"] = "switch";
	};
	["switch_00208"] = {
		["ID"] = 208;
		["connectionsID"] = {
			[1] = 209;
			[2] = 210;
		};
		["posX"] = 930;
		["posY"] = 330;
		["type"] = "switch";
	};
	["switch_00212"] = {
		["ID"] = 212;
		["connectionsID"] = {
			[1] = 205;
			[2] = 214;
		};
		["posX"] = -150;
		["posY"] = 390;
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
		["posY"] = 840;
		["type"] = "switch";
	};
	["switch_00236"] = {
		["ID"] = 236;
		["connectionsID"] = {
			[1] = 237;
			[2] = 238;
		};
		["posX"] = 2640;
		["posY"] = 840;
		["type"] = "switch";
	};
	["switch_00247"] = {
		["ID"] = 247;
		["connectionsID"] = {
			[1] = 248;
			[2] = 249;
		};
		["posX"] = 3990;
		["posY"] = 840;
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
			[6] = 385;
			[7] = 394;
			[8] = 391;
		};
		["posX"] = 5220;
		["posY"] = 1020;
		["type"] = "switch";
	};
	["switch_00292"] = {
		["ID"] = 292;
		["connectionsID"] = {
			[1] = 288;
			[2] = 290;
			[3] = 432;
			[4] = 382;
		};
		["posX"] = 10530;
		["posY"] = 1170;
		["type"] = "switch";
	};
	["switch_00331"] = {
		["ID"] = 331;
		["connectionsID"] = {
			[1] = 333;
			[2] = 332;
			[3] = 334;
		};
		["posX"] = 2880;
		["posY"] = 1560;
		["type"] = "switch";
	};
	["switch_00348"] = {
		["ID"] = 348;
		["connectionsID"] = {
			[1] = 349;
			[2] = 351;
			[3] = 350;
		};
		["posX"] = 2010;
		["posY"] = 1650;
		["type"] = "switch";
	};
	["switch_00360"] = {
		["ID"] = 360;
		["connectionsID"] = {
			[1] = 346;
			[2] = 359;
		};
		["posX"] = 1560;
		["posY"] = 1650;
		["type"] = "switch";
	};
	["switch_00361"] = {
		["ID"] = 361;
		["connectionsID"] = {
			[1] = 268;
			[2] = 255;
			[3] = 272;
			[4] = 362;
		};
		["posX"] = 6912.74414062;
		["posY"] = 690.499267578;
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
		["posX"] = 180;
		["posY"] = 1560;
		["type"] = "switch";
	};
	["switch_00374"] = {
		["ID"] = 374;
		["connectionsID"] = {
			[1] = 369;
			[2] = 371;
			[3] = 373;
		};
		["posX"] = 840;
		["posY"] = 2550;
		["type"] = "switch";
	};
	["switch_00377"] = {
		["ID"] = 377;
		["connectionsID"] = {
			[1] = 378;
			[2] = 379;
			[3] = 380;
		};
		["posX"] = 1560;
		["posY"] = 2550;
		["type"] = "switch";
	};
	["switch_00408"] = {
		["ID"] = 408;
		["connectionsID"] = {
			[1] = 317;
			[2] = 409;
		};
		["posX"] = 626.117675781;
		["posY"] = 1741.87402344;
		["type"] = "switch";
	};
	["switch_00431"] = {
		["ID"] = 431;
		["connectionsID"] = {
			[1] = 319;
			[2] = 320;
			[3] = 321;
			[4] = 407;
		};
		["posX"] = 1110;
		["posY"] = 1740;
		["type"] = "switch";
	};
}
return obj1
