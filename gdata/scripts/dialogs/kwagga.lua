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
		["posY"] = 30;
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
		["posY"] = 30;
		["script"] = "";
		["text"] = "Why the hell do your goods have blood on them? Where do you get your stock?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["connectID"] = 93;
		["posX"] = 3240;
		["posY"] = 30;
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
		["posY"] = 30;
		["script"] = "";
		["text"] = "So you're a marauder?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["connectID"] = 9;
		["posX"] = 2160;
		["posY"] = 30;
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
		["posY"] = 30;
		["script"] = "";
		["text"] = "Well, it's all legal! Sort of. I get my stock from dead bodies, mostly. The cycle of life. What, you think I should leave perfectly functioning items just laying there? What a waste!";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 2;
		["connectID"] = 19;
		["posX"] = 2700;
		["posY"] = 180;
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
		["posY"] = 180;
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
		["text"] = "They simply allow you to trade here?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 1;
		["connectID"] = 14;
		["posX"] = 2430;
		["posY"] = 180;
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
		["posY"] = 180;
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
		["posY"] = 420;
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
		["posY"] = 420;
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
		["posY"] = 420;
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
		["posY"] = 690;
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
		["posY"] = 420;
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
		["posY"] = 540;
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
		["posX"] = 2160;
		["posY"] = 690;
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
		["posY"] = 570;
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
		["posY"] = 450;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getPlayer().skillsManager:get( \"mining\" ) >= 60\
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
		["posY"] = 690;
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
		["posY"] = 450;
		["script"] = "function message:onStart()\
   removeItemFromPlayer(\"antigravium_shards.itm\", 20 * self:getParam(\"skillup\"))\
\
   local cur = getPlayer().skillsManager:get( \"mining\" )\
   local up = self:getParam(\"skillup\")\
\
   getPlayer().skillsManager:inc( \"mining\", up )\
\
   if cur < 20 and cur + up >= 20 then\
      self:setParam(\"say20\", true)\
   elseif cur < 40 and cur + up >= 40 then\
      self:setParam(\"say40\", true)\
   elseif cur < 60 and cur + up >= 60 then\
      self:setParam(\"say60\", true)\
   end\
   self:setParam(\"sayRandom\", math.random(5))\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return hasPlayerItemCount(\"antigravium_shards.itm\", 20 * self:getParam(\"skillup\"))\
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
		["posY"] = 450;
		["script"] = "function message:onStart()\
   self:setParam(\"skillup\", 1)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getPlayer().skillsManager:get( \"mining\" ) < 60\
end\
\
";
		["text"] = "(mining + 1 for 20 antigravium shards)";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00072"] = {
		["ID"] = 72;
		["actor"] = 1;
		["connectID"] = 77;
		["posX"] = 3750;
		["posY"] = 570;
		["script"] = "function message:onStart()\
   self:setParam(\"skillup\", 5)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getPlayer().skillsManager:get( \"mining\" ) <= 55\
end\
\
";
		["text"] = "(mining + 5 for 100 antigravium shards)";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00078"] = {
		["ID"] = 78;
		["actor"] = 2;
		["connectID"] = 66;
		["posX"] = 4320;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Well... come again when you have them.";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00079"] = {
		["ID"] = 79;
		["actor"] = 1;
		["posX"] = 1890;
		["posY"] = 300;
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
		["posY"] = 1020;
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
		["posY"] = 780;
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
	["message_00082"] = {
		["ID"] = 82;
		["actor"] = 2;
		["connectID"] = 85;
		["posX"] = 4860;
		["posY"] = 300;
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
		["posY"] = 900;
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
		["posY"] = 420;
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
		["posY"] = 420;
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
		["posY"] = 180;
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
		["posY"] = 660;
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
		["posY"] = 540;
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
		["posY"] = 60;
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
		["time"] = 32;
		["type"] = "message";
	};
	["message_00091"] = {
		["ID"] = 91;
		["actor"] = 2;
		["connectID"] = 86;
		["posX"] = 4860;
		["posY"] = 180;
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
		["posY"] = 420;
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
			[4] = 28;
			[5] = 29;
			[6] = 27;
		};
		["posX"] = 1680;
		["posY"] = 330;
		["type"] = "switch";
	};
	["switch_00036"] = {
		["ID"] = 36;
		["connectionsID"] = {
			[1] = 60;
			[2] = 39;
		};
		["posX"] = 3060;
		["posY"] = 540;
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
		["posY"] = 570;
		["type"] = "switch";
	};
	["switch_00077"] = {
		["ID"] = 77;
		["connectionsID"] = {
			[1] = 64;
			[2] = 78;
		};
		["posX"] = 4110;
		["posY"] = 510;
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
		["posX"] = 4650;
		["posY"] = 390;
		["type"] = "switch";
	};
}
return obj1
