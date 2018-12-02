-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["animation"] = "dl_chuckle";
		["connectID"] = 5;
		["posX"] = 1020;
		["posY"] = -330;
		["script"] = "";
		["text"] = "You don't look like you've got anything worth to steal. Need any help?";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["animation"] = "dl_point_forward";
		["connectID"] = 7;
		["posX"] = 1020;
		["posY"] = -180;
		["script"] = "";
		["text"] = "Look who's talking. Your handcuffs and collars don't exactly look like tribal jewelry.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["posX"] = 1020;
		["posY"] = -30;
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
		["text"] = "[HIDDEN]Shut your pothole and pray so I don't skin you alive for talking to me like that, slave.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 2;
		["connectID"] = 6;
		["posX"] = 1260;
		["posY"] = -330;
		["script"] = "";
		["text"] = "Help? Sure, I wouldn't mind a booze fountain and roasted bitebugs that jump into my mouth themselves.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 2;
		["animation"] = "dl_hands_strike";
		["connectID"] = 11;
		["posX"] = 1530;
		["posY"] = -390;
		["script"] = "";
		["text"] = "All you humas are good for are lies and empty promises.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 2;
		["animation"] = "dl_stop_onehand";
		["connectID"] = 8;
		["posX"] = 1260;
		["posY"] = -180;
		["script"] = "";
		["text"] = "I'd like to see how you would look like after a couple of years of mining antigravium chained to a shitter.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 9;
		["posX"] = 1500;
		["posY"] = -180;
		["script"] = "";
		["text"] = "I've seen the likes of you, you wouldn't even last 3 moons, pinkface.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["animation"] = "dl_head_wipe";
		["connectID"] = 11;
		["posX"] = 1740;
		["posY"] = -180;
		["script"] = "";
		["text"] = "*murmuring* what would I give for a roasted crucass...";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["connectID"] = 17;
		["posX"] = 1680;
		["posY"] = 90;
		["script"] = "";
		["text"] = "Who are you?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 1680;
		["posY"] = 240;
		["script"] = "";
		["text"] = "What are you doing here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 1;
		["connectID"] = 20;
		["posX"] = 1680;
		["posY"] = 2700;
		["script"] = "";
		["text"] = "I'll be on my way.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["animation"] = "dl_chuckle";
		["connectID"] = 21;
		["posX"] = 1920;
		["posY"] = 90;
		["script"] = "";
		["text"] = "You're kidding, right? Never saw temporarily freedom-limited workers huma?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 1920;
		["posY"] = 420;
		["script"] = "";
		["text"] = "What do you care? Some sort of charity? We'd rather die than accept anything from a lying huma.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["animation"] = "dl_shrug_long";
		["connectID"] = 23;
		["posX"] = 1920;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Sunbathing. Didn't get a whiff of fresh air in a while.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["connectID"] = 75;
		["posX"] = 1920;
		["posY"] = 2700;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"juggo_start\")\
end\
\
";
		["text"] = "One more thing, huma. See that arphant over there? Don't get near it, you'll startle it and it'll stomp you to death.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 1;
		["connectID"] = 25;
		["posX"] = 2160;
		["posY"] = 90;
		["script"] = "";
		["text"] = "You're slaves? What's this, the middle ages?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 1;
		["connectID"] = 28;
		["posX"] = 2160;
		["posY"] = 420;
		["script"] = "";
		["text"] = "You could always go hunting.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["animation"] = "dl_raisedfinger_right";
		["connectID"] = 24;
		["posX"] = 2160;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Don't get so cocky. Someone else would have already kicked your teeth in.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["animation"] = "dl_raisedfinger_right";
		["connectID"] = 37;
		["posX"] = 2400;
		["posY"] = 240;
		["script"] = "";
		["text"] = "'Someone else' is alone and there's three of us. Besides, I wouldn't survive this long if I wasn't cocky. So I'll take my chances.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 2400;
		["posY"] = 90;
		["script"] = "";
		["text"] = "You look so surprised as if you've seen a flying arphant. Who else would wear these on K'Tharsis, hmm?";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 2;
		["connectID"] = 27;
		["posX"] = 2640;
		["posY"] = 90;
		["script"] = "";
		["text"] = "But at least we could get away from that hellhole our \"employer\" put us in.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 2;
		["connectID"] = 34;
		["posX"] = 2880;
		["posY"] = 90;
		["script"] = "";
		["text"] = "And we're not going back, even if it means we starve to death.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["animation"] = "dl_chuckle";
		["connectID"] = 29;
		["posX"] = 2400;
		["posY"] = 420;
		["script"] = "";
		["text"] = "*laughs* If we could manage to kill a hornhog with a cactus club, we wouldn't need the club in the first place.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 2;
		["animation"] = "dl_stop_onehand";
		["connectID"] = 30;
		["posX"] = 2640;
		["posY"] = 420;
		["script"] = "";
		["text"] = "[t_lost_arphant:juggo_wants_meat]But if huma brings us, say, half a dozen pieces of fried meat, the huma will get some pure antigravium. And our respect, for what's it worth, being able to do alone what the three of us couldn't.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 1;
		["animation"] = "dl_head_nod";
		["connectID"] = 36;
		["posX"] = 3030;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Right. How about I get some advance payment, say for ammo and stuff?";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 1;
		["connectID"] = 35;
		["posX"] = 3120;
		["posY"] = 90;
		["script"] = "";
		["text"] = "And how did you manage to get away?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 2;
		["animation"] = "dl_hand_negative";
		["connectID"] = 37;
		["posX"] = 3360;
		["posY"] = 90;
		["script"] = "";
		["text"] = "That's none of your business, huma.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 2;
		["connectID"] = 37;
		["posX"] = 3270;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Who are you trying to fool, huma? Meat comes before antigravium, and that's the only way.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 2;
		["connectID"] = 11;
		["posX"] = 4650;
		["posY"] = 540;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 2;
		["animation"] = "dl_hands_washing";
		["connectID"] = 39;
		["posX"] = 1920;
		["posY"] = 690;
		["script"] = "";
		["text"] = "Then what are you waiting for?! Give it here!";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00040"] = {
		["ID"] = 40;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 56;
		["posX"] = 2310;
		["posY"] = 600;
		["script"] = "";
		["text"] = "[t_lost_arphant:juggo_feed]Here it is";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 1;
		["animation"] = "dl_head_shake";
		["connectID"] = 60;
		["posX"] = 2310;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Not so fast.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 2;
		["connectID"] = 415;
		["posX"] = -540;
		["posY"] = 210;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 2;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 1;
		["posX"] = 630;
		["posY"] = -240;
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
		["text"] = "Hey, huma! What do you want here? Ain't nothing here to steal.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 1;
		["connectID"] = 38;
		["posX"] = 1680;
		["posY"] = 690;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"juggo_feed\")\
end\
\
";
		["text"] = "\\[Give the meat]I've got the meat.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 1;
		["connectID"] = 444;
		["posX"] = 1680;
		["posY"] = 1170;
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
		["text"] = "[t_lost_arphant:juggo_about_molly]So about that striped arphant...";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 2;
		["animation"] = "dl_bow_2";
		["connectID"] = 58;
		["posX"] = 2550;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Praise the ancestors! I don't believe my eyes! Seems like there are some decent humas left out there. Even a stick shoots once a hundred years after all.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 2790;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Listen up: see those settlement ruins? In the furthest house there is a door on the floor, covered with sand. We stashed there some of our haul.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 2;
		["connectID"] = 62;
		["posX"] = 2550;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Don't worry, I'll tell you where you can find our stash.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 1;
		["animation"] = "dl_hands_strike";
		["connectID"] = 68;
		["posX"] = 3030;
		["posY"] = 600;
		["script"] = "";
		["text"] = "You better not bullshit me about that stash of yours.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 2;
		["connectID"] = 65;
		["posX"] = 2790;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Listen up: see those settlement ruins? In the furthest house there is a door on the floor, covered with sand. We stashed there some of our haul.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 2;
		["animation"] = "dl_bow_2";
		["connectID"] = 61;
		["posX"] = 3270;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Praise the ancestors! I don't believe my eyes! Seems like there are some decent humas left out there. Even a stick shoots once a hundred years after all.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00065"] = {
		["ID"] = 65;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 64;
		["posX"] = 3030;
		["posY"] = 750;
		["script"] = "";
		["text"] = "[t_lost_arphant:juggo_feed]Here is the meat.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 2;
		["connectID"] = 69;
		["posX"] = 3270;
		["posY"] = 600;
		["script"] = "";
		["text"] = "We might have been slaves for the last couple of years, but that doesn't mean we won't honor the agreement. May the Sky Hunter keep you safe, huma.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 2;
		["animation"] = "dl_raisedfinger_left";
		["connectID"] = 422;
		["posX"] = 3510;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Let's hope this antigravium won't be the cause of your demise.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00073"] = {
		["ID"] = 73;
		["actor"] = 2;
		["animation"] = "dl_hands_strike";
		["connectID"] = 84;
		["posX"] = 2070;
		["posY"] = 1050;
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
	["message_00075"] = {
		["ID"] = 75;
		["actor"] = 1;
		["connectID"] = 76;
		["posX"] = 2160;
		["posY"] = 2700;
		["script"] = "";
		["text"] = "Why do you care what happens to me?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00076"] = {
		["ID"] = 76;
		["actor"] = 2;
		["connectID"] = 83;
		["posX"] = 2400;
		["posY"] = 2700;
		["script"] = "";
		["text"] = "We have plans concerning that arphant, and you startling it isn't helping it one bit.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00078"] = {
		["ID"] = 78;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = 1680;
		["posY"] = 420;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"juggo_wants_meat\")\
end\
\
";
		["text"] = "So you're hungry?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00082"] = {
		["ID"] = 82;
		["actor"] = 2;
		["connectID"] = 11;
		["posX"] = 4650;
		["posY"] = 2190;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 2;
		["connectID"] = 82;
		["posX"] = 2640;
		["posY"] = 2700;
		["script"] = "";
		["text"] = "[t_lost_arphant:juggo_start]The stomping part isn't a lie too, so keep your distance, for your own sake.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00085"] = {
		["ID"] = 85;
		["actor"] = 1;
		["connectID"] = 87;
		["posX"] = 2940;
		["posY"] = 1020;
		["script"] = "function message:onStart()\
   self:setParam(\"SaidKnowsOwner\", true)\
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
		["text"] = "[t_lost_arphant:juggo_i_know_owner]Actually... I know the owner.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00087"] = {
		["ID"] = 87;
		["actor"] = 2;
		["animation"] = "dl_shrug_long";
		["connectID"] = 89;
		["posX"] = 3180;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "So what? I don't see nobody here. Seems that he doesn't care much about that property of his. Which means finders keepers.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00090"] = {
		["ID"] = 90;
		["actor"] = 1;
		["connectID"] = 91;
		["posX"] = 3570;
		["posY"] = 930;
		["script"] = "";
		["text"] = "I'm helping the owner get the arphant back to him.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 84;
		["posX"] = 3810;
		["posY"] = 930;
		["script"] = "";
		["text"] = "Don't be a fool, huma! The owner is there and we are here! If a certain someone helps us deal with a certain arphant, that certain someone might get his hands on something of value.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00092"] = {
		["ID"] = 92;
		["actor"] = 1;
		["posX"] = 3570;
		["posY"] = 1050;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   goToQuestStepTimer(\"lost_arphant\", \"slave_dig\", 0)\
end\
\
function message:isVisible()\
   local ItemsData = (require \"itemsData\")\
   for k,v in pairs(getMC():getInventory():getItems()) do\
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
		["posX"] = 3570;
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
		["text"] = "What do you want with it?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00094"] = {
		["ID"] = 94;
		["actor"] = 2;
		["connectID"] = 95;
		["posX"] = 3810;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "It's a pack animal which we can ride. We'll pack it with our shit, food and water and cross the desert. No one will follow us to the desert.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00095"] = {
		["ID"] = 95;
		["actor"] = 2;
		["animation"] = "dl_head_tap";
		["connectID"] = 98;
		["posX"] = 4050;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Arphants don't need fuel or roads, and it can find an oasis all on its own. And they can always be sold for good money.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00098"] = {
		["ID"] = 98;
		["actor"] = 1;
		["connectID"] = 101;
		["posX"] = 4290;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "How do you plan to make the arphant do what you want?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00100"] = {
		["ID"] = 100;
		["actor"] = 2;
		["connectID"] = 103;
		["posX"] = 4920;
		["posY"] = 1110;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"SaidKnowsOwner\")\
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
		["animation"] = "dl_shrug_short";
		["connectID"] = 102;
		["posX"] = 4530;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Yeah, it's a problem. But it's solvable, and that's where you can help us.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00103"] = {
		["ID"] = 103;
		["actor"] = 2;
		["connectID"] = 105;
		["posX"] = 5160;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Arphants have poor sight, but they have excellent hearing. The owner should have a whistle with which he can give command the arphant.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00105"] = {
		["ID"] = 105;
		["actor"] = 2;
		["animation"] = "dl_come_here";
		["connectID"] = 106;
		["posX"] = 5400;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "[t_lost_arphant:juggo_wants_arphant]Find the whistle, and we can use it to tame the arphant.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00106"] = {
		["ID"] = 106;
		["actor"] = 1;
		["connectID"] = 107;
		["posX"] = 5640;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Is there any other way? What if I can't get the whistle?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00107"] = {
		["ID"] = 107;
		["actor"] = 2;
		["connectID"] = 108;
		["posX"] = 5880;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Well I'm no arphant professor, but I did hear that the nomads know some sort of plant. If you give it to the arphant it calms them down and makes them receptive to others.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00108"] = {
		["ID"] = 108;
		["actor"] = 2;
		["connectID"] = 109;
		["posX"] = 6120;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "But you must know the exact recipe or it won't work. In which case the arphant...";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00109"] = {
		["ID"] = 109;
		["actor"] = 1;
		["animation"] = "dl_head_2nods";
		["connectID"] = 110;
		["posX"] = 6360;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "...will stomp me to death. Yeah, I got it.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00110"] = {
		["ID"] = 110;
		["actor"] = 2;
		["animation"] = "dl_count_to_one";
		["connectID"] = 111;
		["posX"] = 5400;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "Right. So if you stumble upon a nomad, try getting the recipe out of him. They are known arphant-stealers.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00111"] = {
		["ID"] = 111;
		["actor"] = 1;
		["animation"] = "dl_raisedfinger_right";
		["connectID"] = 112;
		["posX"] = 5640;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "The most important question is: what do I get for helping you?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00112"] = {
		["ID"] = 112;
		["actor"] = 2;
		["animation"] = "dl_shrug_long";
		["connectID"] = 113;
		["posX"] = 5880;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "We've scavenged some sort of a big gun, but it looks like it's broken. You can probably get it fixed for a couple hundred greenies at any workshop.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00113"] = {
		["ID"] = 113;
		["actor"] = 2;
		["connectID"] = 114;
		["posX"] = 6120;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "With that kind of serious weapon who knows what kind of trouble you might avoid. Or start. Your choice.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00114"] = {
		["ID"] = 114;
		["actor"] = 1;
		["connectID"] = 115;
		["posX"] = 6360;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "That arphant is stuck. How do you plan on getting it out?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00116"] = {
		["ID"] = 116;
		["actor"] = 2;
		["animation"] = "dl_stop_onehand";
		["connectID"] = 117;
		["posX"] = 6750;
		["posY"] = 1260;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuestTopicVisible(\"lost_arphant\", \"juggo_still_hungry\")\
end\
\
";
		["text"] = "Not a problem. We can dig a way out. It'll take some time, and after it's done that whistle is going to be really useful, huma!";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00117"] = {
		["ID"] = 117;
		["actor"] = 1;
		["connectID"] = 456;
		["posX"] = 7050;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "I'll see what I can do.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00118"] = {
		["ID"] = 118;
		["actor"] = 2;
		["animation"] = "dl_head_wipe";
		["connectID"] = 22;
		["posX"] = 6750;
		["posY"] = 1410;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"juggo_wants_meat\")\
end\
\
";
		["text"] = "We could dig a way out but we're way too hungry and weak.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00121"] = {
		["ID"] = 121;
		["actor"] = 1;
		["connectID"] = 122;
		["posX"] = 2940;
		["posY"] = 1950;
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
		["text"] = "[t_lost_arphant:juggo_tell_whistle_gone]Actually, I've already given the whistle to its rightful owner.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00122"] = {
		["ID"] = 122;
		["actor"] = 2;
		["animation"] = "dl_hand_facepalm";
		["connectID"] = 431;
		["posX"] = 3180;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "What?! You had it and gave it away?! Curse you huma!";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00123"] = {
		["ID"] = 123;
		["actor"] = 1;
		["animation"] = "dl_head_tap";
		["connectID"] = 129;
		["posX"] = 2940;
		["posY"] = 1680;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"juggo_have_weed\")\
end\
\
";
		["text"] = "I've got something better than a whistle... Arphant's weed! If you feed it to the arphant, it'll do whatever you need for a week.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00125"] = {
		["ID"] = 125;
		["actor"] = 2;
		["animation"] = "dl_head_scratch";
		["connectID"] = 126;
		["posX"] = 450;
		["posY"] = 1350;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"juggo_blows_whistle\")\
end\
\
";
		["text"] = "Let's give this whistle a try!";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00126"] = {
		["ID"] = 126;
		["actor"] = 2;
		["animation"] = "dl_cough";
		["connectID"] = 127;
		["posX"] = 690;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "[t_lost_arphant:juggo_blows_whistle]*blows the whistle*";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00127"] = {
		["ID"] = 127;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 128;
		["posX"] = 930;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "Looks like the arphant is obeying.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00128"] = {
		["ID"] = 128;
		["actor"] = 2;
		["animation"] = "dl_hands_strike";
		["posX"] = 1110;
		["posY"] = 1140;
		["script"] = "";
		["text"] = "[t_lost_arphant:juggo_reward]Fuck yeah! Here's your reward, huma! See you on the other side of the White Erg!";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00129"] = {
		["ID"] = 129;
		["actor"] = 2;
		["animation"] = "dl_stop_twohand";
		["connectID"] = 473;
		["posX"] = 3180;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "Nah, you go feed it, you look like you know what you're doing.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00130"] = {
		["ID"] = 130;
		["actor"] = 2;
		["animation"] = "dl_frustration";
		["connectID"] = 132;
		["posX"] = 450;
		["posY"] = 900;
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
		["animation"] = "dl_chuckle";
		["connectID"] = 135;
		["posX"] = 450;
		["posY"] = 1200;
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
		["animation"] = "dl_shrug_long";
		["connectID"] = 133;
		["posX"] = 690;
		["posY"] = 900;
		["script"] = "";
		["text"] = "Either the nomad screwed me over or the weed is of a bad quality! Damn, it nearly got me!";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00133"] = {
		["ID"] = 133;
		["actor"] = 2;
		["animation"] = "dl_clench_fist";
		["connectID"] = 134;
		["posX"] = 930;
		["posY"] = 900;
		["script"] = "";
		["text"] = "May a crucass chew off your junk huma! That arphant was our sure way to new life! And you fucked it all up!";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00134"] = {
		["ID"] = 134;
		["actor"] = 2;
		["animation"] = "dl_hands_strike";
		["posX"] = 1170;
		["posY"] = 900;
		["script"] = "";
		["text"] = "*curses in aboriginal*";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00135"] = {
		["ID"] = 135;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 128;
		["posX"] = 690;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Here's your obedient arphant, just as agreed.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00408"] = {
		["ID"] = 408;
		["actor"] = 2;
		["animation"] = "dl_stop_onehand";
		["connectID"] = 410;
		["posX"] = 3900;
		["posY"] = 510;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"juggo_start\")\
end\
\
";
		["text"] = "One more thing, huma. See that arphant over there? Don't get near it, you'll startle it and it'll stomp you to death.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00410"] = {
		["ID"] = 410;
		["actor"] = 2;
		["connectID"] = 83;
		["posX"] = 4140;
		["posY"] = 510;
		["script"] = "";
		["text"] = "You did give us food when we needed it, but we have plans concerning that arphant, and you startling it won't help us one bit.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00411"] = {
		["ID"] = 411;
		["actor"] = 1;
		["connectID"] = 416;
		["posX"] = -120;
		["posY"] = 30;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00414"] = {
		["ID"] = 414;
		["actor"] = 1;
		["connectID"] = 424;
		["posX"] = -120;
		["posY"] = 360;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00417"] = {
		["ID"] = 417;
		["actor"] = 1;
		["posX"] = 270;
		["posY"] = -90;
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
		["posX"] = 270;
		["posY"] = 30;
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
		["posX"] = 270;
		["posY"] = 150;
		["script"] = "";
		["text"] = "end";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00420"] = {
		["ID"] = 420;
		["actor"] = 1;
		["connectID"] = 448;
		["posX"] = 2940;
		["posY"] = 1410;
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
		["text"] = "\\[Give whistle]I found the whistle.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00421"] = {
		["ID"] = 421;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 456;
		["posX"] = 3330;
		["posY"] = 2100;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"juggo_still_hungry\")\
end\
\
";
		["text"] = "I told you, we can't dig him out until we've had something to eat.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00423"] = {
		["ID"] = 423;
		["actor"] = 2;
		["posX"] = 4080;
		["posY"] = 2220;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   --This will start the digging after the message is played\
   getQuest(\"lost_arphant\"):goToStep(\"slave_dig\")\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Alright, it's time to dig out that arphant!";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00425"] = {
		["ID"] = 425;
		["actor"] = 2;
		["animation"] = "dl_hand_negative";
		["posX"] = 450;
		["posY"] = 750;
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
		["animation"] = "dl_head_shake";
		["connectID"] = 445;
		["posX"] = 2070;
		["posY"] = 1260;
		["script"] = "";
		["text"] = "I could really use some good news huma.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00430"] = {
		["ID"] = 430;
		["actor"] = 1;
		["connectID"] = 82;
		["posX"] = 2940;
		["posY"] = 2400;
		["script"] = "";
		["text"] = "\\[BACK]Nevermind.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00431"] = {
		["ID"] = 431;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 456;
		["posX"] = 3420;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "Now our only hope is the mythical arphant weed.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00433"] = {
		["ID"] = 433;
		["actor"] = 1;
		["animation"] = "dl_hand_negative";
		["connectID"] = 434;
		["posX"] = 1020;
		["posY"] = -480;
		["script"] = "";
		["text"] = "I don't steal things.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00434"] = {
		["ID"] = 434;
		["actor"] = 2;
		["animation"] = "dl_shrug_short";
		["connectID"] = 6;
		["posX"] = 1260;
		["posY"] = -480;
		["script"] = "";
		["text"] = "Is that so? How do I know you're telling the truth?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00436"] = {
		["ID"] = 436;
		["actor"] = 2;
		["connectID"] = 11;
		["posX"] = 510;
		["posY"] = 450;
		["script"] = "";
		["text"] = "[Main hub]";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00438"] = {
		["ID"] = 438;
		["actor"] = 1;
		["connectID"] = 439;
		["posX"] = 2940;
		["posY"] = 2280;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"juggo_go_dig\")\
end\
\
";
		["text"] = "You can start digging guys.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00442"] = {
		["ID"] = 442;
		["actor"] = 2;
		["animation"] = "dl_head_wipe";
		["connectID"] = 117;
		["posX"] = 6750;
		["posY"] = 1560;
		["script"] = "";
		["text"] = "We could dig a way out but we're way too hungry and weak.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00443"] = {
		["ID"] = 443;
		["actor"] = 2;
		["connectID"] = 37;
		["posX"] = 3900;
		["posY"] = 780;
		["script"] = "";
		["text"] = "[TO MAIN HUB]";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00446"] = {
		["ID"] = 446;
		["actor"] = 2;
		["animation"] = "dl_hands_strike";
		["connectID"] = 84;
		["posX"] = 2460;
		["posY"] = 1200;
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
		["text"] = "[t_lost_arphant:juggo_whistle_gone]Especially after you gave away the whistle!";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00447"] = {
		["ID"] = 447;
		["actor"] = 2;
		["connectID"] = 84;
		["posX"] = 2460;
		["posY"] = 1320;
		["script"] = "";
		["text"] = "[SKIP TO QUEST HUB]";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00448"] = {
		["ID"] = 448;
		["actor"] = 2;
		["connectID"] = 450;
		["posX"] = 3180;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "Really? That's hella good news, huma.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00450"] = {
		["ID"] = 450;
		["actor"] = 2;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 451;
		["posX"] = 3420;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "[t_lost_arphant:juggo_give_whistle]Here... Have some ammo for for saving our asses.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00452"] = {
		["ID"] = 452;
		["actor"] = 2;
		["connectID"] = 125;
		["posX"] = 3810;
		["posY"] = 1290;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"juggo_blows_whistle\")\
end\
\
";
		["text"] = "[JUMP TO WHISTLE BLOWING]";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00454"] = {
		["ID"] = 454;
		["actor"] = 2;
		["connectID"] = 456;
		["posX"] = 3810;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "[TO QUEST HUB]";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00455"] = {
		["ID"] = 455;
		["actor"] = 2;
		["connectID"] = 423;
		["posX"] = 3810;
		["posY"] = 1410;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuestTopicVisible(\"lost_arphant\", \"juggo_still_hungry\")\
end\
\
";
		["text"] = "[JUMP TO DIGGING]";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00456"] = {
		["ID"] = 456;
		["actor"] = 2;
		["connectID"] = 84;
		["posX"] = 4740;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00457"] = {
		["ID"] = 457;
		["actor"] = 1;
		["connectID"] = 460;
		["posX"] = 1680;
		["posY"] = 2580;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"juggo_what_now\")\
end\
\
";
		["text"] = "So what now?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00459"] = {
		["ID"] = 459;
		["actor"] = 2;
		["animation"] = "dl_hands_strike";
		["connectID"] = 461;
		["posX"] = 450;
		["posY"] = 1050;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"juggo_angry\")\
end\
\
";
		["text"] = "You... You single handedly ruined our chances to get out of here...";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00460"] = {
		["ID"] = 460;
		["actor"] = 2;
		["connectID"] = 82;
		["posX"] = 1920;
		["posY"] = 2580;
		["script"] = "";
		["text"] = "Well, we have a ticket out of here, thanks to you. We have to cross a desert and it will be a hell of a tough journey...";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00461"] = {
		["ID"] = 461;
		["actor"] = 2;
		["animation"] = "dl_cut_throat";
		["posX"] = 690;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "Watch... Your... Back...";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00465"] = {
		["ID"] = 465;
		["actor"] = 2;
		["connectID"] = 423;
		["posX"] = 3900;
		["posY"] = 660;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"juggo_go_dig\")\
          and getQuestParam(\"lost_arphant\", \"JuggoHasWhistle\")\
end\
\
";
		["text"] = "[JUMP TO DIGGING]";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00468"] = {
		["ID"] = 468;
		["actor"] = 2;
		["connectID"] = 469;
		["posX"] = 3330;
		["posY"] = 2250;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuestParam(\"lost_arphant\", \"JuggoHasWhistle\")\
end\
\
";
		["text"] = "Well, if you promise to find us a way to make the beast obey...";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00469"] = {
		["ID"] = 469;
		["actor"] = 1;
		["animation"] = "dl_head_nod";
		["connectID"] = 423;
		["posX"] = 3570;
		["posY"] = 2250;
		["script"] = "";
		["text"] = "Yes, I will.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00472"] = {
		["ID"] = 472;
		["actor"] = 2;
		["animation"] = "dl_raisedfinger_left";
		["connectID"] = 456;
		["posX"] = 3540;
		["posY"] = 1620;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"lost_arphant\", \"juggo_go_dig\")\
end\
\
";
		["text"] = "After we dig it out.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00474"] = {
		["ID"] = 474;
		["actor"] = 2;
		["connectID"] = 456;
		["posX"] = 3540;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "[TO QUEST HUB]";
		["time"] = 0;
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
		["h"] = 120;
		["posX"] = 870;
		["posY"] = -240;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00011"] = {
		["ID"] = 11;
		["connectionsID"] = {
			[1] = 12;
			[2] = 14;
			[3] = 78;
			[4] = 50;
			[5] = 51;
			[6] = 457;
			[7] = 15;
		};
		["h"] = 180;
		["posX"] = 1500;
		["posY"] = 420;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00030"] = {
		["ID"] = 30;
		["connectionsID"] = {
			[1] = 31;
			[2] = 50;
		};
		["posX"] = 2880;
		["posY"] = 420;
		["type"] = "switch";
	};
	["switch_00039"] = {
		["ID"] = 39;
		["connectionsID"] = {
			[1] = 40;
			[2] = 41;
		};
		["posX"] = 2160;
		["posY"] = 690;
		["type"] = "switch";
	};
	["switch_00084"] = {
		["ID"] = 84;
		["connectionsID"] = {
			[1] = 85;
			[2] = 93;
			[3] = 420;
			[4] = 123;
			[5] = 121;
			[6] = 438;
			[7] = 430;
		};
		["h"] = 180;
		["posX"] = 2790;
		["posY"] = 1110;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00089"] = {
		["ID"] = 89;
		["connectionsID"] = {
			[1] = 90;
			[2] = 92;
			[3] = 93;
		};
		["posX"] = 3420;
		["posY"] = 1020;
		["type"] = "switch";
	};
	["switch_00102"] = {
		["ID"] = 102;
		["connectionsID"] = {
			[1] = 100;
			[2] = 103;
		};
		["posX"] = 4770;
		["posY"] = 1170;
		["type"] = "switch";
	};
	["switch_00115"] = {
		["ID"] = 115;
		["connectionsID"] = {
			[1] = 116;
			[2] = 118;
			[3] = 442;
		};
		["posX"] = 6600;
		["posY"] = 1410;
		["type"] = "switch";
	};
	["switch_00415"] = {
		["ID"] = 415;
		["connectionsID"] = {
			[1] = 411;
			[2] = 414;
		};
		["posX"] = -270;
		["posY"] = 210;
		["type"] = "switch";
	};
	["switch_00416"] = {
		["ID"] = 416;
		["connectionsID"] = {
			[1] = 417;
			[2] = 418;
			[3] = 419;
		};
		["posX"] = 120;
		["posY"] = 30;
		["type"] = "switch";
	};
	["switch_00422"] = {
		["ID"] = 422;
		["connectionsID"] = {
			[1] = 408;
			[2] = 465;
			[3] = 443;
		};
		["posX"] = 3750;
		["posY"] = 600;
		["type"] = "switch";
	};
	["switch_00424"] = {
		["ID"] = 424;
		["connectionsID"] = {
			[1] = 45;
			[2] = 425;
			[3] = 130;
			[4] = 459;
			[5] = 131;
			[6] = 125;
			[7] = 436;
		};
		["h"] = 180;
		["posX"] = 300;
		["posY"] = 330;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00439"] = {
		["ID"] = 439;
		["connectionsID"] = {
			[1] = 421;
			[2] = 468;
			[3] = 423;
		};
		["posX"] = 3180;
		["posY"] = 2280;
		["type"] = "switch";
	};
	["switch_00444"] = {
		["ID"] = 444;
		["connectionsID"] = {
			[1] = 73;
			[2] = 427;
		};
		["posX"] = 1920;
		["posY"] = 1170;
		["type"] = "switch";
	};
	["switch_00445"] = {
		["ID"] = 445;
		["connectionsID"] = {
			[1] = 446;
			[2] = 447;
		};
		["posX"] = 2310;
		["posY"] = 1260;
		["type"] = "switch";
	};
	["switch_00451"] = {
		["ID"] = 451;
		["connectionsID"] = {
			[1] = 452;
			[2] = 455;
			[3] = 454;
		};
		["posX"] = 3660;
		["posY"] = 1410;
		["type"] = "switch";
	};
	["switch_00473"] = {
		["ID"] = 473;
		["connectionsID"] = {
			[1] = 472;
			[2] = 474;
		};
		["posX"] = 3420;
		["posY"] = 1680;
		["type"] = "switch";
	};
}
local obj2 = {
	["actor_prefab"] = {
		[1] = "human_male";
		[2] = "abori";
	};
}
return obj1 ,obj2
