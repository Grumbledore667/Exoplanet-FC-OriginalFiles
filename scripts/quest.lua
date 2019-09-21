local SkySystem     = (require "environment.sky").SkySystem
local oo = require "loop.simple"
local hierarchy = require "loop.hierarchy"

local stringx = require "pl.stringx"
local tablex = require "pl.tablex"
local f = require "fun"
local partial = f.partial

local ItemsData = (require "itemsData")
local ItemsDataRecipes = require "ItemsDataRecipes"
local ImmersiveUI = require "ui.immersiveUI"
local deb = require "global.debug"
local hlp = require "helpers"

function fakeQuestStartInfo(quest)
   gameplayUI:showQuestStartInfo("Quest '" .. quest.title .. "' started")
end

function isQuestStarted(quest_name)
   local q = getQuest(quest_name)
   if q then
      return q:isStarted()
   end
   return false
end

function isQuestActive(quest_name)
   local q = getQuest(quest_name)
   if q then
      return q:isActive()
   end
   return false
end

function isQuestFinished(quest_name)
   local q = getQuest(quest_name)
   if q then
      return q:isFinished()
   end
   return false
end

function isQuestStepFinished(quest_name, step_name)
   local q = getQuest(quest_name)
   if q then
      return q:isStepPassed(step_name)
   end
   return false
end

local newQuests = {}

function getQuest(quest_name)
   if quest_name then
      local quest = quests[quest_name]
      if not quest then
         log("getQuest(): no such quest: " .. quest_name)
      else
         return quest
      end
   else
      log("getQuest(): invalid quest_name: nil")
   end
   return nil
end

function getQuestTopicVisible(quest_name, topic)
   local q = getQuest(quest_name)
   if q then
      return q:getTopicVisible(topic)
   end
end

function getQuestActiveStepName(quest_name)
   local q = getQuest(quest_name)
   if q then
      return q:getActiveStepName()
   end
end

function startQuest(quest_name)
   local q = getQuest(quest_name)
   q:start()
end

function finishQuest(quest_name)
   local q = getQuest(quest_name)
   q:finish()
end

function getQuestById(quest_id)
   for _,quest in pairs(quests) do
      if quest.id == quest_id then
         return quest
      end
   end
   return nil
end

function goToQuestStep(quest_name, step_name, silent)
   local q = getQuest(quest_name)
   if q then
      q:goToStep(step_name, silent)
   end
end

function goToQuestStepTimer(quest_name, step_name, time, silent)
   local q = getQuest(quest_name)
   if q then
      q:goToStepTimer(step_name, time, silent)
   end
end

local CQuest = {
   dayStateCbParams = nil,
   log = "", --temp hack. FIXME: TODO: better system for quest log
}

function CQuest:getName()
   return self.name
end

function CQuest:declareVar(name, value)
   self._variables[name] = value
end

function CQuest:setParam(param, value)
   setQuestParam(self.name, param, value)
end

function CQuest:getParam(param)
   return getQuestParam(self.name, param)
end

function CQuest:setTopicVisible(topic, value)
   self:setParam("topic_" .. topic, value)
end

function CQuest:getTopicVisible(topic)
   if self["getTopicVisible_" .. topic] then
      return self["getTopicVisible_" .. topic](self) and self:getParam("topic_" .. topic)
   else
      return self:getParam("topic_" .. topic)
   end
end

function CQuest:isStarted()
   return self.activeStep ~= nil
end

-- TODO: think of a proper way to handle terminal quests
function CQuest:isTerminalFinished()
   return self:getActiveStepName() == "terminal_end"
end

function CQuest:isFinished()
   return self.activeStep == self.lastStep
end

function CQuest:isFailed()
   return self.failed
end

function CQuest:isActive()
   return self:isStarted() and not self:isFinished()
end

function CQuest:getActiveStep()
   return self.activeStep
end

function CQuest:getActiveStepName()
   if not self:isActive() then
      return ""
   end
   return self.activeStep.name
end

function CQuest:start()
   runTimer(0, self, self.startImediate, false)
end

function CQuest:startImediate()
   if not self:isStarted() then
      return self:tryStep(self.firstStep)
   end

   return true
end

function CQuest:finish()
   runTimer(0, self, self.finishImediate, false)
end

function CQuest:finishImediate()
   if self:isActive() then
      return self:tryStep(self.lastStep)
   end
   return self:isFinished()
end

function CQuest:fail()
   runTimer(0, self, self.failImediate, false)
end

function CQuest:failImediate()
   if not self:isActive() then
      return false
   end

   self:stepFinish(self.activeStep)

   self.failed = true

   if self.onFail then
      self:onFail()
   end

   log(string.format("quest failed: '%s'", self.name))
   gameplayUI:showQuestStopInfo("Quest '" .. self.title .. "' failed")

   return true
end

function CQuest:goToStep(step_name, silent)
   self:goToStepTimer(step_name, 0, silent)
end

function CQuest:goToStepTimer(step_name, time, silent)
   --Save this table and store for saving in CScene:OnSaveState
   if not self.stepTimers then self.stepTimers = {} end

   local function removePrevStepTimer()
      for i,v in ipairs(self.stepTimers) do
         if v.step_name == step_name then
            v.timer:stop()
            table.remove(self.stepTimers, i)
            break
         end
      end
   end
   removePrevStepTimer()

   local timer = runTimer(time, nil, function ()
      removePrevStepTimer()
      self:goToStepImediate(step_name, silent)
   end, false)

   table.insert(self.stepTimers, {timer = timer, step_name = step_name, silent = silent})
end

function CQuest:goToStepImediate(step_name, silent)
   if not self:isActive() then
      return false
   end

   return self:tryStep(self:getStep(step_name), silent)
end

function CQuest:goToStepAtDayState(dayState, stepName, waitCount)
   if not waitCount or waitCount < 1 then
      waitCount = 1
   end
   --Save this table and store for saving in CScene:OnSaveState
   if not self.dayStateCbParams then self.dayStateCbParams = {} end
   local params = {dayState = dayState, questName = self:getName(), stepName = stepName, waitCount = waitCount}
   local callback = SkySystem:subscribeDayStateChange(dayState, partial(self.onDayStateChange, self), params)
   params.callback = callback
   table.insert(self.dayStateCbParams, params)
end

function CQuest:onDayStateChange(dayState, params)
   if params.dayState == dayState then
      params.waitCount = params.waitCount - 1
      if params.waitCount == 0 then
         --find the same table, unsub and remove savedData
         for i,savedParams in ipairs(self.dayStateCbParams) do
            if params == savedParams then
               SkySystem:unsubscribeDayStateChange(savedParams.callback)
               table.remove(self.dayStateCbParams, i)
               break
            end
         end
         self:goToStepImediate(params.stepName)
      end
   end
end

function CQuest:isStepPassed(step_name)
   local step = self:getStep(step_name)

   if step == nil then
      return false
   end

   return step.status == "finished"
end

function CQuest:getStep(step_name)
   for _,node in pairs(self.nodes) do
      if node.type == "step" and node.name == step_name then
         return node
      end
   end

   return nil
end

function CQuest:tryStep(step, silent)
   if not step then
      return false
   end

   if not self.activeStep and step == self.firstStep then
      if self.onStart then self:onStart() end -- quest start CB

      self:stepStart(step)
      log(string.format("quest '%s' step change to: '%s'", self.name, step.name))
      self.activeStep = step
      self:enableActivators(false)
      self:enableListeners (true)
      self:setupQuestMarkers(true)
      log(string.format("quest start: '%s'", self.name))
      if not self.hidden then
         gameplayUI.journalUI:updateQuestsList()
         gameplayUI:showQuestStartInfo("Quest '" .. self.title .. "' started")
      end
      return true
   end

   if not self:leadsToStep(self.activeStep, step) then
      log("Error: Quest's Step incorrect order: quest: " .. self.name .. " step: " .. step.name)
      return false
   end

   if step.onCheck and not step:onCheck() then
      return false
   end

   self:stepFinish(self.activeStep)
   self:stepStart (step)

   log(string.format("quest '%s' step change to: '%s'", self.name, step.name))
   self.activeStep = step
   self:setupQuestMarkers(true)

   local localMult = self:getParam("expMult") or 1

   if self.activeStep == self.lastStep then
      self:stepFinish(self.activeStep)
      self:setTracked(false)

      if self.onFinish then self:onFinish() end -- quest finish CB

      log(string.format("quest completed: '%s'", self.name))
      if not self.hidden then
         gameplayUI.journalUI:updateQuestsList()
         gameplayUI:showQuestStopInfo("Quest '" .. self.title .. "' completed")
         getMC():addExp(getGlobalParam("expQuestFinish") * localMult)
      end
      runTimer(0, self, getScene():tryAutoSave(), false)
   else
      if not self.hidden then
         if not silent then
            gameplayUI.journalUI:updateQuestsList()
            gameplayUI:showQuestUpdateInfo("Quest '" .. self.title .. "' updated")
            getMC():addExp(getGlobalParam("expStepFinish") * localMult)
         end
      end
   end

   return true
end

function CQuest:stepStart(step)
   if step.onStart then
      step:onStart()
   end

   step.status = "started"

   for i=1,#step.transitions do
      step.transitions[i].enabled = true
   end
end

function CQuest:stepFinish(step)
   if step.onFinish then
      step:onFinish()
   end

   step.status = "finished"

   for i=1,#step.transitions do
      step.transitions[i].enabled = false
   end
end

function CQuest:leadsToStep(stepFrom, stepTo)
   if #stepFrom.connections == 0 then
      return false
   end

   local visited = {}
   local upNext = {stepFrom}
   while #upNext > 0 do
      local node = table.remove(upNext, 1)
      if not visited[node] then
         visited[node] = true
         for _, connectedNode in ipairs(node.connections) do
            if connectedNode == stepTo then
               return true
            else
               table.insert(upNext, connectedNode)
            end
         end
      end
   end
   return false
end

function CQuest:enableActivators(state)
   for _, node in ipairs(self.activators) do
      node.enabled = state
   end
end

function CQuest:enableSuperListeners(state)
   for _, node in ipairs(self.superListeners) do
      node.enabled = state
   end
end

function CQuest:enableListeners(state)
   for _, node in ipairs(self.listeners) do
      node.enabled = state
   end
   for _, node in ipairs(self.freeListeners) do
      node.enabled = state
   end
end

function CQuest:getLogString(entry)
   return (self.logs and self.logs[entry]) or entry
end

function CQuest:writeLogOnce(entry, ...)
   local paramName = "log_used_" .. entry
   local param = self:getParam(paramName)
   if not param then
      self:setParam(paramName, true)
      self:writeLog(entry, ...)
   end
end

function CQuest:writeLog(entry, ...)
   if self:isStarted() and not self.hidden then
      gameplayUI:showQuestLogUpdateInfo(self.title .. ": new journal entry")
   end

   self:writeLogSilent(entry, ...)
end

function CQuest:writeLogSilent(entry, ...)
   table.insert(self.logBuilder, {entry=entry, args=table.pack(...)})
   entry = string.format(self:getLogString(entry), ...)
   local sep = (#self.log > 0 or self.description ~= "") and "***" or ""
   self.log = self.log .. sep .. entry
   gameplayUI.journalUI:updateSelectedJournalQuestLog(self)
end

function CQuest:declareQuestMarkers(t)
   self.questMarkers = tablex.deepcopy(t)
end

function CQuest:setupQuestMarkers(destroyPrevious)
   if not self.questMarkers then return end
   if destroyPrevious then
      gameplayUI.mapUI:destroyActiveQuestMarkers(self)
   end

   local markers = self.questMarkers[self:getActiveStepName()]
   if markers then
      for _,params in pairs(markers) do
         gameplayUI.mapUI:mapAddQuestMarker(self, params, params.tip)
      end
   end
end

function CQuest:setTracked(state)
   self.tracked = state
   self:setMarkersVisible(state)
end

function CQuest:isTracked()
    return self.tracked
end

function CQuest:setMarkersVisible(state)
   local questWnd = gameplayUI.journalUI.quests:getChild(self:getName())
   questWnd:getChild("Checkbox"):setProperty("Selected", tostring(state))
   if state and not getGlobalParam("showQuestMarkers") then return end

   local markers = gameplayUI.mapUI.activeMarkers[self:getName()]
   if markers then
      for _,icons in ipairs(markers) do
         tablex.foreachi(icons, function(icon) icon:setVisible(state) end)
      end
   end
end

local CNode = oo.class()

function CNode:getQuest()
   return self.quest
end

function CNode:setParam(param, value)
   self:getQuest():setParam(param, value)
end

function CNode:getParam(param)
   return self:getQuest():getParam(param)
end

function CNode:getLogString(entry)
   return self:getQuest():getLogString(entry)
end

function CNode:writeLogOnce(entry, ...)
   self:getQuest():writeLogOnce(entry, ...)
end

function CNode:writeLog(entry, ...)
   self:getQuest():writeLog(entry, ...)
end

function CNode:writeLogSilent(entry, ...)
   self:getQuest():writeLogSilent(entry, ...)
end

function CNode:setTopicVisible(topic, value)
   self:getQuest():setTopicVisible(topic, value)
end

function CNode:getTopicVisible(topic)
   return self:getQuest():getTopicVisible(topic)
end

function CNode:goToStep(name, silent)
   self:getQuest():goToStep(name, silent)
end

function CNode:goToStepTimer(name, time, silent)
   self:getQuest():goToStepTimer(name, time, silent)
end

local CCondition = oo.class({}, CNode)
local CStep = oo.class({}, CNode)

function CStep:getName()
   return self.name
end


questSystem =
{
   questid = 0,
   eventSubscribers = {}
}

function questSystem:initQuest(name)
   local status, quest = deb.loadTableFromFile(kPathGlobalQuests .. name .. ".lua")
   if not status then
      log(string.format("ERROR: Can't load quest '%s':", name))
      log(quest)
      return nil
   end

   quests = quests or {}

   quests[name] = quest
   quest.name = name
   quest.id = self.questid
   quest.tracked = false
   quest.logBuilder = {}
   self.questid = self.questid + 1
   self:loadQuestScripts(quest)
end

-- quest.superListeners
function questSystem:restoreSuperListeners(quest)
   quest.superListeners = {}

   for _,node in pairs(quest.nodes) do
      if node.type == "condition" and node.supercondition then
         table.insert(quest.superListeners, node)
      end
   end
end

-- quest.activators
function questSystem:restoreActivators(quest)
   quest.activators = {}

   for _,node in pairs(quest.nodes) do
      if node.type == "condition" and not node.supercondition then
         local foundLink = false
         for _,node2 in pairs(quest.nodes) do
            for k3=1,#node2.connections do
               if node2.connections[k3] == node then
                  foundLink = true
               end
            end
         end
         if foundLink == false then
            if #node.connections > 0 and node.connections[1] == quest.firstStep then
               quest.activators[#quest.activators+1] = node
            end
         end
      end
   end
end

-- quest.freeListeners
function questSystem:restoreFreeListeners(quest)
   quest.freeListeners = {}

   for _,node in pairs(quest.nodes) do
      if node.type == "condition" and not node.supercondition then
         local foundLink = false
         for _,node2 in pairs(quest.nodes) do
            for k3=1,#node2.connections do
               if node2.connections[k3] == node then
                  foundLink = true
               end
            end
         end
         if foundLink == false then
            if #node.connections == 0 then
               quest.freeListeners[#quest.freeListeners+1] = node
            end
         end
      end
   end
end

-- quest.listeners
function questSystem:restoreListeners(quest)
   if not quest.listeners then
      quest.listeners = {}
   end

   for _,node in pairs(quest.nodes) do
      if node.type == "condition" and not node.supercondition then
         local foundLink = false
         for _,node2 in pairs(quest.nodes) do
            for k3=1,#node2.connections do
               if node2.connections[k3] == node then
                  foundLink = true
               end
            end
         end
         if foundLink == false then
            if #node.connections > 0 and node.connections[1] ~= quest.firstStep then
               quest.listeners[#quest.listeners+1] = node
            end
         end
      end
   end
end

-- quest.transitions
function questSystem:restoreTransitions(quest)
   if not quest.listeners then
      quest.listeners = {}
   end

   for _,node in pairs(quest.nodes) do
      if node.type == "step" then
         node.transitions = {}
         for i=1,#node.connections do
            if node.connections[i].type == "condition" then
               node.transitions[#node.transitions+1] = node.connections[i]
               quest.listeners[#quest.listeners+1] = node.connections[i]
            end
         end
      end
   end
end

function questSystem:initConditions(quest)
   for _,node in pairs(quest.nodes) do
      if node.type == "condition" then
         node.enabled = false
      end
   end

   quest:enableActivators(true)
   quest:enableSuperListeners(true)
end

function questSystem:getInputNodes(quest, target)
   local list = {}
   for _,node in pairs(quest.nodes) do
      for k2=1,#node.connections do
         if node.connections[k2] == target then
            table.insert(list, node)
         end
      end
   end
   return list
end

-- quest.firstStep
function questSystem:restoreFirstStep(quest)
   for _,node in pairs(quest.nodes) do
      local input = self:getInputNodes(quest, node)
      -- step without inputs
      if node.type == "step" and next(input) == nil then
         quest.firstStep = node
         return
      -- step with only conditions as inputs each without inputs
      elseif node.type == "step" then
         local badEnding = false
         for _,node2 in pairs(input) do
            if node2.type == "step" then
               badEnding = true
            elseif next(self:getInputNodes(quest, node2)) ~= nil then
               badEnding = true
            end
         end
         if not badEnding then
            quest.firstStep = node
            return
         end
      end
   end
end

-- quest.lastStep
function questSystem:restoreLastStep(quest)
   for _,node in pairs(quest.nodes) do
      if node.type == "step" then
         if #node.connections == 0 then
            quest.lastStep = node
            return
         end
      end
   end
end

function questSystem:restoreConnections(quest)
   for _,node in pairs(quest.nodes) do
      node.quest = quest -- back link

      node.connections = {}
      if node.connectionsID then
         for _,v in pairs(node.connectionsID) do
            node.connections[#node.connections+1] = self:findReference(quest.nodes, v)
         end
      end
   end
end

function questSystem:findReference(nodes, id)
   for _,node in pairs(nodes) do
      if node.ID == id then
         return node
      end
   end
   return nil
end

-- allows each quest to have its own quest-wide variables accessible from steps and
-- conditions. can be used to access declared global\quest params and many other things
local function generateVariableLookup(index)
   return function (self, key)
      if key ~= nil then
         -- first try variables
         local value = self.quest._variables[key]
         if value == nil then
            -- then try provided class (CStep, CCondition)
            value = index[key]
         end
         return value
      end
   end
end

local function loadObjScript(obj)
   -- need for proper execution of next loadstring script
   local chunkEnv = {
      ["Condition"] = obj,
      ["Step"] = obj,
      ["Quest"] = obj,
      ["stringx"] = stringx,
   }
   --TODO:FIXME:a better way to manage quest(and dialog) script environment
   setmetatable(chunkEnv, {__index=_G})
   local chunkName
   if obj.type == "condition" or obj.type == "step" then
      chunkName = string.format("quest name: %s node script(type: %s name: %s id: %d)",
         obj.quest.name, obj.type, tostring(obj.name), obj.ID)
   else
      chunkName = string.format("quest script name: %s", obj.name)
   end
   local chunk, err = loadstring(obj.script, chunkName)
   if chunk then
      setfenv(chunk, chunkEnv)
      chunk()
   else
      if obj.type and (obj.type == "condition" or obj.type == "step") then
         log(string.format("ERROR loading script for quest %s node ID %d", obj.quest.name, obj.ID))
      else
         log("ERROR loading script for quest " .. tostring(obj.name))
      end
      log(err)
   end
end

function questSystem:loadNodesScripts(quest)
   for _,node in pairs(quest.nodes) do
      local mt = {}
      if node.type == "condition" then
         loadObjScript(node)

         mt.__index = generateVariableLookup(CCondition)
         setmetatable(node, mt)
      elseif node.type == "step" then
         loadObjScript(node)

         mt.__index = generateVariableLookup(CStep)
         setmetatable(node, mt)
      end
   end
end

function questSystem:loadQuestScripts(quest)
   loadObjScript(quest)

   local mt = {}
   mt["__index"] = function (self, key)
      if key ~= nil then
         local value = self._variables[key]
         if value == nil then
            value = CQuest[key]
         end
         return value
      end
   end

   setmetatable(quest, mt)
   quest._variables = {q=quest}

   self:restoreConnections(quest)
   self:restoreFirstStep(quest)
   self:restoreLastStep(quest)
   self:restoreSuperListeners(quest)
   self:restoreActivators(quest)
   self:restoreFreeListeners(quest)
   self:restoreListeners(quest)
   self:restoreTransitions(quest)
   self:initConditions(quest)
   self:loadNodesScripts(quest)

   quest.activeStep = nil
   quest.failed = false

   for _,node in pairs(quest.nodes) do
      if node.type == "condition" then
         node.targetsAny = getWords(node.targetsAny)
         local targetsAll = getWords(node.targetsAll)
         node.targetsAll = {}

         for i=1,#targetsAll do
            node.targetsAll[ targetsAll[i] ] = 0
         end
      end
   end
end

---@type table<string, CNodeNew>
local newNodeClassMap = {}

local function declareNodeClass(className, members, super)
   members = members or {}
   members.className = className
   local class = oo.class(members, super)
   newNodeClassMap[className] = class
   return class
end

---@class CNodeNew
---@field className string
---@field name string
---@field ID number @unique ID
---@field suspended boolean
---@field quest CQuestNew
---@field parent CQuestNew | CPhase
---@field connections CConnection[]
local CNodeNew = declareNodeClass("CNodeNew", {
   --derived classes are responsible for calling parent's __init method
   __new = hierarchy.creator
})

function CNodeNew:__init(data)
   self.suspended = false
   if data then
      for k, v in pairs(data) do self[k] = v end
   end
end

function CNodeNew:logq(str)
   self.quest:logq(str)
end

function CNodeNew:logqf(fmt, ...)
   self.quest:logqf(fmt, ...)
end

---@class CNodeStart : CNodeNew
local CNodeStart = declareNodeClass("CNodeStart", {}, CNodeNew)
function CNodeStart:__init(data)
   CNodeNew.__init(self, data)
end

---@class CNodeFinish : CNodeNew
local CNodeFinish = declareNodeClass("CNodeFinish", {}, CNodeNew)
function CNodeFinish:__init(data)
   CNodeNew.__init(self, data)
end
---@class CFork : CNodeNew
local CFork = declareNodeClass("CFork", {}, CNodeNew)

local api = require "quest.api"
local op = require "pl.operator"

---@class CScriptCondition : CFork
---@field functionName string
---@field arguments any[] @arguments to pass to the function
---@field operator fun(a,b): boolean @operator function
---@field resultValue any @value to compare the result of the function to
local CScriptCondition = declareNodeClass("CScriptCondition", {}, CFork)

local function initArguments(variables, data)
   local arguments = {}
   local value
   for _, arg in ipairs(data.arguments) do
      if arg.type == "variable" then
         for _, v in pairs(variables) do
            if v.name == arg.value then
               value = v.value
               break
            end
         end
      else
         value = arg.value
      end
      table.insert(arguments, value)
   end
   return arguments
end

function CScriptCondition:__init(data)
   CFork.__init(self, data)
   local operatorName = api.operations[data.operator]
   self.operator = op[operatorName]
   self.arguments = initArguments(self.quest.variables, data)
end

---@class CScriptFunction : CNodeNew
local CScriptFunction = declareNodeClass("CScriptFunction", {}, CNodeNew)

function CScriptFunction:__init(data)
   CNodeNew.__init(self, data)
   self.arguments = initArguments(self.quest.variables, data)
end

---@class CShowTopic : CNodeNew
---@field topics string[]
local CShowTopic = declareNodeClass("CShowTopic", {}, CNodeNew)
function CShowTopic:__init(data)
   CNodeNew.__init(self, data)
   self.topics = data.topics
end

---@class CHideTopic : CShowTopic
local CHideTopic = declareNodeClass("CHideTopic", {}, CShowTopic)

---@class CLogEntry : CNodeNew
---@field log string @log id
local CLogEntry = declareNodeClass("CLogEntry", {}, CNodeNew)

function CLogEntry:__init(data)
   CNodeNew.__init(self, data)
   self.log = data.log
end

---@class CLogDescription : CLogEntry
local CLogDescription = declareNodeClass("CLogDescription", {}, CLogEntry)

---@class CLogSuccess : CLogEntry
local CLogSuccess = declareNodeClass("CLogSuccess", {}, CLogEntry)

---@class CLogFailure : CLogEntry
local CLogFailure = declareNodeClass("CLogFailure", {}, CLogEntry)

---@class CRewardExp : CNodeNew
---@field experience number
local CRewardExp = declareNodeClass("CRewardExp", {}, CNodeNew)

---@class RewardItem
---@field name string
---@field count number
local RewardItem

---@class CRewardItems : CNodeNew
---@field rewards RewardItem[]
local CRewardItems = declareNodeClass("CRewardItems", {}, CNodeNew)

---@class CRewardMoney : CRewardItems
local CRewardMoney = declareNodeClass("CRewardMoney", {}, CRewardItems)

---@class CConnection
---@field fromNode CNodeNew
---@field fromSlot number
---@field toNode CNodeNew
---@field toSlot number
---Describes a connection between two quest nodes
local CConnection = oo.class()

---@class CNodeAnd : CNodeNew
---@field suspendedSlots table<number, boolean>
---@field inputSlots number
local CNodeAnd = declareNodeClass("CNodeAnd", {}, CNodeNew)

function CNodeAnd:__init(data)
   CNodeNew.__init(self, data)
   self.suspendedSlots = {n=self.inputSlots}
end

---@class CNodeEvent : CNodeNew
---@field event string
local CNodeEvent = declareNodeClass("CNodeEvent", {}, CNodeNew)

---@class CWaitTrigger : CNodeEvent
---@field triggerName string
---@field objectType string
---@field objectName string
local CWaitTrigger = declareNodeClass("CWaitTrigger", {}, CNodeEvent)

---@class WaitTimeOfDay : CNodeNew
local WaitTimeOfDay = declareNodeClass("WaitTimeOfDay", {}, CNodeNew)

---@class CDiscuss : CNodeEvent
---@field topic string
---@field unhideTopic boolean
local CDiscuss = declareNodeClass("CDiscuss", {event="discuss"}, CNodeEvent)

---@class CNodeTimer : CNodeNew
local CNodeTimer = declareNodeClass("CNodeTimer", {}, CNodeNew)


---@class CLogData
---@field entry string
---@field args any[]
local CLogData

---@class CQuestNew
---@field name string @internal quest name
---@field title string @ingame quest name
---@field nodes CNodeNew[] @a list of all quest nodes
---@field startNode CNodeNew @the starting node of the quest
---@field finishNodes CNodeNew[] @quest will finish upon hitting one of those nodes
---@field started boolean @true if quest started (sets true on first description log entry)
---@field finished boolean @true if quest finished (sets true on success or fail log entry)
---@field finishedNode CNodeNew @the node which finished the quest. True if the quest is finished for real
---@field log string @legacy log storage
---@field logBuilder CLogData[] @list of log entries and their optional format arguments
---@field new boolean @indicates new quest system
local CQuestNew = oo.class()

function CQuestNew:__new(data)
   self = oo.rawnew(self, data)
   self.log = ""
   self.logBuilder = {}
   self.debugLogStrings = {}
   self.new = true
   return self
end

function CQuestNew:logq(str)
   table.insert(self.debugLogStrings, tostring(str))
end

function CQuestNew:logqf(fmt, ...)
   self:logq(string.format(fmt, ...))
end

---@param start CNodeNew
---@return fun():CNodeNew
local function walkBranch(start)
   return coroutine.wrap(function()
      ---@type CNodeNew[]
      local upNext = {start}
      local visited = {}
      while #upNext > 0 do
         ---@type CNodeNew
         local current = table.remove(upNext)
         if not visited[current] then
            visited[current] = true
            coroutine.yield(current)
            for i=#current.connections,1,-1 do
               table.insert(upNext, current.connections[i].toNode)
            end
         end
      end
   end)
end

local serializeNode, deserializeNode

---Walk node tree starting from startNode, depth-first, and get their saved data
---@param startNode CNodeNew
---@return table @a list of saved node states
local function saveQuestNodes(startNode)
   local nodes = {}
   for node in walkBranch(startNode) do
      local nodeState = {}
      serializeNode(node, nodeState)
      if next(nodeState) ~= nil then
         local nodeData = {
            ID = node.ID,
            nodeState = nodeState
         }
         table.insert(nodes, nodeData)
      end
   end
   return nodes
end

function CQuestNew:OnSaveState(state)
   state.nodes = saveQuestNodes(self.startNode)
   state.started = self.started
   state.hidden = self.hidden
   state.finished = self.finished
   if self.finished then
      state.finishedNodeID = self.finishedNode.ID
   end
   state.logBuilder = self.logBuilder
end

---Call OnLoadState for each node in nodes list that matches by id in savedNodeStates
---@param nodes CNodeNew[]
---@param savedNodeStates table @a list of saved node states
local function loadQuestNodes(nodes, savedNodeStates)
   if savedNodeStates and #savedNodeStates > 0 then
      local idMap = {}
      for _, n in pairs(nodes) do idMap[n.ID] = n end
      for _, nodeData in ipairs(savedNodeStates) do
         local node = idMap[nodeData.ID]
         deserializeNode(node, nodeData.nodeState)
      end
   end
end

function CQuestNew:OnLoadState(state)
   loadQuestNodes(self.nodes, state.nodes)
   self.started = state.started
   self.hidden = state.hidden
   self.finished = state.finished
   if self.finished then
      for _, fin in ipairs(self.finishNodes) do
         if fin.ID == state.finishedNodeID then
            self.finishedNode = fin
            break
         end
      end
   end
   self.logBuilder = state.logBuilder
end

local function loadNewQuestNodes(data, parent, quest)
   quest = quest or parent
   local ids = {}
   local nodes = {}
   local startNode
   local finishNodes = {}

   local vars = quest._variables
   local objs, groups = vars.objects, vars.groups
   for _, nodeData in require"orderedPairs".orderedPairs(data) do
      if nodeData.script and nodeData.script ~= "" then
         --local chunk = assert(loadstring(nodeData.script))
         local chunk = loadstring(nodeData.script)
         if chunk then
            local env = setmetatable(
               { node = nodeData, vars = vars, objs = objs, groups = groups },
               { __index = _G }
            )
            setfenv(chunk, env)
            chunk()
         end
      end
      local class = nodeData.class and newNodeClassMap[nodeData.class] or CNodeNew
      nodeData.parent = parent
      nodeData.quest = quest
      local node = class(nodeData)
      ids[node.ID] = node
      table.insert(nodes, node)
      if node.className == CNodeStart.className then
         startNode = node
      elseif node.className == CNodeFinish.className then
         table.insert(finishNodes, node)
      end
   end

   for _, node in ipairs(nodes) do
      local connections = {}
      for _, conData in ipairs(node.connectionsID) do
         local con = CConnection{
            fromNode = node,
            fromSlot = conData.fromSlot,
            toNode = ids[conData.toID],
            toSlot = conData.toSlot,
         }
         table.insert(connections, con)
      end
      node.connections = connections
   end

   table.sort(finishNodes, function(a, b) return a.posY < b.posY end)
   --reverse map nodes to their index
   for i, v in ipairs(finishNodes) do
      finishNodes[v] = i
   end
   return nodes, startNode, finishNodes
end

local function initNewQuest(testQuestName)
   local ok, questData = deb.loadTableFromFile(string.format("%snew/%s.lua", kPathGlobalQuests, testQuestName))
   if not ok then
      log(string.format("ERROR: Can't load quest '%s':", testQuestName))
      log(questData)
   else
      --local questChunk = assert(loadstring(questData.script))
      local questChunk = loadstring(questData.script)
      local variables = {objects={}, groups={}}
      if questChunk then
         local env = setmetatable(
            { Quest = questData, vars=variables, objs=variables.objects, groups=variables.groups },
            { __index = _G }
         )
         setfenv(questChunk, env)
         questChunk()
      end

      local quest = CQuestNew(questData)
      quest.name = testQuestName
      quest._variables = variables
      local nodes, startNode, finishNodes = loadNewQuestNodes(quest.nodes, quest)

      quest.nodes = nodes
      quest.startNode = startNode
      quest.finishNodes = finishNodes
      newQuests[quest.name] = quest
      quests[quest.name] = quest
      questSystem:loadQuestData(quest)
      return quest
   end
end

function questSystem:init()
   log("questSystem:init()")
   local quests_names = getFolderElements("\\gdata\\scripts\\quests\\*.lua", false, true)
   for i=1,#quests_names do
      if string.find(quests_names[i], "schematic") == nil then
         self:initQuest(string.gsub(quests_names[i], ".lua", ""))
      end
   end
   for _, q in pairs(quests) do
      questSystem:loadQuestData(q)
   end

   local helping_hands = initNewQuest("helping_hands")
   local open_sesame = initNewQuest("open_sesame")
   local greenbug = initNewQuest("greenbug")

   if not getScene():isLoadedGame() then
      getScene():subscribeOnLocationEnter(function()
         helping_hands:start()
         open_sesame:start()
         greenbug:start()
      end)
   end
end

function questSystem:loadQuestData(q)
   if q.topics then
      for _, topic in ipairs(q.topics) do
         q.topics[topic.name] = topic
         q:setTopicVisible(topic.name, topic.visible)
      end
   end
   if q.variables then
      local objects, groups = {}, {}
      for _, var in ipairs(q.variables) do
         if var.kind == "object" then
            table.insert(objects, var)
         elseif var.kind == "group" then
            table.insert(groups, var)
         else
            if var.kind == "item" and not ItemsData.isCorrectItemName(var.value) then
               local wrong_item_name = "ERROR: wrong item name in quest '%s' variable '%s': %s"
               log(string.format(wrong_item_name, q.name, var.name, var.value))
            end
         end
         q:declareVar(var.name, var.value)
      end
      if #objects > 0 or #groups > 0 then
         getScene():subscribeOnLocationEnter(function()
            local silent = isDebug("quest")
            local object_instances = q._variables.objects or {}
            q._variables.objects = object_instances
            for _, object_var in ipairs(objects) do
               if object_var.value then --Support uninitialized vars
                  object_instances[object_var.name] = getObj(object_var.value, silent)
               end
            end

            local group_instances = q._variables.groups or {}
            q._variables.groups = group_instances
            for _, group_var in ipairs(groups) do
               if group_var.value then --Support uninitialized vars
                  group_instances[group_var.name] = tablex.imap(getObj, getObjectsInGroupOrdered(group_var.value), silent)
               end
            end

            for index_name, target_group_name in pairs(q.group_indices or {}) do
               local index = q._variables[index_name]
               local group = group_instances[target_group_name]
               if index < 0 then
                  index = index + #group + 1
               end
               if group[index] then
                  -- put object name in a quest variable
                  q:declareVar(index_name, group[index]:getName())
                  -- ...and store object instance in .objects
                  object_instances[index_name] = group[index]
               elseif #group == 0 then
                  log(string.format("WARNING: trying to index empty group '%s'", target_group_name))
               else
                  log(string.format("WARNING: index '%s'(%d) not found in group '%s'", index_name, index, target_group_name))
               end
            end
         end)
      end
   end
   if q.onCreate then
      q:onCreate()
   end
end

CQuestNew.setTopicVisible = CQuest.setTopicVisible
CQuestNew.getTopicVisible = CQuest.getTopicVisible
CQuestNew.declareVar = CQuest.declareVar
CQuestNew.setParam = CQuest.setParam
CQuestNew.getParam = CQuest.getParam
CQuestNew.getName = CQuest.getName
CQuestNew.setTracked = CQuest.setTracked
CQuestNew.isTracked = CQuest.isTracked
CQuestNew.getLogString = CQuest.getLogString
CQuestNew.writeLog = CQuest.writeLog
CQuestNew.writeLogSilent = CQuest.writeLogSilent
CQuestNew.setupQuestMarkers = CQuest.setupQuestMarkers
CQuestNew.declareQuestMarkers = CQuest.declareQuestMarkers

function CQuestNew:start()
   self:advanceNode(self.startNode)
end
function CQuestNew:finish() end

function CQuestNew:isStarted()
   return self.started
end

function CQuestNew:isActive()
   return self:isStarted() and not self:isFinished()
end

function CQuestNew:isFinished()
   return self.finished
end

function CQuestNew:isTerminalFinished()
   return self:getTopicVisible("terminal_finish")
end

function CQuestNew:isFailed()
   return false
end

function CQuestNew:setMarkersVisible() end

function CQuestNew:getActiveStep()
end

function CNodeEvent:checkEvent(...)
   return not self.onCheck or self:onCheck(...)
end

local triggerEventMap = {
   inside = "trigger_in",
   next_entered = "trigger_in",
   outside = "trigger_out",
   next_exited = "trigger_out"
}

---Resets node data. Should handle being called multiple times well.
---@param node CNodeNew
---@param slot number
local function resetNode(node, slot)
   node.suspended = false
   local className = node.className
   if className == "CNodeAnd" then
      node.suspendedSlots = {n=node.inputSlots}
   elseif className == "CNodeEvent" or className == "CDiscuss" then
      if not node.callback then return end
      questSystem:unsubscribeEvent(node.event, node.callback)
      node.callback = nil
   elseif className == "WaitTimeOfDay" then
      if node.callback then
         SkySystem:unsubscribeDayStateChange(node.callback)
         node.callback = nil
      end
   elseif className == "CNodeTimer" then
      if node.callback then
         node.callback:stop()
         node.callback = nil
      end
   elseif className == "CWaitTrigger" then
      if not node.callback then return end
      questSystem:unsubscribeEvent(triggerEventMap[node.event], node.callback)
      node.callback = nil
   elseif className == "CPhase" then
      for _, child in ipairs(node.nodes) do
         resetNode(child)
      end
      node.finished = false
      node.finishedNode = nil
   end
end

local function getWaitTriggerObj(type, objectName)
   return type == "player" and getPlayer()
      or type == "main_character" and getMC()
      or type == "npc" and getObj(objectName)
end

--TODO: add skipEvent onSuspend param
---To be called from within node's evaluate method
---@param node CNodeNew
---@param slot number
local function suspendNode(node, slot)
   node:logq(node.name .. " suspends")
   node.suspended = true
   node:onSuspend()
   local className = node.className
   if className == "CNodeNew" then
   elseif className == "CNodeTimer" then
      if not node.duration then return end
      node.callback = runTimerAdv(node.duration, false, function()
         node:logq(node.name .. ": timer event arrived, advancing signal")
         resetNode(node)
         if #node.connections > 0 then
            node.parent:advanceSignal(unpack(node.connections))
         end
      end)
   elseif className == "WaitTimeOfDay" then
      --TODO: add selection choice
      --[[
      morning
      afternoon
      night
      midnight
      ]]
      node.callback = SkySystem:subscribeDayStateChange("night", function()
         log("WOLOLO")
         resetNode(node)
         if #node.connections > 0 then
            node.parent:advanceSignal(unpack(node.connections))
         end
      end)
   elseif className == "CNodeAnd" then
      node:checkSlot(slot)
   elseif className == "CNodeEvent" or className == "CDiscuss" then
      if not node.event then return end
      node.callback = questSystem:subscribeEvent(node.event, function(...)
         if not node:checkEvent(...) then
            return
         end
         node:logq(node.name .. ": matching event arrived, advancing signal")
         resetNode(node)
         if #node.connections > 0 then
            node.parent:advanceSignal(unpack(node.connections))
         end
      end)
      if className == "CDiscuss" then
         if node.unhideTopic then
            node:setTopicVisible(node.topic, true)
         end
      end
   elseif className == "CWaitTrigger" then
      local event = triggerEventMap[node.event]
      if not event then return end
      --Note that at the moment we can't use main_character object type because CTrigger supports only player or npc
      node.callback = questSystem:subscribeEvent(event, function(eventName, triggerName, triggerObj)
         if triggerName == node.triggerName and triggerObj and triggerObj.chars then
            local obj = getWaitTriggerObj(node.objectType, node.objectName)
            local inside = triggerObj.chars[obj]
            if (eventName == "trigger_in" and inside) or (eventName == "trigger_out" and not inside) then
               node:logq(node.name .. ": matching event arrived, advancing signal")
               resetNode(node)
               if #node.connections > 0 then
                  node.parent:advanceSignal(unpack(node.connections))
               end
            end
         end
      end)
   end
end

---Called when node doesn't suspend and just executes script
---@param node CNodeNew
---@param slot number
local function executeNode(node, slot)
   node:onExecute()
   local className = node.className
   if className == "CShowTopic" then
      for _, topic in ipairs(node.topics) do
         node:setTopicVisible(topic, true)
      end
   elseif className == "CHideTopic" then
      for _, topic in ipairs(node.topics) do
         node:setTopicVisible(topic, false)
      end
   elseif className == "CLogEntry" or className == "CLogFailure" then
      node:writeLog(node.log)
   elseif className == "CLogDescription" then
      node.quest.started = true
      node.quest.hidden = false
      node:writeLogSilent(node.log)
      gameplayUI.journalUI:updateQuestsList()
      gameplayUI:showQuestStartInfo("Quest '" .. node.quest.title .. "' started")
   elseif className == "CLogSuccess" then
      node:writeLog(node.log)
      node.quest.finished = true
      gameplayUI.journalUI:updateQuestsList()
      gameplayUI:showQuestStopInfo("Quest '" .. node.quest.title .. "' completed")
   elseif className == "CRewardExp" then
      getMC():addExp(node.experience)
   elseif className == "CRewardItems" or className == "CRewardMoney" then
      for _, entry in ipairs(node.rewards) do
         addItemToPlayer(entry.name, entry.count)
      end
   end
end

---Called every time advanceSignal walker goes over the node.
---Return connected nodes for the walker to pass the node, or nil if no connected nodes or
---if we do not want to propagate signal for any other reason.
---@param node CNodeNew
---@param slot number
---@return CConnection[]
local function evaluateNode(node, slot)
   executeNode(node, slot)
   local className = node.className
   if node.evaluate then
      return node:evaluate()
   elseif className == "CFork" then
      local path = {}
      local outSlot = node:onCheck() and 1 or 2
      for _, con in ipairs(node.connections) do
         if con.fromSlot == outSlot then
            table.insert(path, con)
         end
      end
      return path
   elseif className == "CNodeTimer" or className == "CNodeEvent" or className == "CDiscuss" or className == "WaitTimeOfDay" then
      if not node.suspended then
         suspendNode(node, slot)
      end
   elseif className == "CWaitTrigger" then
      if not node.suspended then
         if node.event == "inside" then
            local trigger = getObj(node.triggerName)
            local obj = getWaitTriggerObj(node.objectType, node.objectName)
            if trigger and trigger.chars and trigger.chars[obj] then
               return node.connections
            end
         elseif node.event == "outside" then
            local trigger = getObj(node.triggerName)
            local obj = getWaitTriggerObj(node.objectType, node.objectName)
            if trigger and trigger.chars and not trigger.chars[obj] then
               return node.connections
            end
         end
         suspendNode(node, slot)
      end
   elseif className == "CNodeAnd" then
      if node.suspended then
         node:checkSlot(slot)
         node:logq(node.name .. " suspended and evaluates signal")
      else
         suspendNode(node, slot)
      end
      if node.suspendedSlots.n <= 0 then
         return node.connections
      end
   elseif className == "CPhase" then
      if not node.suspended then
         CQuestNew.advanceSignal(node, CConnection{toNode=node.startNode})
         if node.finishedNode then
            return node:buildConnectionsForFinishNode(node.finishedNode)
         else
            suspendNode(node, slot)
         end
      end
   elseif className == "CScriptFunction" then
      local _G = _G
      local desc = api.functions[node.functionName]
      local func = desc.global and _G[node.functionName] or desc.func
      func(unpack(node.arguments))
      return node.connections
   elseif className == "CScriptCondition" then
      local _G = _G
      local path = {}
      local desc = api.functions[node.functionName]
      local func = desc.global and _G[node.functionName] or desc.func
      local result = func(unpack(node.arguments))

      local outSlot = node.operator(result, node.resultValue) and 1 or 2
      for _, con in ipairs(node.connections) do
         if con.fromSlot == outSlot then
            table.insert(path, con)
         end
      end
      return path
   else
      return node.connections
   end
end

---@param node CNodeNew
serializeNode = function(node, state)
   if node.suspended then
      state.suspended = true

      local className = node.className
      if className == "CNodeAnd" then
         state.suspendedSlots = node.suspendedSlots
      elseif className == "CNodeTimer" and node.callback then
         state.duration = node.callback:getTimeLeft()
      elseif className == "CPhase" then
         state.nodes = saveQuestNodes(node.startNode)
      end
   end
end

---@param node CNodeNew
deserializeNode = function(node, state)
   if state.suspended then
      node.suspended = true

      local className = node.className
      if className == "CNodeAnd" then
         node.suspendedSlots = state.suspendedSlots
      elseif className == "CNodeEvent" or className == "CDiscuss" or className == "CWaitTrigger" or className == "WaitTimeOfDay" then
         --note that suspendNode always calls onSuspend
         suspendNode(node)
      elseif className == "CNodeTimer" then
         node.duration = state.duration
         suspendNode(node)
      elseif className == "CPhase" then
         loadQuestNodes(node.nodes, state.nodes)
      end
   end
end

function CNodeNew:onSuspend() end
function CNodeNew:onExecute() end

function CNodeNew:setTopicVisible(topic, value)
   self.quest:setTopicVisible(topic, value)
end

function CNodeNew:setParam(param, value)
   self.quest:setParam(param, value)
end

function CNodeNew:getParam(param)
   return self.quest:getParam(param)
end

function CNodeNew:writeLog(entry, ...)
   return self.quest:writeLog(entry, ...)
end

function CNodeNew:writeLogSilent(entry, ...)
   return self.quest:writeLogSilent(entry, ...)
end

function CDiscuss:checkEvent(eventName, topicRaw)
   local questName, _, topic = stringx.partition(topicRaw, ':')
   return self.quest.name == questName and topic == self.topic
end

function CNodeAnd:checkSlot(slot)
   if not self.suspendedSlots[slot] then
      self.suspendedSlots[slot] = true
      self.suspendedSlots.n = self.suspendedSlots.n - 1
   end
end

---Helper for advanceSignal that accepts node without origin (fromNode)
---@param node CNodeNew
---@param slot number
function CQuestNew:advanceNode(node, slot)
   return self:advanceSignal(CConnection{toNode=node, toSlot=slot})
end

--TODO: instead of checking and asserting on recursive call, collect signals from recursive calls
--and process them after all other signals, possibly taking advantage of visited nodes table
--TODO: consider making possible to delay node evaluation like for a XOR gate case which needs to know
--if more than one of its inputs gave a signal during one signal frame to decide whether to propagate
---Start advancing signal propagation, executing and suspending nodes
---@param signal CConnection
function CQuestNew:advanceSignal(signal, ...)
   --assert(self.finishedNode == nil, "Can't advance finished quest")
   --assert(not self._advanceSignalRunning, "advanceSignal recursion forbidden")
   self._advanceSignalRunning = true
   ---@type CConnection[]
   local upNext = {signal, ...}
   local visited = {}
   while #upNext > 0 do
      local connection = table.remove(upNext)
      local current, slot = connection.toNode, connection.toSlot or 1
      if not visited[current] then
         visited[current] = true
         if self.finishNodes[current] then
            --finish node is not currently executed but start is.
            self:logq(current.name .. ": finish node")
            if self.onFinish then self:onFinish() end
            self.finished = true
            --this is here only as the fastest way to check which node was last in quest and phase
            self.finishedNode = current
            for _, n in ipairs(self.nodes) do
               if n.suspended then
                  resetNode(n)
               end
            end
            break
         end

         current:logq(current.name .. ": evaluating")
         local toPropagate = evaluateNode(current, slot)
         if toPropagate and #toPropagate > 0 then
            current:logq(current.name .. ": advancing signal")
            resetNode(current)
            for i = #toPropagate, 1, -1 do
               table.insert(upNext, toPropagate[i])
            end
         end
      end
   end
   self._advanceSignalRunning = false
end

---@class CPhase : CNodeNew
---@field finishedNode CNodeNew
---@field startNode CNodeNew
---@field finishNodes CNodeNew[]
local CPhase = declareNodeClass("CPhase", {}, CNodeNew)

function CPhase:__init(data)
   CNodeNew.__init(self, data)
   self.nodes, self.startNode, self.finishNodes = loadNewQuestNodes(data.nodes, self, self.quest)
end

function CPhase:buildConnectionsForFinishNode(finishNode)
   local slot = self.finishNodes[finishNode]
   self:logqf(" slot %d", slot)
   local connections = {}
   for _, con in ipairs(self.connections) do
      self:logqf(" fromSlot %d", con.fromSlot)
      if con.fromSlot == slot then
         table.insert(connections, con)
      end
   end
   return connections
end

function CPhase:advanceSignal(...)
   CQuestNew.advanceSignal(self, ...)
   if self.finishedNode then
      local connections = self:buildConnectionsForFinishNode(self.finishedNode)
      self:logq(self.name .. ": phase reached finish node, advancing signal")
      if #connections > 0 then
         self.parent:advanceSignal(unpack(connections))
      end
      resetNode(self)
   end
end

function CPhase:isFinished()
   return self.finished
end


function questSystem:checkCondition(condition, event_name, target_name, target_obj)
   if not condition.enabled then return false end
   if condition.event ~= event_name then return false end

   local function getVar(str)
      if stringx.startswith(str, "var:") then
         local var_name = stringx.split(str, ':')[2]
         local var_value = condition.q._variables[var_name]
         if var_value ~= nil and type(var_value) == "string" and var_value ~= "" then
            return var_value
         end
      end
      return str
   end

   local checkAny   = false
   local checkAll   = true
   local targetsAny = condition.targetsAny
   local targetsAll = condition.targetsAll

   -- check targets any
   for i=1,#targetsAny do
      if getVar(targetsAny[i]) == target_name or targetsAny[i] == '*' then
         checkAny = true
         break
      end
   end

   -- check targets all
   local found = false
   for k in pairs (targetsAll) do
      if getVar(k) == target_name then
         found = true
      end
   end

   if found then
      for k,v in pairs (targetsAll) do
         if getVar(k) == target_name then
            targetsAll[k] = targetsAll[k] + 1
            v = targetsAll[k]
         end
         if v == 0 then
            checkAll = false
         end
      end
   else
      checkAll = false
   end

   if ((checkAny and checkAll) or
        (#targetsAny == 0 and checkAll) or
        (checkAny and tablex.size(targetsAll) == 0) or
        (#targetsAny == 0 and tablex.size(targetsAll) == 0)) then
      local result = true

      if condition.onCheck then
         result = condition:onCheck(target_name, target_obj)
      end

      if result == true then
         condition.targetsCount = condition.targetsCount - 1
         if condition.targetsCount > 0 then
            result = false
         end
      end

      return result
   end

   return false
end

function questSystem:subscribeEvent(event_name, func, ...)
   self.eventSubscribers[event_name] = self.eventSubscribers[event_name] or {}
   local callback = {func=func, args=table.pack(...)}
   table.insert(self.eventSubscribers[event_name], callback)
   return callback
end

function questSystem:unsubscribeEvent(event_name, callback)
   local eventTable = self.eventSubscribers[event_name]
   if eventTable then
      local index = tablex.find(eventTable, callback)
      if index then
         table.remove(eventTable, index)
      end
   end
end

function questSystem:fireEvent(event_name, target_name, target_obj)
   runTimerAdv(0, false, self.fireEventImmediate, self, event_name, target_name, target_obj)
   local eventTable = self.eventSubscribers[event_name]
   if eventTable then
      for _, callback in ipairs(tablex.copy(eventTable)) do
         runTimerAdv(0, false, callback.func, event_name, target_name, target_obj, unpack(callback.args))
      end
   end
end

function questSystem:fireEventImmediate(event_name, target_name, target_obj)
   local specificQuest, target = splitQuestTopic(target_name or "")
   if specificQuest ~= nil and target ~= nil then
      local quest = getQuest(specificQuest)
      self:processEvent(quest, event_name, target, target_obj)
      local topic_data = quest.topics and quest.topics[target]
      if event_name == "discuss" and topic_data then
         if topic_data.log_id ~= "" then
            quest:writeLog(topic_data.log_id)
         end
         if topic_data.single_use then
            quest:setTopicVisible(topic_data.name, false)
         end
      end
   else
      for _,quest in pairs(quests) do
         self:processEvent(quest, event_name, target_name, target_obj)
      end
   end
end

function questSystem:processEvent(quest, event_name, target_name, target_obj)
   --process superListeners
   for _, node in ipairs(quest.superListeners or {}) do
      if self:checkCondition(node, event_name, target_name, target_obj) then
         node.enabled = false
      end
   end
   if not quest:isStarted() then -- process activators
      for _, node in ipairs(quest.activators or {}) do
         if self:checkCondition(node, event_name, target_name, target_obj) then
            quest:start()
            break
         end
      end
   elseif quest:isActive() then -- process listeners
      for _, node in ipairs(quest.freeListeners or {}) do
         if self:checkCondition(node, event_name, target_name, target_obj) then
            node.enabled = false
         end
      end

      local cur_step = quest:getActiveStep()
      if cur_step and cur_step.transitions then
         for _, node in ipairs(cur_step.transitions) do
            if self:checkCondition(node, event_name, target_name, target_obj) then
               if quest:tryStep(node.connections[1]) then
                  node.enabled = false
                  break
               end
            end
         end
      end
   end
end

function enableObjectCollisions(object_name)
   local object = getObj(object_name)
   if object then
      if object.setCollisionRaycast then
         object:setCollisionRaycast(true)
      end
      if object.setCollisionObjects then
         object:setCollisionObjects(true)
      end
      if object.setCollisionCharacters then
         object:setCollisionCharacters(true, true)
      end
   end
end

function disableObjectCollisions(object_name)
   local object = getObj(object_name)
   if object then
      if object.setCollisionRaycast then
         object:setCollisionRaycast(false)
      end
      if object.setCollisionObjects then
         object:setCollisionObjects(false)
      end
      if object.setCollisionCharacters then
         object:setCollisionCharacters(false, false)
      end
   end
end

function hideDisableObjectGroup(group_name, silent)
   local group = getObjectsInGroup(group_name, true)
   for _, name in ipairs(group) do
      local obj = getObj(name)
      if obj then --TODO:FIXME: for some reason you can't get omni (light sources) objects
         hideObject(name, silent)
         disableObjectCollisions(name, silent)
         disableObject(name, silent)
         if obj.stop then
            obj:stop()
         end
      end
   end
end

function showEnableObjectGroup(group_name, silent)
   local group = getObjectsInGroup(group_name, true)
   for _, name in ipairs(group) do
      local obj = getObj(name)
      if obj then
         showObject(name, silent)
         enableObjectCollisions(name, silent)
         enableObject(name, silent)
         if obj.play then
            obj:play()
         end
      end
   end
end

function enableObject(object_name, silent)
   local object = getObj(object_name)
   if object then
      if object.enable then
         object:enable()
      elseif not silent then
         log("ERROR: " .. object_name .. " lacks method 'disable'")
      end
   end
end

function disableObject(object_name, silent)
   local object = getObj(object_name)
   if object then
      if object.disable then
         object:disable()
      elseif not silent then
         log("ERROR: " .. object_name .. " lacks method 'disable'")
      end
   end
end

function showObject(object_name, silent)
   local object = getObj(object_name)
   if object then
      if object.setVisible then
         object:setVisible(true)
      elseif not silent then
         log("ERROR: " .. object_name .. " lacks method 'setVisible'")
      end
   end
end

function hideObject(object_name, silent)
   local object = getObj(object_name)
   if object then
      if object.setVisible then
         object:setVisible(false)
      elseif not silent then
         log("ERROR: " .. object_name .. " lacks method 'setVisible'")
      end
   end
end

function activateObject(object_name, silent)
   local object = getObj(object_name)
   if object then
      if object.activate then
         object:activate()
      elseif not silent then
         log("ERROR: " .. object_name .. " lacks method 'activate'")
      end
   end
end

function deactivateObject(object_name, silent)
   local object = getObj(object_name)
   if object then
      if object.deactivate then
         object:deactivate()
      elseif not silent then
         log("ERROR: " .. object_name .. " lacks method 'deactivate'")
      end
   end
end

function isObjectEnabled(object_name)
   local object = getObj(object_name)
   if object then
      return object:isEnabled()
   end
   return false
end

---Sorts given table IN-PLACE using natural alphanumeric sorting and returns it
---@param o table @a list-like table
---@return table
local function alphanumsort(o)
   local function padnum(d) local dec, n = string.match(d, "(%.?)0*(.+)")
      return #dec > 0 and ("%.12f"):format(d) or ("%s%03d%s"):format(dec, #n, n) end
   table.sort(o, function(a,b)
      return tostring(a):gsub("%.?%d+",padnum)..("%3d"):format(#b)
         < tostring(b):gsub("%.?%d+",padnum)..("%3d"):format(#a) end)
   return o
end

function getObjectsInGroupOrdered(groupName)
   local result = getObjectsInGroup(groupName, true)
   return alphanumsort(result)
end

function getLastObjectInOrderedGroup(groupName, silent)
   local t = getObjectsInGroupOrdered(groupName, silent)
   return t[#t]
end

--INVENTORIES AND ITEMS MANAGEMENT
function addItemToPlayer(itemName, count, qualityInt)
   return addItemToObj(itemName, getMC(), count, qualityInt)
end

function addMoneyToPlayer(count)
   return addItemToObj("antigravium_shards.itm", getMC(), count)
end

function addExpToPlayer(count)
   getMC():addExp(count)
end

function addItemToObj(itemName, obj, count, qualityInt)
   if not itemName or not obj then return nil end
   count = count or 1

   local item = obj:getInventory():addItem(itemName, count, qualityInt)
   if item and obj == getMC() then
      if count > 1 then
         gameplayUI:showInventoryPickInfo(count .. " " .. item:getLabel() .. " were added to Inventory")
      else
         gameplayUI:showInventoryPickInfo(item:getLabel() .. " was added to Inventory")
      end
   end
   return item
end

function removeItemFromPlayer(itemName, count, searchSimilar)
   return removeItemFromObj(itemName, getMC(), count, searchSimilar)
end

function removeItemFromObj(itemName, obj, count, searchSimilar)
   if not itemName or not obj then return nil end
   count = count or 1
   local label = ItemsData.getItemLabel(itemName)
   local result = obj:getInventory():destroyItemByName(itemName, count, true, false, searchSimilar)
   if result and obj == getMC() then
      if count > 1 then
         gameplayUI:showInventoryDropInfo(count.. " " .. label .. " were removed from Inventory")
      else
         gameplayUI:showInventoryDropInfo(label .. " was removed from Inventory")
      end
   end
   return result
end

function giveItemFromPlayerTo(itemName, obj, count)
   return giveItemFromObjTo(itemName, getMC(), obj, count)
end

function giveItemFromObjTo(itemName, obj1, obj2, count)
   if not itemName or not obj1 or not obj2 then return nil end
   count = count or 1
   local label = ItemsData.getItemLabel(itemName)
   local item = obj1:getInventory():giveItemToByName(itemName, obj2:getInventory(), count)
   if item and obj1 == getMC() then
      gameplayUI:showInventoryDropInfo("Gave " .. count .. " of " .. label)
   elseif item and obj2 == getMC() then
      gameplayUI:showInventoryDropInfo("Recieved " .. count .. " of " .. label)
   end
   return item
end

function giveTradeItemFromObjTo(itemName, obj1, obj2, count)
   if not itemName or not obj1 or not obj2 then return nil end
   count = count or 1
   local label = ItemsData.getItemLabel(itemName)
   local item = obj1:getTradeInventory():giveItemToByName(itemName, obj2:getInventory(), count)
   if item and obj2 == getMC() then
      gameplayUI:showInventoryDropInfo("Recieved " .. count .. " of " .. label)
   end
   return item
end

function useItemForPlayer(itemName, force)
   local player = getMC()
   local item = player:getInventory():getItemByName(itemName)
   player:useItem(item, force)
end

function equipItemForPlayer(itemName, slotId, silent)
   return equipItemForObj(itemName, slotId, getMC(), silent)
end

function equipItemForObj(itemName, slotId, obj, silent)
   if not itemName or not slotId or not obj then return nil end
   local item = obj:getInventory():getItemByName(itemName)
   if not item then return end
   obj:getInventory():equipSlotWithItem(slotId, item.id, silent)
   return true
end

function unequipSlotForPlayer(slotId, silent)
   return unequipSlotForObj(slotId, getMC(), silent)
end

function unequipSlotForObj(slotId, obj, silent)
   if not slotId or not obj then return nil end
   obj:getInventory():unequipSlot(slotId, silent)
   return true
end

function getPlayerItemCount(itemName)
   return getObjItemCount(itemName, getMC())
end

function getObjItemCount(itemName, obj)
   if not itemName or not obj then return nil end
   return obj:getInventory():getItemCountByName(itemName)
end

function hasPlayerItem(itemName, count)
   return hasObjItem(itemName, getMC(), count)
end

function hasObjItem(itemName, obj, count)
   if not itemName or not obj then return nil end
   count = count or 1
   return obj:getInventory():getItemCountByName(itemName) >= count
end

function hasPlayerBooze(count, strength)
   count = count or 1
   local items = getMC():getInventory():getItems()
   for i=1,#items do
      local boozeCount = 0
      if items[i]:isBooze() then
         if not strength or strength == items[i]:getBoozeStrength() then
            if count == 1 then
               return true
            else
               boozeCount = boozeCount + items[i]:getCount()
               if boozeCount >= count then
                  return true
               end
            end
         end
      end
   end
   return false
end

function getPlayerBooze(strength)
   local items = getMC():getInventory():getItems()
   local booze = {}
   for i=1,#items do
      if items[i]:isBooze() then
         if not strength or strength == items[i]:getBoozeStrength() then
            booze[items[i].name] = items[i]:getCount()
         end
      end
   end
   return booze
end

function removeBoozeFromPlayer(count, strength)
   count = count or 1
   if not hasPlayerBooze(count, strength) then return false end

   local booze = getPlayerBooze(strength)

   local getValue = ItemsData.getItemValue
   local sortedIterator = tablex.sort(booze, function(a, b) return getValue(a) < getValue(b) end)

   for name, playerCount in sortedIterator do
      if count > playerCount then
         removeItemFromPlayer(name, playerCount)
         count = count - playerCount
      else
         removeItemFromPlayer(name, count)
         return true
      end
   end
   return true
end

function learnRecipe(recipeName, silent)
   local recipeQuest = ItemsDataRecipes.getRecipeQuest()
   if recipeQuest then
      recipeQuest:learnRecipe(recipeName, silent)
   end
end

function isPlayerInTrigger(trigger)
   return getPlayer():isInTrigger(trigger)
end

function wasPlayerInTrigger(trigger)
   return getPlayer():isTriggerVisited(trigger)
end

function isDay()
   return SkySystem:isDay()
end

function isNight()
   return SkySystem:isNight()
end

---Teleport to another object or position
---@param obj any
---@param target vec3 | any
---@param ignoreRot boolean
function teleportTo(obj, target, ignoreRot)
   if not obj or not target then return end

   local objectPose, targetPose = obj:getPose(), target:getPose()

   if hlp.isGameEntity(target) then
      if not ignoreRot then
         if hlp.isCharacter(obj) then
            obj:setOrientationGlobal(getAnglesFromQuat(targetPose:getRotQuat()).y)
         else
            objectPose:setRotQuat(targetPose:getRotQuat())
         end
      end
      target = targetPose:getPos()
   end

   objectPose:setPos(target)
end

---Whether the obj or its new position is not near a player and therefore a teleportation is safe to perform
---@param obj any
---@param target vec3 | any
---@param distance number or 2000 by default
---@return boolean
function isObjectTeleportSafe(obj, target, distance)
   if not obj or not target then return end
   distance = distance or 2000

   local player = getPlayer()
   local playerPos = player:getPose():getPos()
   if not player then return true end

   if hlp.isGameEntity(target) then
      target = target:getPose():getPos()
   end

   return not objInDist(playerPos, obj:getPose():getPos(), distance) and not objInDist(playerPos, target, distance)
end

---Add status effect to the object
---@param obj CCharacter
---@param effectName string
---@param params table optional
---@return CStatusEffectBase
function addStatusEffectTo(obj, effectName, params)
   local t = tablex.deepcopy(params) or {}
   t.name = effectName
   return obj.statusEffectsManager:addStatusEffect(t)
end

function showGameplayUI(state)
   ImmersiveUI.showGameplayUI(state)
end
