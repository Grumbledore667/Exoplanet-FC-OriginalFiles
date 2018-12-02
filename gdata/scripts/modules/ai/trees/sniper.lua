-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["node_activate_00012"] = {
		["ID"] = 12;
		["class"] = "StateCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "activate";
		["posX"] = 1110;
		["posY"] = -150;
		["script"] = "stateName = \"activate\"";
	};
	["node_idle_00002"] = {
		["ID"] = 2;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "idle";
		["posX"] = 900;
		["posY"] = 360;
		["script"] = "local random = require \"random\"\
start_function = function(self)\
   local anim = random.choice(self:getBBVar(\"idleAnims\"))\
   self.animationsManager:playCycle(anim)\
   self:setOrientationFull(0)\
end\
running_function = true";
	};
	["node_init_00010"] = {
		["ID"] = 10;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "shouldInit";
		["link_type"] = false;
		["name"] = "init";
		["posX"] = 900;
		["posY"] = 180;
		["script"] = "start_function = function(self)\
   -- CNPC saves the weapon so just clear it\
   self:getInventory():destroyAllItems()\
   local item = self:getInventory():addItem(\"carbine.gun\")\
   self:getInventory():equipSlotWithItem(self:getWeaponSlot(), item.id, true)\
\
   local laser = self:createAspect(\"laser_red.sbg\")\
   laser:getPose():setParent(item:getPose())\
   laser:getPose():resetLocalPose()\
   laser:getPose():setLocalPos({x=0,y=3,z=-70})\
   local _ = 0.2\
   laser:getPose():setLocalScale({x=_,y=_,z=1})\
   --laser:getPose():setLocalRot({x=0,y=5,z=0})\
   laser:setVisible(false)\
   self:setBBVar(\"laser\", laser)\
\
   -- dirty hack to redirect changes from self to an empty table\
   local anims = setmetatable({__object=self.__object}, {__index=self})\
   require(\"characters.bandit\").CBandit.updateAnims(anims)\
\
   self:setBBVar(\"idleAnims\", anims.idleAnims)\
   self:setBBVar(\"aimAnim\", anims.aimAnim)\
end\
finish_function = function(self)\
   self:setBBVar(\"initDone\", true)\
end";
	};
	["node_isEnemyDetected_00003"] = {
		["ID"] = 3;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyDetected";
		["posX"] = 1110;
		["posY"] = -330;
		["script"] = "senseName = \"enemyDetect\"";
	};
	["node_isEnemyNotDetected_00004"] = {
		["ID"] = 4;
		["child"] = "isEnemyDetected";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 3;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isEnemyNotDetected";
		["posX"] = 870;
		["posY"] = -330;
		["script"] = "";
	};
	["node_isPlayerDetected_00007"] = {
		["ID"] = 7;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isPlayerDetected";
		["posX"] = 1110;
		["posY"] = -270;
		["script"] = "senseName = \"playerDetect\"";
	};
	["node_isPlayerDetected_00015"] = {
		["ID"] = 15;
		["class"] = "SenseCondition";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = "internal";
		["name"] = "isPlayerDetected";
		["posX"] = 1110;
		["posY"] = -90;
		["script"] = "senseName = \"playerDetect\"";
	};
	["node_isPlayerNotDetected_00008"] = {
		["ID"] = 8;
		["child"] = "isPlayerDetected";
		["class"] = "Invertor";
		["connectionsID"] = {
			[1] = 7;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "isPlayerNotDetected";
		["posX"] = 870;
		["posY"] = -270;
		["script"] = "";
	};
	["node_preventRestart_00017"] = {
		["ID"] = 17;
		["child"] = "shoot";
		["class"] = "ForceFailure";
		["connectionsID"] = {
			[1] = 11;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "preventRestart";
		["posX"] = 1170;
		["posY"] = 240;
		["script"] = "";
	};
	["node_root_00001"] = {
		["ID"] = 1;
		["children"] = {
			[1] = "init";
			[2] = "targetedAction";
			[3] = "idle";
		};
		["class"] = "DynamicGuardSelector";
		["connectionsID"] = {
			[1] = 2;
			[2] = 10;
			[3] = 13;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "root";
		["posX"] = 630;
		["posY"] = 270;
		["script"] = "";
	};
	["node_shoot_00011"] = {
		["ID"] = 11;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "activate";
		["link_type"] = false;
		["name"] = "shoot";
		["posX"] = 1410;
		["posY"] = 240;
		["script"] = "start_function = function(self)\
   local gun = self:getWeaponSlotItem()\
   if gun then\
      gun:setImpactPos(getPlayer():getPose():getPos())\
      self:OnItemActivateSafe(gun)\
   end\
   self:setState(\"activate\", false)\
end";
	};
	["node_shouldInit_00009"] = {
		["ID"] = 9;
		["class"] = "ConditionNode";
		["connectionsID"] = {
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shouldInit";
		["posX"] = 1110;
		["posY"] = -210;
		["script"] = "condition = function(self)\
   return not self:getBBVar(\"initDone\")\
end";
	};
	["node_shouldTarget_00014"] = {
		["ID"] = 14;
		["children"] = {
			[1] = "activate";
			[2] = "isPlayerDetected";
		};
		["class"] = "Selector";
		["connectionsID"] = {
			[1] = 12;
			[2] = 15;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "shouldTarget";
		["posX"] = 870;
		["posY"] = -120;
		["script"] = "";
	};
	["node_sniperBT_00000"] = {
		["ID"] = 0;
		["child"] = "root";
		["class"] = "BehaviorTree";
		["connectionsID"] = {
			[1] = 1;
		};
		["guard"] = "";
		["link_type"] = false;
		["name"] = "sniperBT";
		["posX"] = 360;
		["posY"] = 270;
		["script"] = "";
	};
	["node_target_00006"] = {
		["ID"] = 6;
		["class"] = "Action";
		["connectionsID"] = {
		};
		["guard"] = "isPlayerDetected";
		["link_type"] = false;
		["name"] = "target";
		["posX"] = 1170;
		["posY"] = 300;
		["script"] = "start_function = function(self)\
   self:setTarget(getPlayer())\
   self:getBBVar(\"laser\"):setVisible(true)\
   self.animationsManager:playCycle(self:getBBVar(\"aimAnim\"))\
\
   --local rotateBone = require(\"player\").CPlayer.rotateBone\
   local function rotateBone(obj, boneName, angles)\
      local rot = obj:getBonePose(boneName):getLocalRotQuat()\
      rot = quatRotateQuat(quatFromEuler(angles), rot)\
      obj:getBonePose(boneName):setLocalRotQuat(rot)\
   end\
   local function trackPlayer()\
      local camSlope = self:getBBVar(\"camSlope\") or 0\
      local playerPos = getPlayer():getPose():getPos()\
      local angle = math.abs(getTargetAngleDir(self, playerPos))\
      -- hacky but it works by making angle consistent\
      if self:getPose():getPos().y > playerPos.y then\
         angle = -angle\
      end\
      camSlope = mixF(camSlope, angle, getFrameTime() * 20)\
\
      self:setBBVar(\"camSlope\", camSlope)\
\
      local prefix = \"Man\"\
      if self:getPrefabName() == \"abori.cfg\" then\
         prefix = \"Bip001\"\
      end\
      --local y = mixF(10, 0.5, (getDistance(self:getPose():getPos(), getPlayer():getPose():getPos()) / 700))\
      local y = 0\
      rotateBone(self, prefix..\" Spine\" , {y=y, x=camSlope*0.2})\
      rotateBone(self, prefix..\" Spine1\", {y=y, x=camSlope*0.2})\
      rotateBone(self, prefix..\" Spine2\", {y=y, x=camSlope*0.5})\
\
      rotateBone(self, prefix..\" Neck\", {y=y, x=camSlope})\
      rotateBone(self, prefix..\" Head\", {y=y, x=camSlope})\
\
      rotateBone(self, prefix..\" L Clavicle\", {y=y, x=camSlope})\
      rotateBone(self, prefix..\" R Clavicle\", {y=y, x=camSlope})\
   end\
   local timer = runTimerAdv(0, true, trackPlayer, self)\
   self:setBBVar(\"camSlopeTimer\", timer)\
end\
running_function = true\
finish_function = function(self)\
   self:getBBVar(\"laser\"):setVisible(false)\
   self:getBBVar(\"camSlopeTimer\"):stop()\
   self:setBBVar(\"camSlopeTimer\", nil)\
   self:resetTarget()\
end\
";
	};
	["node_targetedAction_00013"] = {
		["ID"] = 13;
		["children"] = {
			[1] = "preventRestart";
			[2] = "target";
		};
		["class"] = "Parallel";
		["connectionsID"] = {
			[1] = 6;
			[2] = 17;
		};
		["guard"] = "shouldTarget";
		["link_type"] = false;
		["name"] = "targetedAction";
		["posX"] = 900;
		["posY"] = 270;
		["script"] = "orchestrator = \"resume\"\
policy = \"selector\"\
";
	};
}
return obj1
