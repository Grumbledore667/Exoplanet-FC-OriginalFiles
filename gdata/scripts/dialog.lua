hlp = require "helpers"

dialogSystem =
{
   active_dialog = nil,
   waitAnswer    = false,
   space         = false, -- TODO:FIXME: horrible hack while inputManager isn't finished
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
   if ( msg.isVisible ) then
      visible = msg:isVisible()
   end

   if ( msg.text == "" or msg.time == 0 ) then
      visible = false
   end
   return visible
end

local function isMessageSimple(msg, passedSwitches)
   --Special and invisible messages ALWAYS allow coloring
   if isTextSpecial(msg.text) or not isMessageVisible(msg) then
      return true
   end
   --script/topic messages NEVER allow coloring
   if hasCustomScript(msg) or msg:getTopic() then
      return false
   end

   --We either have a new switch or return into the previous one
   if #msg.messages > 0 then
      if #msg.messages > 1 then
         local IDs = {}
         for _,v in pairs(msg.messages) do
            table.insert(IDs, v.ID)
         end

         --Messages that return into known switches DO NOT need to be checked recursively and ALWAYS allow coloring
         for _, tab in pairs(passedSwitches) do
            if compareObjectTables( tab, IDs ) then
               return true
            end
         end
         --backup this switch to not go looping later
         table.insert(passedSwitches, IDs)
      end
         --Check this msg's branches recursively
      for _,v in pairs(msg.messages) do
         if not isMessageSimple(v, passedSwitches) then
            return false
         end
      end
   else --Messages that exit the dialog ALWAYS allow coloring
      return true
   end

   --firstTime messages MOSTLY DO NOT allow coloring
   if msg:isFirstTime() then
      return false
   end

   return true
end

function splitQuestTopic(str)
   return string.match(str, "^([%w_]+):([%w_]+)")
end

local CMessage = {}

function CMessage:setDialogParam(param, value)
   setDialogParam( self.dialog.name, param, value )
end

function CMessage:getDialogParam(param)
   return getDialogParam( self.dialog.name, param )
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
   return self.dialog.initiator ~= nil and self.dialog.initiator ~= getPlayer()
end

function CMessage:isFirstTime()
   return 1 ~= self:getParam(string.format("n%d", self.ID))
end

function CMessage:startTrade()
   runTimer(0, self:getNPC(), function(npc)
      if getPlayer() then
         getPlayer():startTrade(npc)
         gameplayUI:showTrade(true)
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


function dialogSystem:findReference( messages, id )
   for mk,mv in pairs(messages) do
      if ( mv["ID"] == id ) then
         return mv
      end
   end
   return nil
end

function dialogSystem:restoreConnections( messages )
   for mk,mv in pairs(messages) do
      mv.messages = {}
      if ( mv["connectID"] ) then
         mv.messages[1] = self:findReference( messages, mv["connectID"] )
      elseif ( mv["connectionsID"] ) then
         for i=1,#mv["connectionsID"] do
            if ( mv["connectionsID"][i] ~= -1 ) then
               mv.messages[#mv.messages+1] = self:findReference( messages, mv["connectionsID"][i] )
            end
         end
      end
   end

   -- overwrite switches to direct messages
   for mk,mv in pairs(messages) do
      if ( #mv.messages > 0 and mv.messages[1].type == "switch" ) then
         mv.messages = mv.messages[1].messages
      end
   end

   -- collapse guiding nodes (1 slot switches) (up to 10 consequtive)
   for i = 1, 10 do
      for mk,mv in pairs(messages) do
         if mv.type == "message" then
            if #mv.messages == 1 then
               if mv.messages[1].time == 0 and mv.messages[1].text == "" then
                  mv.messages = mv.messages[1].messages
               end
            elseif #mv.messages > 1 then
               local new_messages = {}
               for k,v in pairs(mv.messages) do
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

   for k1,v1 in pairs(messages) do
      if ( v1.type == "message" ) then
         local foundLink = false
         for k2,v2 in pairs(messages) do
            for k=1,#v2.messages do
               if ( v2.messages[k] == v1 or (v1.time == 0 and v1.text == "")) then
                  foundLink = true
               end
            end
         end
         if ( foundLink == false ) then
            return v1
         end
      end
   end

   return nil
end

function dialogSystem:loadMessageScript( msg_obj, root )
   message = msg_obj

   if ( not message.script ) then
      return
   end

   if ( message.script ~= "" ) then
      --log( "load script for: " .. message.text )
      --Remove blank methods
      message.script = message.script:gsub("function message:onStart%(%)%\nend", "")
      message.script = message.script:gsub("function message:onStop%(%)%\nend", "")
      status, err = pcall(loadstring( message.script,
        string.format("dialog: %s node script ID: %d", root.name, message.ID) ))
      if ( not status ) then
         log( "ERROR: Message has a faulty script." )
         log( err )
         log( "   " .. message.script )
      end

   end
   message.dialog = root

   setmetatable(message, {["__index"] = CMessage})

   message.script = nil

   -- set message topic
   if message.text and message.text ~= "" then
      local pattern = "^%[t_([%w_:]+)%]"
      local topic = string.match(message.text, pattern)
      if topic then
         message:setTopic(topic)
         message.text = string.gsub(message.text, pattern, "", 1)
      end
   end

   if ( msg_obj.messages ) then
      for i=1,#msg_obj.messages do
         self:loadMessageScript( msg_obj.messages[i], root )
      end
   end
end

function dialogSystem:createDialog( dialog_name, unique_name )
   if ( not dialog_name or dialog_name == "" ) then
      return
   end

   local f, err = loadfile( kPathGlobalDialogs .. dialog_name .. ".lua" )
   if err then
      log(string.format("ERROR: Can't load dialog %s:", dialog_name))
      log(err)
      return
   end

   local dialog = f()

   if ( not dialog ) then
      return nil
   end

   local root = self:restoreConnections( dialog )

   root.actors = {}
   root.name = unique_name

   self:loadMessageScript( root, root )

   --log(tostring(root))

   return root
end

function dialogSystem:appendHistory( actor, text )
   local actorStr = ""

   if ( actor ~= self.active_dialog.historyPrevActor ) then
      actorStr = "[colour='FF888888']" .. actor .. ":[colour='FF666666']   "
      self.active_dialog.historyPrevActor = actor
   end

   if ( self.active_dialog.historyText ~= "" ) then
      self.active_dialog.historyText = self.active_dialog.historyText .. "\n"
   end

   self.active_dialog.historyText = self.active_dialog.historyText .. actorStr .. text
end

function dialogSystem:appendHistoryWithId( actor, text, id )
   if isDebug() then
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
function dialogSystem:showMessage( msg_obj, skip_onStop )
   if ( msg_obj.text == "" or msg_obj.time == 0 ) then
      self.active_dialog.active_message = msg_obj
      self:showNextMessage()
      return
   end

   local actorName = self.active_dialog.actors[msg_obj.actor]:getLabel()

   if ( self.active_dialog.prev_message and not skip_onStop) then
      local actorNamePrev = self.active_dialog.actors[self.active_dialog.prev_message.actor]:getLabel()

      self:appendHistoryWithId( actorNamePrev, self.active_dialog.prev_message.text, self.active_dialog.prev_message.ID )

      if ( self.active_dialog.prev_message.onStop ) then
         self.active_dialog.prev_message:onStop()
      end
      self:fireActorEvent( self.active_dialog, self.active_dialog.actors[self.active_dialog.prev_message.actor], "onStopMessage" )

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


   self.active_dialog.active_message = msg_obj

   --TClear()
   if not skip_onStop then
      --log("---------------------------------------------")
   end

   markAsVisited(msg_obj)
   if ( msg_obj.onStart ) then
      msg_obj:onStart()
   end
   self:fireActorEvent( self.active_dialog, self.active_dialog.actors[msg_obj.actor], "onStartMessage" )

   if not skip_onStop then
      --log( "Tells " .. actorName .. ":\n" .. msg_obj.text )
   end
   local txt = msg_obj.text
   if isDebug() then txt = "{" .. msg_obj.ID .. "} " .. msg_obj.text end
   gameplayUI:setDialogText( {actor = actorName, [1] =  txt}, self.active_dialog.historyText )

   self.active_dialog.prev_message = self.active_dialog.active_message

   gameplayUI:showDialogSkipHint()
   local time = (self.space and isDebug("dialogSkip")) and 0.05 or msg_obj.time
   self.active_dialog.message_timer = runTimer( time, dialogSystem, dialogSystem.showNextMessage, false )

--   self:fireEvent( self.active_dialog, "onStartMessage" )
end

function dialogSystem:showActiveMessage( msg_array )
   for i=1,#msg_array do
      local msg = msg_array[i]

      if ( msg.reference ) then
         msg = msg.reference
      end

      local visible = true

      if ( msg.isVisible ) then
         visible = msg:isVisible()
      end

      if ( visible ) then
         self:showMessage( msg )
         return
      end
   end

   self:stopDialog( nil )
end

function dialogSystem:showReplies( msg_array )
   if ( self.active_dialog.prev_message ) then
      local actorNamePrev = self.active_dialog.actors[self.active_dialog.prev_message.actor]:getLabel()

      self:appendHistoryWithId( actorNamePrev, self.active_dialog.prev_message.text, self.active_dialog.prev_message.ID )

      if ( self.active_dialog.prev_message.onStop ) then
         self.active_dialog.prev_message:onStop()
      end

      self:fireActorEvent( self.active_dialog, self.active_dialog.actors[self.active_dialog.prev_message.actor], "onStopMessage" )
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

   local firstMsg = self:findVisibleMessage( msg_array )

   --log( "Tells " .. self.active_dialog.actors[firstMsg.actor]:getName() .. ":" )

   local actorName = self.active_dialog.actors[firstMsg.actor]:getLabel()
   local text = ""

   local index = 1
   local lastVisibleMsg = nil
   local replyTable = { actor = actorName, }
   local passedSwitches = {}
   local arrayIDs = {}
   for _,v in pairs(msg_array) do
      table.insert(arrayIDs, v.ID)
   end
   table.insert(passedSwitches, arrayIDs)
   for i=1,#msg_array do
      local msg = msg_array[i]

      local msgIDs = {}
      for _,val in pairs(msg.messages) do
         table.insert(msgIDs, val.ID)
      end
      table.insert(passedSwitches, msgIDs)

      if ( msg.reference ) then
         msg = msg.reference
      end

      local visible = isMessageVisible(msg)

      if ( visible ) then
         --log( tostring(index) .. ". " .. msg.text )

         index = index + 1
         lastVisibleMsg = msg
         local color = ""
         --Check current message
         if not msg:isFirstTime() and not isTextSpecial(msg.text) and #msg.messages ~= 0 and not hasCustomScript(msg) and not msg:getTopic() then
            local greyOut = true
            for _,checkMsg in pairs(msg.messages) do
               if not isMessageSimple(checkMsg, passedSwitches) then
                  greyOut = false
               end
            end
            if greyOut then
               color = "[colour='FF888888']"
            end
         end
         local txt = msg.text
         if isDebug() then txt = "{" .. msg.ID .. "} " .. msg.text end
         table.insert(replyTable, color .. txt)
      end
   end

   if ( #replyTable == 0 ) then
      self:stopDialog( nil )
      return
   end

   -- if there's only one reply, don't wait for player choice and play it back
   if ( index == 2 ) then
      self:showMessage(lastVisibleMsg, true)
   else
      gameplayUI:setDialogText( replyTable, self.active_dialog.historyText )

      waitAnswer = true
   end

--   self:fireEvent( self.active_dialog, "onStopMessage" )
end

function dialogSystem:findVisibleMessage( messages )
   for i=1,#messages do
      local msg = messages[i]

      if ( msg.reference ) then
         msg = msg.reference
      end

      if ( msg.isVisible ) then
         if ( msg:isVisible() ) then
            return msg
         end
      else
         return msg
      end
   end

   return nil
end

function dialogSystem:showNextMessage()
   if ( not self.active_dialog ) then
      return
   end

   gameplayUI:hideDialogSkipHint()
   self.active_dialog.message_timer = nil

   local messages = self.active_dialog.active_message.messages

   if ( not messages ) then
      self:stopDialog( nil )
      return
   end

   local msg = self:findVisibleMessage( messages )

   if ( msg ) then
      if ( self.active_dialog.actors[msg.actor] == getPlayer() ) then
         if not isDebug("dialogDebug") then
            for k,v in pairs(messages) do
               if v.text == "debug" then
                  local msg2 = self:findVisibleMessage( messages[2].messages )
                  if msg2 and self.active_dialog.actors[msg2.actor] == getPlayer() then
                     self:showReplies(messages[2].messages)
                  else
                     self:showActiveMessage( messages[2].messages )
                  end
                  return
               end
            end
         end
         self:showReplies( messages )
      else
         self:showActiveMessage( messages )
      end
   else
      self:stopDialog( nil )
   end
end

function dialogSystem:selectAnswer( answerNum )

   if ( waitAnswer and self.active_dialog and self.active_dialog.active_message ) then

      local visibleReplies = {}
      local messages        = self.active_dialog.active_message.messages

      for i=1,#messages do
         local msg = messages[i]

         if ( msg.reference ) then
            msg = msg.reference
         end

         if ( not msg.isVisible or msg:isVisible() ) then
            if isTextTrade(msg.text) then
               visibleReplies.tradeMsg = msg
            else
               visibleReplies[#visibleReplies+1] = msg
            end
         end
      end

      if answerNum == "tradeMsg" or ( #visibleReplies > 0 and answerNum > 0 and #visibleReplies >= answerNum ) then

         waitAnswer = false

         local msg = visibleReplies[answerNum]

         if ( msg.reference ) then
            msg = msg.reference
         end

         markAsVisited(msg)
         if ( msg.onStart ) then
            msg:onStart()
         end
         self:fireActorEvent( self.active_dialog, self.active_dialog.actors[msg.actor], "onStartMessage" )


         self.active_dialog.prev_message   = msg
         self.active_dialog.active_message = msg

         self:showNextMessage()
         return true
      end
   end

   return false
end

function dialogSystem:fireEvent( dialog, event_name )
   if ( not dialog or not dialog.active_message ) then
      return
   end

   self:fireActorEvent( dialog, dialog.actors[dialog.active_message.actor], event_name )
end

function dialogSystem:fireActorEvent( dialog, actor, event_name )
   if ( not actor ) then
      return
   end

   local event = nil

   if ( actor ) then
      event = actor[event_name]
   end

   if ( event ) then
      event( actor )
   end
end

function dialogSystem:inputKey( key )
   if ( not self.active_dialog or not self.active_dialog.active_message ) then
      return false
   end

   --log("key = " .. tostring(key))

   if ( key >= 48 and key <= 57 ) then
      self:selectAnswer( key-48 )
   elseif ( key == 2 or key == PC_JUMP ) then
      if ( self.active_dialog.message_timer ) then
         self.active_dialog.message_timer:stop()
         dialogSystem:showNextMessage()
      end
   end

   return true
end

function dialogSystem:stopDialog( dialog )
   if ( self.active_dialog == dialog or not dialog ) then

      if ( self.active_dialog.prev_message and self.active_dialog.prev_message.onStop ) then
         self.active_dialog.prev_message:onStop()
      end

--      self:fireEvent     ( self.active_dialog, "onStopMessage" )
      if self.active_dialog.prev_message then
         self:fireActorEvent( self.active_dialog, self.active_dialog.actors[self.active_dialog.prev_message.actor], "onStopMessage" )
      end

      for i=1,#self.active_dialog.actors do
         if ( self.active_dialog.actors ) then
            self:fireActorEvent( self.active_dialog, self.active_dialog.actors[i], "onStopDialog" )
         end
      end

      self.active_dialog.active_message = nil
      self.active_dialog = nil

      gameplayUI:setDialogText( nil, nil )

      log("talk stop")
   end
end

function dialogSystem:playDialog( dialog )
   if ( not dialog ) then
      return
   end

   dialog.historyText      = ""
   dialog.historyPrevActor = ""

   dialog.message_timer = nil
   dialog.prev_message  = nil

   self.active_dialog = dialog
   self.active_dialog.active_message = { actor=1, script="", text="", messages={dialog}, time=0 }

   self:showNextMessage()
end
