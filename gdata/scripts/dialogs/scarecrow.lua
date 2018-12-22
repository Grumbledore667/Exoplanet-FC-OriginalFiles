-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 2;
		["posX"] = 300;
		["posY"] = 300;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 1;
		["connectID"] = 4;
		["posX"] = 690;
		["posY"] = 360;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["posX"] = 690;
		["posY"] = -90;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 2;
		["connectID"] = 13;
		["posX"] = 1110;
		["posY"] = 30;
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
		["text"] = "[t_scarecrow:scarecrow_bag_hat]What... What are you?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 2;
		["connectID"] = 12;
		["posX"] = 1110;
		["posY"] = 360;
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
		["text"] = "[t_scarecrow:scarecrow_face_covered]He... He hides his face. Is he a real one? Are you... a friend of mine?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 1;
		["animation"] = "dl_come_here";
		["connectID"] = 38;
		["posX"] = 1500;
		["posY"] = -210;
		["script"] = "";
		["text"] = "I'm your friend! I just need a place to rest. Can I stay here for a while? You wouldn't attack a friend?";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["connectID"] = 29;
		["posX"] = 1380;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Yes! I'm your friend! I just need a place to rest. Can I stay here for a while? You wouldn't attack a friend?";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 1;
		["animation"] = "dl_cut_throat";
		["connectID"] = 32;
		["posX"] = 1500;
		["posY"] = 90;
		["script"] = "";
		["text"] = "[t_scarecrow:scarecrow_aggressive]I'm a bounty hunter! Surprised? Time to pay for your crimes, monster!";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["animation"] = "dl_hands_washing";
		["connectID"] = 45;
		["posX"] = 2520;
		["posY"] = -120;
		["script"] = "";
		["text"] = "I am hiding. Just like you! It's THEM! They are looking for me!";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 1;
		["connectID"] = 43;
		["posX"] = 2520;
		["posY"] = -510;
		["script"] = "";
		["text"] = "Well, I was just looking for a shelter from the coming desert storm.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 1;
		["animation"] = "dl_cut_throat";
		["connectID"] = 47;
		["posX"] = 3540;
		["posY"] = -60;
		["script"] = "";
		["text"] = "I had enough of your bullshit already. You are batshit crazy and need to be put down for good.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 1;
		["animation"] = "dl_frustration";
		["connectID"] = 49;
		["posX"] = 3540;
		["posY"] = -210;
		["script"] = "";
		["text"] = "Wait! Actually, THEY still might be able find you! Oh no! Don't tell me you haven't disabled their devilish mark on you yet!";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["connectID"] = 56;
		["posX"] = 6240;
		["posY"] = -210;
		["script"] = "";
		["text"] = "Now... must burn it! ";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 2;
		["connectID"] = 28;
		["posX"] = 1110;
		["posY"] = 540;
		["script"] = "";
		["text"] = "[t_scarecrow:scarecrow_aggressive]Oh, another fake! THEY are getting better and better at making you, wretched things!";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 55;
		["posX"] = 5700;
		["posY"] = -210;
		["script"] = "";
		["text"] = "[t_scarecrow:scarecrow_cut_animation]Argh! Ugh!";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 2;
		["posX"] = 2730;
		["posY"] = 360;
		["script"] = "";
		["text"] = "[t_scarecrow:scarecrow_aggressive]Now have a taste of THIS, machine!";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 2;
		["posX"] = 1110;
		["posY"] = -150;
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
		["text"] = "[t_scarecrow:scarecrow_no_chip]Ugh.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 2;
		["posX"] = 1650;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Don't you worry! I will strip your flesh and make you see your mechanical insides, monster!";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["animation"] = "dl_stop_twohand";
		["connectID"] = 27;
		["posX"] = 1380;
		["posY"] = 540;
		["script"] = "";
		["text"] = "What? Wait!";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 2;
		["connectID"] = 30;
		["posX"] = 1650;
		["posY"] = 360;
		["script"] = "";
		["text"] = "No! I'm not like one of THEM! I will never harm a real human being! How did you get here... friend?";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 1;
		["connectID"] = 44;
		["posX"] = 1920;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Well, I was just looking for a shelter from the coming desert storm.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 2;
		["connectID"] = 25;
		["posX"] = 2460;
		["posY"] = 360;
		["script"] = "";
		["text"] = "You almost had me! This place isn't easy to find, that's why I'm here! I see it now, you're not real! I know for certain there's only a handful of real humans left on the planet! And they have a good taste in headgear, unlike you, you fake!";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["connectID"] = 33;
		["posX"] = 1770;
		["posY"] = 90;
		["script"] = "";
		["text"] = "Crimes? But I did nothing wrong! I just tried to protect my life from THEM!";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 2;
		["connectID"] = 34;
		["posX"] = 2040;
		["posY"] = 90;
		["script"] = "";
		["text"] = "Wait! You not gonna fool me like this, you pest!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 2310;
		["posY"] = 90;
		["script"] = "";
		["text"] = "Dammit! THEY are getting better and better at making you, wretched things!";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 1;
		["animation"] = "dl_stop_onehand";
		["connectID"] = 37;
		["posX"] = 2580;
		["posY"] = 90;
		["script"] = "";
		["text"] = "What?";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 2;
		["posX"] = 2850;
		["posY"] = 90;
		["script"] = "";
		["text"] = "Die, you soulless piece of junk!";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 2;
		["connectID"] = 15;
		["posX"] = 1860;
		["posY"] = -210;
		["script"] = "";
		["text"] = "No! I'm not like one of THEM! I will never harm a real human being! How did you get here... friend?";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 1;
		["animation"] = "dl_hands_dontknow";
		["connectID"] = 42;
		["posX"] = 3540;
		["posY"] = -600;
		["script"] = "";
		["text"] = "Them? Them who? Ain't know nothing about any 'them'. Hey, mate, your shotgun, it looks great! What model is that? Can I have a closer look at it?";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 2;
		["posX"] = 3810;
		["posY"] = -600;
		["script"] = "";
		["text"] = "[t_scarecrow:scarecrow_aggressive]Oh, yes! Yes, you can, stupid fake! THEY always want to disarm you first! Same mistake as always! Now have a good look at THIS!";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 1;
		["connectID"] = 65;
		["posX"] = 2790;
		["posY"] = -510;
		["script"] = "";
		["text"] = "Human buildings look less dangerous than those alien ruins east of the caravan road.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 1;
		["connectID"] = 31;
		["posX"] = 2190;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Human buildings look less dangerous than those alien ruins east of the caravan road.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 2;
		["connectID"] = 46;
		["posX"] = 2790;
		["posY"] = -120;
		["script"] = "";
		["text"] = "You are smart! We both outsmarted THEM! THEY will never find us if THEY can't see our faces! Hell, maybe we can start a real uprising, you know, against THEM! Yes! We can liberate all the real humans together!";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = 3060;
		["posY"] = -120;
		["script"] = "";
		["text"] = "Don't you worry, friend, I can protect us both! I will rip any of THEM apart if THEY come for us!";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 2;
		["connectID"] = 48;
		["posX"] = 3810;
		["posY"] = -60;
		["script"] = "";
		["text"] = "What? Oh, I see now! Bravo! You almost got too close to me, you sly assassin doll.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 2;
		["posX"] = 4080;
		["posY"] = -60;
		["script"] = "";
		["text"] = "[t_scarecrow:scarecrow_aggressive]Time to break you apart, abomination!";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 2;
		["connectID"] = 50;
		["posX"] = 3810;
		["posY"] = -210;
		["script"] = "";
		["text"] = "What are you talking about?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 1;
		["animation"] = "dl_head_tap";
		["connectID"] = 62;
		["posX"] = 4080;
		["posY"] = -210;
		["script"] = "";
		["text"] = "There's an ID implant inside your head! How could you forget about it!";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 2;
		["connectID"] = 52;
		["posX"] = 4620;
		["posY"] = -210;
		["script"] = "";
		["text"] = "No way! THEY... the Terraform doc told me the chip doesn't have a tracking module! Trackers were for the... slaves only.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 1;
		["animation"] = "dl_hand_negative";
		["connectID"] = 53;
		["posX"] = 4890;
		["posY"] = -210;
		["script"] = "";
		["text"] = "As if THEY would tell you the truth!";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 2;
		["connectID"] = 54;
		["posX"] = 5160;
		["posY"] = -210;
		["script"] = "";
		["text"] = "That... makes sense now! That's how THEIR androids were always at my heels, finding me again and again!";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 2;
		["connectID"] = 24;
		["posX"] = 5430;
		["posY"] = -210;
		["script"] = "";
		["text"] = "Got to get rid of the damn thing! You must help me, friend! Wait here!";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 1;
		["animation"] = "dl_head_wipe";
		["connectID"] = 21;
		["posX"] = 5970;
		["posY"] = -210;
		["script"] = "";
		["text"] = "Holy shit!";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 1;
		["animation"] = "dl_head_shake";
		["connectID"] = 57;
		["posX"] = 6510;
		["posY"] = -210;
		["script"] = "";
		["text"] = "No, friend, you mustn't! If the chip just stops sending signals, THEY will send another android here to investigate the reason!";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 1;
		["animation"] = "dl_talk_3";
		["connectID"] = 58;
		["posX"] = 6780;
		["posY"] = -210;
		["script"] = "";
		["text"] = "We got to play smart! Please, gimme that cursed thing and I will use it to trick THEM, to send THEM the wrong way. And you better take some rest and recover from your... surgery.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 2;
		["connectID"] = 59;
		["posX"] = 7050;
		["posY"] = -210;
		["script"] = "";
		["text"] = "That's... a brilliant idea! You are the best, friend! Take it! Go! Hurry up!";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 7320;
		["posY"] = -210;
		["script"] = "";
		["text"] = "[t_scarecrow:scarecrow_cut_out_chip]And don't come back here! It's too dangerous for you!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 1;
		["animation"] = "dl_chuckle";
		["connectID"] = 61;
		["posX"] = 7590;
		["posY"] = -210;
		["script"] = "";
		["text"] = "Oh, I won't. You can bet on it.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 2;
		["posX"] = 7860;
		["posY"] = -210;
		["script"] = "";
		["text"] = "I'll meet you... soon... feel funny... gonna take... a nap now... goodbye, friend!";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 1;
		["animation"] = "dl_hand_chopfast";
		["connectID"] = 51;
		["posX"] = 4350;
		["posY"] = -210;
		["script"] = "";
		["text"] = "THEY can track it from the orbit and do know about every step of yours. THEY can even control you with that chip like a puppet! Made me do terrible things that way, before I got rid of mine!";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00065"] = {
		["ID"] = 65;
		["actor"] = 2;
		["connectID"] = 66;
		["posX"] = 3060;
		["posY"] = -510;
		["script"] = "";
		["text"] = "This place isn't easy to find, how come you managed to find it anyway? You must be one of THEIR dogs sniffing around to find me!";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 1;
		["animation"] = "dl_hands_washing";
		["connectID"] = 45;
		["posX"] = 2520;
		["posY"] = -240;
		["script"] = "";
		["text"] = "You got me! I am hiding. Just like you! It's THEM! They are looking for me too!";
		["time"] = 9.5;
		["type"] = "message";
	};
	["switch_00002"] = {
		["ID"] = 2;
		["connectionsID"] = {
			[1] = 3;
			[2] = 1;
		};
		["posX"] = 540;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00004"] = {
		["ID"] = 4;
		["connectionsID"] = {
			[1] = 26;
			[2] = 5;
			[3] = 6;
			[4] = 23;
		};
		["h"] = 120;
		["posX"] = 960;
		["posY"] = 360;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00013"] = {
		["ID"] = 13;
		["connectionsID"] = {
			[1] = 11;
			[2] = 14;
		};
		["posX"] = 1350;
		["posY"] = 30;
		["type"] = "switch";
	};
	["switch_00015"] = {
		["ID"] = 15;
		["connectionsID"] = {
			[1] = 17;
			[2] = 16;
		};
		["posX"] = 2220;
		["posY"] = -210;
		["type"] = "switch";
	};
	["switch_00018"] = {
		["ID"] = 18;
		["connectionsID"] = {
			[1] = 20;
			[2] = 19;
		};
		["posX"] = 3330;
		["posY"] = -120;
		["type"] = "switch";
	};
	["switch_00066"] = {
		["ID"] = 66;
		["connectionsID"] = {
			[1] = 39;
			[2] = 68;
		};
		["posX"] = 3360;
		["posY"] = -510;
		["type"] = "switch";
	};
}
local obj2 = {
	["actor_prefab"] = {
		[1] = "human_male";
	};
}
return obj1 ,obj2
