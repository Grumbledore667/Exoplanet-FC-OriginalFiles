local stringx = require "pl.stringx"
local tablex = require "pl.tablex"

local coro = require "coroutines.helpers"

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
ai["CoroutineAction"]      = require "ai.CoroutineAction"
ai["ConditionNode"]        = require "ai.ConditionNode"
ai["StateCondition"]       = require "ai.StateCondition"
ai["SenseCondition"]       = require "ai.SenseCondition"
ai["Decorator"]            = require "ai.Decorator"
ai["Repeater"]             = require "ai.Repeater"
ai["UntilSuccess"]         = require "ai.UntilSuccess"
ai["UntilFailure"]         = require "ai.UntilFailure"
ai["Invertor"]             = require "ai.Invertor"
ai["ForceSuccess"]         = require "ai.ForceSuccess"
ai["ForceFailure"]         = require "ai.ForceFailure"
ai["Finisher"]             = require "ai.Finisher"
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

function ai.utils.ticker(entity)
   if entity.BT then
      entity.BT:tick()
   end
end

local function keysHaveNoCollisions(t1, t2)
   local diff = tablex.merge(t1, t2, false) -- intersection
   return tablex.size(diff) == 0, tablex.keys(diff)
end

-- maps node name to node data
local function fillInitList(nodeList)
   local initList = {}
   for _, node in pairs(nodeList) do
      if not node.link_type then
         -- don't add links
         initList[node.name] = node
      end
   end
   return initList
end

local function _iterBranch(root)
   if root.guard then
      coroutine.yield(root.guard)
      _iterBranch(root.guard)
   end
   if root.child then
      coroutine.yield(root.child)
      _iterBranch(root.child)
   end
   if root.children then
      for _, child in ipairs(root.children) do
         coroutine.yield(child)
         _iterBranch(child)
      end
   end
end

local function iterBranch(root)
   return coroutine.wrap(_iterBranch), root
end

ai.utils.iterBranch = iterBranch

local function cloneBranch(root)
   if root then
      local new = {}
      for k, v in pairs(root) do
         new[k] = v
      end
      new.guard = cloneBranch(root.guard)
      new.child = cloneBranch(root.child)
      if root.children then
         local cloned = {}
         for _, child in ipairs(root.children) do
            table.insert(cloned, cloneBranch(child))
         end
         new.children = cloned
      end
      return setmetatable(new, getmetatable(root))
   end
end

function ai.utils.loadTree(path, entity)
   local ok, nodeList = pcall(require, path)
   if not ok then
      return nil
   end

   local initList = fillInitList(nodeList)
   local externalInitList = {}

   local rootNode
   local initializedNodes = {}
   local externalNodes = {}

   -- load constructor arguments from script
   for name, nodeData in pairs(initList) do
      local vars = {}
      local chunkName = string.format("%s:%s\"%s\"@id %d",
         path, nodeData.class, nodeData.name, nodeData.ID)
      local f, err = loadstring(nodeData.script, chunkName)
      if not err then
         -- allow this in script: start_function = Entity.chase_start
         local env = setmetatable({Entity = entity, coro = coro}, {__index=_G})
         setfenv(f, env)
         f()
         vars = tablex.copy(env)
         vars.Entity = nil
      elseif nodeData.script ~= "" then
         log(string.format("ERROR: faulty script in behavior tree %s, node %s:", path, name))
         log("  " .. err)
      end

      vars.name = name
      vars._preinit = true -- set preinit flag to silence some warnings

      -- assign entity to all nodes to future proof potential node features
      vars.entity = entity

      if stringx.startswith(nodeData.class, "Include") then
         local includeNode, newExternalNodes, newExternalInitList = ai.utils.loadTree(name, entity)
         if nodeData.class == "IncludeTree" then
            initializedNodes[name] = includeNode.child -- skip BehaviorTree root node
         elseif nodeData.class == "IncludeNodes" then
            tablex.update(externalNodes, newExternalNodes)
            tablex.update(externalInitList, newExternalInitList)
         end
      else
         initializedNodes[name] = ai[nodeData.class](vars)
      end
      if nodeData.class == "BehaviorTree" then
         rootNode = initializedNodes[name]
      end
   end
   local noCols, diff = keysHaveNoCollisions(initializedNodes, externalNodes)
   if not noCols and isDebug() then
      local t = "INFO: tree %s overrides the following external nodes. Names:\n  %s"
      log(string.format(t, path, table.concat(diff, "\n  ")))
   end
   initializedNodes = tablex.update(externalNodes, initializedNodes)
   initList = tablex.update(externalInitList, initList)

   local function getNode(name)
      return initializedNodes[name]
   end

   -- restore hierarchy
   for name, node in pairs(initializedNodes) do
      local rawNode = initList[name]
      local childName, childrenNames = rawNode.child, rawNode.children

      if childName then
         node.child = getNode(childName)
      elseif childrenNames then
         for _, child in ipairs(childrenNames) do
            node:addChild(getNode(child))
         end
      end
   end

   -- add guards
   for name, node in pairs(initializedNodes) do
      node._preinit = nil -- unset preinit flag
      if initList[name].guard ~= "" then
         node:addGuard(getNode(initList[name].guard))
      end
   end

   rootNode = cloneBranch(rootNode)

   return rootNode, initializedNodes, initList
end

return _module