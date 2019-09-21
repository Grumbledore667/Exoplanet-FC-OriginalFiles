-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 37;
		["posX"] = 330;
		["posY"] = 420;
		["script"] = "";
		["text"] = "Hey yourself, huma. Yes, we try to avoid the bounty hunters, as well as other bastards who'll shoot an abori for a handful of shinies. I hope you're not one of them, are you huma?";
		["time"] = 18.5;
		["type"] = "message";
	};
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 1;
		["connectID"] = 0;
		["posX"] = 60;
		["posY"] = 420;
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
		["text"] = "Hey pal. Funny camp you have here, ain't easy to find it. Are you hiding from someone?";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 4;
		["posX"] = 780;
		["posY"] = 510;
		["script"] = "";
		["text"] = "Nah, that's not my style. Let's talk.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 4;
		["posX"] = 780;
		["posY"] = 330;
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
		["text"] = "Nothing personal, just business. I need money and you guys should have been better at hiding.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 2;
		["connectID"] = 38;
		["posX"] = 1050;
		["posY"] = 420;
		["script"] = "";
		["text"] = "I see. Looks like it won't be easy to make you go away, so I guess talking won't hurt. What do you want to know?";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["connectID"] = 8;
		["posX"] = 1530;
		["posY"] = 210;
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
		["text"] = "Who are you?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["connectID"] = 15;
		["posX"] = 1530;
		["posY"] = 450;
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
		["text"] = "What are you doing?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 1;
		["connectID"] = 23;
		["posX"] = 1530;
		["posY"] = 990;
		["script"] = "function message:onStart()\
   self:setParam(\"mining\", true)\
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
		["text"] = "Can you teach me something?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 2;
		["connectID"] = 42;
		["posX"] = 1800;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Well, they call me Old Mug. For 20 years I was a chief miner in the \"Emerald Crevice\". I was respected, even had some shares, until the owner changed.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 1;
		["connectID"] = 10;
		["posX"] = 2340;
		["posY"] = 210;
		["script"] = "";
		["text"] = "The new owner didn't treat you well?";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["connectID"] = 43;
		["posX"] = 2610;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Yeah, especially compared to old Barnes. He respected us. But they murdered him, those bastards from Jackpot-town, when they understood that he isn't gonna sell his mine to them. Killed him in cold blood, just like that.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 1;
		["connectID"] = 12;
		["posX"] = 3150;
		["posY"] = 210;
		["script"] = "";
		["text"] = "But you escaped as I see it.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["connectID"] = 13;
		["posX"] = 3420;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Yeah, but a lot have died. And how much more of those are gonna last at least a month...";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 1;
		["connectID"] = 14;
		["posX"] = 3690;
		["posY"] = 210;
		["script"] = "";
		["text"] = "So how did you manage to escape?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 2;
		["animation"] = "dl_stop_onehand";
		["connectID"] = 38;
		["posX"] = 3960;
		["posY"] = 210;
		["script"] = "";
		["text"] = "No hard feelings huma, but I don't yet trust you enough to talk about this.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["connectID"] = 16;
		["posX"] = 1800;
		["posY"] = 450;
		["script"] = "";
		["text"] = "Doing? You mean in our spare time between dying of hunger and a mining fever?";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["connectID"] = 17;
		["posX"] = 2070;
		["posY"] = 450;
		["script"] = "";
		["text"] = "Is there nothing you can do?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["connectID"] = 44;
		["posX"] = 2340;
		["posY"] = 450;
		["script"] = "";
		["text"] = "We don't have anywhere to go, and most of my men aren't going to survive a long journey in their current state. And even though we managed to turn off the beacons in our collars, we can't get them off. With those collars we are going to be immediately identified as runaway slaves and shot on sight. No questions asked.";
		["time"] = 31;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 3360;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Maybe I could help you. For a mutual benefit, of course.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["connectID"] = 45;
		["posX"] = 3630;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Seems like the Gods-in-the-Earth themselves sent you here, if you mean what you say.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 1;
		["connectID"] = 22;
		["posX"] = 4350;
		["posY"] = 270;
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
		["text"] = "What kind of urgent problem?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 1;
		["connectID"] = 66;
		["posX"] = 4350;
		["posY"] = 420;
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
		["text"] = "What about the problem that can wait?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 2;
		["connectID"] = 69;
		["posX"] = 4620;
		["posY"] = 270;
		["script"] = "";
		["text"] = "We need supplies: Food, medicine, weapons. Not for free, of course, talk to... uhm... well, try to communicate with Mute, the one near the crates. He oversees our supplies. We've managed to take something along from the mine, so we can afford to pay you.";
		["time"] = 23.5;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 2;
		["connectID"] = 29;
		["posX"] = 1800;
		["posY"] = 990;
		["script"] = "";
		["text"] = "Well, I was mostly overseering demolitions. But in your case I suppose I could teach you the basics of mining. Not for free of course. Money I don't want, but medkits and certain supplies I do need.";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 46;
		["posX"] = 5010;
		["posY"] = 390;
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
		["text"] = "The mining fever. This scourge is killing us, slowly but surely. It has 2 main reasons. The first one is antigravium dust in the lungs. With time and proper medicine our organisms is going to get rid of it on its own. We're a hardy bunch.";
		["time"] = 24;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 1;
		["connectID"] = 26;
		["posX"] = 5550;
		["posY"] = 390;
		["script"] = "";
		["text"] = "I see. And where one might find that medicine?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 2;
		["connectID"] = 27;
		["posX"] = 5850;
		["posY"] = 390;
		["script"] = "";
		["text"] = "If only I knew! Try to ask around in the fort. Talk to traders from the caravans, maybe they know something.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 1;
		["connectID"] = 28;
		["posX"] = 6120;
		["posY"] = 390;
		["script"] = "";
		["text"] = "I'll let you know if I manage to find this medicine of yours. What are you willing to buy it for?";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["posX"] = 6390;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Oh don't you worry pal, Old Mug has a special something from the mine just for that occasion. You won't be disappointed.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["connectID"] = 65;
		["posX"] = 2040;
		["posY"] = 990;
		["script"] = "";
		["text"] = "Teach me how to better mine antigravium!";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 1;
		["connectID"] = 71;
		["posX"] = 3030;
		["posY"] = 1050;
		["script"] = "function message:onStart()\
   self:setParam(\"skillup\", 5)\
   self:setParam(\"takeitem\", \"medkit.itm\")\
   self:setParam(\"takecount\", 3)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getMC().skillsManager:get(\"mining\") <= 55\
end\
\
";
		["text"] = "(mining + 5 for 3 medkits)";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 1;
		["connectID"] = 71;
		["posX"] = 3030;
		["posY"] = 1170;
		["script"] = "function message:onStart()\
   self:setParam(\"skillup\", 5)\
   self:setParam(\"takeitem\", \"meat.itm\")\
   self:setParam(\"takecount\", 10)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getMC().skillsManager:get(\"mining\") <= 55\
end\
\
";
		["text"] = "(mining + 5 for 10 pieces of raw meat)";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 1;
		["connectID"] = 71;
		["posX"] = 3030;
		["posY"] = 930;
		["script"] = "function message:onStart()\
   self:setParam(\"skillup\", 1)\
   self:setParam(\"takeitem\", \"booze.itm\")\
   self:setParam(\"takecount\", 1)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getMC().skillsManager:get(\"mining\") < 60\
end\
\
";
		["text"] = "(mining + 1 for booze)";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 2;
		["animation"] = "dl_talk_1";
		["connectID"] = 58;
		["posX"] = 3960;
		["posY"] = 630;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"say20\")\
end\
\
";
		["text"] = "Before taking a laser drill you should first get comfortable with a pickaxe. You're gonna be surprized how much a skillful miner can accomplish with one! Hold it firmly and strike one point until a good shard breaks away. Shatter it and out it through a sieve - you'll get a bunch of pure crystals. Doesn't sound so hard, does it?";
		["time"] = 32;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["animation"] = "dl_raisedfinger_right";
		["connectID"] = 47;
		["posX"] = 3960;
		["posY"] = 750;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"say40\")\
end\
\
";
		["text"] = "Looks like you've got your first callouses - good job!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 2;
		["connectID"] = 58;
		["posX"] = 3960;
		["posY"] = 870;
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
		["text"] = "[off]Real miners feel the rock through their tool. Through the vibration they sense the quality and whether there are large shards underneath. If you sense it - take great care, it means that under the place you just hit there is a large crystal. Break the pieces around it until you find that small treasure!";
		["time"] = 28.5;
		["type"] = "message";
	};
	["message_00036"] = {
		["ID"] = 36;
		["actor"] = 2;
		["animation"] = "dl_shrug_long";
		["connectID"] = 62;
		["posX"] = 3960;
		["posY"] = 990;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"say60\")\
end\
\
";
		["text"] = "There is nothing I could teach you. You should find a real master of a pickaxe, or a laser drill operator.\
";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 2;
		["animation"] = "dl_look_down_long";
		["connectID"] = 9;
		["posX"] = 2070;
		["posY"] = 210;
		["script"] = "";
		["text"] = "And after that I was toiling for food for 5 years. What a career. From a co-owner to a slave taskmaster. And now to a fugitive, I suppose.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 2;
		["animation"] = "dl_talk_2";
		["connectID"] = 11;
		["posX"] = 2880;
		["posY"] = 210;
		["script"] = "";
		["text"] = "They spared us, at least. Who needs a mine without workers, right? They forced us to continue working there for food. Dirty abori don't need no clothes, they are gonna simply work for a dirty bowl of skilly and a breath of fresh air a day. *sigh* What an unfortunate streak of luck...";
		["time"] = 27.5;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 2;
		["connectID"] = 72;
		["posX"] = 2610;
		["posY"] = 450;
		["script"] = "";
		["text"] = "We could find a shelter in some secluded oasis, but in our condition going to the White Erg is a pure suicide.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 2;
		["connectID"] = 39;
		["posX"] = 3900;
		["posY"] = 360;
		["script"] = "";
		["text"] = "We have two problems, huma: an urgent one, and the one that can wait.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00046"] = {
		["ID"] = 46;
		["actor"] = 2;
		["connectID"] = 25;
		["posX"] = 5280;
		["posY"] = 390;
		["script"] = "";
		["text"] = "But the second one is a fungus that lives in the mines. It poisons the blood and there is no escape from it. I hear that humas have managed to pure a concoction that kills this fungus. We must get this medicine, or we're all going to die in a couple of months.";
		["time"] = 27.5;
		["type"] = "message";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 2;
		["connectID"] = 58;
		["posX"] = 4200;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Now look: mining antigravium depends on endurance as well as precision. Take a good look at the node - you should notice a difference in coloring. You should hit the brighter spots - those are cracks and impurities. This way you're going to extract more using less force.";
		["time"] = 25;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 2;
		["connectID"] = 50;
		["posX"] = -450;
		["posY"] = 510;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 2;
		["connectID"] = 53;
		["posX"] = 60;
		["posY"] = 630;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 1;
		["posX"] = 1530;
		["posY"] = 1320;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 2;
		["connectID"] = 38;
		["posX"] = 330;
		["posY"] = 630;
		["script"] = "";
		["text"] = "Oh, it's you again.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 1;
		["connectID"] = 65;
		["posX"] = 1530;
		["posY"] = 1140;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"mining\")\
end\
\
";
		["text"] = "Teach me how to mine better.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 1;
		["connectID"] = 38;
		["posX"] = 3030;
		["posY"] = 1410;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 1;
		["connectID"] = 71;
		["posX"] = 3030;
		["posY"] = 1290;
		["script"] = "function message:onStart()\
   self:setParam(\"skillup\", 5)\
   self:setParam(\"takeitem\", \"fried_meat.itm\")\
   self:setParam(\"takecount\", 10)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getMC().skillsManager:get(\"mining\") <= 55\
end\
\
";
		["text"] = "(mining + 5 for 10 pieces of fried meat)";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 2;
		["connectID"] = 83;
		["posX"] = 3480;
		["posY"] = 1020;
		["script"] = "local random = require \"random\"\
function message:onStart()\
   giveItemFromPlayerTo(self:getParam(\"takeitem\"), getObj(\"old_mug\"), self:getParam(\"takecount\"))\
   \
   local cur = getMC().skillsManager:get(\"mining\")\
   local up = self:getParam(\"skillup\")\
\
   getMC().skillsManager:inc(\"mining\", up)\
\
   if cur < 20 and cur + up >= 20 then\
      self:setParam(\"say20\", true)\
   elseif cur < 40 and cur + up >= 40 then\
      self:setParam(\"say40\", true)\
   elseif cur < 60 and cur + up >= 60 then\
      self:setParam(\"say60\", true)\
   end\
   self:setParam(\"sayRandom\", random.random(5))\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return hasPlayerItem(self:getParam(\"takeitem\"), self:getParam(\"takecount\"))\
end\
\
";
		["text"] = "Very well.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00058"] = {
		["ID"] = 58;
		["actor"] = 2;
		["connectID"] = 40;
		["posX"] = 4860;
		["posY"] = 990;
		["script"] = "function message:onStart()\
   self:setParam(\"say20\", nil)\
   self:setParam(\"say40\", nil)\
   self:setParam(\"say60\", nil)\
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
		["text"] = "";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 2;
		["connectID"] = 38;
		["posX"] = 4200;
		["posY"] = 990;
		["script"] = "function message:onStart()\
   self:setParam(\"say20\", nil)\
   self:setParam(\"say40\", nil)\
   self:setParam(\"say60\", nil)\
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
		["text"] = "";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 2;
		["connectID"] = 38;
		["posX"] = 2490;
		["posY"] = 1050;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getMC().skillsManager:get(\"mining\") >= 60\
end\
\
";
		["text"] = "There is nothing I could teach you. You should find a real master of a pickaxe, or a laser drill operator.\
";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 2;
		["connectID"] = 40;
		["posX"] = 2490;
		["posY"] = 1170;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
		["actor"] = 2;
		["connectID"] = 69;
		["posX"] = 5010;
		["posY"] = 540;
		["script"] = "";
		["text"] = "We'll talk about it some other time, perhaps.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00068"] = {
		["ID"] = 68;
		["actor"] = 1;
		["connectID"] = 38;
		["posX"] = 5250;
		["posY"] = 30;
		["script"] = "";
		["text"] = "Let's talk about something else.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00070"] = {
		["ID"] = 70;
		["actor"] = 2;
		["animation"] = "dl_head_shake";
		["connectID"] = 40;
		["posX"] = 3480;
		["posY"] = 1200;
		["script"] = "";
		["text"] = "Starvation isn't a time for charity.";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00073"] = {
		["ID"] = 73;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = 3090;
		["posY"] = 360;
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
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00074"] = {
		["ID"] = 74;
		["actor"] = 2;
		["connectID"] = 38;
		["posX"] = 3090;
		["posY"] = 510;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00078"] = {
		["ID"] = 78;
		["actor"] = 2;
		["connectID"] = 58;
		["posX"] = 3960;
		["posY"] = 1110;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"sayRandom\") == 1\
end\
\
";
		["text"] = "Keep practising and you'll catch up to me very soon!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00079"] = {
		["ID"] = 79;
		["actor"] = 2;
		["connectID"] = 58;
		["posX"] = 3960;
		["posY"] = 1230;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"sayRandom\") == 2\
end\
\
";
		["text"] = "You're getting better at this!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00080"] = {
		["ID"] = 80;
		["actor"] = 2;
		["connectID"] = 58;
		["posX"] = 3960;
		["posY"] = 1350;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"sayRandom\") == 3\
end\
\
";
		["text"] = "Keep it up! Practice makes perfect!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00081"] = {
		["ID"] = 81;
		["actor"] = 2;
		["connectID"] = 58;
		["posX"] = 3960;
		["posY"] = 1470;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"sayRandom\") == 4\
end\
\
";
		["text"] = "A wise one learns from the mistakes of others.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00082"] = {
		["ID"] = 82;
		["actor"] = 2;
		["connectID"] = 58;
		["posX"] = 3960;
		["posY"] = 1590;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"sayRandom\") == 5\
end\
\
";
		["text"] = "Looks like you have the potential!";
		["time"] = 4;
		["type"] = "message";
	};
	["switch_00037"] = {
		["ID"] = 37;
		["connectionsID"] = {
			[1] = 3;
			[2] = 2;
		};
		["posX"] = 600;
		["posY"] = 420;
		["type"] = "switch";
	};
	["switch_00038"] = {
		["ID"] = 38;
		["connectionsID"] = {
			[1] = 5;
			[2] = 6;
			[3] = 7;
			[4] = 54;
			[5] = 52;
		};
		["h"] = 140;
		["posX"] = 1320;
		["posY"] = 420;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00039"] = {
		["ID"] = 39;
		["connectionsID"] = {
			[1] = 20;
			[2] = 21;
		};
		["posX"] = 4170;
		["posY"] = 360;
		["type"] = "switch";
	};
	["switch_00040"] = {
		["ID"] = 40;
		["connectionsID"] = {
			[1] = 32;
			[2] = 30;
			[3] = 31;
			[4] = 56;
			[5] = 55;
		};
		["h"] = 140;
		["posX"] = 2820;
		["posY"] = 1050;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00050"] = {
		["ID"] = 50;
		["connectionsID"] = {
			[1] = 1;
			[2] = 51;
		};
		["posX"] = -180;
		["posY"] = 510;
		["type"] = "switch";
	};
	["switch_00065"] = {
		["ID"] = 65;
		["connectionsID"] = {
			[1] = 63;
			[2] = 64;
		};
		["posX"] = 2340;
		["posY"] = 1110;
		["type"] = "switch";
	};
	["switch_00066"] = {
		["ID"] = 66;
		["connectionsID"] = {
			[1] = 24;
			[2] = 67;
		};
		["posX"] = 4650;
		["posY"] = 450;
		["type"] = "switch";
	};
	["switch_00069"] = {
		["ID"] = 69;
		["connectionsID"] = {
			[1] = 20;
			[2] = 21;
			[3] = 68;
		};
		["posX"] = 4980;
		["posY"] = 30;
		["type"] = "switch";
	};
	["switch_00071"] = {
		["ID"] = 71;
		["connectionsID"] = {
			[1] = 57;
			[2] = 70;
		};
		["posX"] = 3330;
		["posY"] = 1110;
		["type"] = "switch";
	};
	["switch_00072"] = {
		["ID"] = 72;
		["connectionsID"] = {
			[1] = 73;
			[2] = 74;
		};
		["posX"] = 2910;
		["posY"] = 450;
		["type"] = "switch";
	};
	["switch_00083"] = {
		["ID"] = 83;
		["connectionsID"] = {
			[1] = 33;
			[2] = 34;
			[3] = 35;
			[4] = 36;
			[5] = 78;
			[6] = 79;
			[7] = 80;
			[8] = 81;
			[9] = 82;
		};
		["h"] = 220;
		["posX"] = 3750;
		["posY"] = 960;
		["type"] = "switch";
		["w"] = 100;
	};
}
local obj2 = {
	["actor_prefab"] = {
		[2] = "abori";
	};
}
return obj1 ,obj2
