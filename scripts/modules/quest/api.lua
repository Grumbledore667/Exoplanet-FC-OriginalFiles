
local types = {
   "bool",
   "int",
   "float",
   "str",
   "any",
}

local operations = {
   ["=="] = "eq",
   ["~="] = "neq",
   ["<"] = "lt",
   ["<="] = "le",
   [">"] = "gt",
   [">="] = "ge",
}

local functions = {
   {
      name = "hasPlayerItem",
      global = true,
      arguments = {
         {
            name = "itemName",
            type = "str",
         },
         {
            name = "count",
            type = "int",
            default = 1,
         }
      },
      returnType = "bool"
   },
   {
      name = "showObject",
      global = true,
      arguments = {
         {
            name = "objectName",
            type = "str",
         }
      }
   },
   {
      name = "hideObject",
      global = true,
      arguments = {
         {
            name = "objectName",
            type = "str",
         }
      }
   },
   {
      name = "enableObject",
      global = true,
      arguments = {
         {
            name = "objectName",
            type = "str",
         }
      }
   },
   {
      name = "disableObject",
      global = true,
      arguments = {
         {
            name = "objectName",
            type = "str",
         }
      }
   },
   {
      name = "activateObject",
      global = true,
      arguments = {
         {
            name = "objectName",
            type = "str",
         }
      }
   },
   {
      name = "deactivateObject",
      global = true,
      arguments = {
         {
            name = "objectName",
            type = "str",
         }
      }
   },
   {
      name = "getGlobalParam",
      global = true,
      arguments = {
         {
            name = "paramName",
            type = "str",
         }
      },
      returnType = "any",
   },
   {
      name = "getQuestParam",
      global = true,
      arguments = {
         {
            name = "questName",
            type = "str",
         },
         {
            name = "paramName",
            type = "str",
         }
      },
      returnType = "any",
   },
   {
      name = "enableObjectCollisions",
      global = true,
      arguments = {
         {
            name = "objectName",
            type = "str",
         },
      }
   },
   {
      name = "disableObjectCollisions",
      global = true,
      arguments = {
         {
            name = "objectName",
            type = "str",
         },
      }
   },
   {
      name = "hideDisableObjectGroup",
      global = true,
      arguments = {
         {
            name = "groupName",
            type = "str",
         },
      }
   },
   {
      name = "showEnableObjectGroup",
      global = true,
      arguments = {
         {
            name = "groupName",
            type = "str",
         },
      }
   },
   {
      name = "isObjectEnabled",
      global = true,
      arguments = {
         {
            name = "objectName",
            type = "str",
         },
      },
      returnType = "bool",
   },
   {
      name = "removeItemFromPlayer",
      global = true,
      arguments = {
         {
            name = "itemName",
            type = "str",
         },
         {
            name = "count",
            type = "int",
            default = 1,
         },
         {
            name = "searchSimilar",
            type = "bool",
            default = false,
         },
      }
   },
   {
      name = "useItemForPlayer",
      global = true,
      arguments = {
         {
            name = "itemName",
            type = "str",
         },
      }
   },
   {
      name = "equipItemForPlayer",
      global = true,
      arguments = {
         {
            name = "itemName",
            type = "str",
         },
         {
            name = "slotId",
            type = "int",
         },
      }
   },
   {
      name = "unequipSlotForPlayer",
      global = true,
      arguments = {
         {
            name = "slotId",
            type = "int",
         },
      }
   },
   {
      name = "getPlayerItemCount",
      global = true,
      arguments = {
         {
            name = "itemName",
            type = "str",
         },
      },
      returnType = "int",
   },
   {
      name = "hasPlayerBooze",
      global = true,
      arguments = {
         {
            name = "count",
            type = "int",
            default = 1,
         },
         {
            name = "strength",
            type = "str",
            optional = true,
         },
      },
      returnType = "bool",
   },
   {
      name = "removeBoozeFromPlayer",
      global = true,
      arguments = {
         {
            name = "count",
            type = "int",
            default = 1,
         },
         {
            name = "strength",
            type = "str",
            optional = true,
         },
      }
   },
   {
      name = "learnRecipe",
      global = true,
      arguments = {
         {
            name = "recipeName",
            type = "str",
         },
      }
   },
   {
      name = "playerInDist",
      arguments = {
         {
            name = "objectName",
            type = "str",
         },
         {
            name = "distance",
            type = "float",
         },
         {
            name = "onlyJackBody",
            type = "bool",
            default = false,
         },
      },
      func = function(objectName, distance, onlyJackBody)
         local player = onlyJackBody and getMC() or getPlayer()
         return objInDist(player:getPose():getPos(), getObj(objectName):getPose():getPos(), distance)
      end,
      returnType = "bool",
   },
   {
      name = "wasPlayerInTrigger",
      global = true,
      arguments = {
         {
            name = "trigger",
            type = "str",
         },
      },
      returnType = "bool",
   },
   {
      name = "isDay",
      global = true,
      arguments = {},
      returnType = "bool",
   },
   {
      name = "isNight",
      global = true,
      arguments = {},
      returnType = "bool",
   },
}

for _, v in ipairs(functions) do
   functions[v.name] = v
end

return {
   types = types,
   operations = operations,
   functions = functions,
}
