-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 5;
		["posX"] = 750;
		["posY"] = 270;
		["script"] = "";
		["text"] = "You don't look like you've got anything worth to steal. Need any help?";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 7;
		["posX"] = 750;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Look who's talking. Your handcuffs and collars don't exactly look like tribal jewelry.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["posX"] = 750;
		["posY"] = 510;
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
		["text"] = "Shut your pothole and pray so I don't skin you alive for talking to me like that, slave.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 2;
		["connectID"] = 6;
		["posX"] = 990;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Help? Sure, I wouldn't mind a booze fountain and roasted bitebugs that jump into my mouth themselves.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 2;
		["connectID"] = 11;
		["posX"] = 1268.125;
		["posY"] = 187.6251373291;
		["script"] = "";
		["text"] = "All you humas are good for are lies and empty promises.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 2;
		["connectID"] = 8;
		["posX"] = 990;
		["posY"] = 390;
		["script"] = "";
		["text"] = "I'd like to see how you would look like after a couple of years of mining antigravium chained to a shitter.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 2;
		["connectID"] = 9;
		["posX"] = 1230;
		["posY"] = 390;
		["script"] = "";
		["text"] = "I've seen the likes of you, you wouldn't even last 3 moons, pinkface.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 11;
		["posX"] = 1470;
		["posY"] = 390;
		["script"] = "";
		["text"] = "*murmuring* what would I give for a roasted crucass...";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["connectID"] = 17;
		["posX"] = 1920;
		["posY"] = -30;
		["script"] = "";
		["text"] = "Who are you?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 1920;
		["posY"] = 300;
		["script"] = "";
		["text"] = "What are you doing here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 1;
		["connectID"] = 20;
		["posX"] = 1920;
		["posY"] = 420;
		["script"] = "";
		["text"] = "I'll be on my way.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 2160;
		["posY"] = -30;
		["script"] = "";
		["text"] = "You're kidding, right? Never saw temporarily freedom-limited workers huma?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 2160;
		["posY"] = 180;
		["script"] = "";
		["text"] = "What do you care? Some sort of charity? We'd rather die than accept anything from a lying huma.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["connectID"] = 23;
		["posX"] = 2160;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Sunbathing. Didn't get a whiff of fresh air in a while.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["connectID"] = 75;
		["posX"] = 2160;
		["posY"] = 420;
		["script"] = "function message:onStart()\
   getQuest(\"lost_arphant\"):writeLog(\"MetSlaves\")\
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
		["text"] = "[t_lost_arphant:juggo_warning]One more thing, huma. See that arphant over there? Don't get near it, you'll startle it and it'll stomp you to death.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 1;
		["connectID"] = 25;
		["posX"] = 2400;
		["posY"] = -30;
		["script"] = "";
		["text"] = "You're slaves? What's this, the middle ages?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 1;
		["connectID"] = 28;
		["posX"] = 2400;
		["posY"] = 180;
		["script"] = "";
		["text"] = "You could always go hunting.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["connectID"] = 24;
		["posX"] = 2400;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Don't get so cocky. Someone else would have already kicked your teeth in.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 37;
		["posX"] = 2640;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Someone else is alone and there's three of us. Besides, I wouldn't survive this long if I wasn't cocky. So I'll take my chances.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 2640;
		["posY"] = -30;
		["script"] = "";
		["text"] = "You look so surprised as if you've seen a flying arphant. Who else would wear these on K'Tharsis, hmm?";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 2;
		["connectID"] = 27;
		["posX"] = 2880;
		["posY"] = -30;
		["script"] = "";
		["text"] = "But at least we could get away from that hellhole our \"employer\" put us in.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 2;
		["connectID"] = 34;
		["posX"] = 3120;
		["posY"] = -30;
		["script"] = "";
		["text"] = "And we're not going back, even if it means we starve to death.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["connectID"] = 29;
		["posX"] = 2640;
		["posY"] = 180;
		["script"] = "";
		["text"] = "*laughs* If we could manage to kill a hornhog with a cactus club, we wouldn't need the club in the first place.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 2;
		["connectID"] = 30;
		["posX"] = 2880;
		["posY"] = 180;
		["script"] = "";
		["text"] = "But if huma brings us, say, half a dozen pieces of fried meat, the huma will get some pure antigravium. And our respect, for what's it worth, being able to do alone what the three of us couldn't.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 1;
		["connectID"] = 36;
		["posX"] = 3330;
		["posY"] = 120;
		["script"] = "";
		["text"] = "Right. How about I get some advance payment, say for ammo and stuff?";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 1;
		["connectID"] = 38;
		["posX"] = 3330;
		["posY"] = 240;
		["script"] = "function message:onStart()\
   getQuest(\"lost_arphant\"):writeLog(\"MetSlaves\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"lost_arphant\"):getTopicVisible(\"juggo_feed\")\
end\
\
";
		["text"] = "\\[Show the meat]";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 1;
		["connectID"] = 35;
		["posX"] = 3360;
		["posY"] = -30;
		["script"] = "";
		["text"] = "And how did you manage to get away?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 2;
		["connectID"] = 37;
		["posX"] = 3600;
		["posY"] = -30;
		["script"] = "";
		["text"] = "That's none of your business, huma.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 2;
		["connectID"] = 79;
		["posX"] = 3570;
		["posY"] = 120;
		["script"] = "";
		["text"] = "Who are you trying to fool, huma? Meat comes before antigravium, and that's the only way.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 2;
		["connectID"] = 11;
		["posX"] = 4380;
		["posY"] = 690;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 2;
		["connectID"] = 39;
		["posX"] = 1080;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "Then what are you waiting for?! Give it here!";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00040"] = {
		["ID"] = 40;
		["actor"] = 1;
		["connectID"] = 56;
		["posX"] = 1500;
		["posY"] = 990;
		["script"] = "";
		["text"] = "[t_lost_arphant:juggo_feed]\\[Give the meat] Here it is";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 1;
		["connectID"] = 60;
		["posX"] = 1500;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "Not so fast.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 2;
		["connectID"] = 415;
		["posX"] = -840;
		["posY"] = 180;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 2;
		["connectID"] = 47;
		["posX"] = 300;
		["posY"] = 870;
		["script"] = "function message:onStart()\
   self:setDialogParam(\"second\", true)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuest(\"lost_arphant\"):getTopicVisible(\"juggo_intro\")\
end\
";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 300;
		["posY"] = 330;
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
		["text"] = "[t_lost_arphant:juggo_intro]Hey, huma! What do you want here? Ain't nothing here to steal.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 1;
		["connectID"] = 38;
		["posX"] = 840;
		["posY"] = 1050;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"lost_arphant\"):getTopicVisible(\"juggo_feed\")\
end\
\
";
		["text"] = "I've got the meat.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 1;
		["connectID"] = 71;
		["posX"] = 840;
		["posY"] = 1170;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible() and getQuest(\"lost_arphant\"):isActive()\
end\
\
";
		["text"] = "[t_lost_arphant:juggo_about_molly]So about that striped arphant...";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 1;
		["posX"] = 840;
		["posY"] = 840;
		["script"] = "function message:onStart()\
   self:setDialogParam(\"n53\", 1)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   if(not self:getDialogParam(\"n53\")) then\
      return false\
   end\
   return false\
end\
\
";
		["text"] = "life in mines";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 1;
		["posX"] = 840;
		["posY"] = 720;
		["script"] = "function message:onStart()\
   self:setDialogParam(\"n54\", 1)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   if(not self:getDialogParam(\"n54\")) then\
      return false\
   end\
   return false\
end\
\
";
		["text"] = "why here how escaped";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 2;
		["connectID"] = 58;
		["posX"] = 1740;
		["posY"] = 990;
		["script"] = "";
		["text"] = "Praise the ancestors! I don't believe my eyes! Seems like there are some decent humas left out there. Even a stick shoots once a hundred years after all.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 1980;
		["posY"] = 990;
		["script"] = "";
		["text"] = "Listen up: see those settlement ruins? In the furthest house there is a door on the floor, covered with sand. We stashed there some of our haul.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 2;
		["connectID"] = 62;
		["posX"] = 1740;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "Don't worry, I'll tell you where you can find our stash.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 1;
		["connectID"] = 68;
		["posX"] = 2220;
		["posY"] = 990;
		["script"] = "";
		["text"] = "You better not bullshit me about that stash of yours.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 2;
		["connectID"] = 65;
		["posX"] = 1980;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "Listen up: see those settlement ruins? In the furthest house there is a door on the floor, covered with sand. We stashed there some of our haul.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 2460;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "Praise the ancestors! I don't believe my eyes! Seems like there are some decent humas left out there. Even a stick shoots once a hundred years after all.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00065"] = {
		["ID"] = 65;
		["actor"] = 1;
		["connectID"] = 64;
		["posX"] = 2220;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "[t_lost_arphant:juggo_feed]Here is the meat.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 2;
		["connectID"] = 69;
		["posX"] = 2460;
		["posY"] = 990;
		["script"] = "";
		["text"] = "We might have been slaves for the last couple of years, but that doesn't mean we won't honor the agreement. May the Sky Hunter keep you safe, huma.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 2;
		["connectID"] = 422;
		["posX"] = 2700;
		["posY"] = 990;
		["script"] = "";
		["text"] = "Let's hope this antigravium won't be the cause of your demise.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00073"] = {
		["ID"] = 73;
		["actor"] = 2;
		["connectID"] = 84;
		["posX"] = 1470;
		["posY"] = 1290;
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
		["text"] = "I told you it's our beast, stay away from it!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00074"] = {
		["ID"] = 74;
		["actor"] = 2;
		["connectID"] = 426;
		["posX"] = 1710;
		["posY"] = 1650;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not self:getDialogParam(\"knows_whistle_gone\")\
end\
\
";
		["text"] = "Did you find the whistle?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00075"] = {
		["ID"] = 75;
		["actor"] = 1;
		["connectID"] = 76;
		["posX"] = 2400;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Why do you care what happens to me?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00076"] = {
		["ID"] = 76;
		["actor"] = 2;
		["connectID"] = 83;
		["posX"] = 2640;
		["posY"] = 420;
		["script"] = "";
		["text"] = "We have plans concerning that arphant, and you startling it isn't helping it one bit.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00078"] = {
		["ID"] = 78;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = 1920;
		["posY"] = 180;
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
		["text"] = "[t_lost_arphant:juggo_ask_hungry]So you're hungry?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00080"] = {
		["ID"] = 80;
		["actor"] = 2;
		["connectID"] = 37;
		["posX"] = 4020;
		["posY"] = 60;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   if not self:getDialogParam(\"second\") then\
      return true\
   end\
   return false\
end\
\
";
		["text"] = "first time talking";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00081"] = {
		["ID"] = 81;
		["actor"] = 2;
		["connectID"] = 82;
		["posX"] = 4020;
		["posY"] = 180;
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
		["text"] = "second time talking";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00082"] = {
		["ID"] = 82;
		["actor"] = 2;
		["connectID"] = 47;
		["posX"] = 2700;
		["posY"] = 3150;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 2;
		["posX"] = 2880;
		["posY"] = 420;
		["script"] = "";
		["text"] = "The stomping part isn't a lie too, so keep your distance, for your own sake.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00085"] = {
		["ID"] = 85;
		["actor"] = 1;
		["connectID"] = 87;
		["posX"] = 1890;
		["posY"] = 1260;
		["script"] = "function message:onStart()\
   self:setDialogParam(\"said_knows_owner\", true)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestParam(\"lost_arphant\", \"talked_to_zak\")\
end\
\
";
		["text"] = "Actually I know the owner.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00087"] = {
		["ID"] = 87;
		["actor"] = 2;
		["connectID"] = 89;
		["posX"] = 2130;
		["posY"] = 1260;
		["script"] = "";
		["text"] = "So what? I don't see nobody here. Seems that he doesn't care much about that property of his. Which means finders keepers.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00090"] = {
		["ID"] = 90;
		["actor"] = 1;
		["connectID"] = 91;
		["posX"] = 2520;
		["posY"] = 1260;
		["script"] = "";
		["text"] = "I'm helping the owner get the arphant back to him.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 2;
		["connectID"] = 93;
		["posX"] = 2760;
		["posY"] = 1260;
		["script"] = "";
		["text"] = "Don't be a fool, huma! The owner is there and we are here! If a certain someone helps us deal with a certain arphant, that certain someone might get his hands on something of value.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00092"] = {
		["ID"] = 92;
		["actor"] = 1;
		["posX"] = 2520;
		["posY"] = 1380;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   goToQuestStepTimer(\"lost_arphant\", \"slave_dig\", 0)\
end\
\
function message:isVisible()\
   local ItemsData = (require \"itemsData\")\
   for k,v in pairs(getPlayer().itemsManager.items) do\
      local anims = ItemsData.getItemAnimations(v.name)\
      if anims == \"shotgun\" then\
         return false\
      end\
   end\
   return false\
end\
\
";
		["text"] = "\\[Show shotgun] I don't think so. Start digging.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00093"] = {
		["ID"] = 93;
		["actor"] = 1;
		["connectID"] = 94;
		["posX"] = 2520;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "What do you want with it?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00094"] = {
		["ID"] = 94;
		["actor"] = 2;
		["connectID"] = 95;
		["posX"] = 2760;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "It's a pack animal which we can ride. We'll pack it with our shit, food and water and cross the desert. No one will follow us to the desert.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00095"] = {
		["ID"] = 95;
		["actor"] = 2;
		["connectID"] = 98;
		["posX"] = 3000;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "Arphants don't need fuel or roads, and it can find an oasis all on its own. And they can always be sold for good money.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00098"] = {
		["ID"] = 98;
		["actor"] = 1;
		["connectID"] = 101;
		["posX"] = 3240;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "How do you plan to make the arphant do what you want?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00100"] = {
		["ID"] = 100;
		["actor"] = 2;
		["connectID"] = 103;
		["posX"] = 3870;
		["posY"] = 1410;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getDialogParam(\"said_knows_owner\")\
end\
\
";
		["text"] = "You said you know the owner, didn't you?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00101"] = {
		["ID"] = 101;
		["actor"] = 2;
		["connectID"] = 102;
		["posX"] = 3480;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "Yeah, it's a problem. But it's solvable, and that's where you can help us.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00103"] = {
		["ID"] = 103;
		["actor"] = 2;
		["connectID"] = 105;
		["posX"] = 4170;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "Arphants have poor sight, but they have excellent hearing. The owner should have a whistle with which he can give the arphant commands.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00105"] = {
		["ID"] = 105;
		["actor"] = 2;
		["connectID"] = 106;
		["posX"] = 4410;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "[t_lost_arphant:juggo_wants_whistle]Find the whistle, and we can use it to tame the arphant.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00106"] = {
		["ID"] = 106;
		["actor"] = 1;
		["connectID"] = 107;
		["posX"] = 4650;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "Is there any other way? What if I can't get the whistle?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00107"] = {
		["ID"] = 107;
		["actor"] = 2;
		["connectID"] = 108;
		["posX"] = 4890;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "Well I'm no arphant professor, but I did hear that the nomads know some sort of plant. If you give it to the arphant it calms them down and makes them receptive to others.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00108"] = {
		["ID"] = 108;
		["actor"] = 2;
		["connectID"] = 109;
		["posX"] = 5130;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "But you must know the exact recipe or it won't work. In which case the arphant...";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00109"] = {
		["ID"] = 109;
		["actor"] = 1;
		["connectID"] = 110;
		["posX"] = 5370;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "...will stomp me to death. Yeah, I got it.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00110"] = {
		["ID"] = 110;
		["actor"] = 2;
		["connectID"] = 111;
		["posX"] = 5610;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "Right. So if you stumble upon a nomad, try getting the recipe out of him. They are known arphant-stealers.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00111"] = {
		["ID"] = 111;
		["actor"] = 1;
		["connectID"] = 112;
		["posX"] = 5850;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "The most important question is: what do I get for helping you?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00112"] = {
		["ID"] = 112;
		["actor"] = 2;
		["connectID"] = 113;
		["posX"] = 6090;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "We've scavenged some sort of a big gun, but it looks like it's broken. You can probably get it fixed for a couple hundred greenies at any workshop.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00113"] = {
		["ID"] = 113;
		["actor"] = 2;
		["connectID"] = 114;
		["posX"] = 6330;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "With that kind of serious weapon who knows what kind of trouble you might avoid. Or start. Your choice.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00114"] = {
		["ID"] = 114;
		["actor"] = 1;
		["connectID"] = 115;
		["posX"] = 6570;
		["posY"] = 1470;
		["script"] = "";
		["text"] = "That arphant is stuck. How do you plan on getting it out?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00116"] = {
		["ID"] = 116;
		["actor"] = 2;
		["connectID"] = 117;
		["posX"] = 6960;
		["posY"] = 1410;
		["script"] = "function message:onStart()\
   self:setDialogParam( \"slave_dig\", true )\
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
		["text"] = "Not a problem. We're gonna dig a way out. It'll take some time, and after it's done that whistle is going to be really useful, huma!";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00117"] = {
		["ID"] = 117;
		["actor"] = 1;
		["posX"] = 7230;
		["posY"] = 1470;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   --This will start the digging after the msssage is played\
   if self:getDialogParam( \"slave_dig\" ) then\
      getQuest(\"lost_arphant\"):goToStep(\"slave_dig\")\
   end\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "I'll see what I can do.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00118"] = {
		["ID"] = 118;
		["actor"] = 2;
		["connectID"] = 117;
		["posX"] = 6960;
		["posY"] = 1530;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuest(\"lost_arphant\"):getTopicVisible(\"juggo_gonna_dig\")\
end\
\
";
		["text"] = "[t_lost_arphant:juggo_ask_hungry]We could dig a way out but we're way too hungry.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00120"] = {
		["ID"] = 120;
		["actor"] = 1;
		["connectID"] = 124;
		["posX"] = 2190;
		["posY"] = 2250;
		["script"] = "";
		["text"] = "Not yet.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00121"] = {
		["ID"] = 121;
		["actor"] = 1;
		["connectID"] = 122;
		["posX"] = 2190;
		["posY"] = 2130;
		["script"] = "function message:onStart()\
   self:setDialogParam(\"knows_whistle_gone\", true)\
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
		["text"] = "[t_lost_arphant:juggo_tell_whistle]Actually, I've already given it to its rightful owner.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00122"] = {
		["ID"] = 122;
		["actor"] = 2;
		["connectID"] = 431;
		["posX"] = 2430;
		["posY"] = 2130;
		["script"] = "";
		["text"] = "What?! You had it and gave it away?! Curse you huma!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00123"] = {
		["ID"] = 123;
		["actor"] = 1;
		["connectID"] = 129;
		["posX"] = 2190;
		["posY"] = 2010;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isFirstTime() and hasPlayerItem(\"arphant_tranquilizer_weed.itm\")\
end\
\
";
		["text"] = "I've got something better: arphant's weed! If you feed it to the arphant, it'll do whatever you need for a week.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00124"] = {
		["ID"] = 124;
		["actor"] = 2;
		["connectID"] = 82;
		["posX"] = 2430;
		["posY"] = 2250;
		["script"] = "";
		["text"] = "Then what are you waiting for?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00125"] = {
		["ID"] = 125;
		["actor"] = 2;
		["connectID"] = 126;
		["posX"] = 2430;
		["posY"] = 1890;
		["script"] = "";
		["text"] = "[t_lost_arphant:juggo_give_whistle]Let's give it a try!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00126"] = {
		["ID"] = 126;
		["actor"] = 2;
		["connectID"] = 127;
		["posX"] = 2670;
		["posY"] = 1890;
		["script"] = "";
		["text"] = "[t_lost_arphant:juggo_blows_whistle]*blows the whistle*";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00127"] = {
		["ID"] = 127;
		["actor"] = 1;
		["connectID"] = 128;
		["posX"] = 2910;
		["posY"] = 1890;
		["script"] = "";
		["text"] = "Looks like the arphant is obeying.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00128"] = {
		["ID"] = 128;
		["actor"] = 2;
		["posX"] = 3150;
		["posY"] = 1890;
		["script"] = "";
		["text"] = "[t_lost_arphant:juggo_reward]Fuck yeah! Here's your reward, huma! See you on the other side of the White Erg!";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00129"] = {
		["ID"] = 129;
		["actor"] = 2;
		["posX"] = 2430;
		["posY"] = 2010;
		["script"] = "";
		["text"] = "Nah, you go feed it, you look like you know what you're doing.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00130"] = {
		["ID"] = 130;
		["actor"] = 2;
		["connectID"] = 132;
		["posX"] = 60;
		["posY"] = 1320;
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
		["text"] = "[t_lost_arphant:juggo_what_the_hell]What the hell are you doing?!";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00131"] = {
		["ID"] = 131;
		["actor"] = 2;
		["connectID"] = 135;
		["posX"] = 0;
		["posY"] = 1500;
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
		["text"] = "[t_lost_arphant:juggo_weed_worked]It worked, no way! I thought the rumors were fake about the weed. You're a resourceful son of a bitch huma!";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00132"] = {
		["ID"] = 132;
		["actor"] = 1;
		["connectID"] = 133;
		["posX"] = 321.249023438;
		["posY"] = 1384.37451172;
		["script"] = "";
		["text"] = "Either the nomad screwed me over or the weed is of a bad quality! Damn, it nearly got me!";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00133"] = {
		["ID"] = 133;
		["actor"] = 2;
		["connectID"] = 134;
		["posX"] = 581.749023438;
		["posY"] = 1453.87451172;
		["script"] = "";
		["text"] = "May a crucass chew off your junk huma! That arphant was our sure way to new life! And you fucked it all up!";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00134"] = {
		["ID"] = 134;
		["actor"] = 2;
		["posX"] = 853.751586914;
		["posY"] = 1507.12451172;
		["script"] = "";
		["text"] = "*curses in aboriginal*";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00135"] = {
		["ID"] = 135;
		["actor"] = 1;
		["connectID"] = 137;
		["posX"] = 286.001403809;
		["posY"] = 1541.87329102;
		["script"] = "";
		["text"] = "Here's your obedient arphant, just as agreed.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00137"] = {
		["ID"] = 137;
		["actor"] = 2;
		["connectID"] = 138;
		["posX"] = 803.501464844;
		["posY"] = 1725.74743652;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00138"] = {
		["ID"] = 138;
		["actor"] = 2;
		["connectID"] = 139;
		["posX"] = 2160;
		["posY"] = 1710;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00139"] = {
		["ID"] = 139;
		["actor"] = 2;
		["connectID"] = 128;
		["posX"] = 2970;
		["posY"] = 1710;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00397"] = {
		["ID"] = 397;
		["actor"] = 2;
		["connectID"] = 78;
		["posX"] = 1230;
		["posY"] = 900;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00398"] = {
		["ID"] = 398;
		["actor"] = 1;
		["posX"] = 840;
		["posY"] = 1290;
		["script"] = "";
		["text"] = "Bye.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00407"] = {
		["ID"] = 407;
		["actor"] = 2;
		["connectID"] = 50;
		["posX"] = 1320;
		["posY"] = 630;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00408"] = {
		["ID"] = 408;
		["actor"] = 2;
		["connectID"] = 410;
		["posX"] = 3090;
		["posY"] = 930;
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
		["text"] = "[t_lost_arphant:juggo_warning]One more thing, huma. See that arphant over there? Don't get near it, you'll startle it and it'll stomp you to death.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00410"] = {
		["ID"] = 410;
		["actor"] = 2;
		["connectID"] = 83;
		["posX"] = 3330;
		["posY"] = 930;
		["script"] = "";
		["text"] = "You did give us food when we needed it, but we have plans concerning that arphant, and you startling it won't help us one bit.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00411"] = {
		["ID"] = 411;
		["actor"] = 1;
		["connectID"] = 416;
		["posX"] = -420;
		["posY"] = -30;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00414"] = {
		["ID"] = 414;
		["actor"] = 1;
		["connectID"] = 424;
		["posX"] = -420;
		["posY"] = 360;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00417"] = {
		["ID"] = 417;
		["actor"] = 1;
		["posX"] = -30;
		["posY"] = -150;
		["script"] = "function message:onStart()\
   goToQuestStep(\"lost_arphant\", \"gave_food\")\
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
		["text"] = "feed";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00418"] = {
		["ID"] = 418;
		["actor"] = 1;
		["posX"] = -30;
		["posY"] = -30;
		["script"] = "function message:onStart()\
   goToQuestStep(\"lost_arphant\", \"slave_dig\")\
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
		["text"] = "force dig";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00419"] = {
		["ID"] = 419;
		["actor"] = 1;
		["posX"] = -30;
		["posY"] = 90;
		["script"] = "";
		["text"] = "end";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00420"] = {
		["ID"] = 420;
		["actor"] = 1;
		["connectID"] = 125;
		["posX"] = 2190;
		["posY"] = 1890;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"juggo_give_whistle\")\
end\
\
";
		["text"] = "\\[Give whistle] Yes.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00421"] = {
		["ID"] = 421;
		["actor"] = 2;
		["connectID"] = 47;
		["posX"] = 1470;
		["posY"] = 1440;
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
		["text"] = "[t_lost_arphant:juggo_cant_dig]I told you, we can't dig him out until we've had something to eat.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00423"] = {
		["ID"] = 423;
		["actor"] = 2;
		["posX"] = 3090;
		["posY"] = 1050;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   --This will start the digging after the msssage is played\
   getQuest(\"lost_arphant\"):goToStep(\"slave_dig\")\
end\
\
function message:isVisible()\
   return self:isTopicVisible()\
end\
\
";
		["text"] = "Alright, it's time to dig out that arphant!";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00425"] = {
		["ID"] = 425;
		["actor"] = 2;
		["posX"] = 300;
		["posY"] = 180;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestActiveStepName(\"lost_arphant\") == \"slave_dig\"\
end\
\
";
		["text"] = "It's not done huma, come later!";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00427"] = {
		["ID"] = 427;
		["actor"] = 2;
		["connectID"] = 429;
		["posX"] = 1410;
		["posY"] = 2160;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getDialogParam(\"knows_whistle_gone\")\
end\
\
";
		["text"] = "I could really use some good news huma. Especially after you gave away the whistle!";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00430"] = {
		["ID"] = 430;
		["actor"] = 1;
		["connectID"] = 432;
		["posX"] = 1860;
		["posY"] = 2310;
		["script"] = "";
		["text"] = "I'm afraid I have none at the moment.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00431"] = {
		["ID"] = 431;
		["actor"] = 2;
		["posX"] = 2670;
		["posY"] = 2130;
		["script"] = "";
		["text"] = "Now our only hope is the mythical arphant weed.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00432"] = {
		["ID"] = 432;
		["actor"] = 2;
		["connectID"] = 82;
		["posX"] = 2040;
		["posY"] = 2550;
		["script"] = "";
		["text"] = "And here I was thinking that you're not like the other humas...";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00433"] = {
		["ID"] = 433;
		["actor"] = 1;
		["connectID"] = 434;
		["posX"] = 750;
		["posY"] = 150;
		["script"] = "";
		["text"] = "I don't steal things.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00434"] = {
		["ID"] = 434;
		["actor"] = 2;
		["connectID"] = 6;
		["posX"] = 990;
		["posY"] = 150;
		["script"] = "";
		["text"] = "Is that so? How do I know you're telling the truth?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 433;
			[2] = 2;
			[3] = 3;
			[4] = 4;
		};
		["posX"] = 570;
		["posY"] = 330;
		["type"] = "switch";
	};
	["switch_00011"] = {
		["ID"] = 11;
		["connectionsID"] = {
			[1] = 12;
			[2] = 78;
			[3] = 407;
			[4] = 14;
			[5] = 15;
		};
		["posX"] = 1770;
		["posY"] = 270;
		["type"] = "switch";
	};
	["switch_00030"] = {
		["ID"] = 30;
		["connectionsID"] = {
			[1] = 31;
			[2] = 32;
		};
		["posX"] = 3150;
		["posY"] = 180;
		["type"] = "switch";
	};
	["switch_00039"] = {
		["ID"] = 39;
		["connectionsID"] = {
			[1] = 40;
			[2] = 41;
		};
		["posX"] = 1350;
		["posY"] = 1050;
		["type"] = "switch";
	};
	["switch_00047"] = {
		["ID"] = 47;
		["connectionsID"] = {
			[1] = 54;
			[2] = 53;
			[3] = 397;
			[4] = 50;
			[5] = 51;
			[6] = 398;
		};
		["posX"] = 630;
		["posY"] = 990;
		["type"] = "switch";
	};
	["switch_00071"] = {
		["ID"] = 71;
		["connectionsID"] = {
			[1] = 73;
			[2] = 421;
			[3] = 74;
			[4] = 427;
		};
		["posX"] = 1230;
		["posY"] = 1350;
		["type"] = "switch";
	};
	["switch_00079"] = {
		["ID"] = 79;
		["connectionsID"] = {
			[1] = 80;
			[2] = 81;
		};
		["posX"] = 3870;
		["posY"] = 120;
		["type"] = "switch";
	};
	["switch_00084"] = {
		["ID"] = 84;
		["connectionsID"] = {
			[1] = 85;
			[2] = 93;
		};
		["posX"] = 1740;
		["posY"] = 1290;
		["type"] = "switch";
	};
	["switch_00089"] = {
		["ID"] = 89;
		["connectionsID"] = {
			[1] = 90;
			[2] = 92;
			[3] = 93;
		};
		["posX"] = 2370;
		["posY"] = 1350;
		["type"] = "switch";
	};
	["switch_00102"] = {
		["ID"] = 102;
		["connectionsID"] = {
			[1] = 100;
			[2] = 103;
		};
		["posX"] = 3720;
		["posY"] = 1500;
		["type"] = "switch";
	};
	["switch_00115"] = {
		["ID"] = 115;
		["connectionsID"] = {
			[1] = 116;
			[2] = 118;
		};
		["posX"] = 6810;
		["posY"] = 1470;
		["type"] = "switch";
	};
	["switch_00415"] = {
		["ID"] = 415;
		["connectionsID"] = {
			[1] = 411;
			[2] = 414;
		};
		["posX"] = -570;
		["posY"] = 180;
		["type"] = "switch";
	};
	["switch_00416"] = {
		["ID"] = 416;
		["connectionsID"] = {
			[1] = 417;
			[2] = 418;
			[3] = 419;
		};
		["posX"] = -180;
		["posY"] = -30;
		["type"] = "switch";
	};
	["switch_00422"] = {
		["ID"] = 422;
		["connectionsID"] = {
			[1] = 408;
			[2] = 423;
		};
		["posX"] = 2940;
		["posY"] = 990;
		["type"] = "switch";
	};
	["switch_00424"] = {
		["ID"] = 424;
		["connectionsID"] = {
			[1] = 425;
			[2] = 45;
			[3] = 130;
			[4] = 131;
			[5] = 44;
		};
		["posX"] = -60;
		["posY"] = 330;
		["type"] = "switch";
	};
	["switch_00426"] = {
		["ID"] = 426;
		["connectionsID"] = {
			[1] = 420;
			[2] = 123;
			[3] = 121;
			[4] = 120;
		};
		["posX"] = 1980;
		["posY"] = 1920;
		["type"] = "switch";
	};
	["switch_00429"] = {
		["ID"] = 429;
		["connectionsID"] = {
			[1] = 123;
			[2] = 430;
		};
		["posX"] = 1680;
		["posY"] = 2160;
		["type"] = "switch";
	};
}
return obj1
