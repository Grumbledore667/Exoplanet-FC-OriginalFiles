-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "A list of survival hints.";
	["hidden"] = false;
	["logs"] = {
		["tutorial_1"] = "Hit '%s' to scan your surroundings. Use '%s' to interact with objects.";
		["tutorial_2"] = "You can switch camera  position with '%s' and height with '%s/%s' buttons.";
		["tutorial_3"] = "Check out 'Help' in the pause menu for keymap and more useful tips on crafting and survival.";
		["tutorial_4"] = "'%s' opens inventory. Right clicking an item opens up available actions, if there are any. Drag and drop an item from your inventory to the hotbar or press a hotbar key while hovering over it in order to assign it to the hotbar slot.";
		["tutorial_5"] = "Press '%s' to see your stats and needs. You have to keep yourself from being hungry, dehydrated and sleep deprived. You could try building a campfire from firewood, at which you'll be able to cook food and rest.";
		["tutorial_6"] = "Drinking water from natural sources is not a good idea: it's usually poisoned with heavy metals, bacteria and antigravium.";
		["tutorial_7"] = "Use inventory or hotbar to take out your weapon. Press '%s' to put it away.";
		["tutorial_8"] = "You need to find bottles with clean water, edible juicy plants or plants that filter it, such as Bluethorn.";
		["tutorial_9"] = "You can perform two different types of melee attacks by clicking '%s' or '%s'.";
	};
	["nodes"] = {
		["condition_00004"] = {
			["ID"] = 4;
			["connectionsID"] = {
				[1] = 2;
			};
			["event"] = "trigger_in";
			["posX"] = 870;
			["posY"] = 330;
			["script"] = "function Condition:onCheck(name, obj)\
   local triggerName = string.lower(name)\
   if stringx.startswith(triggerName, \"tutorial_\") then\
      log(\"TUTORIAL TRIGGER: \" .. triggerName)\
      if obj then obj:disable() end\
      local tipText = self:getLogString(triggerName)\
\
      if triggerName == \"tutorial_1\" then\
         tipText = string.format(tipText, getButtonCurrentKeyName(\"HOTBARQ\"), getButtonCurrentKeyName(\"ACTIVATE\"))\
      elseif triggerName == \"tutorial_2\" then\
         tipText = string.format(tipText, getButtonCurrentKeyName(\"CAMVIEW\"), getButtonCurrentKeyName(\"CAMUP\"), getButtonCurrentKeyName(\"CAMDOWN\"))\
      elseif triggerName == \"tutorial_4\" then\
         tipText = string.format(tipText, getButtonCurrentKeyName(\"INVENTORY\"))\
      elseif triggerName == \"tutorial_5\" then\
         tipText = string.format(tipText, getButtonCurrentKeyName(\"CHARACTER\"))\
      elseif triggerName == \"tutorial_7\" then\
         tipText = string.format(tipText, getButtonCurrentKeyName(\"HOLSTER\"))\
      elseif triggerName == \"tutorial_9\" then\
         tipText = string.format(tipText, getButtonCurrentKeyName(\"ATTACK\"), getButtonCurrentKeyName(\"AIM\"))\
      end\
\
      --First trigger event is fired during the starting scene - so it should be silent\
      if triggerName == \"tutorial_1\" or not getGameOption(\"tutorial\") then\
         self:writeLogSilent(tipText)\
      else\
         self:writeLog(tipText)\
      end\
\
      if getGameOption(\"tutorial\") then\
         gameplayUI.billboardUI:setup(\"Survival Tip\", tipText, 10)\
      else\
         log(\"While tutorial is disabled\")\
      end\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "*";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 2;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 1140;
			["posY"] = 360;
			["script"] = "";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 4;
			};
			["name"] = "start";
			["posX"] = 630;
			["posY"] = 360;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onStart()\
end\
\
function Quest:onFinish()\
end\
\
";
	["title"] = "Survival Guide";
}
return obj1
