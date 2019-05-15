-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 1;
		["connectID"] = 1;
		["posX"] = 60;
		["posY"] = 210;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuestTopicVisible(\"broken_crane\", \"screw_at_shop\")\
end\
\
";
		["text"] = "Hey, you, wake up!";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 2;
		["connectID"] = 2;
		["posX"] = 330;
		["posY"] = 210;
		["script"] = "";
		["text"] = "No... no! It's too early, I've only just fallen asleep... It's not my turn to make porridge today...";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 3;
		["posX"] = 600;
		["posY"] = 210;
		["script"] = "";
		["text"] = "What are you mumbling for? Get up now!";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 2;
		["connectID"] = 5;
		["posX"] = 870;
		["posY"] = 210;
		["script"] = "";
		["text"] = "No... no... I won't do the night shift today.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 1;
		["connectID"] = 41;
		["posX"] = 1350;
		["posY"] = 180;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"broken_crane\", \"screw_sweet_joy\")\
end\
\
";
		["text"] = "Where's the circuit breaker, idiot?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["posX"] = 1350;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Leave.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 2;
		["posX"] = 60;
		["posY"] = 60;
		["script"] = "";
		["text"] = "Диалог со спящим аборигеном можно активировать только после того, как рабочий-бригадир ввел Джек в курс дела про предохранитель.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 1;
		["connectID"] = 28;
		["posX"] = 60;
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
		["text"] = "I thought you'd never wake up. Do you remember anything about what happened to you?";
		["time"] = 8.5;
		["topic"] = "broken_crane:screw_at_shop";
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["posX"] = 60;
		["posY"] = 510;
		["script"] = "";
		["text"] = "Ветка Screw в мастерской Скрап мастера.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 25;
		["posX"] = -450;
		["posY"] = 390;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 2;
		["connectID"] = 5;
		["posX"] = 3150;
		["posY"] = 180;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["connectID"] = 29;
		["posX"] = 330;
		["posY"] = 660;
		["script"] = "";
		["text"] = "Almost nothing... except for the fear! I had a dream that terrible demons from the world of spirits were shaking me, biting and kicking! I still have a knot in my stomach just thinking about it!";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["connectID"] = 30;
		["posX"] = 600;
		["posY"] = 660;
		["script"] = "";
		["text"] = "Do you want more of that Sweet Joy?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 2;
		["posX"] = 870;
		["posY"] = 660;
		["script"] = "";
		["text"] = "No way! I'll never touch that junk again! And if you offer it to me again, you'll get a punch in the teeth!";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 1;
		["connectID"] = 32;
		["posX"] = 1890;
		["posY"] = 0;
		["script"] = "";
		["text"] = "Kick him.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["connectID"] = 34;
		["posX"] = 2160;
		["posY"] = 0;
		["script"] = "";
		["text"] = "Leave me alone! I'll... stop drinking... pay my debts... work three shifts... and I'll pray three times a day! Just don't take me to that damn moon! I'm too young to go to hell!";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 1;
		["connectID"] = 35;
		["posX"] = 1350;
		["posY"] = 0;
		["script"] = "";
		["text"] = "Shake him by the shoulder.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 1;
		["connectID"] = 26;
		["posX"] = 2430;
		["posY"] = 0;
		["script"] = "";
		["text"] = "That's no use.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 2;
		["connectID"] = 31;
		["posX"] = 1620;
		["posY"] = 0;
		["script"] = "";
		["text"] = "Nooo! Away, vile creatures! Don't, don't touch me... For the Gods-in-the-Earth, you all stink! I've never smelt anything worse in my life!";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 1;
		["connectID"] = 40;
		["posX"] = 2430;
		["posY"] = 180;
		["script"] = "";
		["text"] = "Tell me where you exchanged it for Sweet Joy, you scumbag!";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 2160;
		["posY"] = 180;
		["script"] = "";
		["text"] = "Mmmm-hmm... Sweet Joy... I need more!";
		["time"] = 4;
		["topic"] = "broken_crane:screw_sweet_joy";
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 1;
		["connectID"] = 37;
		["posX"] = 1890;
		["posY"] = 180;
		["script"] = "";
		["text"] = "More what?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00040"] = {
		["ID"] = 40;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 2700;
		["posY"] = 180;
		["script"] = "";
		["text"] = "Please... just one more piece!";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 2;
		["connectID"] = 38;
		["posX"] = 1620;
		["posY"] = 180;
		["script"] = "";
		["text"] = "Oooh, the circuit breaker! Big... heavy... and so expensive! Come on then... take it! Just give me more...";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 1;
		["connectID"] = 26;
		["posX"] = 2430;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Whatever, I'll leave you here in your own fluids.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 2;
		["connectID"] = 47;
		["posX"] = 1620;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Sweeeeet Deliiiight! Please, give me another piece!";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 2;
		["connectID"] = 42;
		["posX"] = 2160;
		["posY"] = 420;
		["script"] = "";
		["text"] = "I'll get it... I'll get it for you! Please just let me lick the crumbs!";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 1;
		["connectID"] = 43;
		["posX"] = 1350;
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
		["text"] = "Tell me now, who gave you the Sweet Joy in exchange for the circuit breaker?";
		["time"] = 8;
		["topic"] = "broken_crane:screw_sweet_joy_2";
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
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
		["posX"] = 1350;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Активируется после предыдущей ветки.";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 2;
		["connectID"] = 44;
		["posX"] = 1890;
		["posY"] = 420;
		["script"] = "";
		["text"] = "There are loads more valuable parts in the workshop! I know... I saw it: Scrap Master has a stash, for a rainy day...";
		["time"] = 12.5;
		["type"] = "message";
	};
	["switch_00005"] = {
		["ID"] = 5;
		["connectionsID"] = {
			[1] = 33;
			[2] = 7;
			[3] = 45;
			[4] = 8;
		};
		["h"] = 120;
		["posX"] = 1170;
		["posY"] = 210;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00025"] = {
		["ID"] = 25;
		["connectionsID"] = {
			[1] = 0;
			[2] = 19;
		};
		["posX"] = -180;
		["posY"] = 390;
		["type"] = "switch";
	};
}
return obj1
