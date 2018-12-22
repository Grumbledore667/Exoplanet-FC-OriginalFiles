-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 81;
		["posX"] = -5910;
		["posY"] = 90;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"my_clothes\", \"old_outcast_killed_looters\")\
end\
\
";
		["text"] = "Oh, huma, I don't think it was a good idea to kill these poor deadbeats. You went too far.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 1;
		["connectID"] = 10;
		["posX"] = -4470;
		["posY"] = 3510;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"abori_goes_home\", \"old_outcast_in_hideout\")\
end\
\
";
		["text"] = "What makes you think I was cast out?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 4;
		["posX"] = -4470;
		["posY"] = 3090;
		["script"] = "";
		["text"] = "Who are you actually?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 5;
		["posX"] = -4470;
		["posY"] = 2970;
		["script"] = "";
		["text"] = "What is this place?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 2;
		["connectID"] = 236;
		["posX"] = -4230;
		["posY"] = 3090;
		["script"] = "";
		["text"] = "Who am I? Once I had a name, a family, a place by the chief's hearth. All in the past. Now I'm just an old exile. Now I have no name. I am dust in the wind. It blows and I'm gone.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 2;
		["connectID"] = 6;
		["posX"] = -4230;
		["posY"] = 2970;
		["script"] = "";
		["text"] = "This place? The most suitable place for someone like me. A cursed place. Asylum for the outcast. Not sure about you though. You probably should get out of here as soon as possible.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["connectID"] = 9;
		["posX"] = -3990;
		["posY"] = 2970;
		["script"] = "";
		["text"] = "I meant this planet. This area.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 1;
		["connectID"] = 8;
		["posX"] = -4470;
		["posY"] = 3210;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"abori_goes_home\", \"old_outcast_before_hideout\")\
end\
\
";
		["text"] = "And why did your kinsmen cast you out?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 2;
		["connectID"] = 240;
		["posX"] = -4230;
		["posY"] = 3210;
		["script"] = "";
		["text"] = "[t_abori_goes_home:start]Does it matter now? But if you really want to hear the story of this insignificant aborigine, then kindly accompany me to my refuge. ";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 133;
		["posX"] = -3750;
		["posY"] = 2970;
		["script"] = "";
		["text"] = "It's a strange question. Do you know how you got here? Your tribesmen call this planet K'Tharsis, huma. And this place is the border of White Erg desert. Don't really know what else to tell you. Knowledge spills from this head like sand from a riven jug.";
		["time"] = 24.5;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["connectID"] = 241;
		["posX"] = -4230;
		["posY"] = 3510;
		["script"] = "";
		["text"] = "If not that, what else? Usually you humas either kill or throw each other into a place called \"prison\". I don't know, maybe you had the same lost and pitiful look as those who come here for the first time. ";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 1;
		["connectID"] = 13;
		["posX"] = -3540;
		["posY"] = 1800;
		["script"] = "";
		["text"] = "Alright, show me the way to your shelter!";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["posX"] = -3300;
		["posY"] = 1800;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   getQuest(\"abori_goes_home\"):goToStep(\"escort_start\")\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Follow me!";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = -6330;
		["posY"] = 1680;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"abori_goes_home\", \"old_outcast_in_hideout\") and self:isFirstTime()\
end\
\
";
		["text"] = "Here we are! Don't mind the dead - they scare away unwanted guests.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 19;
		["posX"] = -6090;
		["posY"] = 1680;
		["script"] = "function message:onStart()\
   addItemsToPlayer(\"fried_meat.itm\", 1)\
   addItemsToPlayer(\"melon.itm\", 2)\
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
		["text"] = "Sit down by the fire, huma. We can talk now. Here's something from my stocks. It's not much, but this is all the hospitality I can afford.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 1;
		["connectID"] = 20;
		["posX"] = -5850;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "Thanks, let's continue our conversation.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["connectID"] = 169;
		["posX"] = -5610;
		["posY"] = 1680;
		["script"] = "";
		["text"] = "Why not? Time is something I have plenty of now. I can spend all the time I want just talking to another soul.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 1;
		["connectID"] = 26;
		["posX"] = -4470;
		["posY"] = 3630;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"abori_goes_home\", \"old_outcast_in_hideout\")\
end\
\
";
		["text"] = "We were talking about the reasons of your exile. Are you a criminal?";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 1;
		["connectID"] = 23;
		["posX"] = -4470;
		["posY"] = 3750;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"abori_goes_home\", \"old_outcast_in_hideout\")\
end\
\
";
		["text"] = "What is this taboo you mentioned?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 2;
		["connectID"] = 362;
		["posX"] = -4230;
		["posY"] = 3750;
		["script"] = "";
		["text"] = "I don't really know the proper word for it in your language... Taboo is something forbidden, something that should not be. Something for which there are no words.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 1;
		["connectID"] = 25;
		["posX"] = -3270;
		["posY"] = 3750;
		["script"] = "";
		["text"] = "Looks like your taboo is some kind of spatial anomaly.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 2;
		["connectID"] = 236;
		["posX"] = -3030;
		["posY"] = 3750;
		["script"] = "";
		["text"] = "Anomaly or taboo, whatever you want to call it. Bad things happen here. But I've been here for a long time - I figured out the taboo's laws. Taboo is like a lightning, it rarely hits the same place twice. Therefore, I settled in this crevice, and as you can see, I'm still alive.";
		["time"] = 28;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 2;
		["connectID"] = 27;
		["posX"] = -4230;
		["posY"] = 3630;
		["script"] = "";
		["text"] = "I might as well be. Perhaps my stupidity is my crime. It's hard to remember this without shame...";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 1;
		["connectID"] = 28;
		["posX"] = -3990;
		["posY"] = 3630;
		["script"] = "";
		["text"] = "Anyway, what happened to you?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["connectID"] = 360;
		["posX"] = -3750;
		["posY"] = 3630;
		["script"] = "";
		["text"] = "Well, maybe it will teach you something. I was a shaman of... well, it doesn't matter which tribe anymore. I faithfully served it, communicated with the Gods-in-the-Earth and conveyed their will to the chief and the people.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["connectID"] = 31;
		["posX"] = -2790;
		["posY"] = 3630;
		["script"] = "";
		["text"] = "And what happened next? A tribal split?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 2;
		["connectID"] = 29;
		["posX"] = -3030;
		["posY"] = 3630;
		["script"] = "";
		["text"] = "\\[Sighs heavily]";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 2;
		["connectID"] = 33;
		["posX"] = -2550;
		["posY"] = 3630;
		["script"] = "";
		["text"] = "Exactly that. A split. Bloodshed between families that hunted together for centuries and intermarried their children. Dozens of hunters died and the tribe has weakened. We got sick and hungry. I... I don't know whose fault it is, mine or the young chief's, but that's not important anymore.";
		["time"] = 25.5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 1;
		["connectID"] = 34;
		["posX"] = -1830;
		["posY"] = 3630;
		["script"] = "";
		["text"] = "Wait, was this exile self-imposed? You're crazy!";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 2;
		["connectID"] = 351;
		["posX"] = -2310;
		["posY"] = 3630;
		["script"] = "";
		["text"] = "I realized that the tribe needs a new shaman, a younger and a more open-minded one. The one that can better see the way to an agreement between traditions of ancestors and necessary changes.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = -1590;
		["posY"] = 3630;
		["script"] = "";
		["text"] = "It's better than allowing bloody conflicts between tribesmen. For years I wandered in the desert, but neither animals nor vagabonds have put an end to my worthless life. Several years ago, I settled here - in this damned place. I think this is where my bones will rest.";
		["time"] = 25;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 1;
		["connectID"] = 36;
		["posX"] = -1350;
		["posY"] = 3630;
		["script"] = "";
		["text"] = "And what happened to this young chief?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 2;
		["connectID"] = 350;
		["posX"] = -1110;
		["posY"] = 3630;
		["script"] = "";
		["text"] = "I heard that he united several tribes and rebelled against humas. His victories were numerous, but eventually he perished because of treason of one of his tribesmen, who have arranged for a peace treaty with the humas, beneficial to his tribe (the Stone Heads, Fat Pah).";
		["time"] = 24;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 1;
		["connectID"] = 43;
		["posX"] = -4920;
		["posY"] = 2100;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"abori_goes_home\", \"old_outcast_in_hideout\")\
end\
\
";
		["text"] = "Where can I get a better weapon and more supplies?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 2;
		["connectID"] = 202;
		["posX"] = -4680;
		["posY"] = 2100;
		["script"] = "";
		["text"] = "You can always check out those taboo bubbles, but it could be dangerous.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 2;
		["connectID"] = 46;
		["posX"] = -4290;
		["posY"] = 2160;
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
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 1;
		["connectID"] = 47;
		["posX"] = -4050;
		["posY"] = 2160;
		["script"] = "";
		["text"] = "Who are these Scalp Hunters?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 2;
		["connectID"] = 48;
		["posX"] = -3810;
		["posY"] = 2160;
		["script"] = "";
		["text"] = "Young hunters gather scalps before returning back to the tribe and getting their first wife. Many of them like this so much that they don't return to the tribe and become headhunters. One group went on a rampage recently. That's why the looters and traders don't come here anymore.";
		["time"] = 25.5;
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 1;
		["connectID"] = 49;
		["posX"] = -3570;
		["posY"] = 2160;
		["script"] = "";
		["text"] = "But what could a hermit-exile give in return for the warriors deaths?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 2;
		["connectID"] = 50;
		["posX"] = -3330;
		["posY"] = 2160;
		["script"] = "";
		["text"] = "Something that cannot be bought, huma. Sometime ago this hermit was a shaman. He'll give you knowledge. Such knowledge that you can't imagine. Besides, I've collected some things from the dumpsters.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 1;
		["connectID"] = 51;
		["posX"] = -3090;
		["posY"] = 2160;
		["script"] = "";
		["text"] = "Even if I agree, how am I supposed to go about it? I don't have any weapons, and those abori guys you're talking about sound like they're armed to the teeth, and there's more than just a couple of them.";
		["time"] = 21;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 2;
		["connectID"] = 52;
		["posX"] = -2850;
		["posY"] = 2160;
		["script"] = "";
		["text"] = "We need to scare them off, and for a long time. Kill them and get rid of the bodies. Let their friends think that the taboo claimed their lives.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 1;
		["connectID"] = 53;
		["posX"] = -2610;
		["posY"] = 2160;
		["script"] = "";
		["text"] = "And how should I get rid of the bodies?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 2;
		["connectID"] = 242;
		["posX"] = -2370;
		["posY"] = 2160;
		["script"] = "";
		["text"] = "Pour some melon juice on them and the bugs will eat them! Five bastards should do the trick.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 2;
		["connectID"] = 192;
		["posX"] = -4680;
		["posY"] = 4170;
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
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 1;
		["connectID"] = 57;
		["posX"] = -4290;
		["posY"] = 4110;
		["script"] = "";
		["text"] = "Go on.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 1;
		["posX"] = -4290;
		["posY"] = 4260;
		["script"] = "";
		["text"] = "Not interested.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 2;
		["connectID"] = 58;
		["posX"] = -4050;
		["posY"] = 4110;
		["script"] = "";
		["text"] = "I have a friend here. He's not a madman. He's also an outcast, a younger one. He planned to visit me but never came. Last time we met he bragged about his plans to inspect the Bad Cave. I'm worried if something happened to him... Find him and give him a message from me. He will reward you with something, he climbs places I do not dare to try. [GIVES an aboriginal lace-nodding letter]";
		["time"] = 38;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 1;
		["connectID"] = 59;
		["posX"] = -3810;
		["posY"] = 4110;
		["script"] = "";
		["text"] = "All right. Where does this friend of yours hang out and what's the deal with this Bad Cave?";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 2;
		["connectID"] = 61;
		["posX"] = -3570;
		["posY"] = 4110;
		["script"] = "";
		["text"] = "He lives there (a landmark [WTF?Where is that???]). His refuge is like mine - tough to find. Lots of caves there.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 2;
		["connectID"] = 191;
		["posX"] = -3090;
		["posY"] = 4110;
		["script"] = "";
		["text"] = "We named it this way. It's the only place where the taboo strikes repeatedly. You'll see for yourself. A lot of good loot but very dangerous.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 1;
		["connectID"] = 60;
		["posX"] = -3330;
		["posY"] = 4110;
		["script"] = "";
		["text"] = "Why the strange name?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 1;
		["connectID"] = 63;
		["posX"] = -4920;
		["posY"] = 5130;
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
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 2;
		["connectID"] = 193;
		["posX"] = -4680;
		["posY"] = 5130;
		["script"] = "";
		["text"] = "Have you seen him? Is he okay?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 1;
		["connectID"] = 68;
		["posX"] = -4290;
		["posY"] = 4950;
		["script"] = "";
		["text"] = "He's dead. He was killed by the taboo. Cut in half.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00065"] = {
		["ID"] = 65;
		["actor"] = 1;
		["connectID"] = 191;
		["posX"] = -4290;
		["posY"] = 5070;
		["script"] = "";
		["text"] = "He is alive and well. He won't come because he's feeling a little bit sick.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00066"] = {
		["ID"] = 66;
		["actor"] = 1;
		["connectID"] = 191;
		["posX"] = -4290;
		["posY"] = 5310;
		["script"] = "";
		["text"] = "Haven't found him yet.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
		["actor"] = 1;
		["connectID"] = 191;
		["posX"] = -4290;
		["posY"] = 5190;
		["script"] = "";
		["text"] = "He found the strength to move to a better place. Here is his farewell letter [GIVE LETTER].";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 2;
		["connectID"] = 69;
		["posX"] = -4050;
		["posY"] = 4950;
		["script"] = "";
		["text"] = "No! That can't be true!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00069"] = {
		["ID"] = 69;
		["actor"] = 1;
		["connectID"] = 191;
		["posX"] = -3810;
		["posY"] = 4950;
		["script"] = "";
		["text"] = "Here is his hand.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00070"] = {
		["ID"] = 70;
		["actor"] = 2;
		["connectID"] = 194;
		["posX"] = -4680;
		["posY"] = 4620;
		["script"] = "";
		["text"] = "Yes?";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00071"] = {
		["ID"] = 71;
		["actor"] = 1;
		["connectID"] = 191;
		["posX"] = -4290;
		["posY"] = 4740;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuestTopicVisible(\"angry_bugs\", \"old_outcast_finish\")\
end\
\
";
		["text"] = "I'm still working on it.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00072"] = {
		["ID"] = 72;
		["actor"] = 1;
		["connectID"] = 70;
		["posX"] = -4920;
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
		["text"] = "[t_angry_bugs:old_outcast_about_scalpers]About the scalp hunters thing.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00075"] = {
		["ID"] = 75;
		["actor"] = 1;
		["connectID"] = 328;
		["posX"] = -4290;
		["posY"] = 4500;
		["script"] = "function message:onStart()\
   local q = getQuest(\"angry_bugs\")\
   q:setTopicVisible(\"old_outcast_about_scalpers\", false)\
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
		["text"] = "[t_angry_bugs:old_outcast_finish]They aren't going to trouble anyone ever again.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00076"] = {
		["ID"] = 76;
		["actor"] = 2;
		["connectID"] = 162;
		["posX"] = -6300;
		["posY"] = 90;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"junk_clothes\", \"start\")\
end\
\
";
		["text"] = "Oh, thank you stranger! I thought it was the end of me, they'd break my old bones and leave me to be eaten by crucasses.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00077"] = {
		["ID"] = 77;
		["actor"] = 2;
		["connectID"] = 85;
		["posX"] = -5910;
		["posY"] = 240;
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
	["message_00078"] = {
		["ID"] = 78;
		["actor"] = 2;
		["connectID"] = 79;
		["posX"] = -5910;
		["posY"] = -60;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"my_clothes\", \"old_outcast_scared_looters\")\
end\
\
";
		["text"] = "I admit, I'm surprised you managed to disperse these punks without violence. You have a very strong mojo.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00079"] = {
		["ID"] = 79;
		["actor"] = 1;
		["connectID"] = 80;
		["posX"] = -5670;
		["posY"] = -60;
		["script"] = "";
		["text"] = "That was uncalled for, old-timer. I actually wash myself regularly!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00080"] = {
		["ID"] = 80;
		["actor"] = 2;
		["connectID"] = 87;
		["posX"] = -5430;
		["posY"] = -60;
		["script"] = "";
		["text"] = "What? No, mojo is... that's, umm... what's the word... Ah, I see. That was humor.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00081"] = {
		["ID"] = 81;
		["actor"] = 1;
		["connectID"] = 82;
		["posX"] = -5670;
		["posY"] = 90;
		["script"] = "";
		["text"] = "This scum robbed me and left for dead in the middle of nowhere. They got what they deserved.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00082"] = {
		["ID"] = 82;
		["actor"] = 2;
		["connectID"] = 83;
		["posX"] = -5430;
		["posY"] = 90;
		["script"] = "";
		["text"] = "But they didn't kill you.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 1;
		["connectID"] = 330;
		["posX"] = -5190;
		["posY"] = 90;
		["script"] = "";
		["text"] = "That's where they made their biggest mistake. They didn't finish the job. They didn't expect me to survive. But I did.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00084"] = {
		["ID"] = 84;
		["actor"] = 2;
		["connectID"] = 87;
		["posX"] = -4710;
		["posY"] = 90;
		["script"] = "";
		["text"] = "I'll keep it in mind. And considering this place, you probably have a point.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00085"] = {
		["ID"] = 85;
		["actor"] = 1;
		["connectID"] = 87;
		["posX"] = -5670;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Pain is an effective teacher. Well, I'm always in the mood to kick a couple of brazen asses.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00086"] = {
		["ID"] = 86;
		["actor"] = 2;
		["connectID"] = 89;
		["posX"] = -5670;
		["posY"] = 510;
		["script"] = "";
		["text"] = "I can see it in your eyes - you have a lot of questions, huma, but let the old man ask you something first.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00087"] = {
		["ID"] = 87;
		["actor"] = 1;
		["connectID"] = 88;
		["posX"] = -4410;
		["posY"] = 90;
		["script"] = "";
		["text"] = "So, aborigine, you okay?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00088"] = {
		["ID"] = 88;
		["actor"] = 2;
		["connectID"] = 86;
		["posX"] = -5910;
		["posY"] = 510;
		["script"] = "";
		["text"] = "I'm old, but not feeble. We quargo are like stained wood - getting sturdier with time. No broken bones, which is the most important, and bruises and scratches will heal quickly.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00089"] = {
		["ID"] = 89;
		["actor"] = 1;
		["connectID"] = 90;
		["posX"] = -5430;
		["posY"] = 510;
		["script"] = "";
		["text"] = "Sure. Just don't expect that the fact I helped your old ass means I'm going to tell you my life story.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00090"] = {
		["ID"] = 90;
		["actor"] = 2;
		["connectID"] = 163;
		["posX"] = -5190;
		["posY"] = 510;
		["script"] = "";
		["text"] = "Pardon my curiosity, but how did you end up here - did your tribe exile you?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 1;
		["connectID"] = 98;
		["posX"] = -4800;
		["posY"] = 360;
		["script"] = "";
		["text"] = "You could say that. My ship was hijacked and I was dumped from the airlock like a pile of garbage. Then I woke up here... in the middle of nowhere.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00092"] = {
		["ID"] = 92;
		["actor"] = 1;
		["connectID"] = 95;
		["posX"] = -4800;
		["posY"] = 510;
		["script"] = "";
		["text"] = "It's none of your business. The less you know, the better you sleep.";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00093"] = {
		["ID"] = 93;
		["actor"] = 1;
		["connectID"] = 94;
		["posX"] = -4800;
		["posY"] = 660;
		["script"] = "";
		["text"] = "Why do you care?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00094"] = {
		["ID"] = 94;
		["actor"] = 2;
		["connectID"] = 96;
		["posX"] = -4560;
		["posY"] = 660;
		["script"] = "";
		["text"] = "\\[Measures Jack with an appraising look]. Well, you don't look like a tourist. And this place draws those who have nowhere else to go. Outcasts. The unfortunate. Those kinds. We try to help each other as much as possible. Well, those of us who haven't gone completely wild yet.";
		["time"] = 25.5;
		["type"] = "message";
	};
	["message_00095"] = {
		["ID"] = 95;
		["actor"] = 2;
		["connectID"] = 101;
		["posX"] = -4560;
		["posY"] = 510;
		["script"] = "";
		["text"] = "I see you are a man who values his privacy. I respect that, and expect the same treatment.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00096"] = {
		["ID"] = 96;
		["actor"] = 1;
		["connectID"] = 97;
		["posX"] = -4320;
		["posY"] = 660;
		["script"] = "";
		["text"] = "So you're an outcast?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00097"] = {
		["ID"] = 97;
		["actor"] = 2;
		["connectID"] = 102;
		["posX"] = -4080;
		["posY"] = 660;
		["script"] = "";
		["text"] = "Sort of. But this isn't a topic I am willing to discuss with strangers. Maybe later.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00098"] = {
		["ID"] = 98;
		["actor"] = 2;
		["connectID"] = 99;
		["posX"] = -4560;
		["posY"] = 360;
		["script"] = "";
		["text"] = "A sad story. And what are you planning to do now?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00099"] = {
		["ID"] = 99;
		["actor"] = 1;
		["connectID"] = 100;
		["posX"] = -4320;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Find my ship and shoot a couple of heads off. In the meantime, wouldn't hurt to earn some money.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00100"] = {
		["ID"] = 100;
		["actor"] = 2;
		["connectID"] = 102;
		["posX"] = -4080;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Ha! It's nice to see a huma with a purpose, who clearly knows what he wants.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00101"] = {
		["ID"] = 101;
		["actor"] = 1;
		["connectID"] = 102;
		["posX"] = -4320;
		["posY"] = 510;
		["script"] = "";
		["text"] = "I'm glad we're on the same page. The world would've been a much better place if nobody poked his nose into other people's business.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00102"] = {
		["ID"] = 102;
		["actor"] = 2;
		["connectID"] = 103;
		["posX"] = -3810;
		["posY"] = 510;
		["script"] = "";
		["text"] = "All right huma, you helped me - and I'll help you. You'll want to get some clothes first. You won't get far in our desert barefoot.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00103"] = {
		["ID"] = 103;
		["actor"] = 2;
		["connectID"] = 196;
		["posX"] = -3570;
		["posY"] = 510;
		["script"] = "";
		["text"] = "[t_junk_clothes:start]Bring me two pieces of cloth - we need to protect your tender heels. Wouldn't hurt to cover your pink belly from the sun as well, or you'll turn red like a bitebug on a stick in a heartbeat. Also, you're gonna need a better weapon.";
		["time"] = 24;
		["type"] = "message";
	};
	["message_00105"] = {
		["ID"] = 105;
		["actor"] = 1;
		["connectID"] = 110;
		["posX"] = -4170;
		["posY"] = 840;
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
		["text"] = "[t_junk_clothes:old_outcast_give_cloth]\\[Give 2 Cloth]Yeah.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00106"] = {
		["ID"] = 106;
		["actor"] = 1;
		["connectID"] = 107;
		["posX"] = -4920;
		["posY"] = 960;
		["script"] = "";
		["text"] = "About the cloth...";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00107"] = {
		["ID"] = 107;
		["actor"] = 2;
		["connectID"] = 168;
		["posX"] = -4680;
		["posY"] = 960;
		["script"] = "";
		["text"] = "Do you have it?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00109"] = {
		["ID"] = 109;
		["actor"] = 1;
		["connectID"] = 215;
		["posX"] = -4170;
		["posY"] = 1080;
		["script"] = "";
		["text"] = "Not yet.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00110"] = {
		["ID"] = 110;
		["actor"] = 2;
		["connectID"] = 111;
		["posX"] = -3930;
		["posY"] = 840;
		["script"] = "";
		["text"] = "Let's have a look. Alright... I had a piece of rubber here somewhere, for the sole... Here. Done! Put it on!";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00111"] = {
		["ID"] = 111;
		["actor"] = 1;
		["connectID"] = 112;
		["posX"] = -3690;
		["posY"] = 840;
		["script"] = "";
		["text"] = "[t_junk_clothes:finish]I feel like an ancient Greek. Practically an argonaut!";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00112"] = {
		["ID"] = 112;
		["actor"] = 2;
		["connectID"] = 166;
		["posX"] = -3450;
		["posY"] = 840;
		["script"] = "";
		["text"] = "I have no clue who gronkhas and astronauts are, but I hope this was a compliment to my work. If you want something better, it'll require more materials and time. And my tools, which I left in the hideout.";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00117"] = {
		["ID"] = 117;
		["actor"] = 1;
		["connectID"] = 120;
		["posX"] = -4440;
		["posY"] = 1620;
		["script"] = "";
		["text"] = "And how do I get there?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00118"] = {
		["ID"] = 118;
		["actor"] = 1;
		["connectID"] = 119;
		["posX"] = -4920;
		["posY"] = 1620;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"to_fort\", \"start\")\
end\
\
";
		["text"] = "I have to find my ship. Do you have any ideas?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00119"] = {
		["ID"] = 119;
		["actor"] = 2;
		["connectID"] = 117;
		["posX"] = -4680;
		["posY"] = 1620;
		["script"] = "";
		["text"] = "A ship? Sorry, but I don't know anything about starships. I think you'd better get to the nearest human settlement and start looking there.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00120"] = {
		["ID"] = 120;
		["actor"] = 2;
		["connectID"] = 121;
		["posX"] = -4200;
		["posY"] = 1620;
		["script"] = "";
		["text"] = "The nearest town is New Hope, but it'll take one a week to get there walking. But that's for an abori. For you - two weeks at least. The road is difficult and dangerous. It's better to go well-prepared.";
		["time"] = 20.5;
		["type"] = "message";
	};
	["message_00121"] = {
		["ID"] = 121;
		["actor"] = 2;
		["connectID"] = 122;
		["posX"] = -3960;
		["posY"] = 1620;
		["script"] = "";
		["text"] = "[t_to_fort:start]You should head for the fort of the humas. It's not far, just north of Windscream Canyon. There you can join a caravan to town. It's much safer that way.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00122"] = {
		["ID"] = 122;
		["actor"] = 1;
		["connectID"] = 123;
		["posX"] = -3720;
		["posY"] = 1620;
		["script"] = "";
		["text"] = "Understood. And how do I find the fort?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00123"] = {
		["ID"] = 123;
		["actor"] = 2;
		["connectID"] = 125;
		["posX"] = -3480;
		["posY"] = 1620;
		["script"] = "";
		["text"] = "First you need to get out of this damned place through a narrow rocky passage to the west of the lake and reach the caravan route. Don't even try the desert - with your current equipment it's certain death. If you follow the caravan route you'll find a small hunters camp. Ask them for directions. Maybe someone can even take you to the fort.";
		["time"] = 33;
		["type"] = "message";
	};
	["message_00125"] = {
		["ID"] = 125;
		["actor"] = 2;
		["connectID"] = 242;
		["posX"] = -3240;
		["posY"] = 1620;
		["script"] = "";
		["text"] = "Be careful, huma. The canyon is full of bandits and dangerous beasts. Better not get off the road if you aren't ready for a serious fight.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00127"] = {
		["ID"] = 127;
		["actor"] = 1;
		["connectID"] = 128;
		["posX"] = -4470;
		["posY"] = 3390;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"abori_goes_home\", \"old_outcast_in_hideout\")\
end\
\
";
		["text"] = "How come you aborigines understand our language?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00128"] = {
		["ID"] = 128;
		["actor"] = 2;
		["connectID"] = 129;
		["posX"] = -4230;
		["posY"] = 3390;
		["script"] = "";
		["text"] = "You're kidding, right? It's been two hundred years since you've \"colonized\" us. How can we not know the language of our \"benefactors\"? Then again, it's a lot simpler than ours, which has three layers of meaning and a bunch of sounds that you're not only unable to pronounce, but even hear.";
		["time"] = 26.5;
		["type"] = "message";
	};
	["message_00129"] = {
		["ID"] = 129;
		["actor"] = 1;
		["connectID"] = 200;
		["posX"] = -3990;
		["posY"] = 3390;
		["script"] = "";
		["text"] = "Can you teach me your language?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00130"] = {
		["ID"] = 130;
		["actor"] = 2;
		["connectID"] = 236;
		["posX"] = -3600;
		["posY"] = 3450;
		["script"] = "";
		["text"] = "\\[HIDDEN]To speak it - no. It's like teaching a blind to draw or a deaf to play music. But I might be able to teach you to read it. Well, the first layer of meaning at least. The language of artisans and peasants. Concepts and actions which it describes are the same for us and humas.";
		["time"] = 29;
		["type"] = "message";
	};
	["message_00133"] = {
		["ID"] = 133;
		["actor"] = 1;
		["connectID"] = 243;
		["posX"] = -3510;
		["posY"] = 2970;
		["script"] = "";
		["text"] = "How can I navigate here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00134"] = {
		["ID"] = 134;
		["actor"] = 2;
		["connectID"] = 236;
		["posX"] = -3120;
		["posY"] = 2880;
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
	["message_00151"] = {
		["ID"] = 151;
		["actor"] = 1;
		["connectID"] = 152;
		["posX"] = -4170;
		["posY"] = 960;
		["script"] = "";
		["text"] = "Where can I get it?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00152"] = {
		["ID"] = 152;
		["actor"] = 2;
		["connectID"] = 215;
		["posX"] = -3930;
		["posY"] = 960;
		["script"] = "";
		["text"] = "Look through the piles of garbage around here. Other outcasts might have some too. They're unlikely to share it with you though.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00153"] = {
		["ID"] = 153;
		["actor"] = 1;
		["connectID"] = 154;
		["posX"] = -4920;
		["posY"] = 1170;
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
	["message_00154"] = {
		["ID"] = 154;
		["actor"] = 2;
		["connectID"] = 331;
		["posX"] = -4680;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Me neither, but it's not easy to find guns in here. I would've made you a good knife, but that requires materials and tools. If I were you I wouldn't rely on some metal trash - it either breaks or backfires on you.";
		["time"] = 22.5;
		["type"] = "message";
	};
	["message_00155"] = {
		["ID"] = 155;
		["actor"] = 1;
		["connectID"] = 156;
		["posX"] = -4920;
		["posY"] = 1320;
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
	["message_00156"] = {
		["ID"] = 156;
		["actor"] = 2;
		["posX"] = -4680;
		["posY"] = 1320;
		["script"] = "";
		["text"] = "Oh, well, in that case I think you'll figure it out for yourself. Good luck on your way, huma. I'll be here for a while, if you change your mind.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00158"] = {
		["ID"] = 158;
		["actor"] = 1;
		["connectID"] = 166;
		["posX"] = -6330;
		["posY"] = 1830;
		["script"] = "";
		["text"] = "Hey, old man.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00159"] = {
		["ID"] = 159;
		["actor"] = 2;
		["connectID"] = 167;
		["posX"] = -5340;
		["posY"] = 1230;
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
		["text"] = "[t_junk_clothes:old_outcast_get_cloth]Yes? Do you still want my advice?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00161"] = {
		["ID"] = 161;
		["actor"] = 2;
		["connectID"] = 169;
		["posX"] = -5340;
		["posY"] = 1830;
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
		["type"] = "message";
	};
	["message_00164"] = {
		["ID"] = 164;
		["actor"] = 1;
		["connectID"] = 165;
		["posX"] = -6930;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00173"] = {
		["ID"] = 173;
		["actor"] = 2;
		["connectID"] = 169;
		["posX"] = -5340;
		["posY"] = 1980;
		["script"] = "";
		["text"] = "Yes?";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00183"] = {
		["ID"] = 183;
		["actor"] = 1;
		["connectID"] = 184;
		["posX"] = -4920;
		["posY"] = 3510;
		["script"] = "";
		["text"] = "I have a couple of questions.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00191"] = {
		["ID"] = 191;
		["actor"] = 2;
		["connectID"] = 169;
		["posX"] = -2280;
		["posY"] = 4770;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00195"] = {
		["ID"] = 195;
		["actor"] = 2;
		["connectID"] = 236;
		["posX"] = -3600;
		["posY"] = 3330;
		["script"] = "";
		["text"] = "To speak it - no. It's like teaching a blind to draw or a deaf to play music. I might be able to teach you to read it, but certainly not here, and not now. I have more important matters to attend to, as I'm sure you too. Perhaps later.";
		["time"] = 26;
		["type"] = "message";
	};
	["message_00197"] = {
		["ID"] = 197;
		["actor"] = 1;
		["connectID"] = 110;
		["posX"] = -3180;
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
		["text"] = "[t_junk_clothes:old_outcast_give_cloth]\\[Give 2 Cloth]I have this.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00199"] = {
		["ID"] = 199;
		["actor"] = 1;
		["posX"] = -4920;
		["posY"] = 1440;
		["script"] = "";
		["text"] = "Gotta go.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00201"] = {
		["ID"] = 201;
		["actor"] = 1;
		["connectID"] = 54;
		["posX"] = -4920;
		["posY"] = 4170;
		["script"] = "";
		["text"] = "I have to go.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00206"] = {
		["ID"] = 206;
		["actor"] = 1;
		["posX"] = -6720;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Bye";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00207"] = {
		["ID"] = 207;
		["actor"] = 2;
		["connectID"] = 211;
		["posX"] = -7500;
		["posY"] = 990;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00208"] = {
		["ID"] = 208;
		["actor"] = 1;
		["connectID"] = 209;
		["posX"] = -7110;
		["posY"] = 630;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00210"] = {
		["ID"] = 210;
		["actor"] = 1;
		["connectID"] = 165;
		["posX"] = -6720;
		["posY"] = 510;
		["script"] = "function message:onStart()\
   local q = getQuest(\"junk_clothes\")\
   q:setTopicVisible(\"start\", false)\
   q:setTopicVisible(\"old_outcast_get_cloth\", false)\
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
		["text"] = "Skip to escort quest";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00212"] = {
		["ID"] = 212;
		["actor"] = 1;
		["connectID"] = 165;
		["posX"] = -6720;
		["posY"] = 630;
		["script"] = "function message:onStart()\
   local q = getQuest(\"junk_clothes\")\
   q:setTopicVisible(\"start\", false)\
   q:setTopicVisible(\"old_outcast_get_cloth\", false)\
   local q = getQuest(\"abori_goes_home\")\
   q:setTopicVisible(\"escort\", false)\
   q:setTopicVisible(\"old_outcast_before_hideout\", false)\
   q:setTopicVisible(\"old_outcast_in_hideout\", true)\
   q:setTopicVisible(\"start\", false)\
   q:setTopicVisible(\"escort\", false)\
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
		["text"] = "Skip to hideout";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00215"] = {
		["ID"] = 215;
		["actor"] = 2;
		["connectID"] = 167;
		["posX"] = -2760;
		["posY"] = 1140;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00216"] = {
		["ID"] = 216;
		["actor"] = 1;
		["connectID"] = 217;
		["posX"] = -4920;
		["posY"] = 1740;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"abori_goes_home\", \"start\")\
end\
\
";
		["text"] = "What are you going to do now?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00217"] = {
		["ID"] = 217;
		["actor"] = 2;
		["connectID"] = 332;
		["posX"] = -4680;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "Well, it's dangerous to stay here and I'm not my young self, so even a couple of small crucasses could pose as a serious threat. Damn pests get out of their holes at this time.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00219"] = {
		["ID"] = 219;
		["actor"] = 2;
		["connectID"] = 220;
		["posX"] = -4200;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "I have to get to my hideout and I fear I won't make it there alone.\
";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00220"] = {
		["ID"] = 220;
		["actor"] = 2;
		["connectID"] = 189;
		["posX"] = -3960;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "[t_abori_goes_home:start]And even though I don't completely trust you, I have to ask you to escort me there. I'll reward you with some of my humble supplies.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00221"] = {
		["ID"] = 221;
		["actor"] = 1;
		["connectID"] = 189;
		["posX"] = -4920;
		["posY"] = 1860;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"abori_goes_home\", \"escort\")\
end\
\
";
		["text"] = "About the trip to your hideout...";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00222"] = {
		["ID"] = 222;
		["actor"] = 1;
		["connectID"] = 242;
		["posX"] = -3540;
		["posY"] = 1920;
		["script"] = "";
		["text"] = "\\[BACK]Maybe later.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00228"] = {
		["ID"] = 228;
		["actor"] = 1;
		["connectID"] = 191;
		["posX"] = -4470;
		["posY"] = 3870;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00236"] = {
		["ID"] = 236;
		["actor"] = 2;
		["connectID"] = 184;
		["posX"] = -570;
		["posY"] = 3630;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00237"] = {
		["ID"] = 237;
		["actor"] = 2;
		["connectID"] = 242;
		["posX"] = -4290;
		["posY"] = 2040;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00239"] = {
		["ID"] = 239;
		["actor"] = 1;
		["connectID"] = 215;
		["posX"] = -3180;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Hm...";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00240"] = {
		["ID"] = 240;
		["actor"] = 2;
		["connectID"] = 236;
		["posX"] = -3990;
		["posY"] = 3210;
		["script"] = "";
		["text"] = "I'm not my young self, so even a couple of small crucasses could pose as a serious threat. Damn pests get out of their holes at this time. And the Scalp Hunters got bolder and wander further and further inside the taboo area. We can talk when you take me to my hideout.";
		["time"] = 27.5;
		["type"] = "message";
	};
	["message_00241"] = {
		["ID"] = 241;
		["actor"] = 2;
		["connectID"] = 236;
		["posX"] = -3990;
		["posY"] = 3510;
		["script"] = "";
		["text"] = "I have seen and outlived many of them. I know how it feels to lose everything.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00242"] = {
		["ID"] = 242;
		["actor"] = 2;
		["connectID"] = 169;
		["posX"] = -810;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00244"] = {
		["ID"] = 244;
		["actor"] = 2;
		["posX"] = -3120;
		["posY"] = 3030;
		["script"] = "";
		["text"] = "Just follow the map I gave you, and try to find that hunters camp and ask for directions there.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00245"] = {
		["ID"] = 245;
		["actor"] = 1;
		["connectID"] = 323;
		["posX"] = -4920;
		["posY"] = 2430;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"angry_bugs\", \"old_outcast_trick\")\
end\
\
";
		["text"] = "I've found a large camp of scalp hunters in the cave, close to the Cutthroat Pass. I guess they aren't making life for you outcasts here easier. Maybe you know some trick to get rid of these savages?";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00246"] = {
		["ID"] = 246;
		["actor"] = 2;
		["connectID"] = 247;
		["posX"] = -4530;
		["posY"] = 2490;
		["script"] = "";
		["text"] = "Good to know you have some brains between those hideous pink ears, huma. Others in your place would have simply rushed to their camp with guns blazing. And that would be the last mistake in their life.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00247"] = {
		["ID"] = 247;
		["actor"] = 2;
		["connectID"] = 333;
		["posX"] = -4290;
		["posY"] = 2490;
		["script"] = "";
		["text"] = "You're talking to the right abori about that issue. That fool Big Hat in the village claims he's the oldest outcast here, but I've settled in this valley many pulsations before him.";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00248"] = {
		["ID"] = 248;
		["actor"] = 2;
		["connectID"] = 249;
		["posX"] = -3810;
		["posY"] = 2490;
		["script"] = "";
		["text"] = "Hm...";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00249"] = {
		["ID"] = 249;
		["actor"] = 1;
		["connectID"] = 250;
		["posX"] = -3570;
		["posY"] = 2490;
		["script"] = "";
		["text"] = "Hey, old man! Wake up!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00250"] = {
		["ID"] = 250;
		["actor"] = 2;
		["connectID"] = 334;
		["posX"] = -3330;
		["posY"] = 2490;
		["script"] = "";
		["text"] = "What? Ah, there is no need to be so loud! I wasn't sleeping at all! I was reconstructing and visiting that cave and its surroundings in my mind.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00251"] = {
		["ID"] = 251;
		["actor"] = 2;
		["connectID"] = 254;
		["posX"] = -2850;
		["posY"] = 2490;
		["script"] = "";
		["text"] = "Anyway, I have good and bad news for you. Which one you would you rather hear first?";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00252"] = {
		["ID"] = 252;
		["actor"] = 1;
		["connectID"] = 255;
		["posX"] = -2460;
		["posY"] = 2400;
		["script"] = "";
		["text"] = "Good news.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00253"] = {
		["ID"] = 253;
		["actor"] = 1;
		["connectID"] = 256;
		["posX"] = -2460;
		["posY"] = 2580;
		["script"] = "";
		["text"] = "Bad news first.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00255"] = {
		["ID"] = 255;
		["actor"] = 2;
		["connectID"] = 335;
		["posX"] = -2220;
		["posY"] = 2400;
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
	["message_00256"] = {
		["ID"] = 256;
		["actor"] = 2;
		["connectID"] = 336;
		["posX"] = -2220;
		["posY"] = 2580;
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
	["message_00257"] = {
		["ID"] = 257;
		["actor"] = 1;
		["connectID"] = 258;
		["posX"] = -1740;
		["posY"] = 2400;
		["script"] = "";
		["text"] = "A weapon of mass destruction? Now we are talking! Is it an ancient alien artifact that shoots lightnings? Where is it?";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00258"] = {
		["ID"] = 258;
		["actor"] = 2;
		["connectID"] = 262;
		["posX"] = -1500;
		["posY"] = 2400;
		["script"] = "";
		["text"] = "Don't get too excited and hear out the rest please.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00262"] = {
		["ID"] = 262;
		["actor"] = 1;
		["connectID"] = 324;
		["posX"] = -1260;
		["posY"] = 2400;
		["script"] = "";
		["text"] = "Fine, bring it on!";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00263"] = {
		["ID"] = 263;
		["actor"] = 1;
		["connectID"] = 264;
		["posX"] = -1740;
		["posY"] = 2580;
		["script"] = "";
		["text"] = "You could say the same about any kind of trade, old man. Now cut to the point.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00264"] = {
		["ID"] = 264;
		["actor"] = 2;
		["connectID"] = 324;
		["posX"] = -1500;
		["posY"] = 2580;
		["script"] = "";
		["text"] = "As you wish.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00265"] = {
		["ID"] = 265;
		["actor"] = 2;
		["connectID"] = 267;
		["posX"] = -810;
		["posY"] = 2520;
		["script"] = "";
		["text"] = "There was a big hive of bitebugs in that cave, but two and a half pulsations ago the cave was flooded for some reason. Maybe some taboo bubble has changed the water's flow or something else. Doesn't matter.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00266"] = {
		["ID"] = 266;
		["actor"] = 1;
		["connectID"] = 272;
		["posX"] = 300;
		["posY"] = 2520;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"angry_bugs\", \"old_outcast_sneaking\")\
end\
\
";
		["text"] = "I don't think I'm that good at sneaking. Out of practice.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00267"] = {
		["ID"] = 267;
		["actor"] = 2;
		["connectID"] = 268;
		["posX"] = -570;
		["posY"] = 2520;
		["script"] = "";
		["text"] = "The thing is that bitebugs like to be near the water source, but not drowning in it. So they've rebuilt their hives higher to avoid the flood. This gives us one risky opportunity.";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00268"] = {
		["ID"] = 268;
		["actor"] = 1;
		["connectID"] = 269;
		["posX"] = -330;
		["posY"] = 2520;
		["script"] = "";
		["text"] = "How on earth some bugs will help us root out a gang of murderers, armed with handguns and stuff?";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00269"] = {
		["ID"] = 269;
		["actor"] = 2;
		["connectID"] = 270;
		["posX"] = -90;
		["posY"] = 2520;
		["script"] = "";
		["text"] = "Easily... in theory. Well, here's my plan: we will combine my knowledge of the area, your sneaking skills and the force of Mother Nature.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00271"] = {
		["ID"] = 271;
		["actor"] = 1;
		["connectID"] = 274;
		["posX"] = 300;
		["posY"] = 2370;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"angry_bugs\", \"old_outcast_knowledge\")\
end\
\
";
		["text"] = "So what kind of edgy and valuable knowledge about the area do you have?";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00272"] = {
		["ID"] = 272;
		["actor"] = 2;
		["connectID"] = 273;
		["posX"] = 540;
		["posY"] = 2520;
		["script"] = "";
		["text"] = "Infiltrating the cave from the main entrance might be difficult indeed. I would not risk it even when I was younger, but you look agile and might have a shot. If you realy that bad at sneaking, I have another solution for you.";
		["time"] = 22.5;
		["type"] = "message";
	};
	["message_00273"] = {
		["ID"] = 273;
		["actor"] = 2;
		["connectID"] = 280;
		["posX"] = 780;
		["posY"] = 2520;
		["script"] = "";
		["text"] = "We outcasts know that there is a second entrance to the cave. I doubt the savages have discovered it already and even if they did, they are lazy by the nature.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00274"] = {
		["ID"] = 274;
		["actor"] = 2;
		["connectID"] = 275;
		["posX"] = 540;
		["posY"] = 2370;
		["script"] = "";
		["text"] = "As far as I rememeber the cave has a long stone gallery inside, that makes it pretty easy to sneak up to the camp. If you're careful. You will find this gallery on the right side, going from the main entrance.";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00275"] = {
		["ID"] = 275;
		["actor"] = 2;
		["connectID"] = 279;
		["posX"] = 780;
		["posY"] = 2370;
		["script"] = "";
		["text"] = "It's dim and cold there, lots of drafts. I doubt they have any watchmen patrolling the gallery. They rather stick to their warm fires and drink themselves into oblivion. They don't see the outcasts as a credible threat.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00276"] = {
		["ID"] = 276;
		["actor"] = 1;
		["connectID"] = 277;
		["posX"] = 300;
		["posY"] = 2760;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"angry_bugs\", \"old_outcast_nature\")\
end\
\
";
		["text"] = "What about Mother Nature?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00277"] = {
		["ID"] = 277;
		["actor"] = 2;
		["connectID"] = 278;
		["posX"] = 540;
		["posY"] = 2760;
		["script"] = "";
		["text"] = "Oh, that's my favorite part! And the most dangerous, as I see it. We are going to turn an entire bugbite hive against the savages.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00278"] = {
		["ID"] = 278;
		["actor"] = 1;
		["connectID"] = 289;
		["posX"] = 780;
		["posY"] = 2760;
		["script"] = "";
		["text"] = "That does sound dangerous. Why would the hive attack them and not me?";
		["time"] = 7.5;
		["type"] = "message";
	};
	["message_00279"] = {
		["ID"] = 279;
		["actor"] = 2;
		["connectID"] = 294;
		["posX"] = 1020;
		["posY"] = 2370;
		["script"] = "";
		["text"] = "[t_angry_bugs:old_outcast_knowledge]Besides, most of the time, we bipedal creatures tend to look at each other and at the ground rather than above. Use this area to safely navigate the cave but be careful - you're not completely invisible there.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00280"] = {
		["ID"] = 280;
		["actor"] = 2;
		["connectID"] = 281;
		["posX"] = 1020;
		["posY"] = 2520;
		["script"] = "";
		["text"] = "I won't expect them to set traps or some serious watchpost there. They feel confident and dont expect any real threat from us. Still you might stumble on a couple of bastards just taking a leak outside of their camp. Be prepared to neutralize them quielty.";
		["time"] = 24;
		["type"] = "message";
	};
	["message_00281"] = {
		["ID"] = 281;
		["actor"] = 1;
		["connectID"] = 282;
		["posX"] = 1260;
		["posY"] = 2520;
		["script"] = "";
		["text"] = "They won't see it coming. Where can I find this second entrance?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00282"] = {
		["ID"] = 282;
		["actor"] = 2;
		["connectID"] = 286;
		["posX"] = 1500;
		["posY"] = 2520;
		["script"] = "";
		["text"] = "Oh, it's not far from here. When you exit my hideout, turn right and follow the path, always hug the rock wall and don't go down the valley. You will see a large niche in the wall and a lot of old bitebug hives. Between them is the entrance to the narrow mountain pass. ";
		["time"] = 28.5;
		["type"] = "message";
	};
	["message_00283"] = {
		["ID"] = 283;
		["actor"] = 2;
		["connectID"] = 242;
		["posX"] = -4530;
		["posY"] = 2340;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible() or getQuestTopicVisible(\"abori_goes_home\", \"escort\")\
end\
\
";
		["text"] = "[t_abori_goes_home:start]This isn't the right place to talk about that. Could you help me get to my hideout first please?";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00286"] = {
		["ID"] = 286;
		["actor"] = 2;
		["connectID"] = 287;
		["posX"] = 1740;
		["posY"] = 2520;
		["script"] = "";
		["text"] = "It is not secret but rarely visited by anyone as it makes quite a long route. Once you go through that pass, you will find yourself on these rock ledges clinging to the side of a big opening. This area might be a bit confusing so proceed with care.";
		["time"] = 25.5;
		["type"] = "message";
	};
	["message_00287"] = {
		["ID"] = 287;
		["actor"] = 2;
		["connectID"] = 294;
		["posX"] = 1980;
		["posY"] = 2520;
		["script"] = "";
		["text"] = "[t_angry_bugs:old_outcast_sneaking]Just be careful not to break a leg or something. On the other side of these ledges you will find the second entrance to the scalphunters lair. Unguarded, I hope.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00289"] = {
		["ID"] = 289;
		["actor"] = 2;
		["connectID"] = 290;
		["posX"] = 1020;
		["posY"] = 2760;
		["script"] = "";
		["text"] = "The bitebugs don't like the taste of huma flesh. They will just bite your pink ass once and then bugger off!";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00290"] = {
		["ID"] = 290;
		["actor"] = 1;
		["connectID"] = 292;
		["posX"] = 1260;
		["posY"] = 2760;
		["script"] = "";
		["text"] = "You can't be serious!";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00292"] = {
		["ID"] = 292;
		["actor"] = 2;
		["connectID"] = 293;
		["posX"] = 1500;
		["posY"] = 2760;
		["script"] = "";
		["text"] = "You were so serious I just couldn't resist. Don't hold it against a lonely old abori.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00293"] = {
		["ID"] = 293;
		["actor"] = 1;
		["connectID"] = 295;
		["posX"] = 1740;
		["posY"] = 2760;
		["script"] = "";
		["text"] = "You old devil almost got me there! So how do we control the bugs?";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00295"] = {
		["ID"] = 295;
		["actor"] = 2;
		["connectID"] = 337;
		["posX"] = 1980;
		["posY"] = 2760;
		["script"] = "";
		["text"] = "Well, one of the bughunters I have encountered long ago has shared a professional secret with me. Considering the fact that he traded it for a mug of cheapest beer that secret should be either not much of a secret or not effective.";
		["time"] = 22.5;
		["type"] = "message";
	};
	["message_00296"] = {
		["ID"] = 296;
		["actor"] = 1;
		["connectID"] = 299;
		["posX"] = 540;
		["posY"] = 3000;
		["script"] = "";
		["text"] = "I'm not sure.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00299"] = {
		["ID"] = 299;
		["actor"] = 2;
		["connectID"] = 300;
		["posX"] = 780;
		["posY"] = 3000;
		["script"] = "";
		["text"] = "The stinking mushroom is not very poisonous on its own. Not lethal at least. Even edible if cooked properly.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00300"] = {
		["ID"] = 300;
		["actor"] = 2;
		["connectID"] = 302;
		["posX"] = 1020;
		["posY"] = 3000;
		["script"] = "";
		["text"] = "The thing is that the shroom is explosive. It tends to go boom when it feels a big moving target around its mycelium. And the spores are the real danger here. They are sticky and a thick cloud could easily suffocate you.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00301"] = {
		["ID"] = 301;
		["actor"] = 1;
		["connectID"] = 304;
		["posX"] = 1740;
		["posY"] = 3000;
		["script"] = "";
		["text"] = "Is there a life form on this planet that is not trying to kill you in some disgusting and painful way? ";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00302"] = {
		["ID"] = 302;
		["actor"] = 2;
		["connectID"] = 338;
		["posX"] = 1260;
		["posY"] = 3000;
		["script"] = "";
		["text"] = "And even If you don't suffocate, you might cough your lungs out later, cause the spores are causing a strong allergic reaction. That's their means of transportation. It won't kill a hornhog but humas and quargo are not so endurable.";
		["time"] = 21;
		["type"] = "message";
	};
	["message_00304"] = {
		["ID"] = 304;
		["actor"] = 2;
		["connectID"] = 305;
		["posX"] = 1980;
		["posY"] = 3000;
		["script"] = "";
		["text"] = "For your own safety you better think that there isn't.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00305"] = {
		["ID"] = 305;
		["actor"] = 1;
		["connectID"] = 306;
		["posX"] = 2220;
		["posY"] = 3000;
		["script"] = "";
		["text"] = "Fine, what have these murderous mushrooms to do with our scalphunter problem?";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00306"] = {
		["ID"] = 306;
		["actor"] = 2;
		["connectID"] = 307;
		["posX"] = 300;
		["posY"] = 3240;
		["script"] = "";
		["text"] = "Add one to one and figure it out, huma!";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00307"] = {
		["ID"] = 307;
		["actor"] = 1;
		["connectID"] = 310;
		["posX"] = 540;
		["posY"] = 3240;
		["script"] = "";
		["text"] = "You want to stink up those hives with the shrooms so the bugs will get mad and attack whoever's close in a frenzy? What are the chances this crazy method is going to work at all?";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00310"] = {
		["ID"] = 310;
		["actor"] = 2;
		["connectID"] = 339;
		["posX"] = 780;
		["posY"] = 3240;
		["script"] = "";
		["text"] = "Well, I haven't tried this trick myself. But the bughunters definitely did and they survive somehow. Mostly. I would say the chances are even: either it works or you get eaten alive by some very angry bugs.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00311"] = {
		["ID"] = 311;
		["actor"] = 1;
		["connectID"] = 312;
		["posX"] = 1260;
		["posY"] = 3240;
		["script"] = "";
		["text"] = "Well, I have won with worse odds. Where can I find these mushrooms? Hopefuly I don't need to cultivate them on decaying corpses! ";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00312"] = {
		["ID"] = 312;
		["actor"] = 2;
		["connectID"] = 313;
		["posX"] = 1500;
		["posY"] = 3240;
		["script"] = "";
		["text"] = "Well in this arid area the stinking mushrooms are not easy to find. They might grow in caves with lots of organic wastes. Luckily for you I know one such place.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00313"] = {
		["ID"] = 313;
		["actor"] = 2;
		["connectID"] = 317;
		["posX"] = 1740;
		["posY"] = 3240;
		["script"] = "";
		["text"] = "Go down to the lake below, in the valley. Just before you enter the water turn right and look for a cave entrance overgrown with some bluethorn. You might find some shrooms in there. This cave was a waste disposal for Big Hat's hunting party.\
";
		["time"] = 23.5;
		["type"] = "message";
	};
	["message_00314"] = {
		["ID"] = 314;
		["actor"] = 1;
		["connectID"] = 315;
		["posX"] = -4290;
		["posY"] = 4620;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuestTopicVisible(\"angry_bugs\", \"old_outcast_finish\")\
end\
\
";
		["text"] = "Could you remind me the plan again?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00315"] = {
		["ID"] = 315;
		["actor"] = 2;
		["connectID"] = 352;
		["posX"] = -4050;
		["posY"] = 4620;
		["script"] = "";
		["text"] = "Get half a'dozen of stinking shrooms, sneak into the cave where the scalphunters have set their camp and stuff the shrooms into the bughive vents. Is it hard to remember?";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00317"] = {
		["ID"] = 317;
		["actor"] = 1;
		["connectID"] = 318;
		["posX"] = 1980;
		["posY"] = 3240;
		["script"] = "";
		["text"] = "How do I collect the shrooms if they are explosive?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00318"] = {
		["ID"] = 318;
		["actor"] = 2;
		["connectID"] = 348;
		["posX"] = 2220;
		["posY"] = 3240;
		["script"] = "";
		["text"] = "They won't explode immediately when you hit the mycelium. Consider it a walk on a minefield, huma. You can go through if you don't rush and have nerves of steel.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00319"] = {
		["ID"] = 319;
		["actor"] = 2;
		["connectID"] = 320;
		["posX"] = 2700;
		["posY"] = 3240;
		["script"] = "";
		["text"] = "You need to get to the small ones. Carefully break the shell with a knife or any other melee weapon and get the unripe shroom. They should still have a decent amount of spores for our goals.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00320"] = {
		["ID"] = 320;
		["actor"] = 2;
		["connectID"] = 321;
		["posX"] = 2940;
		["posY"] = 3240;
		["script"] = "";
		["text"] = "Half a dozen shrooms should be enough, we don't want to start another migration of bitebugs. Those can be a real disaster. I've seen large villages abandoned because of the bitebugs' wrath.";
		["time"] = 17;
		["type"] = "message";
	};
	["message_00321"] = {
		["ID"] = 321;
		["actor"] = 1;
		["connectID"] = 322;
		["posX"] = 3180;
		["posY"] = 3240;
		["script"] = "";
		["text"] = "Got it. Well, old man, pray that your plan works.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00322"] = {
		["ID"] = 322;
		["actor"] = 2;
		["connectID"] = 294;
		["posX"] = 3420;
		["posY"] = 3240;
		["script"] = "";
		["text"] = "[t_angry_bugs:old_outcast_nature]I will, huma. Those scalphunters make our life unbearable. As you've seen we are already fighting among ourselves for the last scraps we have. This is the worst that could happen with the outcasts like us.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00325"] = {
		["ID"] = 325;
		["actor"] = 2;
		["connectID"] = 270;
		["posX"] = 3870;
		["posY"] = 2460;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"angry_bugs\", \"old_outcast_knowledge\")\
       or getQuestTopicVisible(\"angry_bugs\", \"old_outcast_sneaking\")\
       or getQuestTopicVisible(\"angry_bugs\", \"old_outcast_nature\")\
end\
\
";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00326"] = {
		["ID"] = 326;
		["actor"] = 2;
		["connectID"] = 242;
		["posX"] = 3870;
		["posY"] = 2580;
		["script"] = "";
		["text"] = "[t_angry_bugs:old_outcast_trick]Hey, that might just work.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00328"] = {
		["ID"] = 328;
		["actor"] = 2;
		["connectID"] = 329;
		["posX"] = -4050;
		["posY"] = 4500;
		["script"] = "";
		["text"] = "What? The plan actually worked? This is excellent news!";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00329"] = {
		["ID"] = 329;
		["actor"] = 2;
		["connectID"] = 353;
		["posX"] = -3810;
		["posY"] = 4500;
		["script"] = "";
		["text"] = "Mere words cannot describe the depth of my gratitude. You have lifted a great burden from these shoulders, and all outcasts' lives are going to be more bearable now, thanks to you, noble huma.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00330"] = {
		["ID"] = 330;
		["actor"] = 1;
		["connectID"] = 84;
		["posX"] = -4950;
		["posY"] = 90;
		["script"] = "";
		["text"] = "You see, old man, the difference between me and other rabble is that I always make sure that the bastard who crossed me doesn't get a second chance. And sometimes the only way is to get your hands a little dirty.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00331"] = {
		["ID"] = 331;
		["actor"] = 2;
		["connectID"] = 215;
		["posX"] = -4440;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "Better snap off a suitable branch from a Pain Cactus. They grow everywhere. If it breaks, you can always use it for a torch or as firewood.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00332"] = {
		["ID"] = 332;
		["actor"] = 2;
		["connectID"] = 219;
		["posX"] = -4440;
		["posY"] = 1740;
		["script"] = "";
		["text"] = "And the Scalp Hunters got bolder and wander further and further inside the taboo area. We can talk when you take me to my hideout.\
";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00333"] = {
		["ID"] = 333;
		["actor"] = 2;
		["connectID"] = 248;
		["posX"] = -4050;
		["posY"] = 2490;
		["script"] = "";
		["text"] = "I know this area like a back of my palm, huma. Let me think a bit...";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00334"] = {
		["ID"] = 334;
		["actor"] = 2;
		["connectID"] = 251;
		["posX"] = -3090;
		["posY"] = 2490;
		["script"] = "";
		["text"] = "That's my unique perk so to speak - I never forget any place I have seen or conversations I heard.  ";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00335"] = {
		["ID"] = 335;
		["actor"] = 2;
		["connectID"] = 257;
		["posX"] = -1980;
		["posY"] = 2400;
		["script"] = "";
		["text"] = "I've remembered one old tale of our folk. There should be a weapon to attack many targets at once in that cave.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00336"] = {
		["ID"] = 336;
		["actor"] = 2;
		["connectID"] = 263;
		["posX"] = -1980;
		["posY"] = 2580;
		["script"] = "";
		["text"] = "They like to boast about their crazy earnings and cool feats they have performed, but all end up pennyless and drunk, lying in they own puke near the shittiest saloon they could find in the entire desert.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00337"] = {
		["ID"] = 337;
		["actor"] = 2;
		["connectID"] = 296;
		["posX"] = 300;
		["posY"] = 3000;
		["script"] = "";
		["text"] = "But we don't really have much of a choice but to try. Tell me huma, do you know how to spot a stinky mushroom?";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00338"] = {
		["ID"] = 338;
		["actor"] = 2;
		["connectID"] = 301;
		["posX"] = 1500;
		["posY"] = 3000;
		["script"] = "";
		["text"] = "If the victim dies - the body becomes a fertilizer for the new colony of shrooms.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00339"] = {
		["ID"] = 339;
		["actor"] = 2;
		["connectID"] = 311;
		["posX"] = 1020;
		["posY"] = 3240;
		["script"] = "";
		["text"] = "Unless you bring an army of well trained and armed men to shoot down those bastards, this is our best chance. What do you say?";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00348"] = {
		["ID"] = 348;
		["actor"] = 2;
		["connectID"] = 319;
		["posX"] = 2460;
		["posY"] = 3240;
		["script"] = "";
		["text"] = "Don't move too fast and watch for the big ones preparing to go boom. Hold your breath and run like hell if you have triggered one.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00349"] = {
		["ID"] = 349;
		["actor"] = 2;
		["connectID"] = 363;
		["posX"] = -3750;
		["posY"] = 3750;
		["script"] = "";
		["text"] = "And inside of it are floating things that shouldn't be here: homes, corpses of creatures, some incomprehensible things. I wait a few days until the bubble bursts on its own and search the debris, looking for useful things.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00350"] = {
		["ID"] = 350;
		["actor"] = 2;
		["connectID"] = 236;
		["posX"] = -1080;
		["posY"] = 3630;
		["script"] = "";
		["text"] = "Since then, I didn't really hear much about him. They say that he found his end in the mines of Terraform. It no longer matters to me.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00351"] = {
		["ID"] = 351;
		["actor"] = 2;
		["connectID"] = 32;
		["posX"] = -2070;
		["posY"] = 3630;
		["script"] = "";
		["text"] = "I performed the rite and transferred the title to my student. Unworthy to die from the \"poison of eternal sleep\" and rest among the mummies of the former shamans, I went into the desert, searching for another death.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00352"] = {
		["ID"] = 352;
		["actor"] = 2;
		["connectID"] = 191;
		["posX"] = -3810;
		["posY"] = 4620;
		["script"] = "";
		["text"] = "The vents should be on top of the hive, so you better use the stone gallery in that cave. After you've gassed the hives, just find a place to hide and wait for the fun part.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00353"] = {
		["ID"] = 353;
		["actor"] = 2;
		["connectID"] = 355;
		["posX"] = -3570;
		["posY"] = 4500;
		["script"] = "";
		["text"] = "I want you to have this. It's by no means comparable to the great favor you've done us outcasts, but I hope you'll find it useful.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00356"] = {
		["ID"] = 356;
		["actor"] = 1;
		["connectID"] = 359;
		["posX"] = -3180;
		["posY"] = 4500;
		["script"] = "function message:onStart()\
   addItemsToPlayer(\"22_ammo.itm\", 15)\
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
	["message_00357"] = {
		["ID"] = 357;
		["actor"] = 1;
		["connectID"] = 359;
		["posX"] = -3180;
		["posY"] = 4380;
		["script"] = "function message:onStart()\
   addItemsToPlayer(\"flare_ammo.itm\", 7)\
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
	["message_00358"] = {
		["ID"] = 358;
		["actor"] = 1;
		["connectID"] = 359;
		["posX"] = -3180;
		["posY"] = 4620;
		["script"] = "function message:onStart()\
   addItemsToPlayer(\"revolver_ammo.itm\", 15)\
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
	["message_00359"] = {
		["ID"] = 359;
		["actor"] = 2;
		["connectID"] = 191;
		["posX"] = -2910;
		["posY"] = 4500;
		["script"] = "";
		["text"] = "Be blessed.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00360"] = {
		["ID"] = 360;
		["actor"] = 2;
		["connectID"] = 361;
		["posX"] = -3510;
		["posY"] = 3630;
		["script"] = "";
		["text"] = "Then the new chief took power, young and hot-headed. He wanted to change things, to move away from the ways of the ancestors and be like you, humas. He wanted to own and study machines.";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00361"] = {
		["ID"] = 361;
		["actor"] = 2;
		["connectID"] = 30;
		["posX"] = -3270;
		["posY"] = 3630;
		["script"] = "";
		["text"] = "I resisted, and was setting the people up against him. Traditions were more important to me than the lives of my tribesmen at that time...";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00362"] = {
		["ID"] = 362;
		["actor"] = 2;
		["connectID"] = 349;
		["posX"] = -3990;
		["posY"] = 3750;
		["script"] = "";
		["text"] = "In this place - taboo is everywhere! Things appear and disappear in flashes of lightning. And after the lightning a strange bubble appears that lasts a few days.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00363"] = {
		["ID"] = 363;
		["actor"] = 2;
		["connectID"] = 24;
		["posX"] = -3510;
		["posY"] = 3750;
		["script"] = "";
		["text"] = "Sometimes a merchant comes to the border of taboo - we trade, and we survive.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["switch_00162"] = {
		["ID"] = 162;
		["connectionsID"] = {
			[1] = 78;
			[2] = 0;
			[3] = 77;
		};
		["posX"] = -6060;
		["posY"] = 90;
		["type"] = "switch";
	};
	["switch_00163"] = {
		["ID"] = 163;
		["connectionsID"] = {
			[1] = 91;
			[2] = 92;
			[3] = 93;
		};
		["posX"] = -4950;
		["posY"] = 510;
		["type"] = "switch";
	};
	["switch_00165"] = {
		["ID"] = 165;
		["connectionsID"] = {
			[1] = 76;
			[2] = 17;
			[3] = 158;
		};
		["posX"] = -6480;
		["posY"] = 1020;
		["type"] = "switch";
	};
	["switch_00166"] = {
		["ID"] = 166;
		["connectionsID"] = {
			[1] = 159;
			[2] = 161;
			[3] = 173;
		};
		["posX"] = -5520;
		["posY"] = 1830;
		["type"] = "switch";
	};
	["switch_00167"] = {
		["ID"] = 167;
		["connectionsID"] = {
			[1] = 106;
			[2] = 153;
			[3] = 155;
			[4] = 199;
		};
		["posX"] = -5100;
		["posY"] = 1230;
		["type"] = "switch";
	};
	["switch_00168"] = {
		["ID"] = 168;
		["connectionsID"] = {
			[1] = 105;
			[2] = 151;
			[3] = 109;
		};
		["posX"] = -4320;
		["posY"] = 960;
		["type"] = "switch";
	};
	["switch_00169"] = {
		["ID"] = 169;
		["connectionsID"] = {
			[1] = 118;
			[2] = 216;
			[3] = 221;
			[4] = 42;
			[5] = 62;
			[6] = 72;
			[7] = 183;
			[8] = 245;
			[9] = 201;
		};
		["posX"] = -5070;
		["posY"] = 1860;
		["type"] = "switch";
	};
	["switch_00184"] = {
		["ID"] = 184;
		["connectionsID"] = {
			[1] = 3;
			[2] = 2;
			[3] = 7;
			[4] = 127;
			[5] = 1;
			[6] = 21;
			[7] = 22;
			[8] = 228;
		};
		["posX"] = -4680;
		["posY"] = 3450;
		["type"] = "switch";
	};
	["switch_00189"] = {
		["ID"] = 189;
		["connectionsID"] = {
			[1] = 11;
			[2] = 222;
		};
		["posX"] = -3690;
		["posY"] = 1860;
		["type"] = "switch";
	};
	["switch_00192"] = {
		["ID"] = 192;
		["connectionsID"] = {
			[1] = 55;
			[2] = 56;
		};
		["posX"] = -4440;
		["posY"] = 4170;
		["type"] = "switch";
	};
	["switch_00193"] = {
		["ID"] = 193;
		["connectionsID"] = {
			[1] = 64;
			[2] = 65;
			[3] = 67;
			[4] = 66;
		};
		["posX"] = -4440;
		["posY"] = 5130;
		["type"] = "switch";
	};
	["switch_00194"] = {
		["ID"] = 194;
		["connectionsID"] = {
			[1] = 75;
			[2] = 314;
			[3] = 71;
		};
		["posX"] = -4440;
		["posY"] = 4620;
		["type"] = "switch";
	};
	["switch_00196"] = {
		["ID"] = 196;
		["connectionsID"] = {
			[1] = 197;
			[2] = 239;
		};
		["posX"] = -3330;
		["posY"] = 510;
		["type"] = "switch";
	};
	["switch_00200"] = {
		["ID"] = 200;
		["connectionsID"] = {
			[1] = 195;
			[2] = 130;
		};
		["posX"] = -3750;
		["posY"] = 3390;
		["type"] = "switch";
	};
	["switch_00202"] = {
		["ID"] = 202;
		["connectionsID"] = {
			[1] = 237;
			[2] = 45;
		};
		["posX"] = -4440;
		["posY"] = 2100;
		["type"] = "switch";
	};
	["switch_00209"] = {
		["ID"] = 209;
		["connectionsID"] = {
			[1] = 210;
			[2] = 212;
			[3] = 206;
		};
		["posX"] = -6870;
		["posY"] = 630;
		["type"] = "switch";
	};
	["switch_00211"] = {
		["ID"] = 211;
		["connectionsID"] = {
			[1] = 208;
			[2] = 164;
		};
		["posX"] = -7260;
		["posY"] = 990;
		["type"] = "switch";
	};
	["switch_00243"] = {
		["ID"] = 243;
		["connectionsID"] = {
			[1] = 134;
			[2] = 244;
		};
		["posX"] = -3270;
		["posY"] = 2970;
		["type"] = "switch";
	};
	["switch_00254"] = {
		["ID"] = 254;
		["connectionsID"] = {
			[1] = 252;
			[2] = 253;
		};
		["posX"] = -2610;
		["posY"] = 2490;
		["type"] = "switch";
	};
	["switch_00270"] = {
		["ID"] = 270;
		["connectionsID"] = {
			[1] = 271;
			[2] = 266;
			[3] = 276;
		};
		["posX"] = 150;
		["posY"] = 2520;
		["type"] = "switch";
	};
	["switch_00294"] = {
		["ID"] = 294;
		["connectionsID"] = {
			[1] = 325;
			[2] = 326;
		};
		["posX"] = 3720;
		["posY"] = 2520;
		["type"] = "switch";
	};
	["switch_00323"] = {
		["ID"] = 323;
		["connectionsID"] = {
			[1] = 283;
			[2] = 246;
		};
		["posX"] = -4680;
		["posY"] = 2430;
		["type"] = "switch";
	};
	["switch_00324"] = {
		["ID"] = 324;
		["connectionsID"] = {
			[1] = 256;
			[2] = 255;
			[3] = 265;
		};
		["posX"] = -990;
		["posY"] = 2520;
		["type"] = "switch";
	};
	["switch_00355"] = {
		["ID"] = 355;
		["connectionsID"] = {
			[1] = 357;
			[2] = 356;
			[3] = 358;
		};
		["posX"] = -3330;
		["posY"] = 4500;
		["type"] = "switch";
	};
}
return obj1
