-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 2;
		["connectID"] = 9;
		["posX"] = -480;
		["posY"] = 180;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["posX"] = 330;
		["posY"] = -60;
		["script"] = "";
		["text"] = "Bye";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["connectID"] = 90;
		["posX"] = 0;
		["posY"] = 240;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["connectID"] = 3;
		["posX"] = -90;
		["posY"] = -180;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["connectID"] = 540;
		["posX"] = 3090;
		["posY"] = -1320;
		["script"] = "";
		["text"] = "Could you please bring me my staff? The bastards threw it away, but it should be somewhere nearby.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 1;
		["animation"] = "dl_head_nod";
		["connectID"] = 123;
		["posX"] = 2040;
		["posY"] = -480;
		["script"] = "";
		["text"] = "Yeah, right. Any ideas?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["connectID"] = 128;
		["posX"] = 1620;
		["posY"] = -480;
		["script"] = "";
		["text"] = "I could make you some basic clothes from rags, but that won't be much better than yours. Let me know if you're down to try and get yourself a decent outfit.";
		["time"] = 16.5;
		["topic"] = "junk_clothes:herbalist_skip";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 1;
		["animation"] = "dl_head_scratch";
		["connectID"] = 45;
		["posX"] = 2700;
		["posY"] = -420;
		["script"] = "";
		["text"] = "Hm...";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 57;
		["posX"] = 2700;
		["posY"] = -570;
		["script"] = "";
		["text"] = "\\[Give 2 Cloth]I have this.";
		["time"] = 3.5;
		["topic"] = "junk_clothes:herbalist_give_cloth";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 1;
		["animation"] = "dl_head_shake";
		["connectID"] = 61;
		["posX"] = 2340;
		["posY"] = 510;
		["script"] = "";
		["text"] = "Not yet.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 1;
		["connectID"] = 40;
		["posX"] = 1620;
		["posY"] = 750;
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
		["text"] = "I'm fine, thanks. I watched all the episodes of \"Surviving On Wild Planets Naked And Without One Leg\" by Grear Bylls on holovision.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 1;
		["connectID"] = 41;
		["posX"] = 1620;
		["posY"] = 630;
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
		["text"] = "What about weapons? I wouldn't say no to a gun.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00040"] = {
		["ID"] = 40;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 1860;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Oh, well, in that case I think you'll figure it out for yourself. Good luck on your way, huma. I'll be here for a while, if you change your mind.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 2;
		["connectID"] = 48;
		["posX"] = 1860;
		["posY"] = 630;
		["script"] = "";
		["text"] = "Me neither, but it's not easy to find guns in here. I would've made you a good knife, but that requires materials and tools. If I were you I wouldn't rely on some metal trash - it either breaks or backfires on you.";
		["time"] = 22.5;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 1;
		["posX"] = 1620;
		["posY"] = 870;
		["script"] = "";
		["text"] = "Gotta go.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 1;
		["animation"] = "dl_hands_dontknow";
		["connectID"] = 46;
		["posX"] = 2340;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Where can I get it?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 2580;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Look through the piles of garbage around here. Other outcasts might have some too. They're unlikely to share it with you though.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = 2100;
		["posY"] = 630;
		["script"] = "";
		["text"] = "Better snap off a suitable branch from a Pain Cactus. They grow everywhere. If it breaks, you can always use it for a torch or as firewood.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 2;
		["connectID"] = 47;
		["posX"] = 1860;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Do you have it?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 2;
		["connectID"] = 45;
		["posX"] = 1200;
		["posY"] = 630;
		["script"] = "";
		["text"] = "Yes? Do you still want my advice?";
		["time"] = 4.5;
		["topic"] = "junk_clothes:herbalist_get_cloth";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 1;
		["connectID"] = 49;
		["posX"] = 1620;
		["posY"] = 360;
		["script"] = "";
		["text"] = "About the cloth...";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 2;
		["connectID"] = 59;
		["posX"] = 2880;
		["posY"] = 60;
		["script"] = "";
		["text"] = "Though you actually managed to find some clothes.";
		["time"] = 5;
		["topic"] = "junk_clothes:herbalist_skip";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 1;
		["connectID"] = 56;
		["posX"] = 3120;
		["posY"] = 210;
		["script"] = "";
		["text"] = "I feel like an ancient Greek. Practically an argonaut!";
		["time"] = 5.5;
		["topic"] = "junk_clothes:finish";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 1;
		["connectID"] = 55;
		["posX"] = 2340;
		["posY"] = 150;
		["script"] = "";
		["text"] = "\\[Give 2 Cloth]Yeah.";
		["time"] = 2.5;
		["topic"] = "junk_clothes:herbalist_give_cloth";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 2;
		["animation"] = "dl_shrug_short";
		["connectID"] = 66;
		["posX"] = 3360;
		["posY"] = 210;
		["script"] = "";
		["text"] = "I have no clue who gronkhas and astronauts are, but I hope this was a compliment to my work. If you want something better, it'll require more materials and time. And my tools, which I left in the hideout.";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 2;
		["connectID"] = 53;
		["posX"] = 2880;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Let's have a look. Alright... I had a piece of rubber here somewhere, for the sole... Here. Done! Put it on!";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 1;
		["connectID"] = 66;
		["posX"] = 3360;
		["posY"] = 60;
		["script"] = "";
		["text"] = "Thanks, I guess.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 2;
		["connectID"] = 58;
		["posX"] = 3120;
		["posY"] = 60;
		["script"] = "";
		["text"] = "Guess it won't hurt you to have a backup pair.";
		["time"] = 6;
		["topic"] = "junk_clothes:finish";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 2;
		["connectID"] = 45;
		["posX"] = 3690;
		["posY"] = 690;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 2;
		["connectID"] = 66;
		["posX"] = 1830;
		["posY"] = 1500;
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
		["text"] = "Look at you! Almost a real Bushman!";
		["time"] = 4.5;
		["topic"] = "junk_clothes:herbalist_real_bushman";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
		["actor"] = 1;
		["connectID"] = 70;
		["posX"] = 2790;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "And how do I get there?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 2;
		["connectID"] = 189;
		["posX"] = 3990;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Be careful, huma. The canyon is full of bandits and dangerous beasts. Better not get off the road if you aren't ready for a serious fight.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 1;
		["connectID"] = 71;
		["posX"] = 3510;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Understood. And how do I find the fort?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00070"] = {
		["ID"] = 70;
		["actor"] = 2;
		["connectID"] = 73;
		["posX"] = 3030;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "The nearest town is New Hope. An abori on foot can reach it in about a week's time. You, on the other hand, most likely require twice that time - two weeks at least. The road is difficult and dangerous. It's better to go well-prepared.";
		["time"] = 23.5;
		["type"] = "message";
	};
	["message_00071"] = {
		["ID"] = 71;
		["actor"] = 2;
		["connectID"] = 68;
		["posX"] = 3750;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "First you need to get out of this damned place through a narrow rocky passage to the west of the lake and reach the caravan route. Don't even try the desert - with your current equipment it's certain death. If you follow the caravan route you'll find a small hunters camp. Ask them for directions. Maybe someone can even take you to the fort.";
		["time"] = 33;
		["type"] = "message";
	};
	["message_00072"] = {
		["ID"] = 72;
		["actor"] = 1;
		["connectID"] = 74;
		["posX"] = 2310;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "I have to find my ship. Do you have any ideas?";
		["time"] = 6.5;
		["topic"] = "to_fort:start";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00073"] = {
		["ID"] = 73;
		["actor"] = 2;
		["connectID"] = 69;
		["posX"] = 3270;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "You should head for the fort of the humas. It's not far, just north of Windscream Canyon. There you can join a caravan to town. It's much safer that way.";
		["time"] = 16;
		["topic"] = "to_fort:start";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00074"] = {
		["ID"] = 74;
		["actor"] = 2;
		["connectID"] = 67;
		["posX"] = 2550;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "A ship? Sorry, but I don't know anything about starships. I think you'd better get to the nearest human settlement and start looking there.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00075"] = {
		["ID"] = 75;
		["actor"] = 1;
		["connectID"] = 82;
		["posX"] = 2880;
		["posY"] = 4770;
		["script"] = "";
		["text"] = "Where can I get a better weapon and more supplies?";
		["time"] = 6;
		["topic"] = "abori_goes_home:herbalist_in_hideout";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00076"] = {
		["ID"] = 76;
		["actor"] = 2;
		["posX"] = 4470;
		["posY"] = 4980;
		["script"] = "";
		["text"] = "Pour some melon juice on them and the bugs will eat them! Five bastards should do the trick.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00077"] = {
		["ID"] = 77;
		["actor"] = 2;
		["connectID"] = 87;
		["posX"] = 3510;
		["posY"] = 4980;
		["script"] = "";
		["text"] = "Something that cannot be bought, huma. Sometime ago this hermit was a shaman. He'll give you knowledge. Such knowledge that you can't imagine. Besides, I've collected some things from the dumpsters.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00078"] = {
		["ID"] = 78;
		["actor"] = 1;
		["connectID"] = 77;
		["posX"] = 4230;
		["posY"] = 4830;
		["script"] = "";
		["text"] = "But what could a hermit-exile give in return for the warriors deaths?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00079"] = {
		["ID"] = 79;
		["actor"] = 2;
		["connectID"] = 83;
		["posX"] = 3510;
		["posY"] = 4830;
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
		["text"] = "[HIDDEN]By the way, I have a proposal for you. Kill the Scalp Hunters. They aren't letting the exiles live in peace.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00080"] = {
		["ID"] = 80;
		["actor"] = 2;
		["connectID"] = 78;
		["posX"] = 3990;
		["posY"] = 4830;
		["script"] = "";
		["text"] = "Young hunters gather scalps before returning back to the tribe and getting their first wife. Many of them like this so much that they don't return to the tribe and become headhunters. One group went on a rampage recently. That's why the looters and traders don't come here anymore.";
		["time"] = 25.5;
		["type"] = "message";
	};
	["message_00081"] = {
		["ID"] = 81;
		["actor"] = 2;
		["connectID"] = 86;
		["posX"] = 3990;
		["posY"] = 4980;
		["script"] = "";
		["text"] = "We need to scare them off, and for a long time. Kill them and get rid of the bodies. Let their friends think that the taboo claimed their lives.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00082"] = {
		["ID"] = 82;
		["actor"] = 2;
		["connectID"] = 85;
		["posX"] = 3120;
		["posY"] = 4770;
		["script"] = "";
		["text"] = "You can always check out those taboo bubbles, but it could be dangerous.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 1;
		["connectID"] = 80;
		["posX"] = 3750;
		["posY"] = 4830;
		["script"] = "";
		["text"] = "Who are these Scalp Hunters?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00084"] = {
		["ID"] = 84;
		["actor"] = 2;
		["connectID"] = 169;
		["posX"] = 3510;
		["posY"] = 4710;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00086"] = {
		["ID"] = 86;
		["actor"] = 1;
		["connectID"] = 76;
		["posX"] = 4230;
		["posY"] = 4980;
		["script"] = "";
		["text"] = "And how should I get rid of the bodies?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00087"] = {
		["ID"] = 87;
		["actor"] = 1;
		["connectID"] = 81;
		["posX"] = 3750;
		["posY"] = 4980;
		["script"] = "";
		["text"] = "Even if I agree, how am I supposed to go about it? I don't have any weapons, and those abori guys you're talking about sound like they're armed to the teeth, and there's more than just a couple of them.";
		["time"] = 21;
		["type"] = "message";
	};
	["message_00088"] = {
		["ID"] = 88;
		["actor"] = 2;
		["connectID"] = 66;
		["posX"] = 1830;
		["posY"] = 1650;
		["script"] = "";
		["text"] = "Yes?";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00089"] = {
		["ID"] = 89;
		["actor"] = 1;
		["connectID"] = 91;
		["posX"] = 1050;
		["posY"] = 1590;
		["script"] = "";
		["text"] = "Hey, old man.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00099"] = {
		["ID"] = 99;
		["actor"] = 2;
		["animation"] = "dl_bow_2";
		["connectID"] = 322;
		["posX"] = 1170;
		["posY"] = -1320;
		["script"] = "";
		["text"] = "Oh, thank you stranger! I thought it was the end of me, they'd break my old bones and leave me to be eaten by crucasses.";
		["time"] = 13.5;
		["topic"] = "herbalist_intro:herbalist_start";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00117"] = {
		["ID"] = 117;
		["actor"] = 2;
		["connectID"] = 128;
		["posX"] = 2280;
		["posY"] = -240;
		["script"] = "";
		["text"] = "As you want, though bear in mind that you humas get roasted in this sun really fast.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00118"] = {
		["ID"] = 118;
		["actor"] = 1;
		["animation"] = "dl_head_shake";
		["connectID"] = 117;
		["posX"] = 2040;
		["posY"] = -240;
		["script"] = "";
		["text"] = "No, I'm actually fine, I have something for that matter.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00123"] = {
		["ID"] = 123;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 2280;
		["posY"] = -480;
		["script"] = "";
		["text"] = "Bring me two pieces of cloth - we need to protect your tender heels. Wouldn't hurt to cover your pink belly from the sun as well, or you'll turn red like a bitebug on a stick in a heartbeat. Also, you're gonna need a better weapon.";
		["time"] = 24;
		["topic"] = "junk_clothes:start";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00127"] = {
		["ID"] = 127;
		["actor"] = 2;
		["connectID"] = 28;
		["posX"] = 1620;
		["posY"] = -330;
		["script"] = "";
		["text"] = "All right huma, you helped me - and I'll help you. You'll want to get some clothes first. You won't get far in our desert barefoot.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00128"] = {
		["ID"] = 128;
		["actor"] = 2;
		["connectID"] = 66;
		["posX"] = 2580;
		["posY"] = -270;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00129"] = {
		["ID"] = 129;
		["actor"] = 1;
		["connectID"] = 165;
		["posX"] = 4080;
		["posY"] = 5970;
		["script"] = "";
		["text"] = "Looks like your taboo is some kind of spatial anomaly.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00130"] = {
		["ID"] = 130;
		["actor"] = 2;
		["connectID"] = 169;
		["posX"] = 6480;
		["posY"] = 6120;
		["script"] = "";
		["text"] = "Since then, I didn't really hear much about him. They say that he found his end in the mines of Terraform. It no longer matters to me.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00131"] = {
		["ID"] = 131;
		["actor"] = 2;
		["animation"] = "dl_chuckle";
		["connectID"] = 139;
		["posX"] = 3120;
		["posY"] = 5670;
		["script"] = "";
		["text"] = "You're kidding, right? It's been two hundred years since you've \"colonized\" us. How can we not know the language of our \"benefactors\"? Then again, it's a lot simpler than ours, which has three layers of meaning and a bunch of sounds that you're not only unable to pronounce, but even hear.";
		["time"] = 26.5;
		["type"] = "message";
	};
	["message_00132"] = {
		["ID"] = 132;
		["actor"] = 2;
		["connectID"] = 169;
		["posX"] = 3750;
		["posY"] = 5610;
		["script"] = "";
		["text"] = "To speak it - no. It's like teaching a blind to draw or a deaf to play music. I might be able to teach you to read it, but certainly not here, and not now. I have more important matters to attend to, as I'm sure you too. Perhaps later.";
		["time"] = 26;
		["type"] = "message";
	};
	["message_00133"] = {
		["ID"] = 133;
		["actor"] = 1;
		["connectID"] = 162;
		["posX"] = 2880;
		["posY"] = 5370;
		["script"] = "";
		["text"] = "Who are you actually?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00134"] = {
		["ID"] = 134;
		["actor"] = 1;
		["connectID"] = 146;
		["posX"] = 2880;
		["posY"] = 5970;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"abori_goes_home\", \"herbalist_in_hideout\")\
end\
\
";
		["text"] = "What is this taboo you mentioned?";
		["time"] = 4;
		["topic"] = "abori_goes_home:herbalist_in_hideout";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00135"] = {
		["ID"] = 135;
		["actor"] = 1;
		["connectID"] = 144;
		["posX"] = 2880;
		["posY"] = 6120;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"abori_goes_home\", \"herbalist_in_hideout\")\
end\
\
";
		["text"] = "We were talking about the reasons of your exile. Are you a criminal?";
		["time"] = 7.5;
		["topic"] = "abori_goes_home:herbalist_in_hideout";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00136"] = {
		["ID"] = 136;
		["actor"] = 1;
		["connectID"] = 145;
		["posX"] = 4560;
		["posY"] = 6120;
		["script"] = "";
		["text"] = "And what happened next? A tribal split?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00137"] = {
		["ID"] = 137;
		["actor"] = 2;
		["connectID"] = 169;
		["posX"] = 3750;
		["posY"] = 5730;
		["script"] = "";
		["text"] = "\\[HIDDEN]To speak it - no. It's like teaching a blind to draw or a deaf to play music. But I might be able to teach you to read it. Well, the first layer of meaning at least. The language of artisans and peasants. Concepts and actions which it describes are the same for us and humas.";
		["time"] = 29;
		["type"] = "message";
	};
	["message_00138"] = {
		["ID"] = 138;
		["actor"] = 1;
		["connectID"] = 170;
		["posX"] = 6000;
		["posY"] = 6120;
		["script"] = "";
		["text"] = "And what happened to this young chief?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00139"] = {
		["ID"] = 139;
		["actor"] = 1;
		["connectID"] = 176;
		["posX"] = 3360;
		["posY"] = 5670;
		["script"] = "";
		["text"] = "Can you teach me your language?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00140"] = {
		["ID"] = 140;
		["actor"] = 1;
		["connectID"] = 142;
		["posX"] = 3360;
		["posY"] = 6120;
		["script"] = "";
		["text"] = "Anyway, what happened to you?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00141"] = {
		["ID"] = 141;
		["actor"] = 2;
		["connectID"] = 154;
		["posX"] = 4080;
		["posY"] = 6120;
		["script"] = "";
		["text"] = "I resisted, and was setting the people up against him. Traditions were more important to me than the lives of my tribesmen at that time...";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00142"] = {
		["ID"] = 142;
		["actor"] = 2;
		["connectID"] = 152;
		["posX"] = 3600;
		["posY"] = 6120;
		["script"] = "";
		["text"] = "Well, maybe it will teach you something. I was a shaman of... well, it doesn't matter which tribe anymore. I faithfully served it, communicated with the Gods-in-the-Earth and conveyed their will to the chief and the people.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00144"] = {
		["ID"] = 144;
		["actor"] = 2;
		["animation"] = "dl_hand_facepalm";
		["connectID"] = 140;
		["posX"] = 3120;
		["posY"] = 6120;
		["script"] = "";
		["text"] = "I might as well be. Perhaps my stupidity is my crime. It's hard to remember this without shame...";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00145"] = {
		["ID"] = 145;
		["actor"] = 2;
		["connectID"] = 164;
		["posX"] = 4800;
		["posY"] = 6120;
		["script"] = "";
		["text"] = "Exactly that. A split. Bloodshed between families that hunted together for centuries and intermarried their children. Dozens of hunters died and the tribe has weakened. We got sick and hungry. I... I don't know whose fault it is, mine or the young chief's, but that's not important anymore.";
		["time"] = 25;
		["type"] = "message";
	};
	["message_00146"] = {
		["ID"] = 146;
		["actor"] = 2;
		["animation"] = "dl_head_scratch";
		["connectID"] = 161;
		["posX"] = 3120;
		["posY"] = 5970;
		["script"] = "";
		["text"] = "I don't really know the proper word for it in your language... Taboo is something forbidden, something that should not be. Something for which there are no words.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00147"] = {
		["ID"] = 147;
		["actor"] = 2;
		["connectID"] = 169;
		["posX"] = 4230;
		["posY"] = 5280;
		["script"] = "";
		["text"] = "Just follow the map I gave you, and try to find that hunters camp and ask for directions there.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00148"] = {
		["ID"] = 148;
		["actor"] = 2;
		["connectID"] = 129;
		["posX"] = 3840;
		["posY"] = 5970;
		["script"] = "";
		["text"] = "Sometimes a merchant comes to the border of taboo - we trade, and we survive.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00149"] = {
		["ID"] = 149;
		["actor"] = 2;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 169;
		["posX"] = 4230;
		["posY"] = 5130;
		["script"] = "function message:onStart()\
   addItemToPlayer(\"outcast_map.itm\")\
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
		["text"] = "\\[Gives a hand-drawn map] You can use this map to find your way around here.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00150"] = {
		["ID"] = 150;
		["actor"] = 2;
		["connectID"] = 169;
		["posX"] = 3120;
		["posY"] = 5520;
		["script"] = "";
		["text"] = "Does it matter now? Anyway, this isn't the right time to talk about it, maybe later...";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00151"] = {
		["ID"] = 151;
		["actor"] = 1;
		["connectID"] = 306;
		["posX"] = 2880;
		["posY"] = 6300;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00152"] = {
		["ID"] = 152;
		["actor"] = 2;
		["connectID"] = 141;
		["posX"] = 3840;
		["posY"] = 6120;
		["script"] = "";
		["text"] = "Then the new chief took power, young and hot-headed. He wanted to change things, to move away from the ways of the ancestors and be like you, humas. He wanted to own and study machines.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00153"] = {
		["ID"] = 153;
		["actor"] = 2;
		["connectID"] = 171;
		["posX"] = 3120;
		["posY"] = 5220;
		["script"] = "";
		["text"] = "This place? The most suitable place for someone like me. A cursed place. Asylum for the outcast. Not sure about you though. You probably should get out of here as soon as possible.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00154"] = {
		["ID"] = 154;
		["actor"] = 2;
		["connectID"] = 136;
		["posX"] = 4320;
		["posY"] = 6120;
		["script"] = "";
		["text"] = "\\[Sighs heavily]";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00155"] = {
		["ID"] = 155;
		["actor"] = 2;
		["connectID"] = 156;
		["posX"] = 5280;
		["posY"] = 6120;
		["script"] = "";
		["text"] = "I performed the rite and transferred the title to my student. Unworthy to die from the \"poison of eternal sleep\" and rest among the mummies of the former shamans, I went into the desert, searching for another death.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00156"] = {
		["ID"] = 156;
		["actor"] = 1;
		["connectID"] = 168;
		["posX"] = 5520;
		["posY"] = 6120;
		["script"] = "";
		["text"] = "Wait, was this exile self-imposed? You're crazy!";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00158"] = {
		["ID"] = 158;
		["actor"] = 1;
		["connectID"] = 150;
		["posX"] = 2880;
		["posY"] = 5520;
		["script"] = "";
		["text"] = "And why did your kinsmen cast you out?";
		["time"] = 5;
		["topic"] = "abori_goes_home:herbalist_before_hideout";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00160"] = {
		["ID"] = 160;
		["actor"] = 1;
		["connectID"] = 153;
		["posX"] = 2880;
		["posY"] = 5220;
		["script"] = "";
		["text"] = "What is this place?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00161"] = {
		["ID"] = 161;
		["actor"] = 2;
		["animation"] = "dl_point_back";
		["connectID"] = 172;
		["posX"] = 3360;
		["posY"] = 5970;
		["script"] = "";
		["text"] = "In this place - taboo is everywhere! Things appear and disappear in flashes of lightning. And after the lightning a strange bubble appears that lasts a few days.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00162"] = {
		["ID"] = 162;
		["actor"] = 2;
		["connectID"] = 169;
		["posX"] = 3120;
		["posY"] = 5370;
		["script"] = "";
		["text"] = "Who am I? Once I had a name, a family, a place by the chief's hearth. All in the past. Now I'm just an old exile. Now I have no name. I am dust in the wind. It blows and I'm gone.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00163"] = {
		["ID"] = 163;
		["actor"] = 1;
		["connectID"] = 157;
		["posX"] = 3840;
		["posY"] = 5220;
		["script"] = "";
		["text"] = "How can I navigate here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00164"] = {
		["ID"] = 164;
		["actor"] = 2;
		["connectID"] = 155;
		["posX"] = 5040;
		["posY"] = 6120;
		["script"] = "";
		["text"] = "I realized that the tribe needs a new shaman, a younger and a more open-minded one. The one that can better see the way to an agreement between traditions of ancestors and necessary changes.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00165"] = {
		["ID"] = 165;
		["actor"] = 2;
		["connectID"] = 169;
		["posX"] = 4320;
		["posY"] = 5970;
		["script"] = "";
		["text"] = "Anomaly or taboo, whatever you want to call it. Bad things happen here. But I've been here for a long time - I figured out the taboo's laws. Taboo is like a lightning, it rarely hits the same place twice. Therefore, I settled in this crevice, and as you can see, I'm still alive.";
		["time"] = 28;
		["type"] = "message";
	};
	["message_00166"] = {
		["ID"] = 166;
		["actor"] = 2;
		["animation"] = "dl_hands_dontknow";
		["connectID"] = 163;
		["posX"] = 3600;
		["posY"] = 5220;
		["script"] = "";
		["text"] = "It's a strange question. Do you know how you got here? Your tribesmen call this planet K'Tharsis, huma. And this place is the border of White Erg desert. Don't really know what else to tell you. Knowledge spills from this head like sand from a riven jug.";
		["time"] = 24.5;
		["type"] = "message";
	};
	["message_00167"] = {
		["ID"] = 167;
		["actor"] = 1;
		["connectID"] = 175;
		["posX"] = 2880;
		["posY"] = 5820;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"abori_goes_home\", \"herbalist_in_hideout\")\
end\
\
";
		["text"] = "What makes you think I was cast out?";
		["time"] = 5;
		["topic"] = "abori_goes_home:herbalist_in_hideout";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00168"] = {
		["ID"] = 168;
		["actor"] = 2;
		["connectID"] = 138;
		["posX"] = 5760;
		["posY"] = 6120;
		["script"] = "";
		["text"] = "It's better than allowing bloody conflicts between tribesmen. For years I wandered in the desert, but neither animals nor vagabonds have put an end to my worthless life. Several years ago, I settled here - in this damned place. I think this is where my bones will rest.";
		["time"] = 25;
		["type"] = "message";
	};
	["message_00169"] = {
		["ID"] = 169;
		["actor"] = 2;
		["connectID"] = 159;
		["h"] = 100;
		["posX"] = 6780;
		["posY"] = 5310;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
		["w"] = 102;
	};
	["message_00170"] = {
		["ID"] = 170;
		["actor"] = 2;
		["connectID"] = 130;
		["posX"] = 6240;
		["posY"] = 6120;
		["script"] = "";
		["text"] = "I heard that he united several tribes and rebelled against humas. His victories were numerous, but eventually he perished because of treason of one of his tribesmen, who have arranged for a peace treaty with the humas, beneficial to his tribe (the Stone Heads, Fat Pah).";
		["time"] = 24;
		["type"] = "message";
	};
	["message_00171"] = {
		["ID"] = 171;
		["actor"] = 1;
		["connectID"] = 166;
		["posX"] = 3360;
		["posY"] = 5220;
		["script"] = "";
		["text"] = "I meant this planet. This area.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00172"] = {
		["ID"] = 172;
		["actor"] = 2;
		["connectID"] = 148;
		["posX"] = 3600;
		["posY"] = 5970;
		["script"] = "";
		["text"] = "And inside of it are floating things that shouldn't be here: homes, corpses of creatures, some incomprehensible things. I wait a few days until the bubble bursts on its own and search the debris, looking for useful things.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00173"] = {
		["ID"] = 173;
		["actor"] = 1;
		["connectID"] = 159;
		["posX"] = 2430;
		["posY"] = 5880;
		["script"] = "";
		["text"] = "I have a couple of questions.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00174"] = {
		["ID"] = 174;
		["actor"] = 1;
		["connectID"] = 131;
		["posX"] = 2880;
		["posY"] = 5670;
		["script"] = "";
		["text"] = "How come you aborigines understand our language?";
		["time"] = 4.5;
		["topic"] = "abori_goes_home:herbalist_in_hideout";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00175"] = {
		["ID"] = 175;
		["actor"] = 2;
		["connectID"] = 177;
		["posX"] = 3120;
		["posY"] = 5820;
		["script"] = "";
		["text"] = "If not that, what else? Usually you humas either kill or throw each other into a place called \"prison\". I don't know, maybe you had the same lost and pitiful look as those who come here for the first time. ";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00177"] = {
		["ID"] = 177;
		["actor"] = 2;
		["connectID"] = 169;
		["posX"] = 3360;
		["posY"] = 5820;
		["script"] = "";
		["text"] = "I have seen and outlived many of them. I know how it feels to lose everything.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00178"] = {
		["ID"] = 178;
		["actor"] = 1;
		["connectID"] = 180;
		["posX"] = 2940;
		["posY"] = 7290;
		["script"] = "";
		["text"] = "Go on.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00179"] = {
		["ID"] = 179;
		["actor"] = 2;
		["posX"] = 4140;
		["posY"] = 7290;
		["script"] = "";
		["text"] = "We named it this way. It's the only place where the taboo strikes repeatedly. You'll see for yourself. A lot of good loot but very dangerous.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00180"] = {
		["ID"] = 180;
		["actor"] = 2;
		["connectID"] = 181;
		["posX"] = 3180;
		["posY"] = 7290;
		["script"] = "";
		["text"] = "I have a friend here. He's not a madman. He's also an outcast, a younger one. He planned to visit me but never came. Last time we met he bragged about his plans to inspect the Bad Cave. I'm worried if something happened to him... Find him and give him a message from me. He will reward you with something, he climbs places I do not dare to try. [GIVES an aboriginal lace-nodding letter]";
		["time"] = 38;
		["type"] = "message";
	};
	["message_00181"] = {
		["ID"] = 181;
		["actor"] = 1;
		["connectID"] = 186;
		["posX"] = 3420;
		["posY"] = 7290;
		["script"] = "";
		["text"] = "All right. Where does this friend of yours hang out and what's the deal with this Bad Cave?";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00183"] = {
		["ID"] = 183;
		["actor"] = 2;
		["connectID"] = 182;
		["posX"] = 2550;
		["posY"] = 7350;
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
		["text"] = "[HIDDEN]Wait! There is but one request which the miserable outcast dares to voice.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00184"] = {
		["ID"] = 184;
		["actor"] = 1;
		["connectID"] = 179;
		["posX"] = 3900;
		["posY"] = 7290;
		["script"] = "";
		["text"] = "Why the strange name?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00185"] = {
		["ID"] = 185;
		["actor"] = 1;
		["posX"] = 2940;
		["posY"] = 7440;
		["script"] = "";
		["text"] = "Not interested.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00186"] = {
		["ID"] = 186;
		["actor"] = 2;
		["connectID"] = 184;
		["posX"] = 3660;
		["posY"] = 7290;
		["script"] = "";
		["text"] = "He lives there (a landmark [WTF?Where is that???]). His refuge is like mine - tough to find. Lots of caves there.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00189"] = {
		["ID"] = 189;
		["actor"] = 2;
		["connectID"] = 66;
		["h"] = 100;
		["posX"] = 8490;
		["posY"] = 1350;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
		["w"] = 109;
	};
	["message_00190"] = {
		["ID"] = 190;
		["actor"] = 1;
		["connectID"] = 193;
		["posX"] = 3180;
		["posY"] = 7560;
		["script"] = "";
		["text"] = "He's dead. He was killed by the taboo. Cut in half.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00192"] = {
		["ID"] = 192;
		["actor"] = 2;
		["connectID"] = 191;
		["posX"] = 2790;
		["posY"] = 7740;
		["script"] = "";
		["text"] = "Have you seen him? Is he okay?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00193"] = {
		["ID"] = 193;
		["actor"] = 2;
		["connectID"] = 196;
		["posX"] = 3420;
		["posY"] = 7560;
		["script"] = "";
		["text"] = "No! That can't be true!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00194"] = {
		["ID"] = 194;
		["actor"] = 1;
		["connectID"] = 192;
		["posX"] = 2550;
		["posY"] = 7740;
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
		["text"] = "[HIDDEN]About your friend.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00195"] = {
		["ID"] = 195;
		["actor"] = 1;
		["posX"] = 3180;
		["posY"] = 7800;
		["script"] = "";
		["text"] = "He found the strength to move to a better place. Here is his farewell letter [GIVE LETTER].";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00196"] = {
		["ID"] = 196;
		["actor"] = 1;
		["posX"] = 3660;
		["posY"] = 7560;
		["script"] = "";
		["text"] = "Here is his hand.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00197"] = {
		["ID"] = 197;
		["actor"] = 1;
		["posX"] = 3180;
		["posY"] = 7680;
		["script"] = "";
		["text"] = "He is alive and well. He won't come because he's feeling a little bit sick.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00198"] = {
		["ID"] = 198;
		["actor"] = 1;
		["posX"] = 3180;
		["posY"] = 7920;
		["script"] = "";
		["text"] = "Haven't found him yet.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00199"] = {
		["ID"] = 199;
		["actor"] = 2;
		["connectID"] = 202;
		["posX"] = 3330;
		["posY"] = 2970;
		["script"] = "";
		["text"] = "I have to get to my hideout and I fear I won't make it there alone.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00201"] = {
		["ID"] = 201;
		["actor"] = 2;
		["posX"] = 4230;
		["posY"] = 3060;
		["script"] = "";
		["text"] = "Follow me!";
		["time"] = 2;
		["topic"] = "abori_goes_home:herbalist_follow";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStop";
		["type"] = "message";
	};
	["message_00202"] = {
		["ID"] = 202;
		["actor"] = 2;
		["connectID"] = 200;
		["posX"] = 3570;
		["posY"] = 2970;
		["script"] = "";
		["text"] = "And even though I don't completely trust you, I have to ask you to escort me there. I'll reward you with some of my humble supplies.";
		["time"] = 14;
		["topic"] = "abori_goes_home:start";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00203"] = {
		["ID"] = 203;
		["actor"] = 1;
		["connectID"] = 200;
		["posX"] = 2610;
		["posY"] = 3120;
		["script"] = "";
		["text"] = "About the trip to your hideout...";
		["time"] = 4;
		["topic"] = "abori_goes_home:escort";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00204"] = {
		["ID"] = 204;
		["actor"] = 1;
		["connectID"] = 207;
		["posX"] = 2610;
		["posY"] = 2970;
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
		["text"] = "What are you going to do now?";
		["time"] = 4.5;
		["topic"] = "abori_goes_home:start";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00205"] = {
		["ID"] = 205;
		["actor"] = 2;
		["connectID"] = 199;
		["posX"] = 3090;
		["posY"] = 2970;
		["script"] = "";
		["text"] = "And the Scalp Hunters got bolder and wander further and further inside the taboo area. We can talk when you take me to my hideout.\
";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00206"] = {
		["ID"] = 206;
		["actor"] = 1;
		["connectID"] = 201;
		["posX"] = 3990;
		["posY"] = 3060;
		["script"] = "";
		["text"] = "Alright, show me the way to your shelter!";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00207"] = {
		["ID"] = 207;
		["actor"] = 2;
		["connectID"] = 205;
		["posX"] = 2850;
		["posY"] = 2970;
		["script"] = "";
		["text"] = "Well, it's dangerous to stay here and I'm not my young self, so even a couple of small crucasses could pose as a serious threat. Damn pests get out of their holes at this time.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00208"] = {
		["ID"] = 208;
		["actor"] = 1;
		["connectID"] = 189;
		["posX"] = 4050;
		["posY"] = 3390;
		["script"] = "";
		["text"] = "\\[BACK]Maybe later.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00209"] = {
		["ID"] = 209;
		["actor"] = 2;
		["connectID"] = 222;
		["posX"] = 5100;
		["posY"] = 3990;
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
		["text"] = "The method I suggest is not safe and I've only heard about it working in bug-hunters' tales. Never trust their kind, huma!";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00211"] = {
		["ID"] = 211;
		["actor"] = 2;
		["connectID"] = 256;
		["posX"] = 4470;
		["posY"] = 3900;
		["script"] = "";
		["text"] = "Anyway, I have good and bad news for you. Which one you would you rather hear first?";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00212"] = {
		["ID"] = 212;
		["actor"] = 2;
		["connectID"] = 223;
		["posX"] = 3990;
		["posY"] = 3900;
		["script"] = "";
		["text"] = "What? Ah, there is no need to be so loud! I wasn't sleeping at all! I was reconstructing and visiting that cave and its surroundings in my mind.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00213"] = {
		["ID"] = 213;
		["actor"] = 1;
		["connectID"] = 224;
		["posX"] = 2550;
		["posY"] = 4410;
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
		["text"] = "About the scalp hunters thing.";
		["time"] = 3.5;
		["topic"] = "angry_bugs:herbalist_about_scalpers";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00214"] = {
		["ID"] = 214;
		["actor"] = 1;
		["connectID"] = 221;
		["posX"] = 2550;
		["posY"] = 3900;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"angry_bugs\", \"herbalist_trick\")\
end\
\
";
		["text"] = "I've found a large camp of scalp hunters in the cave, close to the Cutthroat Pass. I guess they aren't making life for you outcasts here easier. Maybe you know some trick to get rid of these savages?";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00215"] = {
		["ID"] = 215;
		["actor"] = 1;
		["connectID"] = 220;
		["posX"] = 5580;
		["posY"] = 3990;
		["script"] = "";
		["text"] = "You could say the same about any kind of trade, old man. Now cut to the point.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00216"] = {
		["ID"] = 216;
		["actor"] = 2;
		["connectID"] = 218;
		["posX"] = 5100;
		["posY"] = 3810;
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
		["text"] = "Alright! I might have found a way to strip those filthy scalp hunters of one of their main advantages. And by that I mean their strength in numbers.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00218"] = {
		["ID"] = 218;
		["actor"] = 2;
		["connectID"] = 225;
		["posX"] = 5340;
		["posY"] = 3810;
		["script"] = "";
		["text"] = "I've remembered one old tale of our folk. There should be a weapon to attack many targets at once in that cave.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00219"] = {
		["ID"] = 219;
		["actor"] = 1;
		["connectID"] = 212;
		["posX"] = 3750;
		["posY"] = 3900;
		["script"] = "";
		["text"] = "Hey, old man! Wake up!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00220"] = {
		["ID"] = 220;
		["actor"] = 2;
		["connectID"] = 217;
		["posX"] = 5820;
		["posY"] = 3990;
		["script"] = "";
		["text"] = "As you wish.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00221"] = {
		["ID"] = 221;
		["actor"] = 2;
		["connectID"] = 236;
		["posX"] = 2790;
		["posY"] = 3900;
		["script"] = "";
		["text"] = "Good to know you have some brains between those hideous pink ears, huma. Others in your place would have simply rushed to their camp with guns blazing. And that would be the last mistake in their life.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00222"] = {
		["ID"] = 222;
		["actor"] = 2;
		["connectID"] = 215;
		["posX"] = 5340;
		["posY"] = 3990;
		["script"] = "";
		["text"] = "They like to boast about their crazy earnings and cool feats they have performed, but all end up penniless and drunk, lying in their own puke near the shittiest saloon they could find in the entire desert.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00223"] = {
		["ID"] = 223;
		["actor"] = 2;
		["connectID"] = 211;
		["posX"] = 4230;
		["posY"] = 3900;
		["script"] = "";
		["text"] = "That's my unique perk so to speak - I never forget any place I have seen or conversations I heard.  ";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00224"] = {
		["ID"] = 224;
		["actor"] = 2;
		["connectID"] = 234;
		["posX"] = 2790;
		["posY"] = 4410;
		["script"] = "";
		["text"] = "Yes?";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00225"] = {
		["ID"] = 225;
		["actor"] = 1;
		["connectID"] = 255;
		["posX"] = 5580;
		["posY"] = 3810;
		["script"] = "";
		["text"] = "A weapon of mass destruction? Now we are talking! Is it an ancient alien artifact that shoots lightnings? Where is it?";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00226"] = {
		["ID"] = 226;
		["actor"] = 1;
		["connectID"] = 235;
		["posX"] = 2550;
		["posY"] = 4080;
		["script"] = "function message:onStart()\
   getQuest(\"angry_bugs\"):setTopicVisible(\"herbalist_about_scalpers_alt\", false)\
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
		["text"] = "You know, there was a big group of scalp hunters camping in a cave nearby...";
		["time"] = 8.5;
		["topic"] = "angry_bugs:herbalist_about_scalpers_alt";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00227"] = {
		["ID"] = 227;
		["actor"] = 2;
		["connectID"] = 239;
		["posX"] = 7230;
		["posY"] = 3930;
		["script"] = "";
		["text"] = "Easily... in theory. Well, here's my plan: we will combine my knowledge of the area, your sneaking skills and the force of Mother Nature.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00228"] = {
		["ID"] = 228;
		["actor"] = 2;
		["animation"] = "dl_head_scratch";
		["connectID"] = 241;
		["posX"] = 3270;
		["posY"] = 3900;
		["script"] = "";
		["text"] = "I know this area like a back of my palm, huma. Let me think a bit...";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00229"] = {
		["ID"] = 229;
		["actor"] = 1;
		["connectID"] = 251;
		["posX"] = 4290;
		["posY"] = 4260;
		["script"] = "function message:onStart()\
   addItemToPlayer(\"22_ammo.itm\", 15)\
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
		["text"] = "\\[Take 15 SCAMP rounds]";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00230"] = {
		["ID"] = 230;
		["actor"] = 1;
		["connectID"] = 247;
		["posX"] = 3180;
		["posY"] = 4260;
		["script"] = "function message:onStart()\
   local q = getQuest(\"angry_bugs\")\
   q:setTopicVisible(\"herbalist_about_scalpers\", false)\
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
		["text"] = "They aren't going to trouble anyone ever again.";
		["time"] = 5;
		["topic"] = "angry_bugs:herbalist_finish";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00231"] = {
		["ID"] = 231;
		["actor"] = 2;
		["connectID"] = 242;
		["posX"] = 3030;
		["posY"] = 4080;
		["script"] = "";
		["text"] = "Wait... What do you mean by 'was'?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00232"] = {
		["ID"] = 232;
		["actor"] = 1;
		["connectID"] = 209;
		["posX"] = 4860;
		["posY"] = 3990;
		["script"] = "";
		["text"] = "Bad news first.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00233"] = {
		["ID"] = 233;
		["actor"] = 1;
		["connectID"] = 251;
		["posX"] = 4290;
		["posY"] = 4110;
		["script"] = "function message:onStart()\
   addItemToPlayer(\"flare_ammo.itm\", 7)\
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
		["text"] = "\\[Take 7 flares]";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00235"] = {
		["ID"] = 235;
		["actor"] = 2;
		["connectID"] = 231;
		["posX"] = 2790;
		["posY"] = 4080;
		["script"] = "";
		["text"] = "Yes yes, one really dangerous group has settled there a couple...";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00236"] = {
		["ID"] = 236;
		["actor"] = 2;
		["connectID"] = 228;
		["posX"] = 3030;
		["posY"] = 3900;
		["script"] = "";
		["text"] = "You're talking to the right abori about that issue. That fool Big Hat in the village claims he's the oldest outcast here, but I've settled in this valley many pulsations before him.";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00237"] = {
		["ID"] = 237;
		["actor"] = 1;
		["connectID"] = 306;
		["posX"] = 3180;
		["posY"] = 4560;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuestTopicVisible(\"angry_bugs\", \"herbalist_finish\")\
end\
\
";
		["text"] = "I'm still working on it.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00240"] = {
		["ID"] = 240;
		["actor"] = 2;
		["connectID"] = 254;
		["posX"] = 6750;
		["posY"] = 3930;
		["script"] = "";
		["text"] = "The thing is that bitebugs like to be near the water source, but not drowning in it. So they've rebuilt their hives higher to avoid the flood. This gives us one risky opportunity.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00241"] = {
		["ID"] = 241;
		["actor"] = 2;
		["animation"] = "dl_look_up";
		["connectID"] = 219;
		["posX"] = 3510;
		["posY"] = 3900;
		["script"] = "";
		["text"] = "Hm...";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00242"] = {
		["ID"] = 242;
		["actor"] = 1;
		["connectID"] = 243;
		["posX"] = 3270;
		["posY"] = 4080;
		["script"] = "";
		["text"] = "Well, they aren't going to trouble anyone ever again.\
";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00243"] = {
		["ID"] = 243;
		["actor"] = 2;
		["animation"] = "dl_bow_2";
		["connectID"] = 250;
		["posX"] = 3660;
		["posY"] = 4260;
		["script"] = "";
		["text"] = "Mere words cannot describe the depth of my gratitude. You have lifted a great burden from these shoulders, and all outcasts' lives are going to be more bearable now, thanks to you, noble huma.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00244"] = {
		["ID"] = 244;
		["actor"] = 2;
		["connectID"] = 240;
		["posX"] = 6510;
		["posY"] = 3930;
		["script"] = "";
		["text"] = "There was a big hive of bitebugs in that cave, but two and a half pulsations ago the cave was flooded for some reason. Maybe some taboo bubble has changed the water's flow or something else. Doesn't matter.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00245"] = {
		["ID"] = 245;
		["actor"] = 2;
		["connectID"] = 306;
		["posX"] = 3660;
		["posY"] = 4410;
		["script"] = "";
		["text"] = "The vents should be on top of the hive, so you better use the stone gallery in that cave. After you've gassed the hives, just find a place to hide and wait for the fun part.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00246"] = {
		["ID"] = 246;
		["actor"] = 1;
		["connectID"] = 251;
		["posX"] = 4290;
		["posY"] = 4410;
		["script"] = "function message:onStart()\
   addItemToPlayer(\"revolver_ammo.itm\", 15)\
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
		["text"] = "\\[Take 15 revolver rounds]";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00247"] = {
		["ID"] = 247;
		["actor"] = 2;
		["connectID"] = 243;
		["posX"] = 3420;
		["posY"] = 4260;
		["script"] = "";
		["text"] = "What? The plan actually worked? This is excellent news!";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00248"] = {
		["ID"] = 248;
		["actor"] = 1;
		["connectID"] = 217;
		["posX"] = 6060;
		["posY"] = 3810;
		["script"] = "";
		["text"] = "Fine, bring it on!";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00249"] = {
		["ID"] = 249;
		["actor"] = 2;
		["connectID"] = 245;
		["posX"] = 3420;
		["posY"] = 4410;
		["script"] = "";
		["text"] = "Get half a'dozen of stinking shrooms, sneak into the cave where the scalphunters have set their camp and stuff the shrooms into the bughive vents. Is it hard to remember?";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00250"] = {
		["ID"] = 250;
		["actor"] = 2;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 252;
		["posX"] = 3900;
		["posY"] = 4260;
		["script"] = "";
		["text"] = "I want you to have this. It's by no means comparable to the great favor you've done us outcasts, but I hope you'll find it useful.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00251"] = {
		["ID"] = 251;
		["actor"] = 2;
		["connectID"] = 306;
		["posX"] = 4560;
		["posY"] = 4260;
		["script"] = "";
		["text"] = "Be blessed.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00253"] = {
		["ID"] = 253;
		["actor"] = 1;
		["connectID"] = 216;
		["posX"] = 4860;
		["posY"] = 3810;
		["script"] = "";
		["text"] = "Good news.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00254"] = {
		["ID"] = 254;
		["actor"] = 1;
		["connectID"] = 227;
		["posX"] = 6990;
		["posY"] = 3930;
		["script"] = "";
		["text"] = "How on earth some bugs will help us root out a gang of murderers, armed with handguns and stuff?";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00255"] = {
		["ID"] = 255;
		["actor"] = 2;
		["connectID"] = 248;
		["posX"] = 5820;
		["posY"] = 3810;
		["script"] = "";
		["text"] = "Don't get too excited and hear out the rest please.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00257"] = {
		["ID"] = 257;
		["actor"] = 1;
		["connectID"] = 249;
		["posX"] = 3180;
		["posY"] = 4410;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuestTopicVisible(\"angry_bugs\", \"herbalist_finish\")\
end\
\
";
		["text"] = "Could you remind me the plan again?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00259"] = {
		["ID"] = 259;
		["actor"] = 2;
		["connectID"] = 262;
		["posX"] = 9600;
		["posY"] = 4650;
		["script"] = "";
		["text"] = "They won't explode immediately when you hit the mycelium. Consider it a walk on a minefield, huma. You can go through if you don't rush and have nerves of steel.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00260"] = {
		["ID"] = 260;
		["actor"] = 1;
		["connectID"] = 283;
		["posX"] = 7680;
		["posY"] = 3780;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"angry_bugs\", \"herbalist_knowledge\")\
end\
\
";
		["text"] = "So what kind of edgy and valuable knowledge about the area do you have?";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00261"] = {
		["ID"] = 261;
		["actor"] = 2;
		["connectID"] = 274;
		["posX"] = 7920;
		["posY"] = 4080;
		["script"] = "";
		["text"] = "Oh, that's my favorite part! And the most dangerous, as I see it. We are going to turn an entire bugbite hive against the savages.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00262"] = {
		["ID"] = 262;
		["actor"] = 2;
		["connectID"] = 287;
		["posX"] = 9840;
		["posY"] = 4650;
		["script"] = "";
		["text"] = "Don't move too fast and watch for the big ones preparing to go boom. Hold your breath and run like hell if you have triggered one.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00263"] = {
		["ID"] = 263;
		["actor"] = 2;
		["connectID"] = 267;
		["posX"] = 9360;
		["posY"] = 4410;
		["script"] = "";
		["text"] = "For your own safety you better think that there isn't.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00264"] = {
		["ID"] = 264;
		["actor"] = 2;
		["connectID"] = 285;
		["posX"] = 8400;
		["posY"] = 4650;
		["script"] = "";
		["text"] = "Unless you bring an army of well trained and armed men to shoot down those bastards, this is our best chance. What do you say?";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00265"] = {
		["ID"] = 265;
		["actor"] = 2;
		["connectID"] = 278;
		["posX"] = 9360;
		["posY"] = 3930;
		["script"] = "";
		["text"] = "Just be careful not to break a leg or something. On the other side of these ledges you will find the second entrance to the scalphunters lair. Unguarded, I hope.";
		["time"] = 16;
		["topic"] = "angry_bugs:herbalist_sneaking";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00266"] = {
		["ID"] = 266;
		["actor"] = 2;
		["connectID"] = 269;
		["posX"] = 8640;
		["posY"] = 4410;
		["script"] = "";
		["text"] = "And even If you don't suffocate, you might cough your lungs out later, cause the spores are causing a strong allergic reaction. That's their means of transportation. It won't kill a hornhog but humas and quargo are not so endurable.";
		["time"] = 21;
		["type"] = "message";
	};
	["message_00267"] = {
		["ID"] = 267;
		["actor"] = 1;
		["connectID"] = 298;
		["posX"] = 9600;
		["posY"] = 4410;
		["script"] = "";
		["text"] = "Fine, what have these murderous mushrooms to do with our scalphunter problem?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00268"] = {
		["ID"] = 268;
		["actor"] = 2;
		["animation"] = "dl_chuckle";
		["connectID"] = 294;
		["posX"] = 8880;
		["posY"] = 4080;
		["script"] = "";
		["text"] = "You were so serious I just couldn't resist. Don't hold it against a lonely old abori.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00269"] = {
		["ID"] = 269;
		["actor"] = 2;
		["connectID"] = 299;
		["posX"] = 8880;
		["posY"] = 4410;
		["script"] = "";
		["text"] = "If the victim dies - the body becomes a fertilizer for the new colony of shrooms.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00270"] = {
		["ID"] = 270;
		["actor"] = 2;
		["connectID"] = 273;
		["posX"] = 7920;
		["posY"] = 3930;
		["script"] = "";
		["text"] = "Infiltrating the cave from the main entrance might be difficult indeed. I would not risk it even when I was younger, but you look agile and might have a shot. If you realy that bad at sneaking, I have another solution for you.";
		["time"] = 22.5;
		["type"] = "message";
	};
	["message_00271"] = {
		["ID"] = 271;
		["actor"] = 2;
		["connectID"] = 291;
		["posX"] = 7680;
		["posY"] = 4410;
		["script"] = "";
		["text"] = "But we don't really have much of a choice but to try. Tell me huma, do you know how to spot a stinky mushroom?";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00272"] = {
		["ID"] = 272;
		["actor"] = 2;
		["connectID"] = 290;
		["posX"] = 8160;
		["posY"] = 3780;
		["script"] = "";
		["text"] = "It's dim and cold there, lots of drafts. I doubt they have any watchmen patrolling the gallery. They rather stick to their warm fires and drink themselves into oblivion. They don't see the outcasts as a credible threat.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00273"] = {
		["ID"] = 273;
		["actor"] = 2;
		["connectID"] = 297;
		["posX"] = 8160;
		["posY"] = 3930;
		["script"] = "";
		["text"] = "We outcasts know that there is a second entrance to the cave. I doubt the savages have discovered it already and even if they did, they are lazy by the nature.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00274"] = {
		["ID"] = 274;
		["actor"] = 1;
		["animation"] = "dl_hands_washing";
		["connectID"] = 280;
		["posX"] = 8160;
		["posY"] = 4080;
		["script"] = "";
		["text"] = "That does sound dangerous. Why would the hive attack them and not me?";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00275"] = {
		["ID"] = 275;
		["actor"] = 2;
		["connectID"] = 271;
		["posX"] = 9360;
		["posY"] = 4080;
		["script"] = "";
		["text"] = "Well, one of the bughunters I have encountered long ago has shared a professional secret with me. Considering the fact that he traded it for a mug of cheapest beer that secret should be either not much of a secret or not effective.";
		["time"] = 22.5;
		["type"] = "message";
	};
	["message_00276"] = {
		["ID"] = 276;
		["actor"] = 2;
		["connectID"] = 289;
		["posX"] = 8880;
		["posY"] = 3930;
		["script"] = "";
		["text"] = "Oh, it's not far from here. When you exit my hideout, turn right and follow the path, always hug the rock wall and don't go down the valley. You will see a large niche in the wall and a lot of old bitebug hives. Between them is the entrance to the narrow mountain pass. ";
		["time"] = 28.5;
		["type"] = "message";
	};
	["message_00277"] = {
		["ID"] = 277;
		["actor"] = 2;
		["connectID"] = 288;
		["posX"] = 9120;
		["posY"] = 4650;
		["script"] = "";
		["text"] = "Go down to the lake below, in the valley. Just before you enter the water turn right and look for a cave entrance overgrown with some bluethorn. You might find some shrooms in there. This cave was a waste disposal for Big Hat's hunting party.\
";
		["time"] = 23.5;
		["type"] = "message";
	};
	["message_00279"] = {
		["ID"] = 279;
		["actor"] = 1;
		["connectID"] = 276;
		["posX"] = 8640;
		["posY"] = 3930;
		["script"] = "";
		["text"] = "They won't see it coming. Where can I find this second entrance?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00280"] = {
		["ID"] = 280;
		["actor"] = 2;
		["connectID"] = 281;
		["posX"] = 8400;
		["posY"] = 4080;
		["script"] = "";
		["text"] = "The bitebugs don't like the taste of huma flesh. They will just bite your pink ass once and then bugger off!";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00281"] = {
		["ID"] = 281;
		["actor"] = 1;
		["animation"] = "dl_head_shake";
		["connectID"] = 268;
		["posX"] = 8640;
		["posY"] = 4080;
		["script"] = "";
		["text"] = "You can't be serious!";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00282"] = {
		["ID"] = 282;
		["actor"] = 2;
		["connectID"] = 189;
		["posX"] = 11250;
		["posY"] = 3990;
		["script"] = "";
		["text"] = "Hey, that might just work.";
		["time"] = 3.5;
		["topic"] = "angry_bugs:herbalist_trick";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00283"] = {
		["ID"] = 283;
		["actor"] = 2;
		["connectID"] = 272;
		["posX"] = 7920;
		["posY"] = 3780;
		["script"] = "";
		["text"] = "As far as I remember the cave has a long stone gallery inside, that makes it pretty easy to sneak up to the camp. If you're careful. You will find this gallery on the right side, going from the main entrance.";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00284"] = {
		["ID"] = 284;
		["actor"] = 2;
		["connectID"] = 239;
		["posX"] = 11250;
		["posY"] = 3870;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"angry_bugs\", \"herbalist_knowledge\")\
       or getQuestTopicVisible(\"angry_bugs\", \"herbalist_sneaking\")\
       or getQuestTopicVisible(\"angry_bugs\", \"herbalist_nature\")\
end\
\
";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00285"] = {
		["ID"] = 285;
		["actor"] = 1;
		["connectID"] = 295;
		["posX"] = 8640;
		["posY"] = 4650;
		["script"] = "";
		["text"] = "Well, I have won with worse odds. Where can I find these mushrooms? Hopefully I don't need to cultivate them on decaying corpses! ";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00286"] = {
		["ID"] = 286;
		["actor"] = 2;
		["connectID"] = 302;
		["posX"] = 10320;
		["posY"] = 4650;
		["script"] = "";
		["text"] = "Half a dozen shrooms should be enough, we don't want to start another migration of bitebugs. Those can be a real disaster. I've seen large villages abandoned because of the bitebugs' wrath.";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00287"] = {
		["ID"] = 287;
		["actor"] = 2;
		["connectID"] = 286;
		["posX"] = 10080;
		["posY"] = 4650;
		["script"] = "";
		["text"] = "You need to get to the small ones. Carefully break the shell with a knife or any other melee weapon and get the unripe shroom. They should still have a decent amount of spores for our goals.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00288"] = {
		["ID"] = 288;
		["actor"] = 1;
		["connectID"] = 259;
		["posX"] = 9360;
		["posY"] = 4650;
		["script"] = "";
		["text"] = "How do I collect the shrooms if they are explosive?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00289"] = {
		["ID"] = 289;
		["actor"] = 2;
		["connectID"] = 265;
		["posX"] = 9120;
		["posY"] = 3930;
		["script"] = "";
		["text"] = "It is not secret but rarely visited by anyone as it makes quite a long route. Once you go through that pass, you will find yourself on these rock ledges clinging to the side of a big opening. This area might be a bit confusing so proceed with care.";
		["time"] = 25.5;
		["type"] = "message";
	};
	["message_00290"] = {
		["ID"] = 290;
		["actor"] = 2;
		["connectID"] = 278;
		["posX"] = 8400;
		["posY"] = 3780;
		["script"] = "";
		["text"] = "Besides, most of the time, we bipedal creatures tend to look at each other and at the ground rather than above. Use this area to safely navigate the cave but be careful - you're not completely invisible there.";
		["time"] = 20;
		["topic"] = "angry_bugs:herbalist_knowledge";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00291"] = {
		["ID"] = 291;
		["actor"] = 1;
		["connectID"] = 301;
		["posX"] = 7920;
		["posY"] = 4410;
		["script"] = "";
		["text"] = "I'm not sure.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00292"] = {
		["ID"] = 292;
		["actor"] = 1;
		["connectID"] = 261;
		["posX"] = 7680;
		["posY"] = 4080;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"angry_bugs\", \"herbalist_nature\")\
end\
\
";
		["text"] = "What about Mother Nature?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00293"] = {
		["ID"] = 293;
		["actor"] = 2;
		["connectID"] = 266;
		["posX"] = 8400;
		["posY"] = 4410;
		["script"] = "";
		["text"] = "The thing is that the shroom is explosive. It tends to go boom when it feels a big moving target around its mycelium. And the spores are the real danger here. They are sticky and a thick cloud could easily suffocate you.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00294"] = {
		["ID"] = 294;
		["actor"] = 1;
		["connectID"] = 275;
		["posX"] = 9120;
		["posY"] = 4080;
		["script"] = "";
		["text"] = "You old devil almost got me there! So how do we control the bugs?";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00295"] = {
		["ID"] = 295;
		["actor"] = 2;
		["connectID"] = 277;
		["posX"] = 8880;
		["posY"] = 4650;
		["script"] = "";
		["text"] = "Well in this arid area the stinking mushrooms are not easy to find. They might grow in caves with lots of organic wastes. Luckily for you I know one such place.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00296"] = {
		["ID"] = 296;
		["actor"] = 1;
		["animation"] = "dl_look_right";
		["connectID"] = 270;
		["posX"] = 7680;
		["posY"] = 3930;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"angry_bugs\", \"herbalist_sneaking\")\
end\
\
";
		["text"] = "I don't think I'm that good at sneaking. Out of practice.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00297"] = {
		["ID"] = 297;
		["actor"] = 2;
		["connectID"] = 279;
		["posX"] = 8400;
		["posY"] = 3930;
		["script"] = "";
		["text"] = "I won't expect them to set traps or some serious watchpost there. They feel confident and don't expect any real threat from us. Still you might stumble on a couple of bastards just taking a leak outside of their camp. Be prepared to neutralize them quielty.";
		["time"] = 24;
		["type"] = "message";
	};
	["message_00298"] = {
		["ID"] = 298;
		["actor"] = 2;
		["animation"] = "dl_raisedfinger_left";
		["connectID"] = 303;
		["posX"] = 7680;
		["posY"] = 4650;
		["script"] = "";
		["text"] = "Add one to one and figure it out, huma!";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00299"] = {
		["ID"] = 299;
		["actor"] = 1;
		["connectID"] = 263;
		["posX"] = 9120;
		["posY"] = 4410;
		["script"] = "";
		["text"] = "Is there a life form on this planet that is not trying to kill you in some disgusting and painful way? ";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00300"] = {
		["ID"] = 300;
		["actor"] = 2;
		["connectID"] = 278;
		["posX"] = 10800;
		["posY"] = 4650;
		["script"] = "";
		["text"] = "I will, huma. Those scalphunters make our life unbearable. As you've seen we are already fighting among ourselves for the last scraps we have. This is the worst that could happen with the outcasts like us.";
		["time"] = 19;
		["topic"] = "angry_bugs:herbalist_nature";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00301"] = {
		["ID"] = 301;
		["actor"] = 2;
		["connectID"] = 293;
		["posX"] = 8160;
		["posY"] = 4410;
		["script"] = "";
		["text"] = "The stinking mushroom is not very poisonous on its own. Not lethal at least. Even edible if cooked properly.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00302"] = {
		["ID"] = 302;
		["actor"] = 1;
		["connectID"] = 300;
		["posX"] = 10560;
		["posY"] = 4650;
		["script"] = "";
		["text"] = "Got it. Well, old man, pray that your plan works.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00303"] = {
		["ID"] = 303;
		["actor"] = 1;
		["connectID"] = 304;
		["posX"] = 7920;
		["posY"] = 4650;
		["script"] = "";
		["text"] = "You want to stink up those hives with the shrooms so the bugs will get mad and attack whoever's close in a frenzy? What are the chances this crazy method is going to work at all?";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00304"] = {
		["ID"] = 304;
		["actor"] = 2;
		["connectID"] = 264;
		["posX"] = 8160;
		["posY"] = 4650;
		["script"] = "";
		["text"] = "Well, I haven't tried this trick myself. But the bughunters definitely did and they survive somehow. Mostly. I would say the chances are even: either it works or you get eaten alive by some very angry bugs.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00306"] = {
		["ID"] = 306;
		["actor"] = 2;
		["connectID"] = 66;
		["h"] = 100;
		["posX"] = 5730;
		["posY"] = 4650;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
		["w"] = 109;
	};
	["message_00310"] = {
		["ID"] = 310;
		["actor"] = 2;
		["posX"] = 1170;
		["posY"] = -540;
		["script"] = "";
		["text"] = "At cave";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00311"] = {
		["ID"] = 311;
		["actor"] = 2;
		["posX"] = 1200;
		["posY"] = 480;
		["script"] = "";
		["text"] = "While junk clothes";
		["time"] = 0;
		["type"] = "annotation";
	};
	["message_00314"] = {
		["ID"] = 314;
		["actor"] = 2;
		["animation"] = "dl_head_scratch";
		["connectID"] = 17;
		["posX"] = 2040;
		["posY"] = -1470;
		["script"] = "";
		["text"] = "What? No, mojo is... that's, umm... what's the word... Ah, I see. That was humor.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00315"] = {
		["ID"] = 315;
		["actor"] = 1;
		["animation"] = "dl_hand_chopfast";
		["connectID"] = 323;
		["posX"] = 1800;
		["posY"] = -1320;
		["script"] = "";
		["text"] = "This scum robbed me and left for dead in the middle of nowhere. They got what they deserved.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00316"] = {
		["ID"] = 316;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 315;
		["posX"] = 1560;
		["posY"] = -1320;
		["script"] = "";
		["text"] = "Oh, huma, I don't think it was a good idea to kill these poor deadbeats. You went too far.";
		["time"] = 10.5;
		["topic"] = "my_clothes:herbalist_killed_looters";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00317"] = {
		["ID"] = 317;
		["actor"] = 1;
		["connectID"] = 17;
		["posX"] = 1800;
		["posY"] = -1170;
		["script"] = "";
		["text"] = "Pain is an effective teacher. Well, I'm always in the mood to kick a couple of brazen asses.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00318"] = {
		["ID"] = 318;
		["actor"] = 2;
		["connectID"] = 317;
		["posX"] = 1560;
		["posY"] = -1170;
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
		["text"] = "[HIDDEN]You beat the shit out of them! Now these assholes know what it means to be on the receiving end of a good beating.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00319"] = {
		["ID"] = 319;
		["actor"] = 1;
		["connectID"] = 325;
		["posX"] = 2280;
		["posY"] = -1320;
		["script"] = "";
		["text"] = "That's where they made their biggest mistake. They didn't finish the job. They didn't expect me to survive. But I did.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00321"] = {
		["ID"] = 321;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 2760;
		["posY"] = -1320;
		["script"] = "";
		["text"] = "I'll keep it in mind. And considering this place, you probably have a point.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00323"] = {
		["ID"] = 323;
		["actor"] = 2;
		["connectID"] = 319;
		["posX"] = 2040;
		["posY"] = -1320;
		["script"] = "";
		["text"] = "But they didn't kill you.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00324"] = {
		["ID"] = 324;
		["actor"] = 2;
		["connectID"] = 326;
		["posX"] = 1560;
		["posY"] = -1470;
		["script"] = "";
		["text"] = "I admit, I'm surprised you managed to disperse these punks without violence. You have a very strong mojo.";
		["time"] = 10;
		["topic"] = "my_clothes:herbalist_scared_looters";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00325"] = {
		["ID"] = 325;
		["actor"] = 1;
		["animation"] = "dl_hands_strike";
		["connectID"] = 321;
		["posX"] = 2520;
		["posY"] = -1320;
		["script"] = "";
		["text"] = "You see, old man, the difference between me and other rabble is that I always make sure that the bastard who crossed me doesn't get a second chance. And sometimes the only way is to get your hands a little dirty.";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00326"] = {
		["ID"] = 326;
		["actor"] = 1;
		["animation"] = "dl_hand_negative";
		["connectID"] = 314;
		["posX"] = 1800;
		["posY"] = -1470;
		["script"] = "";
		["text"] = "That was uncalled for, old-timer. I actually wash myself regularly!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00327"] = {
		["ID"] = 327;
		["actor"] = 1;
		["posX"] = 330;
		["posY"] = -570;
		["script"] = "local coro = require \"coroutines.helpers\"\
function message:onStart()\
   runTimerCo(function()\
      self:fireDiscussEvent(\"herbalist_intro:herbalist_start\")\
\
      coro.wait(0)\
\
      self:fireDiscussEvent(\"herbalist_intro:herbalist_give_staff\")\
   end)\
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
		["text"] = "GO TO CAVE";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00329"] = {
		["ID"] = 329;
		["actor"] = 1;
		["posX"] = 330;
		["posY"] = -420;
		["script"] = "local coro = require \"coroutines.helpers\"\
function message:onStart()\
   runTimerCo(function()\
      self:fireDiscussEvent(\"herbalist_intro:herbalist_start\")\
\
      coro.wait(0)\
\
      self:fireDiscussEvent(\"herbalist_intro:herbalist_give_staff\")\
\
      coro.wait(0)\
\
      local q = getQuest(\"herbalist_intro\")\
      local target = getObj(q.herbalist_cave_wp)\
      local abori = getObj(\"herbalist\")\
      teleportTo(abori, target)\
      teleportTo(getMC(), target)\
\
      abori.navigator:setPatrolRoute(nil)\
      abori.navigator.patrolPoints = nil\
\
      coro.wait(0)\
\
      self:fireDiscussEvent(\"herbalist_intro:herbalist_finish\")\
   end)\
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
		["text"] = "SKIP TO MAIN";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00337"] = {
		["ID"] = 337;
		["actor"] = 1;
		["connectID"] = 338;
		["posX"] = 2580;
		["posY"] = 2400;
		["script"] = "";
		["text"] = "\\[Give Armorer's Tools]Here are the tools.";
		["time"] = 4;
		["topic"] = "herbalist_tools:herbalist_give_tools";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00338"] = {
		["ID"] = 338;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["connectID"] = 339;
		["posX"] = 2820;
		["posY"] = 2400;
		["script"] = "";
		["text"] = "This is exactly what I needed! So how did you manage to get them?";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00340"] = {
		["ID"] = 340;
		["actor"] = 1;
		["connectID"] = 421;
		["posX"] = 3240;
		["posY"] = 2400;
		["script"] = "";
		["text"] = "I got it from the Scrap Master, as you advised.";
		["time"] = 6;
		["topic"] = "herbalist_tools:herbalist_tools_from_scrap_master";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00341"] = {
		["ID"] = 341;
		["actor"] = 1;
		["connectID"] = 423;
		["posX"] = 3240;
		["posY"] = 2250;
		["script"] = "";
		["text"] = "Bought them from that scumbag Ragpicker. I suspect that the markup was exorbitant.";
		["time"] = 7.5;
		["topic"] = "herbalist_tools:herbalist_tools_from_ragpicker";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00342"] = {
		["ID"] = 342;
		["actor"] = 1;
		["connectID"] = 426;
		["posX"] = 3240;
		["posY"] = 2550;
		["script"] = "";
		["text"] = "Well, let's just say, I borrowed them... for an indefinite period.";
		["time"] = 6.5;
		["topic"] = "herbalist_tools:herbalist_tools_stolen";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00343"] = {
		["ID"] = 343;
		["actor"] = 2;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 344;
		["posX"] = 4110;
		["posY"] = 2370;
		["script"] = "";
		["text"] = "Have you delivered the message I gave you?";
		["time"] = 5;
		["topic"] = "herbalist_tools:herbalist_about_message";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00345"] = {
		["ID"] = 345;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 427;
		["posX"] = 4800;
		["posY"] = 2160;
		["script"] = "";
		["text"] = "Yes, like you asked I gave your letter to the Scrap Master and it seems he was glad to receive it.";
		["time"] = 11.5;
		["topic"] = "herbalist_tools:scrap_master_has_message";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00346"] = {
		["ID"] = 346;
		["actor"] = 1;
		["animation"] = "dl_talk_3";
		["connectID"] = 430;
		["posX"] = 4800;
		["posY"] = 2310;
		["script"] = "";
		["text"] = "No, I gave it to the guard at the camp's entrance when he was interrogating me.";
		["time"] = 9;
		["topic"] = "herbalist_tools:cudgel_has_message";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00347"] = {
		["ID"] = 347;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 434;
		["posX"] = 4800;
		["posY"] = 2460;
		["script"] = "";
		["text"] = "I couldn't pass the note. Here - take it.";
		["time"] = 5.5;
		["topic"] = "herbalist_tools:herbalist_give_message";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00348"] = {
		["ID"] = 348;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 480;
		["posX"] = 4800;
		["posY"] = 2610;
		["script"] = "";
		["text"] = "I lost it.";
		["time"] = 2.5;
		["topic"] = "herbalist_tools:herbalist_message_lost";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00355"] = {
		["ID"] = 355;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 539;
		["posX"] = 2580;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "Turns out you're a troublemaker, old man.";
		["time"] = 4.5;
		["topic"] = "herbalist_tools:herbalist_about_camp_exile";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00356"] = {
		["ID"] = 356;
		["actor"] = 2;
		["animation"] = "dl_head_wipe";
		["connectID"] = 445;
		["posX"] = 3180;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "Well... It's a sad story, huma. During the long time I lived in the Outcast camp, I used my humble knowledge of medicinal herbs to help my fellow aboris. I made a lot of friends, and after a while I was well-respected within the camp.";
		["time"] = 23.5;
		["topic"] = "herbalist_tools:herbalist_about_camp_exile";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00357"] = {
		["ID"] = 357;
		["actor"] = 1;
		["posX"] = 330;
		["posY"] = -240;
		["script"] = "function message:onStart()\
      self:fireDiscussEvent(\"herbalist_tools:herbalist_start\")\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not isQuestStarted(\"herbalist_tools\")\
end\
\
";
		["text"] = "START TOOLS";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00358"] = {
		["ID"] = 358;
		["actor"] = 2;
		["connectID"] = 360;
		["posX"] = 1290;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Sit down by the fire, huma. We can talk now. Here's something from my stocks. It's not much, but this is all the hospitality I can afford.";
		["time"] = 14.5;
		["topic"] = "abori_goes_home:finish";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00359"] = {
		["ID"] = 359;
		["actor"] = 2;
		["connectID"] = 358;
		["posX"] = 1050;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Here we are! Don't mind the dead - they scare away unwanted guests.";
		["time"] = 7.5;
		["topic"] = "abori_goes_home:finish";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00360"] = {
		["ID"] = 360;
		["actor"] = 1;
		["connectID"] = 361;
		["posX"] = 1530;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Thanks, let's continue our conversation.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00361"] = {
		["ID"] = 361;
		["actor"] = 2;
		["connectID"] = 66;
		["posX"] = 1770;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Why not? Time is something I have plenty of now. I can spend all the time I want just talking to another soul.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00421"] = {
		["ID"] = 421;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["connectID"] = 422;
		["posX"] = 3510;
		["posY"] = 2400;
		["script"] = "";
		["text"] = "Surely he made you sweat, [laughs] khe-khe. But now you know the way things are done in the outcast camp.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00422"] = {
		["ID"] = 422;
		["actor"] = 1;
		["connectID"] = 343;
		["posX"] = 3780;
		["posY"] = 2400;
		["script"] = "";
		["text"] = "Very funny, old man! Hopefully next time I don’t have to build a spaceship to get a discount from one of your friends!";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00423"] = {
		["ID"] = 423;
		["actor"] = 2;
		["animation"] = "dl_talk_3";
		["connectID"] = 424;
		["posX"] = 3510;
		["posY"] = 2250;
		["script"] = "";
		["text"] = "It probably was, huma. This whole situation with the Scalphunters drove the prices in the camp indecently high, to the delight of the traders. But your shards are your shards.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00424"] = {
		["ID"] = 424;
		["actor"] = 1;
		["connectID"] = 343;
		["posX"] = 3780;
		["posY"] = 2250;
		["script"] = "";
		["text"] = "Exactly. Payment resolves the issue.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00425"] = {
		["ID"] = 425;
		["actor"] = 1;
		["connectID"] = 343;
		["posX"] = 3780;
		["posY"] = 2550;
		["script"] = "";
		["text"] = "Don't worry, old man. I've managed to keep my head on my shoulders until now, and I've done things more dangerous than robbing a bum camp.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00426"] = {
		["ID"] = 426;
		["actor"] = 2;
		["animation"] = "dl_talk_2";
		["connectID"] = 425;
		["posX"] = 3510;
		["posY"] = 2550;
		["script"] = "";
		["text"] = "Be careful with such \"borrowings\", some day they might put a reward for \"borrowing\" your own head.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00427"] = {
		["ID"] = 427;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["connectID"] = 477;
		["posX"] = 5070;
		["posY"] = 2160;
		["script"] = "";
		["text"] = "This is wonderful, huma! I'm glad you can be trusted.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00430"] = {
		["ID"] = 430;
		["actor"] = 2;
		["animation"] = "dl_talk_2";
		["connectID"] = 431;
		["posX"] = 5070;
		["posY"] = 2310;
		["script"] = "";
		["text"] = "Well, I accounted for that outcome by adding a couple of \"pleasant\" words at the end for Big Hat and his henchmen. Hopefully they'll get it soon.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00431"] = {
		["ID"] = 431;
		["actor"] = 1;
		["connectID"] = 432;
		["posX"] = 5340;
		["posY"] = 2310;
		["script"] = "";
		["text"] = "So you're not mad at me?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00432"] = {
		["ID"] = 432;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 477;
		["posX"] = 5610;
		["posY"] = 2310;
		["script"] = "";
		["text"] = "No, but now I know that you, huma, are not a particularly reliable messenger.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00434"] = {
		["ID"] = 434;
		["actor"] = 2;
		["animation"] = "dl_talk_3";
		["connectID"] = 436;
		["posX"] = 5070;
		["posY"] = 2460;
		["script"] = "";
		["text"] = "How come?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00435"] = {
		["ID"] = 435;
		["actor"] = 2;
		["animation"] = "dl_hand_showright";
		["connectID"] = 477;
		["posX"] = 5610;
		["posY"] = 2460;
		["script"] = "";
		["text"] = "Well, now I'll have to find someone else to do the job.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00436"] = {
		["ID"] = 436;
		["actor"] = 1;
		["connectID"] = 435;
		["posX"] = 5340;
		["posY"] = 2460;
		["script"] = "";
		["text"] = "I was too occupied with my own business to play as a letter-boy.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00441"] = {
		["ID"] = 441;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 189;
		["posX"] = 4590;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "No, huma, I don't think so. They just don't want me to keep in touch with my friends. They might ask you questions, but a witty guy like you won't be at a loss for words.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00442"] = {
		["ID"] = 442;
		["actor"] = 2;
		["animation"] = "dl_hand_facepalm";
		["connectID"] = 443;
		["posX"] = 4050;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "He ordered not only to prevent me from entering the camp but also to prevent me from contacting other aboris. An outcast exiled an outcast. Absurd, isn't it huma?";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00443"] = {
		["ID"] = 443;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 441;
		["posX"] = 4320;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "Wouldn't I get in trouble if they catch a wind that I was talking to you?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00445"] = {
		["ID"] = 445;
		["actor"] = 2;
		["connectID"] = 556;
		["posX"] = 3450;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "I wouldn't say I didn't enjoy that authority, but camp leadership wasn't in my plans. Nonetheless, our radiant chief Big Hat was insecure enough to consider me a threat to his authority.";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00476"] = {
		["ID"] = 476;
		["actor"] = 2;
		["animation"] = "dl_talk_3";
		["connectID"] = 189;
		["posX"] = 6570;
		["posY"] = 2400;
		["script"] = "";
		["text"] = "Here's what I have for you.";
		["time"] = 4;
		["topic"] = "herbalist_tools:herbalist_finish";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00477"] = {
		["ID"] = 477;
		["actor"] = 1;
		["connectID"] = 476;
		["posX"] = 6270;
		["posY"] = 2400;
		["script"] = "";
		["text"] = "What about my reward?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00480"] = {
		["ID"] = 480;
		["actor"] = 2;
		["animation"] = "dl_hand_facepalm";
		["connectID"] = 477;
		["posX"] = 5070;
		["posY"] = 2610;
		["script"] = "";
		["text"] = "What a blunder! Well now I know, huma, that you're not reliable for such messages.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00488"] = {
		["ID"] = 488;
		["actor"] = 2;
		["animation"] = "dl_bow_2";
		["connectID"] = 491;
		["posX"] = 1170;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "Thank you very much, I can't imagine myself without it. You should follow me now, I can lead you to a safer location where we could talk.";
		["time"] = 14.5;
		["topic"] = "herbalist_intro:herbalist_give_staff";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00489"] = {
		["ID"] = 489;
		["actor"] = 2;
		["connectID"] = 492;
		["posX"] = 1710;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "For instance, I might know a way for you to clothe your pink body before it burns under the sun.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00490"] = {
		["ID"] = 490;
		["actor"] = 2;
		["posX"] = 2250;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "Follow me.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00491"] = {
		["ID"] = 491;
		["actor"] = 1;
		["connectID"] = 489;
		["posX"] = 1440;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "And what do we have to talk about?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00492"] = {
		["ID"] = 492;
		["actor"] = 1;
		["connectID"] = 490;
		["posX"] = 1980;
		["posY"] = -1020;
		["script"] = "";
		["text"] = "Alright, lead on.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00493"] = {
		["ID"] = 493;
		["actor"] = 2;
		["posX"] = 1170;
		["posY"] = -840;
		["script"] = "";
		["text"] = "Please, bring me my staff.";
		["time"] = 3.5;
		["topic"] = "herbalist_intro:herbalist_about_staff";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00494"] = {
		["ID"] = 494;
		["actor"] = 2;
		["connectID"] = 25;
		["posX"] = 1170;
		["posY"] = -390;
		["script"] = "";
		["text"] = "And here we are. The bastards wouldn't dare to stir trouble so close to the camp, lest they attract the attention of the camp's guards.";
		["time"] = 13.5;
		["topic"] = "herbalist_intro:herbalist_finish";
		["topic_check_visible"] = true;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00497"] = {
		["ID"] = 497;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["connectID"] = 499;
		["posX"] = 2850;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "I can't help you with weapons, but I can make you an armor of sorts. But I would need special tools for that, the ones I have are completely worn out.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00498"] = {
		["ID"] = 498;
		["actor"] = 2;
		["animation"] = "dl_talk_2";
		["connectID"] = 501;
		["posX"] = 4500;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "He spends most of the time in his workshop. You can't really miss the scrap workshop - it's one of the biggest buildings in the camp.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00499"] = {
		["ID"] = 499;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 504;
		["posX"] = 3120;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "So where can I find these tools?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00500"] = {
		["ID"] = 500;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 497;
		["posX"] = 2580;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "Do you know where I can get some equipment? Weapons, clothes, supplies?";
		["time"] = 7;
		["topic"] = "herbalist_tools:herbalist_start";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00501"] = {
		["ID"] = 501;
		["actor"] = 2;
		["connectID"] = 507;
		["posX"] = 4740;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "If you see him, give him this message. He might even give you a discount.";
		["time"] = 8.5;
		["topic"] = "herbalist_tools:herbalist_start";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00503"] = {
		["ID"] = 503;
		["actor"] = 1;
		["animation"] = "dl_head_nod";
		["connectID"] = 189;
		["posX"] = 5790;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "Alright, I'll try not to forget about the message.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00504"] = {
		["ID"] = 504;
		["actor"] = 2;
		["animation"] = "dl_talk_3";
		["connectID"] = 506;
		["posX"] = 3390;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "There should be a good set in the outcast camp.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00506"] = {
		["ID"] = 506;
		["actor"] = 2;
		["connectID"] = 537;
		["posX"] = 3660;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "The local traders most likely have one for sale, but those sons of slimetoads would rip you off in an instant.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00507"] = {
		["ID"] = 507;
		["actor"] = 1;
		["connectID"] = 508;
		["posX"] = 4980;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "Sure, give me the message. You sure your pal ain't gonna try something funny after reading this message?";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00508"] = {
		["ID"] = 508;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 528;
		["posX"] = 5250;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "Don't worry, he'll do no such thing. In the letter I simply greet him and tell him that I'm ok. He has a bad temper so don't take it personally.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00509"] = {
		["ID"] = 509;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 498;
		["posX"] = 4230;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "And where can I find that old friend of yours?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00510"] = {
		["ID"] = 510;
		["actor"] = 1;
		["connectID"] = 524;
		["posX"] = 2460;
		["posY"] = 6630;
		["script"] = "";
		["text"] = "I have to go.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00511"] = {
		["ID"] = 511;
		["actor"] = 1;
		["animation"] = "dl_talk_2";
		["connectID"] = 526;
		["posX"] = 3570;
		["posY"] = 6630;
		["script"] = "";
		["text"] = "So where can I find these tools?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00516"] = {
		["ID"] = 516;
		["actor"] = 2;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 511;
		["posX"] = 3270;
		["posY"] = 6630;
		["script"] = "";
		["text"] = "I can't help you with weapons, but I can make you an armor of sorts. But I would need special tools for that, the ones I have are completely worn out.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00524"] = {
		["ID"] = 524;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["connectID"] = 555;
		["posX"] = 2730;
		["posY"] = 6630;
		["script"] = "";
		["text"] = "By the way, in case you need better equipment, I might be able to do something about that.";
		["time"] = 10;
		["topic"] = "herbalist_tools:herbalist_start";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00526"] = {
		["ID"] = 526;
		["actor"] = 2;
		["animation"] = "dl_talk_3";
		["connectID"] = 534;
		["posX"] = 3840;
		["posY"] = 6630;
		["script"] = "";
		["text"] = "There should be a good set in the outcast camp.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00528"] = {
		["ID"] = 528;
		["actor"] = 2;
		["connectID"] = 503;
		["posX"] = 5520;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "The old fart can be a real pain in the ass, but he respects honest workers, no matter the species. I can't imagine him swindling someone.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00529"] = {
		["ID"] = 529;
		["actor"] = 2;
		["animation"] = "dl_talk_2";
		["connectID"] = 531;
		["posX"] = 4890;
		["posY"] = 6630;
		["script"] = "";
		["text"] = "He spends most of the time in his workshop. You can't really miss the scrap workshop - it's one of the biggest buildings in the camp.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00530"] = {
		["ID"] = 530;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 536;
		["posX"] = 5640;
		["posY"] = 6630;
		["script"] = "";
		["text"] = "Don't worry, he'll do no such thing. In the letter I simply greet him and tell him that I'm ok. He has a bad temper so don't take it personally.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00531"] = {
		["ID"] = 531;
		["actor"] = 2;
		["connectID"] = 532;
		["posX"] = 5130;
		["posY"] = 6630;
		["script"] = "";
		["text"] = "If you see him, give him this message. He might even give you a discount.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00532"] = {
		["ID"] = 532;
		["actor"] = 1;
		["connectID"] = 530;
		["posX"] = 5370;
		["posY"] = 6630;
		["script"] = "";
		["text"] = "Sure, give me the message. You sure your pal ain't gonna try something funny after reading this message?";
		["time"] = 10;
		["topic"] = "herbalist_tools:herbalist_start";
		["topic_check_visible"] = false;
		["topic_fire_event"] = "onStart";
		["type"] = "message";
	};
	["message_00533"] = {
		["ID"] = 533;
		["actor"] = 1;
		["animation"] = "dl_head_nod";
		["posX"] = 6180;
		["posY"] = 6630;
		["script"] = "";
		["text"] = "Alright, I'll try not to forget about the message.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00534"] = {
		["ID"] = 534;
		["actor"] = 2;
		["connectID"] = 538;
		["posX"] = 4110;
		["posY"] = 6630;
		["script"] = "";
		["text"] = "The local traders most likely have one for sale, but those sons of slimetoads would rip you off in an instant.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00535"] = {
		["ID"] = 535;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 529;
		["posX"] = 4650;
		["posY"] = 6630;
		["script"] = "";
		["text"] = "And where can I find that old friend of yours?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00536"] = {
		["ID"] = 536;
		["actor"] = 2;
		["connectID"] = 533;
		["posX"] = 5910;
		["posY"] = 6630;
		["script"] = "";
		["text"] = "The old fart can be a real pain in the ass, but he respects honest workers, no matter the species. I can't imagine him swindling someone.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00537"] = {
		["ID"] = 537;
		["actor"] = 2;
		["connectID"] = 509;
		["posX"] = 3930;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "I have a better idea - you should find my old friend Scrap Master, he should have a set as well.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00538"] = {
		["ID"] = 538;
		["actor"] = 2;
		["connectID"] = 535;
		["posX"] = 4380;
		["posY"] = 6630;
		["script"] = "";
		["text"] = "I have a better idea - you should find my old friend Scrap Master, he should have a set as well.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00539"] = {
		["ID"] = 539;
		["actor"] = 1;
		["connectID"] = 356;
		["posX"] = 2850;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "The guards told me you were booted off the camp. And there should have been a reason. What did you do?";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00540"] = {
		["ID"] = 540;
		["actor"] = 1;
		["connectID"] = 488;
		["posX"] = 3360;
		["posY"] = -1320;
		["script"] = "";
		["text"] = "Is this the staff you're talking about?";
		["time"] = 4.5;
		["topic"] = "herbalist_intro:herbalist_give_staff";
		["topic_check_visible"] = true;
		["topic_fire_event"] = false;
		["type"] = "message";
	};
	["message_00555"] = {
		["ID"] = 555;
		["actor"] = 1;
		["animation"] = "dl_talk_1";
		["connectID"] = 516;
		["posX"] = 3000;
		["posY"] = 6630;
		["script"] = "";
		["text"] = "What kind of equipment?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00556"] = {
		["ID"] = 556;
		["actor"] = 2;
		["connectID"] = 442;
		["posX"] = 3750;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "And after a certain unfortunate incident... But that doesn't matter anymore.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["switch_00003"] = {
		["ID"] = 3;
		["connectionsID"] = {
			[1] = 327;
			[2] = 329;
			[3] = 357;
			[4] = 2;
		};
		["h"] = 120;
		["posX"] = 150;
		["posY"] = -180;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00009"] = {
		["ID"] = 9;
		["connectionsID"] = {
			[1] = 8;
			[2] = 5;
		};
		["posX"] = -240;
		["posY"] = 180;
		["type"] = "switch";
	};
	["switch_00019"] = {
		["ID"] = 19;
		["connectionsID"] = {
			[1] = 99;
			[2] = 488;
			[3] = 493;
		};
		["name"] = "staff_intro";
		["posX"] = 1020;
		["posY"] = -1080;
		["type"] = "switch";
	};
	["switch_00025"] = {
		["ID"] = 25;
		["connectionsID"] = {
			[1] = 32;
			[2] = 127;
		};
		["posX"] = 1470;
		["posY"] = -390;
		["type"] = "switch";
	};
	["switch_00028"] = {
		["ID"] = 28;
		["connectionsID"] = {
			[1] = 26;
			[2] = 118;
		};
		["posX"] = 1890;
		["posY"] = -330;
		["type"] = "switch";
	};
	["switch_00035"] = {
		["ID"] = 35;
		["connectionsID"] = {
			[1] = 36;
			[2] = 33;
		};
		["posX"] = 2550;
		["posY"] = -480;
		["type"] = "switch";
	};
	["switch_00045"] = {
		["ID"] = 45;
		["connectionsID"] = {
			[1] = 51;
			[2] = 39;
			[3] = 38;
			[4] = 42;
		};
		["h"] = 120;
		["posX"] = 1470;
		["posY"] = 630;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00047"] = {
		["ID"] = 47;
		["connectionsID"] = {
			[1] = 54;
			[2] = 44;
			[3] = 37;
		};
		["posX"] = 2130;
		["posY"] = 360;
		["type"] = "switch";
	};
	["switch_00055"] = {
		["ID"] = 55;
		["connectionsID"] = {
			[1] = 52;
			[2] = 57;
		};
		["posX"] = 2730;
		["posY"] = 150;
		["type"] = "switch";
	};
	["switch_00066"] = {
		["ID"] = 66;
		["connectionsID"] = {
			[1] = 72;
			[2] = 336;
			[3] = 362;
			[4] = 258;
			[5] = 173;
			[6] = 330;
			[7] = 510;
		};
		["h"] = 180;
		["name"] = "main_hub";
		["posX"] = 2100;
		["posY"] = 1530;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00085"] = {
		["ID"] = 85;
		["connectionsID"] = {
			[1] = 84;
			[2] = 79;
		};
		["posX"] = 3360;
		["posY"] = 4770;
		["type"] = "switch";
	};
	["switch_00090"] = {
		["ID"] = 90;
		["connectionsID"] = {
			[1] = 19;
			[2] = 494;
			[3] = 50;
			[4] = 359;
			[5] = 89;
		};
		["h"] = 140;
		["posX"] = 660;
		["posY"] = 210;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00091"] = {
		["ID"] = 91;
		["connectionsID"] = {
			[1] = 64;
			[2] = 88;
		};
		["posX"] = 1650;
		["posY"] = 1590;
		["type"] = "switch";
	};
	["switch_00157"] = {
		["ID"] = 157;
		["connectionsID"] = {
			[1] = 149;
			[2] = 147;
		};
		["posX"] = 4080;
		["posY"] = 5220;
		["type"] = "switch";
	};
	["switch_00159"] = {
		["ID"] = 159;
		["connectionsID"] = {
			[1] = 75;
			[2] = 160;
			[3] = 133;
			[4] = 158;
			[5] = 174;
			[6] = 167;
			[7] = 134;
			[8] = 135;
			[9] = 151;
		};
		["h"] = 220;
		["name"] = "lore_hub";
		["posX"] = 2670;
		["posY"] = 5820;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00176"] = {
		["ID"] = 176;
		["connectionsID"] = {
			[1] = 132;
			[2] = 137;
		};
		["posX"] = 3600;
		["posY"] = 5670;
		["type"] = "switch";
	};
	["switch_00182"] = {
		["ID"] = 182;
		["connectionsID"] = {
			[1] = 178;
			[2] = 185;
		};
		["posX"] = 2790;
		["posY"] = 7350;
		["type"] = "switch";
	};
	["switch_00191"] = {
		["ID"] = 191;
		["connectionsID"] = {
			[1] = 190;
			[2] = 197;
			[3] = 195;
			[4] = 198;
		};
		["h"] = 120;
		["posX"] = 3030;
		["posY"] = 7740;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00200"] = {
		["ID"] = 200;
		["connectionsID"] = {
			[1] = 206;
			[2] = 208;
		};
		["posX"] = 3840;
		["posY"] = 3120;
		["type"] = "switch";
	};
	["switch_00217"] = {
		["ID"] = 217;
		["connectionsID"] = {
			[1] = 209;
			[2] = 216;
			[3] = 244;
		};
		["posX"] = 6330;
		["posY"] = 3930;
		["type"] = "switch";
	};
	["switch_00234"] = {
		["ID"] = 234;
		["connectionsID"] = {
			[1] = 230;
			[2] = 257;
			[3] = 237;
		};
		["posX"] = 3030;
		["posY"] = 4410;
		["type"] = "switch";
	};
	["switch_00239"] = {
		["ID"] = 239;
		["connectionsID"] = {
			[1] = 260;
			[2] = 296;
			[3] = 292;
		};
		["posX"] = 7470;
		["posY"] = 3930;
		["type"] = "switch";
	};
	["switch_00252"] = {
		["ID"] = 252;
		["connectionsID"] = {
			[1] = 233;
			[2] = 229;
			[3] = 246;
		};
		["posX"] = 4140;
		["posY"] = 4260;
		["type"] = "switch";
	};
	["switch_00256"] = {
		["ID"] = 256;
		["connectionsID"] = {
			[1] = 253;
			[2] = 232;
		};
		["posX"] = 4710;
		["posY"] = 3900;
		["type"] = "switch";
	};
	["switch_00258"] = {
		["ID"] = 258;
		["connectionsID"] = {
			[1] = 214;
			[2] = 226;
			[3] = 213;
		};
		["h"] = 100;
		["name"] = "scalphunters";
		["posX"] = 2340;
		["posY"] = 4080;
		["type"] = "switch";
		["w"] = 102;
	};
	["switch_00278"] = {
		["ID"] = 278;
		["connectionsID"] = {
			[1] = 284;
			[2] = 282;
		};
		["posX"] = 11100;
		["posY"] = 3930;
		["type"] = "switch";
	};
	["switch_00322"] = {
		["ID"] = 322;
		["connectionsID"] = {
			[1] = 324;
			[2] = 316;
			[3] = 318;
		};
		["posX"] = 1410;
		["posY"] = -1320;
		["type"] = "switch";
	};
	["switch_00330"] = {
		["ID"] = 330;
		["connectionsID"] = {
			[1] = 183;
			[2] = 194;
		};
		["name"] = "HIDDEN";
		["posX"] = 2340;
		["posY"] = 7620;
		["type"] = "switch";
	};
	["switch_00336"] = {
		["ID"] = 336;
		["connectionsID"] = {
			[1] = 355;
			[2] = 500;
			[3] = 337;
		};
		["name"] = "tools";
		["posX"] = 2340;
		["posY"] = 1680;
		["type"] = "switch";
	};
	["switch_00339"] = {
		["ID"] = 339;
		["connectionsID"] = {
			[1] = 341;
			[2] = 340;
			[3] = 342;
		};
		["posX"] = 3090;
		["posY"] = 2400;
		["type"] = "switch";
	};
	["switch_00344"] = {
		["ID"] = 344;
		["connectionsID"] = {
			[1] = 345;
			[2] = 346;
			[3] = 347;
			[4] = 348;
		};
		["h"] = 120;
		["posX"] = 4380;
		["posY"] = 2340;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00362"] = {
		["ID"] = 362;
		["connectionsID"] = {
			[1] = 204;
			[2] = 203;
		};
		["h"] = 100;
		["name"] = "abori_goes_home";
		["posX"] = 2400;
		["posY"] = 3030;
		["type"] = "switch";
		["w"] = 137;
	};
}
local obj2 = {
	["actor_prefab"] = {
		[1] = "human_male";
		[2] = "abori";
	};
}
return obj1 ,obj2
