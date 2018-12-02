-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "";
	["hidden"] = true;
	["nodes"] = {
		["condition_00000"] = {
			["ID"] = 0;
			["connectionsID"] = {
			};
			["event"] = "get";
			["posX"] = 420;
			["posY"] = 120;
			["script"] = "function Condition:onCheck(name, obj)\
   if not isDebug() then\
      for _, recipe in ipairs(self.recipes) do\
         if self.q:isRecipeReadyForCraft(recipe) then\
            local text = \"Click on 'CRAFT' button at the bottom of inventory to upgrade a Stick to a \\nCactus Bat\"\
            gameplayUI.annoyingHintUI:addTask(text, \"cactus\")\
            return true\
         end\
      end\
   end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "cactus_head.itm, firewood.itm, wooden_bat.wpn";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 570;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 1;
			["connectionsID"] = {
				[1] = 3;
			};
			["name"] = "start";
			["posX"] = 360;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   local ItemsDataRecipes = require \"itemsDataRecipes\"\
   self:declareVar(\"recipes\", ItemsDataRecipes.getItemRecipes(\"alien_cactus_bat.wpn\"))\
   self:start()\
end\
\
function Quest:onStart()\
end\
\
function Quest:onFinish()\
end\
\
\
function Quest:isRecipeReadyForCraft(recipe)\
   local player = getMC()\
   local ready = true\
   if not next(recipe) then return false end\
   for itemName, count in pairs(recipe) do\
      local item = player:getInventory():getItemByName(itemName)\
      if not item or item:getCount() < count then\
         ready = false\
         break\
      end\
   end\
   return ready\
end";
	["title"] = "";
}
return obj1
