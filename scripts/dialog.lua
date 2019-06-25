local tablex = require "pl.tablex"
local deb = require "global.debug"
hlp = require "helpers"

local CDialogAnimator = require "dialogAnimator"

dialogSystem =
{
   active_dialog = nil,
   waitAnswer    = false,
   space         = false, -- TODO:FIXME: horrible hack while inputManager isn't finished
   callbacks     = {},
}

local MSG_BACK = "\\[BACK]"
local MSG_END = "\\[END]"
local MSG_TRADE = "\\[TRADE]"

local function isTextBack(txt)
   return string.lower(txt) == string.lower(MSG_BACK)
end

local function isTextEnd(txt)
   return string.lower(txt) == string.lower(MSG_END)
end

local function isTextTrade(txt)
   return string.lower(txt) == string.lower(MSG_TRADE)
end

local function isTextSpecial(txt)
   return isTextBack(txt) or isTextEnd(txt) or isTextTrade(txt)
end

local function hasCustomScript(msg)
   local result = false
   if msg.onStart or msg.onStop then
      result = true
   end
   return result
end

local function isMessageVisible(msg)
   local visible = true
   if msg.isVisible then
      visible = msg:isVisible()
   end

   if msg.text == "" or msg.time == 0 then
      visible = false
   end
   return visible
end

local function messageAllowsVisitedColoring(msg, passedIDs)
   --Special and invisible messages ALWAYS allow coloring
   if isTextSpecial(msg.text) or not isMessageVisible(msg) then
      return true
   end
   --script/topic messages NEVER allow coloring
   if hasCustomScript(msg) or msg:getTopic() then
      return false
   end

   if msg:isFirstTime() then --firstTime messages MOSTLY DO NOT allow coloring
      return false
   else
      if #msg.messages == 0 then --Used messages that exit the dialog ALWAYS allow coloring
         return true
      elseif #msg.messages > 1 then --Check messages recursively but stop upon detecting a loop
         if not tablex.search(passedIDs, msg.ID) then
            table.insert(passedIDs, msg.ID)
            for _,v in pairs(msg.messages) do
               if not messageAllowsVisitedColoring(v, passedIDs) then
                  return false
               end
            end
         end
      end
   end
   return true
end

function splitQuestTopic(str)
   return string.match(str, "^([%w_]+):([%w_]+)")
end

local CMessage = {}

function CMessage:setDialogParam(param, value)
   setDialogParam(self.dialog.name, param, value)
end

function CMessage:getDialogParam(param)
   return getDialogParam(self.dialog.name, param)
end

function CMessage:setTopic(topic)
   self.topic = topic
end

function CMessage:getTopic()
   return self.topic
end

function CMessage:isTopicVisible()
   if self.topic then
      local quest, topic = splitQuestTopic(self.topic)
      if quest ~= nil and topic ~= nil then
         local q = getQuest(quest)
         if q then
            return q:getTopicVisible(topic)
         end
      end
   end
end

function CMessage:getActor(id)
   return self.dialog.actors[id]
end

function CMessage:getNPC()
   return self:getActor(2)
end

function CMessage:isNPCInitiated()
   return self.dialog.initiator ~= nil and self.dialog.initiator ~= getMC()
end

function CMessage:isFirstTime()
   return 1 ~= self:getParam(string.format("n%d", self.ID))
end

function CMessage:startTrade()
   self:getNPC():setState("trading", true)
   runTimer(0, self:getNPC(), function(npc)
      if getMC() then
         getMC():startTrade(npc)
      end
   end, false)
end

function CMessage:hasVisibleChildren()
   for _,v in pairs(self.messages) do
      if v.isVisible and v:isVisible() and not isTextBack(v.text) then
         return true
      end
   end
   return false
end

function CMessage:fireDiscussEvent(topic)
   questSystem:fireEvent("discuss", topic, self:getNPC())
end

CMessage.setParam = CMessage.setDialogParam
CMessage.getParam = CMessage.getDialogParam


function dialogSystem:findReference(messages, id)
   for mk,mv in pairs(messages) do
      if mv["ID"] == id then
         return mv
      end
   end
   return nil
end

function dialogSystem:restoreConnections(messages)
   local idsWithInputs = {}
   for _,mv in pairs(messages) do
      mv.messages = {}
      if mv["connectID"] then
         idsWithInputs[mv["connectID"]] = true
         mv.messages[1] = self:findReference(messages, mv["connectID"])
      elseif mv["connectionsID"] then
         for i=1,#mv["connectionsID"] do
            if mv["connectionsID"][i] ~= -1 then
               idsWithInputs[mv["connectionsID"][i]] = true
               mv.messages[#mv.messages+1] = self:findReference(messages, mv["connectionsID"][i])
            end
         end
      end
   end

   -- overwrite switches to direct messages
   for _,mv in pairs(messages) do
      if #mv.messages > 0 and mv.messages[1].type == "switch" then
         mv.messages = mv.messages[1].messages
      end
   end

   -- collapse guiding nodes (1 slot switches) (up to 10 consequtive)
   for _ = 1, 10 do
      for _,mv in pairs(messages) do
         if mv.type == "message" then
            if #mv.messages == 1 then
               if mv.messages[1].time == 0 and mv.messages[1].text == "" then
                  mv.messages = mv.messages[1].messages
               end
            elseif #mv.messages > 1 then
               local new_messages = {}
               for _,v in pairs(mv.messages) do
                  if v.time == 0 and v.text == "" then
                     if #v.messages > 0 then
                        table.insert(new_messages, v.messages[1])
                     end
                  else
                     table.insert(new_messages, v)
                  end
               end
               mv.messages = new_messages
            end
         end
      end
   end

   -- find root
   for _, msg in pairs(messages) do
      if not idsWithInputs[msg.ID] and msg.type == "message" then
         return msg
      end
   end

   return nil
end

function dialogSystem:loadMessageScript(message, root)
   if not message.script then
      return
   end

   if message.script ~= "" then
      --log("load script for: " .. message.text)
      --Remove blank methods
      message.script = message.script:gsub("function message:onStart%(%)%\nend", "")
      message.script = message.script:gsub("function message:onStop%(%)%\nend", "")
      local chunkName = string.format("dialog: %s node script ID: %d", root.name, message.ID)
      local chunk, err = loadstring(message.script, chunkName)
      if chunk then
         setfenv(chunk, setmetatable({message=message}, {__index=_G, __newindex=_G}))
         local status
         status, err = pcall(chunk)
         if not status then
            log("ERROR: Message has a faulty script.")
            log(err)
            log("   " .. message.script)
         end
      else
         log(string.format("ERROR: Could not compile chunk from script %s", chunkName))
         log(err)
         log(message.script)
      end

   end
   message.dialog = root

   setmetatable(message, {["__index"] = CMessage})

   message.script = nil

   -- set message topic
   if message.text and message.text ~= "" then
      local topic = message.topic
      if topic and topic ~= "" then
         message:setTopic(topic)
      else
         local pattern = "^%[t_([%w_:]+)%]"
         topic = string.match(message.text, pattern)
         if topic then
            message:setTopic(topic)
            message.text = string.gsub(message.text, pattern, "", 1)
         end
      end
   end

   if message.messages then
      for i=1,#message.messages do
         self:loadMessageScript(message.messages[i], root)
      end
   end
end

function dialogSystem:createDialog(dialog_name, unique_name)
   if not dialog_name or dialog_name == "" then
      return
   end

   local status, dialog = deb.loadTableFromFile(kPathGlobalDialogs .. dialog_name .. ".lua")
   if not status then
      log(string.format("ERROR: Can't load dialog '%s':", dialog_name))
      log(dialog)
      return nil
   end

   local root = self:restoreConnections(dialog)

   root.actors = {}
   root.name = unique_name

   self:loadMessageScript(root, root)

   --log(tostring(root))

   return root
end

function dialogSystem:appendHistory(actor, text)
   local actorStr = ""

   if actor ~= self.active_dialog.historyPrevActor then
      actorStr = "[colour='FF888888']" .. actor .. ":[colour='FF666666']   "
      self.active_dialog.historyPrevActor = actor
   end

   if self.active_dialog.historyText ~= "" then
      self.active_dialog.historyText = self.active_dialog.historyText .. "\n"
   end

   self.active_dialog.historyText = self.active_dialog.historyText .. actorStr .. text
end

function dialogSystem:appendHistoryWithId(actor, text, id)
   if isDebug("dialogDebug") then
      text = "{" .. tostring(id) .. "} " .. text
   end
   self:appendHistory(actor, text)
end

local function markAsVisited(msg)
   if msg ~= nil and msg.ID ~= nil and msg.setParam then
      msg:setParam(string.format("n%d", msg.ID), 1)
      local topic = msg:getTopic()
      if topic then
         msg:fireDiscussEvent(topic)
      end
   end
end

-- skip_onStop is used only when calling from showReplies when there's only 1 reply.
-- onStop and appending to history already happened there
function dialogSystem:showMessage(msg_obj, skip_onStop)
   local dialog = self.active_dialog
   if msg_obj.text == "" or msg_obj.time == 0 then
      dialog.active_message = msg_obj
      self:showNextMessage()
      return
   end

   local actorName = dialog.actors[msg_obj.actor]:getLabel()

   if dialog.prev_message and not skip_onStop then
      local actorNamePrev = dialog.actors[dialog.prev_message.actor]:getLabel()

      self:appendHistoryWithId(actorNamePrev, dialog.prev_message.text, dialog.prev_message.ID)

      if dialog.prev_message.onStop then
         dialog.prev_message:onStop()
      end
      self:fireActorEvent(dialog, dialog.actors[dialog.prev_message.actor], "onStopMessage")

   end

   local m = dialog.active_message
   if m.text == "" or m.time == 0 then
      markAsVisited(m)
      if m.onStart then
         m:onStart()
      end
      if m.onStop then
         m:onStop()
      end
   end


   dialog.active_message = msg_obj

   --TClear()
   if not skip_onStop then
      --log("---------------------------------------------")
   end

   markAsVisited(msg_obj)
   if msg_obj.onStart then
      msg_obj:onStart()
   end
   self:fireActorEvent(dialog, dialog.actors[msg_obj.actor], "onStartMessage", msg_obj.animation)

   if not skip_onStop then
      --log("Tells " .. actorName .. ":\n" .. msg_obj.text)
   end
   local txt = msg_obj.text
   if isDebug("dialogDebug") then txt = "{" .. msg_obj.ID .. "} " .. msg_obj.text end

   dialog.prev_message = dialog.active_message


   gameplayUI.dialogUI:setDialogText({actor = actorName, [1] =  txt}, dialog.historyText)
   gameplayUI.dialogUI:setDialogHintText("RMB to continue")

   if getGameOption("autoDialogAdvance") or (self.space and isDebug("dialogSkip")) then
      --'getTextDuration' is only available on the next frame after the 'setDialogText'
      runTimer(0, nil, function()
         local nodeTime =  (self.space and isDebug("dialogSkip")) and 0.05 or math.max(gameplayUI.dialogUI:getTextDuration(), msg_obj.time)
         self.message_timer = runTimer(nodeTime, self, self.showNextMessage, false)
      end, false)
   end
--self:fireEvent(dialog, "onStartMessage")
end

function dialogSystem:showActiveMessage(msg_array)
   for i=1,#msg_array do
      local msg = msg_array[i]

      if msg.reference then
         msg = msg.reference
      end

      local visible = true

      if msg.isVisible then
         visible = msg:isVisible()
      end

      if visible then
         self:showMessage(msg)
         return
      end
   end

   self:stopDialog(nil)
end

function dialogSystem:showReplies(msg_array)
   if self.active_dialog.prev_message then
      local actorNamePrev = self.active_dialog.actors[self.active_dialog.prev_message.actor]:getLabel()

      self:appendHistoryWithId(actorNamePrev, self.active_dialog.prev_message.text, self.active_dialog.prev_message.ID)

      if self.active_dialog.prev_message.onStop then
         self.active_dialog.prev_message:onStop()
      end

      self:fireActorEvent(self.active_dialog, self.active_dialog.actors[self.active_dialog.prev_message.actor], "onStopMessage")
   end

   local m = self.active_dialog.active_message
   if m.text == "" or m.time == 0 then
      markAsVisited(m)
      if m.onStart then
         m:onStart()
      end
      if m.onStop then
         m:onStop()
      end
   end

   --log("---------------------------------------------")

   local firstMsg = self:findVisibleMessage(msg_array)

   --log("Tells " .. self.active_dialog.actors[firstMsg.actor]:getName() .. ":")

   local actorName = self.active_dialog.actors[firstMsg.actor]:getLabel()

   local index = 1
   local lastVisibleMsg = nil
   local replyTable = { actor = actorName, }

   gameplayUI.dialogUI:setDialogHintText("")
   for _, msg in ipairs(msg_array) do
      if msg.reference then
         msg = msg.reference
      end

      if isMessageVisible(msg) then
         index = index + 1
         lastVisibleMsg = msg
         local color = ""
         if not msg:isFirstTime() and messageAllowsVisitedColoring(msg, {}) then
            color = "[colour='FF888888']"
         end
         local txt = msg.text
         if isDebug("dialogDebug") then txt = "{" .. msg.ID .. "} " .. msg.text end
         table.insert(replyTable, color .. txt)
      end
   end

   if #replyTable == 0 then
      self:stopDialog(nil)
      return
   end

   -- if there's only one reply, don't wait for player choice and play it back
   if index == 2 then
      self:showMessage(lastVisibleMsg, true)
   else
      gameplayUI.dialogUI:setDialogText(replyTable, self.active_dialog.historyText)

      dialogSystem.waitAnswer = true
   end

--   self:fireEvent(self.active_dialog, "onStopMessage")
end

function dialogSystem:findVisibleMessage(messages)
   for i=1,#messages do
      local msg = messages[i]

      if msg.reference then
         msg = msg.reference
      end

      if msg.isVisible then
         if msg:isVisible() then
            return msg
         end
      else
         return msg
      end
   end

   return nil
end

function dialogSystem:showNextMessage()
   if not self.active_dialog then
      return
   end

   dialogSystem.message_timer = nil

   local messages = self.active_dialog.active_message.messages

   if not messages then
      self:stopDialog(nil)
      return
   end

   local msg = self:findVisibleMessage(messages)

   if msg then
      if self.active_dialog.actors[msg.actor] == getMC() then
         if not isDebug("dialogDebug") then
            for k,v in pairs(messages) do
               if v.text == "debug" then
                  local msg2 = self:findVisibleMessage(messages[2].messages)
                  if msg2 and self.active_dialog.actors[msg2.actor] == getMC() then
                     self.active_dialog.active_message = messages[2]
                     self:showReplies(messages[2].messages)
                  else
                     self:showActiveMessage(messages[2].messages)
                  end
                  return
               end
            end
         end
         self:showReplies(messages)
      else
         self:showActiveMessage(messages)
      end
   else
      self:stopDialog(nil)
   end
end

function dialogSystem:selectAnswer(answerNum)
   local dialog = self.active_dialog
   if self.waitAnswer and dialog and dialog.active_message then

      local visibleReplies = {}
      local messages = dialog.active_message.messages

      for i=1,#messages do
         local msg = messages[i]

         if msg.reference then
            msg = msg.reference
         end

         if not msg.isVisible or msg:isVisible() then
            if isTextTrade(msg.text) then
               visibleReplies.tradeMsg = msg
            else
               visibleReplies[#visibleReplies+1] = msg
            end
         end
      end

      local msg = visibleReplies[answerNum]
      if answerNum == "tradeMsg" or type(answerNum) == "number" and msg then
         self.waitAnswer = false

         if msg.reference then
            msg = msg.reference
         end

         markAsVisited(msg)
         if msg.onStart then
            msg:onStart()
         end
         self:fireActorEvent(dialog, dialog.actors[msg.actor], "onStartMessage", msg.animation)


         dialog.prev_message   = msg
         dialog.active_message = msg

         self:showNextMessage()
         return true
      end
   end

   return false
end

-- unused at 27.04.2018, TODO: remove
function dialogSystem:fireEvent(dialog, event_name)
   if not dialog or not dialog.active_message then
      return
   end

   self:fireActorEvent(dialog, dialog.actors[dialog.active_message.actor], event_name)
end

function dialogSystem:fireActorEvent(dialog, actor, event_name, event_data)
   if not actor then
      return
   end

   local event = nil

   if actor then
      event = actor[event_name]
   end

   if event then
      event(actor, event_data)
   end
end

function dialogSystem:inputKey(code)
   if not self.active_dialog or not self.active_dialog.active_message then
      return false
   end

   --log("key = " .. tostring(key))

   if code >= 2 and code <= 10 then
      self:selectAnswer(code - 1)
   elseif code == 240 or code == getButtonCode("JUMP") then
      if not self.waitAnswer then
         --Skip animation first, then showNextMessage, but immediately showNextMessage if we dialogSkip
         if gameplayUI.dialogUI:isTextAnimationInProgress() and not (self.space and isDebug("dialogSkip")) then
            if self.message_timer then
               self.message_timer:stop()
               self.message_timer = nil
            end
            gameplayUI.dialogUI:skipTextAnimation()
         else
            if self.message_timer then
               self.message_timer:stop()
               self.message_timer = nil
            end
            self:showNextMessage()
         end
      end
   end

   return true
end

function dialogSystem:subscribeOnStopDialog(func, ...)
   table.insert(self.callbacks, {func=func, args=table.pack(...)})
end

function dialogSystem:performOnStopDialogCallbacks()
   for _, callback in ipairs(self.callbacks) do
      callback.func(unpack(callback.args))
   end
   self.callbacks = {}
end

function dialogSystem:stopDialog(dialog)
   local active_dialog = self.active_dialog
   if active_dialog and (active_dialog == dialog or not dialog) then
      if active_dialog.prev_message and active_dialog.prev_message.onStop then
         active_dialog.prev_message:onStop()
      end

      if active_dialog.prev_message then
         local prev_actor = active_dialog.actors[active_dialog.prev_message.actor]
         self:fireActorEvent(active_dialog, prev_actor, "onStopMessage")
      end

      for _, actor in ipairs(active_dialog.actors) do
         self:fireActorEvent(active_dialog, actor, "onStopDialog")
      end

      self:performOnStopDialogCallbacks()

      active_dialog.active_message = nil
      self.active_dialog = nil

      gameplayUI.dialogUI:setDialogText(nil, nil)

      log("talk stop")
   end
end

function dialogSystem:playDialog(dialog)
   if not dialog then
      return
   end

   dialog.historyText      = ""
   dialog.historyPrevActor = ""

   dialogSystem.message_timer = nil
   dialog.prev_message  = nil

   self.active_dialog = dialog
   self.active_dialog.active_message = { actor=1, script="", text="", messages={dialog}, time=0 }

   local animator = CDialogAnimator()
   local actors = self.active_dialog.actors or {}
   for _, actor in ipairs(actors) do
      self:fireActorEvent(self.active_dialog, actor, "onStartDialog", animator)
   end
   animator:finalize()

   self:showNextMessage()
end
