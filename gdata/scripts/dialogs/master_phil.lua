-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["posX"] = 1140;
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
		["text"] = "[t_helping_hands:workers]ask about workers";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["posX"] = 1140;
		["posY"] = 330;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["connectID"] = 1;
		["posX"] = 690;
		["posY"] = 480;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = 240;
		["posY"] = 540;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["connectID"] = 9;
		["posX"] = 690;
		["posY"] = 600;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 1;
		["animation"] = "dl_look_down";
		["connectID"] = 11;
		["posX"] = 1410;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Sad sight...";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 2;
		["connectID"] = 12;
		["posX"] = 1680;
		["posY"] = 540;
		["script"] = "";
		["text"] = "An inevitable sight, unfortunately, if the one in charge of the construction is a military meathead.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["connectID"] = 13;
		["posX"] = 1950;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Who are you talking about?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 2220;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Our valiant Captain Castor, of course. He meticulously follows each order to the letter, as if he still serves in the Army of the Alliance. And while his orders do get executed, regular workmen such as those in my crew are getting killed.";
		["time"] = 22.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["connectID"] = 10;
		["posX"] = 1140;
		["posY"] = 540;
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
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 1140;
		["posY"] = 660;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 2640;
		["posY"] = 540;
		["script"] = "";
		["text"] = "I have some questions.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 1;
		["connectID"] = 21;
		["posX"] = 3630;
		["posY"] = -300;
		["script"] = "";
		["text"] = "So you oversee the construction of the road and the bridge?\9";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 3900;
		["posY"] = -300;
		["script"] = "";
		["text"] = "I was, until half of my workers were killed in a skirmish with these bastard Stone Heads. Now I'm on an indefinite leave.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 2;
		["connectID"] = 23;
		["posX"] = 4170;
		["posY"] = -300;
		["script"] = "";
		["text"] = "If someone does not like it - he can take my place, with all the accompanying privileges, including a chance to get a bullet in the head from the other side of the gorge.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["connectID"] = 24;
		["posX"] = 4440;
		["posY"] = -300;
		["script"] = "";
		["text"] = "And what does your boss think about that?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 25;
		["posX"] = 4710;
		["posY"] = -300;
		["script"] = "";
		["text"] = "Man, I'm my own boss! I'm not a corporate slave, but a subcontractor on a one-time contract: I work if and when I want.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 4980;
		["posY"] = -300;
		["script"] = "";
		["text"] = "Let them fat cats from Eastern Road Company first find me a replacement! Someone willing to work in this godforsaken middle of nowhere for a similar fee. Then I can start worrying. But not now.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 2;
		["connectID"] = 27;
		["posX"] = 5250;
		["posY"] = -300;
		["script"] = "";
		["text"] = "I'm sick of these encounters and deaths. While rockheads are poking at us with their stick guns from the other side - I ain't gonna work.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 2;
		["connectID"] = 19;
		["posX"] = 6300;
		["posY"] = -30;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["connectID"] = 29;
		["posX"] = 2640;
		["posY"] = 660;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"helping_hands\", \"workers\")\
end\
\
";
		["text"] = "The warehouse keeper asks for a couple of workers to help him with cargo audit.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 2;
		["connectID"] = 30;
		["posX"] = 2910;
		["posY"] = 660;
		["script"] = "";
		["text"] = "That greedy bastard Eli? You can hardly get an electrode pack from him, let alone something more significant. Well, at least he is better than his predecessor. The last one was willing to sell his own mother for fifty greens in installments.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 1;
		["connectID"] = 31;
		["posX"] = 3180;
		["posY"] = 660;
		["script"] = "";
		["text"] = "So do you send the workers to help Eli or not?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 2;
		["connectID"] = 32;
		["posX"] = 3450;
		["posY"] = 660;
		["script"] = "";
		["text"] = "Oh well, you can take 'em. They are just drinking and playing cards now all the time anyway. At least they could distract themselves from thinking about their dead buddies while they move the the damn crates.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["connectID"] = 33;
		["posX"] = 3720;
		["posY"] = 660;
		["script"] = "";
		["text"] = "[t_helping_hands:workers]Get those that weren't injured near the containers in which they live in the Fort. Tell them I ordered them to work for Eli for the time being.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 1;
		["animation"] = "dl_look_down_long";
		["connectID"] = 34;
		["posX"] = 3990;
		["posY"] = 660;
		["script"] = "";
		["text"] = "Thank you... and... Sorry for your losses.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["animation"] = "dl_righthand_wave_short";
		["connectID"] = 35;
		["posX"] = 4260;
		["posY"] = 660;
		["script"] = "";
		["text"] = "I can almost believe that. And now, if you may, leave me alone.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 4560;
		["posY"] = 660;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 1;
		["posX"] = 2640;
		["posY"] = 780;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 1;
		["connectID"] = 38;
		["posX"] = 3630;
		["posY"] = -180;
		["script"] = "";
		["text"] = "I saw the bridge. Looks impressive... At least half of it. Construction didn't go as planned?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 2;
		["connectID"] = 39;
		["posX"] = 3900;
		["posY"] = -180;
		["script"] = "";
		["text"] = "That's an understatement. It started as it always does with budget cuts. So we had to improvise to build the second half.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 2;
		["connectID"] = 40;
		["posX"] = 4170;
		["posY"] = -180;
		["script"] = "";
		["text"] = "A temporary solution, but steel is steel, and welding is welding: as you can see the bridge stands. Now If it wasn't for the fucking savages who exploded a bomb under the support beams, it would be perfectly leveled!";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00040"] = {
		["ID"] = 40;
		["actor"] = 1;
		["connectID"] = 41;
		["posX"] = 4440;
		["posY"] = -180;
		["script"] = "";
		["text"] = "A bomb? Those aboris seriously tried to blow up the bridge?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 2;
		["connectID"] = 42;
		["posX"] = 4710;
		["posY"] = -180;
		["script"] = "";
		["text"] = "That's right. But they turned out to be worse demolitioners than I'm a ballet dancer. The bridge wasn't destroyed, but half of my crew got decimated by the shrapnel. Fucking savages! May the plague devour them all!";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 1;
		["connectID"] = 43;
		["posX"] = 4980;
		["posY"] = -180;
		["script"] = "";
		["text"] = "Don't you think that this was their plan all along? Not to destroy the bridge but delay the construction by killing workers?";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 2;
		["connectID"] = 44;
		["posX"] = 5250;
		["posY"] = -180;
		["script"] = "";
		["text"] = "If so, then they belong in hell! These savages, the so-called \"traditionalists\", equally hate humans and those of their own kind who have assimilated.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 2;
		["animation"] = "dl_hands_strike";
		["connectID"] = 27;
		["posX"] = 5520;
		["posY"] = -180;
		["script"] = "";
		["text"] = "I would give my left testicle to see how those who laid the bomb hang on the Fort's gate.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 1;
		["connectID"] = 46;
		["posX"] = 3630;
		["posY"] = -60;
		["script"] = "";
		["text"] = "You're not going to continue the construction?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 2;
		["connectID"] = 47;
		["posX"] = 3900;
		["posY"] = -60;
		["script"] = "";
		["text"] = "Oh I will! As soon as the bloody savages get their asses kicked and cease threatening us, I'm going to finish and sign off this damn object!";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 2;
		["connectID"] = 48;
		["posX"] = 4170;
		["posY"] = -60;
		["script"] = "";
		["text"] = "I don't know how, but I'll do it! All these deaths are gonna be in vain otherwise. God fucking damn it! I get a lump in my throat every time I see another goddamn grave!";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 2;
		["connectID"] = 27;
		["posX"] = 4440;
		["posY"] = -60;
		["script"] = "";
		["text"] = "I wasn't educating and rescuing my men from rotting alive in mines for them to end up like this. Not like this...";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 1;
		["animation"] = "dl_hands_dontknow";
		["connectID"] = 51;
		["posX"] = 3630;
		["posY"] = 60;
		["script"] = "";
		["text"] = "Why won't the mercenaries chase them away? With their equipment it would be easy.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 1;
		["animation"] = "dl_count_to_one";
		["connectID"] = 55;
		["posX"] = 3630;
		["posY"] = 180;
		["script"] = "";
		["text"] = "What if the hostile natives stop interfering with the construction. What would you need to get the job done?";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 2;
		["animation"] = "dl_talk_2";
		["connectID"] = 52;
		["posX"] = 3900;
		["posY"] = 60;
		["script"] = "";
		["text"] = "Those rockheads are like cockroaches! You chase away or kill dozens - hundreds come back. Kill a hundred - a thousand will crawl out and then this shit storm will only escalate!";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 2;
		["animation"] = "dl_look_right";
		["connectID"] = 53;
		["posX"] = 4170;
		["posY"] = 60;
		["script"] = "";
		["text"] = "Destroyed infrastructure, decreased quarterly profits, shareholders discontent. No, fat cats of East Road Company won't risk it.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 2;
		["connectID"] = 54;
		["posX"] = 4440;
		["posY"] = 60;
		["script"] = "";
		["text"] = "That's why there won't be a \"fire at will\" order. And without an order captain Castor won't even dare to piss in their general direction, otherwise he can forget about his pension and severance pay.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 2;
		["connectID"] = 27;
		["posX"] = 4710;
		["posY"] = 60;
		["script"] = "";
		["text"] = "So all we can do is sit here and wait for instructions from above, until they kill us all one by one.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 2;
		["connectID"] = 56;
		["posX"] = 3900;
		["posY"] = 180;
		["script"] = "";
		["text"] = "Workers. Installers are fairly easy to train, if we find enough people, but there in that hole are my best welders. Who is going to replace them?";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 2;
		["connectID"] = 57;
		["posX"] = 4170;
		["posY"] = 180;
		["script"] = "";
		["text"] = "Also - the irony - I now need a demolition specialist. There are boulders and debris lying where the road is supposed to be built, and you can't make them go away without explosives.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 2;
		["connectID"] = 58;
		["posX"] = 4440;
		["posY"] = 180;
		["script"] = "";
		["text"] = "As far as I know, we don't have even one demolitions man within hundred kilometers, and even if there was, no one would've agreed to work as long as there is a risk to lose your scalp to the attack of painted savages.";
		["time"] = 22.5;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 2;
		["connectID"] = 27;
		["posX"] = 4710;
		["posY"] = 180;
		["script"] = "";
		["text"] = "I can't find staff in the shortest possible time, and a delay of another month is going to be the final straw - the project is gonna be frozen and then my guys would have died for nothing...";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 1;
		["connectID"] = 60;
		["posX"] = 3630;
		["posY"] = 300;
		["script"] = "";
		["text"] = "You don't seem to hold the mercenaries in high regard.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 2;
		["animation"] = "dl_hand_chopslow";
		["connectID"] = 61;
		["posX"] = 3900;
		["posY"] = 300;
		["script"] = "";
		["text"] = "And why would I? They're just a bunch of rag-tags! Out of this whole gang only the captain and a couple of veterans have some real combat experience.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 2;
		["connectID"] = 62;
		["posX"] = 4170;
		["posY"] = 300;
		["script"] = "";
		["text"] = "And trust me, it doesn't make them good people. The rest comprises of losers and scum, differing from bandits only in having signed a contract.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 2;
		["connectID"] = 63;
		["posX"] = 4440;
		["posY"] = 300;
		["script"] = "";
		["text"] = "The captain and the officers look the other way as long as they have their share. And extortion, looting and plunder are natural skills for this trash. It's in their blood.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 2;
		["animation"] = "dl_hand_negative";
		["connectID"] = 27;
		["posX"] = 4710;
		["posY"] = 300;
		["script"] = "";
		["text"] = "My advice to you, pal, stay away from these \"soldiers of fortune\", find yourself a real craft if you don't want people to spit in your direction.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 1;
		["connectID"] = 35;
		["posX"] = 3630;
		["posY"] = 420;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 2;
			[2] = 3;
		};
		["posX"] = 990;
		["posY"] = 270;
		["type"] = "switch";
	};
	["switch_00004"] = {
		["ID"] = 4;
		["connectionsID"] = {
			[1] = 6;
			[2] = 8;
		};
		["posX"] = 540;
		["posY"] = 540;
		["type"] = "switch";
	};
	["switch_00009"] = {
		["ID"] = 9;
		["connectionsID"] = {
			[1] = 15;
			[2] = 16;
		};
		["posX"] = 990;
		["posY"] = 600;
		["type"] = "switch";
	};
	["switch_00017"] = {
		["ID"] = 17;
		["connectionsID"] = {
			[1] = 18;
			[2] = 28;
			[3] = 36;
		};
		["posX"] = 2490;
		["posY"] = 660;
		["type"] = "switch";
	};
	["switch_00019"] = {
		["ID"] = 19;
		["connectionsID"] = {
			[1] = 20;
			[2] = 37;
			[3] = 45;
			[4] = 49;
			[5] = 50;
			[6] = 59;
			[7] = 64;
		};
		["h"] = 180;
		["posX"] = 3450;
		["posY"] = 0;
		["type"] = "switch";
		["w"] = 100;
	};
}
local obj2 = {
	["actor_prefab"] = {
		[1] = "human_male";
		[2] = "human_male";
	};
}
return obj1 ,obj2
