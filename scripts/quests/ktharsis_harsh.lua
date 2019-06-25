-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "Near the place where a trading caravan was ambushed I have found a gravely wounded aborigine called Swift Strider. I must decide what to do with him. Killing the aborigine out of mercy must be the quickest way, however leaving him to the scavengers is not completely off the table. Rescuing him requires at least finding something to bandage his wounds, supplying Strider with some water and setting a fireplace next to him to repel vultures.";
	["hidden"] = false;
	["logs"] = {
		["BandageCloth"] = "I decided to bandage Swift Strider with some cloth. As a person who just lost his spaceship I can almost empathize for a poor aborigine who lost both of his legs. The grumpy abori seems to be dedicated to dying though, and he accepted my help groaning and moaning.";
		["BandageNothing"] = "I have to find a medkit or some cloth to patch him up. 2 rags will suffice.";
		["BandageShirt"] = "I decided to bandage Swift Strider with my own shirt. Normally I'm not that altruistic but as a person who just lost his spaceship I can almost empathize for a poor aborigine who lost both of his legs. The grumpy abori seems to be dedicated to dying though, and he accepted my help groaning and moaning.";
		["Finish"] = "Looks like Swift Strider is alive and well. He now has a cargo container in the Fort as his place. He is grumpy though and does tend to drink a lot.";
		["GaveFood"] = "Gave Swift Strider some food. Looks like despite being crippled and proclaiming that he wants to rest in peace he has a remarkably healthy appetite.";
		["GaveFoodJoint"] = "Gave Swift Strider some food. Looks like despite being crippled and proclaiming that he wants to rest in peace, he still got a case of munchies from smoking his plant.";
		["GaveJoint"] = "I gave him anaesthetic plant he asked and the bastard just rolled it into a joint and smoked it!";
		["GaveMelon"] = "I gave Swift Strider some juicy desert melons as a water source. This will keep him alive for a while. Remarkably tough creatures, those aborigines.";
		["GaveWater"] = "I gave Swift Strider some water. This will keep him alive for a while. Remarkably tough creatures, those aborigines.";
		["InformGarrison"] = "Whether or not I decide to feed the spoiled abori, it still makes sense to tell someone about him. He suggested captain Castor in the fort which I can find following the road.";
		["MadeFireplace"] = "Made a fireplace to keep him warm during the night and keep dangerous animals at bay. A good thing to know that local wildlife is afraid of fire, so I can protect my own camps in wilderness.";
		["Medkit"] = "I decided to bandage Swift Strider with whatever was in the medkit I had. Normally I'm not that altruistic but as a person who just lost his spaceship I can almost empathize for a poor aborigine who lost both of his legs. The grumpy abori seems to be dedicated to dying though, and he accepted my help groaning and moaning.";
		["Report"] = "I told captain Castor about Swift Strider. Let's hope he survives till Castor's men arrive.";
		["ReportSaved"] = "I told captain Castor about Swift Strider. It appears that his men have already brought him to the fort. He should be in one of the unused cargo containers.\
";
		["SetupSentry"] = "I set up a sentry to protect Swift Strider from crucasses.";
		["StriderDied"] = "Swift Strider probably bit the dust by now. It was never my concern to care about stranger aborigines on this shithole of a planet.";
		["StriderKilled"] = "I've killed him out of mercy. Better than leaving him in agony and to be probably eaten alive by the local wildlife.";
		["Thinking"] = "Is it just me thinking that in a situation like this, one must show a bit more gratitude to a helpful stranger? Not only this asshole of an abori Swift Strider is now hungry, but he also wants some blue leaf plant to ease off his pain. I swear, if he asks for a smoke, it's going to be his last.";
	};
	["nodes"] = {
		["condition_00014"] = {
			["ID"] = 14;
			["connectionsID"] = {
				[1] = 36;
			};
			["event"] = "activate";
			["posX"] = 1170;
			["posY"] = 150;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "var:campfire_act";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00017"] = {
			["ID"] = 17;
			["connectionsID"] = {
				[1] = 5;
			};
			["event"] = "dead";
			["posX"] = 1440;
			["posY"] = 840;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "swift_strider";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00021"] = {
			["ID"] = 21;
			["connectionsID"] = {
				[1] = 0;
			};
			["event"] = "discuss";
			["posX"] = -570;
			["posY"] = 450;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00022"] = {
			["ID"] = 22;
			["connectionsID"] = {
				[1] = 25;
			};
			["event"] = "discuss";
			["posX"] = 30;
			["posY"] = 240;
			["script"] = "function Condition:onCheck(name, obj)\
   removeItemFromPlayer(\"spacer_jacket.itm\")\
   self:writeLog(\"BandageShirt\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "strider_bandage_shirt";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00023"] = {
			["ID"] = 23;
			["connectionsID"] = {
				[1] = 10;
			};
			["event"] = "discuss";
			["posX"] = 660;
			["posY"] = 150;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"pure_water_bottle.itm\", getObj(\"swift_strider\"))\
   self:writeLog(\"GaveWater\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "strider_give_water";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00024"] = {
			["ID"] = 24;
			["connectionsID"] = {
				[1] = 10;
			};
			["event"] = "discuss";
			["posX"] = 660;
			["posY"] = 300;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"melon.itm\", getObj(\"swift_strider\"))\
   self:writeLog(\"GaveMelon\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "strider_give_melon";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00026"] = {
			["ID"] = 26;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 1170;
			["posY"] = -30;
			["script"] = "function Condition:onCheck(name, obj)\
   showObject(self.campfire_act)\
   enableObject(self.campfire_act)\
   self:setTopicVisible(\"strider_make_fireplace\", false)\
   self:setTopicVisible(\"strider_what_again\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "strider_make_fireplace";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00027"] = {
			["ID"] = 27;
			["connectionsID"] = {
				[1] = 13;
			};
			["event"] = "discuss";
			["posX"] = 1680;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "strider_feeling_warmer";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00028"] = {
			["ID"] = 28;
			["connectionsID"] = {
				[1] = 7;
			};
			["event"] = "discuss";
			["posX"] = 2190;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "strider_tell_someone";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00029"] = {
			["ID"] = 29;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 2040;
			["posY"] = 60;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"fried_bug.itm\", getObj(\"swift_strider\"))\
   getObj(\"swift_strider\"):changeStatCount(\"health\", 10)\
   if self:getParam(\"joint\") then\
      self:writeLog(\"GaveFoodJoint\")\
   else\
      self:writeLog(\"GaveFood\")\
   end\
   self:setTopicVisible(\"strider_optional_food\", false)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "strider_give_bug";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00030"] = {
			["ID"] = 30;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 2040;
			["posY"] = -90;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"fried_meat.itm\", getObj(\"swift_strider\"))\
   getObj(\"swift_strider\"):changeStatCount(\"health\", 10)\
   if self:getParam(\"joint\") then\
      self:writeLog(\"GaveFoodJoint\")\
   else\
      self:writeLog(\"GaveFood\")\
   end\
   self:setTopicVisible(\"strider_optional_food\", false)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "strider_give_meat";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00031"] = {
			["ID"] = 31;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 1800;
			["posY"] = 0;
			["script"] = "function Condition:onCheck(name, obj)\
   giveItemFromPlayerTo(\"bluethorn_leaf.itm\", getObj(\"swift_strider\"))\
   getObj(\"swift_strider\"):changeStatCount(\"health\", 10)\
   self:setParam(\"joint\", true)\
   self:writeLog(\"GaveJoint\")\
   self:setTopicVisible(\"strider_optional_weed\", false)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "strider_give_leaf";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00032"] = {
			["ID"] = 32;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -210;
			["posY"] = -90;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"strider_what_to_do\", false)\
   self:setTopicVisible(\"strider_bandage_cloth\", true)\
   self:setTopicVisible(\"strider_bandage_shirt\", true)\
   self:setTopicVisible(\"strider_medkit\", true)\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "strider_what_to_do";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00033"] = {
			["ID"] = 33;
			["connectionsID"] = {
				[1] = 4;
			};
			["event"] = "discuss";
			["posX"] = 3450;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "strider_safety";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00034"] = {
			["ID"] = 34;
			["connectionsID"] = {
				[1] = 35;
			};
			["event"] = "discuss";
			["posX"] = 2700;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "castor_report";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00038"] = {
			["ID"] = 38;
			["connectionsID"] = {
				[1] = 25;
			};
			["event"] = "discuss";
			["posX"] = 30;
			["posY"] = 90;
			["script"] = "function Condition:onCheck(name, obj)\
   removeItemFromPlayer(\"medkit.itm\")\
   self:writeLog(\"Medkit\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "strider_medkit";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00039"] = {
			["ID"] = 39;
			["connectionsID"] = {
				[1] = 25;
			};
			["event"] = "discuss";
			["posX"] = 30;
			["posY"] = 390;
			["script"] = "function Condition:onCheck(name, obj)\
   removeItemFromPlayer(\"cloth.itm\", 2)\
   self:writeLog(\"BandageCloth\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "strider_bandage_cloth";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00040"] = {
			["ID"] = 40;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 30;
			["posY"] = -90;
			["script"] = "function Condition:onCheck(name, obj)\
   self:writeLog(\"BandageNothing\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "strider_bandage_nothing";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00041"] = {
			["ID"] = 41;
			["connectionsID"] = {
				[1] = 36;
			};
			["event"] = "add_installation";
			["posX"] = 1170;
			["posY"] = 300;
			["script"] = "function Condition:onCheck(name, obj)\
   local strider = getObj(\"swift_strider\")\
   if objInDist(strider:getPose():getPos(), getPlayer():getPose():getPos(), self.campfire_distance) then\
      hideObject(self.campfire_act)\
      disableObject(self.campfire_act)\
      return true\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "CFireplace";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00043"] = {
			["ID"] = 43;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 3690;
			["posY"] = 120;
			["script"] = "function Condition:onCheck(name, obj)\
   local booze = next(getPlayerBooze(), nil)\
   giveItemFromPlayerTo(booze, getObj(\"swift_strider\"))\
   self:setTopicVisible(\"strider_drunk\", true)\
   return false\
end\
\
";
			["supercondition"] = true;
			["targetsAll"] = "";
			["targetsAny"] = "strider_give_booze";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 4;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 3780;
			["posY"] = 420;
			["script"] = "";
			["type"] = "step";
		};
		["hydrate"] = {
			["ID"] = 25;
			["connectionsID"] = {
				[1] = 17;
				[2] = 23;
				[3] = 24;
			};
			["name"] = "hydrate";
			["posX"] = 360;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local strider = getObj(\"swift_strider\")\
   strider:setupAppearance(\"swift_strider_bandaged\")\
   strider:changeStatCount(\"health\", 10)\
   strider:postponeDeath(6)\
   self:setTopicVisible(\"strider_bandage_cloth\", false)\
   self:setTopicVisible(\"strider_bandage_shirt\", false)\
   self:setTopicVisible(\"strider_medkit\", false)\
   self:setTopicVisible(\"strider_hydrate\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["in_fort"] = {
			["ID"] = 37;
			["connectionsID"] = {
				[1] = 33;
			};
			["name"] = "in_fort";
			["posX"] = 3210;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local strider = getObj(\"swift_strider\")\
   strider:setImmortality(\"immortal\")\
   self.q:openStriderShack()\
   self:setTopicVisible(\"strider_saving\", false)\
   self:setTopicVisible(\"strider_safety\", true)\
   self:setTopicVisible(\"help_on_the_way\", false)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["made_fireplace"] = {
			["ID"] = 36;
			["connectionsID"] = {
				[1] = 17;
				[2] = 27;
			};
			["name"] = "made_fireplace";
			["posX"] = 1440;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local strider = getObj(\"swift_strider\")\
   strider:changeStatCount(\"health\", 10)\
   strider:setImmortality(\"protected\")\
   strider:deactivateDeath()\
   self:setTopicVisible(\"strider_what_again\", false)\
   self:setTopicVisible(\"strider_feeling_warmer\", true)\
   self:writeLog(\"MadeFireplace\")\
   getQuest(\"family_relic\"):setTopicVisible(\"strider_saved\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["make_fireplace"] = {
			["ID"] = 10;
			["connectionsID"] = {
				[1] = 14;
				[2] = 17;
				[3] = 41;
			};
			["name"] = "make_fireplace";
			["posX"] = 930;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local strider = getObj(\"swift_strider\")\
   strider:changeStatCount(\"health\", 10)\
   strider:postponeDeath(6)\
   self:setTopicVisible(\"strider_hydrate\", false)\
   self:setTopicVisible(\"strider_make_fireplace\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["mercy_kill"] = {
			["ID"] = 5;
			["connectionsID"] = {
				[1] = 4;
			};
			["name"] = "mercy_kill";
			["posX"] = 1710;
			["posY"] = 870;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   getQuest(\"family_relic\"):setTopicVisible(\"strider_saved\", false)\
   getQuest(\"family_relic\"):setTopicVisible(\"strider_unknown\", false)\
   getQuest(\"family_relic\"):setTopicVisible(\"strider_dead\", true)\
\
   if getObj(\"swift_strider\").killer == getPlayer() then\
      self:writeLog(\"StriderKilled\")\
      getQuest(\"family_relic\"):setTopicVisible(\"strider_killed\", true)\
   else\
      self:writeLog(\"StriderDied\")\
   end\
   hideObject(self.campfire_act)\
   disableObject(self.campfire_act)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["optionals"] = {
			["ID"] = 13;
			["connectionsID"] = {
				[1] = 17;
				[2] = 28;
			};
			["name"] = "optionals";
			["posX"] = 1950;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   if self:getParam(\"murder\") == nil then\
      self:setTopicVisible(\"strider_feeling_warmer\", false)\
      self:setTopicVisible(\"strider_optional_weed\", true)\
      self:setTopicVisible(\"strider_optional_food\", true)\
      self:writeLog(\"Thinking\")\
   end\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["reported"] = {
			["ID"] = 35;
			["connectionsID"] = {
				[1] = 17;
				[2] = 37;
			};
			["name"] = "reported";
			["posX"] = 2970;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   --self.q:goToStep(\"in_fort\", false)\
   --self:writeLog(\"ReportSaved\")\
   self:setTopicVisible(\"help_on_the_way\", true)\
   self:writeLog(\"Report\")\
   getObj(\"swift_strider\"):activateToFort(12)\
   getQuest(\"family_relic\"):setTopicVisible(\"strider_reported\", true)\
   getQuest(\"family_relic\"):setTopicVisible(\"strider_unknown\", false)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 17;
				[2] = 22;
				[3] = 38;
				[4] = 39;
			};
			["name"] = "start";
			["posX"] = -300;
			["posY"] = 480;
			["script"] = "";
			["type"] = "step";
		};
		["tell_someone"] = {
			["ID"] = 7;
			["connectionsID"] = {
				[1] = 17;
				[2] = 34;
			};
			["name"] = "tell_someone";
			["posX"] = 2460;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:writeLog(\"InformGarrison\")\
   self:setTopicVisible(\"castor_report\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:declareVar(\"campfire_act\", \"q_ktharsis_harsh_campfire\")\
   self:declareVar(\"campfire_distance\", 700)\
   self:declareVar(\"strider_safe\", \"q_ktharsis_harsh_strider_safety\")\
   self:declareVar(\"shack_closed\", \"q_ktharsis_harsh_shack_closed\")\
   self:declareVar(\"shack_open\", \"q_ktharsis_harsh_shack_open\") --Group of objs\
\
   self:setTopicVisible(\"start\", true)\
   self:setTopicVisible(\"strider_saving\", true)\
   self:setTopicVisible(\"strider_what_to_do\", true)\
   self:setTopicVisible(\"strider_bandage_shirt\", false)\
   self:setTopicVisible(\"strider_bandage_cloth\", false)\
   self:setTopicVisible(\"strider_medkit\", false)\
   self:setTopicVisible(\"strider_hydrate\", false)\
   self:setTopicVisible(\"strider_give_water\", true) --this is hidden by hydrate\
   self:setTopicVisible(\"strider_give_melon\", true) --this is hidden by hydrate\
   self:setTopicVisible(\"strider_make_fireplace\", false)\
   self:setTopicVisible(\"strider_what_again\", false)\
   self:setTopicVisible(\"strider_feeling_warmer\", false)\
   self:setTopicVisible(\"strider_tell_someone\", true) --this is hidden by feeling_warmer\
   self:setTopicVisible(\"strider_optional_weed\", false)\
   self:setTopicVisible(\"strider_give_leaf\", true) --these three hidden by optional_weed\
   self:setTopicVisible(\"strider_give_root\", true)\
   self:setTopicVisible(\"strider_give_aloe\", true)\
   self:setTopicVisible(\"strider_optional_food\", false)\
   self:setTopicVisible(\"strider_give_bug\", true) --these two hidden by optional_food\
   self:setTopicVisible(\"strider_give_meat\", true)\
   self:setTopicVisible(\"castor_report\", false)\
   self:setTopicVisible(\"help_on_the_way\", false)\
   self:setTopicVisible(\"strider_safety\", false)\
   self:setTopicVisible(\"strider_drunk\", false)\
   self:setTopicVisible(\"strider_give_booze\", true)\
   self:setParam(\"expMult\", 2)\
end\
\
function Quest:onStart()\
end\
\
function Quest:onFinish()\
   self:setTopicVisible(\"help_on_the_way\", false)\
   self:writeLog(\"Finish\")\
end\
\
function Quest:OnLoadState()\
   if self:isStepPassed(\"reported\") then\
      self:openStriderShack()\
   end\
end\
\
function Quest:openStriderShack()\
   local obj = getObj(self.strider_safe)\
   if obj then\
      local strider = getObj(\"swift_strider\")\
      if strider and not strider:getState(\"dead\") then\
         strider:changeStatCount(\"health\", 100)\
         teleportTo(strider, getObj(self.strider_safe))\
         local cont_closed = getObj(self.shack_closed)\
         if cont_closed then\
            cont_closed:setVisible(false)\
            disableObjectCollisions(self.shack_closed)\
         end\
         showEnableObjectGroup(self.shack_open, true)\
      end\
   else\
      log(\"No \" .. self.strider_safe .. \", swift_strider will not teleport\")\
   end\
end\
\
function Quest:getTopicVisible_strider_bandage_cloth()\
   return hasPlayerItem(\"cloth.itm\", 2)\
end\
\
function Quest:getTopicVisible_strider_bandage_shirt()\
   return hasPlayerItem(\"spacer_jacket.itm\")\
end\
\
function Quest:getTopicVisible_strider_medkit()\
   return hasPlayerItem(\"medkit.itm\")\
end\
\
function Quest:getTopicVisible_strider_give_water()\
   return hasPlayerItem(\"pure_water_bottle.itm\")\
end\
\
function Quest:getTopicVisible_strider_give_melon()\
   return hasPlayerItem(\"melon.itm\")\
end\
\
function Quest:getTopicVisible_strider_give_meat()\
   return hasPlayerItem(\"fried_meat.itm\")\
end\
\
function Quest:getTopicVisible_strider_give_bug()\
   return hasPlayerItem(\"fried_bug.itm\")\
end\
\
function Quest:getTopicVisible_strider_give_leaf()\
   return hasPlayerItem(\"bluethorn_leaf.itm\")\
end\
\
function Quest:getTopicVisible_strider_give_root()\
   return hasPlayerItem(\"blood_root.itm\")\
end\
\
function Quest:getTopicVisible_strider_give_aloe()\
   return hasPlayerItem(\"ktharsian_aloe.itm\")\
end\
\
function Quest:getTopicVisible_strider_give_booze()\
   return hasPlayerBooze()\
end";
	["title"] = "K'Tharsis is a harsh mistress";
}
return obj1
