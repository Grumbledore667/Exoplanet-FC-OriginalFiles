-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 8;
		["posX"] = -120;
		["posY"] = 480;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["posX"] = 1020;
		["posY"] = 210;
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
		["text"] = "start open sesame";
		["time"] = 2.5;
		["topic"] = "open_sesame:start";
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["posX"] = 1020;
		["posY"] = 570;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["posX"] = 1020;
		["posY"] = 330;
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
		["text"] = "finish open sesame quest.";
		["time"] = 1;
		["topic"] = "open_sesame:finish";
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["posX"] = 1020;
		["posY"] = 450;
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
		["text"] = "wrong code";
		["time"] = 1;
		["topic"] = "open_sesame:code_wrong";
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
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
   return self:isFirstTime() and self:isTopicVisible()\
end\
\
";
		["text"] = "finish helping_hands quest.";
		["time"] = 2.5;
		["topic"] = "helping_hands:finish";
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 1;
		["posX"] = 1020;
		["posY"] = -150;
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
		["text"] = "start helping_hands";
		["time"] = 2;
		["topic"] = "helping_hands:start";
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 1;
		["connectID"] = 1;
		["posX"] = 330;
		["posY"] = 420;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 1;
		["connectID"] = 12;
		["posX"] = 330;
		["posY"] = 540;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 1;
		["animation"] = "dl_raisedfinger_left";
		["connectID"] = 14;
		["posX"] = 990;
		["posY"] = 930;
		["script"] = "";
		["text"] = "An impressive pile of junk. Are you the warehouse keeper?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 2;
		["animation"] = "dl_hand_facepalm";
		["connectID"] = 15;
		["posX"] = 1260;
		["posY"] = 930;
		["script"] = "";
		["text"] = "No, I just wipe the floors here twice a day! How many times should I tell you cretins: without captain's signature you aren't gonna get so much as a jar of anti-fungal cream.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["animation"] = "dl_hand_chopslow";
		["connectID"] = 16;
		["posX"] = 1530;
		["posY"] = 930;
		["script"] = "";
		["text"] = "If you lost your equipment then it's not my goddamn problem, you deal with it yourself. Delivery is already late for two damn weeks, and our supplies are dwindling.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["connectID"] = 17;
		["posX"] = 1800;
		["posY"] = 930;
		["script"] = "";
		["text"] = "Actually I didn't come here for any antifungal cream.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 2070;
		["posY"] = 930;
		["script"] = "";
		["text"] = "One of the new guys, huh? Well, say what you need and go away, I'm busy here.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 13;
		["posX"] = 720;
		["posY"] = 930;
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
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["animation"] = "dl_stop_twohand";
		["connectID"] = 21;
		["posX"] = 720;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "Son of a... Don't sneak up on people like that, I could've had a heart attack because of you!";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 990;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "So it's you again. Well, what is it gonna be?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["connectID"] = 24;
		["posX"] = 2550;
		["posY"] = 540;
		["script"] = "function message:onStart()\
   self:setParam(\"trade_intro_played\", true)\
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
		["text"] = "Do you trade?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["animation"] = "dl_head_2nods";
		["connectID"] = 25;
		["posX"] = 2790;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Here and there, yeah. I mostly sell supplies and equipment to caravaneers and prospectors. I used to buy hides and meat from the hunters, but they don't visit us so often anymore.";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 1;
		["connectID"] = 26;
		["posX"] = 3030;
		["posY"] = 540;
		["script"] = "";
		["text"] = "How about something handier than just a shovel or a pickaxe?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 2;
		["animation"] = "dl_stop_onehand";
		["connectID"] = 27;
		["posX"] = 3270;
		["posY"] = 540;
		["script"] = "";
		["text"] = "You'll need to sign a contract for that. I can't just sell company equipment to whoever just walked in.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 1;
		["connectID"] = 28;
		["posX"] = 3510;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Can't two businessmen come to a sort of an agreement to exchange certain goods for a mutual benefit? Off the record, of course.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["connectID"] = 29;
		["posX"] = 3750;
		["posY"] = 540;
		["script"] = "";
		["text"] = "The fact that old Eli is in charge of some military equipment doesn't mean he also sells it under the counter.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 2;
		["animation"] = "dl_hand_negative";
		["connectID"] = 44;
		["posX"] = 3990;
		["posY"] = 540;
		["script"] = "";
		["text"] = "I'm not that stupid to sell weapons from the Fort arsenal to any bum or a damn abori, so they could use them to shoot me later. So do you need supplies or are you just gonna stand here?";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 1;
		["posX"] = 2550;
		["posY"] = 660;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   self:startTrade()\
end\
\
function message:isVisible()\
   return self:getParam(\"trade_intro_played\")\
end\
\
";
		["text"] = "\\[TRADE]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 1;
		["connectID"] = 32;
		["posX"] = 2550;
		["posY"] = 810;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isFirstTime() and getQuest(\"helping_hands\"):getTopicVisible(\"start\")\
end\
\
";
		["text"] = "And how do you like your job?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["connectID"] = 33;
		["posX"] = 2790;
		["posY"] = 810;
		["script"] = "";
		["text"] = "You know, I actually like it here. The captain assigned me to this job pretty recently but if you ask me it's much better than roasting your ass in the sun or freeze to death at night as those poor fellas on the walls.";
		["time"] = 23;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 2;
		["connectID"] = 34;
		["posX"] = 3030;
		["posY"] = 810;
		["script"] = "";
		["text"] = "And I don't risk a bullet out there either. And if a serious fight breaks out then we're all done for anyway - can't sit this one out behind the chests, you know.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 1;
		["connectID"] = 35;
		["posX"] = 3270;
		["posY"] = 810;
		["script"] = "";
		["text"] = "What's with all the mess in the storehouse? Some kind of a fancy organizing system?";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 2;
		["animation"] = "dl_chuckle";
		["connectID"] = 36;
		["posX"] = 3510;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Very funny! No, smartass, the main reason is the previous owner, a real asshole. That fat bastard Barnabas was stealing too much, and just before things got hot - he disappeared, taking the journals with him.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 2;
		["connectID"] = 37;
		["posX"] = 3750;
		["posY"] = 810;
		["script"] = "";
		["text"] = "That's why we can't tell heads or tails where is what; we have to open each container, account for everything inside and seal it again.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 2;
		["animation"] = "dl_head_wipe";
		["connectID"] = 38;
		["posX"] = 3990;
		["posY"] = 810;
		["script"] = "";
		["text"] = "If only I had a couple more help that weren't trying to steal a piece of soap or a can of slime meat every time I turn around. We would have been done already.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 1;
		["connectID"] = 39;
		["posX"] = 4230;
		["posY"] = 810;
		["script"] = "";
		["text"] = "I was a free trader, dealt with all kinds of cargo. Want my help?";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 2;
		["animation"] = "dl_stop_onehand";
		["connectID"] = 40;
		["posX"] = 4470;
		["posY"] = 810;
		["script"] = "";
		["text"] = "No offense pal, but you must understand that I can't take any risks with you, a spacer, or any mercs around here. But you would help me a lot if you find a couple of reliable worker abori fellas.";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00040"] = {
		["ID"] = 40;
		["actor"] = 2;
		["connectID"] = 41;
		["posX"] = 4710;
		["posY"] = 810;
		["script"] = "";
		["text"] = "They aren't really doing anything anyway. Just make sure to ask Master Phil, their taskmaster.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 1;
		["connectID"] = 42;
		["posX"] = 4950;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Where can I find this Master Phil?";
		["time"] = 4.5;
		["topic"] = "helping_hands:start";
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 2;
		["connectID"] = 43;
		["posX"] = 5190;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Well, if you didn't stumble upon him in our cantine then he's probably at the cemetery. It's not far from here, just exit through the western gate and follow the path.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 2;
		["connectID"] = 44;
		["posX"] = 5430;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Phil spends a lot of time there lately, as he has lost half of his crew to a nasty business cooked up by Stone Heads to try and provoke us.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 6450;
		["posY"] = 240;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 1;
		["connectID"] = 46;
		["posX"] = 2550;
		["posY"] = 1020;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isFirstTime() and getQuestTopicVisible(\"helping_hands\", \"finish\")\
end\
\
";
		["text"] = "I've managed to get you some help.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 2;
		["connectID"] = 47;
		["posX"] = 2790;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "So Phil gave his permission. He's a good man, hardworking and all. It's just because of all of these deaths he started drinking a lot. I'm afraid it's not going to end well.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 2;
		["animation"] = "dl_stop_onehand";
		["connectID"] = 48;
		["posX"] = 3030;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "But enough about that. With those sturdy fellows I'm going to finish this faster. You've earned your share of greenies for all this back and forth.";
		["time"] = 14;
		["topic"] = "helping_hands:finish";
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 2;
		["connectID"] = 51;
		["posX"] = 3270;
		["posY"] = 1020;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"open_sesame\", \"start\")\
end\
\
";
		["text"] = "There's something else you might be able to help me with, a bit more challenging than just walking and talking though.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 1;
		["connectID"] = 50;
		["posX"] = 3660;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "I don't have time for it now. Maybe later.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 44;
		["posX"] = 3900;
		["posY"] = 1110;
		["script"] = "";
		["text"] = "Damn, I was counting on you. Well, let me know when you're up for it.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 1;
		["animation"] = "dl_raisedfinger_left";
		["connectID"] = 56;
		["posX"] = 3900;
		["posY"] = 960;
		["script"] = "";
		["text"] = "Let me guess, you want me to sweep all the floors of this storehouse, wash the windows and sort two sacks full of beans?";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 1;
		["connectID"] = 52;
		["posX"] = 3660;
		["posY"] = 960;
		["script"] = "";
		["text"] = "Challenging? I'm in.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 1;
		["connectID"] = 52;
		["posX"] = 2550;
		["posY"] = 1290;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"open_sesame\", \"start\")\
end\
\
";
		["text"] = "So what was it you wanted me to help you with?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 57;
		["posX"] = 4140;
		["posY"] = 960;
		["script"] = "";
		["text"] = "No, actually there is a crucass infestation in our cellar... Certainly a brave spacer such as yourself isn't afraid of closed dark spaces.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 1;
		["connectID"] = 58;
		["posX"] = 4380;
		["posY"] = 960;
		["script"] = "";
		["text"] = "Oh no, I know how this one ends! The crucasses are probably spitting hydrofluoric acid and lay their eggs inside the corpses of workers they dragged into their nest...";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 2;
		["animation"] = "dl_stop_twohand";
		["connectID"] = 59;
		["posX"] = 4620;
		["posY"] = 960;
		["script"] = "";
		["text"] = "Relax, I was just kidding. We don't even have a cellar. You might have noticed that there is a closed door at the top floor of the storehouse. It leads to a personal storage of Barnabas, my predecessor at this job.";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 4860;
		["posY"] = 960;
		["script"] = "";
		["text"] = "He arranged a cozy little place there for special goods. The problem is that this blob of lard didn't have the courtesy of telling anyone the code that opens the door when he took off.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 2;
		["animation"] = "dl_hands_strike";
		["connectID"] = 90;
		["posX"] = 5100;
		["posY"] = 960;
		["script"] = "";
		["text"] = "I need to open that damn door! This whole situation with Stone Heads is only getting worse and my gut tells me that behind that door there are supplies that could be crucial in defending the fort.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 1;
		["animation"] = "dl_head_tap";
		["connectID"] = 62;
		["posX"] = 5490;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "Why won't you just cut it open?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 2;
		["connectID"] = 63;
		["posX"] = 5730;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "I know Barnabas and his paranoia to refrain from using brute force on the lock. The last thing I need is some of his explosive \"surprises\" blowing off with me and a half of the fort. We have to think of another way.";
		["time"] = 22.5;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 1;
		["connectID"] = 64;
		["posX"] = 5970;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "I'll try to come up with something. Any ideas on where I can start?";
		["time"] = 8;
		["topic"] = "open_sesame:start";
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 2;
		["animation"] = "dl_shrug_short";
		["connectID"] = 65;
		["posX"] = 6210;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "Well, for starters try to find another way inside the room. You see, this building wasn't dedicated to storage, and that whole \"fort\" isn't really a fort at all - it wasn't even built as a defensible structure.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00065"] = {
		["ID"] = 65;
		["actor"] = 2;
		["connectID"] = 66;
		["posX"] = 6450;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "It was an abandoned research station, so there might be some structural defects or constructs that might be used to get inside that room.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00066"] = {
		["ID"] = 66;
		["actor"] = 1;
		["connectID"] = 67;
		["posX"] = 6690;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "Looks like I'll have to check all the dusty corners and roofs close to this place. Anything else?";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
		["actor"] = 2;
		["connectID"] = 68;
		["posX"] = 6930;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "You should also check out Barnabas' room. It's right outside the storehouse and shares a wall with it. When you go outside this room turn right and go down the ramp.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 2;
		["connectID"] = 69;
		["posX"] = 7170;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "At the bottom of the ramp look straight up and you'll see the corner of his room. It's a mess in there at the moment, our guys have turned it upside down already, but who knows, you might find some hints regarding the code.";
		["time"] = 23;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 2;
		["connectID"] = 44;
		["posX"] = 7410;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "Barnabas didn't have all his marbles together and was always taking all kinds of reminder notes. This little quirk of his might come in handy.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00070"] = {
		["ID"] = 70;
		["actor"] = 1;
		["connectID"] = 72;
		["posX"] = 2550;
		["posY"] = 1680;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return isQuestActive(\"open_sesame\")\
end\
\
";
		["text"] = "So about that closed storage room...";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00072"] = {
		["ID"] = 72;
		["actor"] = 2;
		["connectID"] = 73;
		["posX"] = 2820;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "Did you manage to open it?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00074"] = {
		["ID"] = 74;
		["actor"] = 1;
		["animation"] = "dl_head_shake";
		["connectID"] = 76;
		["posX"] = 3240;
		["posY"] = 1650;
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
		["text"] = "Not yet, but I found Barnabas' note with some sort of a code. It doesn't open the lock.";
		["time"] = 10;
		["topic"] = "open_sesame:code_wrong";
		["type"] = "message";
	};
	["message_00075"] = {
		["ID"] = 75;
		["actor"] = 1;
		["animation"] = "dl_head_shake";
		["connectID"] = 79;
		["posX"] = 3240;
		["posY"] = 1500;
		["script"] = "";
		["text"] = "Not yet.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00076"] = {
		["ID"] = 76;
		["actor"] = 2;
		["animation"] = "dl_count_to_one";
		["connectID"] = 77;
		["posX"] = 3480;
		["posY"] = 1650;
		["script"] = "";
		["text"] = "Hm... He might have used some kind of a cipher on the code before he wrote it down. He even bragged once that he encrypts all his notes so that no one will ever be able to sniff around his little secrets.";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00077"] = {
		["ID"] = 77;
		["actor"] = 2;
		["connectID"] = 79;
		["posX"] = 3720;
		["posY"] = 1650;
		["script"] = "";
		["text"] = "But I'll be damned if he didn't write that cipher somewhere too. Have you checked his room yet?";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00079"] = {
		["ID"] = 79;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 4500;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00080"] = {
		["ID"] = 80;
		["actor"] = 1;
		["animation"] = "dl_raisedfinger_right";
		["connectID"] = 81;
		["posX"] = 3240;
		["posY"] = 1800;
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
		["text"] = "I found a book about ciphers in Barnabas' room.";
		["time"] = 5.5;
		["topic"] = "open_sesame:read_cipher";
		["type"] = "message";
	};
	["message_00081"] = {
		["ID"] = 81;
		["actor"] = 2;
		["animation"] = "dl_head_nod";
		["connectID"] = 82;
		["posX"] = 3480;
		["posY"] = 1800;
		["script"] = "";
		["text"] = "Yeah, that's paranoid Barnabas for you. If he left any code reminders then they're encrypted. But you know what, I don't think he used a complex cipher. He was so anxious about not forgetting it!";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00082"] = {
		["ID"] = 82;
		["actor"] = 2;
		["connectID"] = 79;
		["posX"] = 3720;
		["posY"] = 1800;
		["script"] = "";
		["text"] = "He was leaving in such a hurry he couldn't possibly have the time to run around and gather all of his notes.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 1;
		["animation"] = "dl_head_nod";
		["connectID"] = 84;
		["posX"] = 3240;
		["posY"] = 1950;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"open_sesame\", \"finish\")\
end\
\
";
		["text"] = "I have opened the locked storage.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00084"] = {
		["ID"] = 84;
		["actor"] = 2;
		["connectID"] = 85;
		["posX"] = 3480;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "You look rather disappointed, given I didn't even tell you to turn out your pockets.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00085"] = {
		["ID"] = 85;
		["actor"] = 1;
		["animation"] = "dl_hand_showforward";
		["connectID"] = 86;
		["posX"] = 3720;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "Well this special storage didn't really have any 'special' supplies. Of what use for me, for instance is a cupboard full of electrically heated underpants?";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00086"] = {
		["ID"] = 86;
		["actor"] = 2;
		["animation"] = "dl_raisedfinger_right";
		["connectID"] = 87;
		["posX"] = 3960;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "It might be totally useless for you, but for a gang of always hungry men in rags there are lots of useful supplies. You have no idea how many lives can save an extra chest full of clean socks and sunscreen cream.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00087"] = {
		["ID"] = 87;
		["actor"] = 2;
		["animation"] = "dl_hand_showright";
		["connectID"] = 79;
		["posX"] = 4200;
		["posY"] = 1950;
		["script"] = "";
		["text"] = "In any case you can count on a good discount for all my goods. And the captain will hear only the best from me.";
		["time"] = 13;
		["topic"] = "open_sesame:finish";
		["type"] = "message";
	};
	["message_00088"] = {
		["ID"] = 88;
		["actor"] = 1;
		["posX"] = 2550;
		["posY"] = 1800;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00089"] = {
		["ID"] = 89;
		["actor"] = 1;
		["posX"] = 1020;
		["posY"] = 90;
		["script"] = "function message:onStart()\
   startQuest(\"helping_hands\")\
   finishQuest(\"helping_hands\")\
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
		["text"] = "force finish helping_hands";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 1;
		["connectID"] = 93;
		["posX"] = 5490;
		["posY"] = 930;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"open_sesame\", \"eli_already_opened\")\
end\
\
";
		["text"] = "I already did. Don't think anything wrong, I was just playing around with neurochipped bugs.";
		["time"] = 8.5;
		["topic"] = "open_sesame:start";
		["type"] = "message";
	};
	["message_00093"] = {
		["ID"] = 93;
		["actor"] = 2;
		["connectID"] = 84;
		["posX"] = 5730;
		["posY"] = 930;
		["script"] = "";
		["text"] = "You did? That's great news!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 7;
			[2] = 6;
			[3] = 89;
			[4] = 2;
			[5] = 4;
			[6] = 5;
			[7] = 3;
		};
		["h"] = 180;
		["posX"] = 840;
		["posY"] = 90;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00008"] = {
		["ID"] = 8;
		["connectionsID"] = {
			[1] = 9;
			[2] = 10;
		};
		["posX"] = 180;
		["posY"] = 480;
		["type"] = "switch";
	};
	["switch_00012"] = {
		["ID"] = 12;
		["connectionsID"] = {
			[1] = 18;
			[2] = 19;
		};
		["posX"] = 570;
		["posY"] = 990;
		["type"] = "switch";
	};
	["switch_00022"] = {
		["ID"] = 22;
		["connectionsID"] = {
			[1] = 23;
			[2] = 30;
			[3] = 31;
			[4] = 45;
			[5] = 54;
			[6] = 70;
			[7] = 88;
		};
		["h"] = 180;
		["posX"] = 2370;
		["posY"] = 930;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00051"] = {
		["ID"] = 51;
		["connectionsID"] = {
			[1] = 53;
			[2] = 49;
		};
		["posX"] = 3510;
		["posY"] = 1020;
		["type"] = "switch";
	};
	["switch_00073"] = {
		["ID"] = 73;
		["connectionsID"] = {
			[1] = 75;
			[2] = 74;
			[3] = 80;
			[4] = 83;
		};
		["h"] = 120;
		["posX"] = 3090;
		["posY"] = 1680;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00090"] = {
		["ID"] = 90;
		["connectionsID"] = {
			[1] = 91;
			[2] = 61;
		};
		["posX"] = 5340;
		["posY"] = 960;
		["type"] = "switch";
	};
}
local obj2 = {
	["actor_prefab"] = {
		[1] = "human_male";
		[2] = "human_male";
	};
}
return obj1 ,obj2
