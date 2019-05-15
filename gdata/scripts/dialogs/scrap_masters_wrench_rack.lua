-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["message_00000"] = {
		["ID"] = 0;
		["actor"] = 2;
		["connectID"] = 10;
		["posX"] = 300;
		["posY"] = 300;
		["script"] = "";
		["text"] = "root";
		["time"] = 0;
		["type"] = "message";
	};
	["message_00005"] = {
		["ID"] = 5;
		["actor"] = 1;
		["posX"] = 1470;
		["posY"] = 540;
		["script"] = "";
		["text"] = "Take 1st.";
		["time"] = 2;
		["topic"] = "hidden_scrap_master_wrench:wrench_rack_take_1";
		["type"] = "message";
	};
	["message_00006"] = {
		["ID"] = 6;
		["actor"] = 1;
		["posX"] = 1470;
		["posY"] = 690;
		["script"] = "";
		["text"] = "Take 2nd.";
		["time"] = 2;
		["topic"] = "hidden_scrap_master_wrench:wrench_rack_take_2";
		["type"] = "message";
	};
	["message_00007"] = {
		["ID"] = 7;
		["actor"] = 1;
		["posX"] = 1470;
		["posY"] = 840;
		["script"] = "";
		["text"] = "Take 3rd.";
		["time"] = 2;
		["topic"] = "hidden_scrap_master_wrench:wrench_rack_take_3";
		["type"] = "message";
	};
	["message_00008"] = {
		["ID"] = 8;
		["actor"] = 1;
		["posX"] = 1470;
		["posY"] = 990;
		["script"] = "";
		["text"] = "Take 4th.";
		["time"] = 2;
		["topic"] = "hidden_scrap_master_wrench:wrench_rack_take_4";
		["type"] = "message";
	};
	["message_00009"] = {
		["ID"] = 9;
		["actor"] = 1;
		["posX"] = 1470;
		["posY"] = 1140;
		["script"] = "";
		["text"] = "Take 5th.";
		["time"] = 2;
		["topic"] = "hidden_scrap_master_wrench:wrench_rack_take_5";
		["type"] = "message";
	};
	["message_00010"] = {
		["ID"] = 10;
		["actor"] = 1;
		["connectID"] = 11;
		["posX"] = 570;
		["posY"] = 300;
		["script"] = "";
		["text"] = "A rack with seven mechanical wrenches on it.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00012"] = {
		["ID"] = 12;
		["actor"] = 1;
		["connectID"] = 17;
		["posX"] = 1020;
		["posY"] = -180;
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
		["text"] = "[HIDDEN]Being an experienced mechanic helps to remember their sizes perfectly.";
		["time"] = 6;
		["type"] = "message";
	};
	["message_00013"] = {
		["ID"] = 13;
		["actor"] = 1;
		["connectID"] = 4;
		["posX"] = 1020;
		["posY"] = 930;
		["script"] = "";
		["text"] = "Don't really know what I'm doing here. Gotta choose one (counting from the left).";
		["time"] = 4.5;
		["type"] = "message";
	};
	["message_00014"] = {
		["ID"] = 14;
		["actor"] = 1;
		["posX"] = 1470;
		["posY"] = -150;
		["script"] = "";
		["text"] = "Take 17.";
		["time"] = 2;
		["topic"] = "hidden_scrap_master_wrench:wrench_rack_take_5";
		["type"] = "message";
	};
	["message_00015"] = {
		["ID"] = 15;
		["actor"] = 1;
		["posX"] = 1470;
		["posY"] = -300;
		["script"] = "";
		["text"] = "Take 15.";
		["time"] = 2;
		["topic"] = "hidden_scrap_master_wrench:wrench_rack_take_4";
		["type"] = "message";
	};
	["message_00016"] = {
		["ID"] = 16;
		["actor"] = 1;
		["posX"] = 1470;
		["posY"] = -750;
		["script"] = "";
		["text"] = "Take 12.";
		["time"] = 2;
		["topic"] = "hidden_scrap_master_wrench:wrench_rack_take_1";
		["type"] = "message";
	};
	["message_00018"] = {
		["ID"] = 18;
		["actor"] = 1;
		["posX"] = 1470;
		["posY"] = -450;
		["script"] = "";
		["text"] = "Take 14.";
		["time"] = 2;
		["topic"] = "hidden_scrap_master_wrench:wrench_rack_take_3";
		["type"] = "message";
	};
	["message_00019"] = {
		["ID"] = 19;
		["actor"] = 1;
		["posX"] = 1470;
		["posY"] = -600;
		["script"] = "";
		["text"] = "Take 13.";
		["time"] = 2;
		["topic"] = "hidden_scrap_master_wrench:wrench_rack_take_2";
		["type"] = "message";
	};
	["message_00020"] = {
		["ID"] = 20;
		["actor"] = 1;
		["posX"] = 1470;
		["posY"] = 1590;
		["script"] = "";
		["text"] = "Leave.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00021"] = {
		["ID"] = 21;
		["actor"] = 1;
		["posX"] = 1470;
		["posY"] = 300;
		["script"] = "";
		["text"] = "Leave.";
		["time"] = 1.5;
		["type"] = "message";
	};
	["message_00022"] = {
		["ID"] = 22;
		["actor"] = 1;
		["posX"] = 1470;
		["posY"] = 0;
		["script"] = "";
		["text"] = "Take 19.";
		["time"] = 2;
		["topic"] = "hidden_scrap_master_wrench:wrench_rack_take_6";
		["type"] = "message";
	};
	["message_00023"] = {
		["ID"] = 23;
		["actor"] = 1;
		["posX"] = 1470;
		["posY"] = 150;
		["script"] = "";
		["text"] = "Take 21.";
		["time"] = 2;
		["topic"] = "hidden_scrap_master_wrench:wrench_rack_take_7";
		["type"] = "message";
	};
	["message_00024"] = {
		["ID"] = 24;
		["actor"] = 1;
		["posX"] = 1470;
		["posY"] = 1290;
		["script"] = "";
		["text"] = "Take 6th.";
		["time"] = 2;
		["topic"] = "hidden_scrap_master_wrench:wrench_rack_take_6";
		["type"] = "message";
	};
	["message_00025"] = {
		["ID"] = 25;
		["actor"] = 1;
		["posX"] = 1470;
		["posY"] = 1440;
		["script"] = "";
		["text"] = "Take 7th.";
		["time"] = 2;
		["topic"] = "hidden_scrap_master_wrench:wrench_rack_take_7";
		["type"] = "message";
	};
	["switch_00004"] = {
		["ID"] = 4;
		["connectionsID"] = {
			[1] = 5;
			[2] = 6;
			[3] = 7;
			[4] = 8;
			[5] = 9;
			[6] = 24;
			[7] = 25;
			[8] = 20;
		};
		["h"] = 200;
		["posX"] = 1290;
		["posY"] = 900;
		["type"] = "switch";
		["w"] = 100;
	};
	["switch_00011"] = {
		["ID"] = 11;
		["connectionsID"] = {
			[1] = 12;
			[2] = 13;
		};
		["posX"] = 840;
		["posY"] = 300;
		["type"] = "switch";
	};
	["switch_00017"] = {
		["ID"] = 17;
		["connectionsID"] = {
			[1] = 16;
			[2] = 19;
			[3] = 18;
			[4] = 15;
			[5] = 14;
			[6] = 22;
			[7] = 23;
			[8] = 21;
		};
		["h"] = 200;
		["posX"] = 1290;
		["posY"] = -240;
		["type"] = "switch";
		["w"] = 100;
	};
}
return obj1
