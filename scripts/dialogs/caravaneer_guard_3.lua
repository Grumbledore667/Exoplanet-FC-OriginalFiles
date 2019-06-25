-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 11;
		["posX"] = -60;
		["posY"] = 390;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 2;
		["connectID"] = 16;
		["posX"] = 720;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Yes?";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["connectID"] = 7;
		["posX"] = 1110;
		["posY"] = 420;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isFirstTime() and getQuestTopicVisible(\"scarecrow\", \"caravaneers_about_scarecrow\")\
end\
\
";
		["text"] = "Tell me about the Scarecrow's attack. I want to track him down and make him pay for his crimes.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 2;
		["connectID"] = 33;
		["posX"] = 1500;
		["posY"] = 270;
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
		["text"] = "A man cannot kill a desert demon. Give up on this bounty, stranger, or you will die like our poor brothers.";
		["time"] = 11.5;
		["topic"] = "scarecrow:caravaneer_about_scarecrow_1";
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 39;
		["posX"] = 1500;
		["posY"] = 420;
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
		["text"] = "Oh please... Don't make me remember that.";
		["time"] = 4.5;
		["topic"] = "scarecrow:caravaneer_about_scarecrow_2";
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["connectID"] = 46;
		["posX"] = 1650;
		["posY"] = 660;
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
		["text"] = "A bounty hunter? Where were you guys before Castor whipped out a reward for that monster's head?";
		["time"] = 10;
		["topic"] = "scarecrow:caravaneer_about_scarecrow_3";
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["connectID"] = 29;
		["posX"] = 330;
		["posY"] = -450;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 1;
		["connectID"] = 14;
		["posX"] = 330;
		["posY"] = 450;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["posX"] = 720;
		["posY"] = 30;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scarecrow\", \"caravaneers_friendly\")\
end\
\
";
		["text"] = "Yeah, hello.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 1;
		["posX"] = 1140;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "Bye";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 1;
		["connectID"] = 69;
		["posX"] = 1140;
		["posY"] = 870;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scarecrow\", \"caravaneer_scarecrow_reward\")\
end\
\
";
		["text"] = "I got rid of the Scarecrow. That's at least one less psycho attacking people on the caravan road.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 71;
		["posX"] = 1980;
		["posY"] = 870;
		["script"] = "";
		["text"] = "If Castor says this Scarecrow bastard is gone, he is gone. Castor's word is respected in these parts.";
		["time"] = 10;
		["topic"] = "scarecrow:caravaneer_scarecrow_reward";
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 1;
		["animation"] = "dl_hands_dontknow";
		["connectID"] = 28;
		["posX"] = 5400;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Have you noticed anything unusual about the Scarecrow? Any small detail that can help me finding and getting rid of him?";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 1;
		["posX"] = 5400;
		["posY"] = 720;
		["script"] = "";
		["text"] = "Thanks for the info. I will do my best to stop the murderer.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["connectID"] = 62;
		["posX"] = 5670;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Don't know how to put it... It's really strange, but how can we comprehend a madman's logic? Well, I think, he prioritizes... he targets people with no protective headgear first...";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 1;
		["connectID"] = 32;
		["posX"] = 690;
		["posY"] = -540;
		["script"] = "";
		["text"] = "Give scarecrow info";
		["time"] = 2.5;
		["topic"] = "scarecrow:caravaneer_about_scarecrow_3";
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 1;
		["posX"] = 690;
		["posY"] = -390;
		["script"] = "";
		["text"] = "End";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["posX"] = 930;
		["posY"] = -540;
		["script"] = "";
		["text"] = "And they don't kill masked people.";
		["time"] = 4;
		["topic"] = "scarecrow:caravaneer_about_scarecrow_3_bonus";
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 1;
		["animation"] = "dl_hand_negative";
		["connectID"] = 34;
		["posX"] = 1770;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Cut the crap about demons and tell me about the ambush you got yourself into.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["connectID"] = 37;
		["posX"] = 2040;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Well, there isn't much to tell. We were close to the Fort, tired, careless... we lost our vigilance. That thing... it was following us... hunting us, waiting for the right time to strike.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 1;
		["connectID"] = 36;
		["posX"] = 3120;
		["posY"] = 270;
		["script"] = "";
		["text"] = "I do not believe in tales, nomad. If it bleeds - then I can kill it. Now tell me where did it all happen, so I can avenge your fallen brothers.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 2;
		["connectID"] = 54;
		["posX"] = 3390;
		["posY"] = 270;
		["script"] = "";
		["text"] = "The sand demon attacked us somewhere at the verge of the Great White Erg. In that chaos I got showed aside by the scared arphant and lost consciousness so I cannot tell you exactly where the fight started.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 2;
		["connectID"] = 55;
		["posX"] = 2310;
		["posY"] = 270;
		["script"] = "";
		["text"] = "It appeared in a whirlwind of sand, like the Rakshasa from the tales the old ones tell our children at the campfire... It shot our brothers with its huge gun. Cut them with a knife. Murdered many with its bare hands. ";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 2850;
		["posY"] = 270;
		["script"] = "";
		["text"] = "It was not a human being, I tell you. A Rakshasa raided us and made fun of our guns and blades!";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 1;
		["connectID"] = 40;
		["posX"] = 1770;
		["posY"] = 420;
		["script"] = "";
		["text"] = "I didn't expect the nomads to be such wusses.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00040"] = {
		["ID"] = 40;
		["actor"] = 2;
		["connectID"] = 56;
		["posX"] = 2040;
		["posY"] = 420;
		["script"] = "";
		["text"] = "If you saw what happened, you wouldn't be that confident, stranger. Alright, here is my version: we got screwed! Hard. That's all you need to know. Attacked and slaughtered like hornhog lambs, one by one. And who did this? One man! One freaking psycho in a weird mask! ";
		["time"] = 25.5;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 1;
		["connectID"] = 42;
		["posX"] = 2580;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Calm down, buddy. Everyone has his tough moments. I need to know where the fight started.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 2;
		["connectID"] = 43;
		["posX"] = 2880;
		["posY"] = 420;
		["script"] = "";
		["text"] = "I... I can remember... Before we ran for our lives... I was on the caravan road leading north from the White Erg, not far from those huge abori ruins with all those towers and domes.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 1;
		["connectID"] = 44;
		["posX"] = 3180;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Can the Scarecrow be hiding in those ruins?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 2;
		["connectID"] = 45;
		["posX"] = 3450;
		["posY"] = 420;
		["script"] = "";
		["text"] = "I doubt so, stranger. You see... These are said to be populated by the Stonehead tribe. Aboris wouldn't let anyone like that butcher to settle nearby. I don't know where this murderer can hide - this area is full of caves and holes of all kinds.";
		["time"] = 24;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 2;
		["connectID"] = 67;
		["posX"] = 3750;
		["posY"] = 420;
		["script"] = "";
		["text"] = "You see: I'm not much of a help.... even to you. Just let me be, please, go ask the others. They might know more about the attacker.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 1;
		["connectID"] = 47;
		["posX"] = 1920;
		["posY"] = 660;
		["script"] = "";
		["text"] = "I think, personally I wasn't even on this dusty planet, so you should try to shame someone else, warrior. You seem to be more reasonable than the other survivors.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 2;
		["connectID"] = 58;
		["posX"] = 2190;
		["posY"] = 660;
		["script"] = "";
		["text"] = "I'm the oldest here from our tribe, the oldest to survive from our group. Must take care of the young ones. I will grieve our losses later. Now is the time to lick our wounds and prepare to take our revenge. ";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 1;
		["animation"] = "dl_head_nod";
		["connectID"] = 50;
		["posX"] = 3270;
		["posY"] = 660;
		["script"] = "";
		["text"] = "You got my word. Listen, I've heard all kinds of stories from your brothers already. Can you give me some solid clues on that case? Where should I pick the track of the Scarecrow?";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 2;
		["connectID"] = 48;
		["posX"] = 3000;
		["posY"] = 660;
		["script"] = "";
		["text"] = "I agree. It would be rather disgraceful move to conceal any important information even from bounty hunters like you. Just promise me, that when you find that... man... you will make him suffer!";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 2;
		["connectID"] = 51;
		["posX"] = 3540;
		["posY"] = 660;
		["script"] = "";
		["text"] = "Hm... let me see... our caravan was ambushed on the road leading from the White Erg, close to the old fort. But you won't find any significant traces there - the desert covers all tracks fast...";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 1;
		["connectID"] = 52;
		["posX"] = 3810;
		["posY"] = 660;
		["script"] = "";
		["text"] = "Could this old fort be a hiding place for the Scarecrow? At least his observation post?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 4080;
		["posY"] = 660;
		["script"] = "";
		["text"] = "In fact, you could not ask for a better place to spot travelers from afar. I do not know though if he is insane enough to set his lair in there: the ruin is old, dating back to the first wave of colonization. ";
		["time"] = 23;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 2;
		["connectID"] = 25;
		["posX"] = 4620;
		["posY"] = 660;
		["script"] = "";
		["text"] = "I will mark the area on your map. Tread lightly in that place, bounty hunter: the old fort has seen many lives taken before it was destroyed. I hope you will return with the Scarecrow's head soon.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 2;
		["posX"] = 3660;
		["posY"] = 270;
		["script"] = "";
		["text"] = "My brothers carried me here. You should ask them about the fight, brave bounty hunter. Though I do not believe that you can defeat the desert demon, I will pray for your success.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 2;
		["connectID"] = 38;
		["posX"] = 2580;
		["posY"] = 270;
		["script"] = "";
		["text"] = "I returned shots many, many times and managed to hit it... saw blood spilling... but it seemed to not feel any pain at all!";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 2;
		["connectID"] = 41;
		["posX"] = 2310;
		["posY"] = 420;
		["script"] = "";
		["text"] = "If I were there again, I would crush him with my own hands, rip his throat with my own teeth. But when it all happened - I... I just froze! Why? Why me? I'm not a coward!";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 2;
		["connectID"] = 59;
		["posX"] = 2460;
		["posY"] = 660;
		["script"] = "";
		["text"] = "I would go and hunt down that bastard myself, but I must tend to my brothers first. As you can see, their spirit is broken. They might get into trouble if I leave them like this.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 1;
		["connectID"] = 49;
		["posX"] = 2730;
		["posY"] = 660;
		["script"] = "";
		["text"] = "As we sit here, chatting about revenge, the Scarecrow's body count might increase again. How about you swallow your pride for a while and tell me what you do know, before more people get hurt?";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 2;
		["connectID"] = 53;
		["posX"] = 4350;
		["posY"] = 660;
		["script"] = "";
		["text"] = "It's not safe to even walk near those buildings, for they are ready to crumble at any time just from a strong wind gust. Wild beasts might populate the ruin and you risk running into Scalphunters' nest there as well.";
		["time"] = 21;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 1;
		["connectID"] = 63;
		["posX"] = 5940;
		["posY"] = 570;
		["script"] = "";
		["text"] = "What do you mean?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 2;
		["connectID"] = 64;
		["posX"] = 6210;
		["posY"] = 570;
		["script"] = "";
		["text"] = "That monster was stabbing people with uncovered faces, carving at them with a knife, even biting their flesh and screaming all kinds of sick things... I know it sounds crazy, but look at us: we three managed to escape with our lives and we all were wearing turbans and goggles.";
		["time"] = 26;
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 2;
		["connectID"] = 65;
		["posX"] = 6480;
		["posY"] = 570;
		["script"] = "";
		["text"] = "I don't know if it'll help you, hunter. When I think of that nightmare again and again I'm not even sure what I saw and if my guess is correct.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00065"] = {
		["ID"] = 65;
		["actor"] = 1;
		["connectID"] = 66;
		["posX"] = 6750;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Thanks anyway. I will do my best to stop the murderer.";
		["time"] = 6.5;
		["topic"] = "scarecrow:caravaneer_about_scarecrow_3_bonus";
		["type"] = "message";
	};
	["message_00066"] = {
		["ID"] = 66;
		["actor"] = 2;
		["posX"] = 7020;
		["posY"] = 570;
		["script"] = "";
		["text"] = "May the Huntress guide your hand, stranger! Find and slay that rabid beast!";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
		["actor"] = 1;
		["posX"] = 4020;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Thanks anyway. I will do my best to stop the murderer.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 2;
		["connectID"] = 70;
		["posX"] = 1410;
		["posY"] = 870;
		["script"] = "";
		["text"] = "But where is the corpse? How can we trust your word?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00070"] = {
		["ID"] = 70;
		["actor"] = 1;
		["connectID"] = 24;
		["posX"] = 1680;
		["posY"] = 870;
		["script"] = "";
		["text"] = "I've cut out the ID chip out of his head. No one can survive that. Captain Castor should be able to confirm that the chip is the real deal.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00071"] = {
		["ID"] = 71;
		["actor"] = 2;
		["posX"] = 2250;
		["posY"] = 870;
		["script"] = "";
		["text"] = "We don't have a custom to pay for the killing, but you can have our thanks and enjoy our hospitality, stranger. You are welcome at our campfire and in our oases, if you can find them, of course.";
		["time"] = 20;
		["type"] = "message";
	};
	["switch_00007"] = {
		["ID"] = 7;
		["connectionsID"] = {
			[1] = 8;
			[2] = 9;
			[3] = 10;
		};
		["posX"] = 1350;
		["posY"] = 420;
		["type"] = "switch";
	};
	["switch_00011"] = {
		["ID"] = 11;
		["connectionsID"] = {
			[1] = 12;
			[2] = 13;
		};
		["posX"] = 180;
		["posY"] = 390;
		["type"] = "switch";
	};
	["switch_00014"] = {
		["ID"] = 14;
		["connectionsID"] = {
			[1] = 15;
			[2] = 4;
		};
		["posX"] = 570;
		["posY"] = 450;
		["type"] = "switch";
	};
	["switch_00016"] = {
		["ID"] = 16;
		["connectionsID"] = {
			[1] = 5;
			[2] = 21;
			[3] = 18;
		};
		["posX"] = 960;
		["posY"] = 540;
		["type"] = "switch";
	};
	["switch_00025"] = {
		["ID"] = 25;
		["connectionsID"] = {
			[1] = 26;
			[2] = 27;
		};
		["posX"] = 4950;
		["posY"] = 660;
		["type"] = "switch";
	};
	["switch_00029"] = {
		["ID"] = 29;
		["connectionsID"] = {
			[1] = 30;
			[2] = 31;
		};
		["posX"] = 570;
		["posY"] = -450;
		["type"] = "switch";
	};
}
local obj2 = {
	["actor_prefab"] = {
		[1] = "human_male";
	};
}
return obj1 ,obj2
