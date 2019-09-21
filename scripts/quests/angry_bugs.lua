-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "This big cave to the east of the Anomaly Zone is taken by a group of aggressive scalp hunters. Looks like there's no way through. I need to talk to someone local, maybe someone who lives here long enough to have some tricks up his sleeve.";
	["hidden"] = false;
	["logs"] = {
		["Done"] = "That was a massacre. Anyways, the cave is now safer to go through and I can continue my journey. I could get something as a reward from the people who'd be happy to hear this.";
		["Finish"] = "The Herbalist was happy to hear that now no scalp hunters will bother the exiles and rewarded me with some ammo.";
		["HaveShrooms"] = "I've got five shrooms. Now I have to find some bughill vents and put them in.";
		["Knowledge"] = "I should be happy that the old aborigine has such an excellent memory! He gave me a valuable hint on the scalphunter cave's layout. There must be a long stone gallery running alongside one of the cave's walls. This dim and cold place will be ideal for sneaking up to the camp.";
		["Nature1"] = "The Herbalist has told me that I can use natural environment to defeat the scalp hunters. I must find some poisonous stinky mushrooms and stuff them in the bitebug hive vents in the cave close to the place where the savages have settled. Presumably this will enrage bitegugs and they will attack the scalp hunters in a big swarm.";
		["Nature2"] = "Stinky mushrooms could be found in moist places with lots of organic waste. Old Exile knows one such place in the anomaly zone: I must go down the valley to the lake and turn right just before I hit the water, then follow the rock wall. There should be a cave entrance overgrown with some blue plants.";
		["Nature3"] = "In that cave I should navigate carefully in order to avoid explosion of the ripe mushrooms. They react to vibration in certain radius but won't explode immediately, so my best chance is to walk slowly or crouch and watch out for the shrooms reaction. I must find some of the small unripe shrooms and break their protective cages with a knife or other melee weapon. Half a dozen of those should be enough.";
		["PlacedShrooms"] = "I placed the shrooms. I need to find a safe spot and enjoy the view.";
		["ScalphuntersKilled"] = "I got rid of the scalp hunters on my own and maybe can get some rewards from the people that might be happy to hear that. Anyways, I can finally leave this forsaken limbo.";
		["Sneaking1"] = "Infiltrating the camp of the scalp hunters might not be so easy in my current condition, but the Herbalist conveniently recalled that there is a second entrance to the big cave. If I want to use it, I must turn right once I leave the old abori's hideout and hug the right stone wall.";
		["Sneaking2"] = "I must proceed until I reach some old bug hives in a niche in the rock wall. Between the hives there should be a narrow pass that leads to a series of ledges facing to the desert. At the other side of that opening I should find the second entrance to the scalphunters cave. It Is unlikely that It will be well guarded but I must keep my eyes peeled and be prepared to neutralize any stray scalphunters fast and quietly.";
	};
	["nodes"] = {
		["condition_00000"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "trigger_in";
			["posX"] = -780;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "var:start_trig_1,var:start_trig_2";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00006"] = {
			["ID"] = 6;
			["connectionsID"] = {
				[1] = 7;
			};
			["event"] = "activate";
			["posX"] = 570;
			["posY"] = 240;
			["script"] = "function Condition:onCheck(name, obj)\
   local count = self:getParam(\"vents_poisoned\")\
   count = count + 1\
   local text = \"Bughill vent poisoned \"..count..\"/5\"\
   gameplayUI:showInfoTextEx(text, \"major\", \"\")\
   self:setParam(\"vents_poisoned\", count)\
   if count >= 5 then\
      return true\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:shroom_act_1,var:shroom_act_2,var:shroom_act_3,var:shroom_act_4,var:shroom_act_5";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00009"] = {
			["ID"] = 9;
			["connectionsID"] = {
				[1] = 8;
			};
			["event"] = "get";
			["posX"] = 120;
			["posY"] = 330;
			["script"] = "function Condition:onCheck(name, obj)\
   return hasPlayerItem(\"shroom_grenade.itm\", 5)\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "shroom_grenade.itm";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00011"] = {
			["ID"] = 11;
			["connectionsID"] = {
				[1] = 12;
			};
			["event"] = "activate";
			["posX"] = 1020;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "var:wait_act_1,var:wait_act_2";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00016"] = {
			["ID"] = 16;
			["connectionsID"] = {
				[1] = 17;
			};
			["event"] = "discuss";
			["posX"] = -330;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "herbalist_trick";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00018"] = {
			["ID"] = 18;
			["connectionsID"] = {
			};
			["event"] = "activate";
			["posX"] = 1020;
			["posY"] = 90;
			["script"] = "function Condition:onCheck(name, obj)\
   local player = getMC()\
\
   player:setState(\"blockItemUse\", true)\
   player:setState(\"disableAttack\", true)\
   player:setState(\"disableMove\", true)\
   player:setState(\"disableJump\", true)\
   player:setState(\"disableInteraction\", true)\
\
   local crouch = not player:getState(\"crouch\")\
   if crouch then\
      player:holsterWeapon()\
      player.animationsManager:playAction(\"idle_to_crouch_idle\")\
      runTimer(2, nil, function()\
         gameplayUI.billboardUI:setup(\"Cover\", string.format(\"Press '%s' on the hiding spot to stop hiding\", getButtonCurrentKeyName(\"ACTIVATE\")))\
         player:setState(\"disableInteraction\", false)\
      end, false)\
   else\
      player.animationsManager:playAction(\"crouch_idle_to_idle\")\
      runTimer(2, nil, function()\
         player:setDisableActionStates(false)\
      end, false)\
      gameplayUI.billboardUI:show(false)\
   end\
\
   player:setHeadLookingAllowed(not crouch)\
   player:setFeelVisible(not crouch)\
   player:setState(\"crouch\", crouch)\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "var:wait_act_1,var:wait_act_2";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00019"] = {
			["ID"] = 19;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -330;
			["posY"] = 600;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"herbalist_knowledge\", false)\
   self:writeLog(\"Knowledge\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "herbalist_knowledge";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00020"] = {
			["ID"] = 20;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = -90;
			["posY"] = 600;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"herbalist_sneaking\", false)\
   self:writeLog(\"Sneaking1\")\
   self:writeLog(\"Sneaking2\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "herbalist_sneaking";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00021"] = {
			["ID"] = 21;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 150;
			["posY"] = 600;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"herbalist_nature\", false)\
   self:writeLog(\"Nature1\")\
   self:writeLog(\"Nature2\")\
   self:writeLog(\"Nature3\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "herbalist_nature";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00022"] = {
			["ID"] = 22;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 1680;
			["posY"] = 240;
			["script"] = "function Condition:onCheck(name, obj)\
   self:setTopicVisible(\"herbalist_about_scalpers\", false)\
   self:writeLog(\"Finish\")\
   return true\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "herbalist_finish";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00024"] = {
			["ID"] = 24;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "dead";
			["posX"] = 1020;
			["posY"] = -270;
			["script"] = "function Condition:onCheck(name, obj)\
   local count = self:getParam(\"scalphunters_killed\") or 0\
   count = count + 1\
   self:setParam(\"scalphunters_killed\", count)\
   if count >= 9 or isDebug(\"quest\") then\
      self:writeLog(\"ScalphuntersKilled\")\
      self:setTopicVisible(\"herbalist_about_scalpers_alt\", true)\
      self:setTopicVisible(\"big_hat_reward_alt\", true)\
      return true\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "q_angrybugs_bandit_1,q_angrybugs_bandit_2,q_angrybugs_bandit_3,q_angrybugs_bandit_4,q_angrybugs_bandit_5,q_angrybugs_bandit_6,q_angrybugs_bandit_7,q_angrybugs_bandit_8,q_angrybugs_bandit_9,q_angrybugs_bandit_10";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["done"] = {
			["ID"] = 23;
			["connectionsID"] = {
				[1] = 22;
			};
			["name"] = "done";
			["posX"] = 1470;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local player = getMC()\
   if player:getState(\"crouch\") then\
      player:setState(\"disableInteraction\", true)\
      player.animationsManager:playAction(\"crouch_idle_to_idle\")\
      runTimer(2, nil, function()\
         player:setDisableActionStates(false)\
      end, false)\
      gameplayUI.billboardUI:show(false)\
      player:setHeadLookingAllowed(true)\
      player:setFeelVisible(true)\
      player:setState(\"crouch\", false)\
   end\
   self.q:bugsDespawn(getObj(self.spawn_1))\
   self.q:bugsDespawn(getObj(self.spawn_2))\
   self.q:bugsDespawn(getObj(self.spawn_3))\
   disableObject(self.wait_act_1)\
   disableObject(self.wait_act_2)\
   self:writeLog(\"Done\")\
   self:setTopicVisible(\"herbalist_finish\", true)\
   self:setTopicVisible(\"big_hat_reward\", true)\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 1920;
			["posY"] = -30;
			["script"] = "";
			["type"] = "step";
		};
		["got_shrooms"] = {
			["ID"] = 8;
			["connectionsID"] = {
				[1] = 6;
				[2] = 24;
			};
			["name"] = "got_shrooms";
			["posX"] = 360;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   for i=1,5 do\
      enableObject(\"q_angry_bugs_shroom_place_\"..i)\
      showObject(\"q_angry_bugs_shroom_place_\"..i)\
   end\
   self:writeLog(\"HaveShrooms\")\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["placed_shrooms"] = {
			["ID"] = 7;
			["connectionsID"] = {
				[1] = 11;
				[2] = 24;
			};
			["name"] = "placed_shrooms";
			["posX"] = 810;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self.q:highlightHidingSpots()\
   self:writeLog(\"PlacedShrooms\")\
   --TODO: redo the quest later so the invasion starts by itself.\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 1;
			["connectionsID"] = {
				[1] = 16;
				[2] = 24;
			};
			["name"] = "start";
			["posX"] = -540;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["trick"] = {
			["ID"] = 17;
			["connectionsID"] = {
				[1] = 8;
				[2] = 9;
				[3] = 24;
			};
			["name"] = "trick";
			["posX"] = -90;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   self:setTopicVisible(\"herbalist_trick\", false)\
   self:setTopicVisible(\"herbalist_about_scalpers\", true)\
   if hasPlayerItem(\"shroom_grenade.itm\", 5) then\
      self:goToStep(\"got_shrooms\")\
   end\
end\
\
function Step:onFinish()\
end\
\
";
			["type"] = "step";
		};
		["wait"] = {
			["ID"] = 12;
			["connectionsID"] = {
				[1] = 23;
			};
			["name"] = "wait";
			["posX"] = 1260;
			["posY"] = 270;
			["script"] = "function Step:onCheck()\
   return true\
end\
\
function Step:onStart()\
   local wait_act_1 = getObj(self.wait_act_1)\
   local wait_act_2 = getObj(self.wait_act_2)\
   wait_act_1:setMaterialVisible(\"placeholder\", false)\
   wait_act_2:setMaterialVisible(\"placeholder\", false)\
   self.q:waitSequence()\
end\
\
function Step:onFinish()\
end";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:setParam(\"vents_poisoned\", 0)\
   self:setParam(\"despawned\", 0)\
   self:setTopicVisible(\"herbalist_trick\", false)\
   self:setTopicVisible(\"herbalist_knowledge\", true) --these three are hidden by _trick\
   self:setTopicVisible(\"herbalist_sneaking\", true)\
   self:setTopicVisible(\"herbalist_nature\", true)\
   self:setTopicVisible(\"herbalist_about_scalpers\", false)\
   self:setTopicVisible(\"herbalist_about_scalpers_alt\", false)\
   self:setTopicVisible(\"herbalist_finish\", false)\
   self:setTopicVisible(\"big_hat_reward\", false)\
   self:setTopicVisible(\"big_hat_reward_alt\", false)\
   self:setTopicVisible(\"big_hat_about_scalpers\", true)\
\
   self:declareVar(\"start_trig_1\", \"q_angry_bugs_start\")\
   self:declareVar(\"start_trig_2\", \"q_angry_bugs_start_2\")\
   self:declareVar(\"shroom_act_1\", \"q_angry_bugs_shroom_place_1\")\
   self:declareVar(\"shroom_act_2\", \"q_angry_bugs_shroom_place_2\")\
   self:declareVar(\"shroom_act_3\", \"q_angry_bugs_shroom_place_3\")\
   self:declareVar(\"shroom_act_4\", \"q_angry_bugs_shroom_place_4\")\
   self:declareVar(\"shroom_act_5\", \"q_angry_bugs_shroom_place_5\")\
   self:declareVar(\"spawn_1\", \"q_angry_bugs_spawn_1\")\
   self:declareVar(\"spawn_2\", \"q_angry_bugs_spawn_2\")\
   self:declareVar(\"spawn_3\", \"q_angry_bugs_spawn_3\")\
   self:declareVar(\"target_1\", \"q_angry_bugs_target\")\
   self:declareVar(\"target_2\", \"q_angry_bugs_target_2\")\
   self:declareVar(\"wait_act_1\", \"q_angry_bugs_wait_1\")\
   self:declareVar(\"wait_act_2\", \"q_angry_bugs_wait_2\")\
   --through dialog\
   --big_hat gives flare/scamp/revolver ammo and junk tier 2 clothes\
   --herbalist gives a bit more flare/scamp/revolver ammo\
\
   local kill_requires = {}\
   for i=1,10 do\
      table.insert(kill_requires, \"q_angrybugs_bandit_\" .. i)\
   end\
   self:declareVar(\"kill_requires\", kill_requires)\
\
end\
\
function Quest:onStart()\
   self:setTopicVisible(\"herbalist_trick\", true)\
   if hasPlayerItem(\"stink_shroom.itm\", 2) then\
      self:goToStep(\"got_shrooms\")\
   end\
end\
\
function Quest:onFinish()\
   self:setTopicVisible(\"herbalist_trick\", false)\
end\
\
function Quest:OnLoadState()\
   if self:getActiveStepName() == \"placed_shrooms\" then\
      self:highlightHidingSpots()\
   elseif self:getActiveStepName() == \"wait\" then\
      self:waitSequence()\
      runTimer(2, self, self.bugsAttack, false)\
   elseif self:isFinished() and self:getParam(\"despawned\") < 3 then\
      self:bugsDespawn(getObj(self.spawn_1))\
      self:bugsDespawn(getObj(self.spawn_2))\
      self:bugsDespawn(getObj(self.spawn_3))\
   end\
end\
\
function Quest:getTopicVisible_have_shrooms()\
   return hasPlayerItem(\"stink_shroom.itm\", 2)\
end\
\
function Quest:highlightHidingSpots()\
   local wait_act_1 = getObj(self.wait_act_1)\
   local wait_act_2 = getObj(self.wait_act_2)\
   wait_act_1:addMaterial(\"placeholder\")\
   wait_act_1:setMaterialVisible(\"placeholder\", true)\
   wait_act_2:addMaterial(\"placeholder\")\
   wait_act_2:setMaterialVisible(\"placeholder\", true)\
   enableObject(self.wait_act_1)\
   enableObject(self.wait_act_2)\
end\
\
function Quest:waitSequence()\
   runTimer(3, nil, function()\
      activateObject(self.spawn_1)\
      activateObject(self.spawn_2)\
      activateObject(self.spawn_3)\
   end, false)\
   runTimer(5, self, self.bugsAttack, false)\
\
   runTimer(27, nil, function()\
      self:goToStep(\"done\")\
   end, false)\
end\
\
function Quest:bugsAttack()\
   local random = require \"random\"\
   local alive_bandits = {}\
   for _, banditName in ipairs(self.kill_requires) do\
      local bandit = getObj(banditName)\
      if not bandit:getState(\"dead\") then\
         table.insert(alive_bandits, bandit)\
      end\
   end\
\
   local target = getObj(self.target_1)\
   for _, obj in pairs(getObj(self.spawn_1).charactersSpawned) do\
      obj:setSpawnPos(target:getPose():getPos())\
      obj.senseScheduler:setCurEnemy(random.choice(alive_bandits))\
   end\
\
   for _, obj in pairs(getObj(self.spawn_2).charactersSpawned) do\
      obj:setSpawnPos(target:getPose():getPos())\
      obj.senseScheduler:setCurEnemy(random.choice(alive_bandits))\
   end\
\
   target = getObj(self.target_2)\
   for _, obj in pairs(getObj(self.spawn_3).charactersSpawned) do\
      obj:setSpawnPos(target:getPose():getPos())\
      obj.senseScheduler:setCurEnemy(random.choice(alive_bandits))\
   end\
end\
\
function Quest:bugsDespawn(spwn)\
   local index = 1\
   local timer\
   local function despawn()\
      if spwn.charactersSpawned[index] and not spwn.charactersSpawned[index]:getState(\"dead\") then\
         spwn.charactersSpawned[index].installer = nil\
         getScene():destroyEntity(spwn.charactersSpawned[index])\
         table.remove(spwn.charactersSpawned, index)\
      elseif index > 10 then\
         timer:stop()\
         self:setParam(\"despawned\", self:getParam(\"despawned\")+1)\
      else\
         index = index + 1\
      end\
   end\
   timer = runTimer(1, nil, despawn, true)\
end";
	["title"] = "Getting Rid Of Scalp Hunters";
}
return obj1
