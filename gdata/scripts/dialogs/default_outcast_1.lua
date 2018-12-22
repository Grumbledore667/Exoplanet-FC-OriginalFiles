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
		["text"] = "Ah, I'm starving, huma. Got a bite? Some shinies maybe?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 1;
		["connectID"] = 27;
		["posX"] = 780;
		["posY"] = -120;
		["script"] = "local random = require \"random\"\
function message:onStart()\
   self:setParam(\"random\", random.random(4))\
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
		["posX"] = 780;
		["posY"] = 240;
		["script"] = "";
		["text"] = "What are you doing here?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 1;
		["connectID"] = 11;
		["posX"] = 780;
		["posY"] = 360;
		["script"] = "";
		["text"] = "Why were you cast out?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["connectID"] = 12;
		["posX"] = 780;
		["posY"] = 480;
		["script"] = "";
		["text"] = "Who's in charge here?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["connectID"] = 13;
		["posX"] = 780;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Do you have any tips?";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 1;
		["posX"] = 780;
		["posY"] = 720;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 1050;
		["posY"] = 240;
		["script"] = "";
		["text"] = "Suffering. That's all we outcasts can do: suffer from heat, cold, hunger, illness, regrets. Day by day. Until we die and Gods-in-Earth take our souls back to the Primal Darkness.";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 1050;
		["posY"] = 360;
		["script"] = "";
		["text"] = "My village was raided by Terraform bastards while I was away. You know the rest... Everyone I know is either dead or dying in the damn mines. No tribe will accept me, cause they think I will bring bad luck to them... I'm not even good enough of a fighter to join the scalphunters... I don't belong anywhere except here.";
		["time"] = 31;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["connectID"] = 14;
		["posX"] = 1050;
		["posY"] = 480;
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
		["text"] = "Big Hat, the old asshole, who thinks he's some kind of Elder in our little cozy \"village\". See that big rock with a hole at the back of the camp? Up there, in his cave he spends most of his days, watching how we crawl in the dirt below.";
		["time"] = 25.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["connectID"] = 15;
		["posX"] = 1050;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Don't eat rotten crucass meat, huma. I tried once and then puked so bad I thought I will see my guts on the ground.";
		["time"] = 13;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 1320;
		["posY"] = 480;
		["script"] = "";
		["text"] = "The bastard probably ate a full pot of bitebug porridge and is sleeping as always in his chair, while we starve and freeze every night.";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 1320;
		["posY"] = 600;
		["script"] = "";
		["text"] = "Desert melons are good, but don't overdo it either. Otherwise you will be exploding from the other end. I wish I had some smoked hornhog now...";
		["time"] = 14;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["connectID"] = 24;
		["posX"] = 780;
		["posY"] = -450;
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
		["time"] = 4;
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 1050;
		["posY"] = -450;
		["script"] = "";
		["text"] = "See that big rock at the back of the camp? We're supposed to hide there when the scalphunters come to raid us. Instead, he made the place his private quarters!";
		["time"] = 16;
		["type"] = "message";
	};
	["message_00026"] = {
		["ID"] = 26;
		["actor"] = 2;
		["connectID"] = 1;
		["posX"] = 1740;
		["posY"] = 240;
		["script"] = "";
		["text"] = "";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00028"] = {
		["ID"] = 28;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 1170;
		["posY"] = -180;
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
		["text"] = "Worse and worse. Being a slave is probably better at this point.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00029"] = {
		["ID"] = 29;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 1170;
		["posY"] = -300;
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
		["text"] = "Terrible.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00030"] = {
		["ID"] = 30;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 1170;
		["posY"] = -30;
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
		["text"] = "No rest from these sand fleas. Can't sleep... Can't even seat peacefully.";
		["time"] = 7;
		["type"] = "message";
	};
	["message_00031"] = {
		["ID"] = 31;
		["actor"] = 2;
		["connectID"] = 26;
		["posX"] = 1170;
		["posY"] = 90;
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
		["text"] = "My throat is withered. Hey, kind huma... do you have something for the poor abori to kill the hangover?";
		["time"] = 10.5;
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
		["h"] = 180;
		["posX"] = 600;
		["posY"] = 300;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00027"] = {
		["ID"] = 27;
		["connectionsID"] = {
			[1] = 29;
			[2] = 28;
			[3] = 30;
			[4] = 31;
		};
		["h"] = 120;
		["posX"] = 1020;
		["posY"] = -120;
		["type"] = "switch";
		["w"] = 100;
	};
}
return obj1
