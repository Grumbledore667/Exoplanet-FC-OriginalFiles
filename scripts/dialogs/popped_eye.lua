-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["connectID"] = 94;
		["posX"] = 5160;
		["posY"] = -600;
		["script"] = "";
		["text"] = "He's a loader for some trader in the camp, and helps guarding a storage or something.";
		["time"] = 9;
		["topic"] = "ragpicker_heist:popped_eye_start";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 92;
		["posX"] = 4890;
		["posY"] = -750;
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
		["text"] = "What if the higher-ups bust this dummy business of yours? I don't think it'll make them happy at all.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = 6660;
		["posY"] = -600;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 105;
		["posX"] = -1710;
		["posY"] = -750;
		["script"] = "";
		["text"] = "How's the watch going?";
		["time"] = 3;
		["topic"] = "ragpicker_heist:popped_eye_first_greeting";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["connectID"] = 33;
		["posX"] = -2550;
		["posY"] = -1050;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["posX"] = 540;
		["posY"] = -120;
		["script"] = "";
		["text"] = "Bye.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["connectID"] = 63;
		["posX"] = -1200;
		["posY"] = -750;
		["script"] = "";
		["text"] = "Hi-ic! Ehh... How did ya get in here, anyway?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 32;
		["posX"] = 7830;
		["posY"] = 120;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
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
		["posX"] = 4890;
		["posY"] = -900;
		["script"] = "";
		["text"] = "Выход из этого цикла, когда использовали обе опции (про начальник и про напарника спросил).";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 1;
		["connectID"] = 48;
		["posX"] = 2370;
		["posY"] = -660;
		["script"] = "";
		["text"] = "\\[Drink Booze]Give it here.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 10;
		["posX"] = 4890;
		["posY"] = -600;
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
		["text"] = "What's your partner's side gig?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 1;
		["connectID"] = 88;
		["posX"] = 2370;
		["posY"] = -510;
		["script"] = "";
		["text"] = "I'm not going to drink with you.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 2;
		["connectID"] = 25;
		["posX"] = 6660;
		["posY"] = -1050;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:hasVisibleChildren()\
end\
\
";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["connectID"] = 32;
		["posX"] = -1710;
		["posY"] = -540;
		["script"] = "";
		["text"] = "Whassup!... hic!";
		["time"] = 2;
		["topic"] = "ragpicker_heist:popped_eye_regular_greeting";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 1;
		["connectID"] = 46;
		["posX"] = -2160;
		["posY"] = -900;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 78;
		["posX"] = 540;
		["posY"] = -600;
		["script"] = "";
		["text"] = "By the way, where's that partner you were talking about?";
		["time"] = 6;
		["topic"] = "ragpicker_heist:popped_eye_about_partner";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 1;
		["connectID"] = 82;
		["posX"] = 2610;
		["posY"] = -660;
		["script"] = "";
		["text"] = "...";
		["time"] = 1.5;
		["topic"] = "ragpicker_heist:popped_eye_drink_accept";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 1;
		["posX"] = -2160;
		["posY"] = -1200;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 2;
		["connectID"] = 107;
		["posX"] = -1710;
		["posY"] = -990;
		["script"] = "";
		["text"] = "Damn ya, huma! Why did you have to mess up our \"guys\"?! Ya better fix them now!";
		["time"] = 9.5;
		["topic"] = "ragpicker_heist:popped_eye_1_dummy_destroyed";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 74;
		["posX"] = -900;
		["posY"] = -990;
		["script"] = "";
		["text"] = "And where should I look for your Bamba?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 2;
		["connectID"] = 74;
		["posX"] = -1710;
		["posY"] = -1140;
		["script"] = "";
		["text"] = "Y-you messed everythin' up... hic! Get Bamba here quick, please... hic!";
		["time"] = 6.5;
		["topic"] = "ragpicker_heist:popped_eye_2_dummy_destroyed";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 1;
		["connectID"] = 58;
		["posX"] = -450;
		["posY"] = -750;
		["script"] = "";
		["text"] = "Hey pal, is getting plastered while on an important duty like this OK in your book?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 2;
		["connectID"] = 59;
		["posX"] = -210;
		["posY"] = -750;
		["script"] = "";
		["text"] = "Fo sho, huma... hic! My partner and I got all the bases covered.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 2;
		["connectID"] = 32;
		["posX"] = 30;
		["posY"] = -750;
		["script"] = "";
		["text"] = "See those two brave aboris over there? They never get sleepy or feel like getting wasted. Just what the higher-ups want. The enemy can see our freaking spirits are as high as ever, too... hic!";
		["time"] = 18.5;
		["topic"] = "ragpicker_heist:popped_eye_trick_revealed";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 2;
		["connectID"] = 57;
		["posX"] = -690;
		["posY"] = -750;
		["script"] = "";
		["text"] = "Uh... right... hic! Ri-ight — we're still on that doggone tower...";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 1;
		["animation"] = "dl_talk_3";
		["connectID"] = 61;
		["posX"] = -960;
		["posY"] = -750;
		["script"] = "";
		["text"] = "Climbed the ladder. Is there any other way to?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00074"] = {
		["ID"] = 74;
		["actor"] = 2;
		["posX"] = -660;
		["posY"] = -1080;
		["script"] = "";
		["text"] = "He guards Ragpicker's warehouse. The clothes peddler's... hic! Ya better head on over there now and tell Bamba to get his ass here before Crooked Leg's busted our little scheme!";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00075"] = {
		["ID"] = 75;
		["actor"] = 2;
		["connectID"] = 77;
		["posX"] = 1140;
		["posY"] = -600;
		["script"] = "";
		["text"] = "Or maybe not so much... hic! I'm not telling ya, though. You could be one of those guys.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00076"] = {
		["ID"] = 76;
		["actor"] = 2;
		["connectID"] = 79;
		["posX"] = 1680;
		["posY"] = -600;
		["script"] = "";
		["text"] = "The... hic!... non-drinkers, a cactus up their bottom! They're even worse than... hic!.. Infidels!";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00077"] = {
		["ID"] = 77;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 76;
		["posX"] = 1410;
		["posY"] = -600;
		["script"] = "";
		["text"] = "What guys?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00078"] = {
		["ID"] = 78;
		["actor"] = 2;
		["connectID"] = 75;
		["posX"] = 870;
		["posY"] = -600;
		["script"] = "";
		["text"] = "That's... hic!.. A secret!";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00079"] = {
		["ID"] = 79;
		["actor"] = 2;
		["connectID"] = 43;
		["posX"] = 1950;
		["posY"] = -600;
		["script"] = "";
		["text"] = "I don't trust non-drinkers! They must be hidin' somethin' if they're scared of a drink making them talk. Me, I'm not hidin' nothin'... hic! Here, let's drink to our meeting, and then I just might tell ya something... hic!";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00081"] = {
		["ID"] = 81;
		["actor"] = 2;
		["connectID"] = 25;
		["posX"] = 4380;
		["posY"] = -660;
		["script"] = "";
		["text"] = "He's one quality abori, he is. He even lets me have some of his dough... hic!!";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00082"] = {
		["ID"] = 82;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 86;
		["posX"] = 2880;
		["posY"] = -660;
		["script"] = "";
		["text"] = "Eww, nasty. Did you spike it with something?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 2;
		["connectID"] = 115;
		["posX"] = 3840;
		["posY"] = -660;
		["script"] = "";
		["text"] = "You won't believe it, huma! Stuff's genius! That Bamba's a brainy one, he is. We threw together a couple dummies. They keep watch instead of us now.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00086"] = {
		["ID"] = 86;
		["actor"] = 2;
		["connectID"] = 106;
		["posX"] = 3120;
		["posY"] = -660;
		["script"] = "";
		["text"] = "Didn't spike it with nothin'. Mixed with some crucas shit I did. It's our trademark recipe... hic! Makes booze stronger... D'you feel it, huma... hic!? Popped Eye's cocktail should be melting your brains already!";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00087"] = {
		["ID"] = 87;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 83;
		["posX"] = 3600;
		["posY"] = -660;
		["script"] = "";
		["text"] = "So what was the deal with your partner?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00088"] = {
		["ID"] = 88;
		["actor"] = 2;
		["connectID"] = 89;
		["posX"] = 2610;
		["posY"] = -510;
		["script"] = "";
		["text"] = "That's not very friendly of ya... A non-drinker, that's what you are... hic! Then you won't be hearing any secrets from me.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00089"] = {
		["ID"] = 89;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = 2880;
		["posY"] = -510;
		["script"] = "";
		["text"] = "Screw you, then. I'll figure everything out by myself.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00092"] = {
		["ID"] = 92;
		["actor"] = 2;
		["connectID"] = 116;
		["posX"] = 5160;
		["posY"] = -750;
		["script"] = "";
		["text"] = "The boss will never get up here, on those crooked legs of his. His knees begin shaking when he so much as gets near the tower. What he does is yell our names from down there.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00094"] = {
		["ID"] = 94;
		["actor"] = 1;
		["connectID"] = 96;
		["posX"] = 5850;
		["posY"] = -600;
		["script"] = "";
		["text"] = "Okay. Stay safe here. You won't make it out in one piece if you take a tumble.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00096"] = {
		["ID"] = 96;
		["actor"] = 2;
		["connectID"] = 39;
		["posX"] = 6120;
		["posY"] = -600;
		["script"] = "";
		["text"] = "S all right, huma... hic! Done that already. Messed up my finger pretty bad, but booze helped with that, too. Couple swigs take the pain away... hic!";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00097"] = {
		["ID"] = 97;
		["actor"] = 2;
		["connectID"] = 39;
		["posX"] = 6120;
		["posY"] = -750;
		["script"] = "";
		["text"] = "Hic!.. I have it good enuf here! Just keep the fleas off me and let me have a bottle nearby, and I'm golden... hic!";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00098"] = {
		["ID"] = 98;
		["actor"] = 1;
		["connectID"] = 97;
		["posX"] = 5850;
		["posY"] = -750;
		["script"] = "";
		["text"] = "Aren't you a treasure trove of talents! Too bad you're slaving away in this dump.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00099"] = {
		["ID"] = 99;
		["actor"] = 2;
		["connectID"] = 104;
		["posX"] = 1590;
		["posY"] = -300;
		["script"] = "";
		["text"] = "My eye's real good, though! I can count horns on a hornhog a thousand stepps away from here, huma... hic";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00100"] = {
		["ID"] = 100;
		["actor"] = 2;
		["connectID"] = 102;
		["posX"] = 780;
		["posY"] = -300;
		["script"] = "";
		["text"] = "Who else but Crooked Leg himself, our wonderful guard superintendent... hic! He says I got a good eye, and I get put on the tower.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00101"] = {
		["ID"] = 101;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 100;
		["posX"] = 540;
		["posY"] = -300;
		["script"] = "";
		["text"] = "Whose brilliant idea was to put you on the tower, anyway?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00102"] = {
		["ID"] = 102;
		["actor"] = 1;
		["connectID"] = 103;
		["posX"] = 1020;
		["posY"] = -300;
		["script"] = "";
		["text"] = "You must've been sober that one time...";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00103"] = {
		["ID"] = 103;
		["actor"] = 2;
		["connectID"] = 99;
		["posX"] = 1290;
		["posY"] = -300;
		["script"] = "";
		["text"] = "Not really, but I was just halfway through what I usually do in a day... hic! And I do look stone-cold sober... till I drink more than eight bottles... hic!";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00104"] = {
		["ID"] = 104;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = 1860;
		["posY"] = -300;
		["script"] = "";
		["text"] = "Just gotta half the score in the end... hic!";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00105"] = {
		["ID"] = 105;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = -1470;
		["posY"] = -750;
		["script"] = "";
		["text"] = "Purgh-fect!";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00106"] = {
		["ID"] = 106;
		["actor"] = 2;
		["connectID"] = 87;
		["posX"] = 3360;
		["posY"] = -660;
		["script"] = "";
		["text"] = "I can see it hit the spot, yet you're still upright... Non-drinker ya aren't... hic!";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00107"] = {
		["ID"] = 107;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 108;
		["posX"] = -1440;
		["posY"] = -990;
		["script"] = "";
		["text"] = "And what if I don’t?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00108"] = {
		["ID"] = 108;
		["actor"] = 2;
		["connectID"] = 55;
		["posX"] = -1170;
		["posY"] = -990;
		["script"] = "";
		["text"] = "I'd kick your pink ass... hic! If I could stand up straight, that is... You've got no shame, you know that? Go get Bamba, and quick!";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00109"] = {
		["ID"] = 109;
		["actor"] = 2;
		["connectID"] = 111;
		["posX"] = -1710;
		["posY"] = -1530;
		["script"] = "";
		["text"] = "Oh, there goes Bamba... hic! I missed him so much! Even though he never drinks... hic!";
		["time"] = 9;
		["topic"] = "ragpicker_heist:popped_eye_tower";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00110"] = {
		["ID"] = 110;
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
		["posX"] = -1710;
		["posY"] = -1680;
		["script"] = "";
		["text"] = "Бамба и Poppoed Eye на вышке (чучела разрушены, либо Бамба подкуплен).";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00111"] = {
		["ID"] = 111;
		["actor"] = 2;
		["connectID"] = 112;
		["posX"] = -1440;
		["posY"] = -1530;
		["script"] = "";
		["text"] = "What would y'all say to the three of us havin' a round?!";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00112"] = {
		["ID"] = 112;
		["actor"] = 1;
		["connectID"] = 32;
		["posX"] = -1170;
		["posY"] = -1530;
		["script"] = "";
		["text"] = "It's all jokes to you, boozeface.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00113"] = {
		["ID"] = 113;
		["actor"] = 2;
		["connectID"] = 114;
		["posX"] = -1710;
		["posY"] = -1890;
		["script"] = "";
		["text"] = "Look Bamba, it's him!";
		["time"] = 3;
		["topic"] = "ragpicker_heist:popped_eye_cave_attack";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00114"] = {
		["ID"] = 114;
		["actor"] = 2;
		["posX"] = -1440;
		["posY"] = -1890;
		["script"] = "";
		["text"] = "Let's get him!";
		["time"] = 2.5;
		["topic"] = "ragpicker_heist:popped_eye_cave_attack";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStop";
		["type"] = "message";
	};
	["message_00115"] = {
		["ID"] = 115;
		["actor"] = 2;
		["connectID"] = 81;
		["posX"] = 4110;
		["posY"] = -660;
		["script"] = "";
		["text"] = "So I can have my happy times here while Bamba makes a quick buck in the camp.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00116"] = {
		["ID"] = 116;
		["actor"] = 2;
		["connectID"] = 98;
		["posX"] = 5430;
		["posY"] = -750;
		["script"] = "";
		["text"] = "And I just answer in my own voice and the partner's... hic...";
		["time"] = 7;
		["type"] = "message";
	};
	["switch_00025"] = {
		["ID"] = 25;
		["connectionsID"] = {
			[1] = 11;
			[2] = 29;
		};
		["posX"] = 4680;
		["posY"] = -660;
		["type"] = "switch";
	};
	["switch_00032"] = {
		["ID"] = 32;
		["connectionsID"] = {
			[1] = 45;
			[2] = 101;
			[3] = 16;
		};
		["posX"] = 360;
		["posY"] = -480;
		["type"] = "switch";
	};
	["switch_00033"] = {
		["ID"] = 33;
		["connectionsID"] = {
			[1] = 49;
			[2] = 41;
		};
		["posX"] = -2310;
		["posY"] = -1050;
		["type"] = "switch";
	};
	["switch_00039"] = {
		["ID"] = 39;
		["connectionsID"] = {
			[1] = 31;
			[2] = 13;
		};
		["posX"] = 6510;
		["posY"] = -690;
		["type"] = "switch";
	};
	["switch_00043"] = {
		["ID"] = 43;
		["connectionsID"] = {
			[1] = 26;
			[2] = 30;
		};
		["posX"] = 2220;
		["posY"] = -600;
		["type"] = "switch";
	};
	["switch_00046"] = {
		["ID"] = 46;
		["connectionsID"] = {
			[1] = 113;
			[2] = 109;
			[3] = 56;
			[4] = 54;
			[5] = 14;
			[6] = 34;
		};
		["h"] = 160;
		["posX"] = -1890;
		["posY"] = -900;
		["type"] = "switch";
		["w"] = 100;
	};
}
local obj2 = {
	["actor_prefab"] = {
		[1] = "human_male";
	};
}
return obj1 ,obj2
