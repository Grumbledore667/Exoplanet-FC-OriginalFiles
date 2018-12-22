-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 1;
		["connectID"] = 7;
		["posX"] = 390;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Stop the beating immediately!";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00001"] = {
		["ID"] = 1;
		["actor"] = 1;
		["connectID"] = 8;
		["posX"] = 390;
		["posY"] = 120;
		["script"] = "";
		["text"] = "Hey asshole! That's my hat!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 10;
		["posX"] = 390;
		["posY"] = 480;
		["script"] = "";
		["text"] = "I should get going...";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 3;
		["connectID"] = 25;
		["posX"] = 0;
		["posY"] = 300;
		["script"] = "";
		["text"] = "[t_my_clothes:looters_talk]Hey! Where'd you come from, pinkskin? Oh, it's that half-dead schmuck from the ourba. What the fuck do you want?";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 3;
		["connectID"] = 35;
		["posX"] = 630;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Or what? You're gonna shake your pink ass till we die laughing? Looks like you also need to be taught a lesson, huma.";
		["time"] = 12.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 3;
		["connectID"] = 35;
		["posX"] = 630;
		["posY"] = 120;
		["script"] = "";
		["text"] = "Is that so? Well, you are wearing my leather vest! I wanted a huma skin vest for a long time.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 3;
		["connectID"] = 35;
		["posX"] = 630;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Hell no! You ain't gonna get away that easily.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["connectID"] = 27;
		["posX"] = 1050;
		["posY"] = 360;
		["script"] = "";
		["text"] = "You scum are all talk, but when it comes to action all you can do is beat up the elderly, two against one. I bet you don't have the guts to take on a real spacer.";
		["time"] = 19;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 3;
		["connectID"] = 15;
		["posX"] = 1290;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Gods-in-the-Earth, he has a ngabang!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 1;
		["connectID"] = 13;
		["posX"] = 1050;
		["posY"] = 210;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return hasPlayerItem(\"flaregun.gun\")\
end\
\
";
		["text"] = "[t_my_clothes:show_flare_gun]\\[SHOW FLARE GUN] I'm not joking!";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["connectID"] = 16;
		["posX"] = 1530;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Is that thing even loaded? He won't reload it in time anyway! Get behind him, let's tear him apart!";
		["time"] = 10.5;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["connectID"] = 17;
		["posX"] = 1770;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Stop right there, you ass-faced lowlife! Maybe I do have a single charge in the flare gun, but that will be enough for you. Choose, which of you gets his ass burned and which gets his head smashed.";
		["time"] = 20;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 3;
		["connectID"] = 37;
		["posX"] = 2010;
		["posY"] = 210;
		["script"] = "";
		["text"] = "[t_my_clothes:bandits_scared]... Alright huma. You win. I don't know why you even care about this old gongo, but you can jaga bahamadron with him for all I care.  Let's get out of here, bro.";
		["time"] = 18;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 1;
		["connectID"] = 21;
		["posX"] = 2400;
		["posY"] = 270;
		["script"] = "";
		["text"] = "Not so fast, you pieces of shit! The hat!";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 1;
		["connectID"] = 20;
		["posX"] = 2400;
		["posY"] = 120;
		["script"] = "";
		["text"] = "Get lost while I'm nice!";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 3;
		["posX"] = 2640;
		["posY"] = 120;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   --This will start fade sequence after the msssage is played\
   getQuest(\"my_clothes\"):goToStep(\"looters_persuaded\")\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "[t_my_clothes:bandit_2_no_hat]We'll meet again, pink one! \\[In anticipation] We'll meet again...";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 3;
		["posX"] = 2640;
		["posY"] = 270;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   --This will start fade sequence after the msssage is played\
   getQuest(\"my_clothes\"):goToStep(\"looters_persuaded\")\
   --Have to give the hat after the step change\
   --or the quest will be finished if player already has clothes.\
   local bandit = self:getActor(3)\
   bandit:giveItemByName( \"hat_jack.itm\", getPlayer(), 1 )\
   bandit:setupAppearance(\"q_my_clothes_bandit_2\")\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "I hope you choke on your stinking hat. If I'd known what a greedy shit its owner is - I wouldn't even use it to wipe my ass.";
		["time"] = 15;
		["type"] = "message";
	};
	["message_00027"] = {
		["ID"] = 27;
		["actor"] = 3;
		["posX"] = 1290;
		["posY"] = 360;
		["script"] = "";
		["text"] = "[t_my_clothes:activate_bandits]Well, now we've got to the point! Get this schmuck!";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 1;
		["posX"] = 30;
		["posY"] = 90;
		["script"] = "";
		["text"] = "Bye";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 2;
		["connectID"] = 30;
		["posX"] = -750;
		["posY"] = 240;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00032"] = {
		["ID"] = 32;
		["actor"] = 1;
		["posX"] = 30;
		["posY"] = -30;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
   runTimer( 0, nil, function()\
      for i=1,2 do\
         getObj(\"q_my_clothes_bandit_\"..i):changeStatCount(\"health\",-500)\
      end\
   end, false )\
end\
\
function message:isVisible()\
   return true\
end\
\
";
		["text"] = "[t_my_clothes:activate_bandits]Die";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00033"] = {
		["ID"] = 33;
		["actor"] = 1;
		["connectID"] = 29;
		["posX"] = -360;
		["posY"] = 60;
		["script"] = "";
		["text"] = "debug";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00034"] = {
		["ID"] = 34;
		["actor"] = 1;
		["connectID"] = 3;
		["posX"] = -360;
		["posY"] = 300;
		["script"] = "";
		["text"] = "dialog";
		["time"] = 1.5;
		["type"] = "message";
	};
	["switch_00025"] = {
		["ID"] = 25;
		["connectionsID"] = {
			[1] = 1;
			[2] = 0;
			[3] = 2;
		};
		["posX"] = 240;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00029"] = {
		["ID"] = 29;
		["connectionsID"] = {
			[1] = 32;
			[2] = 28;
		};
		["posX"] = -120;
		["posY"] = 60;
		["type"] = "switch";
	};
	["switch_00030"] = {
		["ID"] = 30;
		["connectionsID"] = {
			[1] = 33;
			[2] = 34;
		};
		["posX"] = -510;
		["posY"] = 240;
		["type"] = "switch";
	};
	["switch_00035"] = {
		["ID"] = 35;
		["connectionsID"] = {
			[1] = 14;
			[2] = 12;
		};
		["posX"] = 900;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00037"] = {
		["ID"] = 37;
		["connectionsID"] = {
			[1] = 19;
			[2] = 18;
		};
		["posX"] = 2250;
		["posY"] = 210;
		["type"] = "switch";
	};
}
return obj1
