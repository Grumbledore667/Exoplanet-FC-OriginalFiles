local GUIUtils = require "ui.utils"
local wndMgr
local imgMgr

local api = {}

--Internal
local function initNewsTab()
   local tabWnd = gameplayUI.terminal.tabs[1].wnd

   local wnd = wndMgr:createWindow("TaharezLook/StaticImage", "Logo")
   tabWnd:addChild(wnd)

   wnd:setSize    (CEGUI.USize(CEGUI.UDim(1,0), CEGUI.UDim(1,0)))
   wnd:setProperty("Image", "terminal/Logo")
end

local function initJobTab()
   local tabWnd = gameplayUI.terminal.tabs[2].wnd

   local height = #gameplayUI.terminal.jobDb * 145
   tabWnd:setProperty("ContentPaneAutoSized", "false")
   tabWnd:setProperty("ContentArea", "l:0 t:0 r:900 b:" .. height)

   for i=1,#gameplayUI.terminal.jobDb do
      local quest = getQuest(gameplayUI.terminal.jobDb[i].quest)
      if quest then
         gameplayUI.terminal.jobDb[i].title   = quest.title
         gameplayUI.terminal.jobDb[i].summary = quest.description
      end

      if gameplayUI.terminal.jobDb[i].title then
         local wnd = wndMgr:loadLayoutFromFile("job.layout")
         wnd:setName("Job" .. tostring(i))
         wnd:setPosition(CEGUI.UVector2(CEGUI.UDim(0,0), CEGUI.UDim(0,wnd:getSize().height.offset*(i-1))))
         tabWnd:addChild(wnd)

         wnd:getChild("Title"):setText(gameplayUI.terminal.jobDb[i].title .. "\n[font='dialog-14']" .. gameplayUI.terminal.jobDb[i].summary)

         wnd:getChild("Icon"):setProperty("Image", "jobs/" .. gameplayUI.terminal.jobDb[i].icon)

         wnd:getChild("Button"):setUserString("quest", gameplayUI.terminal.jobDb[i].quest)
         GUIUtils.widgetSubscribeEventProtected(wnd:getChild("Button"), "Clicked", api.onJobDetails)

         gameplayUI.terminal.jobDb[i].button = wnd:getChild("Button")
      end
   end

   gameplayUI.terminal.tabs[2].detailsWnd = wndMgr:loadLayoutFromFile("job_details.layout")
   local wndDetails = gameplayUI.terminal.tabs[2].detailsWnd

   GUIUtils.widgetSubscribeEventProtected(wndDetails:getChild("Accept"), "Clicked", api.onJobAccept)
   GUIUtils.widgetSubscribeEventProtected(wndDetails:getChild("Return"), "Clicked", api.onJobDetailsClose)
   wndDetails:setVisible(false)

   gameplayUI.terminal.wnd:addChild(wndDetails)
end

local function initWantedTab()
   local tabWnd = gameplayUI.terminal.tabs[3].wnd

   for i=1,#gameplayUI.terminal.wantedDb do
      local wnd = wndMgr:loadLayoutFromFile("wanted.layout")
      wnd:setName("Profile" .. tostring(i))
      wnd:setPosition(CEGUI.UVector2(CEGUI.UDim(0,0), CEGUI.UDim(0,wnd:getSize().height.offset*(i-1))))
      tabWnd:addChild(wnd)

      wnd:getChild("Wanted"):setProperty("Font", "venus rising rg-14")
      wnd:getChild("Crimes"):setProperty("Font", "venus rising rg-14")
      wnd:getChild("Name"  ):setProperty("Font", "venus rising rg-14")
      wnd:getChild("Info"  ):setProperty("Font", "venus rising rg-12")

      wnd:getChild("Name"):setText(gameplayUI.terminal.wantedDb[i].name)
      wnd:getChild("Info"):setText(gameplayUI.terminal.wantedDb[i].crimes)

      local imageName = "wanted" .. tostring(i)
      if not imgMgr:isDefined(imageName) then
         imgMgr:addFromImageFile(imageName, imageName .. ".png")
      end
      wnd:getChild("Photo"):setProperty("Image", imageName)
   end
end

local function createTabs()
   local tabSize = 1/#gameplayUI.terminal.tabs

   gameplayUI.terminal.tabControl:setTabHeight     (CEGUI.UDim(0.1,0))
   gameplayUI.terminal.tabControl:setTabTextPadding(CEGUI.UDim(tabSize*0.4,0))

   for i=1,#gameplayUI.terminal.tabs do
      local tab = gameplayUI.terminal.tabs[i]
      tab.wnd = wndMgr:createWindow("TaharezLook/ScrollablePane", tab.name)
      tab.wnd:setSize(CEGUI.USize(CEGUI.UDim(0.97,0), CEGUI.UDim(1,0)))
      tab.wnd:setText(tab.title)

      GUIUtils.widgetSubscribeEventProtected(tab.wnd, "ContentPaneScrolled", api.onTabScrolled)

      gameplayUI.terminal.tabControl:addTab(tab.wnd)
   end

   initNewsTab()
   initJobTab()
   initWantedTab()
end


--Methods
function api.init()
   wndMgr = CEGUI.WindowManager:getSingleton()
   imgMgr = CEGUI.ImageManager:getSingleton()
   gameplayUI.terminal =
   {
      activeTerminal = nil,
      context    = nil,
      wnd        = nil,
      tabControl = nil,
      tabs       =
      {
         {name="News"  , title = "NEWS"  , wnd=nil},
         {name="Job"   , title = "JOB"   , wnd=nil, detailsWnd = nil},
         {name="Wanted", title = "WANTED", wnd=nil},
      },

      jobDb =
      {
         -- info for quests is taken from quests
         {quest="greenbug",    icon="Find",},
         {quest="wet_work",    icon="Find",},
         {quest="scarecrow",   icon="Kill",},
         --{quest="sweetdreams", icon="Kill",},
         --{quest="",            icon="Find", title="No rest for thew wicked.",},
         --{quest="",            icon="Find", title="Booze must flow! ",},
         --{quest="",            icon="Kill", title="An eye for an eye.",},
         --{quest="",            icon="Kill", title="Every little ear helps.",},
      },

      wantedDb =
      {
         {name="JACK SHARP"    , crimes="Killed the Great Chief Red Leg and his five sons at Robinson's camp\n\nFifty times a killer! Dangerous and always armed\n\n7000 Crystals Reward",},
         {name="JETCUTTER"     , crimes="Womanizing\nArms Smuggling\nExtremely Dangerous",},
         {name="LOST PROPHET"  , crimes="Pulled off a gold heist and disappeared\nUnpredictable",},
         {name="JACK VAN SAND" , crimes="Famous killer for hire\nKilled Sheriff\nVery Dangerous",},
         {name="MITCHELL NELLI", crimes="Treason\nMurder\nIllegal Distribution Of Laser Munitions",},
         {name="LADY DI"       , crimes="Crimes against the coffers of the wealthy\nThe morals of the pious\nThe delicate sensibilities of the unfashionable\nThe fallibilities of the male heart",},
      },
   }


   gameplayUI.terminal.context = createGUIContext("terminal.layout", "terminal.gui", false)

   gameplayUI.terminal.context:setDefaultFont("venus rising rg-10")
   gameplayUI.terminal.context:getMouseCursor():setDefaultImage("terminal/Cursor")
   gameplayUI.terminal.context:getMouseCursor():hide()

   gameplayUI.terminal.wnd        = gameplayUI.terminal.context:getRootWindow()
   gameplayUI.terminal.tabControl = CEGUI.toTabControl(gameplayUI.terminal.wnd:getChild("TabControl"))

   GUIUtils.widgetSubscribeEventProtected(gameplayUI.terminal.tabControl, "SelectionChanged", api.onTabChanged)

   createTabs()
end

function api.updateJobDetails()
   local wndDetails = gameplayUI.terminal.tabs[2].detailsWnd

   local questName = GUIUtils.getWindowUserStringSafe(wndDetails, "quest")
   local quest
   if questName then
      quest  = getQuest(questName)
   end
   local button = wndDetails:getChild("Accept")

   if quest then
      button:setProperty("Text", "ACCEPT")

      if quest:isTerminalFinished() then
         button:setProperty("Text", "FINISH")
      elseif quest:isFinished() then
         button:setProperty("Text", "COMPLETED")
         wndDetails:setUserString("quest", "")
      elseif quest:isActive() then
         button:setProperty("Text", "STARTED")
      end
   end

   for i=1,#gameplayUI.terminal.jobDb do
      quest = getQuest(gameplayUI.terminal.jobDb[i].quest)

      if quest then
         if quest:isFinished() then
            gameplayUI.terminal.jobDb[i].button:setProperty("Text", "COMPLETED")
            gameplayUI.terminal.jobDb[i].button:setUserString("quest", "")
         end
      end
   end
end

function api.showMenu()
   gameplayUI.terminal.context:setRootWindow(gameplayUI.terminal.wnd)
end

function api.hideMenu()
   gameplayUI.terminal.context:setRootWindow(nil)
end

function api.showCursor()
   gameplayUI.terminal.context:getMouseCursor():show()
end

function api.hideCursor()
   gameplayUI.terminal.context:getMouseCursor():hide()
end

function api.isCursorVisible()
   return gameplayUI.terminal.context:getMouseCursor():isVisible()
end

function api.showInitTab()
   api.showMenu()
   api.updateJobDetails()
   gameplayUI.terminal.tabControl:setSelectedTabAtIndex(0)

   gameplayUI.terminal.tabs[2].detailsWnd:setVisible(false)
end

function api.clickElement()
   if gameplayUI.terminal.activeTerminal then
      gameplayUI.terminal.activeTerminal:clickElement()
   end
end

function api.acceptElement()
   if gameplayUI.terminal.activeTerminal then
      gameplayUI.terminal.activeTerminal:acceptElement()
   end
end

function api.denyElement()
   if gameplayUI.terminal.activeTerminal then
      gameplayUI.terminal.activeTerminal:denyElement()
   end
end


--Callbacks
function api.onTabChanged(args)
   api.clickElement()
end

function api.onTabScrolled(args)
   api.clickElement()
end

function api.onJobAccept(args)
   local wndDetails = gameplayUI.terminal.tabs[2].detailsWnd
   local questName  = GUIUtils.getWindowUserStringSafe(wndDetails, "quest")

   if questName then
      local quest = getQuest(questName)
      if quest then
         if not quest:isStarted() then
            --log("starting" .. quest.name)
            quest:start()
            api.acceptElement()
         elseif quest:isTerminalFinished() then
            -- questSystem:fireEvent("finish", "")
            quest:finish()
            api.clickElement()
         else
            api.denyElement()
         end
         api.updateJobDetails()
      end
   end
end

function api.onJobDetails(args)
   --log("details")
   local we_args = args:toWindowEventArgs()
   local wndDetails = gameplayUI.terminal.tabs[2].detailsWnd
   local questName = GUIUtils.getWindowUserStringSafe(we_args.window, "quest")

   if questName then
      local quest = getQuest(questName)
      if quest then
         wndDetails:setVisible(true)
         wndDetails:moveToFront()
         wndDetails:setUserString("quest", questName)
         wndDetails:getChild("Title"):setProperty("Text", quest.title)
         wndDetails:getChild("Description"):setProperty("Text", quest.description)
         api.updateJobDetails()
      end
   end

   api.clickElement()
end

function api.onJobDetailsClose(args)
   local wndDetails = gameplayUI.terminal.tabs[2].detailsWnd
   wndDetails:setVisible(false)

   api.clickElement()
end

return api
