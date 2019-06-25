-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 1;
		["connectID"] = 319;
		["posX"] = -13740;
		["posY"] = 4620;
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
		["text"] = "Hey, pal, what are you doing here?";
		["time"] = 4.5;
		["topic"] = "broken_crane:cog_intro";
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 1;
		["connectID"] = 58;
		["posX"] = -11130;
		["posY"] = 4980;
		["script"] = "";
		["text"] = "How are you going to catch a shark if the crane is broken?";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 2;
		["posX"] = -11130;
		["posY"] = 4860;
		["script"] = "";
		["text"] = "Джек подошел не взял квест у Скрап мастера. Запись в журнал - я нашел рабочих, которые страдают херней, надо поговорить с их начальством - возможно, я могу извлечь из ситуации пользу.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 2;
		["posX"] = -11130;
		["posY"] = 4560;
		["script"] = "";
		["text"] = "Если взял квест у Скрап мастера.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 2;
		["connectID"] = 181;
		["posX"] = -10860;
		["posY"] = 4980;
		["script"] = "";
		["text"] = "Oh, aren't you sharp-eyed, huma! Don't sweat it, we've got it under control: we'll fix it soon. Now move along, there's nothing to see here.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00070"] = {
		["ID"] = 70;
		["actor"] = 1;
		["connectID"] = 337;
		["posX"] = -11130;
		["posY"] = 4680;
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
		["text"] = "Scrap Master sent me here to sort out the broken crane.";
		["time"] = 6.5;
		["topic"] = "broken_crane:cog_scrap_master_sent_me";
		["type"] = "message";
	};
	["message_00072"] = {
		["ID"] = 72;
		["actor"] = 1;
		["connectID"] = 73;
		["posX"] = -10290;
		["posY"] = 4680;
		["script"] = "";
		["text"] = "I see you're hard at work here. Do you need any help? To speed things up?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00073"] = {
		["ID"] = 73;
		["actor"] = 2;
		["connectID"] = 78;
		["posX"] = -10020;
		["posY"] = 4680;
		["script"] = "";
		["text"] = "Of course we do! Good timing on your part: we really need a bottle of cold booze. All this dust from the desert makes your throat as dry as sand.";
		["time"] = 16;
		["topic"] = "broken_crane:cog_wants_booze";
		["type"] = "message";
	};
	["message_00076"] = {
		["ID"] = 76;
		["actor"] = 2;
		["connectID"] = 72;
		["posX"] = -10560;
		["posY"] = 4680;
		["script"] = "";
		["text"] = "You see, my friend, it's a long and difficult process. First, we need to take it apart, find the problem, replace the broken parts, put it back together, check if it all works, and all while following safety rules...";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00082"] = {
		["ID"] = 82;
		["actor"] = 1;
		["connectID"] = 174;
		["posX"] = -9420;
		["posY"] = 5490;
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
		["text"] = "\\[Give Cold Booze]Here's your booze. I feel you: my throat has been as dry as sandpaper ever since I landed on this planet.";
		["time"] = 12.5;
		["topic"] = "broken_crane:cog_give_booze";
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 1;
		["posX"] = -9420;
		["posY"] = 5640;
		["script"] = "";
		["text"] = "I'll be back later.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00086"] = {
		["ID"] = 86;
		["actor"] = 1;
		["connectID"] = 247;
		["posX"] = -8400;
		["posY"] = 5400;
		["script"] = "";
		["text"] = "That's it! I'm done! I'm going to teach you a lesson. A lesson of working properly and not drinking on duty!";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00087"] = {
		["ID"] = 87;
		["actor"] = 1;
		["connectID"] = 332;
		["posX"] = -8400;
		["posY"] = 5580;
		["script"] = "";
		["text"] = "Guys, don't get smart.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00088"] = {
		["ID"] = 88;
		["actor"] = 2;
		["posX"] = -7890;
		["posY"] = 5400;
		["script"] = "";
		["text"] = "Драка.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00089"] = {
		["ID"] = 89;
		["actor"] = 1;
		["connectID"] = 91;
		["posX"] = -9420;
		["posY"] = 5010;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not self:getParam(\"185\")\
end\
\
";
		["text"] = "Why don't you go to hell with your requests? The best way to get you to work faster is a good punch in the face!";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00090"] = {
		["ID"] = 90;
		["actor"] = 1;
		["posX"] = -8880;
		["posY"] = 5010;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   self:fireDiscussEvent(\"broken_crane:cog_provoke\")\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "You're right, we'll see.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 2;
		["connectID"] = 90;
		["posX"] = -9150;
		["posY"] = 5010;
		["script"] = "";
		["text"] = "Alright, huma, come at me. There are two of us, so we'll see who wins this one!";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00092"] = {
		["ID"] = 92;
		["actor"] = 2;
		["connectID"] = 248;
		["posX"] = -7860;
		["posY"] = 5790;
		["script"] = "";
		["text"] = "Okay, huma, don't get worked up! We went too far, but it's part of our little test. If you'd gone and got us bugs, we'd definitely have told you to screw off. No respect for the spineless.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00094"] = {
		["ID"] = 94;
		["actor"] = 2;
		["posX"] = -8130;
		["posY"] = 5910;
		["script"] = "";
		["text"] = "Нормальный разговор.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00096"] = {
		["ID"] = 96;
		["actor"] = 2;
		["colors"] = {
			[4] = {
				[1] = 0;
				[2] = 128;
				[3] = 255;
				[4] = 255;
			};
			[6] = {
				[1] = 0;
				[2] = 128;
				[3] = 255;
				[4] = 255;
			};
		};
		["posX"] = -7860;
		["posY"] = 5910;
		["script"] = "";
		["text"] = "Брифинг, в котором реально описывается проблема с краном. Неважно бил Джек или купил пива.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00097"] = {
		["ID"] = 97;
		["actor"] = 1;
		["connectID"] = 147;
		["posX"] = -7320;
		["posY"] = 5790;
		["script"] = "";
		["text"] = "Tell me, what's the problem with the crane?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00101"] = {
		["ID"] = 101;
		["actor"] = 1;
		["connectID"] = 102;
		["posX"] = -6510;
		["posY"] = 5790;
		["script"] = "";
		["text"] = "What part are we talking about?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00102"] = {
		["ID"] = 102;
		["actor"] = 2;
		["connectID"] = 103;
		["posX"] = -6240;
		["posY"] = 5790;
		["script"] = "";
		["text"] = "The automatic triple-phase circuit breaker. Without it, the electronics in the crane won't last long.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00103"] = {
		["ID"] = 103;
		["actor"] = 1;
		["connectID"] = 104;
		["posX"] = -5970;
		["posY"] = 5790;
		["script"] = "";
		["text"] = "Who do you think Screw could have palmed your circuit breaker off to?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00104"] = {
		["ID"] = 104;
		["actor"] = 2;
		["connectID"] = 111;
		["posX"] = -5700;
		["posY"] = 5790;
		["script"] = "";
		["text"] = "I have absolutely no idea. You can ask him yourself if you want. We haven't been able to get anything coherent out of that gongo yet.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00111"] = {
		["ID"] = 111;
		["actor"] = 1;
		["connectID"] = 197;
		["posX"] = -5430;
		["posY"] = 5790;
		["script"] = "";
		["text"] = "Alright, I'll sort it.";
		["time"] = 3;
		["topic"] = "broken_crane:cog_briefing";
		["type"] = "message";
	};
	["message_00112"] = {
		["ID"] = 112;
		["actor"] = 2;
		["posX"] = -5430;
		["posY"] = 5640;
		["script"] = "";
		["text"] = "Конец брифинга миссии. Достать изоленту, растолкать аборигена, достать электрический скрап (если бил).";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00145"] = {
		["ID"] = 145;
		["actor"] = 2;
		["posX"] = -9420;
		["posY"] = 5370;
		["script"] = "";
		["text"] = "Бухло есть.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00147"] = {
		["ID"] = 147;
		["actor"] = 2;
		["connectID"] = 148;
		["posX"] = -7050;
		["posY"] = 5790;
		["script"] = "";
		["text"] = "There are two, huma. First off, we need Electrical Tape, and you can't get it in the camp. We can't fix the wires without it because they keep catching fire.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00148"] = {
		["ID"] = 148;
		["actor"] = 2;
		["connectID"] = 101;
		["posX"] = -6780;
		["posY"] = 5790;
		["script"] = "";
		["text"] = "Second, that bastard Screw, the one sleeping like a baby now, exchanged an essential part that Scrap Master gave us for some junk, ate it all and collapsed right on the spot.";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00174"] = {
		["ID"] = 174;
		["actor"] = 2;
		["connectID"] = 246;
		["posX"] = -9150;
		["posY"] = 5490;
		["script"] = "";
		["text"] = "Just what I needed! To you, huma!";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00176"] = {
		["ID"] = 176;
		["actor"] = 2;
		["posX"] = -13740;
		["posY"] = 4500;
		["script"] = "";
		["text"] = "Одноразовая ветка, первый контакт с рабочими аборигенами.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00177"] = {
		["ID"] = 177;
		["actor"] = 2;
		["connectID"] = 178;
		["posX"] = -12930;
		["posY"] = 4890;
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
		["text"] = "Huma, what do you need from us? Leave us alone.";
		["time"] = 6;
		["topic"] = "broken_crane:cog_regular_greeting";
		["type"] = "message";
	};
	["message_00179"] = {
		["ID"] = 179;
		["actor"] = 2;
		["posX"] = -12930;
		["posY"] = 4770;
		["script"] = "";
		["text"] = "Проверка взят ли квест у Скрап мастера.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00181"] = {
		["ID"] = 181;
		["actor"] = 1;
		["posX"] = -10620;
		["posY"] = 5130;
		["script"] = "";
		["text"] = "Don't work too hard.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00183"] = {
		["ID"] = 183;
		["actor"] = 2;
		["posX"] = -8880;
		["posY"] = 4890;
		["script"] = "";
		["text"] = "Драка";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00185"] = {
		["ID"] = 185;
		["actor"] = 1;
		["connectID"] = 186;
		["posX"] = -9420;
		["posY"] = 5190;
		["script"] = "function message:onStart()\
   self:setParam(\"185\", true)\
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
		["text"] = "Why don't you have some water instead?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00186"] = {
		["ID"] = 186;
		["actor"] = 2;
		["connectID"] = 336;
		["posX"] = -9150;
		["posY"] = 5190;
		["script"] = "";
		["text"] = "Why would a self-respecting abori drink water at work? Water's bad for you, it's full of crap!";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00188"] = {
		["ID"] = 188;
		["actor"] = 2;
		["connectID"] = 189;
		["posX"] = -8670;
		["posY"] = 5190;
		["script"] = "";
		["text"] = "As you can see, huma, we can't work properly without cold booze.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00189"] = {
		["ID"] = 189;
		["actor"] = 1;
		["connectID"] = 190;
		["posX"] = -8400;
		["posY"] = 5190;
		["script"] = "";
		["text"] = "Let's suppose I respect your local customs and might treat you. But where can I find cold booze?";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00190"] = {
		["ID"] = 190;
		["actor"] = 2;
		["connectID"] = 78;
		["posX"] = -8130;
		["posY"] = 5190;
		["script"] = "";
		["text"] = "At Braga's, on the traders' square. You'll find it with your eyes closed — just follow the smell. Get two bottles — for me and my mate Nut.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00192"] = {
		["ID"] = 192;
		["actor"] = 2;
		["connectID"] = 78;
		["posX"] = -12930;
		["posY"] = 5370;
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
		["text"] = "Our huma is back! So, did you get the booze?";
		["time"] = 6;
		["topic"] = "broken_crane:cog_waits_booze";
		["type"] = "message";
	};
	["message_00193"] = {
		["ID"] = 193;
		["actor"] = 2;
		["posX"] = -12930;
		["posY"] = 5250;
		["script"] = "";
		["text"] = "Когда узнал про бухло, не дал его им и не побил, просто вышел из диалога.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00195"] = {
		["ID"] = 195;
		["actor"] = 2;
		["connectID"] = 212;
		["posX"] = -5010;
		["posY"] = 5730;
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
		["text"] = "Oh yeah, I almost forgot: we need five more pieces of electronic scrap. But you got us some decent booze, so I guess we can sort the scrap ourselves.";
		["time"] = 15.5;
		["topic"] = "broken_crane:cog_got_booze";
		["type"] = "message";
	};
	["message_00196"] = {
		["ID"] = 196;
		["actor"] = 2;
		["connectID"] = 202;
		["posX"] = -5010;
		["posY"] = 5880;
		["script"] = "";
		["text"] = "Yeah, I almost forgot. We need five more pieces of electronic scrap. Ours has run out.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00199"] = {
		["ID"] = 199;
		["actor"] = 1;
		["connectID"] = 201;
		["posX"] = -12930;
		["posY"] = 5820;
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
		["text"] = "So, let's talk business now? Or do you need another lesson?";
		["time"] = 6.5;
		["topic"] = "broken_crane:cog_after_fight";
		["type"] = "message";
	};
	["message_00200"] = {
		["ID"] = 200;
		["actor"] = 2;
		["posX"] = -12930;
		["posY"] = 5670;
		["script"] = "";
		["text"] = "Джек избил аборигенов.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00201"] = {
		["ID"] = 201;
		["actor"] = 2;
		["connectID"] = 97;
		["posX"] = -12660;
		["posY"] = 5820;
		["script"] = "";
		["text"] = "No more, huma! We got it. We ain't retarded to mess with you again.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00202"] = {
		["ID"] = 202;
		["actor"] = 1;
		["posX"] = -4740;
		["posY"] = 5880;
		["script"] = "";
		["text"] = "Some parts are missing, one is God knows where: no wonder the camp is in chaos. Whatever, I'll get the scrap too, then.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00204"] = {
		["ID"] = 204;
		["actor"] = 1;
		["connectID"] = 206;
		["posX"] = -11310;
		["posY"] = 8280;
		["script"] = "";
		["text"] = "I promised to deliver all three of you to the Scrap Master. What are we going to do about sleeping beauty? Will you carry him?";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00206"] = {
		["ID"] = 206;
		["actor"] = 2;
		["posX"] = -11040;
		["posY"] = 8280;
		["script"] = "";
		["text"] = "We're not his nannies. He'll find his own way once he comes to his senses.";
		["time"] = 8.5;
		["topic"] = "broken_crane:cog_go_to_shop";
		["type"] = "message";
	};
	["message_00207"] = {
		["ID"] = 207;
		["actor"] = 2;
		["connectID"] = 210;
		["posX"] = -12930;
		["posY"] = 8280;
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
		["text"] = "Well, looks pretty much done. I hope it'll stand for another week or two without breaking.";
		["time"] = 9;
		["topic"] = "broken_crane:cog_repaired";
		["type"] = "message";
	};
	["message_00208"] = {
		["ID"] = 208;
		["actor"] = 2;
		["connectID"] = 204;
		["posX"] = -11580;
		["posY"] = 8280;
		["script"] = "";
		["text"] = "Ugh, into that heat again... I should've become a guard when I had the chance.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00210"] = {
		["ID"] = 210;
		["actor"] = 1;
		["connectID"] = 340;
		["posX"] = -12660;
		["posY"] = 8280;
		["script"] = "";
		["text"] = "Couldn't you do any better?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00211"] = {
		["ID"] = 211;
		["actor"] = 1;
		["connectID"] = 208;
		["posX"] = -11850;
		["posY"] = 8280;
		["script"] = "";
		["text"] = "Okay, go to the workshop.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00212"] = {
		["ID"] = 212;
		["actor"] = 1;
		["posX"] = -4740;
		["posY"] = 5730;
		["script"] = "";
		["text"] = "Well, thanks. At least I won't have to go digging through that junk.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00213"] = {
		["ID"] = 213;
		["actor"] = 2;
		["posX"] = -4440;
		["posY"] = 5790;
		["script"] = "";
		["text"] = "Конец брифинга квеста. Выход из диалога.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00220"] = {
		["ID"] = 220;
		["actor"] = 2;
		["posX"] = -11040;
		["posY"] = 8160;
		["script"] = "";
		["text"] = "Двое аборигенов медленно идут в мастерскую, встают к рабочим столам и начинают заниматься делами. Третий остается лежать, спустя время респавниться в мастерской и тоже работает.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00224"] = {
		["ID"] = 224;
		["actor"] = 2;
		["colors"] = {
			[4] = {
				[1] = 255;
				[2] = 0;
				[3] = 0;
				[4] = 255;
			};
			[6] = {
				[1] = 255;
				[2] = 0;
				[3] = 0;
				[4] = 255;
			};
		};
		["posX"] = -12930;
		["posY"] = 8130;
		["script"] = "";
		["text"] = "Обсудить с Михаилом. Данная ветка, должна, когда рабочие починил кран и Джек первый раз к ним подходит.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00239"] = {
		["ID"] = 239;
		["actor"] = 1;
		["connectID"] = 241;
		["posX"] = -12930;
		["posY"] = 8670;
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
		["text"] = "So, hard at work?";
		["time"] = 3;
		["topic"] = "broken_crane:cog_at_shop";
		["type"] = "message";
	};
	["message_00240"] = {
		["ID"] = 240;
		["actor"] = 2;
		["posX"] = -12930;
		["posY"] = 8520;
		["script"] = "";
		["text"] = "Ветка с Cog, когда он находится в мастерской у Скрап мастера.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00241"] = {
		["ID"] = 241;
		["actor"] = 2;
		["connectID"] = 341;
		["posX"] = -12660;
		["posY"] = 8670;
		["script"] = "";
		["text"] = "Got our hands full as usual, huma. We should've spent longer \"fixing\" the crane.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00245"] = {
		["ID"] = 245;
		["actor"] = 2;
		["posX"] = -9150;
		["posY"] = 5370;
		["script"] = "";
		["text"] = "Анимация распития с бутылкой.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00246"] = {
		["ID"] = 246;
		["actor"] = 2;
		["connectID"] = 85;
		["posX"] = -8880;
		["posY"] = 5490;
		["script"] = "";
		["text"] = "Oh, and some roasted bugs wouldn't go amiss right about now. Do us a favour, huma, be so kind as to get us some!";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00247"] = {
		["ID"] = 247;
		["actor"] = 2;
		["posX"] = -8130;
		["posY"] = 5400;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   self:fireDiscussEvent(\"broken_crane:cog_provoke\")\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "It all started so well! Now I'll have to knock your teeth out.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00248"] = {
		["ID"] = 248;
		["actor"] = 1;
		["connectID"] = 97;
		["posX"] = -7590;
		["posY"] = 5790;
		["script"] = "";
		["text"] = "Okay, we're square. You're lucky this huma doesn't hold a grudge. Now let's get down to business.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00251"] = {
		["ID"] = 251;
		["actor"] = 2;
		["connectID"] = 252;
		["posX"] = -12930;
		["posY"] = 6840;
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
		["text"] = "Well, huma, have you got the parts?";
		["time"] = 4.5;
		["topic"] = "broken_crane:cog_about_crane";
		["type"] = "message";
	};
	["message_00254"] = {
		["ID"] = 254;
		["actor"] = 2;
		["posX"] = -12090;
		["posY"] = 7800;
		["script"] = "";
		["text"] = "No work then.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00255"] = {
		["ID"] = 255;
		["actor"] = 1;
		["connectID"] = 254;
		["posX"] = -12360;
		["posY"] = 7800;
		["script"] = "";
		["text"] = "Not yet.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00256"] = {
		["ID"] = 256;
		["actor"] = 1;
		["connectID"] = 258;
		["posX"] = -12360;
		["posY"] = 6210;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"broken_crane\", \"cog_give_parts\")\
end\
\
";
		["text"] = "I've brought you all the parts.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00257"] = {
		["ID"] = 257;
		["actor"] = 1;
		["connectID"] = 338;
		["posX"] = -11280;
		["posY"] = 6210;
		["script"] = "";
		["text"] = "Can't you do it any faster? You've wasted enough time already.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00258"] = {
		["ID"] = 258;
		["actor"] = 2;
		["connectID"] = 261;
		["posX"] = -12090;
		["posY"] = 6210;
		["script"] = "";
		["text"] = "I didn't expect anything less. Give them here.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00259"] = {
		["ID"] = 259;
		["actor"] = 2;
		["posX"] = -10470;
		["posY"] = 6210;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   --Fire at stop so nut wouldn't start patrol before cog\
   self:fireDiscussEvent(\"broken_crane:cog_start_repair\")\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Hey Nut, jaga baha work, or this huma will drill a hole in my head!";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00260"] = {
		["ID"] = 260;
		["actor"] = 2;
		["connectID"] = 257;
		["posX"] = -11550;
		["posY"] = 6210;
		["script"] = "";
		["text"] = "Considering that Nut and I will have to work on behalf of this sleeping beauty, I'd say two days.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00261"] = {
		["ID"] = 261;
		["actor"] = 1;
		["connectID"] = 260;
		["posX"] = -11820;
		["posY"] = 6210;
		["script"] = "";
		["text"] = "How long will it take you?";
		["time"] = 4;
		["topic"] = "broken_crane:cog_give_parts";
		["type"] = "message";
	};
	["message_00262"] = {
		["ID"] = 262;
		["actor"] = 2;
		["connectID"] = 259;
		["posX"] = -10740;
		["posY"] = 6210;
		["script"] = "";
		["text"] = "Fine, huma, chill. 24 hours it is.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00264"] = {
		["ID"] = 264;
		["actor"] = 2;
		["posX"] = -12360;
		["posY"] = 6090;
		["script"] = "";
		["text"] = "Проверка инвентаря на наличие всех необходимых предметов (с учетом того нужен скрап или нет).";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00265"] = {
		["ID"] = 265;
		["actor"] = 1;
		["connectID"] = 271;
		["posX"] = -11640;
		["posY"] = 7350;
		["script"] = "";
		["text"] = "I see.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00266"] = {
		["ID"] = 266;
		["actor"] = 2;
		["connectID"] = 265;
		["posX"] = -11910;
		["posY"] = 7290;
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
		["text"] = "We use our own scrap, huma. And you need to get some Electrical Tape (2) and one automatic triple-phase circuit breaker.";
		["time"] = 11.5;
		["topic"] = "broken_crane:cog_got_booze";
		["type"] = "message";
	};
	["message_00268"] = {
		["ID"] = 268;
		["actor"] = 2;
		["connectID"] = 265;
		["posX"] = -11910;
		["posY"] = 7410;
		["script"] = "";
		["text"] = "We need Electric Scrap (5), Electrical Tape (2), and one automatic triple-phase circuit breaker.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00269"] = {
		["ID"] = 269;
		["actor"] = 2;
		["posX"] = -11910;
		["posY"] = 7140;
		["script"] = "";
		["text"] = "Проверка на бил или купил пиво. Если был, скрп засчет Джека.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00270"] = {
		["ID"] = 270;
		["actor"] = 1;
		["connectID"] = 267;
		["posX"] = -12360;
		["posY"] = 7350;
		["script"] = "";
		["text"] = "Tell me again, what do I need to fix the crane?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00271"] = {
		["ID"] = 271;
		["actor"] = 2;
		["connectID"] = 252;
		["posX"] = -9120;
		["posY"] = 6990;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00272"] = {
		["ID"] = 272;
		["actor"] = 2;
		["posX"] = -11280;
		["posY"] = 6540;
		["script"] = "";
		["text"] = "Двое аборигенов медленно идут в мастерскую, встают к рабочим столам и начинают заниматься делами. Третий остается лежать, спустя время респавниться в мастерской и тоже работает.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00273"] = {
		["ID"] = 273;
		["actor"] = 2;
		["posX"] = -11280;
		["posY"] = 6660;
		["script"] = "";
		["text"] = "We're not his nannies. He'll find his own way once he comes to his senses.";
		["time"] = 8.5;
		["topic"] = "broken_crane:cog_go_to_shop";
		["type"] = "message";
	};
	["message_00274"] = {
		["ID"] = 274;
		["actor"] = 1;
		["connectID"] = 278;
		["posX"] = -11820;
		["posY"] = 6660;
		["script"] = "";
		["text"] = "Yeah, I know, if you had your way, you'd spend a few more days \"working\" in the fresh air. Stop whining and get back to the workshop.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00276"] = {
		["ID"] = 276;
		["actor"] = 1;
		["connectID"] = 277;
		["posX"] = -12360;
		["posY"] = 6660;
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
		["text"] = "I fixed the crane myself. Stop slacking and go to the workshop.";
		["time"] = 7;
		["topic"] = "broken_crane:cog_self_repair_full";
		["type"] = "message";
	};
	["message_00277"] = {
		["ID"] = 277;
		["actor"] = 2;
		["connectID"] = 274;
		["posX"] = -12090;
		["posY"] = 6660;
		["script"] = "";
		["text"] = "Why were you bothering us when you could have just done it yourself? Damn, now we'll have to slave away day and night at the workshop again.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00278"] = {
		["ID"] = 278;
		["actor"] = 1;
		["connectID"] = 273;
		["posX"] = -11550;
		["posY"] = 6660;
		["script"] = "";
		["text"] = "What are we doing with sleeping beauty, by the way? Will you carry him?";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00280"] = {
		["ID"] = 280;
		["actor"] = 1;
		["connectID"] = 285;
		["posX"] = -11820;
		["posY"] = 6960;
		["script"] = "";
		["text"] = "I'm afraid we won't get anything out of him. It'll be a miracle if he even wakes up normal. I suggest you think about who could have sold this Joy to him. Otherwise we're not getting the circuit breaker or any other parts.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00281"] = {
		["ID"] = 281;
		["actor"] = 2;
		["posX"] = -12360;
		["posY"] = 6840;
		["script"] = "";
		["text"] = "Проверка юзал ли спящего рабочего после брифинга и записи в журнал. Ветка про сладкую радость.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00282"] = {
		["ID"] = 282;
		["actor"] = 1;
		["connectID"] = 284;
		["posX"] = -11550;
		["posY"] = 7590;
		["script"] = "";
		["text"] = "Yeah, guys, sorry for ruining your nice little holiday.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00283"] = {
		["ID"] = 283;
		["actor"] = 1;
		["connectID"] = 289;
		["posX"] = -12360;
		["posY"] = 7590;
		["script"] = "";
		["text"] = "Why are you sitting here if you can't fix the crane? Why don't you ask Scrap Master for help?";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00284"] = {
		["ID"] = 284;
		["actor"] = 2;
		["connectID"] = 286;
		["posX"] = -11280;
		["posY"] = 7590;
		["script"] = "";
		["text"] = "Just don't rush, choose the parts carefully or they'll sell you broken junk.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00285"] = {
		["ID"] = 285;
		["actor"] = 2;
		["connectID"] = 345;
		["posX"] = -11550;
		["posY"] = 6960;
		["script"] = "";
		["text"] = "I'm no expert when it comes to these things, huma, but I know one thing for sure — it's rare and expensive stuff. It's not easy to come across in our camp.";
		["time"] = 17;
		["topic"] = "broken_crane:cog_sweet_joy";
		["type"] = "message";
	};
	["message_00286"] = {
		["ID"] = 286;
		["actor"] = 1;
		["connectID"] = 271;
		["posX"] = -11010;
		["posY"] = 7590;
		["script"] = "";
		["text"] = "Yeah... A leopard can't change its spots.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00287"] = {
		["ID"] = 287;
		["actor"] = 1;
		["connectID"] = 288;
		["posX"] = -12360;
		["posY"] = 6960;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"broken_crane\", \"cog_sweet_joy\")\
end\
\
";
		["text"] = "Your pal is muttering something about Sweet Joy. What is it?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00288"] = {
		["ID"] = 288;
		["actor"] = 2;
		["connectID"] = 280;
		["posX"] = -12090;
		["posY"] = 6960;
		["script"] = "";
		["text"] = "I knew it! Sweet Joy is a drug. And a very expensive one at that. He probably exchanged the part for it, stupid madron.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00289"] = {
		["ID"] = 289;
		["actor"] = 2;
		["connectID"] = 339;
		["posX"] = -12090;
		["posY"] = 7590;
		["script"] = "";
		["text"] = "What do you think, huma? The old man will kick our asses for losing the circuit breaker. He'll make us work three shifts. It's so hot in that workshop, and the stench is unbearable.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00293"] = {
		["ID"] = 293;
		["actor"] = 2;
		["colors"] = {
			[4] = {
				[1] = 0;
				[2] = 128;
				[3] = 255;
				[4] = 255;
			};
			[6] = {
				[1] = 0;
				[2] = 128;
				[3] = 255;
				[4] = 255;
			};
		};
		["posX"] = -12930;
		["posY"] = 6690;
		["script"] = "";
		["text"] = "Главный хаб по квесту с краном";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00315"] = {
		["ID"] = 315;
		["actor"] = 2;
		["connectID"] = 342;
		["posX"] = -12390;
		["posY"] = 4620;
		["script"] = "";
		["text"] = "Maybe we are, why do you care?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00316"] = {
		["ID"] = 316;
		["actor"] = 2;
		["connectID"] = 317;
		["posX"] = -12930;
		["posY"] = 4620;
		["script"] = "";
		["text"] = "As usual here. You need to wait and stay still if you don't want to scare it away.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00317"] = {
		["ID"] = 317;
		["actor"] = 1;
		["connectID"] = 315;
		["posX"] = -12660;
		["posY"] = 4620;
		["script"] = "";
		["text"] = "I feel like you're messing with me. You're slacking off.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00318"] = {
		["ID"] = 318;
		["actor"] = 1;
		["connectID"] = 316;
		["posX"] = -13200;
		["posY"] = 4620;
		["script"] = "";
		["text"] = "And how's it going?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00319"] = {
		["ID"] = 319;
		["actor"] = 2;
		["connectID"] = 318;
		["posX"] = -13470;
		["posY"] = 4620;
		["script"] = "";
		["text"] = "Are you blind, huma? Can't you see? We're trying to catch a sandshark.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00322"] = {
		["ID"] = 322;
		["actor"] = 2;
		["connectID"] = 325;
		["posX"] = -15240;
		["posY"] = 6060;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00323"] = {
		["ID"] = 323;
		["actor"] = 1;
		["posX"] = -14430;
		["posY"] = 5970;
		["script"] = "";
		["text"] = "Bye";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00324"] = {
		["ID"] = 324;
		["actor"] = 1;
		["posX"] = -14430;
		["posY"] = 5370;
		["script"] = "function message:onStart()\
   addItemToPlayer(\"booze_cold.itm\", 2)\
   self:fireDiscussEvent(\"broken_crane:cog_intro\")\
   self:fireDiscussEvent(\"broken_crane:cog_scrap_master_sent_me\")\
   self:fireDiscussEvent(\"broken_crane:cog_wants_booze\")\
   self:fireDiscussEvent(\"broken_crane:cog_give_booze\")\
   self:fireDiscussEvent(\"broken_crane:cog_briefing\")\
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
		["text"] = "\\[booze]Brief broken crane";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00326"] = {
		["ID"] = 326;
		["actor"] = 1;
		["connectID"] = 292;
		["posX"] = -14850;
		["posY"] = 6240;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00327"] = {
		["ID"] = 327;
		["actor"] = 1;
		["connectID"] = 321;
		["posX"] = -14850;
		["posY"] = 5850;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00328"] = {
		["ID"] = 328;
		["actor"] = 1;
		["posX"] = -14430;
		["posY"] = 5520;
		["script"] = "function message:onStart()\
   addItemToPlayer(\"booze_cold.itm\", 2)\
   self:fireDiscussEvent(\"broken_crane:cog_intro\")\
   self:fireDiscussEvent(\"broken_crane:cog_scrap_master_sent_me\")\
   self:fireDiscussEvent(\"broken_crane:cog_wants_booze\")\
   self:fireDiscussEvent(\"broken_crane:cog_briefing\")\
   self:fireDiscussEvent(\"broken_crane:cog_give_booze\")\
   runTimer(0.1, nil, function()\
      getQuest(\"broken_crane\"):setTopicVisible(\"cog_got_booze\", false)\
   end, false)\
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
		["text"] = "\\[fight]Brief broken crane";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00329"] = {
		["ID"] = 329;
		["actor"] = 1;
		["connectID"] = 330;
		["posX"] = -12360;
		["posY"] = 6390;
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
		["text"] = "I've fixed a few things, can you finish it yourselves?";
		["time"] = 6;
		["topic"] = "broken_crane:cog_self_repair";
		["type"] = "message";
	};
	["message_00330"] = {
		["ID"] = 330;
		["actor"] = 2;
		["connectID"] = 271;
		["posX"] = -12090;
		["posY"] = 6390;
		["script"] = "";
		["text"] = "No, huma, that's not how it works. There's nothing worse than finishing someone else's job. If you started it, you finish it. Besides, if this pile of junk catches fire again, I'd rather have Scrap Master curse you instead of us.";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00331"] = {
		["ID"] = 331;
		["actor"] = 1;
		["posX"] = -14430;
		["posY"] = 5820;
		["script"] = "function message:onStart()\
   self:fireDiscussEvent(\"broken_crane:screw_sweet_joy\")\
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
		["text"] = "Sweet joy, look for traders";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00332"] = {
		["ID"] = 332;
		["actor"] = 1;
		["connectID"] = 92;
		["posX"] = -8130;
		["posY"] = 5580;
		["script"] = "";
		["text"] = "I've treated you well, but I can do things the hard way. I thought you were hard workers, not just a bunch of slobs and liars. For the likes of you, I have something better than words.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00333"] = {
		["ID"] = 333;
		["actor"] = 1;
		["connectID"] = 91;
		["posX"] = -9420;
		["posY"] = 4830;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"185\")\
end\
\
";
		["text"] = "I've changed my mind, you're not getting any booze. Instead I'll punch your lazy faces.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00334"] = {
		["ID"] = 334;
		["actor"] = 2;
		["colors"] = {
			[4] = {
				[1] = 255;
				[2] = 128;
				[3] = 0;
				[4] = 255;
			};
			[6] = {
				[1] = 255;
				[2] = 128;
				[3] = 0;
				[4] = 255;
			};
		};
		["posX"] = -9420;
		["posY"] = 4710;
		["script"] = "";
		["text"] = "Отображается в том случае, когда сначала прогрывается ветка с нодой 185, а потом игрок возвращается в диалог с Когом. Либо после первой итерации меняется текст ноды 185.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00335"] = {
		["ID"] = 335;
		["actor"] = 1;
		["posX"] = -14430;
		["posY"] = 5670;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   self:fireDiscussEvent(\"broken_crane:cog_intro\")\
   self:fireDiscussEvent(\"broken_crane:cog_scrap_master_sent_me\")\
   self:fireDiscussEvent(\"broken_crane:cog_wants_booze\")\
   self:fireDiscussEvent(\"broken_crane:cog_provoke\")\
end\
\
function message:isVisible()\
   return self:isFirstTime()\
end\
\
";
		["text"] = "Provoke";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00336"] = {
		["ID"] = 336;
		["actor"] = 2;
		["connectID"] = 188;
		["posX"] = -8910;
		["posY"] = 5190;
		["script"] = "";
		["text"] = "Distilled booze straight from the cooler, on the other hand, nurtures both your soul and body, and is rich in vitamins!";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00337"] = {
		["ID"] = 337;
		["actor"] = 1;
		["connectID"] = 76;
		["posX"] = -10860;
		["posY"] = 4680;
		["script"] = "";
		["text"] = "Why is the crane still not working?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00338"] = {
		["ID"] = 338;
		["actor"] = 1;
		["connectID"] = 262;
		["posX"] = -11010;
		["posY"] = 6210;
		["script"] = "";
		["text"] = "You've got 24 hours or you can explain it to Scrap Master yourselves.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00339"] = {
		["ID"] = 339;
		["actor"] = 2;
		["connectID"] = 282;
		["posX"] = -11820;
		["posY"] = 7590;
		["script"] = "";
		["text"] = "Here at least there's fresh air and you can get a good night's sleep. We would've been fixing it for weeks if you hadn't showed up.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00340"] = {
		["ID"] = 340;
		["actor"] = 2;
		["connectID"] = 346;
		["posX"] = -12390;
		["posY"] = 8280;
		["script"] = "";
		["text"] = "Everything in our camp is held together by spit and prayer, huma. You fix one thing and something else falls apart. We're lucky no one got electrocuted this time.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00341"] = {
		["ID"] = 341;
		["actor"] = 2;
		["posX"] = -12390;
		["posY"] = 8670;
		["script"] = "";
		["text"] = "We'd be sitting in the shade and fresh air now, not sweating in this iron box...";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00342"] = {
		["ID"] = 342;
		["actor"] = 1;
		["connectID"] = 343;
		["posX"] = -12120;
		["posY"] = 4620;
		["script"] = "";
		["text"] = "I don't. You can slack off for as long as you like.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00343"] = {
		["ID"] = 343;
		["actor"] = 2;
		["connectID"] = 344;
		["posX"] = -11850;
		["posY"] = 4620;
		["script"] = "";
		["text"] = "Then get on your way. We're just a bunch of honest workers taking a well-earned break.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00344"] = {
		["ID"] = 344;
		["actor"] = 1;
		["connectID"] = 53;
		["posX"] = -11580;
		["posY"] = 4620;
		["script"] = "";
		["text"] = "Just don't overdo it, or all three of you might end up lying in your own vomit like that poor guy over there.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00345"] = {
		["ID"] = 345;
		["actor"] = 2;
		["connectID"] = 271;
		["posX"] = -11280;
		["posY"] = 6960;
		["script"] = "";
		["text"] = "This son of a sandflea and slimetoad got himself loaded even though hardly anyone from the camp has enough greenies to buy more than one dose... apart from maybe the traders? Yeah, go and ask them.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00346"] = {
		["ID"] = 346;
		["actor"] = 2;
		["connectID"] = 211;
		["posX"] = -12120;
		["posY"] = 8280;
		["script"] = "";
		["text"] = "That's our life — paycheck to paycheck, fix to fix. With the odd funeral. Cold booze is the only thing that saves us.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["switch_00053"] = {
		["ID"] = 53;
		["connectionsID"] = {
			[1] = 70;
			[2] = 54;
		};
		["posX"] = -11310;
		["posY"] = 4620;
		["type"] = "switch";
	};
	["switch_00078"] = {
		["ID"] = 78;
		["connectionsID"] = {
			[1] = 333;
			[2] = 89;
			[3] = 185;
			[4] = 82;
			[5] = 83;
		};
		["h"] = 140;
		["posX"] = -9630;
		["posY"] = 5310;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00085"] = {
		["ID"] = 85;
		["connectionsID"] = {
			[1] = 86;
			[2] = 87;
		};
		["posX"] = -8610;
		["posY"] = 5490;
		["type"] = "switch";
	};
	["switch_00178"] = {
		["ID"] = 178;
		["connectionsID"] = {
			[1] = 70;
			[2] = 181;
		};
		["posX"] = -12660;
		["posY"] = 4890;
		["type"] = "switch";
	};
	["switch_00197"] = {
		["ID"] = 197;
		["connectionsID"] = {
			[1] = 195;
			[2] = 196;
		};
		["posX"] = -5190;
		["posY"] = 5790;
		["type"] = "switch";
	};
	["switch_00252"] = {
		["ID"] = 252;
		["connectionsID"] = {
			[1] = 256;
			[2] = 329;
			[3] = 276;
			[4] = 287;
			[5] = 270;
			[6] = 283;
			[7] = 255;
		};
		["h"] = 180;
		["posX"] = -12600;
		["posY"] = 6810;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00267"] = {
		["ID"] = 267;
		["connectionsID"] = {
			[1] = 266;
			[2] = 268;
		};
		["posX"] = -12090;
		["posY"] = 7350;
		["type"] = "switch";
	};
	["switch_00292"] = {
		["ID"] = 292;
		["connectionsID"] = {
			[1] = 47;
			[2] = 177;
			[3] = 192;
			[4] = 199;
			[5] = 251;
			[6] = 207;
			[7] = 239;
		};
		["h"] = 180;
		["posX"] = -14220;
		["posY"] = 6210;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00321"] = {
		["ID"] = 321;
		["connectionsID"] = {
			[1] = 324;
			[2] = 328;
			[3] = 335;
			[4] = 331;
			[5] = 323;
		};
		["h"] = 140;
		["posX"] = -14610;
		["posY"] = 5820;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00325"] = {
		["ID"] = 325;
		["connectionsID"] = {
			[1] = 327;
			[2] = 326;
		};
		["posX"] = -15000;
		["posY"] = 6060;
		["type"] = "switch";
	};
}
return obj1
