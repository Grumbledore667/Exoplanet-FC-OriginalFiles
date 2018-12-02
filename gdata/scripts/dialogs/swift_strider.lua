-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 2490;
		["posY"] = -1560;
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
		["text"] = "Hey you, huma... over here... You're not one of them... *coughs* Water...";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 1;
		["connectID"] = 115;
		["posX"] = 2730;
		["posY"] = -1560;
		["script"] = "";
		["text"] = "What the hell happened here?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 127;
		["posX"] = 3360;
		["posY"] = -1530;
		["script"] = "function message:onStart()\
   self:setDialogParam(\"gave_water\", true)\
   giveItemFromPlayerTo(\"pure_water_bottle.itm\", getObj(\"swift_strider\"))\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return hasPlayerItem(\"pure_water_bottle.itm\")\
end\
\
";
		["text"] = "Here, careful, drink slowly.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 5;
		["posX"] = 3360;
		["posY"] = -1410;
		["script"] = "function message:onStart()\
   self:setDialogParam(\"gave_water\", false)\
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
		["text"] = "Sorry, but I could use some water myself.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 2;
		["posX"] = 3600;
		["posY"] = -1410;
		["script"] = "";
		["text"] = "*coughs*";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = 7560;
		["posY"] = -2370;
		["script"] = "";
		["text"] = "Last time I heard this phrase I accepted a job that put me on this dusty shithole of a planet. So what's the catch?";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 229;
		["posX"] = 7800;
		["posY"] = -2370;
		["script"] = "";
		["text"] = "No catch. Just deliver the message. Five hundred shinies for a quick run to the town. I would do it myself, but I have sore feet.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["connectID"] = 254;
		["posX"] = 8520;
		["posY"] = -2370;
		["script"] = "";
		["text"] = "The message is: \"Redeye is back and gathers his old gang. Swift Strider saw Scar and Burnskin together.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["connectID"] = 26;
		["posX"] = 7110;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "I have a couple of questions.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 1;
		["connectID"] = 33;
		["posX"] = 7560;
		["posY"] = 1650;
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
		["text"] = "[HIDDEN]Who are that Red-eye, Scar and the other one you're talking about?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["connectID"] = 37;
		["posX"] = 7560;
		["posY"] = 1770;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuest(\"ktharsis_harsh\"):getTopicVisible(\"strider_safety\")\
end\
\
";
		["text"] = "So there's a fort nearby. How do I get there?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["connectID"] = 32;
		["posX"] = 7560;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "How did you manage to survive the attack?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["connectID"] = 34;
		["posX"] = 7800;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "I got lucky. Sort of. The head arphant partially shielded me from explosion. I came to when the bandits were finishing off the injured and tying up the prisoners. Saw Burnskin and heard how someone calls for Scar and passed out.";
		["time"] = 21;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 7800;
		["posY"] = 1650;
		["script"] = "";
		["text"] = "Redeye's number one wanted motherfucker in this hellhole, Scar and Burnskin are a sweet couple of his sidekicks. The guys who will skin you alive and make you watch how they prance about in your blood dripping hide.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["connectID"] = 64;
		["posX"] = 8040;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "Apparently they took me for dead... or left me here to die in this heat on purpose. It's meaningless to enslave such a cripple, and can't expect to torture it for long.";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 2;
		["connectID"] = 64;
		["posX"] = 8040;
		["posY"] = 1650;
		["script"] = "";
		["text"] = "I'm actually glad that it turned out this way. Dying here is a mild inconvenience, compared to what they do with their prisoners.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 2;
		["connectID"] = 64;
		["posX"] = 7800;
		["posY"] = 1770;
		["script"] = "";
		["text"] = "The road, huma, the road. And stay away from the bushes, they shelter so much wildlife that one wonders whether the local hunters even exist.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 2;
		["connectID"] = 155;
		["posX"] = 8250;
		["posY"] = -1830;
		["script"] = "";
		["text"] = "No doc would lift a finger to help me. They might even throw me in the bitebug hive for fun.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 2;
		["connectID"] = 130;
		["posX"] = 7770;
		["posY"] = -1830;
		["script"] = "";
		["text"] = "Now that would be a sight to see - legless Swift Strider enters New Hope riding a sweaty huma. No thanks! This kind of disgrace I won't survive.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 2;
		["posX"] = 7350;
		["posY"] = 2100;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"ktharsis_harsh\"):getTopicVisible(\"strider_what_again\")\
end\
\
";
		["text"] = "Watch your step, huma. And now scram! Our little chit-chat got me tired. Swift Strider would like to get some rest before crucasses start eating him alive.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 8820;
		["posY"] = 1560;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00065"] = {
		["ID"] = 65;
		["actor"] = 2;
		["connectID"] = 66;
		["posX"] = 2160;
		["posY"] = 480;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 2;
		["connectID"] = 69;
		["posX"] = 2610;
		["posY"] = 600;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuest(\"ktharsis_harsh\"):getTopicVisible(\"strider_safety\")\
end\
\
";
		["text"] = "You again huma...";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 2;
		["connectID"] = 82;
		["posX"] = 5130;
		["posY"] = 630;
		["script"] = "";
		["text"] = "You here to talk me to death?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00072"] = {
		["ID"] = 72;
		["actor"] = 1;
		["connectID"] = 44;
		["posX"] = 7530;
		["posY"] = -1830;
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
		["text"] = "[t_ktharsis_harsh:strider_what_to_do]What am I supposed to do with you now? I ain't carrying you to the city.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00074"] = {
		["ID"] = 74;
		["actor"] = 2;
		["connectID"] = 284;
		["posX"] = 8730;
		["posY"] = -1830;
		["script"] = "";
		["text"] = "Besides, you don't look like you've got a bandage on you anyway.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00075"] = {
		["ID"] = 75;
		["actor"] = 1;
		["connectID"] = 76;
		["posX"] = 9150;
		["posY"] = -1890;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"ktharsis_harsh\",\"strider_bandage_shirt\")\
end\
\
";
		["text"] = "I have my shirt.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00076"] = {
		["ID"] = 76;
		["actor"] = 2;
		["connectID"] = 77;
		["posX"] = 9390;
		["posY"] = -1890;
		["script"] = "";
		["text"] = "*laughs and coughs* Damn, you're one hell of a stupid huma. Your shirt looks like it served as a personal asswipe of the Devil himself for a month at least. You're only gonna make it worse.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00077"] = {
		["ID"] = 77;
		["actor"] = 1;
		["connectID"] = 265;
		["posX"] = 9630;
		["posY"] = -1890;
		["script"] = "";
		["text"] = "Aren't you a joker. It's still better than bleeding out. I'm no xenobiologist, but at this rate I wouldn't give you more than half a day.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00080"] = {
		["ID"] = 80;
		["actor"] = 1;
		["connectID"] = 81;
		["posX"] = 7530;
		["posY"] = -1530;
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
		["text"] = "[t_ktharsis_harsh:strider_bandage_shirt]\\[Apply shirt as bandage]Now shut up and try to stay still.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00081"] = {
		["ID"] = 81;
		["actor"] = 2;
		["connectID"] = 83;
		["posX"] = 7800;
		["posY"] = -1530;
		["script"] = "";
		["text"] = "*screams in pain*";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 1;
		["connectID"] = 265;
		["posX"] = 8040;
		["posY"] = -1530;
		["script"] = "";
		["text"] = "Much better! Or not... Now what?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00084"] = {
		["ID"] = 84;
		["actor"] = 2;
		["connectID"] = 89;
		["posX"] = 7770;
		["posY"] = -1230;
		["script"] = "";
		["text"] = "Have any water left? My throat is parched. Or maybe a melon?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00085"] = {
		["ID"] = 85;
		["actor"] = 1;
		["connectID"] = 88;
		["posX"] = 8160;
		["posY"] = -1350;
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
		["text"] = "[t_ktharsis_harsh:strider_give_water]\\[Give water]Here.";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00087"] = {
		["ID"] = 87;
		["actor"] = 1;
		["connectID"] = 257;
		["posX"] = 8160;
		["posY"] = -1110;
		["script"] = "";
		["text"] = "You drank all I had already.";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00088"] = {
		["ID"] = 88;
		["actor"] = 2;
		["connectID"] = 265;
		["posX"] = 8400;
		["posY"] = -1350;
		["script"] = "";
		["text"] = "*gulps* Phew. Thanks.";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00090"] = {
		["ID"] = 90;
		["actor"] = 1;
		["connectID"] = 91;
		["posX"] = 8160;
		["posY"] = -1230;
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
		["text"] = "[t_ktharsis_harsh:strider_give_melon]\\[Give melon]Here, take this.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 2;
		["connectID"] = 265;
		["posX"] = 8400;
		["posY"] = -1230;
		["script"] = "";
		["text"] = "*chews*.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00093"] = {
		["ID"] = 93;
		["actor"] = 2;
		["connectID"] = 95;
		["posX"] = 8010;
		["posY"] = -900;
		["script"] = "";
		["text"] = "Can you make a campfire? The nights here are cold.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00094"] = {
		["ID"] = 94;
		["actor"] = 2;
		["connectID"] = 93;
		["posX"] = 7770;
		["posY"] = -990;
		["script"] = "";
		["text"] = "And I still think this is pointless. But be it your way, I'm tired of arguing with you.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00095"] = {
		["ID"] = 95;
		["actor"] = 1;
		["posX"] = 8250;
		["posY"] = -900;
		["script"] = "";
		["text"] = "Let's see...";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00096"] = {
		["ID"] = 96;
		["actor"] = 1;
		["connectID"] = 84;
		["posX"] = 7530;
		["posY"] = -1230;
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
		["text"] = "[t_ktharsis_harsh:strider_hydrate]Now what?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00100"] = {
		["ID"] = 100;
		["actor"] = 1;
		["connectID"] = 94;
		["posX"] = 7530;
		["posY"] = -990;
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
		["text"] = "[t_ktharsis_harsh:strider_make_fireplace]I still don't think I should leave you here like that.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00101"] = {
		["ID"] = 101;
		["actor"] = 1;
		["connectID"] = 102;
		["posX"] = 7530;
		["posY"] = -840;
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
		["text"] = "[t_ktharsis_harsh:strider_what_again]What did you want me to do again?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00102"] = {
		["ID"] = 102;
		["actor"] = 2;
		["connectID"] = 93;
		["posX"] = 7770;
		["posY"] = -840;
		["script"] = "";
		["text"] = "Forgot already?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00103"] = {
		["ID"] = 103;
		["actor"] = 1;
		["connectID"] = 104;
		["posX"] = 7530;
		["posY"] = -630;
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
		["text"] = "[t_ktharsis_harsh:strider_feeling_warmer]Feeling warmer already?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00104"] = {
		["ID"] = 104;
		["actor"] = 2;
		["connectID"] = 105;
		["posX"] = 7770;
		["posY"] = -630;
		["script"] = "";
		["text"] = "*coughs and swears unintelligibly*";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00105"] = {
		["ID"] = 105;
		["actor"] = 2;
		["connectID"] = 106;
		["posX"] = 8010;
		["posY"] = -630;
		["script"] = "";
		["text"] = "That damn smoke is going to finish me off faster than scavengers!";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00106"] = {
		["ID"] = 106;
		["actor"] = 1;
		["connectID"] = 107;
		["posX"] = 8250;
		["posY"] = -630;
		["script"] = "";
		["text"] = "You're a hard man to please.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00107"] = {
		["ID"] = 107;
		["actor"] = 2;
		["connectID"] = 142;
		["posX"] = 8490;
		["posY"] = -630;
		["script"] = "";
		["text"] = "Hey, all I asked you is to put a bullet through my head and get it done with.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00115"] = {
		["ID"] = 115;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = 2970;
		["posY"] = -1470;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not self:getDialogParam(\"gave_water\")\
end\
\
";
		["text"] = "*coughs* Water...";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00122"] = {
		["ID"] = 122;
		["actor"] = 2;
		["connectID"] = 123;
		["posX"] = 7800;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "Name's Swift Strider... Well now you can call me Breakfast For Crucasses... I am... Was this caravan security chief.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00123"] = {
		["ID"] = 123;
		["actor"] = 2;
		["connectID"] = 64;
		["posX"] = 8040;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "Shitty chief actually, as you can see. Didn't smell the ambush at all. You can see the result, and that's enough about this topic for now.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00127"] = {
		["ID"] = 127;
		["actor"] = 2;
		["connectID"] = 214;
		["posX"] = 3600;
		["posY"] = -1530;
		["script"] = "";
		["text"] = "Oh thank you! May the Sky Huntress watch over you huma!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00129"] = {
		["ID"] = 129;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 7320;
		["posY"] = -2370;
		["script"] = "";
		["text"] = "Listen up, huma. Wanna make some easy money?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00130"] = {
		["ID"] = 130;
		["actor"] = 1;
		["connectID"] = 42;
		["posX"] = 8010;
		["posY"] = -1830;
		["script"] = "";
		["text"] = "Maybe there's a doc somewhere here I can call who can patch you up?";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00131"] = {
		["ID"] = 131;
		["actor"] = 1;
		["connectID"] = 300;
		["posX"] = 7560;
		["posY"] = 1890;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00137"] = {
		["ID"] = 137;
		["actor"] = 1;
		["connectID"] = 122;
		["posX"] = 7560;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "Who are you, actually?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00141"] = {
		["ID"] = 141;
		["actor"] = 1;
		["connectID"] = 150;
		["posX"] = 7530;
		["posY"] = -150;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible() and self:hasVisibleChildren()\
end\
\
";
		["text"] = "[t_ktharsis_harsh:strider_optional_food]Here, have something to eat.";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00142"] = {
		["ID"] = 142;
		["actor"] = 2;
		["connectID"] = 143;
		["posX"] = 8730;
		["posY"] = -630;
		["script"] = "";
		["text"] = "But it seems that thanks to your efforts I have a chance now. You have my thanks.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00143"] = {
		["ID"] = 143;
		["actor"] = 1;
		["connectID"] = 144;
		["posX"] = 8970;
		["posY"] = -630;
		["script"] = "";
		["text"] = "How touching. Before I go, need anything else? Also, who can I tell about your whereabouts?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00144"] = {
		["ID"] = 144;
		["actor"] = 2;
		["connectID"] = 266;
		["posX"] = 9210;
		["posY"] = -630;
		["script"] = "";
		["text"] = "Well, I wouldn't be completely against munching on something.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00145"] = {
		["ID"] = 145;
		["actor"] = 2;
		["connectID"] = 146;
		["posX"] = 9630;
		["posY"] = -510;
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
		["text"] = "[HIDDEN]And staying up all night fighting off crucasses with a stick also sounds like a great deal of fun.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00146"] = {
		["ID"] = 146;
		["actor"] = 2;
		["connectID"] = 147;
		["posX"] = 9900;
		["posY"] = -630;
		["script"] = "";
		["text"] = "And if you find a blue-leaved plant somewhere around here I would like to have it. It's a decent anaesthetic.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00147"] = {
		["ID"] = 147;
		["actor"] = 1;
		["connectID"] = 148;
		["posX"] = 10140;
		["posY"] = -630;
		["script"] = "";
		["text"] = "You forgot something.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00148"] = {
		["ID"] = 148;
		["actor"] = 2;
		["connectID"] = 257;
		["posX"] = 10380;
		["posY"] = -630;
		["script"] = "";
		["text"] = "[t_ktharsis_harsh:strider_tell_someone]Right. Try the fort. See you on the flipside, huma.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00151"] = {
		["ID"] = 151;
		["actor"] = 1;
		["connectID"] = 153;
		["posX"] = 7950;
		["posY"] = -210;
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
		["text"] = "[t_ktharsis_harsh:strider_give_bug]\\[Give fried bitebug]";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00152"] = {
		["ID"] = 152;
		["actor"] = 1;
		["connectID"] = 153;
		["posX"] = 7950;
		["posY"] = -90;
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
		["text"] = "[t_ktharsis_harsh:strider_give_meat]\\[Give fried meat]";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00153"] = {
		["ID"] = 153;
		["actor"] = 2;
		["connectID"] = 304;
		["posX"] = 8220;
		["posY"] = -150;
		["script"] = "";
		["text"] = "I guess that'll do. Just prolonging the inevitable anyway. Thanks.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00154"] = {
		["ID"] = 154;
		["actor"] = 1;
		["connectID"] = 57;
		["posX"] = 7110;
		["posY"] = 2100;
		["script"] = "";
		["text"] = "Time to go.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00155"] = {
		["ID"] = 155;
		["actor"] = 2;
		["connectID"] = 74;
		["posX"] = 8490;
		["posY"] = -1830;
		["script"] = "";
		["text"] = "This is K'Tharsis, huma. Get it?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00157"] = {
		["ID"] = 157;
		["actor"] = 2;
		["connectID"] = 165;
		["posX"] = 5190;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "It's a family relic for us. Otherwise it's just a rusty piece of junk, that isn't even worth the iron it's made of. What's an old dull axe to you, huma?";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00162"] = {
		["ID"] = 162;
		["actor"] = 1;
		["connectID"] = 163;
		["posX"] = 4320;
		["posY"] = -1080;
		["script"] = "";
		["text"] = "What do you want?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00163"] = {
		["ID"] = 163;
		["actor"] = 2;
		["connectID"] = 160;
		["posX"] = 4560;
		["posY"] = -1080;
		["script"] = "";
		["text"] = "The last raider I saw leaving was carrying my hatchet in his back. He couldn't have gotten far. If you give it to my brother Carry the Stone in the town, he should reward you.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00165"] = {
		["ID"] = 165;
		["actor"] = 1;
		["connectID"] = 166;
		["posX"] = 4950;
		["posY"] = -1140;
		["script"] = "";
		["text"] = "[t_family_relic:start]How can I find your brother?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00166"] = {
		["ID"] = 166;
		["actor"] = 2;
		["connectID"] = 208;
		["posX"] = 5190;
		["posY"] = -1140;
		["script"] = "";
		["text"] = "He works for a local freak that lives in an old terraforming tower. If not there, then he hangs out in the saloon, wasting all his earnings on hookers and booze.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00168"] = {
		["ID"] = 168;
		["actor"] = 1;
		["connectID"] = 169;
		["posX"] = 5580;
		["posY"] = -1080;
		["script"] = "";
		["text"] = "Fine, I'll look for your hatchet, but I don't promise anything.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00169"] = {
		["ID"] = 169;
		["actor"] = 2;
		["connectID"] = 82;
		["posX"] = 5820;
		["posY"] = -1080;
		["script"] = "";
		["text"] = "Couldn't ask for more. May the Sky Huntress give your eyes sharpness in this search.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00186"] = {
		["ID"] = 186;
		["actor"] = 2;
		["connectID"] = 162;
		["posX"] = 4080;
		["posY"] = -1080;
		["script"] = "";
		["text"] = "One more thing huma, I could really use your help. It won't take a minute.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00188"] = {
		["ID"] = 188;
		["actor"] = 1;
		["connectID"] = 157;
		["posX"] = 4950;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "I could just keep it to myself.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00190"] = {
		["ID"] = 190;
		["actor"] = 1;
		["connectID"] = 191;
		["posX"] = 7530;
		["posY"] = 240;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible() and self:hasVisibleChildren()\
end\
\
";
		["text"] = "[t_ktharsis_harsh:strider_optional_weed]Is that the right plant?";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00192"] = {
		["ID"] = 192;
		["actor"] = 1;
		["connectID"] = 196;
		["posX"] = 7950;
		["posY"] = 210;
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
		["text"] = "[t_ktharsis_harsh:strider_give_leaf]\\[Give bluethorn leaf]";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00194"] = {
		["ID"] = 194;
		["actor"] = 1;
		["connectID"] = 197;
		["posX"] = 7950;
		["posY"] = 450;
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
		["text"] = "[t_ktharsis_harsh:strider_give_aloe]\\[Give ktharsian aloe]";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00195"] = {
		["ID"] = 195;
		["actor"] = 1;
		["connectID"] = 304;
		["posX"] = 7950;
		["posY"] = 30;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00196"] = {
		["ID"] = 196;
		["actor"] = 2;
		["connectID"] = 304;
		["posX"] = 8220;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Finally! You have my thanks.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00197"] = {
		["ID"] = 197;
		["actor"] = 2;
		["connectID"] = 191;
		["posX"] = 8220;
		["posY"] = 360;
		["script"] = "";
		["text"] = "It's not. I told you, the plant has blue leaves.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00200"] = {
		["ID"] = 200;
		["actor"] = 1;
		["connectID"] = 197;
		["posX"] = 7950;
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
		["text"] = "[t_ktharsis_harsh:strider_give_root]\\[Give blood root]";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00209"] = {
		["ID"] = 209;
		["actor"] = 1;
		["connectID"] = 210;
		["posX"] = 5580;
		["posY"] = -1200;
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
		["text"] = "[t_family_relic:strider_show_hatchet]Is that your hatchet?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00210"] = {
		["ID"] = 210;
		["actor"] = 2;
		["connectID"] = 82;
		["posX"] = 5820;
		["posY"] = -1200;
		["script"] = "";
		["text"] = "Looks like it. Bring it to my brother in the town.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00214"] = {
		["ID"] = 214;
		["actor"] = 1;
		["connectID"] = 215;
		["posX"] = 3840;
		["posY"] = -1530;
		["script"] = "";
		["text"] = "What happened here?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00215"] = {
		["ID"] = 215;
		["actor"] = 2;
		["connectID"] = 216;
		["posX"] = 4080;
		["posY"] = -1530;
		["script"] = "";
		["text"] = "Raiders. They caught us with our pants down. They knew exactly when the caravan is going to be here...";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00216"] = {
		["ID"] = 216;
		["actor"] = 2;
		["connectID"] = 217;
		["posX"] = 4320;
		["posY"] = -1530;
		["script"] = "";
		["text"] = "None of this would have happened if that greedy scumbag Otto would have payed the toll to take the route through the fort.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00217"] = {
		["ID"] = 217;
		["actor"] = 2;
		["connectID"] = 218;
		["posX"] = 4560;
		["posY"] = -1530;
		["script"] = "";
		["text"] = "I figure he's feeding worms now. He was already rotten when he was alive, now when he's dead even scavengers wouldn't touch his corpse.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00218"] = {
		["ID"] = 218;
		["actor"] = 2;
		["connectID"] = 219;
		["posX"] = 4800;
		["posY"] = -1530;
		["script"] = "";
		["text"] = "Especially after the raiders were done with him. Serves him right.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00219"] = {
		["ID"] = 219;
		["actor"] = 2;
		["connectID"] = 221;
		["posX"] = 5040;
		["posY"] = -1530;
		["script"] = "";
		["text"] = "But enough about him. Are you heading for the fort, huma?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00221"] = {
		["ID"] = 221;
		["actor"] = 1;
		["connectID"] = 222;
		["posX"] = 4080;
		["posY"] = -1350;
		["script"] = "";
		["text"] = "Maybe I am. Why?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00222"] = {
		["ID"] = 222;
		["actor"] = 2;
		["connectID"] = 223;
		["posX"] = 4320;
		["posY"] = -1350;
		["script"] = "";
		["text"] = "You know, you don't look like a local, so listen up - if you need to gear up and a safe place to rest, then head straight for the fort.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00223"] = {
		["ID"] = 223;
		["actor"] = 1;
		["connectID"] = 224;
		["posX"] = 4560;
		["posY"] = -1350;
		["script"] = "";
		["text"] = "I'll be damned...";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00224"] = {
		["ID"] = 224;
		["actor"] = 2;
		["connectID"] = 225;
		["posX"] = 4800;
		["posY"] = -1350;
		["script"] = "";
		["text"] = "What's the matter huma?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00225"] = {
		["ID"] = 225;
		["actor"] = 1;
		["connectID"] = 226;
		["posX"] = 5040;
		["posY"] = -1350;
		["script"] = "";
		["text"] = "You look like a roadkill. You should be unconsious from all the blood loss, and yet you even give advice for a wandering 'huma'. That's a good one.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00226"] = {
		["ID"] = 226;
		["actor"] = 2;
		["connectID"] = 186;
		["posX"] = 5280;
		["posY"] = -1350;
		["script"] = "";
		["text"] = "[t_ktharsis_harsh:start]Unlike you humas, we are sturdy creatures. I'd say I have at least a day and a half worth of juice left in me. Probably. *coughs*";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00227"] = {
		["ID"] = 227;
		["actor"] = 1;
		["connectID"] = 129;
		["posX"] = 7080;
		["posY"] = -2370;
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
		["text"] = "[HIDDEN]What was that about the fort?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00229"] = {
		["ID"] = 229;
		["actor"] = 2;
		["connectID"] = 230;
		["posX"] = 8040;
		["posY"] = -2370;
		["script"] = "";
		["text"] = "First, you'd better know you're talking to the right people before you say anything about this.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00230"] = {
		["ID"] = 230;
		["actor"] = 2;
		["connectID"] = 21;
		["posX"] = 8280;
		["posY"] = -2370;
		["script"] = "";
		["text"] = "In this case the right people are Castor in the fort, Vasquez the old bounty hunter and sheriff Bronson in the New Hope town.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00231"] = {
		["ID"] = 231;
		["actor"] = 2;
		["connectID"] = 232;
		["posX"] = 8910;
		["posY"] = -2310;
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
		["text"] = "[HIDDEN]Sheriff Bronson is then going to pay you five hundred shards. Don't know about the first two though.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00232"] = {
		["ID"] = 232;
		["actor"] = 1;
		["connectID"] = 233;
		["posX"] = 9150;
		["posY"] = -2310;
		["script"] = "";
		["text"] = "Why would he pay me?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00233"] = {
		["ID"] = 233;
		["actor"] = 2;
		["connectID"] = 235;
		["posX"] = 9390;
		["posY"] = -2310;
		["script"] = "";
		["text"] = "He set this price himself for any info about the Redeye band. I heard it's personal.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00235"] = {
		["ID"] = 235;
		["actor"] = 2;
		["connectID"] = 236;
		["posX"] = 9630;
		["posY"] = -2310;
		["script"] = "";
		["text"] = "Now listen up: to Bronson, and only him, you also must add this: \"Fat crucass resides in your town, sheriff. He sold out Otto's caravan\".";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00236"] = {
		["ID"] = 236;
		["actor"] = 1;
		["connectID"] = 237;
		["posX"] = 9900;
		["posY"] = -2430;
		["script"] = "";
		["text"] = "Why are you telling all this to me, a complete stranger?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00237"] = {
		["ID"] = 237;
		["actor"] = 2;
		["connectID"] = 257;
		["posX"] = 10140;
		["posY"] = -2430;
		["script"] = "";
		["text"] = "To increase the chance of these bastards hanging. I'm done for anyway.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00253"] = {
		["ID"] = 253;
		["actor"] = 2;
		["connectID"] = 236;
		["posX"] = 8910;
		["posY"] = -2430;
		["script"] = "";
		["text"] = "On second thought it's highly unlikely that you'll get to New Hope town soon as there is a massive desert storm. So you'll have to settle for captain Castor in the fort for now.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00257"] = {
		["ID"] = 257;
		["actor"] = 2;
		["connectID"] = 82;
		["posX"] = 11550;
		["posY"] = -510;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00262"] = {
		["ID"] = 262;
		["actor"] = 1;
		["connectID"] = 301;
		["posX"] = 7110;
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
		["text"] = "[t_ktharsis_harsh:strider_safety]So how do you feel?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00263"] = {
		["ID"] = 263;
		["actor"] = 1;
		["connectID"] = 256;
		["posX"] = 7050;
		["posY"] = -420;
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
		["text"] = "[t_ktharsis_harsh:strider_saving]Let's talk about saving your ass.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00265"] = {
		["ID"] = 265;
		["actor"] = 2;
		["connectID"] = 256;
		["posX"] = 10410;
		["posY"] = -1290;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00267"] = {
		["ID"] = 267;
		["actor"] = 2;
		["connectID"] = 146;
		["posX"] = 9630;
		["posY"] = -630;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00268"] = {
		["ID"] = 268;
		["actor"] = 1;
		["connectID"] = 269;
		["posX"] = 7530;
		["posY"] = -390;
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
		["text"] = "[t_ktharsis_harsh:help_on_the_way]Looks like you'll pull through. The people from the fort should pick you up any minute now.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00269"] = {
		["ID"] = 269;
		["actor"] = 2;
		["connectID"] = 257;
		["posX"] = 7770;
		["posY"] = -390;
		["script"] = "";
		["text"] = "*silently stares into nothing*";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00270"] = {
		["ID"] = 270;
		["actor"] = 2;
		["connectID"] = 271;
		["posX"] = 2610;
		["posY"] = 390;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isFirstTime() and getQuest(\"ktharsis_harsh\"):getTopicVisible(\"strider_safety\")\
end\
\
";
		["text"] = "What do you want? Came to laugh at legless Swift Strider?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00271"] = {
		["ID"] = 271;
		["actor"] = 2;
		["connectID"] = 82;
		["posX"] = 2880;
		["posY"] = 480;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"ktharsis_harsh\"):getTopicVisible(\"strider_safety\")\
end\
\
";
		["text"] = "Oh, it's you.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00272"] = {
		["ID"] = 272;
		["actor"] = 2;
		["connectID"] = 273;
		["posX"] = 7500;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "How do I feel? I feel like a roadkill. A roadkill with its legs cut off, that hurt so much as if they were still attached and lied in the middle of a fucking campfire. That's how I feel, huma.";
		["time"] = 21;
		["type"] = "message";
	};
	["message_00273"] = {
		["ID"] = 273;
		["actor"] = 2;
		["connectID"] = 274;
		["posX"] = 7740;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "You got some booze? I must ease the pain.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00275"] = {
		["ID"] = 275;
		["actor"] = 1;
		["connectID"] = 279;
		["posX"] = 8130;
		["posY"] = 900;
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
		["text"] = "[t_ktharsis_harsh:strider_give_booze]\\[Give random booze]Sure. Here, take some.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00276"] = {
		["ID"] = 276;
		["actor"] = 1;
		["connectID"] = 278;
		["posX"] = 8130;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "Drinking isn't the answer.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00277"] = {
		["ID"] = 277;
		["actor"] = 1;
		["connectID"] = 300;
		["posX"] = 8130;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "I don't have any.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00278"] = {
		["ID"] = 278;
		["actor"] = 2;
		["connectID"] = 300;
		["posX"] = 8370;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "Get out of my face, huma. You should have just left me there for dead.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00279"] = {
		["ID"] = 279;
		["actor"] = 2;
		["connectID"] = 280;
		["posX"] = 8370;
		["posY"] = 900;
		["script"] = "";
		["text"] = "*gulps*";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00280"] = {
		["ID"] = 280;
		["actor"] = 2;
		["connectID"] = 300;
		["posX"] = 8610;
		["posY"] = 900;
		["script"] = "";
		["text"] = "You know, huma. The stuff I said, I... I didn't mean it.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00281"] = {
		["ID"] = 281;
		["actor"] = 1;
		["connectID"] = 81;
		["posX"] = 7530;
		["posY"] = -1380;
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
		["text"] = "[t_ktharsis_harsh:strider_medkit]\\[Use medkit]Now shut up and try to stay still.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00285"] = {
		["ID"] = 285;
		["actor"] = 1;
		["connectID"] = 286;
		["posX"] = 9150;
		["posY"] = -1770;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"ktharsis_harsh\",\"strider_medkit\")\
end\
\
";
		["text"] = "I actually do have a medkit, mister x-ray vision.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00286"] = {
		["ID"] = 286;
		["actor"] = 2;
		["connectID"] = 288;
		["posX"] = 9390;
		["posY"] = -1770;
		["script"] = "";
		["text"] = "You'll regret wasting it on me.";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00288"] = {
		["ID"] = 288;
		["actor"] = 1;
		["connectID"] = 265;
		["posX"] = 9630;
		["posY"] = -1770;
		["script"] = "";
		["text"] = "I will, if you keep complaining.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00291"] = {
		["ID"] = 291;
		["actor"] = 1;
		["connectID"] = 265;
		["posX"] = 9150;
		["posY"] = -1650;
		["script"] = "";
		["text"] = "[t_ktharsis_harsh:strider_bandage_nothing]Yeah, I don't really have anything of this sort.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00292"] = {
		["ID"] = 292;
		["actor"] = 1;
		["connectID"] = 257;
		["posX"] = 7530;
		["posY"] = 660;
		["script"] = "";
		["text"] = "\\[BACK]I'll figure something out.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00294"] = {
		["ID"] = 294;
		["actor"] = 1;
		["connectID"] = 295;
		["posX"] = 9150;
		["posY"] = -2010;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"ktharsis_harsh\",\"strider_bandage_cloth\")\
end\
\
";
		["text"] = "I have some cloth.";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00295"] = {
		["ID"] = 295;
		["actor"] = 2;
		["connectID"] = 296;
		["posX"] = 9390;
		["posY"] = -2010;
		["script"] = "";
		["text"] = "Who bandages wounds with a dirty rag?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00296"] = {
		["ID"] = 296;
		["actor"] = 1;
		["connectID"] = 265;
		["posX"] = 9630;
		["posY"] = -2010;
		["script"] = "";
		["text"] = "It's still better than bleeding out. I'm no xenobiologist, but at this rate I wouldn't give you more than half a day.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00297"] = {
		["ID"] = 297;
		["actor"] = 1;
		["connectID"] = 81;
		["posX"] = 7530;
		["posY"] = -1680;
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
		["text"] = "[t_ktharsis_harsh:strider_bandage_cloth]\\[Apply 2 Cloth as bandage]Now shut up and try to stay still.";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00300"] = {
		["ID"] = 300;
		["actor"] = 2;
		["connectID"] = 82;
		["posX"] = 9840;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00302"] = {
		["ID"] = 302;
		["actor"] = 2;
		["connectID"] = 300;
		["posX"] = 7740;
		["posY"] = 840;
		["script"] = "";
		["text"] = "Thanks for the drink though... but don't expect any medals for saving crippled aboris around here.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00303"] = {
		["ID"] = 303;
		["actor"] = 2;
		["connectID"] = 302;
		["posX"] = 7500;
		["posY"] = 840;
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
		["text"] = "[t_ktharsis_harsh:strider_drunk]Get lost!";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00304"] = {
		["ID"] = 304;
		["actor"] = 2;
		["connectID"] = 256;
		["posX"] = 8940;
		["posY"] = -60;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["switch_00004"] = {
		["ID"] = 4;
		["connectionsID"] = {
			[1] = 2;
			[2] = 3;
		};
		["posX"] = 3210;
		["posY"] = -1470;
		["type"] = "switch";
	};
	["switch_00026"] = {
		["ID"] = 26;
		["connectionsID"] = {
			[1] = 137;
			[2] = 29;
			[3] = 27;
			[4] = 28;
			[5] = 131;
		};
		["h"] = 140;
		["posX"] = 7380;
		["posY"] = 1650;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00066"] = {
		["ID"] = 66;
		["connectionsID"] = {
			[1] = 0;
			[2] = 115;
			[3] = 270;
			[4] = 271;
			[5] = 68;
		};
		["h"] = 140;
		["posX"] = 2400;
		["posY"] = 450;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00082"] = {
		["ID"] = 82;
		["connectionsID"] = {
			[1] = 263;
			[2] = 227;
			[3] = 262;
			[4] = 23;
			[5] = 154;
		};
		["h"] = 140;
		["posX"] = 6810;
		["posY"] = 600;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00089"] = {
		["ID"] = 89;
		["connectionsID"] = {
			[1] = 85;
			[2] = 90;
			[3] = 87;
		};
		["posX"] = 8010;
		["posY"] = -1230;
		["type"] = "switch";
	};
	["switch_00150"] = {
		["ID"] = 150;
		["connectionsID"] = {
			[1] = 151;
			[2] = 152;
			[3] = 195;
		};
		["posX"] = 7800;
		["posY"] = -150;
		["type"] = "switch";
	};
	["switch_00160"] = {
		["ID"] = 160;
		["connectionsID"] = {
			[1] = 165;
			[2] = 188;
		};
		["posX"] = 4800;
		["posY"] = -1080;
		["type"] = "switch";
	};
	["switch_00191"] = {
		["ID"] = 191;
		["connectionsID"] = {
			[1] = 192;
			[2] = 200;
			[3] = 194;
			[4] = 195;
		};
		["h"] = 120;
		["posX"] = 7800;
		["posY"] = 240;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00208"] = {
		["ID"] = 208;
		["connectionsID"] = {
			[1] = 209;
			[2] = 168;
		};
		["posX"] = 5430;
		["posY"] = -1140;
		["type"] = "switch";
	};
	["switch_00254"] = {
		["ID"] = 254;
		["connectionsID"] = {
			[1] = 253;
			[2] = 231;
		};
		["posX"] = 8760;
		["posY"] = -2370;
		["type"] = "switch";
	};
	["switch_00256"] = {
		["ID"] = 256;
		["connectionsID"] = {
			[1] = 72;
			[2] = 297;
			[3] = 80;
			[4] = 281;
			[5] = 96;
			[6] = 100;
			[7] = 101;
			[8] = 103;
			[9] = 268;
			[10] = 141;
			[11] = 190;
			[12] = 292;
		};
		["h"] = 280;
		["posX"] = 7290;
		["posY"] = -630;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00266"] = {
		["ID"] = 266;
		["connectionsID"] = {
			[1] = 267;
			[2] = 145;
		};
		["posX"] = 9480;
		["posY"] = -630;
		["type"] = "switch";
	};
	["switch_00274"] = {
		["ID"] = 274;
		["connectionsID"] = {
			[1] = 275;
			[2] = 276;
			[3] = 277;
		};
		["posX"] = 7980;
		["posY"] = 1080;
		["type"] = "switch";
	};
	["switch_00284"] = {
		["ID"] = 284;
		["connectionsID"] = {
			[1] = 294;
			[2] = 75;
			[3] = 285;
			[4] = 291;
		};
		["h"] = 120;
		["posX"] = 8970;
		["posY"] = -1830;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00301"] = {
		["ID"] = 301;
		["connectionsID"] = {
			[1] = 303;
			[2] = 272;
		};
		["posX"] = 7350;
		["posY"] = 960;
		["type"] = "switch";
	};
}
return obj1
