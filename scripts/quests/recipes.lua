-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "";
	["hidden"] = true;
	["nodes"] = {
		["condition_00003"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 330;
			["posY"] = 120;
			["script"] = "function Condition:onCheck(name, obj)\
   local stringx = require \"pl.stringx\"\
   local prefix = \"learn_recipe_\"\
   if stringx.startswith(name, prefix) then\
      local recipeName = string.gsub(name, prefix, \"\")\
      self.q:learnRecipe(recipeName, false)\
   end\
   return false\
end\
";
			["targetsAll"] = "";
			["targetsAny"] = "*";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00004"] = {
			["ID"] = 4;
			["connectionsID"] = {
			};
			["event"] = "learn_recipe";
			["posX"] = 570;
			["posY"] = 120;
			["script"] = "function Condition:onCheck(name, obj)\
   self.q:learnRecipe(name, false)\
   return false\
end\
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
			["posX"] = 630;
			["posY"] = 300;
			["script"] = "";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 0;
			["connectionsID"] = {
				[1] = 2;
			};
			["name"] = "start";
			["posX"] = 300;
			["posY"] = 300;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:declareVar(\"reward\", 100)\
   self:setParam(\"decompose_beacon.itm\", true)\
   self:setParam(\"decompose_alien_cactus_bat.wpn\", true)\
   self:setParam(\"decompose_wooden_bat.wpn\", true)\
   self:setParam(\"decompose_antigravium_bait.itm\", true)\
\
   self:setParam(\"alien_cactus_bat_1\", true)\
   self:setParam(\"alien_cactus_bat_2\", true)\
   self:setParam(\"beacon_1\", true)\
   self:setParam(\"antigravium_bait_1\", true)\
   self:setParam(\"joint_1\", true)\
   self:setParam(\"pure_water_bottle_1\", true)\
   self:setParam(\"turret_1\", true)\
   self:setParam(\"energy_fence_1\", true)\
   self:setParam(\"bug_chipped_1\", true)\
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
function Quest:learnRecipe(recipeName, silent)\
   if self:getParam(recipeName) ~= true then\
      local ItemsData = require \"itemsData\"\
      local ItemsDataRecipes = require \"itemsDataRecipes\"\
      local itemLabel = ItemsData.getItemLabel(ItemsDataRecipes.getRecipeItemName(recipeName))\
      self:setParam(recipeName, true)\
      if not silent then\
         gameplayUI:showInfoTextEx(\"Learned a recipe for \" .. itemLabel, \"minor\", \"Play_journal_update\")\
         addExpToPlayer(self.reward)\
      end\
      if gameplayUI.craftUI:isVisible() then\
         gameplayUI.craftUI:setup()\
      end\
   end\
end\
\
";
	["title"] = "Experience";
}
return obj1
