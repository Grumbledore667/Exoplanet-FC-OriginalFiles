-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 2;
		["posX"] = -180;
		["posY"] = 180;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 1;
		["connectID"] = 7;
		["posX"] = 1080;
		["posY"] = -210;
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
		["text"] = "[t_my_clothes:ragpicker_my_clothes]Hey, these clothes are mine!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 600;
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
		["text"] = "Oh, a new face! Well, I hope you have some shards in your pockets. Otherwise don't just stand here and scare away my customers.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 2;
		["connectID"] = 8;
		["posX"] = 1320;
		["posY"] = -210;
		["script"] = "";
		["text"] = "Yeah, those look like they were made for you! 200 shards each and they're yours.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["connectID"] = 9;
		["posX"] = 1560;
		["posY"] = -210;
		["script"] = "";
		["text"] = "Bollocks!";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 2;
		["connectID"] = 10;
		["posX"] = 1800;
		["posY"] = -210;
		["script"] = "";
		["text"] = "No, this is called capitalism, huma.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 1;
		["connectID"] = 20;
		["posX"] = 2220;
		["posY"] = -90;
		["script"] = "";
		["text"] = "\\[Provoke]Try to stop me from taking my shit back! I'll beat you up if i have to.";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["connectID"] = 60;
		["posX"] = 2220;
		["posY"] = 60;
		["script"] = "";
		["text"] = "\\[BACK].";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 1;
		["connectID"] = 14;
		["posX"] = 2220;
		["posY"] = -480;
		["script"] = "";
		["text"] = "Alright, trade then.";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 2610;
		["posY"] = -720;
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
		["text"] = "[t_my_clothes:ragpicker_buy_all]\\[Give 400 Antigravium Shards] I'll take everything";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 2610;
		["posY"] = -600;
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
		["text"] = "[t_my_clothes:ragpicker_buy_shirt]\\[Give 200 Antigravium Shards] Give me my shirt back.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 1;
		["connectID"] = 19;
		["posX"] = 2610;
		["posY"] = -480;
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
		["text"] = "[t_my_clothes:ragpicker_buy_pants]\\[Give 200 Antigravium Shards] Give me my pants back.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 1;
		["connectID"] = 10;
		["posX"] = 2610;
		["posY"] = -240;
		["script"] = "";
		["text"] = "\\[BACK] I need to think about it.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["connectID"] = 33;
		["posX"] = 2880;
		["posY"] = -600;
		["script"] = "";
		["text"] = "Come again.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 2;
		["posX"] = 2460;
		["posY"] = -90;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   --Lets ragpicker go into angry mode at the end of the dialog\
   getQuest(\"my_clothes\"):provokeTrader( \"talk\" )\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "Last person who tried to rob me ended up dead.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 600;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Are you buying anything or just looking?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 1;
		["connectID"] = 28;
		["posX"] = 240;
		["posY"] = -120;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 1;
		["connectID"] = 27;
		["posX"] = 210;
		["posY"] = 240;
		["script"] = "";
		["text"] = "dalog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 1;
		["posX"] = 630;
		["posY"] = -180;
		["script"] = "function message:onStart()\
   local saveDM = isDebug(\"quest\")\
   setDebugMode(\"quest\", true)\
   local q = getQuest(\"my_clothes\")\
   q.hidden = false\
   q:start()\
   runTimer(0, nil, function()\
      setDebugMode(\"quest\", saveDM)\
   end, false)\
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
		["text"] = "Quick-Start \"My clothes\"";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 1;
		["posX"] = 630;
		["posY"] = -60;
		["script"] = "";
		["text"] = "Exit";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 1;
		["connectID"] = 32;
		["posX"] = 2610;
		["posY"] = -360;
		["script"] = "";
		["text"] = "Ugh... But I don't have any money.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 2;
		["connectID"] = 14;
		["posX"] = 2880;
		["posY"] = -360;
		["script"] = "";
		["text"] = "Your problem, not mine.";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 1;
		["connectID"] = 34;
		["posX"] = 3150;
		["posY"] = -600;
		["script"] = "";
		["text"] = "Yeah, maybe I will...";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 3420;
		["posY"] = -600;
		["script"] = "";
		["text"] = "*grins*";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00035"] = {
		["ID"] = 35;
		["actor"] = 1;
		["connectID"] = 39;
		["posX"] = 1080;
		["posY"] = 150;
		["script"] = "";
		["text"] = "What a stench! Do you sell corpses or what?";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00037"] = {
		["ID"] = 37;
		["actor"] = 1;
		["connectID"] = 41;
		["posX"] = 1560;
		["posY"] = 360;
		["script"] = "";
		["text"] = "I'm looking for a thief who stole these clothes from me. You better tell me where he hides his sorry ass, or else...";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00038"] = {
		["ID"] = 38;
		["actor"] = 1;
		["posX"] = 1080;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Later.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00039"] = {
		["ID"] = 39;
		["actor"] = 2;
		["connectID"] = 59;
		["posX"] = 1320;
		["posY"] = 150;
		["script"] = "";
		["text"] = "Well, just look at this arrogant huma! No one in the history of my shop has ever complained about my wares and now he stands here and wrinkles his little nose!";
		["time"] = 16.5;
		["type"] = "message";
	};
	["message_00041"] = {
		["ID"] = 41;
		["actor"] = 2;
		["connectID"] = 49;
		["posX"] = 1800;
		["posY"] = 360;
		["script"] = "";
		["text"] = "A thief? I'm not dealing with any thieves here, huma, only with honest prospectors and thrash diggers. You're insulting me! I will never expose my suppliers to someone like you!";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00043"] = {
		["ID"] = 43;
		["actor"] = 1;
		["connectID"] = 54;
		["posX"] = 2190;
		["posY"] = 240;
		["script"] = "";
		["text"] = "So 100 antigravium shards won't make you change your mind?";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00044"] = {
		["ID"] = 44;
		["actor"] = 1;
		["connectID"] = 45;
		["posX"] = 1080;
		["posY"] = 360;
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
		["text"] = "Where have you got those human clothes?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00045"] = {
		["ID"] = 45;
		["actor"] = 2;
		["connectID"] = 37;
		["posX"] = 1320;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Bought'em from some fellow passing by recently. Why?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00050"] = {
		["ID"] = 50;
		["actor"] = 1;
		["connectID"] = 53;
		["posX"] = 2190;
		["posY"] = 360;
		["script"] = "";
		["text"] = "How about some broken ribs and lost teeth? Is it worth covering some filtly coward who only steals from helpless wictims?";
		["time"] = 11.5;
		["type"] = "message";
	};
	["message_00051"] = {
		["ID"] = 51;
		["actor"] = 1;
		["connectID"] = 52;
		["posX"] = 2190;
		["posY"] = 480;
		["script"] = "";
		["text"] = "I will coimplain to your elder. Let's see what he thinks of your little stinking business. ";
		["time"] = 9.5;
		["type"] = "message";
	};
	["message_00052"] = {
		["ID"] = 52;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 2430;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Go ahead. You will learn a lot about this village's law enforcement, retarded huma.";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00053"] = {
		["ID"] = 53;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 2430;
		["posY"] = 360;
		["script"] = "";
		["text"] = "My, my, feeling lucky today, scrub? I won't be the one to start the fight, but you will be the one to bite a mouthful of dust in the end.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00054"] = {
		["ID"] = 54;
		["actor"] = 2;
		["connectID"] = 62;
		["posX"] = 2430;
		["posY"] = 240;
		["script"] = "";
		["text"] = "You know what, huma, I'll make a fair proposition to you. See, a bag of four hundred is perfectly shaped to be held in one hand. I like that feeling.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00055"] = {
		["ID"] = 55;
		["actor"] = 1;
		["connectID"] = 56;
		["posX"] = 2910;
		["posY"] = 240;
		["script"] = "";
		["text"] = "You are out of your mind! I'm not paying you shit.";
		["time"] = 6.5;
		["type"] = "message";
	};
	["message_00056"] = {
		["ID"] = 56;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 3150;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Well, poor huma, you will stay ignorant then.";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00059"] = {
		["ID"] = 59;
		["actor"] = 2;
		["connectID"] = 60;
		["posX"] = 1560;
		["posY"] = 150;
		["script"] = "";
		["text"] = "I sell whatever I can find around here, and if you don't like the light appetizing smell of a \"ripe\" meat, then bugger off, sissy pinkface.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00060"] = {
		["ID"] = 60;
		["actor"] = 2;
		["connectID"] = 36;
		["posX"] = 3600;
		["posY"] = 150;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00061"] = {
		["ID"] = 61;
		["actor"] = 1;
		["connectID"] = 10;
		["posX"] = 1080;
		["posY"] = -90;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return getQuestTopicVisible(\"my_clothes\", \"ragpicker_scumbag\")\
end\
\
";
		["text"] = "Hey, scumbag.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00062"] = {
		["ID"] = 62;
		["actor"] = 2;
		["connectID"] = 55;
		["posX"] = 2670;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Getting such amount of greenies from you might be the turning point where we become closest friends and have no longer any secrets from each other.";
		["time"] = 14;
		["type"] = "message";
	};
	["switch_00002"] = {
		["ID"] = 2;
		["connectionsID"] = {
			[1] = 25;
			[2] = 26;
		};
		["posX"] = 60;
		["posY"] = 180;
		["type"] = "switch";
	};
	["switch_00010"] = {
		["ID"] = 10;
		["connectionsID"] = {
			[1] = 13;
			[2] = 11;
			[3] = 12;
		};
		["posX"] = 2070;
		["posY"] = -90;
		["type"] = "switch";
	};
	["switch_00014"] = {
		["ID"] = 14;
		["connectionsID"] = {
			[1] = 15;
			[2] = 16;
			[3] = 17;
			[4] = 31;
			[5] = 18;
		};
		["posX"] = 2460;
		["posY"] = -510;
		["type"] = "switch";
	};
	["switch_00027"] = {
		["ID"] = 27;
		["connectionsID"] = {
			[1] = 5;
			[2] = 23;
		};
		["posX"] = 450;
		["posY"] = 240;
		["type"] = "switch";
	};
	["switch_00028"] = {
		["ID"] = 28;
		["connectionsID"] = {
			[1] = 29;
			[2] = 30;
		};
		["posX"] = 480;
		["posY"] = -120;
		["type"] = "switch";
	};
	["switch_00036"] = {
		["ID"] = 36;
		["connectionsID"] = {
			[1] = 3;
			[2] = 61;
			[3] = 35;
			[4] = 44;
			[5] = 38;
		};
		["posX"] = 870;
		["posY"] = 210;
		["type"] = "switch";
	};
	["switch_00049"] = {
		["ID"] = 49;
		["connectionsID"] = {
			[1] = 43;
			[2] = 50;
			[3] = 51;
		};
		["posX"] = 2040;
		["posY"] = 360;
		["type"] = "switch";
	};
}
return obj1
