-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 300;
		["posY"] = 300;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 2;
		["animation"] = "dl_righthand_wave_med";
		["connectID"] = 35;
		["posX"] = 780;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Ah, it's you again, my friend! Welcome to \"Kwagga's 10 for anything\" once again. How can I help you?";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 2;
		["animation"] = "dl_count_to_one";
		["connectID"] = 35;
		["posX"] = 1320;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Oh, how hard can it be, huma? It's ten times ten! All my prices are like that, it's very convenient! Here, check out this good, almost completely new pickaxe - only three times ten and it's yours!";
		["time"] = 19.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 2;
		["animation"] = "dl_righthand_wave_med";
		["connectID"] = 6;
		["posX"] = 780;
		["posY"] = 240;
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
		["text"] = "Welcome to \"Kwagga's ten for anything\", stranger. Supplies, tools, useful things - everything a traveler might need in one place!";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["animation"] = "dl_point_left";
		["connectID"] = 3;
		["posX"] = 1050;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Ten for anything? Then how come this thing over here costs a hundred antigravium shards?";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["connectID"] = 12;
		["posX"] = 1890;
		["posY"] = -60;
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
		["text"] = "What's this on your pickaxe? Rust?";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 1;
		["connectID"] = 13;
		["posX"] = 2430;
		["posY"] = -60;
		["script"] = "";
		["text"] = "Why the hell do your goods have blood on them? Where do you get your stock?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["animation"] = "dl_point_right";
		["connectID"] = 93;
		["posX"] = 3240;
		["posY"] = -30;
		["script"] = "";
		["text"] = "I prefer the term \"recycling\"! Anyway, where else are you going to find goods for such a good price?";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 1;
		["connectID"] = 10;
		["posX"] = 2970;
		["posY"] = -60;
		["script"] = "";
		["text"] = "So you're a marauder?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["animation"] = "dl_cough";
		["connectID"] = 9;
		["posX"] = 2160;
		["posY"] = -60;
		["script"] = "";
		["text"] = "Uh... No, of course not. You have some good eyes, huma. It's just dried blood! Ok, for an attentive customer a special price - two times ten!";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["connectID"] = 11;
		["posX"] = 2700;
		["posY"] = -60;
		["script"] = "";
		["text"] = "Well, it's all legal! Sort of. I get my stock from dead bodies, mostly. The cycle of life. What, you think I should leave perfectly functioning items just laying there? What a waste!";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 2;
		["animation"] = "dl_shrug_long";
		["connectID"] = 19;
		["posX"] = 2700;
		["posY"] = 90;
		["script"] = "";
		["text"] = "*sigh* Lately - not so great, mostly because of this whole Stone Heads business. We don't have many visitors and I'm not that eager to go out there either, it's dangerous.";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 2;
		["connectID"] = 18;
		["posX"] = 2160;
		["posY"] = 90;
		["script"] = "";
		["text"] = "Why wouldn't they? I pay my \"taxes\". And they're all my regular customers when they need a lighter, a screwdriver, booze and whatnot.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 1;
		["connectID"] = 16;
		["posX"] = 1890;
		["posY"] = 90;
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
		["text"] = "They simply allow you to trade here?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 1;
		["connectID"] = 14;
		["posX"] = 2430;
		["posY"] = 90;
		["script"] = "";
		["text"] = "And how's the trade?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["connectID"] = 93;
		["posX"] = 2970;
		["posY"] = 90;
		["script"] = "";
		["text"] = "And my stock isn't going to refill itself, you know.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 2160;
		["posY"] = 570;
		["script"] = "";
		["text"] = "Well, I sort of was a member of free prospectors guild, so I do know something about how to work a mine. Nothing fancy, just the basics. But I can give you a couple of tips. For a price, of course.";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 2700;
		["posY"] = 570;
		["script"] = "";
		["text"] = "That's right! For just a bunch of tens ol' Kwagga would teach you how to mine greens, huma.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 1;
		["connectID"] = 21;
		["posX"] = 2430;
		["posY"] = 570;
		["script"] = "";
		["text"] = "So it's ten for mining too, I guess?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 1;
		["connectID"] = 34;
		["posX"] = 1890;
		["posY"] = 900;
		["script"] = "";
		["text"] = "I'll see you later.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["connectID"] = 20;
		["posX"] = 1890;
		["posY"] = 570;
		["script"] = "function message:onStart()\
   self:setParam(\"teach\", true)\
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
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["connectID"] = 36;
		["posX"] = 1890;
		["posY"] = 720;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"teach\")\
end\
\
";
		["text"] = "Teach me mining!";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["animation"] = "dl_hand_at_mouth_yelling";
		["posX"] = 2160;
		["posY"] = 900;
		["script"] = "";
		["text"] = "Godspeed, huma! Come back and don't forget to tell your friends that \"Kwagga's 10 for anything\" is the best... and the only shop in Windscream Canyon!";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 2;
		["connectID"] = 66;
		["posX"] = 3210;
		["posY"] = 750;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 2;
		["connectID"] = 93;
		["posX"] = 3210;
		["posY"] = 630;
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
		["text"] = "Hm, seems like you already know all I could teach you! You should find a real mining master to learn more.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 1;
		["connectID"] = 93;
		["posX"] = 3750;
		["posY"] = 870;
		["script"] = "";
		["text"] = "\\[BACK]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00064"] = {
		["ID"] = 64;
		["actor"] = 2;
		["connectID"] = 87;
		["posX"] = 4320;
		["posY"] = 570;
		["script"] = "local random = require \"random\"\
function message:onStart()\
   giveItemFromPlayerTo(\"antigravium_shards.itm\", getObj(\"kwagga\"), 20 * self:getParam(\"skillup\"))\
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
   return hasPlayerItem(\"antigravium_shards.itm\", 20 * self:getParam(\"skillup\"))\
end\
\
";
		["text"] = "Very well.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00067"] = {
		["ID"] = 67;
		["actor"] = 1;
		["connectID"] = 77;
		["posX"] = 3750;
		["posY"] = 630;
		["script"] = "function message:onStart()\
   self:setParam(\"skillup\", 1)\
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
		["text"] = "(mining + 1 for 20 antigravium shards)";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00072"] = {
		["ID"] = 72;
		["actor"] = 1;
		["connectID"] = 77;
		["posX"] = 3750;
		["posY"] = 750;
		["script"] = "function message:onStart()\
   self:setParam(\"skillup\", 5)\
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
		["text"] = "(mining + 5 for 100 antigravium shards)";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00078"] = {
		["ID"] = 78;
		["actor"] = 2;
		["connectID"] = 66;
		["posX"] = 4320;
		["posY"] = 780;
		["script"] = "";
		["text"] = "Well... come again when you have them.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00079"] = {
		["ID"] = 79;
		["actor"] = 1;
		["posX"] = 1890;
		["posY"] = 240;
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
\
";
		["text"] = "\\[TRADE]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00080"] = {
		["ID"] = 80;
		["actor"] = 2;
		["connectID"] = 85;
		["posX"] = 4860;
		["posY"] = 1200;
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
	["message_00081"] = {
		["ID"] = 81;
		["actor"] = 2;
		["connectID"] = 85;
		["posX"] = 4860;
		["posY"] = 960;
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
		["time"] = 4;
		["type"] = "message";
	};
	["message_00082"] = {
		["ID"] = 82;
		["actor"] = 2;
		["connectID"] = 85;
		["posX"] = 4860;
		["posY"] = 480;
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
	["message_00083"] = {
		["ID"] = 83;
		["actor"] = 2;
		["connectID"] = 85;
		["posX"] = 4860;
		["posY"] = 1080;
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
	["message_00084"] = {
		["ID"] = 84;
		["actor"] = 2;
		["connectID"] = 92;
		["posX"] = 4860;
		["posY"] = 600;
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
		["text"] = "Hm, seems like you already know all I could teach you! You should find a real mining master to learn more.\
";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00085"] = {
		["ID"] = 85;
		["actor"] = 2;
		["connectID"] = 66;
		["posX"] = 5760;
		["posY"] = 600;
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
	["message_00086"] = {
		["ID"] = 86;
		["actor"] = 2;
		["connectID"] = 85;
		["posX"] = 5100;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Now look: mining antigravium depends on endurance as well as precision. Take a good look at the node - you should notice a difference in coloring. You should hit the brighter spots - those are cracks and impurities. This way you're going to extract more using less force.";
		["time"] = 25;
		["type"] = "message";
	};
	["message_00088"] = {
		["ID"] = 88;
		["actor"] = 2;
		["connectID"] = 85;
		["posX"] = 4860;
		["posY"] = 840;
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
	["message_00089"] = {
		["ID"] = 89;
		["actor"] = 2;
		["connectID"] = 85;
		["posX"] = 4860;
		["posY"] = 720;
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
	["message_00090"] = {
		["ID"] = 90;
		["actor"] = 2;
		["connectID"] = 85;
		["posX"] = 4860;
		["posY"] = 240;
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
		["text"] = "Before taking a lazer drill you should first get comfortable with a pickaxe. You're gonna be surprized how much a skillful miner can accomplish with one! Hold it firmly and strike one point until a good shard breaks away. Shatter it and out it through a sieve - you'll get a bunch of pure crystals. Doesn't sound so hard, does it?";
		["time"] = 31.5;
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 2;
		["connectID"] = 86;
		["posX"] = 4860;
		["posY"] = 360;
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
	["message_00092"] = {
		["ID"] = 92;
		["actor"] = 2;
		["connectID"] = 93;
		["posX"] = 5100;
		["posY"] = 600;
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
	["message_00093"] = {
		["ID"] = 93;
		["actor"] = 2;
		["connectID"] = 35;
		["posX"] = 4020;
		["posY"] = 120;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00094"] = {
		["ID"] = 94;
		["actor"] = 1;
		["connectID"] = 95;
		["posX"] = 1890;
		["posY"] = 390;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"scarecrow\", \"kwagga_about_special_booze\")\
end\
\
";
		["text"] = "I heard about your special booze. Can I have some?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00095"] = {
		["ID"] = 95;
		["actor"] = 2;
		["connectID"] = 97;
		["posX"] = 2130;
		["posY"] = 390;
		["script"] = "";
		["text"] = "I don't have any right now. Don't really want to get my hands dirty today.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00096"] = {
		["ID"] = 96;
		["actor"] = 2;
		["connectID"] = 99;
		["posX"] = 2850;
		["posY"] = 390;
		["script"] = "";
		["text"] = "[t_recipes:learn_recipe_kwagga_special_1]My special is just regular booze, absinthe and a special ingredient - a bit of Arphant's poop. Just don't tell anyone.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00097"] = {
		["ID"] = 97;
		["actor"] = 1;
		["connectID"] = 98;
		["posX"] = 2370;
		["posY"] = 390;
		["script"] = "";
		["text"] = "What do you mean? I'll pay.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00098"] = {
		["ID"] = 98;
		["actor"] = 2;
		["connectID"] = 96;
		["posX"] = 2610;
		["posY"] = 390;
		["script"] = "";
		["text"] = "I mean what I mean. Frankly, you can mix it yourself.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00099"] = {
		["ID"] = 99;
		["actor"] = 1;
		["connectID"] = 93;
		["posX"] = 3090;
		["posY"] = 390;
		["script"] = "";
		["text"] = "[t_scarecrow:kwagga_about_special_booze]Yeah, I get it now. Thanks...";
		["time"] = 4;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 4;
			[2] = 2;
		};
		["posX"] = 600;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00035"] = {
		["ID"] = 35;
		["connectionsID"] = {
			[1] = 8;
			[2] = 17;
			[3] = 79;
			[4] = 94;
			[5] = 28;
			[6] = 29;
			[7] = 27;
		};
		["h"] = 180;
		["posX"] = 1680;
		["posY"] = 330;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00036"] = {
		["ID"] = 36;
		["connectionsID"] = {
			[1] = 60;
			[2] = 39;
		};
		["posX"] = 3060;
		["posY"] = 720;
		["type"] = "switch";
	};
	["switch_00066"] = {
		["ID"] = 66;
		["connectionsID"] = {
			[1] = 67;
			[2] = 72;
			[3] = 61;
		};
		["posX"] = 3540;
		["posY"] = 750;
		["type"] = "switch";
	};
	["switch_00077"] = {
		["ID"] = 77;
		["connectionsID"] = {
			[1] = 64;
			[2] = 78;
		};
		["posX"] = 4110;
		["posY"] = 690;
		["type"] = "switch";
	};
	["switch_00087"] = {
		["ID"] = 87;
		["connectionsID"] = {
			[1] = 90;
			[2] = 91;
			[3] = 82;
			[4] = 84;
			[5] = 89;
			[6] = 88;
			[7] = 81;
			[8] = 83;
			[9] = 80;
		};
		["h"] = 220;
		["posX"] = 4650;
		["posY"] = 570;
		["type"] = "switch";
		["w"] = 100;
	};
}
local obj2 = {
	["actor_prefab"] = {
		[1] = "human_male";
		[2] = "abori";
	};
}
return obj1 ,obj2
