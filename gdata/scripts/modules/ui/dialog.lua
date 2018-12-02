local oo = require "loop.simple"

local animMgr
local f = require "fun"
local partial = f.partial

local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CDialogUI : CBaseModule
local CDialogUI = oo.class({
   layoutName = "gameplay/dialog.layout",
   initAsInteractive = true,
}, CBaseModule)

local DEFAULT_COLORTAG = "FFFFFFFF"
local REPLY_COLORTAG = "FF4499EE"

--for total animation duration
local TEXT_TIME_BONUS = 3 --Flat bonus in seconds

-- from https://forums.coronalabs.com/topic/42019-split-utf-8-string-word-with-foreign-characters-to-letters/
local function UTF8ToCharArray(str)
   local charArray = {}
   local iStart = 0
   local strLen = str:len()

   local function bit(b)
      return 2 ^ (b - 1)
   end

   local function hasbit(w, b)
      return w % (b + b) >= b
   end

   local checkMultiByte = function(i)
      if (iStart ~= 0) then
         charArray[#charArray + 1] = str:sub(iStart, i - 1)
         iStart = 0
      end
   end

   for i = 1, strLen do
      local b = str:byte(i)
      local multiStart = hasbit(b, bit(7)) and hasbit(b, bit(8))
      local multiTrail = not hasbit(b, bit(7)) and hasbit(b, bit(8))

      if (multiStart) then
         checkMultiByte(i)
         iStart = i

      elseif (not multiTrail) then
         checkMultiByte(i)
         charArray[#charArray + 1] = str:sub(i, i)
      end
   end

   -- process if last character is multi-byte
   checkMultiByte(strLen + 1)

   return charArray
end

--Methods
function CDialogUI:init()
   CBaseModule.init(self)

   animMgr = CEGUI.AnimationManager:getSingleton()
   self.bottom = {
      tradeButton = {wnd = nil},
      linesTaken = 0,
      replies = {wnd = nil, entries = {}, shownCount = 0},
   }

   self.bottom.tradeButton.wnd = self.wnd:getChild("BottomLine/Trade")
   GUIUtils.widgetSubscribeEventProtected(self.bottom.tradeButton.wnd, "Clicked", partial(self.onDialogTradeClick, self))
   self.bottom.actor = self.wnd:getChild("BottomLine/Actor")


   self.bottom.replies.wnd = self.wnd:getChild("BottomLine/Replies")
   for i=1,15 do
      local wnd
      if i == 1 then
         wnd = self.wnd:getChild("BottomLine/Replies/Reply1")
      else
         wnd = self.bottom.replies.entries[1].wnd:clone(true)
         wnd:setName("Reply"..i)
         self.bottom.replies.wnd:addChild(wnd)
      end
      wnd:setVisible(false)
      wnd:setID(i)

      for _, wndName in ipairs({"NodeID", "ReplyID", "NodeText"}) do
         local w =  wnd:getChild(wndName)
         GUIUtils.widgetSubscribeEventProtected(w, "MouseEntersArea", partial(self.onDialogMouseOver, self))
         GUIUtils.widgetSubscribeEventProtected(w, "MouseLeavesArea", partial(self.onDialogMouseOut, self))
         GUIUtils.widgetSubscribeEventProtected(w, "MouseClick", partial(self.onDialogReplyClicked, self))
      end

      table.insert(self.bottom.replies.entries, {wnd = wnd, originalColor = nil, mouseLeavesArea = nil})
   end

   self.hint = self.wnd:getChild("BottomLine/Hint")
   self.textOld = self.wnd:getChild("TopLine/TextOld")

   self.textOld:setProperty("Text", "")

   self:onResolutionChanged()
end

function CDialogUI:onShow()
   CBaseModule.onShow(self)

   showGameplayUI(false)
   gameplayUI.subtitlesUI:onDialogStart()
   gameplayUI.annoyingHintUI:onDialogStart()
end

function CDialogUI:onHide()
   CBaseModule.onHide(self)

   self.textOld:setProperty("Text", "")
   gameplayUI.subtitlesUI:onDialogEnd()
   gameplayUI.annoyingHintUI:onDialogEnd()
   showGameplayUI(true)
end

function CDialogUI:setDialogText(replyTable, textOld)
   if replyTable then
      self:show(true)

      self:showTradeButton(false)
      self:clearReplies()

      self.textOld:setProperty("Text", textOld)
      self.textOld:setProperty("VertScrollPosition", tostring(self.textOld:getProperty("VertExtent")))

      --A delay is needed to properly catch MouseLeavesArea and then catch a new MouseEntersArea
      runTimer(0, nil, function()
         self:setupReplies(replyTable)
      end, false)
   else
      self:show(false)
   end
end

function CDialogUI:setupReplies(t)
   self.bottom.actor:setText(t.actor..":")
   for i=1,#t do
      if string.find(t[i], "%[TRADE%]") then
         table.remove(t, i)
         self:showTradeButton(true)
         break
      end
   end
   for i=1,#t do
      local text = t[i]
      local nodeID = string.match(text, "%{.-%}")
      if nodeID then
         text = text:gsub("%{.-%}", "")
      end
      if #t > 1 or #t == 1 and self:isDialogTradeButtonVisible() then
         local colorTag = string.match(text, "%[colour=.-%]")
         if colorTag then
            text = string.sub(text, string.find(text,"%]")+1)
            colorTag = string.match(colorTag, "%a+%d+")
         else
            colorTag = REPLY_COLORTAG
         end
         self:setupReplyText(nodeID, text, colorTag, true)
      else
         --Means it's a single and timed reply
         self:setupReplyText(nodeID, text, nil, false)
      end
   end
end

function CDialogUI:setupReplyText(nodeID, text, colorTag, showReplyID)
   self.bottom.replies.shownCount = self.bottom.replies.shownCount + 1
   local index = self.bottom.replies.shownCount
   local reply = self.bottom.replies.entries[index]
   local NodeText = reply.wnd:getChild("NodeText")
   local NodeID = reply.wnd:getChild("NodeID")
   local ReplyID =  reply.wnd:getChild("ReplyID")
   local Ypos = CEGUI.UDim(0,0)

   GUIUtils.adjustWindowForText(NodeText, text, true)

   --Means we have a list of player replies
   if showReplyID then
      NodeText:setText(text)
      ReplyID:setText(index .. ". ")
      local prevReply = self.bottom.replies.entries[index-1]
      if prevReply then
         local prevYpos = prevReply.wnd:getYPosition()
         Ypos.offset = prevYpos.offset + prevReply.wnd:getPixelSize().height
      end
   else --single reply
      ReplyID:setText("")
      self:createTextAnimation(reply, text)
   end

   if nodeID then
      NodeID:setText(nodeID)
      NodeID:setVisible(true)
   else
      NodeID:setVisible(false)
   end

   if colorTag then
      NodeText:setProperty("NormalTextColour", colorTag)
      ReplyID:setProperty("NormalTextColour", colorTag)
   else
      NodeText:setProperty("NormalTextColour", DEFAULT_COLORTAG)
      ReplyID:setProperty("NormalTextColour", DEFAULT_COLORTAG)
   end
   reply.originalColor = NodeText:getProperty("NormalTextColour")

   reply.wnd:setYPosition(Ypos)
   reply.wnd:setVisible(true)
end

function CDialogUI:createTextAnimation(reply, text)
   local processedText = UTF8ToCharArray(text)
   local NodeText = reply.wnd:getChild("NodeText")

   local animation = animMgr:createAnimation("") --Creates an animation with a unique name
   animation:setDuration(1)
   animation:setReplayMode(CEGUI.Animation.RM_Once)
   animation:setAutoStart(true)
   local affector = animation:createAffector("Text", "String")
   affector:setApplicationMethod(CEGUI.Affector.AM_Absolute)

   --Setup frames
   self.textDuration = 0
   local frameTime = 0
   local bracketDepth = 0
   local textInTime = ""
   local skipBrackets = NodeText:isTextParsingEnabled()
   for _, char in ipairs(processedText) do
      textInTime = textInTime .. char
      if char == "[" then
         bracketDepth = bracketDepth + 1
      elseif char == "]" then
         bracketDepth = math.max(0, bracketDepth - 1)
      end
      if not skipBrackets or bracketDepth == 0 then
         affector:createKeyFrame(frameTime, textInTime)
         frameTime = frameTime + self:getCharAnimationDuration(char)
      end
   end
   if skipBrackets and bracketDepth > 0 then --ends with brackets not matched just add last frame to show text
      affector:createKeyFrame(frameTime, textInTime)
   end
   self.textDuration = frameTime

   animation:setDuration(self.textDuration)

   local instance = animMgr:instantiateAnimation(animation)
   instance:setTargetWindow(NodeText)

   reply.animation = animation
   reply.animationInstance = instance

   self.textDuration = self.textDuration + TEXT_TIME_BONUS
end

function CDialogUI:getCharAnimationDuration(char)
   return 1 / getGameOption("dialogSpeed")
end

--The visible time of the text is still mostly chosen in favor of dialog node time set in editor(through math.max)
function CDialogUI:getTextDuration()
   return self.textDuration
end

function CDialogUI:isTextAnimationInProgress()
   local reply = self.bottom.replies.entries[1]
   if reply.animationInstance then
      return reply.animationInstance:isRunning()
   end
end

function CDialogUI:skipTextAnimation()
   local reply = self.bottom.replies.entries[1]
   if reply.animationInstance and reply.animation then
      local pos = reply.animation:getDuration()
      reply.animationInstance:setPosition(pos)
   end
end

function CDialogUI:clearReplies()
   for _,reply in ipairs(self.bottom.replies.entries) do
      reply.wnd:setVisible(false)
      reply.wnd:setPosition(CEGUI.UVector2(CEGUI.UDim(0,0), CEGUI.UDim(0, 0)))
      if reply.animation then
         animMgr:destroyAllInstancesOfAnimation(reply.animation)
         animMgr:destroyAnimation(reply.animation)
         reply.animation = nil
      end
   end
   self.bottom.linesTaken = 0
   self.bottom.replies.shownCount = 0
end

function CDialogUI:setDialogHintText(text)
   self.hint:setText(text)
end

function CDialogUI:isDialogHintTextEmpty()
   return self.hint:getText() == ""
end

function CDialogUI:showTradeButton(state)
   self.bottom.tradeButton.wnd:setVisible(state)
end

function CDialogUI:isDialogTradeButtonVisible()
   return self.bottom.tradeButton.wnd:isVisible()
end

function CDialogUI:onResolutionChanged()
   local screenSizeOffset = gameplayUI.wndGameplay:getPixelSize().height
   self.bottom.replies.wnd:setWidth(CEGUI.UDim(0, screenSizeOffset))
   self.bottom.replies.wnd:setXPosition(CEGUI.UDim(0.5, -screenSizeOffset/2))
   self.bottom.actor:setXPosition(CEGUI.UDim(0.5, -screenSizeOffset/2 + 75)) --add the exact size of the NodeID window
end

--Callbacks
function CDialogUI:onDialogMouseOver(args)
   local me_args = args:toMouseEventArgs()
   local ID = me_args.window:getParent():getID()
   local reply = self.bottom.replies.entries[ID]
   if reply then
      reply.wnd:getChild("ReplyID"):setProperty("NormalTextColour", "FFFFFFFF")
      reply.wnd:getChild("NodeText"):setProperty("NormalTextColour", "FFFFFFFF")
   end
end

function CDialogUI:onDialogMouseOut(args)
   if CEGUI then
      local me_args = args:toMouseEventArgs()
      local ID = me_args.window:getParent():getID()
      local reply = self.bottom.replies.entries[ID]
      if reply then
         reply.wnd:getChild("ReplyID"):setProperty("NormalTextColour", reply.originalColor)
         reply.wnd:getChild("NodeText"):setProperty("NormalTextColour", reply.originalColor)
      end
   end
end

function CDialogUI:onDialogReplyClicked(args)
   local me_args = args:toMouseEventArgs()
   local ID = me_args.window:getParent():getID()
   local reply = self.bottom.replies.entries[ID]
   if me_args.button == CEGUI.LeftButton and reply.wnd:getChild("ReplyID"):isVisible() then
      dialogSystem:selectAnswer(me_args.window:getParent():getID())
   end
end

function CDialogUI:onDialogTradeClick(args)
   dialogSystem:selectAnswer("tradeMsg")
end

return CDialogUI
