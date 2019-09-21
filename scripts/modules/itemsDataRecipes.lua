local tablex = require "pl.tablex"

local api = {}

api.decompose =
{
   ["decompose_beacon.itm"]           = { ["beacon_base.itm"] = 1, ["beacon_leaf.itm"] = 1, ["beacon_light.wpn"] = 1 },
   ["decompose_alien_cactus_bat.wpn"] = { ["firewood.itm"] = 1, ["cactus_head.itm"] = 1 },
   ["decompose_wooden_bat.wpn"]       = { ["firewood.itm"] = 1 },
   ["decompose_antigravium_bait.itm"] = { ["antigravium.itm"] = 1 },
}

api.compose =
{
   --These are learned by default - defined in the 'recipes' quest
   ["alien_cactus_bat_1"]  = { item = "alien_cactus_bat.wpn",  recipe = { ["firewood.itm"] = 1, ["cactus_head.itm"] = 1 } },
   ["alien_cactus_bat_2"]  = { item = "alien_cactus_bat.wpn",  recipe = { ["wooden_bat.wpn"] = 1, ["cactus_head.itm"] = 1 } },
   ["beacon_1"]            = { item = "beacon.itm",            recipe = { ["beacon_base.itm"] = 1, ["beacon_leaf.itm"] = 1, ["beacon_light.wpn"] = 1} },
   ["antigravium_bait_1"]  = { item = "antigravium_bait.itm",  recipe = { ["antigravium.itm"] = 1, ["melon.itm"] = 1 } },
   ["joint_1"]             = { item = "joint.itm",             recipe = { ["bluethorn_leaf.itm"] = 3 } },
   ["pure_water_bottle_1"] = { item = "pure_water_bottle.itm", recipe = { ["dirty_water_bottle.itm"] = 1, ["bluethorn_leaf.itm"] = 3 } },
   ["turret_1"]            = { item = "turret.itm",            recipe = { ["beacon_base.itm"] = 1, ["camera_basic.itm"] = 1, ["turret_ammo_box.itm"] = 1 } },
   ["energy_fence_1"]      = { item = "energy_fence.itm",      recipe = { ["beacon_base.itm"] = 1, ["scrap_electric.itm"] = 1, ["scrap_mechanical.itm"] = 1 } },
   ["bug_chipped_1"]       = { item = "bug_chipped.itm",       recipe = { ["bug.itm"] = 1, ["neurochip.itm"] = 1 } },
   -- { item = "turret.itm", recipe = { ["beacon_base.itm"] = 1, ["camera_strong.itm"] = 1, ["turret_ammo_box.itm"] = 1 } },

   --These are NOT learned by default
   ["kwagga_special_1"]    = { item = "kwagga_special.itm", recipe = { ["booze.itm"] = 1, ["absinthe.itm"] = 1, ["arphant_dung.itm"] = 1} },
}

function api.getRecipeQuest()
   return getQuest("recipes")
end

function api.isRecipeLearned(recipeName)
   local recipeQuest = api.getRecipeQuest()
   return recipeQuest and recipeQuest:getParam(recipeName) == true
end



function api.getDecomposeList()
   return api.decompose
end

function api.getDecomposeRecipe(itemName)
   local recipeName = "decompose_" .. itemName
   return api.isRecipeLearned(recipeName) and api.getDecomposeList()[recipeName]
end

function api.isItemDecomposable(itemName)
   local recipeName = "decompose_" .. itemName
   return api.getDecomposeList()[recipeName] and api.isRecipeLearned(recipeName)
end



function api.getComposeList()
   return api.compose
end

function api.getRecipeItemName(recipeName)
   return api.getComposeList()[recipeName] and api.getComposeList()[recipeName].item
end

function api.getItemRecipes(itemName)
   local recipes = {}
   for recipeName, recipeData in pairs(api.getComposeList()) do
      if itemName == recipeData.item and api.isRecipeLearned(recipeName) then
         table.insert(recipes, tablex.deepcopy(recipeData.recipe))
      end
   end
   return recipes
end

return api
