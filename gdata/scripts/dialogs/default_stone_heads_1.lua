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
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00002"] = {
		["ID"] = 2;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = 750.999633789;
		["posY"] = 241.499755859;
		["script"] = "function message:onStart()\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   return rand(10) > 5\
end\
\
";
		["text"] = "Our land - our rules! Behave, vagrant!";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = 750.999816895;
		["posY"] = 361.24987793;
		["script"] = "";
		["text"] = "Nga bagga, huma!";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["posX"] = 1254.99975586;
		["posY"] = 516.24987793;
		["script"] = "";
		["text"] = "\\[END]";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["connectID"] = 10;
		["posX"] = 1252.74987793;
		["posY"] = 83.2498703003;
		["script"] = "";
		["text"] = "Who are you guys?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 1;
		["connectID"] = 11;
		["posX"] = 1253.74987793;
		["posY"] = 193.24987793;
		["script"] = "";
		["text"] = "What is this place?";
		["time"] = 3;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["connectID"] = 12;
		["posX"] = 1252.74987793;
		["posY"] = 301.74987793;
		["script"] = "";
		["text"] = "Nice camp you have here.";
		["time"] = 3.5;
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 1;
		["connectID"] = 16;
		["posX"] = 1253.49987793;
		["posY"] = 406.249816895;
		["script"] = "";
		["text"] = "What are you doing? Guarding the bridge?";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 2;
		["connectID"] = 22;
		["posX"] = 1513.49926758;
		["posY"] = 83.9998245239;
		["script"] = "";
		["text"] = "Are you blind huma? We're the Stone Heads Tribe! The most fearless tribe of White Erg!";
		["time"] = 9;
		["type"] = "message";
	};
	["message_00011"] = {
		["ID"] = 11;
		["actor"] = 2;
		["connectID"] = 20;
		["posX"] = 1516;
		["posY"] = 193.500015259;
		["script"] = "";
		["text"] = "This is the Windscream Canyon! Our primordial land! So do what you're told or scram!";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 2;
		["connectID"] = 13;
		["posX"] = 1513;
		["posY"] = 302.5;
		["script"] = "";
		["text"] = "This ain't no camp. Our main encampment is much, much bigger! Hundreds of tents and thousands of warriors! Songs, dances near fire - that's the life. That's the fun.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 2;
		["connectID"] = 14;
		["posX"] = 1773.49987793;
		["posY"] = 302.49987793;
		["script"] = "";
		["text"] = "And here we only have a couple of tents so our precious Warchief don't get a cold from a draft.";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 1;
		["connectID"] = 15;
		["posX"] = 2033.5;
		["posY"] = 303.24987793;
		["script"] = "";
		["text"] = "You don't seem to hold him in high regard.";
		["time"] = 5.5;
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = 2293.5;
		["posY"] = 303.49987793;
		["script"] = "";
		["text"] = "He's too inexperienced compared to his father.";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 2;
		["connectID"] = 17;
		["posX"] = 1514.24987793;
		["posY"] = 406.249816895;
		["script"] = "";
		["text"] = "We're waiting for those huma cowards to attack us - and start a war!";
		["time"] = 8;
		["type"] = "message";
	};
	["message_00017"] = {
		["ID"] = 17;
		["actor"] = 1;
		["connectID"] = 18;
		["posX"] = 1774.49975586;
		["posY"] = 406.749816895;
		["script"] = "";
		["text"] = "Really? Your position isn't fortified, and your numbers are low.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 2;
		["connectID"] = 19;
		["posX"] = 2035;
		["posY"] = 407.5;
		["script"] = "";
		["text"] = "Don't worry - it's just how we're showing that we aren't afraid of those morons in the fort and their turrets. Actually we're accompanying the chief to the negotiations.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = 2296;
		["posY"] = 407.5;
		["script"] = "";
		["text"] = "It's just they're taking too damn long. It's time to blow up the bridge and show those humas who's who!";
		["time"] = 11;
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 1;
		["connectID"] = 21;
		["posX"] = 1775.24951172;
		["posY"] = 194.249816895;
		["script"] = "";
		["text"] = "I don't hear no wind screaming.";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = 2035.99926758;
		["posY"] = 194.499816895;
		["script"] = "";
		["text"] = "Wait till comes a desert storm - the howling is gonna be so loud you'd want to crawl under the nearest rock.";
		["time"] = 12;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 1;
		["connectID"] = 23;
		["posX"] = 1773.49926758;
		["posY"] = 84.4998168945;
		["script"] = "";
		["text"] = "Doesn't make much sense to me...";
		["time"] = 4;
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = 2033.74926758;
		["posY"] = 84.9998168945;
		["script"] = "";
		["text"] = "Stupid huma! We're the most badass tribe in this hemisphere of K'Tharsis, that's what it means! And those who disagree are feeding bitebugs in the graves.";
		["time"] = 14;
		["type"] = "message";
	};
	["switch_00001"] = {
		["ID"] = 1;
		["connectionsID"] = {
			[1] = 2;
			[2] = 3;
		};
		["posX"] = 570;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00004"] = {
		["ID"] = 4;
		["connectionsID"] = {
			[1] = 6;
			[2] = 7;
			[3] = 8;
			[4] = 9;
			[5] = 5;
		};
		["posX"] = 1063.24975586;
		["posY"] = 281.24987793;
		["type"] = "switch";
	};
}
return obj1
