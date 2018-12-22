dofile("./gdata/scripts/modules/menuUtils.lua")

local oo            = require "loop"
local ItemsData     = (require "itemsData")
local WeatherSystem = (require "environment.weather").WeatherSystem
local Weather       = (require "environment.weatherEffects")
local SkySystem     = (require "environment.sky").SkySystem
local guiSystem     = CEGUI.System:getSingleton()
local guiContext    = CEGUI.System:getSingleton():getDefaultGUIContext()
local schemeMgr     = CEGUI.SchemeManager:getSingleton()
local wndMgr        = CEGUI.WindowManager:getSingleton()
local imgMgr        = CEGUI.ImageManager:getSingleton()
local animMgr       = CEGUI.AnimationManager:getSingleton()
local miscLabels    = require("miscLabels")

local console       = require "console"
local options       = require "options"

local tablex        = require "pl.tablex"
local plText        = require "pl.text"
local Template      = plText.Template

local pprint        = require "pprint"

local Appearance    = require "appearance"
local MeshTextureMapping = require "meshTextureMapping"

local ClassManager = require "global.classManager"

local gamePaused  = false
local coordsTimer = nil


-------------------------------------------------------------------------------
-- Gameplay UI
-------------------------------------------------------------------------------
gameplayUI =
{
   wndGameplay     = nil,
   wndPause        = nil,
   wndPauseMain    = nil,
   wndSaveLoad     = nil,
   wndConsole      = nil,

   ammo            = { wnd = nil },
   ammoCount       = nil,
   ammoCountShadow = nil,
   itemIcon        = nil,
   aim             = { wnd = nil },
   coords          = nil,
   status          = { wnd = nil },

   enemyStatus = { wnd            = nil,
                   label          = { wnd = nil },
                   health         = { wnd = nil },
                   shield         = { wnd = nil },
                   char           = nil,
                   timer          = nil,
                   timerUpdatePos = nil,
   },
   enemyLabel      = nil,

   focus = {
      currentObj = nil,
      label      = nil,
      updateTimer = nil,
      interactLabelTime = nil,
   },

   health          = { wnd = nil, size = 1, maxSize = 1, initialSize = 1, },
   energy          = { wnd = nil, size = 1, maxSize = 1, initialSize = 1, },
   stamina         = { wnd = nil, size = 1, maxSize = 1, initialSize = 1, },

   inventory       = { wnd = nil, slots = {}, currentTab = "TabAll", filters = { TabAll = nil,
                                                                           TabWeapon = { "weapon", "ammo" },
                                                                           TabAttire = { "attire", "accessory" },
                                                                           TabFood = { "food", "drink", "smokable", "meds" },
                                                                           TabQuest = { "quest" },
                                                                           TabMisc = { "tech", "misc", "message", "drawing" },
                                                                           }
   },
   inventory2      = { wnd = nil, slots = {}, },
   inventoryTurret = { wnd = nil, slots = {}, },
   trade           = { wnd = nil, traderInventory = {wnd = nil, slots = {}, currentTab = "TabAll",},
                     buy = {wnd = nil, slots = {},},
                     sell = {wnd = nil, slots = {},},
                     playerInventory = {wnd = nil, slots = {}, currentTab = "TabAll",},},

   hotbar          = { wnd = nil, slots = {}, },
   QHotbarSlot     = { wnd = nil },
   craft           = { wnd = nil, items = {}, components = {}, recipesPane = nil, },
   popupMenu       = { wnd = nil, slots = {}, },

   travel          = { wnd = nil, entries = {}, listBox = nil, },
   journal         = { wnd = nil, tabs = {}, questsOrder = {}, selectedQuest = nil, },
   message         = { wnd = nil, title = nil, contents = nil, },
   drawing         = { wnd = nil, image = nil },
   characterWindow = { wnd = nil, slotNames = { "top", "bottom", "hat", "eyewear", "mask",
                                                "slot1", "slot3", "slot4", "slot5", "slot6" }
   },
   characterEffects = { wnd = nil, showHidden = nil, effectsTable = {} },
   fastSlotsFilter = { [5] = "melee_low", [6] = "pistol", },
   statistics      =
   {
      wnd            = nil,
      level          = nil,
      experience     = nil,
      attributePoints= { status = nil, notification = nil, show = false },
      health         = { status = nil, notification = nil },
      stamina        = { status = nil, notification = nil },
      energy         = { status = nil, notification = nil },
      attackType     = nil,
      physicalDamage = nil,
      armor          = nil,
      food           = { status = nil, notification = nil, show = false },
      water          = { status = nil, notification = nil, show = false },
      sleep          = { status = nil, notification = nil, show = false },
   },
   dialog          = { wnd = nil, bottom = { tradeButton = nil, linesTaken = 0, replies = {wnd = nil, entries = {}}, }, textOld = nil, },

   info            = { wnd = nil, minorInfoWnds = {}, majorInfoWnds = {}, },
   fps             = { wnd = nil, text = nil, },

   itemDelimiter   = { wnd = nil, editbox = nil, scrollbar = nil, item = nil, mode = "drag", },

   interactProgress = { wnd = nil, text = nil, bar = nil, },

   waiting          = { wnd = nil, waitMode = false, timeChangeSub = nil, rates = { game = 4.0, weather = 10.0, sky = 0.02, }, },
   restHints        = { wnd = nil, },
   effectInfo       = { wnd = nil, title = nil, stats = nil, },
   itemInfo         = { wnd = nil, title = nil, stats = nil, item = nil, },
   billboard        = { wnd = nil, title = nil, contents = nil, hideTimer = nil, },

   annoyingHint     = { wnd = nil, contents = nil, stack = {} },

   combLock         = { wnd = nil, inputWnd = nil, },

   helpInfo         = { wnd = nil, },

   shiftPressed     = false,
   bugHintTimer     = nil,

   overlays          = { wnd = nil, black = { wnd = nil, state = false, }, },
   subtitles         = { wnd = nil, taskList = {} },

   stylesEditor     = { wnd = nil, editorWnd = nil, loadStylesWnd = nil, loadStylesButton = nil,
                        attachmentsConfig = { wnd = nil, meshName = nil },
                        texturesConfig = { wnd = nil, skin = nil, eye_l = nil, eye_r = nil } },

   map             = { wnd = nil, clicked = false, mapImage = nil,
                       currentZoom = 1, minZoom = 0.3,
                       currentMapItemName = "windscream_canyon_map.itm",
                       mapInfo = { ["windscream_canyon_map.itm"] = {image = "map2.jpg", xoffset = 458, yoffset = -2285, meterToPixelScale = 2.7}, },
                       activeMarkers = {},
   },
   mapVisualizer = { itemsIcons = {}, objIcons = {}, initialized = false, classesWnd = nil, },
   debug            = { wnd = nil },
   itemsOrderTable = {  equipped_weapon = 1, equipped_attire = 2, equipped_accessory = 3,
                        ammo = 4, weapon = 5, attire = 6, accessory = 7, meds = 8, food = 9, drink = 10, smokable = 11, tech = 12,
                        misc = 13, message = 14, drawing = 15, map = 16, quest = 17 },
   fadeToBlackSequence = false,

   worseColorTag = "[colour='FFce1124']",
   betterColorTag = "[colour='FF1ece53']",
   whiteTag = "[colour='FFFFFFFF']",

   immersiveUI = { global   = false,
                   states   = { status = false, ammo = false, },
                   timeRefs = { status = 0,     ammo = 0, },
   },

   fadeTimers = {},
   fadeTimerID = 0,
}

function gameplayUI:init()
   self.wndGameplay:subscribeEvent( "DragDropItemDropped", cbDragAndDropGameplayScreen )

   self.ammo.wnd        = self.wndGameplay:getChild( "Ammo" )
   self.ammoCount       = self.wndGameplay:getChild( "Ammo/AmmoCount" )
   self.ammoCountShadow = self.wndGameplay:getChild( "Ammo/AmmoCountShadow" )
   self.itemIcon        = self.wndGameplay:getChild( "Ammo/ItemIcon" )
   self.aim.wnd         = self.wndGameplay:getChild( "Cursor" )
   self.coords          = self.wndGameplay:getChild( "Coordinates" )
   self.coords:hide()

   self.status.wnd  = self.wndGameplay:getChild( "Status" )
   self.health.wnd  = self.wndGameplay:getChild( "Status/Health" )
   self.energy.wnd  = self.wndGameplay:getChild( "Status/Energy" )
   self.stamina.wnd = self.wndGameplay:getChild( "Status/Stamina" )

   self.health.maxSize  = self.health.wnd:getSize().width.scale
   self.energy.maxSize  = self.energy.wnd:getSize().width.scale
   self.stamina.maxSize = self.stamina.wnd:getSize().width.scale

   self.health.initialSize  = self.health.wnd:getSize()
   self.energy.initialSize  = self.energy.wnd:getSize()
   self.stamina.initialSize = self.stamina.wnd:getSize()

   --Enemy Status
   self.enemyStatus.wnd = wndMgr:loadLayoutFromFile( "enemyStatus.layout" )
   self.wndGameplay:addChild( self.enemyStatus.wnd )

   self.enemyStatus.label.wnd      = self.enemyStatus.wnd:getChild("Label")
   self.enemyStatus.health.wnd     = self.enemyStatus.wnd:getChild("HealthWindow")
   self.enemyStatus.shield.wnd     = self.enemyStatus.wnd:getChild("ShieldWindow")

   self.enemyStatus.wnd:setVisible(false)
   self.enemyStatus.shield.wnd:setVisible(false)

   self.enemyLabel = self.wndGameplay:createChild("TaharezLook/StaticText", "EnemyLabel")
   self.enemyLabel:setProperty( "Text", "999" )
   self.enemyLabel:setProperty( "FrameEnabled",            "false" )
   self.enemyLabel:setProperty( "BackgroundEnabled",       "false" )
   self.enemyLabel:setProperty( "VertFormatting",     "TopAligned" )
   self.enemyLabel:setFont    ( "dialog-16" )
   self.enemyLabel:setPosition( CEGUI.UVector2(CEGUI.UDim(0.5,0), CEGUI.UDim(0.05,0) ) )
   self.enemyLabel:setSize    ( CEGUI.USize   (CEGUI.UDim(0.5,0), CEGUI.UDim(0.1,0) ) )
   self.enemyLabel:setVisible ( false)

   self.focus.label = self.wndGameplay:createChild("TaharezLook/StaticText", "FocusLabel")
   self.focus.label:setProperty( "Text", "999" )
   self.focus.label:setProperty( "FrameEnabled",            "false" )
   self.focus.label:setProperty( "BackgroundEnabled",       "false" )
   self.focus.label:setProperty( "VertFormatting",     "TopAligned" )
   self.focus.label:setProperty( "HorzFormatting",     "CentreAligned" )
   self.focus.label:setProperty( "HorizontalAlignment",     "Centre" )
   self.focus.label:setFont    ( "dialog-16-alt" )
   self.focus.label:setPosition( CEGUI.UVector2(CEGUI.UDim(0,0), CEGUI.UDim(0.5,0) ) )
   self.focus.label:setSize    ( CEGUI.USize   (CEGUI.UDim(0.5,0), CEGUI.UDim(0.1,0) ) )
   self.focus.label:setVisible ( false)

   self.focus.interactLabel = self.wndGameplay:createChild("TaharezLook/StaticText", "InteractLabel")
   self.focus.interactLabel:setProperty( "Text", "999" )
   self.focus.interactLabel:setProperty( "FrameEnabled",            "false" )
   self.focus.interactLabel:setProperty( "BackgroundEnabled",       "false" )
   self.focus.interactLabel:setProperty( "VertFormatting",     "TopAligned" )
   self.focus.interactLabel:setProperty( "HorzFormatting",     "CentreAligned" )
   self.focus.interactLabel:setProperty( "HorizontalAlignment",     "Centre" )
   self.focus.interactLabel:setFont    ( "dialog-10-alt-grey" )
   self.focus.interactLabel:setPosition( CEGUI.UVector2(CEGUI.UDim(0,0), CEGUI.UDim(0.5,0) ) )
   self.focus.interactLabel:setSize    ( CEGUI.USize   (CEGUI.UDim(0.5,0), CEGUI.UDim(0.1,0) ) )
   self.focus.interactLabel:setVisible ( false)

   self:initInventory()
   self:initInventory2()
   self:initInventoryTurret()
   self:initTrade()
   self:initHotbar()
   self:initCraft()
   self:initPopupMenu()
   self:initJournal()
   self:initTravel()
   self:initMessage()
   self:initDrawing()
   self:initCharacterWindow()
   self:initDialog()
   self:initInfo()
   self:initFPS()
   self:initItemDelimiter()
   self:initInteractProgress()
   self:initWaiting()
   self:initRestHints()
   self:initEffectInfo()
   self:initItemInfo()
   self:initBillboard()
   self:initHelpInfo()
   self:initCombLock()
   self:initOverlays()
   self:initSubtitles()
   self:initAnnoyingHint()
   self:initMap()

   self:initDebugGui()

   self.wndGameplay:subscribeEvent( "KeyDown", cbGameplayKeyDown )
   self.wndGameplay:subscribeEvent( "KeyUp", cbGameplayKeyUp )
   self.wndGameplay:activate()

   if isEditor() or isDebug() then
      self:triggerOverlay( "black", 0.5, false )
   else
      runTimer( 0.5, nil, function()
         self:triggerOverlay( "black", 2, false )
      end, false )
   end
end

function gameplayUI:deinit()
end

function gameplayUI:clickableWindowsVisible()
   if ( gameplayUI:isInventoryVisible() or
        gameplayUI:isConsoleVisible() or
        gameplayUI:isItemDelimiterVisible() or
        gameplayUI:isJournalVisible() or
        gameplayUI:isHelpInfoVisible() or
        gameplayUI:isDialogVisible() or
        gameplayUI:isTravelVisible() or
        gameplayUI:isTradeVisible() or
        gameplayUI:isCombLockVisible() or
        gameplayUI:isWaitingVisible() or
        gameplayUI:isMapVisible() or
        gameplayUI:isCharacterWindowVisible() or
        gameplayUI:isDrawingVisible() or
        gameplayUI:isDebugVisible() or
        gameplayUI:isOptionalLoadingVisible() or
        gameplayUI:isWarningVisible() ) then
      return true
   end
   return false
end

function gameplayUI:showCursor()
   guiContext:getMouseCursor():show()
   terminalUI:hideCursor()
end

function gameplayUI:hideCursor()
   if self:clickableWindowsVisible() then
      return
   end

   guiContext:getMouseCursor():hide()
end

function gameplayUI:isOptionalLoadingVisible()
   local wnd = getDynamicWindowSafe( "OptionalLoading" )
   return wnd and wnd:isVisible()
end

function gameplayUI:isWarningVisible()
   local wnd = getDynamicWindowSafe( "WarningMessage" )
   return wnd and wnd:isVisible()
end

function gameplayUI:immersiveUIUpdate()
   --Mandatory immersification during cutscenes and talking
   local player = getPlayer()
   if getGlobalParam("inScene") or player:getState("talk") then
      if not self.immersiveUI.global then
         self.immersiveUI.global = true
         self:closeUI()
         self.status.wnd:setVisible( false )
         self.ammo.wnd:setVisible( false )
         self.hotbar.wnd:setVisible( false )
         self.aim.wnd:setVisible( false )
      end
      return
   elseif not getGlobalParam("inScene") and not player:getState("talk") then
      if self.immersiveUI.global then
         self.immersiveUI.global = false
         self.aim.wnd:setVisible( true )
         self.hotbar.wnd:setVisible( true )
         if getGameTime() - self.immersiveUI.timeRefs.status < 5 or not getGameOption("immersiveUI") then
            self.status.wnd:setVisible( true )
         end
         if getGameTime() - self.immersiveUI.timeRefs.ammo < 5 or not getGameOption("immersiveUI") then
            self.ammo.wnd:setVisible( true )
         end
      end
   end

   if not getGameOption("immersiveUI") then return end

   local timeDelta
   --STATUS
   local playerIsFull = player:getStatPercent("health") == 100 and player:getStatPercent("stamina") == 100 and player:getStatPercent("energy") == 100
   timeDelta = getGameTime() - self.immersiveUI.timeRefs.status
   if playerIsFull and timeDelta >= 5 and not self.immersiveUI.states.status then
      gameplayUI:immersiveUIHide( "status" )
   elseif not playerIsFull and timeDelta < 5 and self.immersiveUI.states.status then
      gameplayUI:immersiveUIShow( "status" )
   elseif not playerIsFull then
      gameplayUI:updateImmersiveUITimeRef( "status" )
   end

   --AMMO
   timeDelta = getGameTime() - self.immersiveUI.timeRefs.ammo
   if timeDelta >= 5 and not self.immersiveUI.states.ammo then
      gameplayUI:immersiveUIHide( "ammo" )
   elseif timeDelta < 5 and self.immersiveUI.states.ammo then
      gameplayUI:immersiveUIShow( "ammo" )
   end
end

function gameplayUI:updateImmersiveUITimeRef( elementName )
   self.immersiveUI.timeRefs[elementName] = getGameTime()
end

function gameplayUI:immersiveUIHide( elementName )
   self:fadeOutWindow( self[elementName].wnd, 1 )
   self.immersiveUI.states[elementName] = true
end

function gameplayUI:immersiveUIShow( elementName )
   self:fadeInWindow( self[elementName].wnd, 0.1 )
   self.immersiveUI.states[elementName] = false
end

function gameplayUI:canInteract()
   return (not gameplayUI:isInventoryVisible() and
           not terminalUI:isCursorVisible() and
           not gameplayUI:isJournalVisible() and
           not gameplayUI:isHelpInfoVisible() and
           not gameplayUI:isTravelVisible() and
           not gameplayUI:isDialogVisible() and
           not gameplayUI:isTradeVisible() and
           not gameplayUI:isCombLockVisible())
end

function gameplayUI:initInventory()
   self.inventory.wnd = wndMgr:loadLayoutFromFile( "inventory.layout" )
   self.wndGameplay:addChild( self.inventory.wnd )
   self.inventory.wnd:setVisible( false )

   local slotIndex = 1

   for i=1,30 do
      for j=1,5 do
         local newSlot = addInventorySlot( self.inventory, slotIndex, i, j )

         newSlot.slot:subscribeEvent ( "DragStarted",         cbSlotDragStarted )
         newSlot.slot:subscribeEvent ( "MouseClick",          cbInventorySlotClick )
         newSlot.slot:subscribeEvent ( "MouseDoubleClick",    cbInventoryDoubleClick )
         newSlot.slot:subscribeEvent ( "MouseMove",           cbItemInfoMouseMove )
         newSlot.slot:subscribeEvent ( "MouseEntersArea",     cbItemInfoMouseHover )
         newSlot.slot:subscribeEvent ( "MouseLeavesArea",     cbItemInfoMouseLeave )
         newSlot.slot:subscribeEvent ( "DragDropItemDropped", cbDragAndDropInventory )
         slotIndex = slotIndex + 1
      end
   end

   self.inventory.wnd:subscribeEvent( "CloseClicked", cbInventoryClose )
   self.inventory.wnd:getChild("CraftButton"):subscribeEvent( "MouseClick", cbInventoryCraft )
   self.inventory.wnd:getChild( "TabAll"):subscribeEvent( "MouseClick", cbInventoryTabClick )
   self.inventory.wnd:getChild( "TabWeapon" ):subscribeEvent( "MouseClick", cbInventoryTabClick )
   self.inventory.wnd:getChild( "TabAttire"):subscribeEvent( "MouseClick", cbInventoryTabClick )
   self.inventory.wnd:getChild( "TabFood" ):subscribeEvent( "MouseClick", cbInventoryTabClick )
   self.inventory.wnd:getChild( "TabQuest" ):subscribeEvent( "MouseClick", cbInventoryTabClick )
   self.inventory.wnd:getChild( "TabMisc" ):subscribeEvent( "MouseClick", cbInventoryTabClick )
   clearInventory( self.inventory )
end
local function sortInventory(a, b)
   local function getOrder( item )
      local order
      if item:isEquipable() and item.equipped then
         if item == getPlayer().lastWeapon then
            order = gameplayUI.itemsOrderTable.equipped_weapon
         elseif item:isAttire() or item:isAccessory() then
            order = gameplayUI.itemsOrderTable["equipped_" .. item:getInvCategory()]
         else
            order = gameplayUI.itemsOrderTable[item:getInvCategory()]
         end
      else
         order = gameplayUI.itemsOrderTable[item:getInvCategory()]
      end
      return order
   end
   local orderA = getOrder( a ) or gameplayUI.itemsOrderTable.misc
   local orderB = getOrder( b ) or gameplayUI.itemsOrderTable.misc
   if orderA == orderB then
     orderA = a.name
     orderB = b.name
   end
   return orderA < orderB
end

function cbInventoryDoubleClick(args)
   local click_args = CEGUI.toMouseEventArgs(args)

   if ( click_args.button == CEGUI.LeftButton ) then
      if gameplayUI:isInventory2Visible() or gameplayUI:isInventoryTurretVisible() then return end

      local inventoryTableName = click_args.window:getUserString("inventoryName"):gsub("^%u", string.lower)
      local inventory = gameplayUI[inventoryTableName]
      local slotID = tonumber( click_args.window:getUserString("slotID") )
      local item = inventory.slots[slotID].item

      if not item then return end

      getPlayer():useItem( item )
      cbItemInfoMouseLeave( args )
      cbItemInfoMouseHover( args )
   end
end

function gameplayUI:initInventory2()
   self.inventory2.wnd = wndMgr:loadLayoutFromFile( "inventory2.layout" )
   self.wndGameplay:addChild( self.inventory2.wnd )
   self.inventory2.wnd:setVisible( false )
   local slotIndex = 1

   for i=1,5 do
      for j=1,5 do
         local newSlot = addInventorySlot( self.inventory2, slotIndex, i, j )
         newSlot.slot:subscribeEvent ( "DragStarted",         cbSlotDragStarted )
         newSlot.slot:subscribeEvent ( "MouseMove",           cbItemInfoMouseMove )
         newSlot.slot:subscribeEvent ( "MouseEntersArea",     cbItemInfoMouseHover )
         newSlot.slot:subscribeEvent ( "MouseLeavesArea",     cbItemInfoMouseLeave )
         newSlot.slot:subscribeEvent ( "DragDropItemDropped", cbDragAndDropInventory2 )
         newSlot.slot:subscribeEvent ( "MouseClick", cbInventorySlotClick )
         slotIndex = slotIndex + 1
      end
   end

   self.inventory2.wnd:subscribeEvent( "CloseClicked", cbInventory2Close )
   self.inventory2.wnd:getChild("Close"):subscribeEvent( "Clicked", cbInventoryClose )
   self.inventory2.wnd:getChild("TakeAll"):subscribeEvent( "Clicked", cbInventory2TakeAll )

   clearInventory( self.inventory2 )
end

function gameplayUI:initInventoryTurret()
   self.inventoryTurret.wnd = wndMgr:loadLayoutFromFile( "inventoryTurret.layout" )
   self.wndGameplay:addChild( self.inventoryTurret.wnd )
   self.inventoryTurret.wnd:setVisible( false )
   local slotIndex = 1

   for i=1,5 do
      for j=1,5 do
         local newSlot = addInventorySlot( self.inventoryTurret, slotIndex, i, j )
         newSlot.slot:subscribeEvent ( "DragStarted",         cbSlotDragStarted )
         newSlot.slot:subscribeEvent ( "MouseMove",           cbItemInfoMouseMove )
         newSlot.slot:subscribeEvent ( "MouseEntersArea",     cbItemInfoMouseHover )
         newSlot.slot:subscribeEvent ( "MouseLeavesArea",     cbItemInfoMouseLeave )
         newSlot.slot:subscribeEvent ( "DragDropItemDropped", cbDragAndDropInventoryTurret )
         newSlot.slot:subscribeEvent ( "MouseClick", cbInventorySlotClick )
         slotIndex = slotIndex + 1
      end
   end

   self.inventoryTurret.wnd:subscribeEvent( "CloseClicked", cbInventoryTurretClose )
   self.inventoryTurret.wnd:getChild("Close"):subscribeEvent( "Clicked", cbInventoryClose )
   self.inventoryTurret.wnd:getChild("TakeAll"):subscribeEvent( "Clicked", cbInventory2TakeAll )
   self.inventoryTurret.wnd:getChild("Deinstall"):subscribeEvent( "Clicked", cbDeinstallTurret )

   clearInventory( self.inventoryTurret )
end

function addInventorySlot( inventory, slotIndex, i, j )
   local cells = inventory.wnd:getChild("Cells")
   local exSlot = cells:getChild("Slot1")
   local slot
   if not exSlot then
      slot = wndMgr:loadLayoutFromFile( "inventory_slot.layout" )
      cells:addChild( slot )
   else
      slot = exSlot:clone( true )
      slot:setName( "Slot" .. slotIndex )
      cells:addChild( slot )
   end

   slot:setPosition( CEGUI.UVector2(CEGUI.UDim(0.0,64*(j-1)), CEGUI.UDim(0.0,64*(i-1)) ) )
   slot:setSize    ( CEGUI.USize   (CEGUI.UDim(0.0,64)      , CEGUI.UDim(0.0,64) ) )

   local newSlot = {}
   newSlot.slot       = slot:getChild("DragContainer")
   newSlot.image      = slot:getChild("DragContainer/ItemImage")
   newSlot.equipped   = slot:getChild("DragContainer/ItemImage/Equipped")
   newSlot.selected   = slot:getChild("DragContainer/ItemImage/Selected")
   newSlot.counter    = slot:getChild("DragContainer/ItemImage/Counter")

   newSlot.slot:setUserString( "inventoryName", inventory.wnd:getName() )
   newSlot.slot:setUserString( "slotID", slotIndex )

   inventory.slots[slotIndex] = newSlot
   return newSlot
end

function clearInventory( inventory )
   for i=1,#inventory.slots do
      clearInventorySlot( inventory.slots[i] )
   end
end

function clearInventorySlot( slot )
   slot.slot:setProperty   ( "DraggingEnabled", "false" )
   slot.image:setProperty  ( "Image", "" )
   slot.selected:setVisible( false )
   slot.equipped:setVisible( false )
   slot.counter:setText    ( "" )
   slot.item = nil
end

function resetTabs( inventoryTable )
   inventoryTable.currentTab = "TabAll"
   for tabName in pairs(gameplayUI.inventory.filters) do
      inventoryTable.wnd:getChild(tabName):setProperty( "Disabled", "false" )
   end
   inventoryTable.wnd:getChild("TabAll"):setProperty( "Disabled", "true" )
end
-------------------------------------------------------------------------------
-- Trade
-------------------------------------------------------------------------------
function gameplayUI:initTrade()
   log("Init Trade")
   self.trade.wnd = wndMgr:loadLayoutFromFile( "trade.layout" )
   self.wndGameplay:addChild( self.trade.wnd )
   self.trade.wnd:setVisible( false )

---------------------------------------
   self.trade.traderInventory.wnd = self.trade.wnd:getChild("TraderInventory")
   local slotIndex = 1

   for i=1,30 do
      for j=1,5 do
         local newSlot = addInventorySlot( self.trade.traderInventory, slotIndex, i, j )
         subscribeTradeSlot( newSlot.slot )
         slotIndex = slotIndex + 1
      end
   end
---------------------------------------
   self.trade.buy.wnd = self.trade.wnd:getChild("Buy")
   slotIndex = 1

   for i=1,5 do
      for j=1,2 do
         local newSlot = addInventorySlot( self.trade.buy, slotIndex, i, j )
         subscribeTradeSlot( newSlot.slot )
         slotIndex = slotIndex + 1
      end
   end
---------------------------------------
   self.trade.sell.wnd = self.trade.wnd:getChild("Sell")
   slotIndex = 1

   for i=1,5 do
      for j=1,2 do
         local newSlot = addInventorySlot( self.trade.sell, slotIndex, i, j )
         subscribeTradeSlot( newSlot.slot )
         slotIndex = slotIndex + 1
      end
   end
---------------------------------------
   self.trade.playerInventory.wnd = self.trade.wnd:getChild("PlayerInventory")
   slotIndex = 1

   for i=1,30 do
      for j=1,5 do
         local newSlot = addInventorySlot( self.trade.playerInventory, slotIndex, i, j )
         subscribeTradeSlot( newSlot.slot )
         slotIndex = slotIndex + 1
      end
   end
---------------------------------------
   self.trade.wnd:subscribeEvent( "CloseClicked", cbTradeClose )
   self.trade.wnd:getChild("Balance"):subscribeEvent( "Clicked", cbTradeBalance )
   self.trade.wnd:getChild("Accept"):subscribeEvent( "Clicked", cbTradeAccept )
   self.trade.wnd:getChild("Clear"):subscribeEvent( "Clicked", cbClearTradeOffers )


   self.trade.playerInventory.wnd:getChild( "TabAll"):subscribeEvent( "MouseClick", cbTradeInventoryTabClick )
   self.trade.playerInventory.wnd:getChild( "TabWeapon" ):subscribeEvent( "MouseClick", cbTradeInventoryTabClick )
   self.trade.playerInventory.wnd:getChild( "TabAttire"):subscribeEvent( "MouseClick", cbTradeInventoryTabClick )
   self.trade.playerInventory.wnd:getChild( "TabFood" ):subscribeEvent( "MouseClick", cbTradeInventoryTabClick )
   self.trade.playerInventory.wnd:getChild( "TabQuest" ):subscribeEvent( "MouseClick", cbTradeInventoryTabClick )
   self.trade.playerInventory.wnd:getChild( "TabMisc" ):subscribeEvent( "MouseClick", cbTradeInventoryTabClick )

   self.trade.traderInventory.wnd:getChild( "TabAll"):subscribeEvent( "MouseClick", cbTradeInventoryTabClick )
   self.trade.traderInventory.wnd:getChild( "TabWeapon" ):subscribeEvent( "MouseClick", cbTradeInventoryTabClick )
   self.trade.traderInventory.wnd:getChild( "TabAttire"):subscribeEvent( "MouseClick", cbTradeInventoryTabClick )
   self.trade.traderInventory.wnd:getChild( "TabFood" ):subscribeEvent( "MouseClick", cbTradeInventoryTabClick )
   self.trade.traderInventory.wnd:getChild( "TabQuest" ):subscribeEvent( "MouseClick", cbTradeInventoryTabClick )
   self.trade.traderInventory.wnd:getChild( "TabMisc" ):subscribeEvent( "MouseClick", cbTradeInventoryTabClick )

   self:clearTrade()
end

function cbTradeInventoryTabClick( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   if ( click_args.button == CEGUI.LeftButton ) then
      local name = click_args.window:getName()
      local inventoryName = string.gsub(click_args.window:getParent():getName(), "^%u", string.lower)

      gameplayUI.trade[inventoryName].wnd:getChild(gameplayUI.trade[inventoryName].currentTab):setProperty( "Disabled", "false" )
      gameplayUI.trade[inventoryName].currentTab = name

      gameplayUI:tradeUpdateItems( gameplayUI.trade[inventoryName], true )
      click_args.window:setProperty( "Disabled", "true" )
      gameplayUI.trade[inventoryName].wnd:getChild("Cells"):setProperty("VertScrollPosition", "0")
   end
end

function subscribeTradeSlot( slot )
   slot:subscribeEvent ( "DragStarted",         cbSlotDragStarted )
   slot:subscribeEvent ( "MouseMove",           cbItemInfoMouseMove )
   slot:subscribeEvent ( "MouseEntersArea",     cbItemInfoMouseHover )
   slot:subscribeEvent ( "MouseLeavesArea",     cbItemInfoMouseLeave )
   slot:subscribeEvent ( "MouseClick",          cbTradeSlotClick )
   slot:subscribeEvent ( "DragDropItemDropped", cbDragAndDropTrade )
end

function gameplayUI:setupTradeInventory( char )
   if ( not char ) then
      return
   end

   local inventoryTable
   if char == getPlayer() then
      inventoryTable = self.trade.playerInventory
   else
      inventoryTable = self.trade.traderInventory
      local buyMul = getGlobalParam( char:getName() .. "_buyFromVendorMul" ) or 1
      buyMul = (buyMul - 1) * 100
      local sellMul = getGlobalParam( char:getName() .. "_sellToVendorMul" ) or 1
      sellMul = (sellMul - 1) * 100
      local buyColor = gameplayUI.whiteTag
      local sellColor = gameplayUI.whiteTag

      if buyMul > 0 then
         buyMul = "+" .. buyMul
         buyColor = gameplayUI.worseColorTag
      elseif buyMul < 0 then
         buyColor = gameplayUI.betterColorTag
      end
      if sellMul > 0 then
         sellMul = "+" .. sellMul
         sellColor = gameplayUI.betterColorTag
      elseif sellMul < 0 then
         sellColor = gameplayUI.worseColorTag
      end

      self.trade.wnd:getChild("BuyMul"):setText( "buying price " .. buyColor .. buyMul .. "%" )
      self.trade.wnd:getChild("SellMul"):setText( "selling price " .. sellColor .. sellMul .. "%" )
   end

   resetTabs( inventoryTable )

   self:tradeUpdateItems( inventoryTable )
   self:tradeUpdateMoney( inventoryTable )
   if char == getPlayer() then
      gameplayUI:tradeUpdateAliveItems( inventoryTable )
   end
end

function gameplayUI:tradeUpdateItems( inventoryTable, considerInput )
   local items
   local inputWindow
   if inventoryTable.wnd:getName() == "PlayerInventory" then
      items = getPlayer():getInventory().items
      items = self:whitelistItems( items )
      inputWindow = self.trade.sell
   else
      items = getPlayer().exchangeTarget.itemsManager.items
      inputWindow = self.trade.buy
   end

   self:clearTradeInventory( inventoryTable )

   local filterTable = self.inventory.filters[inventoryTable.currentTab]
   local sortedIterator = tablex.sortv(items, sortInventory)
   local index = 0

   for _,item in sortedIterator do
      if not filterTable or inList( filterTable, item:getInvCategory() ) then
         index = index + 1
         self:setupTradeInventoryItem( index, item, inventoryTable, considerInput, inputWindow )
      end
   end
   local length = math.ceil(index/5) * 64
   inventoryTable.wnd:getChild("Cells"):setProperty("ContentArea", "l:0 t:0 r:320 b:" .. length)
end

function gameplayUI:setupTradeInventoryItem( slotIndex, item, inventoryTable, considerInput, inputWindow )
   local inputConsideredCount = nil
   if considerInput then
      for i=1,#inputWindow.slots do
         if inputWindow.slots[i].item and inputWindow.slots[i].item.name == item.name then
            local inputCount = tonumber(inputWindow.slots[i].counter:getText()) or 1
            inputConsideredCount = item.count - inputCount
         end
      end
   end

   if not considerInput or inputConsideredCount and inputConsideredCount ~= 0 or not inputConsideredCount then
      inventoryTable.slots[slotIndex].slot:setProperty( "DraggingEnabled", "true" )
      inventoryTable.slots[slotIndex].slot:setUserString( "itemID", tostring(item.id) )
      inventoryTable.slots[slotIndex].image:setProperty( "Image", "gameplay/" .. item.icon )
      inventoryTable.slots[slotIndex].item = item
      if considerInput and inputConsideredCount then
         inventoryTable.slots[slotIndex].counter:setText( inputConsideredCount )
      elseif ( item.count > 1 ) then
         inventoryTable.slots[slotIndex].counter:setText( tostring(item.count) )
      else
         inventoryTable.slots[slotIndex].counter:setText( "" )
      end

      if inventoryTable.wnd:getName() == "PlayerInventory" then
         if (item:isAttire() and item.equipped) or (item:isAccessory() and item.equipped) or (getPlayer().lastWeapon == item) then
            self.trade.playerInventory.slots[slotIndex].equipped:setVisible(true)
         end
      end
   elseif inputConsideredCount and inputConsideredCount == 0 then
      clearTradeSlot( inventoryTable.slots[slotIndex] )
   end
end

function gameplayUI:whitelistItems( items )
   local whitelist = getPlayer().exchangeTarget.tradeWhitelist
   local whitelistedItems = {}
   local guns_all = inList( whitelist, "guns_all" )
   local weapons_all = inList( whitelist, "weapons_all" )
   local ammo_all = inList( whitelist, "ammo_all" )
   for k,item in pairs(items) do
      if ( inList( whitelist, item.name )
         or ( guns_all    and item:isRangedWeapon() )
         or ( weapons_all and item:isMeleeWeapon() )
         or ( ammo_all    and item:isAmmo() ) )
         and not item:isQuestItem() then
         whitelistedItems[k] = item
      end
   end
   return whitelistedItems
end

function gameplayUI:tradeUpdateMoney( inventoryTable )
   local shardsCount = 0
   for i=1,#inventoryTable.slots do
      if ( inventoryTable.slots[i].item and inventoryTable.slots[i].item:isMoney() ) then
         shardsCount = inventoryTable.slots[i].item.count
         break
      end
   end
   inventoryTable.wnd:getChild( "ShardsCount" ):setText( tostring(shardsCount) )
end

function gameplayUI:tradeUpdateAliveItems( inventoryTable )
   local aliveItemsCount = getPlayer():getInventory().aliveItemsCount

   inventoryTable.wnd:getChild( "BugAliveCount" ):setText( tostring(aliveItemsCount) .. "/" .. "3" )
end

function gameplayUI:showTrade( state )
   self.trade.wnd:setVisible( state )

   if ( state ) then
      self:resetCursorPos()
      self:showCursor()
   end
   setUserControl( not state )
end

function gameplayUI:isTradeVisible( )
   return gameplayUI.trade.wnd:isVisible()
end

function gameplayUI:clearTrade()
   self:clearTradeInventory( self.trade.traderInventory )
   self:clearTradeInventory( self.trade.buy )
   self:clearTradeInventory( self.trade.sell )
   self:clearTradeInventory( self.trade.playerInventory )

   self.trade.sell.wnd:getChild( "SellSum" ):setText( "0" )
   self.trade.buy.wnd:getChild( "BuySum" ):setText( "0" )
end

function gameplayUI:clearTradeInventory( tradeInventory )
   for i=1,#tradeInventory.slots do
      local slot = tradeInventory.slots[i]
      clearTradeSlot( slot )
   end
end

function gameplayUI:OnTradeDrop( item, count, action )
   log("On drop to "..action.." "..count.." "..item.icon)
   self:hideItemDelimiter()

   if ItemsData.isItemAlive(item.name) and action == "buy" then
      local aliveCount = getPlayer():getInventory().aliveItemsCount
      local max = getPlayer():getInventory().aliveItemsMax
      if getPlayer():getInventory():isItemsAliveLimit() then
         log("Alive items limit")
         return
      end
      if count > (max - aliveCount) then
         count = max - aliveCount
      end
   end

   local dropInventory
   local sourceInventory
   if action == "buy" then
      dropInventory = self.trade.buy
      sourceInventory = self.trade.traderInventory
   elseif action == "sell" then
      dropInventory = self.trade.sell
      sourceInventory = self.trade.playerInventory
   elseif action == "buyRemove" then
      dropInventory = self.trade.buy
      sourceInventory = self.trade.traderInventory
      for i=1, #dropInventory.slots do
         if dropInventory.slots[i].item and dropInventory.slots[i].item.name == item.name then
            local newCount = tonumber(dropInventory.slots[i].counter:getText( )) or 1
            newCount = newCount - count
            dropInventory.slots[i].counter:setText(tostring(newCount))
            if newCount <= 0 then
               clearTradeSlot( dropInventory.slots[i] )
            end
            self:tradeUpdateSum( action )
            self:tradeUpdateItems( sourceInventory, true )
            return
         end
      end
   elseif action == "sellRemove" then
      dropInventory = self.trade.sell
      sourceInventory = self.trade.playerInventory
      for i=1, #dropInventory.slots do
         if dropInventory.slots[i].item and dropInventory.slots[i].item.name == item.name then
            local newCount = tonumber(dropInventory.slots[i].counter:getText( )) or 1
            newCount = newCount - count
            dropInventory.slots[i].counter:setText(tostring(newCount))
            if newCount <= 0 then
               clearTradeSlot( dropInventory.slots[i] )
            end
            self:tradeUpdateSum( action )
            self:tradeUpdateItems( sourceInventory, true )
            return
         end
      end
   end

   for i=1, #dropInventory.slots do
      if dropInventory.slots[i].item and dropInventory.slots[i].item.name == item.name then
         if count > 1 then
            dropInventory.slots[i].counter:setText( tostring( count ) )
         end
         dropInventory.slots[i].item = item
         self:tradeUpdateSum( action )
         self:tradeUpdateItems( sourceInventory, true )
         return
      end
   end

   for i=1, #dropInventory.slots do
      if dropInventory.slots[i].item == nil then
         if (item:isAttire() and item.equipped) or (item:isAccessory() and item.equipped) or (getPlayer().lastWeapon == item) then
            self.trade.sell.slots[i].equipped:setVisible(true)
         end
         dropInventory.slots[i].image:setProperty( "Image", "gameplay/"..item.icon )
         dropInventory.slots[i].slot:setUserString( "itemID", tostring(item.id) )
         dropInventory.slots[i].slot:setProperty( "DraggingEnabled", "true" )
         if count > 1 then
            dropInventory.slots[i].counter:setText( tostring( count ) )
         end
         dropInventory.slots[i].item = item
         self:tradeUpdateSum( action )
         self:tradeUpdateItems( sourceInventory, true )
         return
      end
   end

   log("No space")
end

function gameplayUI:tradeUpdateSum( action )
   local inventory
   if action == "buy" or  action == "buyRemove" then
      inventory = self.trade.buy
   elseif action == "sell" or action == "sellRemove" then
      inventory = self.trade.sell
   end
   local sum = 0
   -- TODO:FIXME: make sure to separate regular item value calculation (total sum)
   -- and money value calculation (always worth 1)
   for i=1, #inventory.slots do
      local itemCount = 0
      local globalMul = 1
      local personalMul = 1
      local sellMul = 1
      local item = inventory.slots[i].item
      if item then
         itemCount = tonumber(inventory.slots[i].counter:getText()) or 1
         local value = item:getValue() or 1
         if not item:isMoney() then
            if action == "sell" or action == "sellRemove" then
               sellMul = getGlobalParam( "sellingPriceMultiplier" )
               globalMul = getGlobalParam( "sellToVendorMul" )
               personalMul = getGlobalParam( getPlayer().exchangeTarget:getName() .. "_sellToVendorMul" ) or personalMul
            elseif action == "buy" or action == "buyRemove" then
               globalMul = getGlobalParam( "buyFromVendorMul" )
               personalMul = getGlobalParam( getPlayer().exchangeTarget:getName() .. "_buyFromVendorMul" ) or personalMul
            end
         end
         sum = sum + value * itemCount * sellMul * globalMul * personalMul
      end
   end
   sum = math.ceil(sum)

   inventory.wnd:getChild( inventory.wnd:getName().."Sum" ):setText( sum )
end

function clearTradeSlot( slot )
   slot.slot:setProperty      ( "DraggingEnabled", "false" )
   slot.slot:setUserString    ( "itemID", "" )
   slot.image:setProperty     ( "Image", "" )
   slot.counter:setText       ( "" )
   slot.equipped:setVisible   ( false )
   slot.selected:setVisible   ( false )
   slot.item = nil
end

function tradePlaceItem(item, action)
   if not item:getValue() then
      return
   end

   if gameplayUI.shiftPressed then
      gameplayUI:OnTradeDrop( item, item.count, action )
   elseif ( item.count > 1 ) then
      gameplayUI:setupItemDelimiter( item, action )
      gameplayUI:showItemDelimiter()
   else
      gameplayUI:OnTradeDrop( item, 1, action )
   end
end

function cbClearTradeOffers()
   for i=1,#gameplayUI.trade.buy.slots do
      local slot = gameplayUI.trade.buy.slots[i]
     clearTradeSlot( slot )
   end
   for i=1,#gameplayUI.trade.sell.slots do
      local slot = gameplayUI.trade.sell.slots[i]
      clearTradeSlot( slot )
   end
   gameplayUI:tradeUpdateSum( "buy" )
   gameplayUI:tradeUpdateSum( "sell" )
   gameplayUI:tradeUpdateItems( gameplayUI.trade.traderInventory )
   gameplayUI:tradeUpdateItems( gameplayUI.trade.playerInventory )
end

function cbTradeBalance()
   for i=1, #gameplayUI.trade.buy.slots do
      if gameplayUI.trade.buy.slots[i].item and gameplayUI.trade.buy.slots[i].item:isMoney() then
         clearTradeSlot(gameplayUI.trade.buy.slots[i])
         gameplayUI:tradeUpdateSum( "buy" )
         gameplayUI:tradeUpdateItems( gameplayUI.trade.traderInventory, true )
         break
      end
   end
   for i=1, #gameplayUI.trade.sell.slots do
      if gameplayUI.trade.sell.slots[i].item and gameplayUI.trade.sell.slots[i].item:isMoney() then
         clearTradeSlot(gameplayUI.trade.sell.slots[i])
         gameplayUI:tradeUpdateSum( "sell" )
         gameplayUI:tradeUpdateItems( gameplayUI.trade.playerInventory, true )
         break
      end
   end

   local buySum = tonumber(gameplayUI.trade.buy.wnd:getChild( "BuySum" ):getText( ))
   local sellSum = tonumber(gameplayUI.trade.sell.wnd:getChild( "SellSum" ):getText( ))
   local diff = buySum - sellSum

   local traderMoney = tonumber(gameplayUI.trade.traderInventory.wnd:getChild( "ShardsCount" ):getText())
   local playerMoney = tonumber(gameplayUI.trade.playerInventory.wnd:getChild( "ShardsCount" ):getText())

   if diff < 0 and traderMoney >= math.abs(diff) then
      log("Trader has enough money")
      local moneyItem = getPlayer().exchangeTarget.itemsManager:getItemByName( "antigravium_shards.itm" )
      gameplayUI:OnTradeDrop( moneyItem, math.abs(diff), "buy" )
   elseif diff > 0 and playerMoney >= diff then
      log("Player has enough money")
      local moneyItem = getPlayer():getInventory():getItemByName( "antigravium_shards.itm" )
      gameplayUI:OnTradeDrop( moneyItem, math.abs(diff), "sell" )
   elseif diff == 0 and buySum ~= 0 then
      log("Perfect balance")
   elseif diff > 0 and playerMoney < diff then
      log("Player does not have enough money")
   elseif diff < 0 and traderMoney < ( math.abs(diff) ) then
      log("Trader does not have enough money")
   end
end

function cbTradeClose()
   getPlayer():stopTrade()
   gameplayUI:showTrade( false )
   gameplayUI:hideItemDelimiter()
   gameplayUI:clearTrade()
end

function cbTradeAccept()
   local buySum = tonumber( gameplayUI.trade.buy.wnd:getChild( "BuySum" ):getText( ) )
   local sellSum = tonumber( gameplayUI.trade.sell.wnd:getChild( "SellSum" ):getText( ) )
   if buySum == sellSum and buySum ~= 0 then
      for i=1, #gameplayUI.trade.buy.slots do
         if gameplayUI.trade.buy.slots[i].item then
            local count = tonumber(gameplayUI.trade.buy.slots[i].counter:getText()) or 1
            getPlayer().exchangeTarget:giveItem( gameplayUI.trade.buy.slots[i].item.id, getPlayer(), count )
         end
      end
      for i=1, #gameplayUI.trade.sell.slots do
         if gameplayUI.trade.sell.slots[i].item then
            local count = tonumber(gameplayUI.trade.sell.slots[i].counter:getText()) or 1
            getPlayer():giveItem( gameplayUI.trade.sell.slots[i].item.id, getPlayer().exchangeTarget, count )
         end
      end
      gameplayUI:clearTrade()
      gameplayUI:tradeUpdateItems( gameplayUI.trade.traderInventory )
      gameplayUI:tradeUpdateItems( gameplayUI.trade.playerInventory )
      gameplayUI:tradeUpdateMoney( gameplayUI.trade.traderInventory )
      gameplayUI:tradeUpdateMoney( gameplayUI.trade.playerInventory )
      gameplayUI:tradeUpdateAliveItems( gameplayUI.trade.playerInventory )
   end
end

function cbTradeSlotClick( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   if click_args.button == CEGUI.LeftButton then
      local player = getPlayer()
      local sourceInventoryName = click_args.window:getUserString( "inventoryName" )
      local itemID = tonumber( click_args.window:getUserString( "itemID" ) )
      if itemID then
         if sourceInventoryName == "PlayerInventory" then
            local item = player:getInventory():getItemById( itemID )
            tradePlaceItem(item, "sell")
         elseif sourceInventoryName == "Sell" then
            local item = player:getInventory():getItemById( itemID )
            tradePlaceItem(item, "sellRemove")
         elseif sourceInventoryName == "TraderInventory" then
            local item = player.exchangeTarget.itemsManager:getItemById( itemID )
            tradePlaceItem(item, "buy")
         elseif sourceInventoryName == "Buy" then
            local item = player.exchangeTarget.itemsManager:getItemById( itemID )
            tradePlaceItem(item, "buyRemove")
         end
      end
   end
end

function cbDragAndDropTrade( args )
   local dd_args = CEGUI.toDragDropEventArgs( args )
   local player = getPlayer()
   local sourceInventoryName = dd_args.dragDropItem:getUserString( "inventoryName" )
   local itemID = tonumber( dd_args.dragDropItem:getUserString( "itemID" ) )
   local targetInventoryName = dd_args.window:getUserString( "inventoryName" )

   if targetInventoryName == "Buy" and sourceInventoryName == "TraderInventory"  then
      local item = player.exchangeTarget.itemsManager:getItemById( itemID )
      tradePlaceItem(item, "buy")
   elseif targetInventoryName == "Sell" and sourceInventoryName == "PlayerInventory"  then
      local item = player:getInventory():getItemById( itemID )
      tradePlaceItem(item, "sell")
   elseif sourceInventoryName == "Buy" and targetInventoryName == "TraderInventory"  then
      local item = player.exchangeTarget.itemsManager:getItemById( itemID )
      tradePlaceItem(item, "buyRemove")
   elseif sourceInventoryName == "Sell" and targetInventoryName == "PlayerInventory"  then
      local item = player:getInventory():getItemById( itemID )
      tradePlaceItem(item, "sellRemove")
   end
end
-------------------------------------------------------------------------------
-- Journal
-------------------------------------------------------------------------------
function gameplayUI:initJournal()
   self.journal.wnd = wndMgr:loadLayoutFromFile( "journal.layout" )
   self.journal.wnd:setVisible( false )
   self.wndGameplay:addChild( self.journal.wnd )

   self.journal.tabs.quests = self.journal.wnd:getChild( "QuestsBackground/Quests" )
   self.journal.hideFinishedQuests = self.journal.wnd:getChild( "QuestsBackground/HideFinishedQuests/Checkbox" )
   self.journal.hideFinishedQuests:subscribeEvent("MouseClick", cbHideFinishedQuests)

   runTimer(0, nil, function()
      self.journal.hideFinishedQuests:setProperty("Selected", tostring(getGlobalParam("hideFinishedQuests")))
   end,false)
   self.journal.tabs.questsOrder = {}
   local tooltipFont = "[font='dialog-10']"
   local wnd = self.journal.tabs.quests:getChild("Quest1")
   local index = 2
   local questsCount = tableSize( quests )
   for _,q in pairs(quests) do
      table.insert(self.journal.tabs.questsOrder, q)
      wnd:setText( q.title )
      wnd:setName( q.name )
      if not q:isStarted() then
         wnd:setVisible( false )
      end

      local formattedDescription = plText.fill( q.description, 70 )
      wnd:setTooltipText( tooltipFont .. formattedDescription )
      wnd:getTooltip():setProperty("DisplayTime", "25")

      wnd:subscribeEvent("MouseClick", cbQuestSelect)
      wnd:getChild("Checkbox"):subscribeEvent("MouseClick", cbQuestCheckbox)
      wnd:getChild("Button"):subscribeEvent( "Clicked", cbQuestMapCenter )

      --TODO: remove it upon markers not being a hidden feature
      wnd:getChild("Checkbox"):setVisible( false )

      if questsCount >= index then
         wnd = wnd:clone()
         wnd:setName( "Quest" .. index )
         self.journal.tabs.quests:addChild( wnd )
         index = index + 1
      end
   end

   self.journal.tabs.log = self.journal.wnd:getChild( "LogBackground/Log" )
   self.journal.showOnMapButton = self.journal.wnd:getChild( "LogBackground/ShowOnMap" )
   self.journal.showOnMapButton:setVisible( false )
   self.journal.showOnMapButton:subscribeEvent( "Clicked", cbQuestMapCenter )

   self.journal.wnd:subscribeEvent( "CloseClicked", cbJournalClose )
end

function gameplayUI:updateQuestsList()
   local function sortFunc(a,b)
      local orderA = 1
      local orderB = 1
      if not a:getQuestMarkersEnabled() then
         orderA = orderA + 1
      end
      if not b:getQuestMarkersEnabled() then
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
      local sortedIterator = tablex.sortv( self.journal.tabs.questsOrder, sortFunc )
      for _,q in sortedIterator do
         local wnd = self.journal.tabs.quests:getChild( q.name )
         if not q.hidden and q:isStarted() and not ( q:isFinished() and getGlobalParam("hideFinishedQuests") ) then
            index = index + 1
            wnd:setVisible( true )
            if q:isFinished() then
               wnd:getChild( "Checkbox" ):setVisible( false )
               wnd:setUserString( "defaultColour", "FF888888" )
               wnd:setProperty("TextColours", "FF888888")
            end
            if self.map.activeMarkers[q.name] then
               wnd:getChild( "Button" ):setVisible( true )
            else
               wnd:getChild( "Button" ):setVisible( false )
            end

            wnd:setPosition( CEGUI.UVector2( CEGUI.UDim(0,0), CEGUI.UDim(0,22*(index-1)) ) )
            wnd:getChild( "Checkbox" ):setProperty( "Selected", tostring(q:getQuestMarkersEnabled()) )
         else
            if self.journal.selectedQuest == q and getGlobalParam("hideFinishedQuests") then
               self:updateJournalQuestLog( nil )
            end
            wnd:setVisible(false)
            self:setQuestMarkersVisible( q.name, false )
         end
      end
   end, false)
end

function gameplayUI:setQuestMarkersVisible( questName, state )
   if state and not getGlobalParam("showQuestMarkers") then return end

   if self.map.activeMarkers[questName] then
      for _,markersIcons in pairs(self.map.activeMarkers[questName]) do
         markersIcons[1]:setVisible(state)
         if markersIcons[2] then
            markersIcons[2]:setVisible(state)
         end
      end
   end
end

function gameplayUI:showJournal( state )
   self.journal.wnd:setVisible( state )

   if ( state ) then
      self:resetCursorPos()
      self:showCursor()
      self.journal.wnd:activate()
      self:hideAnnoyingHint( "journal" )
      self:updateQuestsList()
   end

   if self.journal.selectedQuest then
      self:updateJournalQuestLog( self.journal.selectedQuest )
   else
      for _,q in pairs(quests) do
         if q:isStarted() then
            self:updateJournalQuestLog( q )
            break
         end
      end
   end

   setUserControl( not state )
end

function gameplayUI:updateJournalQuestLog( quest )
   if not quest then
      self.journal.tabs.log:setText( "" )
      return
   end

   if self.journal.selectedQuest then
      gameplayUI:setTextWndSelected( self.journal.tabs.quests:getChild(self.journal.selectedQuest.name), false )
   end

   self.journal.selectedQuest = quest
   gameplayUI:setTextWndSelected(  self.journal.tabs.quests:getChild(quest.name), true )

   local logText = quest.description .. quest.log

   self.journal.tabs.log:setText( logText )
   self.journal.tabs.log:setProperty( "VertScrollPosition", "9999" )

   if self.map.activeMarkers[quest.name] then
      self.journal.showOnMapButton:setVisible( true )
   else
      self.journal.showOnMapButton:setVisible( false )
   end
end

function gameplayUI:updateSelectedJournalQuestLog( quest )
   if self.journal.selectedQuest == quest then
      runTimer(0, nil, function()
         self:updateJournalQuestLog( quest )
      end,false)
   end
end

function gameplayUI:isJournalVisible()
   return self.journal.wnd:isVisible()
end

-------------------------------------------------------------------------------
-- Fast Travel
-------------------------------------------------------------------------------

function gameplayUI:initTravel()
   self.travel.wnd = wndMgr:loadLayoutFromFile("travel_menu.layout")
   self.wndGameplay:addChild(self.travel.wnd)
   self.travel.listBox = CEGUI.toListbox(self.travel.wnd:getChild("TravelList"))
   self.travel.wnd:getChild("Travel/Button"):subscribeEvent("MouseClick", cbTravelItemMouseClick)
   self.travel.wnd:getChild("Back/Button"):subscribeEvent("MouseClick", cbTravelBack)

   self.travel.wnd:setVisible( false )
end

function gameplayUI:setupTravel()
   local listBox = self.travel.listBox
   listBox:resetList()
   self.travel.entries = {}

   local ListItemColour = CEGUI.Colour:new_local(1.0,1.0,1.0,1.0)
   local ListItemSelectedColour = CEGUI.Colour:new_local(1.0,1.0,1.0,0.8)

   local t = getGlobalParam("fast_travel_destinations")
   local i = 1
   for objName, entry in pairs(t) do
      if entry.activated then
         local item = CEGUI.createListboxTextItem(entry.prettyName)
         item:setTextColours(ListItemColour)
         item:setSelectionColours(ListItemSelectedColour)
         item:setSelectionBrushImage("TaharezLook/TextSelectionBrush")
         item:setFont( "dialog-14" )
         item:setID(i)
         table.insert(self.travel.entries, objName)
         listBox:addItem(item)
         i = i + 1
      end
   end
   self:showTravel( true )
end

function cbTravelItemMouseClick(args)
   local item = gameplayUI.travel.listBox:getFirstSelectedItem()
   if item then
      local player = getPlayer()
      gameplayUI:showTravel( false )
      player:setDisableActionStates( true )
      player:setState("fastTravel", true)
      gameplayUI:startFadeToBlackSequence( 0.5, 1, 0.5 )
      gameplayUI:closeUI()
      local obj = getObj(gameplayUI.travel.entries[item:getID()])
      if obj then
         runTimer(1, nil, function ()
            local pos = localPointToWorld({x=0,y=0,z=-100}, obj:getPose())
            local dir = vec3RotateQuat({x=0,y=0,z=1}, obj:getPose():getRotQuat())
            getPlayer():moveAndOrientate(pos, dir, 0)
            player:setDisableActionStates( false )
            player:setState( "fastTravel", false )
         end, false)
      end
   end
end

function cbTravelBack(args)
   if gameplayUI:isTravelVisible() then
      gameplayUI:showTravel( false )
   end
end

function gameplayUI:showTravel( state )
   self.travel.wnd:setVisible( state )

   if ( state ) then
      getPlayer():setState("fastTravel", true)
      self:resetCursorPos()
      self:showCursor()
   else
      getPlayer():setState("fastTravel", false)
   end
   setUserControl( not state )
end

function gameplayUI:isTravelVisible()
   return self.travel.wnd:isVisible()
end

-------------------------------------------------------------------------------
-- Message
-------------------------------------------------------------------------------

function gameplayUI:initMessage()
   self.message.wnd = wndMgr:loadLayoutFromFile( "message.layout" )

   self.wndGameplay:addChild( self.message.wnd )

   self.message.contents = self.message.wnd:getChild( "Contents" )

   self.message.wnd:setVisible( false )

   self.message.wnd:subscribeEvent( "CloseClicked", cbMessageClose )
end

function gameplayUI:showMessage( title, contents )
   self:showCursor()

   if title ~= "" then
      self.message.wnd:setText( title )
   else
      self.message.wnd:setText( "Message" )
   end


   self.message.wnd:setVisible( true )
   self.message.contents:setText(contents)

   self.message.wnd:setHeight( CEGUI.UDim( 0, tonumber( self.message.contents:getProperty("VertExtent") ) * 1.2 ) )
   setUserControl( false )
end

function gameplayUI:hideMessage()
   self:hideCursor()
   self.message.wnd:setVisible( false )
   setUserControl( true )
end

function gameplayUI:isMessageVisible()
   return self.message.wnd:isVisible()
end

-------------------------------------------------------------------------------
-- Drawing
-------------------------------------------------------------------------------

function gameplayUI:initDrawing()
   self.drawing.wnd = wndMgr:loadLayoutFromFile( "drawing.layout" )
   self.drawing.image = self.drawing.wnd:getChild("ScrollablePane/__auto_container__/Image")
   self.wndGameplay:addChild(self.drawing.wnd)
   local image = "outcast_map.jpg"
   if not imgMgr:isDefined(image) then
      imgMgr:addFromImageFile(image, image)
   end
   self.drawing.image:setProperty("Image", image)
   self.drawing.wnd:setVisible( false )
   self.drawing.wnd:subscribeEvent( "CloseClicked", cbDrawingClose )
   self.drawing.image:subscribeEvent("MouseWheel", cbDrawingWheel)
end

function gameplayUI:showDrawing( state, itemName )
   self.drawing.wnd:setVisible(state)
   if state then
      local font = "[font='decor-8']"
      self.drawing.wnd:moveToFront()
      self:showCursor()

      self.drawing.wnd:setProperty( "Text", font .. ItemsData.ItemsInfo[itemName].drawing.eng.title )
      local image = ItemsData.ItemsInfo[itemName].drawing.eng.image
      if not imgMgr:isDefined(image) then
         imgMgr:addFromImageFile(image, image)
      end
      self.drawing.image:setProperty("Image", image)
      local size = ItemsData.ItemsInfo[itemName].drawing.size
      local width = size.width
      local height = size.height
      if width > height then
         height = math.min(size.height, self.wndGameplay:getPixelSize().height) - 50
      elseif width < height then
         width = math.min(size.width, self.wndGameplay:getPixelSize().width)
      end
      self.drawing.image:setProperty("Area", "{{0,0},{0,0},{0,"..width.. "},{0,".. height .."}}")
      self.drawing.image:setProperty("MaxSize", "{{0,"..width.. "},{0,".. height .."}}")
      self.drawing.wnd:getChild("ScrollablePane"):setProperty("ContentPaneAutoSized", "false")
      self.drawing.wnd:getChild("ScrollablePane"):setProperty("ContentArea", "l:0 t:0 r:"..width.."b:" .. height)
   else
      self:hideCursor()
   end
   setUserControl( not state )
end

function gameplayUI:isDrawingVisible()
   return self.drawing.wnd:isVisible()
end

-------------------------------------------------------------------------------
-- Map
-------------------------------------------------------------------------------
function gameplayUI:initMap()
   self.map.wnd = wndMgr:loadLayoutFromFile( "map.layout" )
   self.map.mapImage = self.map.wnd:getChild("ScrollablePane/__auto_container__/Image")
   self.wndGameplay:addChild(self.map.wnd)
   local image = "map2.jpg"
   if not imgMgr:isDefined(image) then
      imgMgr:addFromImageFile(image, image)
   end
   self.map.mapImage:setProperty("Image", image)
   self.map.wnd:setVisible( false )
   self.map.wnd:subscribeEvent( "CloseClicked", cbMapClose )
   self.map.wnd:getChild("CenterButton"):subscribeEvent("MouseClick", cbMapCenterOnPlayer)
   self.map.mapImage:subscribeEvent("MouseLeavesArea", cbMapLeave)
   self.map.mapImage:subscribeEvent("MouseButtonDown", cbMapClick)
   self.map.mapImage:subscribeEvent("MouseButtonUp", cbMapRelease)
   self.map.mapImage:subscribeEvent("MouseMove", cbMapMove)
   self.map.mapImage:subscribeEvent("MouseWheel", cbMapWheel)
   --TODO: make visible again upon markers not being a hidden feature
   self.map.wnd:getChild("ShowQuestMarkers"):setVisible( false )
   self.map.wnd:getChild("ShowQuestMarkers/Checkbox"):subscribeEvent( "MouseClick", cbMapShowQuestMarkers )
   --load this checkbox's state from a global param
   runTimer(0,nil,function()
      if getGlobalParam("showQuestMarkers") ~= nil then
         self.map.wnd:getChild("ShowQuestMarkers/Checkbox"):setProperty("Selected", tostring(getGlobalParam("showQuestMarkers")))
      end
   end,false)

   self.map.wnd:getChild("VisualizerButton"):subscribeEvent( "Clicked", cbMapVisualizerButtonClick )
   self.mapVisualizer.itemsWnd = self.map.wnd:getChild("VisualizerItemsList")
   self.mapVisualizer.classesWnd = self.map.wnd:getChild("VisualizerClassesList")
   self.mapVisualizer.itemsWnd:setVisible( false )
   self.mapVisualizer.classesWnd:setVisible( false )
end

function gameplayUI:getPositionOnMap( vector3, mapItemName )
   local xPixels = math.ceil(vector3.x/100 * self.map.mapInfo[mapItemName].meterToPixelScale)
   local yPixels = math.ceil(vector3.z/100 * self.map.mapInfo[mapItemName].meterToPixelScale)
   return { x=(xPixels + self.map.mapInfo[mapItemName].xoffset) * self.map.currentZoom, y=(yPixels + self.map.mapInfo[mapItemName].yoffset) * self.map.currentZoom }
end

function gameplayUI:mapAddIcon( name, icon, size, worldPos, tooltipText, relativeSize )
   local mapWidth = self.map.mapImage:getPixelSize().width
   local mapHeight = self.map.mapImage:getPixelSize().height
   local image = self.map.mapImage:createChild("TaharezLook/StaticImage", name)
   local pos = gameplayUI:getPositionOnMap( worldPos, self.map.currentMapItemName )
   if not relativeSize then
      image:setProperty( "Area", "{{0,0},{0,0},{0," .. size[1] .. "},{0," .. size[2] .. "}}" )
      pos = CEGUI.UVector2( CEGUI.UDim(pos.x/mapWidth,-size[1]/2), CEGUI.UDim(pos.y/mapHeight,-size[2]/2) )
   else
      image:setProperty( "Area", "{{0,0},{0,0},{" .. size[1]/mapWidth .. ",0},{" .. size[2]/mapHeight .. ",0}}" )
      pos = CEGUI.UVector2( CEGUI.UDim((pos.x-(size[1]/2))/mapWidth,0), CEGUI.UDim((pos.y-(size[2]/2))/mapHeight,0) )
   end
   image:setPosition( pos )
   image:setProperty( "Image", "gameplay/"..icon )
   image:setProperty( "FrameEnabled", "false" )
   image:setProperty( "BackgroundEnabled", "false" )
   image:setProperty( "MousePassThroughEnabled", "false" )
   image:setProperty( "MouseInputPropagationEnabled", "true" )
   image:setProperty( "TooltipText", tooltipText )
   image:setProperty( "TooltipType", "TaharezLook/Tooltip" )
   return image
end

function gameplayUI:mapAddQuestMarker( quest, params, tooltipText )
   if not quest or not params then return end

   local index = #self.map.activeMarkers + 1
   local position = params.pos
   tooltipText = tooltipText or ""

   if type(params.pos) == "string" then
      local obj = getObj(params.pos)
      if obj then
         position = obj:getPose():getPos()
         if tooltipText == "" and obj.getLabel then
            tooltipText = obj:getLabel()
         end
      else
         return
      end
   end

   local radiusIcon
   if params.radius then
      local radiusOnMap = (params.radius / 100) * self.map.mapInfo[self.map.currentMapItemName].meterToPixelScale
      radiusIcon = self:mapAddIcon( quest:getName() .. index .. "_radius", "QuestRadius", {radiusOnMap,radiusOnMap}, position, "", true )
   end

   local questIcon = self:mapAddIcon( quest:getName() .. index, "LandmarkPoint", {30,30}, position, tooltipText )
   questIcon:setProperty("AlwaysOnTop", "true")

   if not quest:getQuestMarkersEnabled() or not getGlobalParam("showQuestMarkers") then
      questIcon:setVisible( false )
      if radiusIcon then
         radiusIcon:setVisible( false )
      end
   end

   local questName = quest:getName()
   self.map.activeMarkers[questName] = self.map.activeMarkers[questName] or {}
   table.insert( self.map.activeMarkers[questName], {questIcon, radiusIcon} )
end

function gameplayUI:destroyActiveQuestMarkers( quest )
   local name = quest:getName()
   if self.map.activeMarkers[name] then
      for _,marker in pairs( self.map.activeMarkers[name] ) do
         wndMgr:destroyWindow(marker[1])
         wndMgr:destroyWindow(marker[2])
      end
      self.map.activeMarkers[name] = nil
   end
end

function gameplayUI:mapAddFastTravel( obj )
   if self.map.mapImage:getChild( obj:getName() ) then return end
   gameplayUI:mapAddIcon( obj:getName(), "fast_travel_point", {25,25}, obj:getPose():getPos(), obj.prettyName )
end

function gameplayUI:updateMap()
   local mapWidth = self.map.mapImage:getPixelSize().width
   local mapHeight = self.map.mapImage:getPixelSize().height
   local playerPos = getPlayer():getPose():getPos()
   local mapPlayerPos = self:getPositionOnMap( playerPos, self.map.currentMapItemName )

   local iconPos = CEGUI.UVector2( CEGUI.UDim(mapPlayerPos.x/mapWidth,-10), CEGUI.UDim(mapPlayerPos.y/mapHeight,-15) )
   self.map.mapImage:getChild("PlayerIcon"):setPosition(iconPos)

   local targetRotation = quatRotateQuat( quatFromDirs( getPlayer():getDir(), {x=1,y=0,z=0} ) )
   local playerRot = getAnglesFromQuat( targetRotation ).y + 90
   self.map.mapImage:getChild("PlayerIcon"):setProperty("Rotation", "x:0 y:0 z:"..playerRot)
end


function gameplayUI:mapCenterOnPos( pos )
   local mapWidth = gameplayUI.map.mapImage:getPixelSize().width
   local mapHeight = gameplayUI.map.mapImage:getPixelSize().height

   local horzScroll
   local vertScroll
   local mapPos
   --Means world position
   if pos.y then
      mapPos = gameplayUI:getPositionOnMap( pos, gameplayUI.map.currentMapItemName )
      horzScroll = mapPos.x / mapWidth
      vertScroll = mapPos.y / mapHeight
   else --Means map scale position taken from icon pos
      horzScroll = pos[1]
      vertScroll = pos[2]
   end

   if vertScroll > 0.5 then
     vertScroll = vertScroll + (vertScroll - 0.5) * 0.25
   elseif vertScroll < 0.5 then
     vertScroll = vertScroll - (0.5 - vertScroll) * 0.25
   end

   if horzScroll > 0.5 then
     horzScroll = horzScroll + (horzScroll - 0.5) * 1.2
   elseif horzScroll < 0.5 then
     horzScroll = horzScroll - (0.5 - horzScroll) * 1.2
   end

   gameplayUI.map.wnd:getChild("ScrollablePane"):setProperty("HorzScrollPosition", tostring( horzScroll ) )
   gameplayUI.map.wnd:getChild("ScrollablePane"):setProperty("VertScrollPosition", tostring( vertScroll ) )
end

function gameplayUI:showMap( state, itemName )
   self.map.wnd:setVisible(state)
   if state then
      if itemName == self.map.currentMapItemName then
         self.map.wnd:activate()
         self:showCursor()
         self:updateMap()
         local image = self.map.mapInfo[self.map.currentMapItemName].image
         if not imgMgr:isDefined(image) then
            imgMgr:addFromImageFile(image, image)
         end
         self.map.mapImage:setProperty("Image", image)
         if isDebug() then
            self.map.wnd:getChild("VisualizerButton"):setVisible( true )
         else
            self.map.wnd:getChild("VisualizerButton"):setVisible( false )
         end
      else
         self:showInfoTextEx( "This map is useless in this area", "minor", "" )
      end
   else
      self:hideCursor()
   end
   setUserControl( not state )
end

function gameplayUI:isMapVisible()
   return self.map.wnd:isVisible()
end

-------------------------------------------------------------------------------
-- Console
-------------------------------------------------------------------------------

function gameplayUI:showConsole()
   self:showCursor()
   guiContext:setRootWindow( self.wndConsole )
   self.wndConsole:setVisible( true )
   self.wndConsole:getChild("Command"):activate()
   setUserControl( false )
   getScene():pauseGame( true )
end

function gameplayUI:hideConsole()
   self.wndConsole:getChild("Command"):setText("")
   self.wndConsole:setVisible( false )
   guiContext:setRootWindow( gameplayUI.wndGameplay )

   if ( not gameplayUI:isInventoryVisible() and not gameplayUI:isInventory2Visible() ) then
      self:hideCursor()
      setUserControl( true )
   end
   getScene():pauseGame( false )
end

function gameplayUI:isConsoleVisible()
   return self.wndConsole:isVisible()
end

function gameplayUI:isGameplayRootWindow()
   return guiContext:getRootWindow() == self.wndGameplay
end

function hideConsole()
   gameplayUI:hideConsole()
end


function runConsoleCommand()
   console.runConsoleCommand()
   gameplayUI:hideConsole()
end
-------------------------------------------------------------------------------
-- Statistics
-------------------------------------------------------------------------------
function gameplayUI:addEffectToUI( effect )
   local index = #self.characterEffects.effectsTable + 1
   local pos = ( index - 1 ) * 0.1

   local effectWnd = wndMgr:createWindow( "TaharezLook/StaticText", string.format("%s_%d", effect:getName(), effect.ID ) )
   effectWnd:setSize( CEGUI.USize(CEGUI.UDim(0.95,0), CEGUI.UDim(0.1,0) ) )
   effectWnd:setProperty("BackgroundEnabled", "false")
   effectWnd:setProperty("FrameEnabled", "false")
   effectWnd:setProperty("MouseInputPropagationEnabled", "true")

   effectWnd:setProperty("Font", "dialog-8")
   effectWnd:setText( effect:getLabel() )
   effectWnd:setPosition( CEGUI.UVector2( CEGUI.UDim(0.02,0), CEGUI.UDim(pos,0) ) )
   effectWnd:setUserString( "effectID", effect.ID )
   effectWnd:setID( index )

   self.characterEffects.wnd:getChild("EffectsList"):addChild( effectWnd )

   local timeLeft = effect:getTimeLeft()
   if timeLeft then
      local durationWnd = wndMgr:createWindow( "TaharezLook/StaticText", "Duration" )
      durationWnd:setProperty("Area", "{{0.8,0},{0,0},{1,0},{1,0}}")
      durationWnd:setProperty("HorzFormatting", "RightAligned")
      durationWnd:setProperty("BackgroundEnabled", "false")
      durationWnd:setProperty("FrameEnabled", "false")
      durationWnd:setProperty("MouseInputPropagationEnabled", "true")
      durationWnd:setProperty("Font", "dialog-10")
      durationWnd:setText( round( timeLeft, 1 ) )
      effectWnd:addChild( durationWnd )
   end

   effectWnd:subscribeEvent("MouseEntersArea", cbEffectMouseIn)
   effectWnd:subscribeEvent("MouseLeavesArea", cbEffectMouseOut)

   table.insert( self.characterEffects.effectsTable, effectWnd )
end

function gameplayUI:removeEffectFromUI( effect )
   local effectWnd = self.characterEffects.wnd:getChild( string.format("%s%s_%d", "EffectsList/", effect:getName(), effect.ID ) )
   if effectWnd then
      table.remove( self.characterEffects.effectsTable, effectWnd:getID() )
      wndMgr:destroyWindow( effectWnd )
      self:updateEffectsPositions()
   end
end

function gameplayUI:updateAllPlayerEffectsUI()
   if self:isCharacterWindowVisible() then
      for _, effectWnd in ipairs( self.characterEffects.effectsTable ) do
         local effect = getDefaultPlayer().statusEffectsManager:getEffectByID( tonumber(effectWnd:getUserString( "effectID" )) )
         if effect:getStackCount() > 1 then
            effectWnd:setText( string.format( "%s (%d)", effect:getLabel(), effect:getStackCount() ) )
         else
            effectWnd:setText( effect:getLabel() )
         end
         local timeLeft = effect:getTimeLeft()
         if timeLeft then
            effectWnd:getChild("Duration"):setText( round( timeLeft, 1 ) )
         end
      end
   end
end

function gameplayUI:updateEffectsPositions()
   for index,effectWnd in pairs( self.characterEffects.effectsTable ) do
      local pos = ( index - 1 ) * 0.1
      effectWnd:setID( index )
      effectWnd:setPosition( CEGUI.UVector2( CEGUI.UDim(0.02,0), CEGUI.UDim(pos,0) ) )
   end
end

function gameplayUI:getParentAtIdx( wnd, index )
   local original = wnd
   while wnd and index > 0 do
      wnd = wnd:getParent()
      index = index - 1
   end
   return wnd
end

function gameplayUI:initCharacterWindow()
   self.characterWindow.wnd = wndMgr:loadLayoutFromFile( "characterWindow.layout" )
   self.wndGameplay:addChild( self.characterWindow.wnd )

   self.characterEffects.wnd = wndMgr:loadLayoutFromFile( "characterEffects.layout" )
   self.wndGameplay:addChild( self.characterEffects.wnd )
   self.characterEffects.showHidden = self.characterEffects.wnd:getChild("ShowHidden/Checkbox")

   for _, slotName in pairs( self.characterWindow.slotNames ) do
      addCharacterSlot( slotName )
   end

   self.statistics.wnd = self.characterWindow.wnd:getChild("Statistics")
   self.statistics.level = self.statistics.wnd:getChild( "Level/Label" )
   self.statistics.experience = self.statistics.wnd:getChild( "Level/Experience/Value" )
   self.statistics.attributePoints.status = self.statistics.wnd:getChild( "Level/Attribute/Value" )

   self.statistics.health.status = self.statistics.wnd:getChild( "Physique/Health/Value" )
   self.statistics.health.button = self.statistics.wnd:getChild( "Physique/Health/healthMaxUpgrade" )
   self.statistics.health.button:subscribeEvent( "MouseClick", cbStatUpgrade )
   self.statistics.stamina.status = self.statistics.wnd:getChild( "Physique/Stamina/Value" )
   self.statistics.stamina.button = self.statistics.wnd:getChild( "Physique/Stamina/staminaMaxUpgrade" )
   self.statistics.stamina.button:subscribeEvent( "MouseClick", cbStatUpgrade )
   self.statistics.energy.status = self.statistics.wnd:getChild( "Physique/Energy/Value" )
   self.statistics.energy.button = self.statistics.wnd:getChild( "Physique/Energy/energyMaxUpgrade" )
   self.statistics.energy.button:subscribeEvent( "MouseClick", cbStatUpgrade )

   self.statistics.food.status  = self.statistics.wnd:getChild( "Needs/Food/Value" )
   self.statistics.water.status = self.statistics.wnd:getChild( "Needs/Water/Value" )
   self.statistics.sleep.status = self.statistics.wnd:getChild( "Needs/Sleep/Value" )

   self.statistics.attackType     = self.statistics.wnd:getChild( "Combat/AttackType/Value" )
   self.statistics.physicalDamage = self.statistics.wnd:getChild( "Combat/Damage/Value" )
   self.statistics.armor          = self.statistics.wnd:getChild( "Combat/Armor/Value" )

   self:setStatisticsCombat( nil )

   self.characterWindow.wnd:setVisible( false )
   self.characterEffects.wnd:setVisible( false )

   self.characterWindow.wnd:subscribeEvent( "CloseClicked", cbHideCharacterWindow )

   self:initStatisticsNotifications()
end

function gameplayUI:setupCharacterWindow()
   self:updateAllPlayerEffectsUI()
   local player = getDefaultPlayer()
   local slots = player.itemsManager.slots

   local weapon = player:getWeaponSlotItem()
   for _, slotName in pairs( self.characterWindow.slotNames ) do
      if self.characterWindow[slotName] then
         local slotID = slotName
         if slotID:find("slot") then
            slotID = slotID:gsub("slot", "")
            slotID = tonumber( slotID )
         end
         if slots[slotID] or player.fastAccessSlots[slotID] then
            local item = slots[slotID] or player.itemsManager:getItemByName(player.fastAccessSlots[slotID])
            self.characterWindow[slotName].image:setProperty("Image", "gameplay/"..item.icon)
            self.characterWindow[slotName].slot:setUserString( "itemID", tostring(item.id) )
            if slotID ~= 1 and weapon == item then
               self.characterWindow[slotName].image:setAlpha(0.4)
            else
               self.characterWindow[slotName].image:setAlpha(1)
            end
            self.characterWindow[slotName].slot:setProperty("DraggingEnabled", "true")
         else
            self.characterWindow[slotName].image:setProperty("Image", "")
            self.characterWindow[slotName].slot:setProperty("DraggingEnabled", "false")
            self.characterWindow[slotName].slot:setUserString( "ItemID", "" )
         end
      end
   end
end

function addCharacterSlot( slotName )
   local parent = gameplayUI.characterWindow.wnd:getChild( "Slots/" .. slotName )
   local slot = wndMgr:loadLayoutFromFile( "inventory_slot.layout" )
   slot:setName( slotName )
   parent:addChild( slot )

   slot:setPosition( CEGUI.UVector2(CEGUI.UDim(0,0), CEGUI.UDim(0,0) ) )
   slot:setSize    ( CEGUI.USize   (CEGUI.UDim(0,64), CEGUI.UDim(0,64) ) )

   local newSlot = {}
   newSlot.slot       = slot:getChild("DragContainer")
   newSlot.image      = slot:getChild("DragContainer/ItemImage")
   newSlot.equipped   = slot:getChild("DragContainer/ItemImage/Equipped")
   newSlot.selected   = slot:getChild("DragContainer/ItemImage/Selected")
   newSlot.counter    = slot:getChild("DragContainer/ItemImage/Counter")

   newSlot.counter:setText( "" )

   newSlot.slot:setUserString( "inventoryName", gameplayUI.characterWindow.wnd:getName() )
   newSlot.slot:setUserString( "slotID", slotName )

   newSlot.slot:subscribeEvent( "DragStarted", cbSlotDragStarted )
   newSlot.slot:subscribeEvent( "DragDropItemDropped", cbDragAndDropCharacterSlot )
   newSlot.slot:subscribeEvent( "MouseClick", cbCharacterSlotClick )
   newSlot.slot:subscribeEvent( "MouseMove", cbItemInfoMouseMove )
   newSlot.slot:subscribeEvent( "MouseEntersArea", cbCharacterSlotOver )
   newSlot.slot:subscribeEvent( "MouseLeavesArea", cbCharacterSlotLeave )

   gameplayUI.characterWindow[slotName] = newSlot
   return newSlot
end

function gameplayUI:setItemToFastAccessSlot( slotID, item )
   local player = getDefaultPlayer()
   if item then
      if self.fastSlotsFilter[slotID] == item:getAnimations() or not self.fastSlotsFilter[slotID] then
         local currentSlot = getKeyByValue( player.fastAccessSlots, item.name )
         if currentSlot then
            player.itemsManager:unequipSlot( currentSlot, true )
            player.fastAccessSlots[currentSlot] = nil
         end
         if player:getWeaponSlotItem() == item then
            player.itemsManager:unequipSlot( player.parameters.weaponSlotId, true )
         end
         player.fastAccessSlots[slotID] = item.name
      end
   else
      player.itemsManager:unequipSlot( slotID, true )
      player.fastAccessSlots[slotID] = nil
   end
   self:setupCharacterWindow()
end

function gameplayUI:removeItemFromFastAccess( item )
   local player = getDefaultPlayer()
   if item then
      local slotName = getKeyByValue(player.fastAccessSlots, item:getItemName())
      if slotName then
         player.fastAccessSlots[slotName] = nil
      end
   end
end

function cbCharacterSlotClick( args )
   local me_args = CEGUI.toMouseEventArgs( args )
   if me_args.button == CEGUI.RightButton then
      local player = getPlayer()
      local item = player.itemsManager:getSlotItem( me_args.window:getName() )
      local slotId = me_args.window:getName():gsub("slot", "")
      item = item or player.itemsManager:getSlotItem( tonumber(slotId) )
      if item then
         player.popupMenuItem = item
         gameplayUI:setupPopupMenu( {"unequip"} )
         gameplayUI.popupMenu.wnd:setPosition( CEGUI.UVector2(CEGUI.UDim(0,me_args.position.x), CEGUI.UDim(0,me_args.position.y)) )
      end
   end
end

function cbCharacterSlotOver( args )
   local me_args = CEGUI.toMouseEventArgs( args )
   local slotName = me_args.window:getParent():getName()
   local slotID
   if slotName:find( "slot" ) then
      slotID = slotName:gsub("slot", "")
      slotID = tonumber( slotID )
   end
   local item = getPlayer().itemsManager:getSlotItem( slotID or slotName )
   gameplayUI:setupItemInfo( item )
   cbItemInfoMouseMove( args )

   gameplayUI.characterWindow[slotName].selected:setVisible( true )
end

function cbCharacterSlotLeave( args )
   if not CEGUI then return end
   local me_args = CEGUI.toMouseEventArgs( args )
   local slotName = me_args.window:getParent():getName()
   gameplayUI:hideItemInfo()
   gameplayUI.characterWindow[slotName].selected:setVisible( false )
end

function cbSlotDragStarted( args )
   gameplayUI:hideItemInfo()
end

function cbDragAndDropCharacterSlot( args )
   local dd_args = CEGUI.toDragDropEventArgs( args )
   local player = getDefaultPlayer()
   local item
   local sourceInventoryName = dd_args.dragDropItem:getUserString("inventoryName")
   local targetSlotName = dd_args.window:getParent():getName()
   local itemID = tonumber(dd_args.dragDropItem:getUserString("itemID"))

   if sourceInventoryName == "Inventory2" or sourceInventoryName == "InventoryTurret" then
      item = player:getTargetInventory():getItemById( itemID )
      local itemName = item.name
      player:OnInventoryDrop( item, item.count )
      item = player:getInventory():getItemByName( itemName )
   else
      item = player:getInventory():getItemById( itemID )
   end

   if not item then return end

   if item:isAttire() then
      if item:getAttireType() == targetSlotName then
         player:getInventory():equipSlotWithItem( item:getAttireType(), item.id )
      end
   elseif item:isWeapon() and ( item.name ~= "hand_to_hand.wpn" or targetSlotName == "slot1" ) then
      local slotID = targetSlotName:gsub("slot", "")
      slotID = tonumber( slotID )
      if slotID == 1 then
         player:useItem( item )
      elseif type(slotID) == "number" then
         if gameplayUI.fastSlotsFilter[slotID] == item:getAnimations() or not gameplayUI.fastSlotsFilter[slotID] then
            gameplayUI:setItemToFastAccessSlot( slotID, item )
            player:getInventory():equipSlotWithItem( slotID, item.id )
            player:playSound("ammunition_2.wav")
         else
            gameplayUI:showInfoTextEx("Right hip is for handguns and left is for one-handed weapons.", "minor", "")
         end
      end
   end
end

function gameplayUI:setStatUpgradeButtonsDisabled( state )
   self.statistics.health.button:setProperty( "Disabled", tostring(state))
   self.statistics.stamina.button:setProperty( "Disabled", tostring(state))
   self.statistics.energy.button:setProperty( "Disabled", tostring(state))
end

function gameplayUI:initStatisticsNotifications()
   local notifications = wndMgr:loadLayoutFromFile( "statistics_notifications.layout" )

   self.wndGameplay:addChild( notifications )

   self.statistics.food.notification  = notifications:getChild( "Food" )
   self.statistics.water.notification = notifications:getChild( "Water" )
   self.statistics.sleep.notification = notifications:getChild( "Sleep" )
   self.statistics.attributePoints.notification = notifications:getChild( "LevelUp" )

   self.statistics.food.notification:hide ()
   self.statistics.water.notification:hide()
   self.statistics.sleep.notification:hide()
   self.statistics.attributePoints.notification:hide()
end

function gameplayUI:showCharacterWindow( state )
   self.characterWindow.wnd:setVisible( state )
   self.characterEffects.wnd:setVisible( state )

   if ( state ) then
      self:resetCursorPos()
      self:showCursor()
      self:setupCharacterWindow()
      self.characterWindow.wnd:activate()
   end

   setUserControl( not state )
end

function gameplayUI:isCharacterWindowVisible()
   return self.characterWindow.wnd:isVisible()
end

function gameplayUI:setStatisticsValue( stat, current, maximum )
   local timerInfo = {owner = self.statistics, fadeInTime = 1.0, updateInterval = 0.03, pauseCounter = 0, pause1 = 3.0, pause2 = 5.0, action = "increase", alpha = 0.01}
   if stat == self.statistics.attributePoints then
      local points = getDefaultPlayer().attributePoints
      stat.status:setText( points )
      if points > 0 then
         stat.show = true
         if not self.statistics.fadeTimer then
            self.statistics.fadeTimer = runTimer(timerInfo.updateInterval, timerInfo, showSyncedStatNotifications, true)
         end
      else
         stat.show = false
      end
      return
   end

   local text     = ""
   local color    = "[colour='ffec260c']"
   local percents = round( current / maximum * 100 )

   if ( percents >= 75 ) then
      color = "[colour='ffffffff']"
   elseif ( percents >= 50 ) then
      color = "[colour='fff2ee8c']"
   elseif ( percents >= 25 ) then
      color = "[colour='fff4c034']"
   end

   text = text .. color
   text = text .. tostring(round(current)) .. "/" .. tostring(maximum)
   text = text .. " (" .. tostring(percents) .. "%)"

   stat.status:setText( text )

   if ( stat.notification ) then
      if ( percents <= 25 ) then
         stat.show = true
         if not self.statistics.fadeTimer then
            self.statistics.fadeTimer = runTimer(timerInfo.updateInterval, timerInfo, showSyncedStatNotifications, true)
         end
      else
         stat.show = false
      end
   end
end

function showSyncedStatNotifications( self )
   for _,v in pairs(self.owner) do
      if v.notification then
         if not v.show or self.alpha <= 0 or gameplayUI:isDialogVisible() then
             v.notification:hide()
         else
            v.notification:setAlpha(self.alpha)
            v.notification:show()
         end
      end
   end

   windowFadeSequenceTimerUpdate( self )
end

function gameplayUI:startFadeToBlackSequence( fadeInTime, pauseTime, fadeOutTime )
   local function out()
      self:fadeOutWindow( self.overlays.black.wnd, fadeOutTime, function() gameplayUI.fadeToBlackSequence = false end )
   end
   local function pause()
      runTimer( pauseTime, nil, out, false)
   end

   self.fadeToBlackSequence = true
   self:fadeInWindow( self.overlays.black.wnd, fadeInTime, pause )
end

function windowFadeSequenceTimerUpdate( self )
   self.fadeOutTime = self.fadeOutTime or self.fadeInTime
   if self.action == "increase" then
      if self.fadeInTime == 0 then
         self.alpha = 1
      else
         self.alpha = self.alpha + 1/(self.fadeInTime/self.updateInterval)
      end
      if self.alpha >= 1 then
         self.action = "wait"
      end
   elseif self.action == "decrease" then
      if self.fadeOutTime == 0 then
         self.alpha = 0
      else
         self.alpha = self.alpha - 1/(self.fadeOutTime/self.updateInterval)
      end
      if self.alpha <= 0 then
         self.action = "wait"
      end
   elseif self.action == "wait" then
      self.pauseCounter = self.pauseCounter + self.updateInterval
      if self.pauseCounter >= self.pause1 and self.alpha >= 1 then
         self.pauseCounter = 0
         self.action = "decrease"
      elseif self.pauseCounter >= self.pause2 and self.alpha <= 0 then
         gameplayUI.fadeToBlackSequence = false
         self.owner.fadeTimer:stop()
         self.owner.fadeTimer = nil
      end
   end
end

function gameplayUI:retainPositionInsideDisplay( position, window )
   local wndSize = window:getPixelSize()
   local screenSize = self.wndGameplay:getPixelSize()

   local xoff
   local yoff
   if type(position.x) == "userdata" then
      xoff = math.min( math.max( position.x.offset, 0 ), screenSize.width - wndSize.width )
      yoff = math.min( math.max( position.y.offset, 0 ), screenSize.height - wndSize.height )
   else
      xoff = math.min( math.max( position.x, 0 ), screenSize.width - wndSize.width )
      yoff = math.min( math.max( position.y, 0 ), screenSize.height - wndSize.height )
   end
   return CEGUI.UVector2( CEGUI.UDim( 0, xoff ), CEGUI.UDim( 0, yoff ) )
end

function gameplayUI:initOverlays()
   self.overlays.wnd = wndMgr:loadLayoutFromFile( "gameplay/overlays.layout" )
   self.wndGameplay:addChild( self.overlays.wnd )
   self.overlays.black.wnd = self.overlays.wnd:getChild("Black")
end

function gameplayUI:triggerOverlay( stringName, time, state )
   self.overlays[stringName].state = state
   if self.overlays[stringName].state then
      self.overlays[stringName].wnd:setAlpha( 0.01 )
      self:fadeInWindow( self.overlays[stringName].wnd, time )
   else
      self:fadeOutWindow( self.overlays[stringName].wnd, time )
   end
end

function gameplayUI:genFadeTimerID()
   self.fadeTimerID = self.fadeTimerID + 1
   return tostring( self.fadeTimerID )
end

function gameplayUI:fadeInWindow( window, time, onFinishedCallback )
window:setVisible( true )

local oldTimerID = window:getUserString( "timerID" )

if oldTimerID and self.fadeTimers[oldTimerID] then
   self.fadeTimers[oldTimerID]:stop()
   self.fadeTimers[oldTimerID] = nil
end

local newTimerID = self:genFadeTimerID()
window:setUserString( "timerID", newTimerID )

self.fadeTimers[newTimerID] = runTimerExt( 0.03, nil, function()
      if self.fadeTimers[newTimerID] then
         local newAlpha = self.fadeTimers[newTimerID]:getTimeDuration() / time
   		window:setAlpha( newAlpha )
   		if newAlpha >= 1 then
   			self.fadeTimers[newTimerID]:stop()
      		self.fadeTimers[newTimerID] = nil
            if onFinishedCallback then
               onFinishedCallback()
            end
   		end
      else
         log("DEBUG WARNING: runTimerExt timer handle is nil in the callback")
      end
	end, time )
end

function gameplayUI:fadeOutWindow( window, time, onFinishedCallback )
window:setVisible( true )

local oldTimerID = window:getUserString( "timerID" )

if oldTimerID and self.fadeTimers[oldTimerID] then
   self.fadeTimers[oldTimerID]:stop()
   self.fadeTimers[oldTimerID] = nil
end

local newTimerID = self:genFadeTimerID()
window:setUserString( "timerID", newTimerID )

local startAlpha = window:getAlpha()

self.fadeTimers[newTimerID] = runTimerExt( 0.03, nil, function()
      if self.fadeTimers[newTimerID] then
         local newAlpha = startAlpha - ( self.fadeTimers[newTimerID]:getTimeDuration() / time )
         window:setAlpha( newAlpha )
         if newAlpha <= 0 then
            self.fadeTimers[newTimerID]:stop()
            self.fadeTimers[newTimerID] = nil
            window:setVisible( false )
            if onFinishedCallback then
               onFinishedCallback()
            end
         end
      else
         log("DEBUG WARNING: runTimerExt timer handle is nil in the callback")
      end
   end, time )
end

function gameplayUI:startBugHint()
   local btn = getButtonCurrentKeyName( "ACTIVATE" )
   self:setupBillboard( "Bug control", string.format( "Press '%s' to pick up items\nHold '%s' to shut down chip", btn, btn ) )
   self.bugHintTimer = runTimer(5, self, function(self)
      self:hideBillboard()
      self.bugHintTimer = runTimer(20, self, function(self)
         self:startBugHint()
      end, false)
   end, false)
end

function gameplayUI:stopBugHint()
   if self.bugHintTimer then
      self:hideBillboard()
      self.bugHintTimer:stop()
      self.bugHintTimer = nil
   end
end

function gameplayUI:updateStatisticsAttributePoints()
   self:setStatisticsValue( self.statistics.attributePoints )
end

function gameplayUI:setStatisticsCombat( item )
   if ( item ) then
      if ( item:isMeleeWeapon() ) then
         self.statistics.attackType:setText( "Melee" )
      elseif ( item:isRangedWeapon() ) then
         self.statistics.attackType:setText( "Ranged" )
      else
         self.statistics.attackType:setText( "None" )
         self.statistics.physicalDamage:setText( "0" )
      end

      if ( item:isWeapon() ) then
         self.statistics.physicalDamage:setText( tostring(item:getDamage()) )
      end
   else
      self.statistics.attackType:setText( "None" )
      self.statistics.physicalDamage:setText( "0" )
   end
end

function gameplayUI:updateStatisticsLevel()
   local lvl = "Level " .. getDefaultPlayer().level
   self.statistics.level:setText( lvl )
   gameplayUI:updateStatisticsAttributePoints()
end

function gameplayUI:updateStatisticsExperience()
   local text = getDefaultPlayer().experience.current .. "/" .. getDefaultPlayer().experience.max
   self.statistics.experience:setText( text )
end

function gameplayUI:updatePlayerStat( statName )
   local player = getDefaultPlayer()

   if self.statistics[statName] then
      local current = player:getStatCount(statName)
      local max = player:getStatCount(statName.."Max")
      if max then
         gameplayUI:setStatisticsValue( self.statistics[statName], current, max )
      else
         self.statistics[statName]:setText( tostring(current) )
      end
   end

   if self[statName] then
      local size = self[statName].wnd:getSize()
      local percent = player:getStatPercent( statName )
      size.width.scale = percent / 100
      self[statName].wnd:setSize( size )
   end
end

-------------------------------------------------------------------------------
-- Interact
-------------------------------------------------------------------------------

function gameplayUI:initPopupMenu()
   self.popupMenu.wnd = CEGUI.toPopupMenu( self.wndGameplay:createChild( "TaharezLook/PopupMenu", "PopupMenu" ) )

   self.popupMenu.wnd:setProperty( "ItemSpacing",       "2"     )
   self.popupMenu.wnd:setProperty( "ClippedByParent",   "false" )
   self.popupMenu.wnd:setProperty( "AutoResizeEnabled", "true"  )
   self.popupMenu.wnd:setProperty( "AlwaysOnTop",       "true"  )
end

function gameplayUI:initDialog()
   self.dialog.wnd = wndMgr:loadLayoutFromFile( "gameplay/dialog.layout" )
   self.dialog.wnd:setVisible(false)
   self.wndGameplay:addChild( self.dialog.wnd )

   self.dialog.bottom.tradeButton = self.dialog.wnd:getChild( "BottomLine/Trade" )
   self.dialog.bottom.tradeButton:subscribeEvent("MouseClick", cbDialogTradeClick)
   self.dialog.bottom.tradeButton:subscribeEvent( "MouseEntersArea", cbDialogMouseOver )
   self.dialog.bottom.tradeButton:subscribeEvent( "MouseLeavesArea", cbDialogMouseOut )

   self.dialog.bottom.replies.wnd = self.dialog.wnd:getChild( "BottomLine/Replies" )
   self.dialog.textOld = self.dialog.wnd:getChild( "TopLine/TextOld" )

   self:setDialogText( nil, nil )
   self:hideDialogSkipHint()
end

function gameplayUI:initInfo()
   self.info.updateInterval = 0.03
   self.info.defSlideTime = 0.3
   self.info.wnd = wndMgr:loadLayoutFromFile( "gameplay/notifications.layout" )
   self.wndGameplay:addChild( self.info.wnd )
   self.info.minorInfoWnds = {   self.info.wnd:getChild( "MinorInfo1" ),
                                 self.info.wnd:getChild( "MinorInfo2" ),
                                 self.info.wnd:getChild( "MinorInfo3" ),}
   self.info.majorInfoWnds = {   self.info.wnd:getChild( "MajorInfo1" ),
                                 self.info.wnd:getChild( "MajorInfo2" ),
                                 self.info.wnd:getChild( "MajorInfo3" ),}
   for _,v in pairs(self.info.minorInfoWnds) do
      v.counter = 0
      v:setVisible( false )
   end
   for _,v in pairs(self.info.majorInfoWnds) do
      v.counter = 0
      v:setVisible( false )
   end
   self.info.taskList = { ["minor"] = {}, ["major"] = {}, }
end

function gameplayUI:showQuestStartInfo( text )
   getPlayer():playSound( "quest_start.wav" )
   self:showInfoTextEx( text, "major", "" )
end

function gameplayUI:showQuestUpdateInfo( text )
   getPlayer():playSound( "quest_update.wav" )
   self:showInfoTextEx( text, "major", "" )
end

function gameplayUI:showQuestLogUpdateInfo( text )
   runTimer(0, self, function() getPlayer():stopSound( "quest_update.wav" ) end, false)
   getPlayer():playSound( "journal_update.wav" )
   self:showInfoTextEx( text, "major", "" )
end

function gameplayUI:showQuestStopInfo( text )
   getPlayer():playSound( "quest_complete.wav" )
   self:showInfoTextEx( text, "major", "" )
end

function gameplayUI:showInventoryPickInfo( text )
   getPlayer():playSound( "inventory_pick.wav" )
   self:showInfoTextEx( text, "minor", "" )
end

function gameplayUI:showInventoryDropInfo( text )
   getPlayer():playSound( "inventory_drop.wav" )
   self:showInfoTextEx( text, "minor", "" )
end

function gameplayUI:showInfoText( text )
   gameplayUI:showInfoTextEx(text)
end

function gameplayUI:showInfoTextEx(text, importance, sound)
   log("notification: " .. (text or "nil"))
   importance = importance or "minor"
   sound = sound or "quest_update.wav"
   local task = { ["text"] = text, ["sound"] = sound }
   table.insert(self.info.taskList[importance], task)

   self:showInfo( task, importance )
end

function gameplayUI:showInfo( task, importance )
   --Find a window that is hidden
   local infoWnd
   for _,v in pairs(self.info[importance.."InfoWnds"]) do
      if v:isVisible() == false then
         infoWnd = v
      end
   end
   if not infoWnd then
      return
   end

   if task.sound ~= "" then
      getPlayer():playSound( task.sound )
   end

   --Slide up the ones that are shown
   for _,v in pairs(self.info[importance.."InfoWnds"]) do
      if v:isVisible() == true then
         if v.timer then
            v.counter = v.counter - (self.info.defSlideTime - self.info.updateInterval)
         else
            v.timer = runTimer( self.info.updateInterval, v, slideInfoWnd, true )
         end
      end
   end

   --Setup a new one
   local textChild = infoWnd:getChild( "InfoText" )
   textChild:setText( task.text )

   local font  = textChild:getFont()
   local width = font:getTextExtent( textChild:getText() ) * 1.2
   infoWnd:setWidth( CEGUI.UDim(0.0,width) )

   if importance == "minor" then
      infoWnd:setYPosition( CEGUI.UDim(0.75,0) )
   else
      infoWnd:setYPosition( CEGUI.UDim(0.2,0) )
      infoWnd:setXPosition( CEGUI.UDim(0.5,-width/2) )
   end
   infoWnd:setVisible( true )

   runTimer( 4, {textWnd = infoWnd, importance = importance}, hideInfoWnd, false )
end

function hideInfoWnd( params )
   params.textWnd:setVisible( false )
   if params.textWnd.timer then
      stopInfoWndSlide(params.textWnd)
   end
   table.remove( gameplayUI.info.taskList[params.importance], 1 )

   if #gameplayUI.info.taskList[params.importance] >= 3 then
      gameplayUI:showInfo( gameplayUI.info.taskList[params.importance][3], params.importance )
   end
end

function slideInfoWnd( wnd )
   wnd.counter = wnd.counter + gameplayUI.info.updateInterval
   local offset = wnd:getHeight().offset*1.2
   local delta = offset/(gameplayUI.info.defSlideTime/gameplayUI.info.updateInterval)
   local pos = wnd:getPosition()
   local newPos = CEGUI.UVector2( pos.x, pos.y - CEGUI.UDim(0,delta) )
   wnd:setPosition( newPos )
   if wnd.counter >= gameplayUI.info.defSlideTime then
      stopInfoWndSlide(wnd)
   end
end

function stopInfoWndSlide( wnd )
   wnd.counter = 0
   wnd.timer:stop()
   wnd.timer = nil
end

function gameplayUI:isFPSVisible()
   return self.fps.wnd:isVisible()
end

function gameplayUI:initFPS()
   self.fps.wnd  = self.wndGameplay:getChild( "FPSText" )
   self.fps.text = self.wndGameplay:getChild( "FPSText" )

   self.fps.wnd:setVisible( isDebug() or isEditor() )

   if self:isFPSVisible() then
      self:showFPS()
   end
end

function gameplayUI:showFPS()
   self.fps.wnd:setVisible( true )

   self.fps.timer = runTimer(0.5, self, gameplayUI.updateFPS, true)
end

function gameplayUI:hideFPS()
   self.fps.wnd:setVisible( false )
end

function gameplayUI:updateFPS()
   if not self:isFPSVisible() then
      if self.fps.timer then
         self.fps.timer:stop()
      end
      self.fps.timer = nil
   end

   local p
   p = getPlayer()
   local x, y, z = 0, 0, 0
   if p then
      local pos = p:getPose():getPos()
      x = pos.x
      y = pos.y
      z = pos.z
   end

   self.fps.text:setText  ( string.format("FPS: %d, X:%d, Y:%d, Z:%d", getFrameRate(), x, y, z) )

   local font  = self.fps.text:getFont()
   local width = font:getTextExtent( self.fps.text:getText() ) * 1.2

   self.fps.wnd:setWidth( CEGUI.UDim(0.0,width) )
end

function gameplayUI:initItemDelimiter()
   self.itemDelimiter.wnd = wndMgr:loadLayoutFromFile( "items_delimiter.layout" )

   self.wndGameplay:addChild( self.itemDelimiter.wnd )

   self.itemDelimiter.editbox = self.itemDelimiter.wnd:getChild( "Editbox" )
   self.itemDelimiter.editbox:subscribeEvent( "TextAccepted", cbItemDelimiterEditChanged )

   self.itemDelimiter.scrollbar = CEGUI.toScrollbar( self.itemDelimiter.wnd:getChild( "Scrollbar" ) )
   self.itemDelimiter.scrollbar:subscribeEvent( "ScrollPositionChanged", cbItemDelimiterScrollbarChanged )

   self.itemDelimiter.wnd:getChild( "Apply" ):subscribeEvent( "MouseClick", cbItemDelimiterAccept )
   self.itemDelimiter.wnd:getChild( "Cancel" ):subscribeEvent( "MouseClick", cbItemDelimiterCancel )

   self.itemDelimiter.wnd:setVisible( false )
end

function gameplayUI:updateItemDelimiter()
   local itemsCount = tonumber( self.itemDelimiter.editbox:getText() )

   if ( not itemsCount ) then
      return 0
   end

   itemsCount = round( itemsCount )

   if ( itemsCount >= 1 and itemsCount <= self.itemDelimiter.scrollbar:getDocumentSize() ) then
      self.itemDelimiter.scrollbar:setScrollPosition( itemsCount )
   elseif ( itemsCount <= 0 ) then
      itemsCount = 1
      self.itemDelimiter.editbox:setText( tostring(itemsCount) )
   elseif ( itemsCount > self.itemDelimiter.scrollbar:getDocumentSize() ) then
      itemsCount = self.itemDelimiter.scrollbar:getDocumentSize()
      self.itemDelimiter.editbox:setText( tostring(itemsCount) )
   end

   return itemsCount
end

function gameplayUI:setupItemDelimiter( item, mode )
   self.itemDelimiter.wnd:getChild( "ItemIcon" ):setProperty( "Image", "gameplay/"..item.icon )

   self.itemDelimiter.editbox:setText( tostring(item.count) )

   self.itemDelimiter.scrollbar:setProperty( "DocumentSize", tostring(item.count) )
   self.itemDelimiter.scrollbar:setProperty( "ScrollPosition", tostring(item.count) )

   self.itemDelimiter.item = item
   self.itemDelimiter.mode = mode

   local pos = guiContext:getMouseCursor():getPosition()
   local delHeight = self.itemDelimiter.wnd:getSize().height.offset
   local delWidth = self.itemDelimiter.wnd:getSize().width.offset
   pos = CEGUI.UVector2( CEGUI.UDim( 0, pos.x-delWidth/2 ), CEGUI.UDim( 0, pos.y-delHeight/2 ) )
   pos = self:retainPositionInsideDisplay( pos, self.itemDelimiter.wnd )
   self.itemDelimiter.wnd:setPosition( pos )
end

function gameplayUI:showItemDelimiter()
   self.itemDelimiter.wnd:setVisible( true )
end

function gameplayUI:hideItemDelimiter()
   self.itemDelimiter.wnd:setVisible( false )
end

function gameplayUI:isItemDelimiterVisible()
   return self.itemDelimiter.wnd:isVisible()
end

function gameplayUI:initInteractProgress()
   self.interactProgress.wnd = wndMgr:loadLayoutFromFile( "interact_progress.layout" )

   self.wndGameplay:addChild( self.interactProgress.wnd )

   self.interactProgress.text = self.interactProgress.wnd:getChild( "Text" )
   self.interactProgress.bar  = CEGUI.toProgressBar( self.interactProgress.wnd:getChild( "Bar" ) )

   self.interactProgress.wnd:setVisible( false )
end

function gameplayUI:showInteractProgress( text, time )
   self:hideInteractProgress()
   self.interactProgress.text:setText( text .. "..." )
   self.interactProgress.bar:setProgress( 0 )
   self.interactProgress.wnd:setVisible( true )

   self.interactProgress.timer = runTimerExt( time * 0.05, self, self.cbInteractProgressStep, time )
end

function gameplayUI:hideInteractProgress()
   if ( self.interactProgress.timer ) then
      self.interactProgress.timer:stop()
      self.interactProgress.timer = nil
   end

   self.interactProgress.wnd:setVisible( false )
end

function gameplayUI:cbInteractProgressStep()
   if ( not self.interactProgress.timer ) then
      self:hideInteractProgress()
      return
   end

   self.interactProgress.bar:setProgress( self.interactProgress.timer:getTimeDuration() / (self.interactProgress.timer:getTimeAmount() * 0.9) )
   --log( "---- time left " .. tostring(self.interactProgress.timer:getTimeLeft()) )

   if ( self.interactProgress.timer:getTimeLeft() == 0 ) then
      self:hideInteractProgress()
   end
end

function gameplayUI:initWaiting()
   self.waiting.wnd = wndMgr:loadLayoutFromFile( "waiting.layout" )

   self.wndGameplay:addChild( self.waiting.wnd )

   self.waiting.wnd:getChild( "Morning"   ):subscribeEvent( "MouseClick", cbWaitMorning )
   self.waiting.wnd:getChild( "Evening"   ):subscribeEvent( "MouseClick", cbWaitEvening )
   self.waiting.wnd:getChild( "Afternoon" ):subscribeEvent( "MouseClick", cbWaitAfternoon )
   self.waiting.wnd:getChild( "Midnight"  ):subscribeEvent( "MouseClick", cbWaitMidnight )

   self.waiting.wnd:setVisible( false )
end

function gameplayUI:showWaiting()
   if ( not self.waiting.waitMode ) then

      self.waiting.wnd:setVisible( true )
      self:resetCursorPos()
      self:showCursor()
      setUserControl( false )
   end
end

function gameplayUI:hideWaiting()
   --log("--")
   self.waiting.wnd:setVisible( false )
   setUserControl( true )
end

function gameplayUI:isWaitingVisible()
   return self.waiting.wnd:isVisible()
end

function gameplayUI:isWaitingMode()
   return self.waiting.waitMode
end

function cbWaitMorning( args )
   log("Start Wait Morning")

   gameplayUI:hideRestHints()
   gameplayUI:hideWaiting()

   WeatherSystem:subscribeDaytimeChange( gameplayUI.cbWaitStop, Weather.DT_MORNING )
   gameplayUI.waiting.timeChangeSub = Weather.DT_MORNING

   setGameSpeed                ( gameplayUI.waiting.rates.game )
   WeatherSystem:changeTimeRate( gameplayUI.waiting.rates.weather )
   SkySystem:changeTimeRate    ( gameplayUI.waiting.rates.sky )

   gameplayUI.waiting.waitMode = true

   getPlayer():timeSkipStart()
end

function cbWaitEvening( args )
   log("Start Wait Evening")

   gameplayUI:hideRestHints()
   gameplayUI:hideWaiting()

   WeatherSystem:subscribeDaytimeChange( gameplayUI.cbWaitStop, Weather.DT_EVENING )
   gameplayUI.timeChangeSub = Weather.DT_EVENING

   setGameSpeed                ( gameplayUI.waiting.rates.game )
   WeatherSystem:changeTimeRate( gameplayUI.waiting.rates.weather )
   SkySystem:changeTimeRate    ( gameplayUI.waiting.rates.sky )

   gameplayUI.waiting.waitMode = true

   getPlayer():timeSkipStart()
end

function cbWaitAfternoon( args )
   log("Start Wait Afternoon")

   gameplayUI:hideRestHints()
   gameplayUI:hideWaiting()

   WeatherSystem:subscribeDaytimeChange( gameplayUI.cbWaitStop, Weather.DT_AFTERNOON )
   gameplayUI.timeChangeSub = Weather.DT_AFTERNOON

   setGameSpeed                ( gameplayUI.waiting.rates.game )
   WeatherSystem:changeTimeRate( gameplayUI.waiting.rates.weather )
   SkySystem:changeTimeRate    ( gameplayUI.waiting.rates.sky )

   gameplayUI.waiting.waitMode = true

   getPlayer():timeSkipStart()
end

function cbWaitMidnight( args )
   log("Start Wait Midnight")

   gameplayUI:hideRestHints()
   gameplayUI:hideWaiting()

   WeatherSystem:subscribeDaytimeChange( gameplayUI.cbWaitStop, Weather.DT_MIDNIGHT )
   gameplayUI.timeChangeSub = Weather.DT_MIDNIGHT

   setGameSpeed                ( gameplayUI.waiting.rates.game )
   WeatherSystem:changeTimeRate( gameplayUI.waiting.rates.weather )
   SkySystem:changeTimeRate    ( gameplayUI.waiting.rates.sky )

   gameplayUI.waiting.waitMode = true

   getPlayer():timeSkipStart()
end
local cbWaitStop
function cbWaitStop( targetState, state )
   if ( state == targetState ) then
      log("Wait stop")

      gameplayUI.timeChangeSub = nil
      gameplayUI.waiting.waitMode = false

      gameplayUI:showRestHints()

      WeatherSystem:unsubscribeDaytimeChange( gameplayUI.cbWaitStop, targetState )

      setGameSpeed                ( 1.0 )
      WeatherSystem:changeTimeRate( -gameplayUI.waiting.rates.weather )
      SkySystem:changeTimeRate    ( -gameplayUI.waiting.rates.sky )

      getPlayer():timeSkipStop()
   end
end
gameplayUI.cbWaitStop = cbWaitStop

function gameplayUI:initRestHints()
   self.restHints.wnd = wndMgr:loadLayoutFromFile( "rest_hints.layout" )

   self.wndGameplay:addChild( self.restHints.wnd )

   self.restHints.wnd:setVisible( false )
end

function gameplayUI:showRestHints()
   local text = string.format( "Press '%s' to leave camp          Press '%s' to skip time          Press '%s' to open inventory",
      getButtonCurrentKeyName("ACTIVATE"), getButtonCurrentKeyName("TIMESKIP"), getButtonCurrentKeyName("INVENTORY") )
   self.restHints.wnd:getChild("Text"):setText( text )
   self.restHints.wnd:setVisible( true )
end

function gameplayUI:hideRestHints()
   self.restHints.wnd:setVisible( false )
end

function gameplayUI:initEffectInfo()
   self.effectInfo.wnd = wndMgr:loadLayoutFromFile( "effect_info.layout" )
   self.wndGameplay:addChild( self.effectInfo.wnd )
   self.effectInfo.title = self.effectInfo.wnd:getChild( "Title" )
   self.effectInfo.stats = self.effectInfo.wnd:getChild( "Stats" )
   self.effectInfo.wnd:setVisible( false )
end

function gameplayUI:initItemInfo()
   self.itemInfo.wnd = wndMgr:loadLayoutFromFile( "item_info.layout" )

   self.wndGameplay:addChild( self.itemInfo.wnd )

   self.itemInfo.title = self.itemInfo.wnd:getChild( "Title" )
   self.itemInfo.stats = self.itemInfo.wnd:getChild( "Stats" )

   self.itemInfo.wnd:setVisible( false )
end

function gameplayUI:compareStat( stat1, stat2, text )
   if not stat1 or not stat2 or not text then return end
   local delta = stat2 - stat1
   if stat1 < stat2 then
      text = text .. gameplayUI.betterColorTag .. "(+".. delta .. ")" .. gameplayUI.whiteTag
   elseif stat1 > stat2 then
      text = text .. gameplayUI.worseColorTag .. "(".. delta .. ")" .. gameplayUI.whiteTag
   end
   return text
end

function gameplayUI:bonusTableToString( bonusTable )
   local str = ""
   if bonusTable then
      for statName, value in pairs(bonusTable) do
         local bonusLabel = miscLabels.getBonusLabel( statName )
         if value > 0 then
            bonusLabel = bonusLabel .. gameplayUI.betterColorTag .. " +" .. value
         elseif value == 0 then
            bonusLabel = bonusLabel .. " " .. value
         else
            bonusLabel = bonusLabel .. gameplayUI.worseColorTag .. " -" .. value
         end
         str = str .. "\n" .. bonusLabel .. gameplayUI.whiteTag
      end
   end
   return str
end

function gameplayUI:adjustInfoWnd( wndName )
   local font  =  self.effectInfo.title:getFont()
   local width = math.max( font:getTextExtent( self.effectInfo.title:getText() ) * 1.1, 300 )

   if ( self[wndName].stats:getText() == "" ) then
      self[wndName].wnd:setSize  ( CEGUI.USize(CEGUI.UDim(0,width), CEGUI.UDim(0,40) ) )
      self[wndName].stats:setSize( CEGUI.USize(CEGUI.UDim(0.8,0), CEGUI.UDim(0,0) ) )
   else
      self[wndName].wnd:setSize  ( CEGUI.USize(CEGUI.UDim(0,width), CEGUI.UDim(0,200) ) )
      self[wndName].stats:setSize( CEGUI.USize(CEGUI.UDim(0.8,0), CEGUI.UDim(0,160) ) )

      local fieldSize = self[wndName].stats:getSize().height.offset
      local docSize   = self[wndName].stats:getProperty( "VertExtent" )
      local extraSize = docSize - fieldSize + 30

      self[wndName].wnd:setSize  ( CEGUI.USize(CEGUI.UDim(0,width), CEGUI.UDim(0,200+extraSize) ) )
      self[wndName].stats:setSize( CEGUI.USize(CEGUI.UDim(0.8,0), CEGUI.UDim(0,160+extraSize) ) )
   end
end

function gameplayUI:setupEffectInfo( effect, effectWnd )
   if not effect then return end

   self.effectInfo.wnd:setVisible( true )
   local label = string.format( "%s (%s)", effect:getLabel(), effect:getStackCount() )
   self.effectInfo.title:setText( label )

   local bonuses = effect:getAllStatBonuses()
   local changeStats = effect.params.changeStats
   local lines = 0

   local text = ""
   if tableSize(changeStats) > 0 then
      text = text .. "Effects:"
      text = text .. gameplayUI:bonusTableToString( changeStats ) .. "\n"
      lines = lines + 1
   end

   if tableSize(bonuses) > 0 then
      if lines > 0 then text = text .. "\n" end
      text = text .. "Bonuses:"
      text = text .. gameplayUI:bonusTableToString( bonuses ) .. "\n"
      lines = lines + 1
   end

   if effect.params.duration then
      if lines > 0 then text = text .. "\n" end
      text = text .. "Duration: " .. effect.params.duration
   end

   self.effectInfo.stats:setText( text )
   self:adjustInfoWnd( "effectInfo" )

   local position = effectWnd:getPixelPosition()
   position = {x = position.x, y = position.y}
   position.y = position.y - self.effectInfo.wnd:getPixelSize().height
   position = gameplayUI:retainPositionInsideDisplay(position, self.effectInfo.wnd)

   self.effectInfo.wnd:setPosition( position )
end

function gameplayUI:setupItemInfo( item )
   if not item then return end
   self.itemInfo.wnd:setVisible( true )
   self.itemInfo.item = item

   self.itemInfo.title:setText( item:getLabel() )

   local statsCnt = 0
   local stats    = ""
   local equippedItem = getPlayer().itemsManager:getSlotItem( item:getAttireType() ) or getPlayer():getWeaponSlotItem()

   if item:getDamage() > 0 then
      local text = "Damage: " .. item:getDamage()
      if equippedItem then
         text = gameplayUI:compareStat( equippedItem:getDamage(), item:getDamage(), text )
      end
      stats = stats .. text .. "\n"
      statsCnt = statsCnt + 1
   end

   if item:getArmor() > 0 then
      local text = "Armor: " .. item:getArmor()
      if equippedItem then
         text = gameplayUI:compareStat( equippedItem:getArmor(), item:getArmor(), text )
      end
      stats = stats .. text .. "\n"
      statsCnt = statsCnt + 1
   end

   if item:getDmgPerEnergy() > 0 then
      local text = "Damage/Energy: " .. item:getDmgPerEnergy()
      if equippedItem then
         text = gameplayUI:compareStat( equippedItem:getDmgPerEnergy(), item:getDmgPerEnergy(), text )
      end
      stats = stats .. text .. "\n"
      statsCnt = statsCnt + 1
   end

   if ( item:getRestoreHealth() ~= 0 ) then
      stats = stats .. "Restores: " .. tostring(item:getRestoreHealth()) .. " health points\n"
      statsCnt = statsCnt + 1
   end

   if ( item:getRestoreFood() ~= 0 ) then
      stats = stats .. "Restores: " .. tostring(item:getRestoreFood()) .. " kcal\n"
      statsCnt = statsCnt + 1
   end

   if ( item:getRestoreWater() ~= 0 ) then
      stats = stats .. "Restores: " .. tostring(item:getRestoreWater()) .. " ml\n"
      statsCnt = statsCnt + 1
   end

   local effects = item:getUseEffects()
   if effects then
      if statsCnt > 0 then stats = stats .. "\n" end

      stats = stats .. "Effects:\n"
      for effectName, effect in pairs(effects) do
         if string.find(effectName, "Debuff") then
            stats = stats .. gameplayUI.worseColorTag .. miscLabels.getLabel( effectName ) .. gameplayUI.whiteTag
         else
            stats = stats .. gameplayUI.betterColorTag .. miscLabels.getLabel( effectName ) .. gameplayUI.whiteTag
         end
         stats = stats .. gameplayUI:bonusTableToString( effect.changeStats )
         stats = stats .. gameplayUI:bonusTableToString( effect.statBonuses )
         stats = stats .. "\nDuration: " .. effect.duration .. "\n"
      end
      statsCnt = statsCnt + 1
   end

   local permaBuffInfo = item:getPermaBuffInfo()
   if permaBuffInfo then
      stats = stats .. "\nPermanent Buffs:"
      stats = stats .. gameplayUI:bonusTableToString( permaBuffInfo ) .. "\n"
      statsCnt = statsCnt + 1
   end

   if statsCnt > 0 then stats = stats .. "\n" end

   stats = stats .. item:getDesc()

   local val = item:getValue()

   if self:isTradeVisible() and not item:isMoney() then
      if item.owner.owner == getPlayer() then
         local sellMul = getGlobalParam( "sellingPriceMultiplier" )
         local globalMul = getGlobalParam( "sellToVendorMul" )
         local personalMul = getGlobalParam( getPlayer().exchangeTarget:getName() .. "_sellToVendorMul" ) or 1
         val = math.ceil(val * sellMul * globalMul * personalMul)
      else
         local globalMul = getGlobalParam( "buyFromVendorMul" )
         local personalMul = getGlobalParam( getPlayer().exchangeTarget:getName() .. "_buyFromVendorMul" ) or 1
         val = math.ceil(val * globalMul * personalMul)
      end
   end

   if val then stats = stats .. "\n\nValue: " .. tostring(val) .. "\n" end

   self.itemInfo.stats:setText( stats )
   self:adjustInfoWnd( "itemInfo" )
end

function gameplayUI:setPosItemInfo( position )
   self.itemInfo.wnd:setPosition( position )
end

function gameplayUI:hideItemInfo()
   self.itemInfo.wnd:setVisible( false )
   self.itemInfo.item = nil
end

function gameplayUI:initAnnoyingHint()
   self.annoyingHint.wnd = wndMgr:loadLayoutFromFile( "annoyingHint.layout" )

   self.wndGameplay:addChild( self.annoyingHint.wnd )
   self.annoyingHint.contents = self.annoyingHint.wnd:getChild( "Contents" )

   self.annoyingHint.wnd:setVisible( false )
end

function gameplayUI:setupAnnoyingHint( text, hint )
   if not getGameOption("tutorial") then return end
   if #self.annoyingHint.stack == 0 then
      self.annoyingHint.wnd:setVisible( true )
      self.annoyingHint.contents:setText( text )
   end
   table.insert(self.annoyingHint.stack, { text = text, hint = hint })
end

function gameplayUI:hideAnnoyingHint( hint )
   if #self.annoyingHint.stack ~= 0 and hint == self.annoyingHint.stack[1].hint then
      self.annoyingHint.wnd:setVisible( false )
      table.remove(self.annoyingHint.stack, 1)
      if #self.annoyingHint.stack > 0 then
         self.annoyingHint.wnd:setVisible( true )
         self.annoyingHint.contents:setText( self.annoyingHint.stack[1].text )
      end
   end
end

function gameplayUI:initBillboard()
   self.billboard.wnd = wndMgr:loadLayoutFromFile( "billboard.layout" )

   self.wndGameplay:addChild( self.billboard.wnd )

   self.billboard.title = self.billboard.wnd:getChild( "Title" )
   self.billboard.contents = self.billboard.wnd:getChild( "Contents" )

   self.billboard.wnd:setVisible( false )
end

function gameplayUI:setupBillboard( title, text )
   self.billboard.wnd:setVisible( true )
   -- self.billboard.item = item


   self.billboard.title:setText( title )

   local stats    = ""

   stats = stats .. text

   if ( stats == "" ) then
      self.billboard.wnd:setSize  ( CEGUI.USize(CEGUI.UDim(0,300), CEGUI.UDim(0,40) ) )
      self.billboard.contents:setSize( CEGUI.USize(CEGUI.UDim(0.8,0), CEGUI.UDim(0,0) ) )
   else
      self.billboard.wnd:setSize  ( CEGUI.USize(CEGUI.UDim(0,300), CEGUI.UDim(0,200) ) )
      self.billboard.contents:setSize( CEGUI.USize(CEGUI.UDim(0.8,0), CEGUI.UDim(0,160) ) )

      self.billboard.contents:setText( stats )

      local fieldSize = self.billboard.contents:getSize().height.offset
      local docSize   = self.billboard.contents:getProperty( "VertExtent" )
      local extraSize = docSize - fieldSize + 30

      --log( "fieldSize: " .. tostring(fieldSize) )
      --log( "docSize: " .. tostring(docSize) )
      --log( "extraSize: " .. tostring(extraSize) )

      self.billboard.wnd:setSize  ( CEGUI.USize(CEGUI.UDim(0,300), CEGUI.UDim(0,200+extraSize) ) )
      self.billboard.contents:setSize( CEGUI.USize(CEGUI.UDim(0.8,0), CEGUI.UDim(0,160+extraSize) ) )
      self.billboard.wnd:setPosition( CEGUI.UVector2(CEGUI.UDim(0.1,0), CEGUI.UDim(0.5,-(200+extraSize) / 2) ) )
   end
end

function gameplayUI:hideBillboard()
   self.billboard.wnd:setVisible( false )
end

function gameplayUI:isBillboardVisible()
   return self.billboard.wnd:isVisible()
end

function gameplayUI:initHelpInfo()
   self.helpInfo.wnd = wndMgr:loadLayoutFromFile( "help.layout" )

   self.wndPause:addChild( self.helpInfo.wnd )

   self.helpInfo.wnd:setVisible( false )
end

function gameplayUI:updateHelpInfoInfo()
   self.helpInfo.wnd:setVisible( true )
   local text = [===[[colour='ffffffff'][font='dialog-14']Controls:[font='dialog-12'][colour='ffaaaaaa'] =
      •   [colour='ffffffff']${forward}-${left}-${back}-${right}[colour='ffaaaaaa'] - Movement controls
      •   [colour='ffffffff']${jump}[colour='ffaaaaaa'] – Jump
      •   [colour='ffffffff']${walk}[colour='ffaaaaaa'] – Hold to walk
      •   [colour='ffffffff']${sprint}[colour='ffaaaaaa'] – Hold to sprint
      •   [colour='ffffffff']${attack}[colour='ffaaaaaa'] – Attack
      •   [colour='ffffffff']${aim}[colour='ffaaaaaa'] – Aim
      •   [colour='ffffffff']${inventory}[colour='ffaaaaaa'] – Open/Close Inventory
      •   [colour='ffffffff']${reload}[colour='ffaaaaaa'] – Reload
      •   [colour='ffffffff']${holster}[colour='ffaaaaaa'] – Holster weapon
      •   [colour='ffffffff']${hotbar1}-${hotbar9}[colour='ffaaaaaa'] – Use items from hotbar
      •   [colour='ffffffff']${activate}[colour='ffaaaaaa'] – Interact (pick up items, open doors etc.)
      •   [colour='ffffffff']${hotbarq}[colour='ffaaaaaa'] – Scan surroundings for useful items
      •   [colour='ffffffff']${journal}[colour='ffaaaaaa'] - Journal
      •   [colour='ffffffff']${character}[colour='ffaaaaaa'] – Character stats
      •   [colour='ffffffff']RMB in Inventory[colour='ffaaaaaa'] – Item interact options
      •   [colour='ffffffff']RMB in Dialog[colour='ffaaaaaa'] – Skip line
      •   [colour='ffffffff']${toggleui}[colour='ffaaaaaa'] – Hide/Show UI (Useful for screenshots)
      •   [colour='ffffffff']${camview}[colour='ffaaaaaa'] – Change camera position
      •   [colour='ffffffff']${camup}[colour='ffaaaaaa'] – Higher camera
      •   [colour='ffffffff']${camdown}[colour='ffaaaaaa'] – Lower camera
      •   [colour='ffffffff']F5[colour='ffaaaaaa'] – Quicksave
      •   [colour='ffffffff']F9[colour='ffaaaaaa'] – Quickload

   [colour='ffffffff'][font='dialog-14']Tips:[font='dialog-12'][colour='ffcccccc']
      •   You can decompose cactus club to firewood (RMB -> Decompose)
      •   Use scanner implant to check your surroundings if you have trouble finding plants or containers.
      •   Click items in inventory with the Right Mouse Button ([colour='ffffffff']RMB[colour='ffcccccc']) to see what you can do with them.
      •   Drag and drop items from your inventory to the hotbar in order to get faster access to them.
      •   Watch your Endurance bar, the green one. You cannot run and your blows in melee combat are weak if it is depleted.
      •   Gather natural resources. They can be used as food, weapons or crafting materials.
      •   Food and pure water are precious. Try to cook meat and other ingredients at the campfire to improve their positive effects.
      •   Jack likes to make notes about his adventures. Read Journal ([colour='ffffffff']${journal}[colour='ffcccccc']) if you need clues about quest objectives and also want to see Jacks thoughts on other characters and the situation.
      •   You can skip time and cook while resting at the campfire. Make a campfire with firewood (right click on firewood -> install).
      •   You can remote control living bugs in your inventory (right click on a bitebug -> install).
      •   If your stamina is not regenerating and your health is constantly decreasing, than you are probably hungry or thirsty. Press ([colour='ffffffff']${character}[colour='ffcccccc']) to check your Status and eat something if needed.
]===]
   text = Template(text):safe_substitute(function(val)
      return getButtonCurrentKeyName(val:upper())
   end)

   self.helpInfo.wnd:getChild( "Text" ):setText( text )
end

function gameplayUI:setHelpInfoVisible( state )
   if state then
      self:updateHelpInfoInfo()
   end
   self.helpInfo.wnd:setVisible( state )
end

function gameplayUI:isHelpInfoVisible()
   return self.helpInfo.wnd:isVisible()
end

function cbItemInfoMouseMove( args )
   local click_args = CEGUI.toMouseEventArgs( args )

   if ( gameplayUI.itemInfo.item ) then
      local wndSize = gameplayUI.itemInfo.wnd:getSize()

      local xoff = click_args.position.x - wndSize.width.offset - 10
      local yoff = click_args.position.y - wndSize.height.offset/2
      local position = CEGUI.UVector2(CEGUI.UDim(0,xoff), CEGUI.UDim(0,yoff))

      if position.x.offset < 0 then
         position.x = CEGUI.UDim( 0, xoff + wndSize.width.offset + 20 )
      end
      position = gameplayUI:retainPositionInsideDisplay(position, gameplayUI.itemInfo.wnd)

      gameplayUI:setPosItemInfo( position )
   end
end

function cbEffectMouseIn( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   local effect = getPlayer().statusEffectsManager:getEffectByID( click_args.window:getUserString("effectID") )
   gameplayUI:setupEffectInfo( effect, click_args.window )
end

function cbEffectMouseOut( args )
   if not CEGUI then return end
   gameplayUI.effectInfo.wnd:setVisible( false )
end

function cbItemInfoMouseHover( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   local inventoryName = click_args.window:getUserString("inventoryName"):gsub("^%u", string.lower)
   local inventory = gameplayUI[inventoryName]

   if not inventory then inventory = gameplayUI.trade[inventoryName] end

   local slotID = tonumber( click_args.window:getUserString("slotID") )

   if not inventory.slots[slotID].item then return end

   gameplayUI:setupItemInfo( inventory.slots[slotID].item )
   cbItemInfoMouseMove( args )
   click_args.window:getChild("ItemImage/Selected"):setVisible( true )
end

function cbItemInfoMouseLeave( args )
   if not CEGUI then return end
   local click_args = CEGUI.toMouseEventArgs( args )

   click_args.window:getChild("ItemImage/Selected"):setVisible( false )
   gameplayUI:hideItemInfo()
end

function gameplayUI:setAmmoCount( cnt )
   self.ammoCount:setText( tostring(cnt) )
   self.ammoCount:setVisible( cnt ~= -1 )

   self.ammoCountShadow:setText( tostring(cnt) )
   self.ammoCountShadow:setVisible( cnt ~= -1 )
end

function gameplayUI:setItemIcon( name )
   if ( name ) then
      self.itemIcon:setProperty( "Image", "gameplay/" .. name )
      self.itemIcon:setVisible ( name ~= "" )
   end
end

function gameplayUI:setCoordsText( text )
   if ( self.dialog.wnd:isVisible() ) then
      return
   end

   self.coords:setVisible( true )
   self.coords:setText( text )
   self.coords:setPosition( self.coords:getPosition() )
end

function gameplayUI:updateCoords()
   local player = getPlayer()

   if ( player ) then
      local pos  = player:getPose():getPos()
      local text = "coords  x:" .. math.floor(pos.x * 0.01) .. "  y:" .. math.floor(pos.y * 0.01) .. "  z:" .. math.floor(pos.z * 0.01)

      self:setCoordsText( text )
   end
end

function gameplayUI:showEnemyCursor( state )
   if state then
      self.aim.wnd:setProperty("Image", "gameplay/CursorRed")
   else
      self.aim.wnd:setProperty("Image", "gameplay/Cursor")
   end
end

function gameplayUI:setFocusObj(obj)
   local curObj = self.focus.currentObj
   if curObj == obj then
      return
   end
   if curObj and curObj.OnFocusEnd then
      curObj:OnFocusEnd(getPlayer())
   end
   self.focus.currentObj = obj
   self.focus.interactLabelTime = getGameTime()
   self.focus.interactLabel:setVisible(false)
   if obj and obj.OnFocusBegin then
      obj:OnFocusBegin(getPlayer())
   end
   if not self.focus.updateTimer then
      self.focus.updateTimer = runTimer(0, self, function(self)
         local lbl = self.focus.label
         local intlbl = self.focus.interactLabel
         local obj = self.focus.currentObj
         if obj then
            if obj.getLabel then
               local txt = obj:getLabel()
               lbl:setText(txt)
            end
            local headPose, pos
            if obj.getBonePose then
               headPose = obj:getBonePose("head") or obj:getBonePose("head_slot") or obj:findBonePose("Head")
            end
            if not headPose then
               headPose = obj:getPose()
               pos = headPose:getPos()
               pos.y = pos.y + 100
            else
               pos = headPose:getPos()
               pos.y = pos.y + 25
            end
            if obj.getLabelPos then
               pos = obj:getLabelPos()
            end
            local p = projectPointToScreen(pos)
            p.y = 1 - p.y
            local x, y = p.x, p.y
            x = math.min(math.max(0.02, x), 0.98)
            y = math.min(math.max(0.01, y), 0.97)
            lbl:setVisible(true)
            lbl:setPosition(CEGUI.UVector2(CEGUI.UDim(x - 0.5, 0), CEGUI.UDim(y, 0)))

            if getGameTime() - self.focus.interactLabelTime >= 4 and obj.getInteractLabel and not obj.OnDie then
               local label = obj:getInteractLabel()
               if label then
                  intlbl:setVisible(true)
                  intlbl:setPosition(CEGUI.UVector2(CEGUI.UDim(x - 0.5, 0), CEGUI.UDim(y, lbl:getFont():getFontHeight())))
                  intlbl:setText( "'E' to " .. label )
               end
            end

         else
            self.focus.updateTimer:stop()
            self.focus.updateTimer = nil
            lbl:setVisible(false)
         end
      end, true)
   end
end

function gameplayUI:getFocusObj()
   return self.focus.currentObj
end

function gameplayUI:setEnemyHealth( char )
   local bar = self.enemyStatus.health.wnd:getChild("Health")
   local size = bar:getSize()
   size.width.scale = char:getStatPercent( "health" ) / 100

   bar:setSize( size )
end

function gameplayUI:setEnemyShield( char )
   local bar = self.enemyStatus.shield.wnd:getChild("Shield")
   local size = bar:getSize()
   size.width.scale = char:getStatPercent( "energy" ) / 100

   bar:setSize( size )
end

function gameplayUI:updateEnemyLabelPos(pose)
   local font = self.enemyLabel:getFont()
   local width = font:getTextExtent(self.enemyLabel:getText())
   local x, y = 0.5, 0.05

   if pose then
      local point = projectPointToScreen(pose:getPos())
      x, y = point.x, 1 - point.y
   end
   self.enemyLabel:setXPosition( CEGUI.UDim(x, -width * 0.5) )
   self.enemyLabel:setYPosition( CEGUI.UDim(y, 0) )
   self.enemyLabel:setWidth(     CEGUI.UDim(0.0, width       ) )
end

function gameplayUI:showEnemyStatus( char )
   self.enemyStatus.wnd:setVisible(true)
   self.enemyStatus.char = char

   self.enemyStatus.label.wnd:setText( char:getLabel() )

   gameplayUI:setEnemyHealth( char )

   if char:hasShield() then
      gameplayUI:setEnemyShield( char )
      self.enemyStatus.shield.wnd:setVisible(true)
   else
      self.enemyStatus.shield.wnd:setVisible(false)
   end

   if self.enemyStatus.timer then
      self.enemyStatus.timer:stop()
      self.enemyStatus.timer = nil
   end

   self.enemyStatus.timer = runTimer(5, nil, function()
      self.enemyStatus.char = nil
      self.enemyLabel:setVisible(false)
      self.enemyStatus.wnd:setVisible(false)
      if self.enemyStatus.timerUpdatePos then
         self.enemyStatus.timerUpdatePos:stop()
         self.enemyStatus.timerUpdatePos = nil
      end
   end, false)
end

function gameplayUI:showInventory( state )
   self.inventory.wnd:setVisible( state )

   if ( state ) then
      self:resetCursorPos()
      self:showCursor()
      self.inventory.wnd:activate()
   else
      self.popupMenu.wnd:hide()
      self:showInventory2( false )
      self:showCraft( false )
   end

   setUserControl( not state )
end

function gameplayUI:isInventoryVisible()
   return self.inventory.wnd:isVisible()
end

function gameplayUI:setupInventory( items )
   if ( not items ) then
      return
   end

   local filterTable = self.inventory.filters[self.inventory.currentTab]

   clearInventory( self.inventory )

   local sortedIterator = tablex.sortv(items, sortInventory)
   local index = 0
   for _,item in sortedIterator do
      if not filterTable or inList( filterTable, item:getInvCategory() ) then
         index = index + 1
         self:setupInventoryItem( index, item )
      end
   end

   -- money show
   local shardsCount = 0
   local moneyItem = getPlayer():getInventory():getItemByName("antigravium_shards.itm")
   if moneyItem then shardsCount = moneyItem.count end

   self.inventory.wnd:getChild( "ShardsCount" ):setText( tostring(shardsCount) )

   -- alive items count
   local aliveItemsCount = 0
   for i=1,#self.inventory.slots do
      local item = self.inventory.slots[i].item
      if ( item and ItemsData.isItemAlive(item.name) ) then
         aliveItemsCount = aliveItemsCount + item.count
      end
   end

   self.inventory.wnd:getChild( "BugAliveCount" ):setText( tostring(aliveItemsCount) .. "-" .. "3" )
   local length = math.ceil(index/5) * 64
   self.inventory.wnd:getChild("Cells"):setProperty("ContentArea", "l:0 t:0 r:320 b:" .. length)
end

function gameplayUI:setupInventoryItem( slotIndex, item )
   self.inventory.slots[slotIndex].slot:setProperty   ( "DraggingEnabled", "true" )
   self.inventory.slots[slotIndex].slot:setUserString ( "itemID", tostring(item.id) )
   self.inventory.slots[slotIndex].image:setProperty  ( "Image", "gameplay/" .. item.icon )
   self.inventory.slots[slotIndex].item = item
   if ( item.count > 1 ) then
      self.inventory.slots[slotIndex].counter:setText( tostring(item.count) )
   else
      self.inventory.slots[slotIndex].counter:setText( "" )
   end

   if (item:isAttire() and item.equipped) or (item:isAccessory() and item.equipped) or (getPlayer().lastWeapon == item) then
      self.inventory.slots[slotIndex].equipped:setVisible( true )
   end
end

function gameplayUI:showInventory2( state )
   self.inventory2.wnd:setVisible( state )

   if ( state ) then
      self:resetCursorPos()
      self:showCursor()
   end

   setUserControl( not state )
end

function gameplayUI:isInventory2Visible()
   return self.inventory2.wnd:isVisible()
end

function gameplayUI:setupInventoryTitle2( title )
   local font = "[font='decor-8']"
   self.inventory2.wnd:setText( font .. title )
end

function gameplayUI:setupInventory2( items )
   if ( not items ) then
      return
   end

   clearInventory( self.inventory2 )

   local slotIndex = 1

   for _,item in pairs(items) do
      if slotIndex > #self.inventory2.slots then
         break
      end
      self.inventory2.slots[slotIndex].slot:setProperty ( "DraggingEnabled", "true" )
      self.inventory2.slots[slotIndex].image:setProperty( "Image", "gameplay/" .. item.icon )
      self.inventory2.slots[slotIndex].slot:setUserString( "itemID", tostring(item.id) )
      self.inventory2.slots[slotIndex].item = item
      if ( item.count > 1 ) then
         self.inventory2.slots[slotIndex].counter:setText( tostring(item.count) )
      else
         self.inventory2.slots[slotIndex].counter:setText( "" )
      end

      slotIndex = slotIndex + 1
   end
end

function gameplayUI:isInventoryTurretVisible()
   return self.inventoryTurret.wnd:isVisible()
end

function gameplayUI:showInventoryTurret( state )
   self.inventoryTurret.wnd:setVisible( state )

   if ( state ) then
      self:showCursor()
   end

   setUserControl( not state )
end

function gameplayUI:setupInventoryTurret( items )
   if ( not items ) then
      return
   end

   clearInventory( self.inventoryTurret )

   local slotIndex = 1

   for _,item in pairs(items) do
      if slotIndex > #self.inventoryTurret.slots then
         break
      end
      self.inventoryTurret.slots[slotIndex].slot:setProperty ( "DraggingEnabled", "true" )
      self.inventoryTurret.slots[slotIndex].image:setProperty( "Image", "gameplay/" .. item.icon )
      self.inventoryTurret.slots[slotIndex].slot:setUserString( "itemID", tostring(item.id) )
      self.inventoryTurret.slots[slotIndex].item = item
      if ( item.count > 1 ) then
         self.inventoryTurret.slots[slotIndex].counter:setText( tostring(item.count) )
      else
         self.inventoryTurret.slots[slotIndex].counter:setText( "" )
      end

      slotIndex = slotIndex + 1
   end
end

function gameplayUI:initHotbar()
   self.hotbar.wnd = self.wndGameplay:getChild( "Hotbar" )

   for i=1,10 do
      addHotbarSlot( i, i )
   end

   local customPos = CEGUI.UVector2(CEGUI.UDim(0,5), CEGUI.UDim(0,0) )
   self.QHotbarSlot = addHotbarSlot( 11, "Q", customPos )

   self:clearHotbar()
end

function addHotbarSlot( index, suffix, customPos )
   if suffix == 10 then
      suffix = 0
   end
   local exSlot = gameplayUI.hotbar.wnd:getChild("Slot1")
   local slot
   local slotIdWnd
   if not exSlot then
      slot = wndMgr:loadLayoutFromFile( "inventory_slot.layout" )
      gameplayUI.hotbar.wnd:addChild( slot )
      slotIdWnd = slot:createChild( "TaharezLook/StaticText", "SlotID")
      slotIdWnd:setProperty( "Area", "{{1, -15}, {0, 3}, {1, 0}, {0, 15}}" )
      slotIdWnd:setProperty( "Font", "venus rising rg-5" )
      slotIdWnd:setProperty( "FrameEnabled", "false" )
      slotIdWnd:setProperty( "BackgroundEnabled", "false" )
      slotIdWnd:setProperty( "MousePassThroughEnabled", "true" )
      slotIdWnd:setProperty( "AlwaysOnTop", "true" )
      slotIdWnd:setProperty( "HorzFormatting", "Right" )
   else
      slot = exSlot:clone( true )
      slot:setName( "Slot" .. suffix )
      gameplayUI.hotbar.wnd:addChild( slot )
      slotIdWnd = slot:getChild( "SlotID" )
   end

   local pos = customPos or CEGUI.UVector2(CEGUI.UDim(0,55*(index) + 10), CEGUI.UDim(1,-55) )
   slot:setPosition( pos )
   slot:setSize    ( CEGUI.USize   (CEGUI.UDim(0,55), CEGUI.UDim(0,55) ) )


   slotIdWnd:setText( tostring(suffix) )

   local newSlot = {}
   newSlot.slot       = slot:getChild("DragContainer")
   newSlot.image      = slot:getChild("DragContainer/ItemImage")
   newSlot.equipped   = slot:getChild("DragContainer/ItemImage/Equipped")
   newSlot.selected   = slot:getChild("DragContainer/ItemImage/Selected")
   newSlot.counter    = slot:getChild("DragContainer/ItemImage/Counter")

   newSlot.slot:subscribeEvent( "DragDropItemDropped", cbDragAndDropHotbar )
   newSlot.slot:subscribeEvent( "MouseClick",          cbHotbarSlotClick )

   newSlot.slot:setUserString( "inventoryName", "Hotbar" )
   newSlot.slot:setUserString( "slotID", tostring(index) )

   gameplayUI.hotbar.slots[index] = newSlot
   return newSlot
end

function gameplayUI:clearHotbar()
   for i=1,#self.hotbar.slots do
      self:clearHotbarSlot( i )
   end
end

function gameplayUI:clearHotbarSlot( index )
   local hotbarSlot = self.hotbar.slots[index]
   hotbarSlot.slot:setUserString( "itemID", "" )
   hotbarSlot.slot:setProperty( "DraggingEnabled", "false" )
   hotbarSlot.image:setProperty( "Image", "" )
   hotbarSlot.counter:setText( "" )
end

function gameplayUI:setItemToHotbar( index, item )
   local hotbarSlot = self.hotbar.slots[index]
   if not hotbarSlot then return end
   if item then
      hotbarSlot.slot:setUserString( "itemID", tostring(item.id) )
      hotbarSlot.slot:setProperty( "DraggingEnabled", "true" )
      hotbarSlot.image:setProperty( "Image", "gameplay/" .. item.icon )
      local count = ""
      if item.count > 1 then count = tostring(item.count) end
      hotbarSlot.counter:setText( count )
   else
      gameplayUI:clearHotbarSlot( index )
   end
end

function gameplayUI:updateAllHotbarItems()
   for i=1,#self.hotbar.slots do
      gameplayUI:updateHotbarItemByIndex( i )
   end
end

function gameplayUI:updateHotbarItemByIndex( index )
   self:updateHotbarSlot( self.hotbar.slots[index] )
end

function gameplayUI:updateHotbarSlot( hotbarSlot )
   if not hotbarSlot then return end
   local slotID = self:getHotbarWndIndex( hotbarSlot.slot )
   local item = self:getHotbarItemInSlot( slotID )
   self:setItemToHotbar( slotID, item )
end

function gameplayUI:getHotbarItemInSlot( index )
   return getDefaultPlayer().itemsManager:getItemById( self:getHotbarItemIdInSlot( index ) )
end

function gameplayUI:getHotbarItemIdInSlot( index )
   return tonumber( self.hotbar.slots[index].slot:getUserString( "itemID" ) )
end

function gameplayUI:getHotbarWndIndex( wnd )
   return tonumber( wnd:getUserString( "slotID" ) )
end

function gameplayUI:setHotbarVisible( state )
   self.hotbar.wnd:setVisible( state )
   self.QHotbarSlot.slot:setVisible( state )
end

local function addCraftItem( itemName, recipe, count, recipeItemWnd )
   local item = ItemsData.ItemsInfo[itemName]
   local label = item.label.eng
   local wndIndex = #gameplayUI.craft.items
   local wndName = "Item" .. wndIndex
   local yoffsetMul = 0
   local xoffset = 0
   if recipe then
      yoffsetMul = #gameplayUI.craft.items
   else
      wndName = "Component" .. #gameplayUI.craft.components
      local strIndex = string.gsub(recipeItemWnd:getName(), "Item", "")
      yoffsetMul = 1 + tonumber( strIndex ) + #recipeItemWnd.components
      xoffset = 80
   end

   local window = gameplayUI.craft.recipesPane:createChild( "TaharezLook/StaticImage", wndName )
   window:setProperty( "FrameEnabled",            "false" )
   window:setProperty( "BackgroundEnabled",       "false" )
   window:setProperty( "MousePassThroughEnabled", "false" )
   window:setProperty( "MouseInputPropagationEnabled", "true" )
   window:setPosition( CEGUI.UVector2(CEGUI.UDim(0.0,0 + xoffset), CEGUI.UDim(0.0,66.0*(yoffsetMul)) ) )
   window:setSize    ( CEGUI.USize   (CEGUI.UDim(0.0,314), CEGUI.UDim(0.0,64.0) ) )

   local image = window:createChild( "TaharezLook/StaticImage", "Image" )
   image:setProperty( "Image", "gameplay/" .. item.icon )
   image:setProperty( "FrameEnabled",            "false" )
   image:setProperty( "BackgroundEnabled",       "false" )
   image:setProperty( "MousePassThroughEnabled", "true" )
   image:setPosition( CEGUI.UVector2(CEGUI.UDim(0.0,0), CEGUI.UDim(0.0,0) ) )
   image:setSize    ( CEGUI.USize   (CEGUI.UDim(0.0,64.0), CEGUI.UDim(0.0,64.0) ) )

   local counter = image:createChild( "TaharezLook/StaticText", "Counter" )
   counter:setProperty( "Text", "1" )
   counter:setProperty( "FrameEnabled",            "false" )
   counter:setProperty( "BackgroundEnabled",       "false" )
   counter:setProperty( "MousePassThroughEnabled", "true" )
   counter:setProperty( "Font", "venus rising rg-5" )
   counter:setPosition( CEGUI.UVector2(CEGUI.UDim(0.1,0), CEGUI.UDim(0.75,0) ) )
   counter:setSize    ( CEGUI.USize   (CEGUI.UDim(0.9,0), CEGUI.UDim(0.25,0) ) )

   local text = window:createChild( "TaharezLook/StaticText", "Text" )
   text:setProperty( "Text", label )
   text:setProperty( "Font", "dialog-10" )
   text:setProperty( "FrameEnabled",            "false" )
   text:setProperty( "BackgroundEnabled",       "false" )
   text:setProperty( "MousePassThroughEnabled", "true" )
   text:setPosition( CEGUI.UVector2(CEGUI.UDim(0.0,80), CEGUI.UDim(0.0,0) ) )
   text:setSize    ( CEGUI.USize   (CEGUI.UDim(0,250), CEGUI.UDim(0.0,64) ) )

   if recipe then
      window:subscribeEvent( "MouseClick", cbCraftClick )
      window:subscribeEvent( "MouseEntersArea", cbCraftOver )
      window:subscribeEvent( "MouseLeavesArea", cbCraftOut )
      window.itemName = itemName
      window.recipe = recipe
      window.components = {}
      table.insert( gameplayUI.craft.items, window )
   else
      window.itemName = itemName
      window.count = count
      window.recipeWnd = recipeItemWnd
      table.insert( gameplayUI.craft.components, window )
      table.insert( recipeItemWnd.components, window )
      window:setVisible(false)
   end
   return window
end

function gameplayUI:initCraft()
   self.craft.wnd = wndMgr:loadLayoutFromFile( "craft.layout" )

   self.wndGameplay:addChild( self.craft.wnd )

   self.craft.wnd:getChild("__auto_closebutton__"):subscribeEvent("MouseClick", cbCloseCraft)
   self.craft.wnd:getChild("RecipesPane"):subscribeEvent("MouseWheel", cbWindowScrollWheel)

   self.craft.wnd:setVisible( false )

   self:initCraftRecipes()
end

function gameplayUI:initCraftRecipes()
   self.craft.recipesPane = self.craft.wnd:getChild( "RecipesPane" )

   for i=1,#ItemsData.ItemsCompose do
      local componentTable = ItemsData.ItemsCompose[i].recipe
      local recipeName = ItemsData.ItemsCompose[i].item
      local wnd = addCraftItem( recipeName, componentTable, nil )
      for itemName, neededCount in pairs(componentTable) do
         addCraftItem( itemName, nil, neededCount, wnd )
      end
   end
end

function gameplayUI:showCraft( state )
   self.craft.wnd:setVisible( state )
   if state then
      self:setupCraft()
   else
      self:hideItemDelimiter()
   end
end

function gameplayUI:setupCraft()
   for i=1,#gameplayUI.craft.items do
      gameplayUI.craft.items[i]:getChild("Text"):setProperty("TextColours", "FF1ece53")
   end

   for i=1,#gameplayUI.craft.components do
      local componentWnd = gameplayUI.craft.components[i]
      componentWnd:getChild("Text"):setProperty("TextColours", "FFce1124")
      local counter = componentWnd:getChild("Image/Counter")
      counter:setProperty("TextColours", "FFce1124")
      local hasItem = getPlayer():getInventory():getItemByName( componentWnd.itemName )
      if hasItem then
         if hasItem.count >= componentWnd.count then
            counter:setProperty("TextColours", "FF1ece53")
            componentWnd:getChild("Text"):setProperty("TextColours", "FF1ece53")
         else
            componentWnd.recipeWnd:getChild("Text"):setProperty("TextColours", "FFce1124")
         end
         counter:setText( hasItem.count .. "/" .. componentWnd.count )
      else
         componentWnd.recipeWnd:getChild("Text"):setProperty("TextColours", "FFce1124")
         counter:setText( "0/" .. componentWnd.count  )
      end
   end
end

function gameplayUI:isCraftVisible()
   return self.craft.wnd:isVisible()
end

function gameplayUI:OnCraft( item, wantCount )
   local pInventory = getPlayer():getInventory()
   local canCount = wantCount
   --Taking into account the bugs that will be converted and destroyed during crafting
   if ItemsData.isItemAlive(item.name) and wantCount + pInventory.aliveItemsCount > pInventory.aliveItemsMax then
      canCount = 0
      for i=1, wantCount do
         for itemName, needCount in pairs(self.craft.clickedRecipe) do
            if ItemsData.isItemAlive(itemName) then
               for i=1, needCount do
                  canCount = math.min(pInventory.aliveItemsMax, canCount + 1 )
               end
            end
         end
      end
   end
   if canCount > 0 then
      for i=1, canCount do
         for itemName, needCount in pairs(self.craft.clickedRecipe) do
            for i=1, needCount do
               pInventory:destroyItemByName( itemName )
            end
         end
      end

      local craftedItem = pInventory:addItem( item.name )
      craftedItem.count = craftedItem.count + (canCount - 1)
      pInventory:updateInventoryUI()
      gameplayUI:showInventoryPickInfo( canCount .. " " .. craftedItem:getLabel() .. " was added to inventory" )
   else
      gameplayUI:showInventoryPickInfo( "Too many bugs in inventory" )
   end
end

function gameplayUI:setupPopupMenu( list )
   self.popupMenu.wnd:resetList()

   local itemIndex = 0

   for i=1,#list do
      if ( itemIndex == #self.popupMenu.slots ) then
         self:addPopupMenuItem()
      end

      self.popupMenu.slots[itemIndex+1]:setText( list[i] )
      self.popupMenu.wnd:addItem( self.popupMenu.slots[itemIndex+1] )

      itemIndex = itemIndex + 1
   end

   if itemIndex > 0 then
      self.popupMenu.wnd:setVisible( true )
   else
      self.popupMenu.wnd:setVisible( false )
   end
end

function gameplayUI:addPopupMenuItem()
   local item = CEGUI.toMenuItem( self.popupMenu.wnd:createChild( "TaharezLook/MenuItem", "Item" .. tostring(#self.popupMenu.slots) ) )

   item:setProperty( "DestroyedByParent", "false" )
   item:setProperty( "Font", "venus rising rg-5" )

   item:subscribeEvent( "MouseButtonUp", cbPopupMenuClick )

   self.popupMenu.slots[#self.popupMenu.slots+1] = item
end

function gameplayUI:setDialogText( replyTable, textOld )
   if ( replyTable ) then
      self:resetCursorPos()
      self:showCursor()
      setUserControl( false )

      self.dialog.wnd:setVisible( true )
      self:showTradeButton( false )
      self:clearReplies()
      self:setupReplies( replyTable )

      self.dialog.textOld:setProperty( "Text", textOld )
      runTimer(0, nil, function()
        self.dialog.textOld:setProperty( "VertScrollPosition", tostring(self.dialog.textOld:getProperty("VertExtent")) )
      end, false)
   else
      self.dialog.wnd:setVisible( false )
      self.dialog.textOld:setProperty( "Text", "" )

      runTimer(0, self, function(self)
         if self:isTradeVisible() == false then
            gameplayUI:hideCursor()
            setUserControl( true )
         end
      end, false)
   end
end

function gameplayUI:setupReplies( t )
   self.dialog.wnd:getChild("BottomLine/Actor"):setText("[colour='FF999999']"..t.actor..":")
   for i=1,#t do
      if string.find( t[i], "%[TRADE%]" ) then
         table.remove(t, i)
         self:showTradeButton( true )
         break
      end
   end
   for i=1,#t do
      if #t > 1 or #t == 1 and self:isDialogTradeButtonVisible() then
         local text = t[i]
         local colorTag = string.match( text, "%[colour=.-%]" )
         if colorTag then
            text = string.sub( text, string.find(text,"%]")+1 )
            colorTag = string.match( colorTag, "%a+%d+" )
         else
            colorTag = "FF4499EE"
         end
         local nodeID = string.match( text, "%{.-%}" )
         if nodeID then
            text = "[colour='FF999999']" .. nodeID .. "[colour='FFFFFFFF']" .. text:gsub("%{.-%}", "")
         end
         text = i..". "..text
         local reply = self:setupReplyText( i, text )
         reply:setProperty( "TextColours", colorTag )
         reply:subscribeEvent( "MouseClick", cbDialogReplyClicked )
         reply:subscribeEvent( "MouseEntersArea", cbDialogMouseOver )
         reply.mouseLeavesArea = reply:subscribeEvent( "MouseLeavesArea", cbDialogMouseOut )
         reply:subscribeEvent( "MouseWheel", cbDialogWheel )
         reply.index = i
      else
         local text = t[i]
         local nodeID = string.match( text, "%{.-%}" )
         if nodeID then
            text = "[colour='FF999999']" .. nodeID .. "[colour='FFFFFFFF']" .. text:gsub("%{.-%}", "")
         end
         self:setupReplyText( i, text )
      end
   end
end

function gameplayUI:showTradeButton( state )
   self.dialog.bottom.tradeButton:setVisible( state )
end

function gameplayUI:isDialogTradeButtonVisible()
   return self.dialog.bottom.tradeButton:isVisible()
end

function cbDialogMouseOver( args )
   local me_args = CEGUI.toMouseEventArgs( args )
   if me_args.window then
      me_args.window.backupColor = me_args.window:getProperty( "TextColours" )
      me_args.window:setProperty( "TextColours", "FFFFFFFF" )
   end
end

function cbDialogMouseOut( args )
   if CEGUI then
      local me_args = CEGUI.toMouseEventArgs( args )
      if me_args.window then
         me_args.window:setProperty( "TextColours", me_args.window.backupColor )
      end
   end
end

function cbDialogReplyClicked( args )
   local me_args = CEGUI.toMouseEventArgs( args )
   if me_args.button == CEGUI.LeftButton then
      dialogSystem:selectAnswer( args.window.index )
   end
end

function cbDialogWheel( args )
   local wheel_args = CEGUI.toMouseEventArgs( args )
   local scroll_pos = gameplayUI.dialog.bottom.replies.wnd:getProperty("VertScrollPosition")
   if wheel_args.wheelChange > 0 then
      scroll_pos = scroll_pos - 0.5
   else
      scroll_pos = scroll_pos + 0.5
   end
   scroll_pos = math.max(0, math.min(1.0, scroll_pos))
   gameplayUI.dialog.bottom.replies.wnd:setProperty("VertScrollPosition", scroll_pos)
end

function cbDialogTradeClick( args )
   local me_args = CEGUI.toMouseEventArgs( args )
   if me_args.button == CEGUI.LeftButton then
      for i,msg in pairs(dialogSystem.active_dialog.active_message.messages) do
         if string.find( msg.text, "%[TRADE%]" ) then
            dialogSystem:selectAnswer( "tradeMsg" )
            break
         end
      end
   end
end

function gameplayUI:setupReplyText( index, text )
   local reply = self.dialog.bottom.replies.wnd:createChild( "TaharezLook/StaticText", "Reply" .. index )
   reply:setProperty( "Text", text )
   reply:setProperty( "FrameEnabled",            "false" )
   reply:setProperty( "BackgroundEnabled",       "false" )
   reply:setProperty( "MousePassThroughEnabled", "false" )
   reply:setProperty( "Font", "dialog-12" )
   reply:setProperty( "MaxSize", "{{0.85,0},{1,0}}")
   reply:setProperty( "HorzFormatting", "WordWrapLeftAligned" )

   local font  = reply:getFont()
   local width = font:getTextExtent( reply:getText() )
   reply:setWidth( CEGUI.UDim(0,width) )

   local height = font:getFontHeight()
   local lines = math.ceil(width/reply:getPixelSize().width)

   reply:setHeight( CEGUI.UDim(0,height*lines) )
   reply:setPosition( CEGUI.UVector2(CEGUI.UDim(0,0), CEGUI.UDim(0, 0 + height * self.dialog.bottom.linesTaken)) )

   self.dialog.bottom.linesTaken = self.dialog.bottom.linesTaken + lines
   self.dialog.bottom.replies.entries[#self.dialog.bottom.replies.entries+1] = reply
   return reply
end

function gameplayUI:clearReplies()
   for _,v in pairs(self.dialog.bottom.replies.entries) do
      if v.mouseLeavesArea then
         v.mouseLeavesArea:disconnect() --Otherwise it throws an exception if you destroy an object with mouse still on it
      end
      wndMgr:destroyWindow( v )
   end
   self.dialog.bottom.replies.entries = {}
   self.dialog.bottom.linesTaken = 0
end

function gameplayUI:showDialogSkipHint()
   local hint = self.dialog.wnd:getChild("BottomLine/Label")
   hint:setVisible(true)
end

function gameplayUI:hideDialogSkipHint()
   local hint = self.dialog.wnd:getChild("BottomLine/Label")
   hint:setVisible(false)
end

function gameplayUI:isDialogVisible()
   return self.dialog.wnd:isVisible()
end

function gameplayUI:initCombLock()
   self.combLock.wnd = wndMgr:loadLayoutFromFile( "gameplay/combLock.layout" )
   self.wndGameplay:addChild( self.combLock.wnd )
   self.combLock.wnd:setVisible( false )
   self.combLock.inputWnd = self.combLock.wnd:getChild( "Tab/Input" )
   self.combLock.wnd:getChild( "Apply" ):subscribeEvent( "MouseClick", cbCombLockApply )
   self.combLock.wnd:getChild( "Cancel" ):subscribeEvent( "MouseClick", cbCombLockCancel )
   for i=0,9 do
      self.combLock.wnd:getChild( "Tab/"..i ):subscribeEvent( "MouseClick", cbCombLockButtonClick )
   end
   self.combLock.wnd:getChild( "Tab/Backspace" ):subscribeEvent( "MouseClick", cbCombLockBackspace )
end

function gameplayUI:showCombLock( state )
   self.combLock.wnd:setVisible( state )
   setUserControl( not state )

   if state then
      self.combLock.inputWnd:setText( "" )
      self:resetCursorPos()
      self:showCursor()
   end
end

function cbCombLockBackspace( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   if ( click_args.button == CEGUI.LeftButton ) then
      local str = gameplayUI.combLock.inputWnd:getText()
      gameplayUI.combLock.inputWnd:setText(string.sub(str,1,str:len()-1))
   end
end

function cbCombLockButtonClick( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   if ( click_args.button == CEGUI.LeftButton ) then
      local str = gameplayUI.combLock.inputWnd:getText()
      gameplayUI.combLock.inputWnd:setText(str .. click_args.window:getText())
   end
end

function cbCombLockApply( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   if ( click_args.button == CEGUI.LeftButton ) then
      getPlayer().dialogTarget:tryCode( gameplayUI.combLock.inputWnd:getText() )
   end
end

function cbCombLockCancel( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   if ( click_args.button == CEGUI.LeftButton ) then
      getPlayer():stopTalk( getPlayer().dialogTarget )
      gameplayUI:showCombLock( false )
   end
end

function gameplayUI:isCombLockVisible()
   return self.combLock.wnd:isVisible()
end

function gameplayUI:initSubtitles()
   self.subtitles.wnd = wndMgr:loadLayoutFromFile( "gameplay/subtitles.layout" )
   self.subtitles.wnd:setVisible( false )
   self.wndGameplay:addChild( self.subtitles.wnd )
end

function gameplayUI:addSubtitle( text, duration, obj, forced )
   if not text or not duration then return end

   local task = { text = text, duration = duration }
   if obj then
      task.text = obj:getLabel() .. ": " .. text
   end
   for _, taskTable in pairs(self.subtitles.taskList) do
      if taskTable.text == task.text then
         return --Do not stack similar subs
      end
   end
   if forced then
      self.subtitles.taskList = {}
      self.subtitles.wnd:setVisible( false )
   end

   table.insert(self.subtitles.taskList, task)
   if not self.subtitles.wnd:isVisible() then
      self:showSub()
   end
end

function gameplayUI:showSub()
   self.subtitles.wnd:setVisible( true )

   local textChild = self.subtitles.wnd:getChild("Text")
   textChild:setText( self.subtitles.taskList[1].text )

   local font  = textChild:getFont()
   local width = font:getTextExtent( textChild:getText() )
   self.subtitles.wnd:setWidth( CEGUI.UDim(0,width + 4) )

   local height = font:getFontHeight()
   local lines = math.ceil(width/textChild:getPixelSize().width)

   local pos = self.subtitles.wnd:getPosition()
   pos.y = pos.y - CEGUI.UDim(0, height*(lines - 1))
   self.subtitles.wnd:setPosition(pos)

   self.subtitles.wnd:setHeight( CEGUI.UDim(0,height*lines) )

   runTimer( self.subtitles.taskList[1].duration, self, function(self) self:hideSub() end, false )
end

function gameplayUI:hideSub()
   self.subtitles.wnd:setProperty("Area", "{{0, 0}, {0.85, 0}, {0.5, 0}, {0.85, 30}}")
   table.remove(self.subtitles.taskList, 1)
   if #self.subtitles.taskList > 0 then
      self:showSub()
   else
      self.subtitles.wnd:setVisible( false )
   end
end

function gameplayUI:resetCursorPos()
   if not guiContext:getMouseCursor():isVisible() then
      resetCursorPos()
   end
end

function gameplayUI:closeUI()
   if gameplayUI:isWaitingVisible() then
      if getPlayer():getState("sleepAtBed") then
         getPlayer().interactTarget:deactivate( getPlayer() )
      else
         gameplayUI:hideWaiting()
      end
   end
   if getPlayer() then
      getPlayer():OnInventoryClose()
   end
   if terminalUI.activeTerminal then
      terminalUI.activeTerminal:deactivate()
   end
   if gameplayUI:isTradeVisible() then
      cbTradeClose()
   end
   gameplayUI:showCharacterWindow( false )
   gameplayUI:showJournal( false )
   gameplayUI:showTravel( false )
   gameplayUI:showMap( false )
   gameplayUI:showDrawing( false, nil )
end

function gameplayUI:setTextWndSelected( wnd, state, selectedColour )
   if wnd then
      selectedColour = selectedColour or "FF34d4ec"
      local defaultColour = wnd:getUserString("defaultColour") or "FFFFFFFF"
      if state and wnd:getProperty("TextColours") ~= selectedColour then
         wnd:setUserString( "defaultColour", wnd:getProperty("TextColours") )
         wnd:setProperty( "TextColours", selectedColour )
      else
         wnd:setProperty( "TextColours", defaultColour )
      end
   end
end

-------------------------------------------------------------------------------
-- Terminal UI
-------------------------------------------------------------------------------
terminalUI =
{
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

function terminalUI:init()
   self.context = createGUIContext( "terminal.layout", "terminal.gui", false )

   self.context:setDefaultFont( "venus rising rg-10" )
   self.context:getMouseCursor():setDefaultImage( "terminal/Cursor" )
   self.context:getMouseCursor():hide()

   self.wnd        = self.context:getRootWindow()
   self.tabControl = CEGUI.toTabControl( self.wnd:getChild( "TabControl" ) )

   self.tabControl:subscribeEvent( "SelectionChanged", cbTabChanged )

   self:createTabs()
end

function terminalUI:deinit()
end

function terminalUI:initNewsTab()
   local tabWnd = self.tabs[1].wnd

   local wnd = wndMgr:createWindow( "TaharezLook/StaticImage", "Logo" )
   tabWnd:addChild( wnd )

   wnd:setSize    ( CEGUI.USize(CEGUI.UDim(1,0), CEGUI.UDim(1,0) ) )
   wnd:setProperty( "Image", "terminal/Logo" )
end

function terminalUI:initJobTab()
   local tabWnd = self.tabs[2].wnd

   local height = #self.jobDb * 145
   tabWnd:setProperty("ContentPaneAutoSized", "false")
   tabWnd:setProperty("ContentArea", "l:0 t:0 r:900 b:" .. height)

   for i=1,#self.jobDb do
      local quest = getQuest( self.jobDb[i].quest )
      if ( quest ) then
         self.jobDb[i].title   = quest.title
         self.jobDb[i].summary = quest.description
      end

      if ( self.jobDb[i].title ) then
         local wnd = wndMgr:loadLayoutFromFile( "job.layout" )
         wnd:setName( "Job" .. tostring(i) )
         wnd:setPosition( CEGUI.UVector2(CEGUI.UDim(0,0), CEGUI.UDim(0,wnd:getSize().height.offset*(i-1))) )
         tabWnd:addChild( wnd )

         wnd:getChild( "Title" ):setText( self.jobDb[i].title .. "\n[font='dialog-14']" .. self.jobDb[i].summary )

         wnd:getChild( "Icon" ):setProperty( "Image", "jobs/" .. self.jobDb[i].icon )

         wnd:getChild( "Button" ):setUserString( "quest", self.jobDb[i].quest )
         wnd:getChild( "Button" ):subscribeEvent( "Clicked", cbJobDetails )

         self.jobDb[i].button = wnd:getChild( "Button" )
      end
   end

   self.tabs[2].detailsWnd = wndMgr:loadLayoutFromFile( "job_details.layout" )
   local wndDetails = self.tabs[2].detailsWnd

   wndDetails:getChild( "Accept" ):subscribeEvent( "Clicked", cbJobAccept )
   wndDetails:getChild( "Return" ):subscribeEvent( "Clicked", cbJobDetailsClose )
   wndDetails:setVisible( false )

   self.wnd:addChild( wndDetails )
end

function terminalUI:updateJobDetails()
   local wndDetails = self.tabs[2].detailsWnd

   local questName = wndDetails:getUserString( "quest" )
   local quest
   if questName then
      quest  = getQuest( questName )
   end
   local button = wndDetails:getChild( "Accept" )

   if ( quest ) then
      button:setProperty( "Text", "ACCEPT" )

      if ( quest:isTerminalFinished() ) then
         button:setProperty( "Text", "FINISH" )
      elseif ( quest:isFinished() ) then
         button:setProperty( "Text", "COMPLETED" )
         wndDetails:setUserString( "quest", "" )
      elseif ( quest:isActive() ) then
         button:setProperty( "Text", "STARTED" )
      end
   end

   for i=1,#self.jobDb do
      local quest = getQuest( self.jobDb[i].quest )

      if ( quest ) then
         if ( quest:isFinished() ) then
            self.jobDb[i].button:setProperty( "Text", "COMPLETED" )
            self.jobDb[i].button:setUserString( "quest", "" )
         end
      end
   end
end

function terminalUI:initWantedTab()
   local tabWnd = self.tabs[3].wnd

   for i=1,#self.wantedDb do
      local wnd = wndMgr:loadLayoutFromFile( "wanted.layout" )
      wnd:setName( "Profile" .. tostring(i) )
      wnd:setPosition( CEGUI.UVector2(CEGUI.UDim(0,0), CEGUI.UDim(0,wnd:getSize().height.offset*(i-1))) )
      tabWnd:addChild( wnd )

      wnd:getChild( "Wanted" ):setProperty( "Font", "venus rising rg-14" )
      wnd:getChild( "Crimes" ):setProperty( "Font", "venus rising rg-14" )
      wnd:getChild( "Name"   ):setProperty( "Font", "venus rising rg-14" )
      wnd:getChild( "Info"   ):setProperty( "Font", "venus rising rg-12" )

      wnd:getChild( "Name" ):setText( self.wantedDb[i].name )
      wnd:getChild( "Info" ):setText( self.wantedDb[i].crimes )

      local imageName = "wanted" .. tostring(i)
      if ( not imgMgr:isDefined(imageName) ) then
         imgMgr:addFromImageFile( imageName, imageName .. ".png" )
      end
      wnd:getChild( "Photo" ):setProperty( "Image", imageName )
   end
end

function terminalUI:createTabs()
   local tabSize = 1/#self.tabs

   self.tabControl:setTabHeight     ( CEGUI.UDim(0.1,0) )
   self.tabControl:setTabTextPadding( CEGUI.UDim(tabSize*0.4,0) )

   for i=1,#self.tabs do
      local tab = self.tabs[i]
      tab.wnd = wndMgr:createWindow( "TaharezLook/ScrollablePane", tab.name )
      tab.wnd:setSize( CEGUI.USize(CEGUI.UDim(0.97,0), CEGUI.UDim(1,0) ) )
      tab.wnd:setText( tab.title )

      tab.wnd:subscribeEvent( "ContentPaneScrolled", cbTabScrolled )

      self.tabControl:addTab( tab.wnd )
   end

   self:initNewsTab()
   self:initJobTab()
   self:initWantedTab()
end

function terminalUI:showMenu()
   self.context:setRootWindow( self.wnd )
end

function terminalUI:hideMenu()
   self.context:setRootWindow( nil )
end

function terminalUI:showCursor()
   self.context:getMouseCursor():show()
   gameplayUI:hideCursor()
end

function terminalUI:hideCursor()
   self.context:getMouseCursor():hide()
end

function terminalUI:isCursorVisible()
   return self.context:getMouseCursor():isVisible()
end

function terminalUI:showInitTab()
   self:showMenu()
   self:updateJobDetails()
   self.tabControl:setSelectedTabAtIndex( 0 )

   self.tabs[2].detailsWnd:setVisible( false )
end

function terminalUI:clickElement()
   if ( terminalUI.activeTerminal ) then
      terminalUI.activeTerminal:clickElement()
   end
end

function terminalUI:acceptElement()
   if ( terminalUI.activeTerminal ) then
      terminalUI.activeTerminal:acceptElement()
   end
end

function terminalUI:denyElement()
   if ( terminalUI.activeTerminal ) then
      terminalUI.activeTerminal:denyElement()
   end
end

-------------------------------------------------------------------------------
-- Events
-------------------------------------------------------------------------------
function OnInit()
   TPrint( "OnInit\n" )

   trackStop()

   gameplayUI.wndGameplay  = wndMgr:loadLayoutFromFile( "gameplay.layout" )
   gameplayUI.wndPause     = wndMgr:loadLayoutFromFile( "pause_menu.layout" )
   gameplayUI.wndPause:getChild("Version"):setProperty("Text", versionStr)
   gameplayUI.wndPauseMain = gameplayUI.wndPause:getChild( "Main" )
   gameplayUI.wndSaveLoad  = wndMgr:loadLayoutFromFile( "save_load_menu.layout" )
   gameplayUI.wndSaveLoad:getChild("Version"):setProperty("Text", versionStr)

   options:init()
   options.backMenu = gameplayUI.wndPause
   gameplayUI.wndOptions   = options:getWnd()

   -- CONSOLE START
   console:init()
   gameplayUI.wndConsole   = console:getWnd()
   gameplayUI.wndConsole:getChild( "Command" ):subscribeEvent( "TextAccepted", runConsoleCommand )
   gameplayUI.wndConsole:getChild( "Command" ):subscribeEvent( "CharacterKey", console.cbConsoleCharacter )
   gameplayUI.wndConsole:getChild( "Command" ):subscribeEvent( "KeyDown", console.cbConsoleCommandKeyDown )
   gameplayUI.wndConsole:getChild( "Command" ):subscribeEvent( "KeyUp", console.cbConsoleCommandKeyUp )
   gameplayUI.wndConsole:setVisible( false )
   -- CONSOLE END
   guiContext:setDefaultTooltipType( "TaharezLook/Tooltip" )

   if ( questSystem ) then
      questSystem:init()
   end

   gameplayUI:init()
   terminalUI:init()

   gameplayUI.wndPauseMain:getChild( "ButtonResume" ):subscribeEvent( "Clicked", continueGame )
   gameplayUI.wndPauseMain:getChild( "ButtonOptions" ):subscribeEvent( "Clicked", optionsMenu )
   gameplayUI.wndPauseMain:getChild( "ButtonSaveLoad" ):subscribeEvent( "Clicked", saveGameMenu )
   gameplayUI.wndPauseMain:getChild( "ButtonHelp" ):subscribeEvent( "Clicked", helpMenu )
   gameplayUI.wndPauseMain:getChild( "ButtonMenu" ):subscribeEvent( "Clicked", quitToMenu )
   gameplayUI.wndPauseMain:getChild( "ButtonQuit" ):subscribeEvent( "Clicked", quitToDesktop )

   gameplayUI.wndSaveLoad:getChild( "Load/Button" ):subscribeEvent( "Clicked", loadGameState )
--   gameplayUI.wndSaveLoad:getChild( "Savegames" ):subscribeEvent( "MouseDoubleClick", saveGameState )
   gameplayUI.wndSaveLoad:getChild( "Savegames" ):subscribeEvent( "MouseClick", fillSaveName )
   gameplayUI.wndSaveLoad:getChild( "Save/Button" ):subscribeEvent( "Clicked", saveGameState )
   gameplayUI.wndSaveLoad:getChild( "Delete/Button" ):subscribeEvent( "Clicked", deleteGameState )
   gameplayUI.wndSaveLoad:getChild( "Back/Button" ):subscribeEvent( "Clicked", backToPauseMenu )
end

function OnDeinit()
   TPrint( "OnDeinit\n" )

   if ( coordsTimer ) then
      coordsTimer:stop()
      coordsTimer = nil
   end

   terminalUI:deinit()
   gameplayUI:deinit()
end

function OnLostFocus()
   if ( guiContext:getRootWindow() and guiContext:getRootWindow():getName() == gameplayUI.wndGameplay:getName() ) then
      if getPlayer() and getPlayer().resetButtons then
         getPlayer():resetButtons()
      end
      pauseGame({})
   end
end

-- only gets called in client, not in editor
function OnKeyPress( key )
   if key == getButtonCode( "ESCAPE" ) then
      if tryDestroyDynamicWindows() then return end

      if gameplayUI:isConsoleVisible() then
         hideConsole()
      elseif gameplayUI:isInventory2Visible()
              or gameplayUI:isInventoryTurretVisible()
              or gameplayUI:isInventoryVisible()
              or gameplayUI:isCharacterWindowVisible()
              or gameplayUI:isTravelVisible()
              or terminalUI:isCursorVisible()
              or gameplayUI:isWaitingVisible()
              or gameplayUI:isTravelVisible()
              or gameplayUI:isTradeVisible()
              or gameplayUI:isMessageVisible()
              or gameplayUI:isJournalVisible()
              or gameplayUI:isDrawingVisible()
              or gameplayUI:isMapVisible() then
         gameplayUI:closeUI()
      elseif guiContext:getRootWindow() and
              guiContext:getRootWindow():getName() == gameplayUI.wndOptions:getName() then
         options.optionsToMenu()
      elseif guiContext:getRootWindow() and
              guiContext:getRootWindow():getName() == gameplayUI.wndSaveLoad:getName() then
         backToPauseMenu()
      else
         checkPause()
      end
   end
   if not gameplayUI:isGameplayRootWindow() then
      return
   end

   if ( isDebug("keys") ) then
      if ( key == 190 ) then
         WeatherSystem:changeTimeRate(  5.0 )
         SkySystem:changeTimeRate    (  0.01 )
      end
      if ( key == 188 ) then
         WeatherSystem:changeTimeRate( -5.0 )
         SkySystem:changeTimeRate    ( -0.01 )
      end
   end
   if ( key == getButtonCode( "TOGGLEUI" ) ) then
      if ( gameplayUI.wndGameplay:isVisible() ) then
         gameplayUI.wndGameplay:hide()
      else
         gameplayUI.wndGameplay:show()
         gameplayUI.wndGameplay:activate()
      end
   end
end

-------------------------------------------------------------------------------
-- Global funcs
-------------------------------------------------------------------------------
function initLocationEnterUI()
   if ( getPlayer() ) then
      guiContext:setRootWindow( gameplayUI.wndGameplay )
   end

   --if ( getPlayer() ) then
     -- coordsTimer = runTimer( 0.5, gameplayUI, gameplayUI.updateCoords, true )
   --end
end

function checkPause()
   if ( guiContext:getRootWindow() and
        guiContext:getRootWindow():getName() ~= gameplayUI.wndPause:getName() and
        guiContext:getRootWindow():getName() ~= gameplayUI.wndGameplay:getName() or
        gameplayUI:isDebugVisible() ) then
      return
   end

   if ( gamePaused ) then
      continueGame({})
   else
      pauseGame({})
   end
end

function pauseGame( args )
   getScene():pauseGame( true )
   gameplayUI:resetCursorPos()
   gameplayUI:showCursor()
   guiContext:setRootWindow( gameplayUI.wndPause )

   gamePaused = true
end

function continueGame( args )
   gameplayUI:setHelpInfoVisible( false )
   gameplayUI:resetCursorPos()
   getScene():pauseGame( false )

   guiContext:setRootWindow( gameplayUI.wndGameplay )

   if ( not gameplayUI:isInventoryVisible() and not gameplayUI:isInventory2Visible() ) then
      gameplayUI:hideCursor()
   end

   gamePaused = false
end

function optionsMenu( args )
   options:updateOptions()
   guiContext:setRootWindow( gameplayUI.wndOptions )
end

function quitToDesktop( args )
   confirmMessage( gameplayUI.wndPause, function() exitGame() end )
--[[
   -- restart level
   reloadLocation()

   guiContext:setRootWindow( gameplayUI.wndGameplay )
   gameplayUI:hideCursor()

   gamePaused = false
   ]]
end

function helpMenu( args )
   gameplayUI:setHelpInfoVisible( not gameplayUI:isHelpInfoVisible() )
end

function quitToMenu( args )
   confirmMessage( gameplayUI.wndPause, function()
      if getPlayer() and not getPlayer():getState( "dead" ) then
         saveGameSafe( "autosave" )
      end
      exitLocation()
   end )
end

function backToPauseMenu( args )
   guiContext:setRootWindow( gameplayUI.wndPause )
end

function saveGameMenu( args )
   SavegamesListBox = CEGUI.toListbox( gameplayUI.wndSaveLoad:getChild( "Savegames" ) )
   initSavegamesList( SavegamesListBox )

   guiContext:setRootWindow( gameplayUI.wndSaveLoad )
   if isSavingEnabled() then
      gameplayUI.wndSaveLoad:getChild( "Save/Button" ):setProperty( "Disabled", "false" )
   else
      gameplayUI.wndSaveLoad:getChild( "Save/Button" ):setProperty( "Disabled", "true" )
   end
end

function fillSaveName(args)
   local item = SavegamesListBox:getFirstSelectedItem()

   if ( item ~= nil ) then
      gameplayUI.wndSaveLoad:getChild( "SaveName" ):setText(gSavegames[item:getID()].name)
   end
end

function loadGameState( args )
   local item = SavegamesListBox:getFirstSelectedItem()
   if item then
      loadSaveVersionCheck( item:getID() )
   end
end

function saveGameState( args )
   local text = gameplayUI.wndSaveLoad:getChild( "SaveName" ):getText()
   if text == "" then
      local item = SavegamesListBox:getFirstSelectedItem()
      if item ~= nil then
         text = gSavegames[item:getID()].name
      else
         text = "default"
      end
   end

   saveGameSafe( text )
   gameplayUI.wndSaveLoad:getChild( "SaveName" ):setText( "" )
   initSavegamesList( SavegamesListBox ) -- reinit list
end

function deleteGameState( args )
   local item = SavegamesListBox:getFirstSelectedItem()

   if ( item ~= nil ) then
      confirmMessage( gameplayUI.wndSaveLoad, function()
         deleteGame( gSavegames[item:getID()].name )
         initSavegamesList( SavegamesListBox ) -- reinit list
      end )
   end
end

function setUserControl( state )
   if ( state ) then
      if ( not gameplayUI:isInventoryVisible() and
           not gameplayUI:isJournalVisible  () and
           not gameplayUI:isWaitingVisible  () and
           not gameplayUI:isDialogVisible   () and
           not gameplayUI:isCombLockVisible () and
           not gameplayUI:isTravelVisible   () and
           not gameplayUI:isTradeVisible    () and
           not gameplayUI:isMapVisible      () and
           not gameplayUI:isCharacterWindowVisible() and
           not gameplayUI:isDebugVisible    () and
           not gameplayUI:isDrawingVisible  () and
           not getGlobalParam("inScene") ) then
         returnUserControl()
         gameplayUI:hideCursor()
         terminalUI:hideCursor()
      end
   else
      blockUserControl()
   end
end

-------------------------------------------------------------------------------
-- Callbacks
-------------------------------------------------------------------------------
function cbInventoryTabClick( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   if ( click_args.button == CEGUI.LeftButton ) then
      local name = click_args.window:getName()
      gameplayUI.inventory.wnd:getChild(gameplayUI.inventory.currentTab):setProperty( "Disabled", "false" )
      gameplayUI.inventory.currentTab =  name
      gameplayUI:setupInventory( getPlayer():getInventory().items )
      click_args.window:setProperty( "Disabled", "true" )
      gameplayUI.inventory.wnd:getChild("Cells"):setProperty("VertScrollPosition", "0")
   end
end

function cbStatUpgrade( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   if click_args.button == CEGUI.LeftButton then
      getDefaultPlayer():upgradeStat( click_args.window:getName():gsub("Upgrade", "") )
      gameplayUI:updateStatisticsAttributePoints()
      gameplayUI:hideAnnoyingHint( "AP" )
   end
end

function cbHideCharacterWindow()
   gameplayUI:showCharacterWindow( false )
end

function cbInventoryClose( args )
   if ( getPlayer() ) then
      getPlayer():OnInventoryClose()
   end
end

function cbInventory2Close( args )
   gameplayUI:showInventory2( false )
end

function cbInventory2TakeAll( args )
   if ( getPlayer() ) then
      getPlayer():OnInventoryTakeAll()
      getPlayer():playSound( "inventory_pick.wav" )
   end
   cbInventoryClose( args )
end

function cbInventoryTurretClose()
   gameplayUI:showInventoryTurret( false )
end

function cbDeinstallTurret()
   local item = getPlayer().exchangeTarget:getAsItem()
   gameplayUI:showInventoryPickInfo( item:getLabel() .. " was added to Inventory")
   getPlayer().itemsManager:addItemObj( item )
   cbInventoryClose()
end

function cbGameplayKeyDown( args )
   local keyArgs = CEGUI.toKeyEventArgs( args )
   if ( keyArgs.scancode == virtualKeyToScanCode(81)) then -- PC_Q
      if gameplayUI:isInventory2Visible() or gameplayUI:isInventoryTurretVisible() then
         if not gameplayUI:isItemDelimiterVisible() then
            runTimer( 0, args, cbInventory2TakeAll, false ) -- delayed exec to correct scanner work
            return true
         end
      end
   elseif keyArgs.scancode == virtualKeyToScanCode(16) then -- PC_SHIFT
      gameplayUI.shiftPressed = true
      return true
   end
   return false
end

function cbGameplayKeyUp( args )
   local keyArgs = CEGUI.toKeyEventArgs( args )
   if keyArgs.scancode == virtualKeyToScanCode(16) then -- PC_SHIFT
      gameplayUI.shiftPressed = false
      return true
   end
   return false
end

function cbJournalClose( args )
   gameplayUI:showJournal( false )
end

function cbMessageClose( args )
   gameplayUI:hideMessage()
end

function cbDrawingClose( args )
   gameplayUI:showDrawing( false, nil )
end

function cbDrawingWheel( args )
   local wheel_args = CEGUI.toMouseEventArgs( args )
   local parent = wheel_args.window:getParent():getParent()
   local vscroll = parent:getChild("__auto_vscrollbar__")
   local hscroll = parent:getChild("__auto_hscrollbar__")
   local scroll_pos
   if vscroll:isVisible() then
      scroll_pos = parent:getProperty("VertScrollPosition")
   elseif hscroll:isVisible() then
      scroll_pos = parent:getProperty("HorzScrollPosition")
   end
   if scroll_pos then
      if wheel_args.wheelChange > 0 then
         scroll_pos = scroll_pos - 0.1
      else
         scroll_pos = scroll_pos + 0.1
      end

      scroll_pos = math.max(0, math.min(1.0, scroll_pos))
      if vscroll:isVisible() then
         parent:setProperty("VertScrollPosition", scroll_pos)
      elseif hscroll:isVisible() then
         parent:setProperty("HorzScrollPosition", scroll_pos)
      end
   end
end

function cbDragAndDropGameplayScreen( args )
   local dd_args = CEGUI.toDragDropEventArgs( args )
   local sourceInventoryName = dd_args.dragDropItem:getUserString("inventoryName")
   if sourceInventoryName == "Hotbar" then
      local slotID = gameplayUI:getHotbarWndIndex( dd_args.dragDropItem )
      gameplayUI:clearHotbarSlot( slotID )
   elseif sourceInventoryName == "CharacterWindow" then
      local slotName = dd_args.dragDropItem:getParent():getName()
      local slotID = slotName
      if slotName:find( "slot" ) then
         slotID = slotID:gsub("slot", "")
         slotID = tonumber( slotID )
      end
      gameplayUI:setItemToFastAccessSlot( slotID, nil )
   end
end

function cbDragAndDropInventory( args )
   local dd_args = CEGUI.toDragDropEventArgs( args )
   local player = getPlayer()
   local sourceInventoryName = dd_args.dragDropItem:getUserString("inventoryName")
   if sourceInventoryName == "Hotbar" then
      local slotID = gameplayUI:getHotbarWndIndex( dd_args.dragDropItem )
      gameplayUI:clearHotbarSlot( slotID )
   elseif sourceInventoryName == "CharacterWindow" then
      local slotName = dd_args.dragDropItem:getParent():getName()
      local slotID = slotName
      if slotName:find( "slot" ) then
         slotID = slotID:gsub("slot", "")
         slotID = tonumber( slotID )
      end
      gameplayUI:setItemToFastAccessSlot( slotID, nil )
   elseif sourceInventoryName ~= "Inventory" then
      local item = player:getTargetInventory():getItemById( tonumber(dd_args.dragDropItem:getUserString("itemID")) )
      inventoryMoveItem( item, "drop" )
   end
end

function cbDragAndDropInventory2( args )
   local dd_args = CEGUI.toDragDropEventArgs( args )
   local sourceInventoryName = dd_args.dragDropItem:getUserString("inventoryName")
   if sourceInventoryName == "Inventory2" then return end

   local item = getPlayer():getInventory():getItemById( tonumber(dd_args.dragDropItem:getUserString("itemID")) )
   inventoryMoveItem( item, "drag" )
end

function cbDragAndDropInventoryTurret( args )
   local dd_args = CEGUI.toDragDropEventArgs( args )
   local sourceInventoryName = dd_args.dragDropItem:getUserString("inventoryName")
   if sourceInventoryName == "InventoryTurret" then return end

   local item = getPlayer():getInventory():getItemById( tonumber(dd_args.dragDropItem:getUserString("itemID")) )
   inventoryMoveItem( item, "drag" )
end

function cbDragAndDropHotbar( args )
   if gameplayUI:isTradeVisible() then return end
   local player = getPlayer()
   local dd_args = CEGUI.toDragDropEventArgs( args )
   local item
   local sourceInventoryName = dd_args.dragDropItem:getUserString("inventoryName")
   if player:getTargetInventory() and sourceInventoryName ~= "Inventory" and sourceInventoryName ~= "Hotbar" then
      item = player:getTargetInventory():getItemById( tonumber(dd_args.dragDropItem:getUserString("itemID")) )
      player:OnInventoryDrop( item, item.count )
      item = player.itemsManager:getItemByName( item.name )
   else
      item = player.itemsManager:getItemById( tonumber(dd_args.dragDropItem:getUserString("itemID")) )
   end

   if sourceInventoryName == "Hotbar" then
      local slotID = gameplayUI:getHotbarWndIndex( dd_args.dragDropItem )
      gameplayUI:clearHotbarSlot( slotID )
   end

   gameplayUI:setItemToHotbar( gameplayUI:getHotbarWndIndex( dd_args.window ), item )
end

function cbInventorySlotClick( args )
   local click_args = CEGUI.toMouseEventArgs( args )

   local sourceInventoryName = click_args.window:getUserString("inventoryName")
   local sourceInventoryTableName = string.gsub(sourceInventoryName, "^%u", string.lower)
   local slotID = tonumber( click_args.window:getUserString("slotID") )

   if not gameplayUI[sourceInventoryTableName].slots[slotID].item then
      return
   end

   if click_args.button == CEGUI.RightButton then
      if sourceInventoryName == "Inventory" then
         if not gameplayUI.inventory.slots[slotID].item then
            return
         else
            getPlayer():OnPopupInventoryOpen( gameplayUI.inventory.slots[slotID].item )
            local popupPos = CEGUI.UVector2( CEGUI.UDim(0,click_args.position.x), CEGUI.UDim(0,click_args.position.y) )
            gameplayUI.popupMenu.wnd:setPosition( popupPos )
         end
      end
   elseif click_args.button == CEGUI.LeftButton then
      if gameplayUI:isInventory2Visible() or gameplayUI:isInventoryTurretVisible() then
         if sourceInventoryName == "Inventory" then
            inventoryMoveItem(gameplayUI.inventory.slots[slotID].item, "drag")
         elseif sourceInventoryName == "Inventory2" then
            inventoryMoveItem(gameplayUI.inventory2.slots[slotID].item, "drop")
         elseif sourceInventoryName == "InventoryTurret" then
            inventoryMoveItem(gameplayUI.inventoryTurret.slots[slotID].item, "drop")
         end
         cbItemInfoMouseLeave( args )
         cbItemInfoMouseHover( args )
      end
      gameplayUI.popupMenu.wnd:setVisible( false )
   end
end

function cbHotbarSlotClick( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   if click_args.button == CEGUI.RightButton then
      local slotID = gameplayUI:getHotbarWndIndex( click_args.window )
      local item = gameplayUI:getHotbarItemInSlot( slotID )
      if not item then return end
      getPlayer().popupMenuItem = slotID
      gameplayUI:setupPopupMenu( {"clear slot"} )
      gameplayUI.popupMenu.wnd:setPosition( CEGUI.UVector2(CEGUI.UDim(0,click_args.position.x), CEGUI.UDim(0,click_args.position.y)) )
   else
      gameplayUI.popupMenu.wnd:setVisible( false )
   end
end

function inventoryMoveItem( item, action )
   if gameplayUI.shiftPressed then
      if action == "drag" then
         getPlayer():OnInventoryDrag( item, item.count )
      else
         getPlayer():OnInventoryDrop( item, item.count )
      end
   elseif ( item.count > 1 ) then
      gameplayUI:setupItemDelimiter( item, action )
      gameplayUI:showItemDelimiter()
   else
      if action == "drag" then
         getPlayer():OnInventoryDrag( item, 1 )
      else
         getPlayer():OnInventoryDrop( item, 1 )
      end
   end
end

function cbPopupMenuClick( args )
   local wnd_args = CEGUI.toWindowEventArgs( args )

   if wnd_args.button == CEGUI.LeftButton then
      if ( getPlayer() ) then
         getPlayer():OnPopupInventoryClick( wnd_args.window:getText() )
         gameplayUI.popupMenu.wnd:setVisible( false )
      end
   end
end

function cbItemDelimiterAccept( args )
   local itemsCount = gameplayUI:updateItemDelimiter()

   if ( gameplayUI.itemDelimiter.mode == "drag" ) then
      getPlayer():OnInventoryDrag( gameplayUI.itemDelimiter.item, itemsCount )
   elseif ( gameplayUI.itemDelimiter.mode == "drop" ) then
      getPlayer():OnInventoryDrop( gameplayUI.itemDelimiter.item, itemsCount )
   elseif ( gameplayUI.itemDelimiter.mode == "cook" ) then
      getPlayer().cookCount = itemsCount
      getPlayer():OnPopupInventoryClick( "cook_multi" )
   elseif ( gameplayUI.itemDelimiter.mode == "sell" ) then
      gameplayUI:OnTradeDrop( gameplayUI.itemDelimiter.item, itemsCount, "sell" )
   elseif ( gameplayUI.itemDelimiter.mode == "buy" ) then
      gameplayUI:OnTradeDrop( gameplayUI.itemDelimiter.item, itemsCount, "buy" )
   elseif ( gameplayUI.itemDelimiter.mode == "sellRemove" ) then
      gameplayUI:OnTradeDrop( gameplayUI.itemDelimiter.item, itemsCount, "sellRemove" )
   elseif ( gameplayUI.itemDelimiter.mode == "buyRemove" ) then
      gameplayUI:OnTradeDrop( gameplayUI.itemDelimiter.item, itemsCount, "buyRemove" )
   elseif ( gameplayUI.itemDelimiter.mode == "craft" ) then
      gameplayUI:OnCraft( gameplayUI.itemDelimiter.item, itemsCount )
   end

   gameplayUI:hideItemDelimiter()
end

function cbItemDelimiterCancel()
   gameplayUI.itemDelimiter.wnd:setVisible( false )
end

function cbItemDelimiterEditChanged( args )
   gameplayUI:updateItemDelimiter()
end

function cbItemDelimiterScrollbarChanged( args )
   local itemsCount = round( gameplayUI.itemDelimiter.scrollbar:getScrollPosition() )
   if itemsCount == 0 then itemsCount = 1 end
   gameplayUI.itemDelimiter.editbox:setText( tostring(itemsCount) )
end

function cbTabChanged( args )
   terminalUI:clickElement()
end

function cbTabScrolled( args )
   terminalUI:clickElement()
end

function cbJobAccept( args )
   local wndDetails = terminalUI.tabs[2].detailsWnd
   local quest      = getQuest( wndDetails:getUserString( "quest" ) )

   if ( quest ) then
      if ( not quest:isStarted() ) then
         --log( "starting" .. quest.name )
         quest:start()
         terminalUI:acceptElement()
      elseif ( quest:isTerminalFinished() ) then
         -- questSystem:fireEvent( "finish", "" )
         quest:finish()
         terminalUI:clickElement()
      else
         terminalUI:denyElement()
      end
      terminalUI:updateJobDetails()
   end
end

function cbJobDetails( args )
   --log("details")
   local me_args    = CEGUI.toMouseEventArgs( args )
   local wndDetails = terminalUI.tabs[2].detailsWnd
   local quest      = getQuest( me_args.window:getUserString( "quest" ) )

   if ( quest ) then
   --log("ttt")
      wndDetails:setVisible( true )
      wndDetails:moveToFront()
      wndDetails:setUserString( "quest", me_args.window:getUserString( "quest" ) )
      wndDetails:getChild("Title"):setProperty( "Text", quest.title )
      wndDetails:getChild("Description"):setProperty( "Text", quest.description )
      terminalUI:updateJobDetails()
   end

   terminalUI:clickElement()
end

function cbJobDetailsClose( args )
   local wndDetails = terminalUI.tabs[2].detailsWnd
   wndDetails:setVisible( false )

   terminalUI:clickElement()
end


function cbHideFinishedQuests( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      local newState = click_args.window:getProperty("Selected") == "true"
      setGlobalParam("hideFinishedQuests", newState)
      gameplayUI:updateQuestsList()
   end
end

function cbQuestCheckbox( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      local questName = click_args.window:getParent():getName()
      local newState = click_args.window:getProperty("Selected") == "true"

      if newState ~= quests[questName]:getQuestMarkersEnabled() then
         quests[questName]:setQuestMarkersEnabled( newState )
         gameplayUI:updateJournalQuestLog( quests[questName] )
         gameplayUI:updateQuestsList()
      end
   end
end

function cbQuestMapCenter( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   local questName = gameplayUI.journal.selectedQuest.name
   if click_args.window:getParent():getName() ~= gameplayUI.journal.tabs.log:getParent():getName() then
      questName = click_args.window:getParent():getName()
   end
   local mapItem = getPlayer():getInventory():getItemByName(gameplayUI.map.currentMapItemName)
   if gameplayUI.map.activeMarkers[questName] and mapItem then
      local pos = gameplayUI.map.activeMarkers[questName][1][1]:getPosition()
      gameplayUI:mapCenterOnPos( {pos.x.scale, pos.y.scale} )
      if gameplayUI:isMapVisible() then
         gameplayUI.map.wnd:activate()
      else
         getPlayer():useItem( mapItem )
      end
      gameplayUI:showJournal( false )
   elseif not mapItem then
      gameplayUI:showInfoTextEx("You don't have any maps", "minor", "")
   end

   quests[questName]:setQuestMarkersEnabled( true )
   gameplayUI:updateJournalQuestLog( quests[questName] )
   gameplayUI:updateQuestsList()
end

function cbQuestSelect( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      local questName = click_args.window:getName()
      gameplayUI:updateJournalQuestLog( quests[questName] )
   end
end

function cbInventoryCraft( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.window and click_args.button == CEGUI.LeftButton then
      gameplayUI:showCraft( not gameplayUI:isCraftVisible() )
   end
end

function cbCraftClick( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.window and click_args.button == CEGUI.LeftButton then
      local recipe = click_args.window.recipe
      local craftMaxCount = 10000
      for itemName, needCount in pairs(recipe) do
         local hasItem = getPlayer():getInventory():getItemByName( itemName )
         if hasItem then
            craftMaxCount = math.min( craftMaxCount, math.floor( hasItem.count / needCount ) )
         else
            craftMaxCount = 0
            break
         end
      end
      if craftMaxCount > 0 then
         local item = ItemsData.ItemsInfo[click_args.window.itemName]
         item.name = click_args.window.itemName
         item.count = craftMaxCount
         gameplayUI:setupItemDelimiter( item, "craft" )
         gameplayUI:showItemDelimiter()
         gameplayUI.craft.clickedRecipe = recipe
      else
         gameplayUI:showInfoTextEx( "Not enough components", "minor", "" )
      end
   elseif click_args.window and click_args.button == CEGUI.RightButton then
      --reset
      for i=1,#gameplayUI.craft.items do
         local wnd = gameplayUI.craft.items[i]
         wnd:setPosition( CEGUI.UVector2(CEGUI.UDim(0.0,0), CEGUI.UDim(0.0,66.0 * (i - 1)) ) )
         for j=1,#wnd.components do
            wnd.components[j]:setVisible(false)
         end
      end

      --slide down and show components
      local recipeIndex = string.gsub(click_args.window:getName(), "Item", "")
      for i=1,#gameplayUI.craft.items do
         local wnd = gameplayUI.craft.items[i]
         local wndIndex = string.gsub(wnd:getName(), "Item", "")
         if tonumber( recipeIndex ) < tonumber( wndIndex ) then
            wnd:setPosition( CEGUI.UVector2(CEGUI.UDim(0.0,0), CEGUI.UDim(0.0,66.0 * wndIndex + 66 * #click_args.window.components) ) )
         end
      end
      for i=1,#click_args.window.components do
         click_args.window.components[i]:setVisible(true)
      end
   end
end

function cbCraftOver( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.window then
      click_args.window:setProperty("BackgroundEnabled", "true")
      click_args.window:setProperty("FrameEnabled", "true")
   end
end

function cbCraftOut( args )
   if CEGUI then
      local click_args = CEGUI.toMouseEventArgs(args)
      if click_args.window then
         click_args.window:setProperty("BackgroundEnabled", "false")
         click_args.window:setProperty("FrameEnabled", "false")
      end
   end
end

function cbCloseCraft(args)
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.window and click_args.button == CEGUI.LeftButton then
      gameplayUI:showCraft( false )
   end
end

function cbMapCenterOnPlayer( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   if click_args.button == CEGUI.LeftButton then
      gameplayUI:mapCenterOnPos( getPlayer():getPose():getPos() )
   end
end

function cbMapLeave( args )
   if CEGUI then
      gameplayUI.map.clicked = false
   end
end

function cbMapClick( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   if click_args.button == CEGUI.LeftButton then
      gameplayUI.map.clicked = true
   end
end

function cbMapRelease( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   if click_args.button == CEGUI.LeftButton then
      gameplayUI.map.clicked = false
   end
end

function cbMapMove( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   if gameplayUI.map.clicked then
      local deltaX = click_args.moveDelta.x
      local deltaY = click_args.moveDelta.y
      local containerWidth = gameplayUI.map.wnd:getChild("ScrollablePane"):getPixelSize().width
      local containerHeight = gameplayUI.map.wnd:getChild("ScrollablePane"):getPixelSize().height
      local mapWidth = gameplayUI.map.mapImage:getPixelSize().width
      local mapHeight = gameplayUI.map.mapImage:getPixelSize().height
      local horzScroll = tonumber(gameplayUI.map.wnd:getChild("ScrollablePane"):getProperty("HorzScrollPosition")) - deltaX/(mapWidth-containerWidth)
      local vertScroll = tonumber(gameplayUI.map.wnd:getChild("ScrollablePane"):getProperty("VertScrollPosition")) - deltaY/(mapHeight-containerHeight)

      gameplayUI.map.wnd:getChild("ScrollablePane"):setProperty("HorzScrollPosition", tostring(horzScroll))
      gameplayUI.map.wnd:getChild("ScrollablePane"):setProperty("VertScrollPosition", tostring(vertScroll))
   end
end

function cbMapWheel( args )
   local wheel_args = CEGUI.toMouseEventArgs( args )
   local vertScroll = tonumber(gameplayUI.map.wnd:getChild("ScrollablePane"):getProperty("VertScrollPosition"))
   local horzScroll = tonumber(gameplayUI.map.wnd:getChild("ScrollablePane"):getProperty("HorzScrollPosition"))
   local size = gameplayUI.map.mapImage:getMaxSize()
   local delta = 0.05
   if wheel_args.wheelChange < 0 then
      delta = -0.05
   end
   if gameplayUI.map.currentZoom + delta >= gameplayUI.map.minZoom and gameplayUI.map.currentZoom + delta <= 1 then
      gameplayUI.map.currentZoom = gameplayUI.map.currentZoom + delta
      --get real width and height
      size.width.offset = math.ceil(gameplayUI.map.mapImage:getWidth().offset * gameplayUI.map.currentZoom)
      size.height.offset = math.ceil(gameplayUI.map.mapImage:getHeight().offset * gameplayUI.map.currentZoom)
      gameplayUI.map.mapImage:setMaxSize( size )
      gameplayUI.map.wnd:getChild("ScrollablePane"):setProperty("HorzScrollPosition", horzScroll)
      gameplayUI.map.wnd:getChild("ScrollablePane"):setProperty("VertScrollPosition", vertScroll)
   end
end

function cbMapShowQuestMarkers( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   if click_args.button == CEGUI.LeftButton then
      local newState = click_args.window:getProperty("Selected") == "true"
      if newState ~= getGlobalParam("showQuestMarkers") then
         setGlobalParam("showQuestMarkers", newState)
         if newState then
            for _,q in pairs(quests) do
               if q:getQuestMarkersEnabled() then
                  gameplayUI:setQuestMarkersVisible( q.name, true )
               end
            end
         else
            for _,q in pairs(quests) do
               if q:getQuestMarkersEnabled() then
                  gameplayUI:setQuestMarkersVisible( q.name, false )
               end
            end
         end
      end
   end
end

function cbMapClose( args )
   gameplayUI:showMap( false )
end

local function getItemsFromClasses( itemName )
   local items = {}
   local totalCount = 0
   for className in pairs(ClassManager.classTable) do
      local classWnd = gameplayUI.mapVisualizer.classesWnd:getChild( className )
      if classWnd and classWnd:getChild( "Checkbox" ) and classWnd:getChild( "Checkbox" ):getProperty("Selected") == "true" then
         local objTable = ClassManager.getAllByClassName( className )
         if objTable then
            for i=1,#objTable do
               local obj = objTable[i]
               local lootTable = obj:getLootTable()
               if lootTable[itemName] then
                  table.insert( items, { count = lootTable[itemName], obj = obj })
                  totalCount = totalCount + lootTable[itemName]
               end
            end
         end
      end
   end
   return items, totalCount
end

function cbMapVisualizerButtonClick( args )
   --Init item visualizer only now to not affect non-debug game loading
   if not gameplayUI.mapVisualizer.initialized then
      gameplayUI.mapVisualizer.initialized = true

      local i = 0
      for className,objTable in tablex.sort( ClassManager.objByClassesTable ) do
         if className ~= "CMainCharacter" then
            gameplayUI.mapVisualizer.objIcons[className] = {}
            local label = wndMgr:createWindow( "TaharezLook/StaticText", className )
            label:setProperty( "Area", "{{0,0},{0,0},{1,0},{0.05,0}}" )
            label:setProperty( "FrameEnabled", "false" )
            label:setProperty( "Font", "dialog-8" )
            label:setProperty( "MouseInputPropagationEnabled", "true" )
            label:setProperty( "TextColours", "FFFFFFFF" )
            label:setText( string.format(" %s (%d)", className, #objTable) )
            local pos = CEGUI.UVector2( CEGUI.UDim(0,0), CEGUI.UDim(0,19*(i-1)) )
            label:setPosition( pos )
            label:subscribeEvent( "MouseClick", cbMapVisualizerClassClick )
            gameplayUI.mapVisualizer.classesWnd:addChild( label )
            i = i + 1

            local class = ClassManager.getClass( className )
            if class and class.getLootTable then
               local checkbox = wndMgr:createWindow( "TaharezLook/Checkbox", "Checkbox" )
               checkbox:setProperty( "Area", "{{0.9,0},{0,0},{1,0},{1,0}}" )
               checkbox:setProperty( "MouseInputPropagationEnabled", "false" )
               checkbox:setProperty( "Selected", "true" )
               checkbox:subscribeEvent( "MouseClick", cbMapVisualizerClassCheckboxClick )
               label:addChild( checkbox )
            end
         end
      end

      i = 0
      local itemsTable = tablex.sort( ItemsData.ItemsInfo )
      for itemName,_ in itemsTable do
         gameplayUI.mapVisualizer.itemsIcons[itemName] = {}
         local itemLabel = wndMgr:createWindow( "TaharezLook/StaticText", itemName )
         itemLabel:setProperty( "Area", "{{0,0},{0,0},{1,0},{0.05,0}}")
         itemLabel:setProperty( "FrameEnabled", "false")
         itemLabel:setProperty( "Font", "dialog-8")
         itemLabel:setProperty( "MouseInputPropagationEnabled", "true")
         itemLabel:setProperty( "TextColours", "FFFFFFFF" )
         local _, totalCount = getItemsFromClasses( itemName )
         itemLabel:setText( string.format(" %s (%d)", itemName, totalCount) )
         local pos = CEGUI.UVector2( CEGUI.UDim(0,0), CEGUI.UDim(0,19*(i-1)) )
         itemLabel:setPosition( pos )
         itemLabel:subscribeEvent( "MouseClick", cbMapVisualizerItemsClick )
         gameplayUI.mapVisualizer.itemsWnd:addChild( itemLabel )
         i = i + 1
      end
   end

   gameplayUI.mapVisualizer.itemsWnd:setVisible( not gameplayUI.mapVisualizer.itemsWnd:isVisible() )
   gameplayUI.mapVisualizer.classesWnd:setVisible( not gameplayUI.mapVisualizer.classesWnd:isVisible() )
   if gameplayUI.mapVisualizer.itemsWnd:isVisible() then
      gameplayUI.mapVisualizer.itemsWnd:moveToFront()
      gameplayUI.mapVisualizer.classesWnd:moveToFront()
   end
end

local function showItemsOnMap( itemName, state )
   if state then
      --Place items on map
      local items, totalCount = getItemsFromClasses( itemName )

      local text = " " .. itemName .. " (" .. totalCount .. ")"
      gameplayUI.mapVisualizer.itemsWnd:getChild( itemName ):setText( text )

      for i=1,#items do
         local tip = string.format("[font='dialog-10']%s (%d)\n%s", ItemsData.getItemLabel( itemName ), items[i].count, items[i].obj:getName())
         if items[i].obj.getLootTable then
            tip = tip .. "\n--------"
            for name, count in tablex.sort( items[i].obj:getLootTable() ) do
               tip = tip .. "\n" .. name .. " - " .. count
            end
         end
         local image = gameplayUI:mapAddIcon( itemName..i, ItemsData.getItemIcon( itemName ), {40,40}, items[i].obj:getPose():getPos(), tip )
         local counter = image:createChild("TaharezLook/StaticText", "Counter")
         counter:setText( tostring( items[i].count ) )
         counter:setProperty( "Area", "{{0,0},{0.6,0},{1,0},{1,0}}" )
         counter:setProperty( "Font", "dialog-10" )
         counter:setProperty( "FrameEnabled", "false" )
         counter:setProperty( "BackgroundEnabled", "false" )
         counter:setProperty( "MousePassThroughEnabled", "true" )
         counter:setProperty( "MouseInputPropagationEnabled", "true" )
         image:subscribeEvent("MouseClick", cbMapVisualizedIconClick)
         table.insert(gameplayUI.mapVisualizer.itemsIcons[itemName], image)
      end
   else
      for _,iconWnd in ipairs(gameplayUI.mapVisualizer.itemsIcons[itemName]) do
         iconWnd:setVisible( false )
         wndMgr:destroyWindow( iconWnd )
      end
      gameplayUI.mapVisualizer.itemsIcons[itemName] = {}
   end
end

local function showObjsOnMap( className, state )
   if state then
      for i=1,#ClassManager.objByClassesTable[className] do
         local obj = ClassManager.objByClassesTable[className][i]
         local name = obj:getName()
         local tip = string.format( "[font='dialog-10']%s \n%s", name, className )
         if obj.getLootTable then
            tip = tip .. "\n--------"
            for itemName, count in tablex.sort( obj:getLootTable() ) do
               tip = tip .. "\n" .. itemName .. " - " .. count
            end
         end
         local image = gameplayUI:mapAddIcon( obj:getName(), "Empty", {40,40}, obj:getPose():getPos(), tip )
         image:subscribeEvent("MouseClick", cbMapVisualizedIconClick)
         local label = image:createChild("TaharezLook/StaticText", "Label")
         label:setText( string.sub(className, 2, 2) )
         label:setProperty( "Area", "{{0,0},{0,0},{1,0},{1,0}}" )
         label:setProperty( "Font", "decor-8" )
         label:setProperty( "FrameEnabled", "false" )
         label:setProperty( "BackgroundEnabled", "false" )
         label:setProperty( "HorzFormatting", "CentreAligned" )
         label:setProperty( "MousePassThroughEnabled", "true" )
         table.insert(gameplayUI.mapVisualizer.objIcons[className], image)
      end
   else
      for _,iconWnd in ipairs(gameplayUI.mapVisualizer.objIcons[className]) do
         iconWnd:setVisible( false )
         wndMgr:destroyWindow( iconWnd )
      end
      gameplayUI.mapVisualizer.objIcons[className] = {}
   end
end

function cbMapVisualizerClassClick( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   if click_args.button == CEGUI.LeftButton then
      local className = click_args.window:getName()
      if click_args.window:getID() == 0 then
         click_args.window:setID( 1 )
         showObjsOnMap( className, true )
         gameplayUI.mapVisualizer.classesWnd:getChild( className ):setProperty("TextColours", "FF34d4ec" )
      else
         click_args.window:setID( 0 )
         showObjsOnMap( className, false )
         gameplayUI.mapVisualizer.classesWnd:getChild( className ):setProperty("TextColours", "FFFFFFFF" )
      end
   end
end

function cbMapVisualizerItemsClick( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   if click_args.button == CEGUI.LeftButton then
      local itemName = click_args.window:getName()
      if click_args.window:getID() == 0 then
         click_args.window:setID( 1 )
         showItemsOnMap( itemName, true )
         gameplayUI.mapVisualizer.itemsWnd:getChild( itemName ):setProperty("TextColours", "FF34d4ec" )
      else
         click_args.window:setID( 0 )
         showItemsOnMap( itemName, false )
         gameplayUI.mapVisualizer.itemsWnd:getChild( itemName ):setProperty("TextColours", "FFFFFFFF" )
      end
   end
end

function cbMapVisualizerClassCheckboxClick( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   if click_args.button == CEGUI.LeftButton then
      local className = click_args.window:getParent():getName()
      local state = click_args.window:getProperty("Selected") == "true"

      for name,class in pairs(ClassManager.classTable) do
         if ClassManager.getClass( className ) == oo.getsuper(class) then
            gameplayUI.mapVisualizer.classesWnd:getChild( name .. "/Checkbox" ):setProperty( "Selected", tostring(state) )
         end
      end

      for itemName,_ in pairs(ItemsData.ItemsInfo) do
         --Refresh icons
         if gameplayUI.mapVisualizer.itemsWnd:getChild( itemName ):getID() == 1 then
            showItemsOnMap( itemName, false )
            showItemsOnMap( itemName, true )
         else --Only refresh Total counts
            local _, totalCount = getItemsFromClasses( itemName )
            gameplayUI.mapVisualizer.itemsWnd:getChild( itemName ):setText( string.format(" %s (%d)", itemName, totalCount) )
         end
      end
   end
end

function cbMapVisualizedIconClick( args )
   local click_args = CEGUI.toMouseEventArgs( args )
   if click_args.button == CEGUI.LeftButton then
      log("--------------------------")
      log(click_args.window:getProperty("TooltipText"):gsub("%[font=.-%]", ""))
      log("--------------------------")
   end
end

function cbWindowScrollWheel( args )
   local wheel_args = CEGUI.toMouseEventArgs( args )
   local scroll_pos = wheel_args.window:getProperty("VertScrollPosition")
   if wheel_args.wheelChange > 0 then
      scroll_pos = scroll_pos - 0.1
   else
      scroll_pos = scroll_pos + 0.1
   end
   scroll_pos = math.max(0, math.min(1.0, scroll_pos))
   wheel_args.window:setProperty("VertScrollPosition", scroll_pos)
end



function gameplayUI:initDebugGui()
   self.debug.wnd = wndMgr:loadLayoutFromFile( "debug.layout" )
   self.wndGameplay:addChild( self.debug.wnd )
   self.debug.wnd:setVisible(false)

   self.debug.wnd:getChild("Save"):subscribeEvent("MouseClick", cbSaveDebug)
   self.debug.wnd:subscribeEvent( "CloseClicked", cbDebugClose )
   self.debug.wnd:getChild("debugMode/Checkbox"):subscribeEvent("MouseClick", cbDebugMode)
   self.debug.wnd:getChild("godMode/Checkbox"):subscribeEvent("MouseClick", cbDebugGodMode)
   self.debug.wnd:getChild("godSpeed/Checkbox"):subscribeEvent("MouseClick", cbDebugGodSpeed)
   local options = { "dialogSkip", "dialogDebug", "inventory", "keys", "fastLoot", "quest", "plants", }
   for _, option in pairs(options) do
      self.debug.wnd:getChild(option .. "/Checkbox"):subscribeEvent("MouseClick", cbDebugCheckbox)
   end
end

function gameplayUI:showDebugGui( state )
   self.debug.wnd:setVisible( state )

   if ( state ) then
      self:setupDebugGui()
      self:resetCursorPos()
      self:showCursor()
      runTimer(0, nil, function() getScene():pauseGame( true ) end, false)
   else
      getScene():pauseGame( false )
   end
   setUserControl( not state )
end

function gameplayUI:setupDebugGui()
   local debugMode, debugOptions = getDebugMode()
   self.debug.wnd:getChild("debugMode/Checkbox"):setProperty("Selected", tostring(debugMode))
   self.debug.wnd:getChild("godMode/Checkbox"):setProperty("Selected", tostring(getPlayer().god_mode))
   self.debug.wnd:getChild("godSpeed/Checkbox"):setProperty("Selected", tostring(getPlayer().super_speed))
   for option, value in pairs(debugOptions) do
      local checkbox = self.debug.wnd:getChild(option.."/Checkbox")
      if checkbox then
         checkbox:setProperty("Selected", tostring(value))
      end
   end
end

function gameplayUI:isDebugVisible()
   return self.debug.wnd:isVisible()
end

function cbSaveDebug( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      gameplayUI:showInfoTextEx( "Debug Options Saved", "major", "" )
      saveDebug()
   end
end

function cbDebugClose( args )
   gameplayUI:showDebugGui( false )
end

function cbDebugMode( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   local value = string.lower(click_args.window:getProperty("Selected")) == "true"
   setDebugMode(value)
   local options = { "dialogSkip", "dialogDebug", "inventory", "keys", "fastLoot", "quest", "plants", }
   for _, option in pairs(options) do
      gameplayUI.debug.wnd:getChild(option .. "/Checkbox"):setProperty("Disabled", tostring(not value))
   end
   gameplayUI:showInfoTextEx("Debug Mode set " .. tostring(value), "major", "")
end

function cbDebugGodMode( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   local value = string.lower(click_args.window:getProperty("Selected")) == "true"
   getPlayer().god_mode = value
   gameplayUI:showInfoTextEx("God Mode set " .. tostring(value), "major", "")
end

function cbDebugGodSpeed( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   local value = string.lower(click_args.window:getProperty("Selected")) == "true"
   getPlayer().super_speed = value
   gameplayUI:showInfoTextEx("Super Speed set " .. tostring(value), "major", "")
end

function cbDebugCheckbox( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   local option = click_args.window:getParent():getName()
   local value = string.lower(click_args.window:getProperty("Selected")) == "true"
   setDebugMode(option, value)
   gameplayUI:showInfoTextEx(option .. " set " .. tostring(value), "major", "")
end


local function loadStyles()
   local f, err = loadfile( "./gdata/scripts/stylesDump/styles.lua" )
   if err then
      log(err)
      return nil
   end

   local styles = f()

   if ( not styles ) then
      return nil
   end
   return styles
end

local function dumpStyles(styles)
   local formatted = pprint.pformat(styles)

   local file, err = io.open("./gdata/scripts/stylesDump/styles.lua", "w")
   if file then
      io.output(file)
      io.write("return " .. formatted)
      io.close(file)
   else
      log(err)
   end
end

local function saveStyle()
   local styleName = gameplayUI.stylesEditor.editorWnd:getChild("Editbox"):getText()

   if styleName == "" then styleName = gameplayUI.stylesEditor.char:getName() end

   gameplayUI.stylesEditor.char.styleName = styleName
   local style = gameplayUI.stylesEditor.char.style
   local prefab = string.gsub( gameplayUI.stylesEditor.char:getPrefabName(), ".cfg", "" )
   local styles = loadStyles() or {}

   if not styles[prefab] then return end

   styles[prefab][styleName] = { body = style.body, attachments = style.attachments, textures = style.textures }
   dumpStyles(styles)
   if not gameplayUI.stylesEditor.styles["abori_styles"][styleName] and not gameplayUI.stylesEditor.styles["human_male_styles"][styleName] then
      local index = tableSize( gameplayUI.stylesEditor.styles[prefab.."_styles"] ) + 1
      gameplayUI:addStyleToStylesLoader( styleName, prefab.."_styles", index )
   end
end

function gameplayUI:initStylesEditor()
   self.wndGameplay:addChild( wndMgr:loadLayoutFromFile( "stylesEditor.layout" ) )

   self.stylesEditor.wnd = self.wndGameplay:getChild("StylesEditorWindow")
   self.stylesEditor.editorWnd = self.wndGameplay:getChild("StylesEditorWindow/Editor")
   self.stylesEditor.loadStylesWnd = self.wndGameplay:getChild("StylesEditorWindow/LoadStyles")
   self.stylesEditor.loadStylesButton = self.wndGameplay:getChild("StylesEditorWindow/LoadStylesButton")
   self.stylesEditor.loadStylesButton:subscribeEvent( "MouseClick", cbShowLoadStylesWnd)
   self.stylesEditor.attachmentsConfig.wnd = self.stylesEditor.wnd:getChild("AttachmentConfig")
   self.stylesEditor.texturesConfig.wnd = self.stylesEditor.wnd:getChild("TexturesConfig")
   self.stylesEditor.texturesConfig.skin = self.stylesEditor.texturesConfig.wnd:getChild( "Textures/skin/Spinner" )
   self.stylesEditor.texturesConfig.eye_l = self.stylesEditor.texturesConfig.wnd:getChild( "Textures/eye_l/Spinner" )
   self.stylesEditor.texturesConfig.eye_r = self.stylesEditor.texturesConfig.wnd:getChild( "Textures/eye_r/Spinner" )
   self.stylesEditor.texturesConfig.skin:subscribeEvent( "ValueChanged", cbTextureConfigChanged )
   self.stylesEditor.texturesConfig.eye_l:subscribeEvent( "ValueChanged", cbTextureConfigChanged )
   self.stylesEditor.texturesConfig.eye_r:subscribeEvent( "ValueChanged", cbTextureConfigChanged )

   self.stylesEditor.editorWnd:getChild("__auto_closebutton__"):subscribeEvent("MouseClick", cbStylesEditorClosed)
   self.stylesEditor.wnd:setVisible( false )
   self.stylesEditor.editorWnd:setVisible( false )
   self.stylesEditor.loadStylesButton:setVisible( false )
   self.stylesEditor.loadStylesWnd:setVisible( false )
   self.stylesEditor.attachmentsConfig.wnd:setVisible( false )

   local names = { "pos", "rot", "scale"}
   for _, v in pairs(names) do
      local mainLabel = self.stylesEditor.attachmentsConfig.wnd:getChild(v)
      for _, val in pairs({"xLabel", "yLabel", "zLabel"}) do
         local label = mainLabel:getChild( val )
         for i=1,4 do
            label:getChild("Button"..i):subscribeEvent("MouseClick", cbAttachmentConfigClick)
         end
      end
   end

   self.stylesEditor.styles = { human_male_styles = {}, abori_styles = {}, hulk_styles = {} }
   self.stylesEditor.AboriWindows = {}
   self.stylesEditor.HumaWindows = {}
   self.stylesEditor.HulkWindows = {}
   self.stylesEditor.AttachmentsWindows = {}

   self.stylesEditor.Abori = getFolderElements("\\gdata\\characters\\people\\abori\\*.cmf", false, true)
   self.stylesEditor.Huma = getFolderElements("\\gdata\\characters\\people\\human_male\\*.cmf", false, true)
   self.stylesEditor.Hulk = getFolderElements("\\gdata\\characters\\people\\hulk\\*.cmf", false, true)
   self.stylesEditor.attachments = getFolderElements("\\gdata\\objects\\hats\\*.sbg", false, true)

   for index, meshName in pairs(self.stylesEditor.Huma) do
      self:addMeshToStylesEditor( "HumaMeshList", meshName, index )
   end

   for index, meshName in pairs(self.stylesEditor.Abori) do
      self:addMeshToStylesEditor( "AboriMeshList", meshName, index )
   end

   for index, meshName in pairs(self.stylesEditor.Hulk) do
      self:addMeshToStylesEditor( "HulkMeshList", meshName, index )
   end

   for index, meshName in pairs(self.stylesEditor.attachments) do
      self:addMeshToStylesEditor( "AttachmentsMeshList", meshName, index )
   end

   local stylesDump = loadStyles() or {human_male={}, abori={}}

   local index = 0
   for styleName in tablex.sort(Appearance.Style.human_male) do
      index = index + 1
      self:addStyleToStylesLoader( styleName, "human_male_styles", index )
   end
   for styleName in tablex.sort(stylesDump.human_male) do
      index = index + 1
      self:addStyleToStylesLoader( styleName, "human_male_styles", index )
   end
   index = 0
   for styleName in tablex.sort(Appearance.Style.abori) do
      index = index + 1
      self:addStyleToStylesLoader( styleName, "abori_styles", index )
   end
   for styleName in tablex.sort(stylesDump.abori) do
      index = index + 1
      self:addStyleToStylesLoader( styleName, "abori_styles", index )
   end
   index = 0
   for styleName in tablex.sort(Appearance.Style.hulk) do
      index = index + 1
      self:addStyleToStylesLoader( styleName, "hulk_styles", index )
   end
   for styleName in tablex.sort(stylesDump.hulk) do
      index = index + 1
      self:addStyleToStylesLoader( styleName, "hulk_styles", index )
   end
end

function gameplayUI:addMeshToStylesEditor( meshListName, meshName, index )
   local text = meshName:gsub(".cmf", "")
   local meshWnd = self.stylesEditor.editorWnd:getChild( meshListName ):createChild( "TaharezLook/StaticText", text )
   meshWnd:setFont("dialog-8")
   local posScale = 0.05
   local posIndex = index
   meshWnd:setPosition( CEGUI.UVector2(CEGUI.UDim(posScale,0), CEGUI.UDim(0.0,14*(posIndex-1)) ) )
   meshWnd:setSize    ( CEGUI.USize   (CEGUI.UDim(0.92,0), CEGUI.UDim(0.0,14) ) )
   meshWnd:setText    ( text )
   meshWnd:subscribeEvent( "MouseClick", cbStylesEditorMeshClick )
   meshWnd:setProperty( "FrameEnabled", "False" )
   meshWnd:setProperty( "BackgroundEnabled", "False" )
   meshWnd:setProperty( "MouseInputPropagationEnabled", "true" )
   meshWnd.selected = false
   local str = meshListName:gsub("MeshList", "")
   self.stylesEditor[str.."Windows"][index] = meshWnd
end

function gameplayUI:addStyleToStylesLoader( styleName, stylesWndName, index )
   local meshWnd = self.stylesEditor.loadStylesWnd:getChild( stylesWndName ):getChild( styleName )
   if not meshWnd then
      meshWnd = self.stylesEditor.loadStylesWnd:getChild( stylesWndName ):createChild( "TaharezLook/StaticText", styleName )
   end
   meshWnd:setFont("dialog-8")
   local posScale = 0.05
   local posIndex = index
   if index > 40 then
      posScale = 0.55
      posIndex = posIndex - 40
   end
   meshWnd:setPosition( CEGUI.UVector2(CEGUI.UDim(posScale,0), CEGUI.UDim(0.0,14*(posIndex-1)) ) )
   meshWnd:setSize    ( CEGUI.USize   (CEGUI.UDim(0.45,0), CEGUI.UDim(0.0,14) ) )
   meshWnd:setText    ( styleName )
   meshWnd:subscribeEvent( "MouseClick", cbStylesLoaderStyleClick )
   meshWnd:setProperty( "FrameEnabled", "False" )
   meshWnd:setProperty( "BackgroundEnabled", "False" )
   meshWnd:setProperty( "MouseInputPropagationEnabled", "true" )

   self.stylesEditor.styles[stylesWndName][styleName] = meshWnd
end

function gameplayUI:setupStylesEditor( char )
   if not self.stylesEditor.wnd then
      gameplayUI:initStylesEditor()
   end

   self.stylesEditor.char = char
   self.stylesEditor.charMeshTextureMap = MeshTextureMapping.getCharacterMeshTextureMap( char )

   --Remove previous selections
   for _,wndSetName in pairs( {"HumaWindows", "AboriWindows", "HulkWindows", "AttachmentsWindows",} ) do
      for i=1, #self.stylesEditor[wndSetName] do
         self.stylesEditor[wndSetName][i]:setProperty( "TextColours", "FFFFFFFF")
         self.stylesEditor[wndSetName][i].selected = false
      end
   end

   local function showVisibleMeshes( meshList )
      for i=1, #meshList do
         local meshWnd = meshList[i]
         local meshWndText = meshList[i]:getText()
         if tablex.search(char.style.body, meshWndText) then
            meshWnd:setProperty( "TextColours", "FF34d4ec")
            meshWnd.selected = true
         end
      end
   end

   local function showVisibleAttachments()
      for i=1, #self.stylesEditor.AttachmentsWindows do
         local meshWnd = self.stylesEditor.AttachmentsWindows[i]
         local meshWndText = self.stylesEditor.AttachmentsWindows[i]:getText()
         if tablex.search(char.style.attachments, meshWndText) then
            meshWnd:setProperty( "TextColours", "FF34d4ec")
            meshWnd.selected = true
         end
      end
   end

   if tablex.size(self.stylesEditor.charMeshTextureMap) > 0 then
      gameplayUI:showTextureConfig( true )
   else
      gameplayUI:showTextureConfig( false )
   end

   self.stylesEditor.editorWnd:getChild("HumaMeshList"):setVisible(false)
   self.stylesEditor.editorWnd:getChild("AboriMeshList"):setVisible(false)
   self.stylesEditor.editorWnd:getChild("HulkMeshList"):setVisible(false)
   self.stylesEditor.loadStylesWnd:getChild("human_male_styles"):setVisible(false)
   self.stylesEditor.loadStylesWnd:getChild("abori_styles"):setVisible(false)
   self.stylesEditor.loadStylesWnd:getChild("hulk_styles"):setVisible(false)
   --Setup needed windows
   if char:getPrefabName() == "human_male.cfg" then
      self.stylesEditor.editorWnd:getChild("HumaMeshList"):setVisible(true)
      self.stylesEditor.loadStylesWnd:getChild("human_male_styles"):setVisible(true)
      showVisibleMeshes( self.stylesEditor.HumaWindows )
   elseif char:getPrefabName() == "abori.cfg" then
      self.stylesEditor.editorWnd:getChild("AboriMeshList"):setVisible(true)
      self.stylesEditor.loadStylesWnd:getChild("abori_styles"):setVisible(true)
      showVisibleMeshes( self.stylesEditor.AboriWindows )
      self.stylesEditor.texturesConfig.skin:setProperty( "MaximumValue", tostring( MeshTextureMapping.getTextureCount( char, "skin" ) ) )
   elseif char:getPrefabName() == "hulk.cfg" then
      self.stylesEditor.editorWnd:getChild("HulkMeshList"):setVisible(true)
      self.stylesEditor.loadStylesWnd:getChild("hulk_styles"):setVisible(true)
      showVisibleMeshes( self.stylesEditor.HulkWindows )
      self.stylesEditor.texturesConfig.skin:setProperty( "MaximumValue", tostring( MeshTextureMapping.getTextureCount( char, "skin" ) ) )
   end
   showVisibleAttachments()

   self:showStylesEditor( true )
end

function gameplayUI:showStylesEditor( state )
   if state then
      setUserControl( false )
      self:showCursor()
   else
      setUserControl( true )
      self:hideCursor()
      self.stylesEditor.loadStylesWnd:setVisible( false )
      self.stylesEditor.char = nil
   end
   self.stylesEditor.wnd:setVisible( state )
   self.stylesEditor.editorWnd:setVisible( state )
   self.stylesEditor.loadStylesButton:setVisible( state )
   gameplayUI:showAttachmentsConfig( false, nil )
end

function gameplayUI:showAttachmentsConfig( state, meshName )
   if state and meshName then
      self:setupAttachmentsConfig( meshName )
      self.stylesEditor.attachmentsConfig.wnd:setVisible( true )
   else
      self.stylesEditor.attachmentsConfig.wnd:setVisible( false )
   end
end

function gameplayUI:showTextureConfig( state )
   if state then
      self.stylesEditor.texturesConfig.wnd:setVisible( true )
      self.stylesEditor.texturesConfig.skin:setProperty( "CurrentValue", 1 )
      self.stylesEditor.texturesConfig.eye_l:setProperty( "CurrentValue", 1 )
      self.stylesEditor.texturesConfig.eye_r:setProperty( "CurrentValue", 1 )
      for wndName,textureID in pairs(self.stylesEditor.char.style.textures) do
         if self.stylesEditor.texturesConfig[wndName] then
            self.stylesEditor.texturesConfig[wndName]:setProperty( "CurrentValue", textureID )
         end
      end
   else
      self.stylesEditor.texturesConfig.wnd:setVisible( false )
   end
end

function gameplayUI:setupAttachmentsConfig( meshName )
   self.stylesEditor.attachmentsConfig.meshName = meshName
   local attachment
   for _, v in pairs(gameplayUI.stylesEditor.char.style.attachments) do
      if v.name == meshName then
         attachment = v
      end
   end
   local names = { "pos", "rot", "scale"}
   for _, v in pairs(names) do
      local mainLabel = self.stylesEditor.attachmentsConfig.wnd:getChild(v)
      for key, val in pairs(attachment[v]) do
         local label = mainLabel:getChild( key .. "Label" )
         label:setText( key .. " = " .. val )
      end
   end
end

function cbTextureConfigChanged( args )
   if not gameplayUI:isStylesEditorVisible() then return end
   local char = gameplayUI.stylesEditor.char
   local click_args = CEGUI.toMouseEventArgs(args)
   local textureID = tonumber( click_args.window:getText() )
   local wndName = click_args.window:getParent():getName()
   char.style.textures[wndName] = textureID

   saveStyle()
   char:setupAppearance( char.styleName )
end

function cbAttachmentConfigClick( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   local name = click_args.window:getName()
   local coord = click_args.window:getParent():getName():gsub("Label", "")
   local coordName = click_args.window:getParent():getParent():getName()
   local delta1 = 1
   local delta2 = 10
   if coordName == "scale" then
      delta1 = 0.01
      delta2 = 0.1
   end

   local attachments = tableDeepCopy( gameplayUI.stylesEditor.char.style.attachments )
   local index
   for k, v in pairs(attachments) do
      if v.name == gameplayUI.stylesEditor.attachmentsConfig.meshName then
         index = k
      end
   end

   gameplayUI.stylesEditor.char:removeAccessory( attachments )
   if name == "Button1" then
      attachments[index][coordName][coord] = attachments[index][coordName][coord] - delta2
   elseif name == "Button2" then
      attachments[index][coordName][coord] = attachments[index][coordName][coord] - delta1
   elseif name == "Button3" then
      attachments[index][coordName][coord] = attachments[index][coordName][coord] + delta1
   elseif name == "Button4" then
      attachments[index][coordName][coord] = attachments[index][coordName][coord] + delta2
   end
   gameplayUI.stylesEditor.char:setupAccessory( attachments )
   saveStyle()
   gameplayUI:setupAttachmentsConfig( gameplayUI.stylesEditor.attachmentsConfig.meshName )
end

function gameplayUI:isStylesEditorVisible()
   return self.stylesEditor.wnd and self.stylesEditor.editorWnd:isVisible()
end

function cbStylesEditorClosed( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.button == CEGUI.LeftButton then
      gameplayUI:showStylesEditor( false )
   end
end

function cbStylesLoaderStyleClick( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   if click_args.window and click_args.button == CEGUI.LeftButton then
      local styleName = click_args.window:getText()
      local char = gameplayUI.stylesEditor.char
      if char then
         char:setupAppearance( styleName )
         gameplayUI:setupStylesEditor( char )
      end
   end
end

function cbStylesEditorMeshClick( args )
   local click_args = CEGUI.toMouseEventArgs(args)
   local meshName = click_args.window:getText()
   if click_args.button == CEGUI.LeftButton then
      if gameplayUI.stylesEditor.char then
         if click_args.window.selected then
            click_args.window.selected = false
            click_args.window:setProperty( "TextColours", "FFFFFFFF")
            removeMesh( meshName )
         else
            click_args.window.selected = true
            click_args.window:setProperty( "TextColours", "FF34d4ec")
            addMesh( meshName )
         end

         saveStyle()
         gameplayUI.stylesEditor.char:setupAppearance( gameplayUI.stylesEditor.char.styleName )
      end
   elseif click_args.button == CEGUI.RightButton then
      if click_args.window.selected then
         if inList( gameplayUI.stylesEditor.attachments, meshName ) then
            gameplayUI:showAttachmentsConfig( true, meshName )
         end
      end
   end
end

function cbShowLoadStylesWnd( args )
   gameplayUI.stylesEditor.loadStylesWnd:setVisible( not gameplayUI.stylesEditor.loadStylesWnd:isVisible() )
end

function addMesh( meshName )
   local char = gameplayUI.stylesEditor.char
   if string.find(meshName, ".sbg") then
      table.insert(char.style.attachments, { bone = "head_slot", name = meshName, pos = {x=0,y=0,z=0}, rot = {x=0,y=0,z=0}, scale = {x=1,y=1,z=1}, } )
      gameplayUI:showAttachmentsConfig( true, meshName )
   else
      table.insert(char.style.body, {meshName})
      gameplayUI:showAttachmentsConfig( false, nil )
   end
end

function removeMesh( meshName )
   local char = gameplayUI.stylesEditor.char
   if string.find(meshName, ".sbg") then
      for k,v in pairs(char.style.attachments) do
         if v.name == meshName then
            table.remove(char.style.attachments, k)
            break
         end
      end
   else
      for k,v in ipairs(char.style.body) do
         for key,val in ipairs(v) do
            if val == meshName then
               table.remove(char.style.body[k], key)
               if #char.style.body[k] == 0 then
                  table.remove(char.style.body, k)
               end
               break
            end
         end
      end
   end
   gameplayUI:showAttachmentsConfig( false, nil )
end
