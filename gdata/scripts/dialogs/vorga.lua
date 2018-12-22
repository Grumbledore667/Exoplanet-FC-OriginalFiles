-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 2;
		["posX"] = 330;
		["posY"] = 300;
		["script"] = "";
		["text"] = "";
		["time"] = 1;
		["type"] = "message";
	};
	["message_00003"] = {
		["ID"] = 3;
		["actor"] = 2;
		["connectID"] = 5;
		["posX"] = 780;
		["posY"] = 210;
		["script"] = "function message:onStart()\
   self:setDialogParam(\"n3\", 1)\
end\
\
function message:onStop()\
end\
\
function message:isVisible()\
   if(not self:getDialogParam(\"n3\")) then\
      return true\
   end\
   return false\
end\
\
";
		["text"] = "Hey huma! Where do you think you're going?";
		["time"] = 5;
		["type"] = "message";
	};
	["message_00004"] = {
		["ID"] = 4;
		["actor"] = 2;
		["posX"] = 780;
		["posY"] = 390;
		["script"] = "";
		["text"] = "Go away, huma. It's death beyond here, I tell you.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["connectID"] = 6;
		["posX"] = 1050;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Straight ahead.";
		["time"] = 2;
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 2;
		["connectID"] = 7;
		["posX"] = 1320;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Well that's a very stupid thing to do. You won't last a minute out there.";
		["time"] = 8.5;
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 1;
		["connectID"] = 8;
		["posX"] = 1590;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Why is that?";
		["time"] = 2.5;
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 2;
		["connectID"] = 4;
		["posX"] = 1860;
		["posY"] = 210;
		["script"] = "";
		["text"] = "Can't you see? It's a desert storm out there! And if you manage to last for more than a hundred meters, the sand sharks are going to get you.";
		["time"] = 15.5;
		["type"] = "message";
	};
	["switch_00002"] = {
		["ID"] = 2;
		["connectionsID"] = {
			[1] = 3;
			[2] = 4;
		};
		["posX"] = 600;
		["posY"] = 300;
		["type"] = "switch";
	};
}
return obj1
