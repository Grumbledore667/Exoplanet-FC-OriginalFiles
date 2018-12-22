-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "Carry the Stone, an aborigine I've met in Outcast camp, offered me some cash if I help him to scan the strange anomalies appearing in the area around the Dead Lake. I must use the contraption he calls Exotic Particle Detector to find and dig out some samples for Carry. Five samples from different anomalies should be enough for his goals. Those anomalies look like some kind of 'energy field' bubbles and should be pretty harmless, Carry said. Getting a shovel first is a good idea: I really don't want to dig in those anomalies with my bare hands.";
	["hidden"] = false;
	["logs"] = {
		["ate_sandwich"] = "I ate the sandwich from the box right in front of his hungry eyes. I will not forget his sour face till the end of my days! That will teach him some lesson about what it costs to hire Jack Sharp to dig in trash piles.";
		["finish"] = "I have delivered all the samples to Carry the Stone and got my reward. It's not much, but in my situation, every little bit helps. By the way, Carry forgot about his Detector. I wonder, where I can use it again and what I will find.";
		["finish_bad"] = "I have delivered all the samples to Carry the Stone and got my reward. Could not resist to get some extra stuff from that stupid abori. Carry was so annoyed, that he forgot completely about his Detector. I wonder, where I can use it again and what I will find.";
		["finish_worst"] = "Carry was angry that I kept the Neocortex Cartridge for myself. Our deal is broken and he has no more job for me. Was keeping this \"dark tech\" item for myself a good choice? Only time will tell.";
		["finish_worst_no_more_job"] = "Carry the Stone won't accept other samples from me. Our deal is broken and he has no more job for me. Was keeping this \"dark tech\" item for myself a good choice? Only time will tell.";
		["found_all"] = "I have found all five samples Carry asked for.";
		["give_item1"] = "I gave the closed metal box to Carry the Stone. He was really happy to have it.";
		["give_item1_empty"] = "I gave the opened metal box to Carry the Stone. He was suspicious and asked about the content of the box.";
		["give_item2"] = "The strange knife cut in half is one of the samples. Carry the Stone was glad to have it. What is he going to use it for?";
		["give_item3"] = "Gave the Neocortex Cartridge to my employer. Better to get rid of this \"dark tech\" stuff, before someone in this desert world discovers the existence of interplanetary laws.";
		["give_item4"] = "The Detector reacted to... a rotten melon. I was glad to hand it over to Carry the Stone. Some cash for a foul fruit - I will take this offer any day in the week. ";
		["give_item5"] = "I'm pretty sure that the bottle of strong booze I have found in one of the anomalies could be used despite this \"exotic particles\" bullshit... for medical purposes. Still, I let Carry the Stone have it. And he emptied it right away!";
		["give_sandwich"] = "I've given away the strange sandwich from the metal box. Should have tasted it at least...";
		["sandwich_gone"] = "Carry did not reward me for an empty box. Fair enough. At least I can have that strange sandwich for myself.";
		["take_cortex"] = "I saved the Neocortex Cartridge for myself. To the right person, it is worth many times more than this sly dog Carry can offer me.\
";
		["threat_dance"] = "I forced Carry to dance for the Neocortex Cartridge. Looked funny. Now he will think twice before treating a real spacer like a local simpleton.";
		["threat_money"] = "I forced Carry to give me two hundred shards more for the Neocortex Cartridge. Got to be realistic: he probably cannot afford to spend more.";
	};
	["nodes"] = {
		["condition_00000"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = -240;
			["posY"] = 420;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00002"] = {
			["ID"] = 2;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 1350;
			["posY"] = 510;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(name)\
   addItemToPlayer(\"energy_implant.itm\")\
   self:setTopicVisible(\"finish\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "finish";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00004"] = {
			["ID"] = 4;
			["connectionsID"] = {
				[1] = 5;
			};
			["event"] = "discuss";
			["posX"] = 810;
			["posY"] = 510;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(name)\
   self:setTopicVisible(name, false)\
   local itemVar = string.gsub(name, \"give_\", \"\")\
   local itemName = self[itemVar]\
   giveItemFromPlayerTo(itemName, obj)\
   _G.addMoneyToPlayer(10)\
   _G.addExpToPlayer(50)\
\
   if name == \"give_item1\" then\
      self:setTopicVisible(\"give_item1_empty\", false)\
   elseif name == \"give_item5\" then\
      --TODO:FIXME: get rid of this when our npcs are able to consume items\
      local carry = getObj(\"carry_the_stone\")\
      local function onDrinkEnd()\
         getScene():destroyEntity(carry.drinkEntity)\
         carry.drinkEntity = nil\
         carry:setHeadLookingAllowed(true)\
      end\
\
      local ItemsData = require \"itemsData\"\
      local anim = carry.animations.idle.drink.default\
\
      carry:setHeadLookingAllowed(false)\
      carry.animationsManager:playAction(anim)\
      carry.animationsManager:subscribeAnimationEnd(anim, onDrinkEnd)\
\
      local drinkModel = ItemsData.getItemModel(\"strange_absinthe.itm\")\
      carry.drinkEntity = getScene():createEntity(drinkModel, \"\")\
      carry.drinkEntity:getPose():setParent(carry:getBonePose(\"item_slot\" .. carry:getWeaponSlot()))\
      carry.drinkEntity:getPose():resetLocalPose()\
      carry.drinkEntity:getPose():setLocalPos({y=-25})\
   end\
\
   self:setParam(\"itemsLeftToGive\", self:getParam(\"itemsLeftToGive\") - 1)\
   if self:getParam(\"itemsLeftToGive\") == 0 then\
      return true\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "give_item1,give_item2,give_item3,give_item4,give_item5";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00006"] = {
			["ID"] = 6;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 690;
			["posY"] = -360;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"finish_bad\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "force_bad_ending";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00008"] = {
			["ID"] = 8;
			["connectionsID"] = {
				[1] = 5;
			};
			["event"] = "discuss";
			["posX"] = 810;
			["posY"] = 330;
			["script"] = "function Condition:onCheck(name, obj)\
   --Don't deduct it from the itemsLeftToGive, sandwich_gone will do that instead\
   self:writeLog(name)\
   self:setTopicVisible(name, false)\
   self:setTopicVisible(\"give_item1\", false)\
   local itemVar = string.gsub(name, \"give_\", \"\")\
   local itemName = self[itemVar]\
   giveItemFromPlayerTo(itemName, obj)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "give_item1_empty";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00009"] = {
			["ID"] = 9;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 1350;
			["posY"] = 330;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(name)\
   addItemToPlayer(\"energy_implant.itm\")\
   self:setTopicVisible(\"finish\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "finish_bad";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00010"] = {
			["ID"] = 10;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 210;
			["posY"] = -300;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(name)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "take_cortex";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00011"] = {
			["ID"] = 11;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 450;
			["posY"] = -240;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(name)\
   self:setTopicVisible(\"threat_dance\", false)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "threat_dance";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00012"] = {
			["ID"] = 12;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 450;
			["posY"] = -360;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(name)\
   self:setTopicVisible(\"threat_money\", false)\
   addItemToPlayer(\"antigravium_shards.itm\", 200)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "threat_money";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00014"] = {
			["ID"] = 14;
			["connectionsID"] = {
				[1] = 5;
			};
			["event"] = "discuss";
			["posX"] = 810;
			["posY"] = 660;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setParam(\"itemsLeftToGive\", self:getParam(\"itemsLeftToGive\") - 1)\
   if self:getParam(\"itemsLeftToGive\") == 0 then\
      return true\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "sandwich_gone";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00015"] = {
			["ID"] = 15;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -30;
			["posY"] = -300;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(name)\
   self:setTopicVisible(\"finish_bad\", true)\
\
   getMC():setDialogAnimationAllowed(false, 3)\
   useItemForPlayer(self.sandwich)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "ate_sandwich";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00016"] = {
			["ID"] = 16;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -510;
			["posY"] = -300;
			["script"] = "function Condition:onCheck(name, obj)\
   addItemToPlayer(\"strange_detector.itm\", 1)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "recieve_detector";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00017"] = {
			["ID"] = 17;
			["connectionsID"] = {
				[1] = 5;
			};
			["event"] = "discuss";
			["posX"] = 810;
			["posY"] = 180;
			["script"] = "function Condition:onCheck(name, obj)\
   --More money\
   self:writeLog(name)\
   self:setTopicVisible(name, false)\
   local itemVar = string.gsub(name, \"give_\", \"\")\
   local itemName = self[itemVar]\
   giveItemFromPlayerTo(itemName, obj)\
   _G.addMoneyToPlayer(50)\
   _G.addExpToPlayer(50)\
\
   self:setParam(\"itemsLeftToGive\", self:getParam(\"itemsLeftToGive\") - 1)\
   if self:getParam(\"itemsLeftToGive\") == 0 then\
      return true\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "give_sandwich";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00019"] = {
			["ID"] = 19;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 810;
			["posY"] = -30;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"finish\", false)\
   if self:getParam(\"itemsLeftToGive\") > 1 then\
      self:writeLog(name .. \"_no_more_job\")\
   else\
      self:setTopicVisible(\"finish_worst_no_more_job\", false)\
      self:writeLog(name)\
   end\
   self:setTopicVisible(\"lore_blocked\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "finish_worst";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00020"] = {
			["ID"] = 20;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 690;
			["posY"] = -240;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"finish_worst\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "force_worst_ending";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00021"] = {
			["ID"] = 21;
			["connectionsID"] = {
			};
			["event"] = "get";
			["posX"] = 330;
			["posY"] = 30;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setParam(\"itemsLeftToFind\", self:getParam(\"itemsLeftToFind\") - 1)\
   if self:getParam(\"itemsLeftToFind\") == 0 then\
      self:writeLog(\"found_all\")\
   end\
   local found = 5 - self:getParam(\"itemsLeftToFind\")\
   gameplayUI:showInfoTextEx(string.format(\"Items found %d/5\", found),  \"major\", \"\")\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:item1,var:item2,var:item3,var:item4,var:item5";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00022"] = {
			["ID"] = 22;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -270;
			["posY"] = -300;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"about_lemfather_2\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "about_lemfather_1";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 1770;
			["posY"] = 360;
			["script"] = "";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 1;
			["connectionsID"] = {
				[1] = 4;
				[2] = 8;
				[3] = 14;
				[4] = 17;
				[5] = 19;
				[6] = 21;
			};
			["name"] = "start";
			["posX"] = 0;
			["posY"] = 450;
			["script"] = "";
			["type"] = "step";
		};
		["step_05"] = {
			["ID"] = 5;
			["connectionsID"] = {
				[1] = 2;
				[2] = 9;
			};
			["name"] = "step_05";
			["posX"] = 1110;
			["posY"] = 450;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"finish\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
	};
	["script"] = "local random = require \"random\"\
function Quest:onCreate()\
   self:declareVar(\"stash1\", \"q_scan_it_1_\")\
   self:declareVar(\"stash2\", \"q_scan_it_2_\")\
   self:declareVar(\"stash3\", \"q_scan_it_3_\")\
   self:declareVar(\"stash4\", \"q_scan_it_4_\")\
   self:declareVar(\"stash5\", \"q_scan_it_5_\")\
   self:declareVar(\"stashList\", {self.stash1, self.stash2, self.stash3, self.stash4, self.stash5})\
   self:declareVar(\"item1\", \"carry_lunchbox.itm\")\
   self:declareVar(\"item1_empty\", \"carry_lunchbox.itm\")\
   self:declareVar(\"item2\", \"strange_knife.itm\")\
   self:declareVar(\"item3\", \"neocortex_cartridge.itm\") --most important\
   self:declareVar(\"item4\", \"rotten_melon.itm\")\
   self:declareVar(\"item5\", \"strange_absinthe.itm\")\
   self:declareVar(\"sandwich\", \"tasty_sandwich.itm\")\
   self:setParam(\"itemsLeftToFind\", 5)\
   self:setParam(\"itemsLeftToGive\", 5)\
\
   self:setTopicVisible(\"start\", true)\
   self:setTopicVisible(\"recieve_detector\", true)\
   self:setTopicVisible(\"finish\", false)\
   self:setTopicVisible(\"finish_bad\", false)\
   self:setTopicVisible(\"finish_worst\", false)\
   self:setTopicVisible(\"finish_worst_no_more_job\", true)\
   self:setTopicVisible(\"force_bad_ending\", true)\
   self:setTopicVisible(\"force_worst_ending\", true)\
\
   self:setTopicVisible(\"lore_blocked\", false)\
   self:setTopicVisible(\"about_lemfather_1\", true) --opens the 2nd one\
   self:setTopicVisible(\"about_lemfather_2\", false)\
\
   -- see topic methods\
   self:setTopicVisible(\"give_item1\", true)\
   self:setTopicVisible(\"give_item1_empty\", true)\
   self:setTopicVisible(\"give_sandwich\", true)\
   self:setTopicVisible(\"sandwich_gone\", true)\
   self:setTopicVisible(\"ate_sandwich\", true)\
   self:setTopicVisible(\"give_item2\", true)\
   self:setTopicVisible(\"give_item3\", true)\
   self:setTopicVisible(\"take_cortex\", true)\
   self:setTopicVisible(\"give_item4\", true)\
   self:setTopicVisible(\"give_item5\", true)\
   self:setTopicVisible(\"threat_dance\", true)\
   self:setTopicVisible(\"threat_money\", true)\
\
   self:declareVar(\"stashGroups\", {})\
   runTimerAdv(0, false, function ()\
      for i, objName in pairs(self.stashList) do\
         self.stashGroups[i] = {}\
         local id = 1\
         local obj = getObj(objName .. id, true)\
         while obj do\
            table.insert(self.stashGroups[i], obj)\
            if not getScene():isLoadedGame() then\
               obj.interactor:setRaycastActive(false)\
            end\
\
            id = id + 1\
            obj = getObj(objName .. id, true)\
         end\
      end\
   end)\
\
   local markers = {\
      start = {\
         {pos = {x=25207, y=12347, z=231556}, radius = 20, tip = \"Anomaly Bubble\"},\
         {pos = {x=31925, y=7561, z=220492}, radius = 10, tip = \"Anomaly Bubble\"},\
         {pos = {x=37978, y=11175, z=228851}, radius = 13, tip = \"Anomaly Bubble\"},\
         {pos = {x=34921, y=5238, z=208247}, radius = 10, tip = \"Anomaly Bubble\"},\
         {pos = {x=39277, y=9378, z=224233}, radius = 12, tip = \"Anomaly Bubble\"},\
      },\
   }\
   self:declareQuestMarkers(markers)\
end\
\
function Quest:onStart()\
   --Shuffle items for all stashes, supports several stashes per anomaly\
   local shuffledGroups = random.shuffle(self.stashGroups)\
   --Do not place most important item into the first stash group\
   while shuffledGroups[3] == self.stashGroups[1] do\
      shuffledGroups = random.shuffle(self.stashGroups)\
   end\
   for i, group in pairs(shuffledGroups) do\
      local targetSite = random.choice(group)\
      targetSite.interactor:setRaycastActive(true)\
      local itemName = self[\"item\" .. tostring(i)]\
      targetSite.lootItems = {[itemName] = 1}\
   end\
\
   self:setTopicVisible(\"start\", false)\
end\
\
function Quest:onFinish()\
   self:setTopicVisible(\"give_item1\", false)\
   self:setTopicVisible(\"give_item1_empty\", false)\
   self:setTopicVisible(\"give_item2\", false)\
   self:setTopicVisible(\"give_item3\", false)\
   self:setTopicVisible(\"give_item4\", false)\
   self:setTopicVisible(\"give_item5\", false)\
end\
\
Quest[\"getTopicVisible_give_item1\"] = function(self)\
   local lunchbox = getMC():getInventory():getItemByName(self[\"item1\"])\
   return self:isActive() and lunchbox ~= nil and not lunchbox:isEmpty()\
end\
\
Quest[\"getTopicVisible_give_item1_empty\"] = function(self)\
   local lunchbox = getMC():getInventory():getItemByName(self[\"item1\"])\
   return self:isActive() and lunchbox ~= nil and lunchbox:isEmpty()\
end\
\
local function makeItemTopic(item)\
   Quest[\"getTopicVisible_give_\"..item] = function(self)\
      return self:isActive() and hasPlayerItem(self[item])\
   end\
end\
\
makeItemTopic(\"sandwich\")\
makeItemTopic(\"item2\")\
makeItemTopic(\"item3\")\
makeItemTopic(\"item4\")\
makeItemTopic(\"item5\")\
";
	["title"] = "Scan it!";
}
return obj1
