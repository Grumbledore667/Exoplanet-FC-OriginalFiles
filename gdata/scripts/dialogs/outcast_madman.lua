-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = -360;
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
		["text"] = "You, I've already seen you in my visions. You think you're special? You're not! You will die, huma, and will be reborn again and again, many many times. A toy for the gods. A puppet in their hands... Like we all are.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 16;
		["posX"] = 120;
		["posY"] = 120;
		["script"] = "function message:onStart()\
   self:setParam(\"random\", math.random(6))\
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
		["text"] = "How's it going?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 10;
		["posX"] = 120;
		["posY"] = 360;
		["script"] = "";
		["text"] = "What the hell are you talking about? I've never been here.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["connectID"] = 11;
		["posX"] = 120;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Looks like you've got a few screws loose in your head, mate.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["connectID"] = 12;
		["posX"] = 120;
		["posY"] = 600;
		["script"] = "function message:onStart()\
   setGlobalParam(\"asked_about_bighat\", true)\
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
		["text"] = "Who's in charge here?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["connectID"] = 13;
		["posX"] = 120;
		["posY"] = 720;
		["script"] = "";
		["text"] = "Do you have any tips?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 1;
		["posX"] = 120;
		["posY"] = 840;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 810;
		["posY"] = -210;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"random\") == 1\
end\
\
";
		["text"] = "I sleep on bare rocks, closer to the Gods, resting in their place deep, deep below. I listen to them moaning in their slumber! They aren't happy about what we've done with the land. You should do the same, huma. Lie on the the rocks, let the stone draw the warmth from your body, listen to the Gods below.";
		["time"] = 30.5;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 360;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Ha-ha-ha! What a toy knows about the masters will, the way they design things to function? But who am I to blame you? Just another puppet. A pile of useless thoughts and memories. A shadow that disappears when the sun comes out.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 360;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Really? Why do you think so? Just because you've told yourself you're \"normal\"? Who told you that lie? No one's \"normal\" here anymore! Every living being on this planet is sinking in it's own delusions, drowning in a whirlpool of madness. But fortunately this will end soon.";
		["time"] = 24.5;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["connectID"] = 14;
		["posX"] = 360;
		["posY"] = 600;
		["script"] = "";
		["text"] = "A fool that leads other fools. A blind person that teaches other blind idiots. The fool hides in the cave, there, behind the metal wall.";
		["time"] = 13.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["connectID"] = 15;
		["posX"] = 360;
		["posY"] = 720;
		["script"] = "";
		["text"] = "I will willingly share my wisdom even with you, huma. Listen to the Gods-in-the-Earth. Bow to their will! This is the only way to save your soul from being sent to the Primordial Darkness when they wake up to judge us.";
		["time"] = 21.5;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 600;
		["posY"] = 600;
		["script"] = "";
		["text"] = "If you think that another wall will save you from the awakening wrath of Gods-in-the-Earth, you're truly a fool.";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 600;
		["posY"] = 720;
		["script"] = "";
		["text"] = "It is questionable, if humas have a soul, but I won't be the one who discourages you from getting a chance at salvation.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1200;
		["posY"] = 660;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 29;
		["posX"] = 810;
		["posY"] = -90;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"random\") == 2\
end\
\
";
		["text"] = "Back in my village... I told them many times, but they weren't listening. I've warned them, but they laughed at me. I told them to sacrifice a child to the Gods-in-the-Earth, like our fathers did, but they punched me, they threw stones, rotten fruit and feces at me.";
		["time"] = 25;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 810;
		["posY"] = 30;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"random\") == 3\
end\
\
";
		["text"] = "My head hurts. It hurts...it hurts...o-oh what should I do to stop this pain? Maybe smash your skull and make a good medicine from your brain? Do you have a good brain, huma?";
		["time"] = 17.5;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 810;
		["posY"] = 150;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"random\") == 4\
end\
\
";
		["text"] = "Hm...  Ah, it's you again. Wanna eat some sand? Fine, warm sand. I like the white one. Just put it in your mouth and chew! M-m-mh! Tasty!";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 810;
		["posY"] = 270;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"random\") == 5\
end\
\
";
		["text"] = "I wonder how you humas can talk. You look so stupid. Why have the Gods created such silly looking creature like you?";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 810;
		["posY"] = 390;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:getParam(\"random\") == 6\
end\
\
";
		["text"] = "Nga bagga, huma! Quargo gin droh. Bagga pem!";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["connectID"] = 24;
		["posX"] = 120;
		["posY"] = -210;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getGlobalParam(\"asked_about_bighat\")\
end\
\
";
		["text"] = "Where can I find your leader, Big Hat?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 360;
		["posY"] = -210;
		["script"] = "";
		["text"] = "The old fool hides in his cave, day and night. Another shell to bind a foul soul and keep it together. But it will be cracked open soon.";
		["time"] = 14.5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 2;
		["connectID"] = 27;
		["posX"] = -750;
		["posY"] = 330;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = -360;
		["posY"] = 390;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 1050;
		["posY"] = -90;
		["script"] = "";
		["text"] = "Now they're all dead! A feast for worms! Who is laughing now? Who was right? We must sacrifice a child... but where do I find one now?";
		["time"] = 14.5;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 23;
			[2] = 2;
			[3] = 3;
			[4] = 4;
			[5] = 5;
			[6] = 6;
			[7] = 7;
		};
		["posX"] = -60;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00016"] = {
		["ID"] = 16;
		["connectionsID"] = {
			[1] = 9;
			[2] = 18;
			[3] = 19;
			[4] = 20;
			[5] = 21;
			[6] = 22;
		};
		["posX"] = 570;
		["posY"] = 90;
		["type"] = "switch";
	};
	["switch_00027"] = {
		["ID"] = 27;
		["connectionsID"] = {
			[1] = 0;
			[2] = 28;
		};
		["posX"] = -510;
		["posY"] = 330;
		["type"] = "switch";
	};
}
return obj1
