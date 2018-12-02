-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 1;
		["connectID"] = 67;
		["posX"] = 4620;
		["posY"] = 720;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 2;
		["connectID"] = 9;
		["posX"] = 7080;
		["posY"] = -420;
		["script"] = "";
		["text"] = "Almost. One of them got killed in a landslide. We pulled him out, and while others were tending to equipment, I cooked a traditional meal - three courses and a dessert.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 2;
		["connectID"] = 74;
		["posX"] = 5640;
		["posY"] = -720;
		["script"] = "";
		["text"] = "Ah, you met my little girl? Yeah, I'm the one who put her there. She was so small back then, about the size of your hand, Didn't think it would even survive, much less grow so healthy and lively.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["connectID"] = 37;
		["posX"] = 6120;
		["posY"] = -720;
		["script"] = "";
		["text"] = "Doesn't it even bother you that it eats anyone who gets close to its crater? I barely made it alive out of this death trap.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 2;
		["connectID"] = 54;
		["posX"] = 1770;
		["posY"] = 90;
		["script"] = "";
		["text"] = "Nothing, really. I'm being persecuted for my culture's traditions, so to speak. And for my love of my profession.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["connectID"] = 50;
		["posX"] = 5400;
		["posY"] = -570;
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
		["text"] = "You're a cannibal?!";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 2;
		["connectID"] = 39;
		["posX"] = 5880;
		["posY"] = 990;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["connectID"] = 55;
		["posX"] = 1500;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Yes, and you better get some cash ready so I forget the location of your cozy lair.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 29;
		["posX"] = 7320;
		["posY"] = -420;
		["script"] = "";
		["text"] = "I thought we're gonna pay our respects to the dead fellow, eat him, and his spirit will be smiling looking at us. I forgot that you humas are defiling your dead with all sorts of perversions.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["connectID"] = 53;
		["posX"] = 4860;
		["posY"] = -30;
		["script"] = "";
		["text"] = "[t_mister_green:give_bug]Are you kidding me? You could dig some sand fleas while you're at it! Oh alright, here.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 2;
		["connectID"] = 64;
		["posX"] = 6600;
		["posY"] = -420;
		["script"] = "";
		["text"] = "The group was very pleased. Until the incident...";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["connectID"] = 71;
		["posX"] = 6810;
		["posY"] = 810;
		["script"] = "";
		["text"] = "Of course! A generous reward, I assure you.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["connectID"] = 52;
		["posX"] = 6120;
		["posY"] = -570;
		["script"] = "";
		["text"] = "Why not? You humas are so wasteful, burying your dead in the ground to feed worms or even burning them. Bollocks!";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 2;
		["connectID"] = 31;
		["posX"] = 6150;
		["posY"] = 750;
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
		["text"] = "[HIDDEN]Oh, and by the way, can you get rid of the crucasses in one of the cave's branches? They steal my supplies!";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 1;
		["connectID"] = 67;
		["posX"] = 5400;
		["posY"] = -150;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["connectID"] = 59;
		["posX"] = 3720;
		["posY"] = 840;
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
		["text"] = "[HIDDEN]You still want those crucasses dead?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 1;
		["connectID"] = 39;
		["posX"] = 3720;
		["posY"] = 120;
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
		["text"] = "Tell me something...";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 5880;
		["posY"] = -270;
		["script"] = "";
		["text"] = "Can you bring me ingredients for my cuisine? At the moment I'm limited to dead bandits and scrap scavengers.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 1;
		["connectID"] = 32;
		["posX"] = 3720;
		["posY"] = 990;
		["script"] = "";
		["text"] = "[End conversation]Thanks for hospitality, I'll be going.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["connectID"] = 39;
		["posX"] = 7800;
		["posY"] = -420;
		["script"] = "";
		["text"] = "I run pretty fast. Anyway, my old buddies put a bounty on my head. Not a big one, but I wasn't pleased. In the city I was pestered, and I don't like bounty hunters, they taste like shit. That's how I ended up here. It's quiet and nobody bothers me.";
		["time"] = 24;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = 5640;
		["posY"] = -270;
		["script"] = "";
		["text"] = "I don't have much to barter with. Unless... You look like a guy who moves around a lot, travels, sees things.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 1;
		["connectID"] = 10;
		["posX"] = 4620;
		["posY"] = -30;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"mister_green\"):getTopicVisible(\"give_bug\")\
end\
\
";
		["text"] = "Give dead bug.";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["connectID"] = 5;
		["posX"] = 1500;
		["posY"] = 90;
		["script"] = "";
		["text"] = "No. Why, what did you do?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 41;
		["posX"] = 1080;
		["posY"] = 180;
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
		["text"] = "Hey! You're not a bounty hunter, are you?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 1;
		["posX"] = 6690;
		["posY"] = 1260;
		["script"] = "";
		["text"] = "[End conversation]Maybe later, I have to go now.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 2;
		["connectID"] = 49;
		["posX"] = 6120;
		["posY"] = -270;
		["script"] = "";
		["text"] = "You'll get compensated, of course.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 2;
		["connectID"] = 67;
		["posX"] = 1080;
		["posY"] = 390;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["connectID"] = 38;
		["posX"] = 2490;
		["posY"] = 120;
		["script"] = "";
		["text"] = "Why not? What's in it?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["connectID"] = 20;
		["posX"] = 7560;
		["posY"] = -420;
		["script"] = "";
		["text"] = "Mindblowing. How come they didn't beat you with their pickaxes to death?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 2;
		["connectID"] = 53;
		["posX"] = 4860;
		["posY"] = 420;
		["script"] = "";
		["text"] = "[t_mister_green:give_hornhog]Is that a hornhog's head? Hold on! Wow, what a fragrance! Marvelous! Here, take this, it'll be useful.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["posX"] = 3960;
		["posY"] = 990;
		["script"] = "";
		["text"] = "See you. Meanwhile, it's time to COOK!";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 2;
		["connectID"] = 53;
		["posX"] = 4860;
		["posY"] = 570;
		["script"] = "";
		["text"] = "[t_mister_green:give_brain]Ooh! Canned brains! What a quality! Where did you find it? Here, a fitting reward for a job well done.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["connectID"] = 62;
		["posX"] = 5880;
		["posY"] = -420;
		["script"] = "";
		["text"] = "I rotted there for a few years until I found a way out through an old strip: the mine is full of them, nobody knows about them anymore. So I broke through a wall and made my way to abandoned passages. Almost died there on my way out.";
		["time"] = 23;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 2;
		["connectID"] = 53;
		["posX"] = 4020;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Excellent! Quickly, show me what you have there, before the water boils!";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 1;
		["connectID"] = 33;
		["posX"] = 4620;
		["posY"] = 570;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"mister_green\"):getTopicVisible(\"give_brain\")\
end\
\
";
		["text"] = "Give strange brain module.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 2;
		["connectID"] = 39;
		["posX"] = 6360;
		["posY"] = -720;
		["script"] = "";
		["text"] = "Good sport! I do care, I was feeding her before. And now, I even get leftovers. I'm very proud of my baby girl, she guards me well.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 2;
		["connectID"] = 67;
		["posX"] = 2790;
		["posY"] = 180;
		["script"] = "";
		["text"] = "Not much, a bit of this and that. A little something here and there and some spices, hehe.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 2;
		["connectID"] = 11;
		["posX"] = 6360;
		["posY"] = -420;
		["script"] = "";
		["text"] = "Abori without his tribe is an easy prey in the swamps. I stuck around a group of free prospectors. Was carrying their luggage and cooked for them. It is then I found my destiny! My passion! I became an expert of cooking! I was experimenting, I was making art!";
		["time"] = 25;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 2;
		["connectID"] = 58;
		["posX"] = 570;
		["posY"] = 300;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 1;
		["connectID"] = 21;
		["posX"] = 5400;
		["posY"] = -270;
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
		["text"] = "[t_mister_green:start]You need anything?";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 1;
		["connectID"] = 13;
		["posX"] = 5880;
		["posY"] = -570;
		["script"] = "";
		["text"] = "Well, they do say something about hearts of your enemies, but why would you eat a relative?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 2;
		["connectID"] = 40;
		["posX"] = 6600;
		["posY"] = -270;
		["script"] = "";
		["text"] = "[t_notes:mrgreen]It's a deal! No need for you being the killer. In fact, it's even better when the meat has an aroma. The result is more quaint.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 1;
		["connectID"] = 68;
		["posX"] = 5400;
		["posY"] = -420;
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
		["text"] = "Why are you hiding in here?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 1;
		["connectID"] = 35;
		["posX"] = 3720;
		["posY"] = 300;
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
		["text"] = "[t_mister_green:deal]Hey Mister Green, I've got something for you.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 1;
		["connectID"] = 46;
		["posX"] = 6360;
		["posY"] = -270;
		["script"] = "";
		["text"] = "Just so you know, I ain't killing anyone for this!";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 2;
		["connectID"] = 45;
		["posX"] = 5640;
		["posY"] = -570;
		["script"] = "";
		["text"] = "That's right, and a proud one at that! We are the people of the Big Swamp, and we always feast on a worthy opponent. Even more so on a beloved relative.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 1;
		["connectID"] = 63;
		["posX"] = 4620;
		["posY"] = 270;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"mister_green\"):getTopicVisible(\"give_leg\")\
end\
\
";
		["text"] = "Give a torn off human leg.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 2;
		["connectID"] = 39;
		["posX"] = 6360;
		["posY"] = -570;
		["script"] = "";
		["text"] = "My tribe eats dead relatives - this way the strength of our tribe isn't lost. We get a tasty treat, and the relative is pleased. Our funeral is a cheerful holiday. Nobody mourns, everyone eats!";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 2;
		["connectID"] = 65;
		["posX"] = 2070;
		["posY"] = 180;
		["script"] = "";
		["text"] = "Oh what is the matter with me, I forgot all about basic courtesy. A huma just got out of the desert and I'm interrogating him. Come, sit down near the fireplace, rest. Want some soup?";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 2;
		["connectID"] = 54;
		["posX"] = 1770;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Bullshit, I can tell these bastards a mile away by their stench of death. You, on the other hand, are new here. How did your clean ass wound up on our planet?";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 1;
		["connectID"] = 3;
		["posX"] = 5400;
		["posY"] = -720;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   -- no such trigger yet and no sharks as well\
   return false and self:isFirstTime() and wasPlayerInTrigger(\"Trigger_sharks\")\
end\
\
";
		["text"] = "Do you know that a dangerous beast lives near the entrance of your cave?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 1;
		["connectID"] = 39;
		["posX"] = 7350;
		["posY"] = 750;
		["script"] = "";
		["text"] = "I have more questions.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 1;
		["connectID"] = 12;
		["posX"] = 6540;
		["posY"] = 810;
		["script"] = "";
		["text"] = "I'm assuming I will get something in return for this.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 1;
		["connectID"] = 66;
		["posX"] = 4620;
		["posY"] = 120;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"mister_green\"):getTopicVisible(\"give_meat\")\
end\
\
";
		["text"] = "Give a piece of meat.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 2;
		["posX"] = 3990;
		["posY"] = 690;
		["script"] = "";
		["text"] = "Very good huma! Here is your reward, as promised.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 1;
		["connectID"] = 42;
		["posX"] = 6120;
		["posY"] = -420;
		["script"] = "";
		["text"] = "Why didn't you come back to your swamp?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 2;
		["connectID"] = 53;
		["posX"] = 4860;
		["posY"] = 270;
		["script"] = "";
		["text"] = "[t_mister_green:give_leg]Hm, not bad. Take this for your trouble.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 1;
		["connectID"] = 2;
		["posX"] = 6840;
		["posY"] = -420;
		["script"] = "";
		["text"] = "Don't tell me you ate someone...";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00066"] = {
		["ID"] = 66;
		["actor"] = 2;
		["connectID"] = 53;
		["posX"] = 4860;
		["posY"] = 120;
		["script"] = "";
		["text"] = "[t_mister_green:give_meat]Ohhh, I've got plenty of this... Well, thanks anyway. Every little piece counts.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 2;
		["connectID"] = 34;
		["posX"] = 5640;
		["posY"] = -420;
		["script"] = "";
		["text"] = "My village was burned to the ground by humas in white armor. Those that didn't end up killed were enslaved and were forced to work the mines.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 1;
		["posX"] = 7350;
		["posY"] = 900;
		["script"] = "";
		["text"] = "[End conversation]I'll better get started.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00070"] = {
		["ID"] = 70;
		["actor"] = 1;
		["connectID"] = 38;
		["posX"] = 2490;
		["posY"] = 240;
		["script"] = "";
		["text"] = "No thanks. What kind of garbage did you put in it?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00072"] = {
		["ID"] = 72;
		["actor"] = 1;
		["connectID"] = 61;
		["posX"] = 3720;
		["posY"] = 690;
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
		["text"] = "Those crucasses ain't gonna trouble you no more.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00073"] = {
		["ID"] = 73;
		["actor"] = 1;
		["connectID"] = 39;
		["posX"] = 6690;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "Maybe later. Tell me something...";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00074"] = {
		["ID"] = 74;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = 5880;
		["posY"] = -720;
		["script"] = "";
		["text"] = "She will outgrow her little crater soon and dig her way out to the desert.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00075"] = {
		["ID"] = 75;
		["actor"] = 1;
		["connectID"] = 30;
		["posX"] = 4620;
		["posY"] = 420;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"mister_green\"):getTopicVisible(\"give_hornhog\")\
end\
\
";
		["text"] = "Give rotting hornhog heads.";
		["time"] = 2;
		["type"] = "message";
	};
	["switch_00031"] = {
		["ID"] = 31;
		["connectionsID"] = {
			[1] = 59;
			[2] = 73;
			[3] = 25;
		};
		["posX"] = 6420;
		["posY"] = 930;
		["type"] = "switch";
	};
	["switch_00039"] = {
		["ID"] = 39;
		["connectionsID"] = {
			[1] = 56;
			[2] = 6;
			[3] = 47;
			[4] = 44;
			[5] = 15;
		};
		["posX"] = 5070;
		["posY"] = -420;
		["type"] = "switch";
	};
	["switch_00040"] = {
		["ID"] = 40;
		["connectionsID"] = {
			[1] = 14;
			[2] = 7;
		};
		["posX"] = 5700;
		["posY"] = 750;
		["type"] = "switch";
	};
	["switch_00041"] = {
		["ID"] = 41;
		["connectionsID"] = {
			[1] = 23;
			[2] = 8;
		};
		["posX"] = 1350;
		["posY"] = 180;
		["type"] = "switch";
	};
	["switch_00053"] = {
		["ID"] = 53;
		["connectionsID"] = {
			[1] = 22;
			[2] = 60;
			[3] = 51;
			[4] = 75;
			[5] = 36;
			[6] = 1;
		};
		["posX"] = 4290;
		["posY"] = 270;
		["type"] = "switch";
	};
	["switch_00058"] = {
		["ID"] = 58;
		["connectionsID"] = {
			[1] = 24;
			[2] = 27;
		};
		["posX"] = 870;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00065"] = {
		["ID"] = 65;
		["connectionsID"] = {
			[1] = 28;
			[2] = 70;
		};
		["posX"] = 2340;
		["posY"] = 180;
		["type"] = "switch";
	};
	["switch_00067"] = {
		["ID"] = 67;
		["connectionsID"] = {
			[1] = 17;
			[2] = 48;
			[3] = 72;
			[4] = 16;
			[5] = 19;
		};
		["posX"] = 3240;
		["posY"] = 360;
		["type"] = "switch";
	};
	["switch_00071"] = {
		["ID"] = 71;
		["connectionsID"] = {
			[1] = 57;
			[2] = 69;
		};
		["posX"] = 7140;
		["posY"] = 810;
		["type"] = "switch";
	};
}
return obj1
