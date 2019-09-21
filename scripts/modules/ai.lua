local stringx = require "pl.stringx"
local tablex = require "pl.tablex"

local coro = require "coroutines.helpers"
local hlp = require "helpers"

local StackTracePlus
do
   -- suppress engine log errors when STP pcall require on lua5.2/5.3 modules absent in 5.1
   -- the way this works is lua allows to set hooks per lua_State but if we set a hook on the
   -- global lua state we'll lose engine error hook since we can't reset it from lua. but since
   -- lua coroutines are kind of like lua_State themselves internally, we can clear the hook on a
   -- coroutine to suppress forced engine error log, which will affect only code running within the
   -- coroutine.
   local silentRequire = coroutine.create(function()
      StackTracePlus = require "StackTracePlus"
   end)
   -- disable default engine error hook only for this coroutine
   debug.sethook(silentRequire)
   local ok, err = coroutine.resume(silentRequire)
   if not ok then
      -- global log might not be available at this point, so rely on engine error hook to log an error
      pcall(error, err)
   end
end

local _module = {}

local ai = _module

ai["NodeState"]            = require "ai.NodeState"
ai["Node"]                 = require "ai.Node"

ai.utils = {}

function ai.utils.running_state()
   return true
end

function ai.utils.not_running_state()
   return false
end

local lastTracebacks = {}

local function errorHandler(message)
   local STPstacktracer = StackTracePlus and StackTracePlus.stacktrace or debug.traceback

   local stacktrace = debug.traceback(message, 2)
   local uberstacktrace = lastTracebacks[stacktrace] or STPstacktracer(message, 2)
   if not lastTracebacks[stacktrace] then
      lastTracebacks[stacktrace] = uberstacktrace
      table.insert(lastTracebacks, stacktrace)
      if #lastTracebacks > 10 then
         lastTracebacks[table.remove(lastTracebacks, 1)] = nil
      end
      return uberstacktrace
   end
   return nil
end

function ai.utils.ticker(entity)
   local ok, err = xpcall(function()
      if entity.BT then
         entity.BT:tick()
      end
   end, errorHandler)
   if not ok then
      local name, class = hlp.getNameAndClass(entity)
      if entity.getDescriptiveName then
         name = entity:getDescriptiveName()
      end
      if err then
         log(string.format("\nAI ERROR: entity %s of class %s threw an error during an ai tick:", name, class))
         log(err)
      end
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
         local env = setmetatable({Entity = entity, coro = coro}, {__index=_G, __newindex=vars})
         setfenv(f, env)
         f()
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
         vars.className = nodeData.class
         initializedNodes[name] = ai.Node(vars)
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
         node.children = {}
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
