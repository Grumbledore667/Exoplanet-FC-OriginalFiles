-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 1;
		["connectID"] = 1;
		["posX"] = -1980;
		["posY"] = 1410;
		["script"] = "function message:onStart()\
   self:setParam(\"0\", true)\
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
		["text"] = "Hey, pal, that's some impressive load you're carrying. Are you a traveler?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = -1710;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "Naturally, and a very famous one at that! Every sandflea in Red and White Erg knows me! Haven't you heard of Zaba the Sweet talker, huma?";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["connectID"] = 5;
		["posX"] = -1440;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "Maybe, but it's slipped my mind. What's this Zaba the Sweet talker known for?";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 2;
		["connectID"] = 161;
		["posX"] = -1170;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "It's most unfortunate that you have such a poor memory, huma, but, luckily for you, Zaba can help you. He has a great remedy to restore and improve memory.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 1;
		["connectID"] = 42;
		["posX"] = 1320;
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
		["text"] = "Do you have Sweet Joy?";
		["time"] = 3.5;
		["topic"] = "broken_crane:zaba_sweet_joy";
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 2;
		["connectID"] = 158;
		["posX"] = 1590;
		["posY"] = -420;
		["script"] = "";
		["text"] = "Now that's stuff for true connoisseurs: it puts you in a trance and gives you colourful dreams that you won't be able to tell from reality! Almost zero side effects, only some light dizziness the morning after.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 1;
		["connectID"] = 57;
		["posX"] = 2130;
		["posY"] = -420;
		["script"] = "";
		["text"] = "Tempting, but I need something else. Has an abori named Screw recently exchanged a gizmo for your Sweet Joy?";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 1;
		["connectID"] = 51;
		["posX"] = 1320;
		["posY"] = 1530;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"broken_crane\", \"zaba_about_waga\")\
end\
\
";
		["text"] = "Why do you sell your goods here?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 2;
		["connectID"] = 177;
		["posX"] = 1590;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "Isn't it obvious, huma? Zaba's goods are not for the poor, so he won't go to the market square filled with beggars and street rats that reek of disease and poverty.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 1;
		["connectID"] = 53;
		["posX"] = 1320;
		["posY"] = 1230;
		["script"] = "";
		["text"] = "Show me your dreams and nightmares.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 2;
		["posX"] = 1590;
		["posY"] = 1230;
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
";
		["text"] = "Here's what Zaba has to offer. Just don't mix it all together, or Zaba will have one less customer.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 1;
		["connectID"] = 56;
		["posX"] = 1320;
		["posY"] = 1800;
		["script"] = "";
		["text"] = "I need to go.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 2;
		["posX"] = 1590;
		["posY"] = 1800;
		["script"] = "";
		["text"] = "Sure, huma, take care! Zaba will be waiting for you!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 2820;
		["posY"] = 60;
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
		["text"] = "Anything for my favourite customer... Alright... yes, I think I might have seen something like this. Is it valuable?";
		["time"] = 10.5;
		["topic"] = "broken_crane:zaba_got_cb";
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 2;
		["connectID"] = 40;
		["posX"] = 3090;
		["posY"] = -420;
		["script"] = "";
		["text"] = "Maybe if you buy something, Zaba might try and help you. But only because you're such a nice guy.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 1;
		["connectID"] = 61;
		["posX"] = 3090;
		["posY"] = 60;
		["script"] = "";
		["text"] = "Not for you.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 2;
		["connectID"] = 81;
		["posX"] = 3360;
		["posY"] = 60;
		["script"] = "";
		["text"] = "No, huma, you won't trick me, Zaba wasn't born yesterday. You'd better tell me why you need it so much or you can kiss your gizmo goodbye.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 2;
		["connectID"] = 40;
		["posX"] = -1980;
		["posY"] = 1590;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"0\")\
end\
\
";
		["text"] = "Oh, you have returned! Everyone returns to Zaba. Ha ha!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00082"] = {
		["ID"] = 82;
		["actor"] = 1;
		["connectID"] = 225;
		["posX"] = 4050;
		["posY"] = -870;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"broken_crane\", \"zaba_cb_negotiate_big\")\
end\
\
";
		["text"] = "I need this part to fix the big crane.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 2;
		["connectID"] = 93;
		["posX"] = 4590;
		["posY"] = -870;
		["script"] = "";
		["text"] = "No, huma, you don't quite understand how things work around here. Zaba's sales don't depend on scrap production. The locals will tear each other apart to get access to Zaba's goods. Besides, huma, why should Zaba lose money by giving it to you for free?";
		["time"] = 23;
		["type"] = "message";
	};
	["message_00084"] = {
		["ID"] = 84;
		["actor"] = 1;
		["connectID"] = 224;
		["posX"] = 4050;
		["posY"] = -1140;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"broken_crane\", \"zaba_cb_negotiate_small\")\
end\
\
";
		["text"] = "I'm here on a secret mission from Big Hat: I need to stop the epidemic.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00085"] = {
		["ID"] = 85;
		["actor"] = 2;
		["connectID"] = 99;
		["posX"] = 4860;
		["posY"] = -1140;
		["script"] = "";
		["text"] = "What?! What epidemic? Big Hat didn't tell me anything about it!";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00086"] = {
		["ID"] = 86;
		["actor"] = 1;
		["connectID"] = 226;
		["posX"] = 4050;
		["posY"] = -600;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"broken_crane\", \"zaba_cb_negotiate_medium\")\
end\
\
";
		["text"] = "You know, this circuit breaker is mine.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00087"] = {
		["ID"] = 87;
		["actor"] = 2;
		["connectID"] = 217;
		["posX"] = 6210;
		["posY"] = -600;
		["script"] = "";
		["text"] = "You're a funny huma, so it will be only 300 crystals.";
		["time"] = 6.5;
		["topic"] = "broken_crane:zaba_cb_negotiate_medium";
		["type"] = "message";
	};
	["message_00090"] = {
		["ID"] = 90;
		["actor"] = 1;
		["connectID"] = 91;
		["posX"] = 4050;
		["posY"] = 840;
		["script"] = "";
		["text"] = "We'll discuss it later.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 2;
		["connectID"] = 159;
		["posX"] = 4320;
		["posY"] = 840;
		["script"] = "";
		["text"] = "I'll be here, huma, but the price... the price might go up.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00092"] = {
		["ID"] = 92;
		["actor"] = 1;
		["connectID"] = 210;
		["posX"] = 1320;
		["posY"] = 60;
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
		["text"] = "About the circuit breaker.";
		["time"] = 3;
		["topic"] = "broken_crane:zaba_about_cb";
		["type"] = "message";
	};
	["message_00093"] = {
		["ID"] = 93;
		["actor"] = 1;
		["connectID"] = 94;
		["posX"] = 4860;
		["posY"] = -870;
		["script"] = "";
		["text"] = "How much do you want for it?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00094"] = {
		["ID"] = 94;
		["actor"] = 2;
		["connectID"] = 217;
		["posX"] = 5130;
		["posY"] = -870;
		["script"] = "";
		["text"] = "Zaba didn't even know how valuable this thing is. Just for you, huma, it will be 400 crystals. Only because I like you.";
		["time"] = 12.5;
		["topic"] = "broken_crane:zaba_cb_negotiate_big";
		["type"] = "message";
	};
	["message_00099"] = {
		["ID"] = 99;
		["actor"] = 1;
		["connectID"] = 100;
		["posX"] = 5130;
		["posY"] = -1140;
		["script"] = "";
		["text"] = "Of course, he doesn't want to cause panic in the camp. Can you imagine what would happen?";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00100"] = {
		["ID"] = 100;
		["actor"] = 2;
		["connectID"] = 217;
		["posX"] = 5400;
		["posY"] = -1140;
		["script"] = "";
		["text"] = "May a thousand lightnings bite these exiles in the ass! I knew that bastard was sick! Fine, huma, just 150 crystals and you can have this infectious piece of trash.";
		["time"] = 16;
		["topic"] = "broken_crane:zaba_cb_negotiate_small";
		["type"] = "message";
	};
	["message_00102"] = {
		["ID"] = 102;
		["actor"] = 1;
		["connectID"] = 108;
		["posX"] = 4050;
		["posY"] = -30;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"broken_crane\", \"zaba_cb_buy_small\")\
end\
\
";
		["text"] = "Fine, I'll buy the circuit breaker for 150 crystals.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00104"] = {
		["ID"] = 104;
		["actor"] = 1;
		["connectID"] = 192;
		["posX"] = 4050;
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
		["text"] = "I don't have enough money.";
		["time"] = 3.5;
		["topic"] = "broken_crane:zaba_cb_no_money";
		["type"] = "message";
	};
	["message_00105"] = {
		["ID"] = 105;
		["actor"] = 2;
		["connectID"] = 110;
		["posX"] = 4470;
		["posY"] = 630;
		["script"] = "";
		["text"] = "Understandable, I get that a lot. Well, come back next time!";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00107"] = {
		["ID"] = 107;
		["actor"] = 2;
		["connectID"] = 112;
		["posX"] = 4320;
		["posY"] = 270;
		["script"] = "";
		["text"] = "That's right, huma. If you really need something, you must pay for it, don't you agree? And Zaba will put these 400 crystals to good use.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00108"] = {
		["ID"] = 108;
		["actor"] = 2;
		["connectID"] = 113;
		["posX"] = 4320;
		["posY"] = -30;
		["script"] = "";
		["text"] = "Give me the crystals and get the hell out of here!";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00109"] = {
		["ID"] = 109;
		["actor"] = 2;
		["connectID"] = 114;
		["posX"] = 4320;
		["posY"] = 120;
		["script"] = "";
		["text"] = "Here, take it. Let's hope this was the first and last time you tried to trick Zaba!";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00110"] = {
		["ID"] = 110;
		["actor"] = 1;
		["connectID"] = 217;
		["posX"] = 4740;
		["posY"] = 570;
		["script"] = "";
		["text"] = "I see.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00112"] = {
		["ID"] = 112;
		["actor"] = 1;
		["connectID"] = 159;
		["posX"] = 4590;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Give it to me.";
		["time"] = 3;
		["topic"] = "broken_crane:zaba_cb_buy_big";
		["type"] = "message";
	};
	["message_00113"] = {
		["ID"] = 113;
		["actor"] = 1;
		["connectID"] = 195;
		["posX"] = 4590;
		["posY"] = -30;
		["script"] = "";
		["text"] = "That's much better.";
		["time"] = 2.5;
		["topic"] = "broken_crane:zaba_cb_buy_small";
		["type"] = "message";
	};
	["message_00114"] = {
		["ID"] = 114;
		["actor"] = 1;
		["connectID"] = 159;
		["posX"] = 4590;
		["posY"] = 120;
		["script"] = "";
		["text"] = "Give it to me.";
		["time"] = 3;
		["topic"] = "broken_crane:zaba_cb_buy_medium";
		["type"] = "message";
	};
	["message_00118"] = {
		["ID"] = 118;
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
		["posX"] = 1320;
		["posY"] = -570;
		["script"] = "";
		["text"] = "Активно, если продвинулся в квесте \"сломанный кран\".";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00155"] = {
		["ID"] = 155;
		["actor"] = 1;
		["connectID"] = 87;
		["posX"] = 5940;
		["posY"] = -600;
		["script"] = "";
		["text"] = "And how much do you want?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00158"] = {
		["ID"] = 158;
		["actor"] = 2;
		["connectID"] = 43;
		["posX"] = 1860;
		["posY"] = -420;
		["script"] = "";
		["text"] = "But enough talking! Try it and you'll see. Just 50 crystals for an experience you'll remember for the rest of your life!";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00159"] = {
		["ID"] = 159;
		["actor"] = 2;
		["connectID"] = 40;
		["posX"] = 5700;
		["posY"] = 930;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00161"] = {
		["ID"] = 161;
		["actor"] = 2;
		["connectID"] = 237;
		["posX"] = -900;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "As well as medicine against sand fever, nightmares, diarrhea, insomnia, and even a patented treatment to increase a man's potency, all 100% natural!";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00162"] = {
		["ID"] = 162;
		["actor"] = 1;
		["connectID"] = 163;
		["posX"] = -360;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "I don't and hope I won't for a while yet. Do you sell medicine?";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00163"] = {
		["ID"] = 163;
		["actor"] = 2;
		["connectID"] = 164;
		["posX"] = -90;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "Yes, I do. Both for your body and mind.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00164"] = {
		["ID"] = 164;
		["actor"] = 1;
		["connectID"] = 165;
		["posX"] = 180;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "Ah, so you sell drugs?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00165"] = {
		["ID"] = 165;
		["actor"] = 2;
		["connectID"] = 166;
		["posX"] = 450;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "Well, it depends on how you look at it, huma. Zaba prefers to call it \"medicine for the mind.\" My stuff can give you oblivion, fantastic dreams, vivid illusions and even feverish nightmares, if that's what you desire.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00166"] = {
		["ID"] = 166;
		["actor"] = 2;
		["connectID"] = 40;
		["posX"] = 720;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "Zaba's experience shows that it is more important to heal our soul than our body. This is why Zaba is welcomed with open arms in any camp, settlement, oasis, and even huma town.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00168"] = {
		["ID"] = 168;
		["actor"] = 2;
		["posX"] = 1590;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "Торговля.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00177"] = {
		["ID"] = 177;
		["actor"] = 2;
		["connectID"] = 178;
		["posX"] = 1860;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "Besides, that shaggy scumbag Waga is already working there — I'll just let him deal with all those wretches who have nothing but their own dirty pants.";
		["time"] = 14.5;
		["topic"] = "broken_crane:zaba_about_waga";
		["type"] = "message";
	};
	["message_00178"] = {
		["ID"] = 178;
		["actor"] = 1;
		["connectID"] = 179;
		["posX"] = 2130;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "Does the local chief know you're selling these goods right under his nose?";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00179"] = {
		["ID"] = 179;
		["actor"] = 2;
		["connectID"] = 180;
		["posX"] = 2400;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "Actually, it was Big Hat who invited me here in the first place. Zaba is a big fan of his, so Big Hat acts as a generous patron. Perhaps he sees Zaba as a kindred spirit.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00180"] = {
		["ID"] = 180;
		["actor"] = 2;
		["connectID"] = 238;
		["posX"] = 2670;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "Where else would you find another abori willing to risk his life on long and dangerous journeys to get medicine for those in need?";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00181"] = {
		["ID"] = 181;
		["actor"] = 1;
		["connectID"] = 159;
		["posX"] = 3210;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "I see. Just don't overdo it, or those in need will be left with no gear.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00182"] = {
		["ID"] = 182;
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
		["posX"] = 1860;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "Активатор для реплики у Ваги, в которой тот рассказывает о слабости Забы. В которой тот рассказывает про микробов. Запись в Notes появляется - в ней написано \"в лагере находятся два бродячих торговца З и В, которые недолюбливают друг друга. если мне нужно будет чего то добиться от одного из них, есть смысл посоветоваться с его соперником по поводу слабостей другого\".";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00185"] = {
		["ID"] = 185;
		["actor"] = 2;
		["connectID"] = 59;
		["posX"] = 2820;
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
		["text"] = "Guess what huma: Zaba doesn't remember all his clients' names. As long as they remember where to find Zaba.";
		["time"] = 10.5;
		["topic"] = "broken_crane:zaba_never_bought";
		["type"] = "message";
	};
	["message_00188"] = {
		["ID"] = 188;
		["actor"] = 1;
		["connectID"] = 217;
		["posX"] = 4860;
		["posY"] = -330;
		["script"] = "";
		["text"] = "Alright, let's try it another way.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00190"] = {
		["ID"] = 190;
		["actor"] = 1;
		["connectID"] = 85;
		["posX"] = 4590;
		["posY"] = -1140;
		["script"] = "";
		["text"] = "We don't know how the disease spreads yet. So you might have a ticking time bomb in your bag. If I were you, I'd hand it over right now.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00193"] = {
		["ID"] = 193;
		["actor"] = 2;
		["connectID"] = 110;
		["posX"] = 4470;
		["posY"] = 510;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"broken_crane\", \"zaba_cb_price_small\")\
end\
\
";
		["text"] = "Fine, huma, find it, but be quick or I'll burn this piece of crap.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00195"] = {
		["ID"] = 195;
		["actor"] = 2;
		["connectID"] = 196;
		["posX"] = 4860;
		["posY"] = -30;
		["script"] = "";
		["text"] = "Huma, are you sure I won't get sick?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00196"] = {
		["ID"] = 196;
		["actor"] = 1;
		["connectID"] = 197;
		["posX"] = 5130;
		["posY"] = -30;
		["script"] = "";
		["text"] = "Disinfect your hands with alcohol, don't take your mask off, and avoid contact with the locals for a while. If you want to be sure, I'd recommend you get rid of all your goods.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00197"] = {
		["ID"] = 197;
		["actor"] = 2;
		["connectID"] = 159;
		["posX"] = 5400;
		["posY"] = -30;
		["script"] = "";
		["text"] = "I'd rather die! As soon as Zaba sells his remaining stock, he'll get the hell out of this dump! This is the last time he stops here. Big Hat, that old bastard, won't lure Zaba back here ever again. Blast it all!";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00198"] = {
		["ID"] = 198;
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
		["posX"] = 1320;
		["posY"] = -60;
		["script"] = "";
		["text"] = "активна в том случае, когда первый раз игрок не сделал выбор и вернулся (например не было денег)";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00199"] = {
		["ID"] = 199;
		["actor"] = 2;
		["connectID"] = 239;
		["posX"] = 4590;
		["posY"] = -600;
		["script"] = "";
		["text"] = "No, huma, no one has tried to con Zaba like this since he was knee-high to a slimetoad. Do you have proof that it belongs to you?";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00200"] = {
		["ID"] = 200;
		["actor"] = 2;
		["connectID"] = 201;
		["posX"] = 5130;
		["posY"] = -600;
		["script"] = "";
		["text"] = "Second, no one will bother with an investigation or trial. If someone has \"appropriated\" your stuff, you've only got yourself to blame.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00201"] = {
		["ID"] = 201;
		["actor"] = 2;
		["connectID"] = 240;
		["posX"] = 5400;
		["posY"] = -600;
		["script"] = "";
		["text"] = "And to be honest, trading stolen goods is far from the worst thing Zaba has had to do in his long career. But as you can see, he's still here.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00203"] = {
		["ID"] = 203;
		["actor"] = 1;
		["connectID"] = 236;
		["posX"] = 4050;
		["posY"] = -330;
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
		["text"] = "This circuit breaker carries a terrible curse.";
		["time"] = 4.5;
		["topic"] = "broken_crane:zaba_cb_negotiate_fluff";
		["type"] = "message";
	};
	["message_00204"] = {
		["ID"] = 204;
		["actor"] = 2;
		["connectID"] = 188;
		["posX"] = 4590;
		["posY"] = -330;
		["script"] = "";
		["text"] = "Huma, do you really think all aboris are superstitious idiots? Zaba appreciates the effort, but you need to come up with a more convincing story.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00211"] = {
		["ID"] = 211;
		["actor"] = 2;
		["connectID"] = 59;
		["posX"] = 2820;
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
		["text"] = "I told you, Zaba doesn't remember.";
		["time"] = 4;
		["topic"] = "broken_crane:zaba_never_bought";
		["type"] = "message";
	};
	["message_00213"] = {
		["ID"] = 213;
		["actor"] = 1;
		["connectID"] = 109;
		["posX"] = 4050;
		["posY"] = 120;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"broken_crane\", \"zaba_cb_buy_medium\")\
end\
\
";
		["text"] = "Fine, I'll buy the circuit breaker for 300 crystals.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00214"] = {
		["ID"] = 214;
		["actor"] = 1;
		["connectID"] = 107;
		["posX"] = 4050;
		["posY"] = 270;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"broken_crane\", \"zaba_cb_buy_big\")\
end\
\
";
		["text"] = "Fine, I'll buy the circuit breaker for 400 crystals.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00217"] = {
		["ID"] = 217;
		["actor"] = 2;
		["connectID"] = 81;
		["posX"] = 7170;
		["posY"] = -540;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00218"] = {
		["ID"] = 218;
		["actor"] = 2;
		["connectID"] = 81;
		["posX"] = 2820;
		["posY"] = 210;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00219"] = {
		["ID"] = 219;
		["actor"] = 2;
		["posX"] = 3630;
		["posY"] = -630;
		["script"] = "";
		["text"] = "Реплики одноразовые";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00220"] = {
		["ID"] = 220;
		["actor"] = 2;
		["posX"] = 4050;
		["posY"] = -990;
		["script"] = "";
		["text"] = "Финализирует цену на большой, только реплика про эпидемию может изменить цену";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00221"] = {
		["ID"] = 221;
		["actor"] = 2;
		["posX"] = 4050;
		["posY"] = -1260;
		["script"] = "";
		["text"] = "Финализирует цену на минимальной, выключая все остальные реплики";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00222"] = {
		["ID"] = 222;
		["actor"] = 2;
		["posX"] = 4050;
		["posY"] = -720;
		["script"] = "";
		["text"] = "Устанавливает цену на 300, остальные реплики все еще могут изменить цену";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00223"] = {
		["ID"] = 223;
		["actor"] = 2;
		["posX"] = 4050;
		["posY"] = -450;
		["script"] = "";
		["text"] = "Бесполезная попытка";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00224"] = {
		["ID"] = 224;
		["actor"] = 1;
		["connectID"] = 190;
		["posX"] = 4320;
		["posY"] = -1140;
		["script"] = "";
		["text"] = "If only you could see the abori who gave this circuit breaker to you right now. I fear the poor guy won't last another day. What a bitter end — to die in your own bloody vomit and filth.";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00225"] = {
		["ID"] = 225;
		["actor"] = 1;
		["connectID"] = 83;
		["posX"] = 4320;
		["posY"] = -870;
		["script"] = "";
		["text"] = "Without it, production of scrap in the camp will drop significantly and you'll have fewer customers. It's in your interest to give it to me. I'll make sure the crane is fixed and working.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00226"] = {
		["ID"] = 226;
		["actor"] = 1;
		["connectID"] = 199;
		["posX"] = 4320;
		["posY"] = -600;
		["script"] = "";
		["text"] = "I was robbed in the camp. I don't know how this Screw got his hands on it, but if you don't hand it back to me right now, you might look like a dealer of stolen goods.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00228"] = {
		["ID"] = 228;
		["actor"] = 1;
		["connectID"] = 230;
		["posX"] = -2730;
		["posY"] = 1140;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00229"] = {
		["ID"] = 229;
		["actor"] = 1;
		["posX"] = -2340;
		["posY"] = 1050;
		["script"] = "function message:onStart()\
   questSystem:fireEvent(\"buyItemFrom\", \"zaba_the_sweet_talker\")\
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
		["text"] = "Pretend I bought something from you";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00233"] = {
		["ID"] = 233;
		["actor"] = 1;
		["posX"] = -2340;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Bye";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00234"] = {
		["ID"] = 234;
		["actor"] = 2;
		["connectID"] = 232;
		["posX"] = -3120;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00235"] = {
		["ID"] = 235;
		["actor"] = 1;
		["connectID"] = 208;
		["posX"] = -2730;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00236"] = {
		["ID"] = 236;
		["actor"] = 1;
		["connectID"] = 204;
		["posX"] = 4320;
		["posY"] = -330;
		["script"] = "";
		["text"] = "I fear it might have passed onto you already. If you give this device to me, I might be able to dispel the curse.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00237"] = {
		["ID"] = 237;
		["actor"] = 2;
		["connectID"] = 162;
		["posX"] = -630;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "Do you happen to have any problems with potency, huma?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00238"] = {
		["ID"] = 238;
		["actor"] = 2;
		["connectID"] = 181;
		["posX"] = 2940;
		["posY"] = 1530;
		["script"] = "";
		["text"] = "Big Hat and I are alike — we always have to sacrifice ourselves for others!";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00239"] = {
		["ID"] = 239;
		["actor"] = 2;
		["connectID"] = 200;
		["posX"] = 4860;
		["posY"] = -600;
		["script"] = "";
		["text"] = "We live in a democracy and your word means as much as an abori's.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00240"] = {
		["ID"] = 240;
		["actor"] = 2;
		["connectID"] = 155;
		["posX"] = 5670;
		["posY"] = -600;
		["script"] = "";
		["text"] = "So if you want to be reunited with your \"property\", pay up.";
		["time"] = 7;
		["type"] = "message";
	};
	["switch_00040"] = {
		["ID"] = 40;
		["connectionsID"] = {
			[1] = 41;
			[2] = 92;
			[3] = 52;
			[4] = 50;
			[5] = 55;
		};
		["h"] = 140;
		["posX"] = 1110;
		["posY"] = 1500;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00057"] = {
		["ID"] = 57;
		["connectionsID"] = {
			[1] = 185;
			[2] = 58;
		};
		["posX"] = 2490;
		["posY"] = -420;
		["type"] = "switch";
	};
	["switch_00081"] = {
		["ID"] = 81;
		["connectionsID"] = {
			[1] = 84;
			[2] = 82;
			[3] = 86;
			[4] = 203;
			[5] = 102;
			[6] = 213;
			[7] = 214;
			[8] = 104;
			[9] = 90;
		};
		["h"] = 220;
		["posX"] = 3720;
		["posY"] = 30;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00192"] = {
		["ID"] = 192;
		["connectionsID"] = {
			[1] = 193;
			[2] = 105;
		};
		["posX"] = 4320;
		["posY"] = 570;
		["type"] = "switch";
	};
	["switch_00208"] = {
		["ID"] = 208;
		["connectionsID"] = {
			[1] = 0;
			[2] = 69;
		};
		["posX"] = -2160;
		["posY"] = 1530;
		["type"] = "switch";
	};
	["switch_00210"] = {
		["ID"] = 210;
		["connectionsID"] = {
			[1] = 211;
			[2] = 58;
			[3] = 218;
		};
		["posX"] = 1830;
		["posY"] = 60;
		["type"] = "switch";
	};
	["switch_00230"] = {
		["ID"] = 230;
		["connectionsID"] = {
			[1] = 229;
			[2] = 233;
		};
		["posX"] = -2490;
		["posY"] = 1140;
		["type"] = "switch";
	};
	["switch_00232"] = {
		["ID"] = 232;
		["connectionsID"] = {
			[1] = 228;
			[2] = 235;
		};
		["posX"] = -2880;
		["posY"] = 1350;
		["type"] = "switch";
	};
}
return obj1
