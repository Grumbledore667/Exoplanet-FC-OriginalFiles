local oo = require "loop.simple"

local f = require "fun"
local partial = f.partial
local tablex = require "pl.tablex"
local stringx = require "pl.stringx"
local plText = require "pl.text"

local GUIUtils = require "ui.utils"
local wndMgr

local CBaseModule = require "ui.baseModule"

---@class CJournalUI : CBaseModule
local CJournalUI = oo.class({
   layoutName = "journal.layout",
   initAsInteractive = true,
   initPlayerControlled = true,
}, CBaseModule)

--Methods
function CJournalUI:init()
   wndMgr = CEGUI.WindowManager:getSingleton()

   CBaseModule.init(self)

   self.questsOrder = {}
   self.questLogs = {}

   self.logsPane = self.wnd:getChild("LogsBackground/LogsPane")
   self.logsContainer = self.wnd:getChild("LogsBackground/LogsPane/LogsContainer"):toVerticalLayoutContainer()
   self.quests = self.wnd:getChild("QuestsBackground/Quests")
   self.hideFinishedQuests = self.wnd:getChild("QuestsBackground/HideFinishedQuests")
   GUIUtils.widgetSubscribeEventProtected(self.hideFinishedQuests, "MouseClick", partial(self.onHideFinishedQuests, self))
   runTimer(0, nil, function()
      self.hideFinishedQuests:setProperty("Selected", tostring(getGlobalParam("hideFinishedQuests")))
   end,false)

   local tooltipFont = "[font='dialog-10']"
   local wnd = self.quests:getChild("Quest1")
   local index = 2
   local questsCount = tablex.size(quests)
   for _,q in pairs(quests) do
      table.insert(self.questsOrder, q)
      wnd:getChild("Label"):setText(q.title)
      wnd:setName(q.name)
      if not q:isStarted() then
         wnd:setVisible(false)
      end

      local formattedDescription = plText.fill(q.description, 70)
      wnd:setTooltipText(tooltipFont .. formattedDescription)
      wnd:getTooltip():setProperty("DisplayTime", "25")

      GUIUtils.widgetSubscribeEventProtected(wnd, "MouseClick", partial(self.onQuestSelect, self))
      GUIUtils.widgetSubscribeEventProtected(wnd:getChild("Checkbox"), "MouseClick", partial(self.onQuestCheckbox, self))
      GUIUtils.widgetSubscribeEventProtected(wnd:getChild("Button"), "Clicked", partial(self.onQuestMapCenter, self))

      if questsCount >= index then
         wnd = wnd:clone()
         wnd:setName("Quest" .. index)
         self.quests:addChild(wnd)
         index = index + 1
      end
   end

   self.showOnMapButton = self.wnd:getChild("LogsBackground/ShowOnMap")
   self.showOnMapButton:setVisible(false)
   GUIUtils.widgetSubscribeEventProtected(self.showOnMapButton, "Clicked", partial(self.onQuestMapCenter, self))

   GUIUtils.widgetSubscribeEventProtected(self.wnd, "Sized", partial(self.onWindowSized, self))
end

function CJournalUI:updateQuestsList()
   local function sortFunc(a,b)
      local orderA = 1
      local orderB = 1
      if not a:isTracked() then
         orderA = orderA + 1
      end
      if not b:isTracked() then
         orderB = orderB + 1
      end

      if a:isFinished() then
         orderA = orderA + 1
      end
      if b:isFinished() then
         orderB = orderB + 1
      end

      if orderA == orderB then
         orderA = a.title
         orderB = b.title
      end

      return orderA < orderB
   end

   runTimer(0, nil, function()
      local index = 0
      local sortedIterator = tablex.sortv(self.questsOrder, sortFunc)
      for _,q in sortedIterator do
         local wnd = self.quests:getChild(q.name)
         if not q.hidden and q:isStarted() and not (q:isFinished() and getGlobalParam("hideFinishedQuests")) then
            index = index + 1
            wnd:setVisible(true)
            if q:isFinished() then
               wnd:getChild("Checkbox"):setVisible(false)
               wnd:getChild("Label"):setUserString("defaultColour", "FF888888")
               wnd:getChild("Label"):setProperty("TextColours", "FF888888")
            end
            if gameplayUI.mapUI.activeMarkers[q.name] then
               wnd:getChild("Button"):setVisible(true)
            else
               wnd:getChild("Button"):setVisible(false)
            end

            wnd:setPosition(CEGUI.UVector2(CEGUI.UDim(0,0), CEGUI.UDim(0.07*(index-1),0)))
            wnd:getChild("Checkbox"):setProperty("Selected", tostring(q:isTracked()))
         else
            if self.selectedQuest == q and getGlobalParam("hideFinishedQuests") then
               self:updateJournalQuestLog(nil)
            end
            wnd:setVisible(false)
            q:setMarkersVisible(false)
         end
      end
   end, false)
end

function CJournalUI:onShow()
   CBaseModule.onShow(self)

   gameplayUI.mapUI:show(false)
   self:updateQuestsList()
   gameplayUI.annoyingHintUI:completeTask("journal")

   if self.selectedQuest then
      self:updateJournalQuestLog(self.selectedQuest)
   else
      for _,q in pairs(quests) do
         if q:isStarted() then
            self:updateJournalQuestLog(q)
            break
         end
      end
   end
end

function CJournalUI:updateSelectedJournalQuestLog(quest)
   if self.selectedQuest == quest then
      runTimer(0, nil, function()
         self:updateJournalQuestLog(quest)
      end,false)
   end
end

function CJournalUI:updateJournalQuestLog(quest)
   for _,window in ipairs(self.questLogs) do
      self.logsContainer:destroyChild(window)
   end
   self.questLogs = {}
   self.logsContainer:layout()

   if not quest then return end

   if self.selectedQuest then
      gameplayUI:setTextWndSelected(self.quests:getChild(self.selectedQuest.name .. "/Label"), false)
   end

   self.selectedQuest = quest
   gameplayUI:setTextWndSelected( self.quests:getChild(quest.name .. "/Label"), true)

   local logText = quest.description .. quest.log

   for i,text in pairs(stringx.split(logText,"***")) do
      if i > 1 then
         local delimiter = self:createSeparateLogWindow("***", i .. "Delimiter")
         delimiter:setProperty("HorzFormatting", "CentreAligned")
      end
      --Allow logs to use \n linebreaks, consecutive linebreaks create empty log windows
      for _,str in pairs(stringx.split(text,"\n")) do
         self:createSeparateLogWindow(str)
      end
   end
   --Otherwise sizes won't be accurate. Probably has to do with the fact that we resize logs with relative scale
   --And the container resizes itself every time you change it's children.
   self:resizeLogWindows()
   self:resizeLogWindows()

   if gameplayUI.mapUI.activeMarkers[quest.name] then
      self.showOnMapButton:setVisible(true)
   else
      self.showOnMapButton:setVisible(false)
   end
end

function CJournalUI:createSeparateLogWindow(text)
   local window = self.logsContainer:createChild("TaharezLook/Label", "")
   window:setWidth(CEGUI.UDim(1, 0))
   window:setText(text)
   window:setProperty("Font", "DejaVuSans-10")
   window:setProperty("HorzFormatting", "WordWrapJustified")
   window:setProperty("MousePassThroughEnabled", "true")
   window:setMinSize(CEGUI.USize(CEGUI.UDim(0,0), CEGUI.UDim(0, window:getFont():getFontHeight()))) --For empty lines

   table.insert(self.questLogs, window)
   return window
end

function CJournalUI:resizeLogWindows()
   for _,window in ipairs(self.questLogs) do
      GUIUtils.adjustWindowHeightToVertExtent(window)
   end
   self.logsContainer:layout()
   self.resizeTimer = nil
end


--Callbacks
function CJournalUI:onWindowSized(args)
   if self.resizeTimer then return end --Helps reduce lag during resizing
   self.resizeTimer = runTimer(0, self, self.resizeLogWindows, false)
end

function CJournalUI:onHideFinishedQuests(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      local newState = click_args.window:getProperty("Selected") == "true"
      setGlobalParam("hideFinishedQuests", newState)
      self:updateQuestsList()
   end
end

function CJournalUI:onQuestCheckbox(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      local questName = click_args.window:getParent():getName()
      local newState = click_args.window:getProperty("Selected") == "true"
      local q = quests[questName]

      if newState ~= q:isTracked() then
         if newState then
            self:updateJournalQuestLog(q)
         end
         q:setTracked(newState)
         self:updateQuestsList()
      end
   end
end

function CJournalUI:onQuestMapCenter(args)
   local we_args = args:toWindowEventArgs()
   local questName = self.selectedQuest.name
   if we_args.window:getParent():getName() ~= "LogsBackground" then
      questName = we_args.window:getParent():getName()
   end
   local mapItem = getMC():getInventory():getItemByName(gameplayUI.mapUI.currentMapItemName)
   if gameplayUI.mapUI.activeMarkers[questName] and mapItem then
      local pos = gameplayUI.mapUI.activeMarkers[questName][1][1]:getPosition()
      gameplayUI.mapUI:mapCenterOnPos({pos.x.scale, pos.y.scale})
      if gameplayUI.mapUI:isVisible() then
         gameplayUI.mapUI.wnd:activate()
      else
         getMC():useItem(mapItem)
      end
      self:show(false)
   elseif not mapItem then
      gameplayUI:showInfoTextEx("You don't have any maps", "minor", "")
   end

   self.quests:getChild(questName.."/Checkbox"):setProperty("Selected", "true")

   quests[questName]:setTracked(true)
   self:updateJournalQuestLog(quests[questName])
end

function CJournalUI:onQuestSelect(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      local questName = click_args.window:getName()
      self:updateJournalQuestLog(quests[questName])
   end
end

return CJournalUI
