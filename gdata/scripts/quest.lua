local Weather = (require "environment.weatherEffects")
local WeatherSystem = (require "environment.weather").WeatherSystem
local oo = require "loop.simple"

local stringx = require "pl.stringx"
local tablex = require "pl.tablex"

local ItemsData = (require "itemsData")

function fakeQuestStartInfo(quest)
   gameplayUI:showQuestStartInfo( "Quest '" .. quest.title .. "' started" )
end

function isQuestStarted( quest_name )
   q = getQuest(quest_name)
   if q then
      return q:isStarted()
   end
   return false
end

function isQuestActive( quest_name )
   q = getQuest(quest_name)
   if q then
      return q:isActive()
   end
   return false
end

function isQuestFinished( quest_name )
   q = getQuest(quest_name)
   if q then
      return q:isFinished()
   end
   return false
end

function isQuestStepFinished( quest_name, step_name )
   q = getQuest(quest_name)
   if q then
      return q:isStepPassed(step_name)
   end
   return false
end

function getQuest( quest_name )
   for k,quest in pairs(quests) do
      if ( k == quest_name ) then
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

function getQuestActiveStepName( quest_name )
   q = getQuest( quest_name )
   if q then
      return q:getActiveStepName()
   end
end

function startQuest( quest_name )
   q = getQuest( quest_name )
   q:start()
end

function finishQuest( quest_name )
   q = getQuest( quest_name )
   q:finish()
end

function getQuestById( quest_id )
   for k,quest in pairs(quests) do
      if ( quest.id == quest_id ) then
         return quest
      end
   end
   return nil
end

function goToQuestStep( quest_name, step_name, silent )
   q = getQuest( quest_name )
   if q then
      q:goToStep( step_name, silent )
   end
end

function goToQuestStepTimer( quest_name, step_name, time, silent )
   q = getQuest( quest_name )
   if q then
      q:goToStepTimer( step_name, time, silent )
   end
end

CQuest = {
   daytime_timers = {}, -- daytime event subscriptions
   log = "", --temp hack. FIXME: TODO: better system for quest log
}

function CQuest:getName()
   return self.name
end

function CQuest:declareVar(name, value)
   self._variables[name] = value
end

function CQuest:setParam(param, value)
   setQuestParam( self.name, param, value )
end

function CQuest:getParam(param)
   return getQuestParam( self.name, param )
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
   if ( not self:isActive() ) then
      return ""
   end
   return self.activeStep.name
end

function CQuest:start()
   runTimer( 0, self, self.startImediate, false )
end

function CQuest:startImediate()
   if ( not self:isStarted() ) then
      return self:tryStep( self.firstStep )
   end

   return true
end

function CQuest:finish()
   runTimer( 0, self, self.finishImediate, false )
end

function CQuest:finishImediate()
   if ( self:isActive() ) then
      return self:tryStep( self.lastStep )
   end
   return self:isFinished()
end

function CQuest:fail()
   runTimer( 0, self, self.failImediate, false )
end

function CQuest:failImediate()
   if ( not self:isActive() ) then
      return false
   end

   self:stepFinish( self.activeStep )

   self.failed = true

   if ( self.onFail ) then
      self:onFail()
   end

   log(string.format("quest failed: '%s'", self.name))
   gameplayUI:showQuestStopInfo( "Quest '" .. self.title .. "' failed" )

   return true
end

function CQuest:goToStep( step_name, silent )
   self:goToStepTimer( step_name, 0, silent )
end

function CQuest:goToStepTimer( step_name, time, silent )
   runTimer( time, {quest=self, step=step_name, silent=silent},
   function ( param )
      param.quest:goToStepImediate( param.step, param.silent )
   end
   , false )
end

function CQuest:goToStepImediate( step_name, silent )
   if ( not self:isActive() ) then
      return false
   end

   return self:tryStep( self:getStep( step_name ), silent )
end

function questNightStartCB( params, state )
   if ( state == Weather.DT_EVENING ) then
      params.count = params.count - 1
      if ( params.count == 0 ) then
         WeatherSystem:unsubscribeDaytimeChange( questNightStartCB, params )
         for i,v in ipairs(getQuest(params.quest).daytime_timers) do
            if v.params == params then
               table.remove(getQuest(params.quest).daytime_timers, i)
               break
            end
         end
         getQuest(params.quest):goToStepImediate( params.step )
      end
   end
end

function CQuest:goToStepAtNight( step_name, wait_nights_count )
   if ( not wait_nights_count or wait_nights_count < 1 ) then
      wait_nights_count = 1
   end
   local params = {quest=self:getName(), step=step_name, count = wait_nights_count}
   table.insert(self.daytime_timers, {time="night", ["params"]=params})
   WeatherSystem:subscribeDaytimeChange( questNightStartCB, params )
end

function questDayStartCB( params, state )
   if ( state == Weather.DT_MORNING ) then
      params.count = params.count - 1
      if ( params.count == 0 ) then
         WeatherSystem:unsubscribeDaytimeChange( questDayStartCB, params )
         for i,v in ipairs(getQuest(params.quest).daytime_timers) do
            if v.params == params then
               table.remove(getQuest(params.quest).daytime_timers, i)
               break
            end
         end
         getQuest(params.quest):goToStepImediate( params.step )
      end
   end
end

function CQuest:goToStepAtDay( step_name, wait_days_count )
   if ( not wait_days_count or wait_days_count < 1 ) then
      wait_days_count = 1
   end
   local params = {quest=self:getName(), step=step_name, count = wait_days_count}
   table.insert(self.daytime_timers, {time="day", ["params"]=params})
   WeatherSystem:subscribeDaytimeChange( questDayStartCB, params )
end

function CQuest:isStepPassed( step_name )
   local step = self:getStep( step_name )

   if ( step == nil ) then
      return false
   end

   return step.status == "finished"
end

function CQuest:getStep( step_name )
   for k,node in pairs( self.nodes ) do
      if ( node.type == "step" and node.name == step_name ) then
         return node
      end
   end

   return nil
end

function CQuest:tryStep( step, silent )
   if ( not step ) then
      return false
   end

   if ( not self.activeStep and step == self.firstStep ) then
      if ( self.onStart ) then self:onStart() end -- quest start CB

      self:stepStart( step )
      log(string.format("quest '%s' step change to: '%s'", self.name, step.name))
      self.activeStep = step
      self:enableActivators( false )
      self:enableListeners ( true )
      self:setupQuestMarkers( true )
      log(string.format("quest start: '%s'", self.name))
      if ( not self.hidden ) then
         gameplayUI:updateQuestsList()
         gameplayUI:showQuestStartInfo( "Quest '" .. self.title .. "' started" )
      end
      return true
   end

   if ( not self:leadsToStep( self.activeStep, step ) ) then
      log( "Error: Quest's Step incorrect order: quest: " .. self.name .. " step: " .. step.name )
      return false
   end

   if ( step.onCheck and not step:onCheck() ) then
      return false
   end

   self:stepFinish( self.activeStep )
   self:stepStart ( step )

   log(string.format("quest '%s' step change to: '%s'", self.name, step.name))
   self.activeStep = step
   self:setupQuestMarkers( true )

   local localMult = self:getParam("expMult") or 1

   if ( self.activeStep == self.lastStep ) then
      self:stepFinish( self.activeStep )
      self:setQuestMarkersEnabled( false )

      if ( self.onFinish ) then self:onFinish() end -- quest finish CB

      log(string.format("quest completed: '%s'", self.name))
      if ( not self.hidden) then
         gameplayUI:updateQuestsList()
         gameplayUI:showQuestStopInfo( "Quest '" .. self.title .. "' completed" )
         getPlayer():addExp(getGlobalParam("expQuestFinish") * localMult)
      end
      runTimer( 0, self, getScene():tryAutoSave(), false )
   else
      if not self.hidden then
         if not silent then
            gameplayUI:updateQuestsList()
            gameplayUI:showQuestUpdateInfo( "Quest '" .. self.title .. "' updated" )
            getPlayer():addExp(getGlobalParam("expStepFinish") * localMult)
         end
      end
   end

   return true
end

function CQuest:stepStart( step )
   if ( step.onStart ) then
      step:onStart()
   end

   step.status = "started"

   for i=1,#step.transitions do
      step.transitions[i].enabled = true
   end
end

function CQuest:stepFinish( step )
   if ( step.onFinish ) then
      step:onFinish()
   end

   step.status = "finished"

   for i=1,#step.transitions do
      step.transitions[i].enabled = false
   end
end

function CQuest:leadsToStep( stepFrom, stepTo )
   if ( #stepFrom.connections == 0 ) then
      return false
   end

   for i=1,#stepFrom.connections do
      if ( stepFrom.connections[i] == stepTo ) then
         return true
      else
         if ( self:leadsToStep( stepFrom.connections[i], stepTo ) ) then
            return true
         end
      end
   end

   return false
end

function CQuest:enableActivators( state )
   for i=1,#self.activators do
      self.activators[i].enabled = state
   end
end

function CQuest:enableListeners( state )
   for i=1,#self.listeners do
      self.listeners[i].enabled = state
   end
   for i=1,#self.freeListeners do
      self.freeListeners[i].enabled = state
   end
end

function CQuest:writeLog( ... )
   local entry = arg[1]
   table.remove(arg, 1)
   local id = entry
   if self.logs and self.logs[id] then
      entry = self.logs[id]
   end

   entry = string.format(entry, unpack(arg))

   if self:isStarted() and not self.hidden then
      gameplayUI:showQuestLogUpdateInfo(self.title .. ": new journal entry")
   end
   self.log = self.log .. "\n***\n" .. entry
   gameplayUI:updateSelectedJournalQuestLog( self )
end

function CQuest:setupQuestMarkers( destroyPrevious )
   if destroyPrevious then
      gameplayUI:destroyActiveQuestMarkers( self )
   end

   local markers = self[self:getActiveStep().name .. "_markers"]
   if markers then
      for _,params in pairs( markers ) do
         gameplayUI:mapAddQuestMarker( self, params, params.tooltipText )
      end
   end
end

function CQuest:setQuestMarkersEnabled( state )
   self.markersEnabled = state
   gameplayUI:setQuestMarkersVisible( self.name, state )
end

function CQuest:getQuestMarkersEnabled()
    return self.markersEnabled
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

function CNode:writeLog( entry )
   self:getQuest():writeLog(entry)
end

function CNode:setTopicVisible( topic, value )
   self:getQuest():setTopicVisible(topic, value)
end

function CNode:getTopicVisible( topic )
   return self:getQuest():getTopicVisible(topic)
end

function CNode:goToStep( name, silent )
   self:getQuest():goToStep( name, silent )
end

local CCondition = oo.class({}, CNode)
local CStep = oo.class({}, CNode)

function CStep:getName()
   return self.name
end


questSystem =
{
   questid = 0
}

function questSystem:initQuest( name )
   local f, err = loadfile( kPathGlobalQuests .. name .. ".lua" )
   if err then
      log(string.format("ERROR: Can't load quest %s:", name))
      log(err)
      return
   end
   local quest = f()

   if ( not quests ) then
      quests = {}
   end

   quests[name] = quest
   quest.name = name
   quest.id = self.questid
   quest.markersEnabled = false
   self.questid = self.questid + 1
   self:loadQuestScripts( quest )
end

-- quest.activators
function questSystem:restoreActivators( quest )
   quest.activators = {}

   for k1,node in pairs(quest.nodes) do
      if ( node.type == "condition" ) then
         local foundLink = false
         for k2,node2 in pairs(quest.nodes) do
            for k3=1,#node2.connections do
               if ( node2.connections[k3] == node ) then
                  foundLink = true
               end
            end
         end
         if ( foundLink == false ) then
            if ( #node.connections > 0 and node.connections[1] == quest.firstStep ) then
               quest.activators[#quest.activators+1] = node
            end
         end
      end
   end
end

-- quest.freeListeners
function questSystem:restoreFreeListeners( quest )
   quest.freeListeners = {}

   for k1,node in pairs(quest.nodes) do
      if ( node.type == "condition" ) then
         local foundLink = false
         for k2,node2 in pairs(quest.nodes) do
            for k3=1,#node2.connections do
               if ( node2.connections[k3] == node ) then
                  foundLink = true
               end
            end
         end
         if ( foundLink == false ) then
            if ( #node.connections == 0 ) then
               quest.freeListeners[#quest.freeListeners+1] = node
            end
         end
      end
   end
end

-- quest.listeners
function questSystem:restoreListeners( quest )
   if ( not quest.listeners ) then
      quest.listeners = {}
   end

   for k1,node in pairs(quest.nodes) do
      if ( node.type == "condition" ) then
         local foundLink = false
         for k2,node2 in pairs(quest.nodes) do
            for k3=1,#node2.connections do
               if ( node2.connections[k3] == node ) then
                  foundLink = true
               end
            end
         end
         if ( foundLink == false ) then
            if ( #node.connections > 0 and node.connections[1] ~= quest.firstStep ) then
               quest.listeners[#quest.listeners+1] = node
            end
         end
      end
   end
end

-- quest.transitions
function questSystem:restoreTransitions( quest )
   if ( not quest.listeners ) then
      quest.listeners = {}
   end

   for k1,node in pairs(quest.nodes) do
      if ( node.type == "step" ) then
         node.transitions = {}
         for i=1,#node.connections do
            if ( node.connections[i].type == "condition" ) then
               node.transitions[#node.transitions+1] = node.connections[i]
               quest.listeners[#quest.listeners+1] = node.connections[i]
            end
         end
      end
   end
end

function questSystem:initConditions( quest )
   for k1,node in pairs(quest.nodes) do
      if ( node.type == "condition" ) then
         node.enabled = false
      end
   end

   quest:enableActivators( true )
end

function questSystem:getInputNodes( quest, target )
   list = {}
   for k1,node in pairs(quest.nodes) do
      for k2=1,#node.connections do
         if ( node.connections[k2] == target ) then
            table.insert(list, node)
         end
      end
   end
   return list
end

-- quest.firstStep
function questSystem:restoreFirstStep( quest )
   for k1,node in pairs(quest.nodes) do
      input = self:getInputNodes(quest, node)
      -- step without inputs
      if ( node.type == "step" and next(input) == nil) then
         quest.firstStep = node
         return
      -- step with only conditions as inputs each without inputs
      elseif ( node.type == "step" ) then
         local badEnding = false
         for k2,node2 in pairs(input) do
            if ( node2.type == "step" ) then
               badEnding = true
            elseif ( next(self:getInputNodes(quest, node2)) ~= nil ) then
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
function questSystem:restoreLastStep( quest )
   for k1,node in pairs(quest.nodes) do
      if ( node.type == "step" ) then
         if ( #node.connections == 0 ) then
            quest.lastStep = node
            return
         end
      end
   end
end

function questSystem:restoreConnections( quest )
   for nk,node in pairs(quest.nodes) do
      node.quest = quest -- back link

      node.connections = {}
      if ( node.connectionsID ) then
         for k,v in pairs(node.connectionsID) do
            node.connections[#node.connections+1] = self:findReference( quest.nodes, v )
         end
      end
   end
end

function questSystem:findReference( nodes, id )
   for k,node in pairs(nodes) do
      if ( node.ID == id ) then
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
   setmetatable( chunkEnv, {__index=_G} )
   local chunkName
   if obj.type == "condition" or obj.type == "step" then
      chunkName = string.format("quest name: %s node script(type: %s name: %s id: %d)",
         obj.quest.name, obj.type, tostring(obj.name), obj.ID)
   else
      chunkName = string.format("quest script name: %s", obj.name)
   end
   local chunk, err = loadstring( obj.script, chunkName )
   if chunk then
      setfenv( chunk, chunkEnv )
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

function questSystem:loadNodesScripts( quest )
   for k,node in pairs( quest.nodes ) do
      local mt = {}
      if ( node.type == "condition" ) then
         loadObjScript(node)

         mt.__index = generateVariableLookup(CCondition)
         setmetatable( node, mt )
      elseif ( node.type == "step" ) then
         loadObjScript(node)

         mt.__index = generateVariableLookup(CStep)
         setmetatable( node, mt )
      end
   end
end

function questSystem:loadQuestScripts( quest )
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

   setmetatable( quest, mt )
   quest._variables = {q=quest}

   self:restoreConnections( quest )
   self:restoreFirstStep( quest )
   self:restoreLastStep( quest )
   self:restoreActivators( quest )
   self:restoreFreeListeners( quest )
   self:restoreListeners( quest )
   self:restoreTransitions( quest )
   self:initConditions( quest )
   self:loadNodesScripts( quest )

   quest.activeStep = nil
   quest.failed = false

   for k,node in pairs( quest.nodes ) do
      if ( node.type == "condition" ) then
         node.targetsAny = getWords( node.targetsAny )
         local targetsAll = getWords( node.targetsAll )
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

function questSystem:checkCondition( condition, event_name, target_name, target_obj )
   if ( not condition.enabled ) then return false end
   if ( condition.event ~= event_name ) then return false end

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
      if ( getVar(targetsAny[i]) == target_name or targetsAny[i] == '*' ) then
         checkAny = true
         break
      end
   end

   -- check targets all
   local found = false
   for k,v in pairs (targetsAll) do
      if ( getVar(k) == target_name ) then
         found = true
      end
   end

   if ( found ) then
      for k,v in pairs (targetsAll) do
         if ( getVar(k) == target_name ) then
            targetsAll[k] = targetsAll[k] + 1
            v = targetsAll[k]
         end
         if ( v == 0 ) then
            checkAll = false
         end
      end
   else
      checkAll = false
   end

   if ( (checkAny and checkAll) or
        (#targetsAny == 0 and checkAll) or
        (checkAny and tableSize(targetsAll) == 0) or
        (#targetsAny == 0 and tableSize(targetsAll) == 0) ) then
      local result = true

      if ( condition.onCheck ) then
         result = condition:onCheck(target_obj)
      end

      if ( result == true ) then
         condition.targetsCount = condition.targetsCount - 1
         if ( condition.targetsCount > 0 ) then
            result = false
         end
      end

      return result
   end

   return false
end

function questSystem:fireEvent( event_name, target_name, target_obj )
   runTimer( 0, {event=event_name, target=target_name, obj=target_obj}, function ( param ) questSystem:fireEventImediate( param.event, param.target, param.obj ) end, false )
end

function questSystem:fireEventImediate( event_name, target_name, target_obj )
   -- log( "questSystem:fireEvent: event " .. event_name .. " target: " .. target_name )
   local specificQuest, target = splitQuestTopic(target_name or "")
   if specificQuest ~= nil and target ~= nil then
      self:processEvent(getQuest(specificQuest), event_name, target, target_obj)
   else
      for k,quest in pairs(quests) do
         self:processEvent(quest, event_name, target_name, target_obj)
      end
   end
end

function questSystem:processEvent(quest, event_name, target_name, target_obj )
   if ( not quest:isStarted() ) then -- process activators
      if ( #quest.activators > 0 ) then
         local activators = quest.activators

         for j=1,#activators do
            if ( self:checkCondition( activators[j], event_name, target_name, target_obj ) ) then
               quest:start()
               break
            end
         end
      end
   elseif ( quest:isActive() ) then -- process listeners
      if ( #quest.freeListeners > 0 ) then
         local freeListeners = quest.freeListeners
         for j=1,#freeListeners do
            if self:checkCondition( freeListeners[j], event_name, target_name, target_obj ) then
               freeListeners[j].enabled = false
            end
         end
      end
      if ( #quest.listeners > 0 ) then

         local listeners = quest.listeners
         cur_step = quest:getActiveStep()
         if cur_step and cur_step.transitions then
            listeners = cur_step.transitions
         else
            return
         end

         for j=1,#listeners do
            if ( self:checkCondition( listeners[j], event_name, target_name, target_obj ) ) then
               if ( quest:tryStep(listeners[j].connections[1]) ) then
                  listeners[j].enabled = false
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

function hideDisableObjectGroup( group_name, silent )
   local group = getObjectsInGroup(group_name, true)
   for _, name in ipairs(group) do
      local obj = getObj(name)
      if obj then --TODO:FIXME: for some reason you can't get omni (light sources) objects
         hideObject( name, silent )
         disableObjectCollisions( name, silent )
         disableObject( name, silent )
         if obj.stop then
            obj:stop()
         end
      end
   end
end

function showEnableObjectGroup( group_name, silent )
   local group = getObjectsInGroup(group_name, true)
   for _, name in ipairs(group) do
      local obj = getObj(name)
      if obj then
         showObject( name, silent )
         enableObjectCollisions( name, silent )
         enableObject( name, silent )
         if obj.play then
            obj:play()
         end
      end
   end
end

function enableObject( object_name, silent )
   local object = getObj(object_name)
   if ( object ) then
      if object.enable then
         object:enable()
      elseif not silent then
         log("ERROR: " .. object_name .. " lacks method 'enable'")
      end
   end
end

function disableObject( object_name, silent )
   local object = getObj(object_name)
   if ( object ) then
      if object.disable then
         object:disable()
      elseif not silent then
         log("ERROR: " .. object_name .. " lacks method 'disable'")
      end
   end
end

function showObject( object_name, silent )
   local object = getObj(object_name)
   if ( object ) then
      if object.setVisible then
         object:setVisible(true)
      elseif not silent then
         log("ERROR: " .. object_name .. " lacks method 'setVisible'")
      end
   end
end

function hideObject( object_name, silent )
   local object = getObj(object_name)
   if ( object ) then
      if object.setVisible then
         object:setVisible(false)
      elseif not silent then
         log("ERROR: " .. object_name .. " lacks method 'setVisible'")
      end
   end
end

function activateObject( object_name, silent )
   local object = getObj(object_name)
   if ( object ) then
      if object.activate then
         object:activate()
      elseif not silent then
         log("ERROR: " .. object_name .. " lacks method 'activate'")
      end
   end
end

function deactivateObject( object_name, silent )
   local object = getObj(object_name)
   if ( object ) then
      if object.deactivate then
         object:deactivate()
      elseif not silent then
         log("ERROR: " .. object_name .. " lacks method 'deactivate'")
      end
   end
end

function isObjectEnabled( object_name )
   local object = getObj(object_name)
   if ( object ) then
      return object:isEnabled()
   end
   return false
end

function moveObjectTo( object_name, target_name )
   local object = getObj(object_name)
   local target = getObj(target_name)

   if ( object and target ) then
      object:setPose( target:getPose() )
      return true
   end
   return false
end

function removeItemFromPlayer( item_name, count )
   count = count or 1
   local label = getPlayer():getItemLabel( item_name )
   local success = false
   for i=1,count do
      if ( getPlayer():destroyItemByName( item_name ) ) then
         success = true
      end
   end
   if success then
      gameplayUI:showInventoryDropInfo( count.. " " .. label .. " was removed from Inventory" )
      return true
   end
   return false
end

function takeItemFromPlayer( item_name )
   local label = getPlayer():getItemLabel( item_name )

   if ( getPlayer():destroyItemByName( item_name ) ) then
      gameplayUI:showInventoryDropInfo( label .. " was removed from Inventory" )
      questSystem:fireEvent( "give", item_name )
      return true
   end
   return false
end

function giveItemToNPC( item_name, char_name, count )
   local label = getPlayer():getItemLabel( item_name )

   if ( getPlayer():giveItemByName( item_name, getObj(char_name), count ) ~= nil ) then
      gameplayUI:showInventoryDropInfo( "Gave " .. label )
      questSystem:fireEvent( "give", item_name )
      return true
   end
   return false
end


function addItemToPlayer( item_name )
   return addItemsToPlayer(item_name, 1)
end

function addItemsToPlayer( item_name, count )
   if ( not item_name or not count or count <= 0 ) then
      return nil
   end

   local player = getPlayer()
   if player and player.obtainItem then
      local item = player:obtainItem( item_name, count )

      if ( item ) then
         if count > 1 then
            gameplayUI:showInventoryPickInfo( tostring(count) .. " " .. item:getLabel() .. " were added to Inventory" )
         else
            gameplayUI:showInventoryPickInfo( item:getLabel() .. " was added to Inventory" )
         end
         return item
      end
      return nil
   end
   return nil
end

function getPlayerItemCount( item_name )
   local item = getPlayer().itemsManager:getItemByName(item_name)
   if item then
      return item.count
   else
      return 0
   end
end

function hasPlayerItem( item_name )
   return getPlayer():hasItem( item_name )
end

function hasPlayerItemCount( item_name, count )
   local item = getPlayer().itemsManager:getItemByName(item_name)
   if item and item.count > count - 1 then
      return true
   else
      return false
   end
end

function hasPlayerBooze( count, strength )
   count = count or 1
   local items = getPlayer().itemsManager.items
   for i=1,#items do
      local boozeCount = 0
      if items[i]:isBooze() then
         if not strength or strength == items[i]:getBoozeStrength() then
            if count == 1 then
               return true
            else
               boozeCount = boozeCount + items[i].count
               if boozeCount >= count then
                  return true
               end
            end
         end
      end
   end
   return false
end

function getPlayerBooze( strength )
   local items = getPlayer().itemsManager.items
   local booze = {}
   for i=1,#items do
      local boozeCount = 0
      if items[i]:isBooze() then
         if not strength or strength == items[i]:getBoozeStrength() then
            booze[items[i].name] = items[i].count
         end
      end
   end
   return booze
end

function removeBoozeFromPlayer( count, strength )
   count = count or 1
   if not hasPlayerBooze( count, strength ) then return false end

   local booze = getPlayerBooze( strength )

   local getValue = ItemsData.getItemValue
   local sortedIterator = tablex.sort(booze, function(a, b) return getValue(a) < getValue(b) end)

   for name, playerCount in sortedIterator do
      if count > playerCount then
         removeItemFromPlayer( name, playerCount )
         count = count - playerCount
      else
         removeItemFromPlayer( name, count )
         return true
      end
   end
   return true
end

function isPlayerInTrigger( trigger )
   return getPlayer():isInTrigger( trigger )
end

function wasPlayerInTrigger( trigger )
   return getPlayer():isTriggerVisited( trigger )
end

function isDay()
   return WeatherSystem:isDay()
end

function isNight()
   return WeatherSystem:isNight()
end
