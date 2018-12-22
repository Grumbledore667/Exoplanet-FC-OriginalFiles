local _module = {}

local ai = _module

ai["NodeState"]            = require "ai.NodeState"
ai["Node"]                 = require "ai.Node"
ai["BehaviorTree"]         = require "ai.BehaviorTree"
ai["Succeeder"]            = require "ai.Succeeder"
ai["Failer"]               = require "ai.Failer"
ai["Wait"]                 = require "ai.Wait"
ai["Action"]               = require "ai.Action"
ai["AnimatedAction"]       = require "ai.AnimatedAction"
ai["ConditionNode"]        = require "ai.ConditionNode"
ai["StateCondition"]       = require "ai.StateCondition"
ai["SenseCondition"]       = require "ai.SenseCondition"
ai["EventCondition"]       = require "ai.EventCondition"
ai["Decorator"]            = require "ai.Decorator"
ai["Repeater"]             = require "ai.Repeater"
ai["UntilSuccess"]         = require "ai.UntilSuccess"
ai["UntilFailure"]         = require "ai.UntilFailure"
ai["Invertor"]             = require "ai.Invertor"
ai["ForceSuccess"]         = require "ai.ForceSuccess"
ai["ForceFailure"]         = require "ai.ForceFailure"
ai["TimeLimiter"]          = require "ai.TimeLimiter"
ai["Composite"]            = require "ai.Composite"
ai["Sequence"]             = require "ai.Sequence"
ai["Probabilitor"]         = require "ai.Probabilitor"
ai["Randomizer"]           = require "ai.Randomizer"
ai["Selector"]             = require "ai.Selector"
ai["RandomSelector"]       = require "ai.RandomSelector"
ai["DynamicGuardSelector"] = require "ai.DynamicGuardSelector"
ai["Parallel"]             = require "ai.Parallel"

ai.utils = {}

function ai.utils.running_state()
   return true
end

function ai.utils.not_running_state()
   return false
end

function ai.utils.loadTree(path, entity)
   local ok, nodeList = pcall(require, path)
   if not ok then
      return nil
   end

   local initList = {}
   for _, node in pairs(nodeList) do
      if not node.link_type then
         -- don't add links
         initList[node.name] = node
      end
   end

   local rootNode
   local initializedNodes = {}

   -- load constructor arguments from script
   for name, nodeData in pairs(initList) do
      local vars = {}
      local chunkName = string.format( "tree: %s node(class: %s name: %s id: %d)",
         path, nodeData.class, nodeData.name, nodeData.ID)
      local f, err = loadstring("return " .. nodeData.script, chunkName)
      if not err then
         -- allow this in script: start_function = Entity.chase_start
         local env = setmetatable({Entity = entity}, {__index=_G})
         setfenv(f, env)
         vars = f() or vars
      elseif nodeData.script ~= "" then
         log(string.format("ERROR: faulty script in behavior tree %s, node %s:", path, name))
         log("  " .. err)
      end

      vars.name = name
      vars._preinit = true -- set preinit flag to silence some warnings

      -- assign entity to all nodes to future proof potential node features
      vars.entity = entity

      if nodeData.class == "Include" then
         initializedNodes[name] = ai.utils.loadTree(name, entity)
      else
         initializedNodes[name] = ai[nodeData.class](vars)
      end
      if nodeData.class == "BehaviorTree" then
         rootNode = initializedNodes[name]
      end
   end

   -- restore hierarchy
   for name, node in pairs(initializedNodes) do
      if initList[name].child then
         node.child = initializedNodes[initList[name].child]
      elseif initList[name].children then
         for _, child in ipairs(initList[name].children) do
            node:addChild(initializedNodes[child])
         end
      end
   end

   -- add guards
   for name, node in pairs(initializedNodes) do
      node._preinit = nil -- unset preinit flag
      if initList[name].guard ~= "" then
         node:addGuard(initializedNodes[initList[name].guard])
      end
   end

   return rootNode
end

return _module
