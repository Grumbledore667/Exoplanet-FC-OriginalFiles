local SkySystem     = (require "environment.sky").SkySystem
local oo = require "loop.simple"

local stringx = require "pl.stringx"
local tablex = require "pl.tablex"
local f = require "fun"
local partial = f.partial

local ItemsData = (require "itemsData")
local ItemsDataRecipes = require "ItemsDataRecipes"
local ImmersiveUI = require "ui.immersiveUI"
local deb = require "global.debug"

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

function getQuest(quest_name)
   for k,quest in pairs(quests) do
      if k == quest_name then
         return quest
      end
   end
   if quest_name then
      log("getQuest(): no such quest: " .. quest_name)
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
   for k,quest in pairs(quests) do
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
   table.insert(self.dayStateCbParams, callback.args[1])
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
   for k,node in pairs(self.nodes) do
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

   for i=1,#stepFrom.connections do
      if stepFrom.connections[i] == stepTo then
         return true
      else
         if self:leadsToStep(stepFrom.connections[i], stepTo) then
            return true
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

function CQuest:writeLog(entry, ...)
   if self:isStarted() and not self.hidden then
      gameplayUI:showQuestLogUpdateInfo(self.title .. ": new journal entry")
   end

   self:writeLogSilent(entry, ...)
end

function CQuest:writeLogSilent(entry, ...)
   entry = string.format(self:getLogString(entry), ...)
   self.log = self.log .. "***" .. entry
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

   for k1,node in pairs(quest.nodes) do
      if node.type == "condition" and not node.supercondition then
         local foundLink = false
         for k2,node2 in pairs(quest.nodes) do
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

   for k1,node in pairs(quest.nodes) do
      if node.type == "condition" and not node.supercondition then
         local foundLink = false
         for k2,node2 in pairs(quest.nodes) do
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

   for k1,node in pairs(quest.nodes) do
      if node.type == "condition" and not node.supercondition then
         local foundLink = false
         for k2,node2 in pairs(quest.nodes) do
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

   for k1,node in pairs(quest.nodes) do
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
   for k1,node in pairs(quest.nodes) do
      if node.type == "condition" then
         node.enabled = false
      end
   end

   quest:enableActivators(true)
   quest:enableSuperListeners(true)
end

function questSystem:getInputNodes(quest, target)
   local list = {}
   for k1,node in pairs(quest.nodes) do
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
   for k1,node in pairs(quest.nodes) do
      local input = self:getInputNodes(quest, node)
      -- step without inputs
      if node.type == "step" and next(input) == nil then
         quest.firstStep = node
         return
      -- step with only conditions as inputs each without inputs
      elseif node.type == "step" then
         local badEnding = false
         for k2,node2 in pairs(input) do
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
   for k1,node in pairs(quest.nodes) do
      if node.type == "step" then
         if #node.connections == 0 then
            quest.lastStep = node
            return
         end
      end
   end
end

function questSystem:restoreConnections(quest)
   for nk,node in pairs(quest.nodes) do
      node.quest = quest -- back link

      node.connections = {}
      if node.connectionsID then
         for k,v in pairs(node.connectionsID) do
            node.connections[#node.connections+1] = self:findReference(quest.nodes, v)
         end
      end
   end
end

function questSystem:findReference(nodes, id)
   for k,node in pairs(nodes) do
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
   for k,node in pairs(quest.nodes) do
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

   for k,node in pairs(quest.nodes) do
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

function questSystem:init()
   log("questSystem:init()")
   local quests_names = getFolderElements("\\gdata\\scripts\\quests\\*.lua", false, true)
   for i=1,#quests_names do
      if string.find(quests_names[i], "schematic") == nil then
         self:initQuest(string.gsub(quests_names[i], ".lua", ""))
      end
   end
   for _, q in pairs(quests) do
      if q.onCreate then
         q:onCreate()
      end
   end
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
      table.remove(eventTable, index)
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
      self:processEvent(getQuest(specificQuest), event_name, target, target_obj)
   else
      for _,quest in pairs(quests) do
         self:processEvent(quest, event_name, target_name, target_obj)
      end
   end
end

function questSystem:processEvent(quest, event_name, target_name, target_obj)
   --process superListeners
   for _, node in ipairs(quest.superListeners) do
      if self:checkCondition(node, event_name, target_name, target_obj) then
         node.enabled = false
      end
   end
   if not quest:isStarted() then -- process activators
      for _, node in ipairs(quest.activators) do
         if self:checkCondition(node, event_name, target_name, target_obj) then
            quest:start()
            break
         end
      end
   elseif quest:isActive() then -- process listeners
      for _, node in ipairs(quest.freeListeners) do
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
      elseif object.setDisabled then
         object:setDisabled(false)
      elseif not silent then
         log("ERROR: " .. object_name .. " lacks method 'disable' or 'setDisabled'")
      end
   end
end

function disableObject(object_name, silent)
   local object = getObj(object_name)
   if object then
      if object.disable then
         object:disable()
      elseif object.setDisabled then
         object:setDisabled(true)
      elseif not silent then
         log("ERROR: " .. object_name .. " lacks method 'disable' or 'setDisabled'")
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

function moveObjectTo(object_name, target_name)
   local object = getObj(object_name)
   local target = getObj(target_name)

   if object and target then
      local objectPose, targetPose = object:getPose(), target:getPose()
      objectPose:setPos(targetPose:getPos())
      objectPose:setRotQuat(targetPose:getRotQuat())
      return true
   end
   return false
end

function moveCharTo(charName, targetName)
   local char, target = getObj(charName), getObj(targetName)
   if char and target then
      char:getPose():setPos(target:getPose():getPos())
      char:setOrientationGlobal(getAnglesFromQuat(target:getPose():getRotQuat()).y)
      return true
   end
   return false
end

--Works with groups in which object names end with a number ID
function getObjectsInGroupOrdered(groupName, silent)
   local orderedGroup = {}
   for _, objectName in ipairs(getObjectsInGroup(groupName, true)) do
      local id = string.match(objectName, "%d+$")
      if id then
         orderedGroup[tonumber(id)] = objectName
      elseif not silent then
         log("WARNING: getObjectsInGroupOrdered skipped a non-pattern named object: " .. objectName)
      end
   end

   local finalGroup = {}
   for _,objectName in tablex.sort(orderedGroup) do
      table.insert(finalGroup, objectName)
   end
   return finalGroup
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

function useItemForPlayer(itemName)
   local player = getMC()
   local item = player:getInventory():getItemByName(itemName)
   player:useItem(item)
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
      local boozeCount = 0
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

function showGameplayUI(state)
   ImmersiveUI.showGameplayUI(state)
end