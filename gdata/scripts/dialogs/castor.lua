-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 42;
		["posX"] = 0;
		["posY"] = 0;
		["script"] = "";
		["text"] = "Hell yes, I am. A captain of this heap of scrap metal some asshole back in the Company called a Fort.";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["posX"] = 0;
		["posY"] = 1050;
		["script"] = "";
		["text"] = "Bye.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 63;
		["posX"] = 240;
		["posY"] = 600;
		["script"] = "";
		["text"] = "[t_wet_work:give_tokens]Great. Now we have some time untill those bastards start to show up in the Windscream canyon again.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["connectID"] = 34;
		["posX"] = -900;
		["posY"] = 240;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["connectID"] = 30;
		["posX"] = 0;
		["posY"] = 300;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return self:isTopicVisible() and self:isFirstTime() and not self:getParam(\"not_terminal\")\
end\
\
";
		["text"] = "[t_wet_work:terminal]I've seen the request in Bounty Hunter Terminal. Cash for dead bandits. Is it still active?";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 2;
		["connectID"] = 32;
		["posX"] = 240;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Yeah. You see, we can't provoke the Stone Heads, so I won't send any bandit subjugation parties now. But a freelancer like you could easily get some shinies. If you know how to hold a gun and aren't afraid of some wet work.";
		["time"] = 22.5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["connectID"] = 46;
		["posX"] = 750;
		["posY"] = 360;
		["script"] = "";
		["text"] = "All you need is to bring me some tokens to prove that you have dealt with some of the criminal scum plaguing this region.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = 0;
		["posY"] = 600;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"wet_work\"):getTopicVisible(\"give_tokens\")\
end\
\
";
		["text"] = "I've got some bandit tokens.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 1;
		["connectID"] = 0;
		["posX"] = -270;
		["posY"] = 0;
		["script"] = "function message:onStart()\
   getQuest(\"wet_work\"):setTopicVisible(\"intro\", false)\
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
		["text"] = "[t_wet_work:intro]Are you captain Castor?";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00042"] = {
		["ID"] = 42;
		["actor"] = 1;
		["connectID"] = 43;
		["posX"] = 270;
		["posY"] = 0;
		["script"] = "";
		["text"] = "Any trouble with the natives? Cause I saw their camp across the rift... They behave rather cocky.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 2;
		["connectID"] = 44;
		["posX"] = 540;
		["posY"] = 0;
		["script"] = "";
		["text"] = "We are in a stalemate with the Stone Heads now: They aren't gonna attack the Fort since they'll only get blasted by our turrets and we won't advance without an order from our headquarters.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 810;
		["posY"] = 0;
		["script"] = "";
		["text"] = "Despite the fact that there was... an incident with our workers and we shot a couple of their scouts dead, the peace treaty is still active.";
		["time"] = 35;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 1;
		["connectID"] = 47;
		["posX"] = 1200;
		["posY"] = 300;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"wet_work\"):getTopicVisible(\"give_tokens\")\
end\
\
";
		["text"] = "Actually I already have some.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00047"] = {
		["ID"] = 47;
		["actor"] = 2;
		["connectID"] = 63;
		["posX"] = 1440;
		["posY"] = 300;
		["script"] = "";
		["text"] = "[t_wet_work:give_tokens]Good. Travelers can feel a bit safer now thanks to you, kid. Here is your cash.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00048"] = {
		["ID"] = 48;
		["actor"] = 1;
		["connectID"] = 49;
		["posX"] = 0;
		["posY"] = 750;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuest(\"wet_work\"):isStarted()\
end\
\
";
		["text"] = "What kind of tokens were you talking about?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00049"] = {
		["ID"] = 49;
		["actor"] = 2;
		["connectID"] = 50;
		["posX"] = 240;
		["posY"] = 750;
		["script"] = "";
		["text"] = "For abori bandits it's their thumbs. An abori without his thumbs would be banished by his kin, if he doesn't kill himself out of shame before that, as it's a great disgrace for a warrior to not be able to hold a weapon.";
		["time"] = 22.5;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 1;
		["connectID"] = 52;
		["posX"] = 480;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Fine, at least its not their junk. Dont tell me I need to scalp humans!";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 2;
		["connectID"] = 63;
		["posX"] = 720;
		["posY"] = 750;
		["script"] = "";
		["text"] = "Man, who do you think we are? Stone age savages? For human bandits you need to cut onlly the cerebral ID chip. Just a little cut on the temple and it's done. Well, you need to drill trough an eye socket for older models, but once the target's dead that shouldn't be a problem.";
		["time"] = 29;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 1;
		["connectID"] = 55;
		["posX"] = 0;
		["posY"] = 450;
		["script"] = "function message:onStart()\
   self:setParam(\"not_terminal\", true)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuest(\"wet_work\"):isStarted()\
end\
\
";
		["text"] = "Any job offers I can take on?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 2;
		["connectID"] = 56;
		["posX"] = 240;
		["posY"] = 450;
		["script"] = "";
		["text"] = "Sure, If you know how to hold a gun and aren't afraid of some wet work of course.";
		["time"] = 10;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 2;
		["connectID"] = 32;
		["posX"] = 480;
		["posY"] = 450;
		["script"] = "";
		["text"] = "[t_wet_work:start]You see, we can't provoke the Stone Heads, so I won't send any bandit subjugation parties now. But a freelancer like you could easily earn some shinies. If you know how to hold a gun and aren't afraid of some wet work of course.";
		["time"] = 23;
		["type"] = "message";
	};
	["message_00057"] = {
		["ID"] = 57;
		["actor"] = 2;
		["connectID"] = 3;
		["posX"] = -510;
		["posY"] = 540;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return not getQuest(\"wet_work\"):getTopicVisible(\"intro\")\
end\
\
";
		["text"] = "Hello there.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 1;
		["connectID"] = 63;
		["posX"] = 1200;
		["posY"] = 420;
		["script"] = "";
		["text"] = "I see.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 2;
		["connectID"] = 63;
		["posX"] = 1080;
		["posY"] = 0;
		["script"] = "";
		["text"] = "I consider that their chief is trying to bargain for better terms of leasing his lands to the Company. Just a matter of bureaucracy and time in the end, as usual. We must stay calm and prevent further escalation of the conflict.";
		["time"] = 22;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 1;
		["connectID"] = 64;
		["posX"] = 0;
		["posY"] = 900;
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
		["text"] = "[t_ktharsis_harsh:castor_report]I found a gravely wounded abori named Swift Strider in the aftermath of a caravan ambush.";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 2;
		["connectID"] = 63;
		["posX"] = 390;
		["posY"] = 1020;
		["script"] = "";
		["text"] = "I'll send someone to pick him up and investigate the matter.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00063"] = {
		["ID"] = 63;
		["actor"] = 2;
		["connectID"] = 3;
		["posX"] = 2160;
		["posY"] = 600;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00066"] = {
		["ID"] = 66;
		["actor"] = 2;
		["connectID"] = 63;
		["posX"] = 390;
		["posY"] = 900;
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
		["text"] = "[HIDDEN]Actually, my men have just returned with an injured abori that fits the description of the one you're talking about. He should be in one of the unused cargo containers.";
		["time"] = 16;
		["type"] = "message";
	};
	["switch_00003"] = {
		["ID"] = 3;
		["connectionsID"] = {
			[1] = 29;
			[2] = 53;
			[3] = 37;
			[4] = 48;
			[5] = 61;
			[6] = 6;
		};
		["posX"] = -240;
		["posY"] = 510;
		["type"] = "switch";
	};
	["switch_00034"] = {
		["ID"] = 34;
		["connectionsID"] = {
			[1] = 41;
			[2] = 57;
		};
		["posX"] = -660;
		["posY"] = 240;
		["type"] = "switch";
	};
	["switch_00046"] = {
		["ID"] = 46;
		["connectionsID"] = {
			[1] = 45;
			[2] = 59;
		};
		["posX"] = 1020;
		["posY"] = 360;
		["type"] = "switch";
	};
	["switch_00064"] = {
		["ID"] = 64;
		["connectionsID"] = {
			[1] = 66;
			[2] = 62;
		};
		["posX"] = 240;
		["posY"] = 900;
		["type"] = "switch";
	};
}
return obj1
