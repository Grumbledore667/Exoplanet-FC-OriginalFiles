local oo = require "loop.simple"

local CCamManager = (require "scenes.camManager").CCamManager
local CTextManager = (require "scenes.textManager").CTextManager
local CMusicManager = (require "scenes.musicManager").CMusicManager
local WeatherSystem = (require "environment.weather").WeatherSystem
local SkySystem = (require "environment.sky").SkySystem
local stringx = require "pl.stringx"
local tablex = require "pl.tablex"
local ItemsData = require "itemsData"
local Appearance = require "appearance"
local NpcData = require "npcData"

local GUIUtils = require "ui.utils"

---@class CScene : shScene
local CScene = oo.class(
   {
      m_camManager = nil,
      m_textManager = nil,
      m_musicManager = nil,
      m_breakBrushes = nil,
      m_playerDetectedChars = nil,
      m_breakBrushSubscribers = nil,
      m_checkpoints = nil,
      loadedGame = false,
      callbacksEnter = nil,
      callbacksFirstFrame = nil,
      MCAmbient = "canyon",
      currentAmbient = "canyon",
      ambientAspect = nil,
      autoSaveTimer = nil
   }
)

function CScene:OnControlDown(code)
   local options = require "ui.menu.options" --CEGUI is initialized after this file
   local guiContext = CEGUI.System:getSingleton():getDefaultGUIContext()


   if code == getButtonCode("CONSOLE") then -- `(~)
      if gameplayUI:isConsoleVisible() then
         gameplayUI:hideConsole()
      else
         gameplayUI:showConsole()
      end

   elseif code == getButtonCode("ESCAPE") then
      if GUIUtils.tryDestroyDynamicWindows() or GUIUtils.tryCloseInteractiveWindow() then return end

      if guiContext:getRootWindow() and guiContext:getRootWindow():getName() == gameplayUI.wndOptions:getName() then
         options.optionsToMenu()
      elseif guiContext:getRootWindow() and guiContext:getRootWindow():getName() == gameplayUI.wndSaveLoad:getName() then
         backToPauseMenu()
      else
         checkPause()
      end
   end

   --Only works during gameplay, not in pause/main menu
   if not gameplayUI:isGameplayRootWindow() or gameplayUI:editBoxHasFocus() then return end

   if code == getButtonCode("FEEDBACK") then
      gameplayUI.feedbackUI:show(not gameplayUI.feedbackUI:isVisible())
   elseif code == getButtonCode("SAVE") and isSavingEnabled() then
      log("saved")
      saveGameSafe("quicksave")
   elseif code == getButtonCode("LOAD") and not isEditor() then
      initSavegamesList(gameplayUI.wndSaveLoad:getChild("Savegames"))
      loadSaveVersionCheck(getSaveIDByName("quicksave"), true)

   elseif code == getButtonCode("PERIOD") and isDebug("keys") then
      WeatherSystem:changeTimeRate(50)
      SkySystem:changeTimeRate(50)

   elseif code == getButtonCode("COMMA") and isDebug("keys") then
      WeatherSystem:changeTimeRate(-50)
      SkySystem:changeTimeRate(-50)

   elseif code == getButtonCode("K") and (isEditor() or isDebug("keys")) then
      local p = getPlayer()
      if p then
         p:getPose():setPos(vec3Add(p:getPose():getPos(), vec3Mul(p:getDirTarget(), 500)))

         -- reset falling momentum
         local mass = p:getMassCoeff()
         p:setMassCoeff(0)
         runTimerAdv(0, false, p.setMassCoeff, p, mass)
      end

   elseif code == getButtonCode("F8") and (isEditor() or isDebug("keys")) then
      local p = getPlayer()
      if p then
         if p.deathTimer then
            p.deathTimer:stop()
            p.deathTimer = nil
            GUIUtils.tryDestroyDynamicWindows()
         end
         p:setStatCount("health", p:getStatCount("healthMax"))
         p:setState("dead", false)
         p:createTree(p.aiTree)
         p:setupTimers(p.defaultTimerFrequency)
         p.animationsManager:stopActionsAndCycles()
         p:getPose():setPos(vec3Add(p:getPose():getPos(), vec3Mul(vec3Normalize(vec3Add(p:getDirTarget(), {y=1})), 500)))

         -- reset falling momentum
         local mass = p:getMassCoeff()
         p:setMassCoeff(0)
         runTimerAdv(0, false, p.setMassCoeff, p, mass)
      end
   elseif code == getButtonCode("TOGGLEUI") then
      if gameplayUI.wndGameplay:isVisible() then
         gameplayUI.wndGameplay:hide()
      else
         gameplayUI.wndGameplay:show()
         gameplayUI.wndGameplay:activate()
      end

   elseif code == getButtonCode("NPCEDITOR") and (isDebug("keys")) then
      local focusObj = gameplayUI:getFocusObj()
      if gameplayUI.npcEditorUI:isVisible() then
         gameplayUI.npcEditorUI:show(false)
      elseif focusObj then
         gameplayUI.npcEditorUI:show(true, focusObj)
      end

   elseif code == getButtonCode("LEFT") and gameplayUI.gameplayMenuUI:isVisible() then
      gameplayUI.gameplayMenuUI:scrollTabs(false)
   elseif code == getButtonCode("RIGHT") and gameplayUI.gameplayMenuUI:isVisible() then
      gameplayUI.gameplayMenuUI:scrollTabs(true)
   end
end

function CScene:OnControlUp(code)
   if gameplayUI:isConsoleVisible() then
      return
   end
end

function CScene:isLoadedGame()
   return self.loadedGame
end

function CScene:OnLocationInit()
   setScene(self)

   self.loadedGame = isLoadingGame()

   local runTimerEngine = _G.runTimer
   --local runTimerEngineExt = _G.runTimerExt

   local timer = require "timer"
   local default = timer.getDefaultTimerManager()

   runTimerEngine(0, nil, function()
      default:updateTimers(getFrameTime())
   end, true)

   _G.runTimer    = timer.runTimerLegacyFormat
   _G.runTimerExt = timer.runTimerLegacyFormat
   _G.runTimerAdv = timer.runTimer

   self.m_breakBrushes = {}
   self.m_playerDetectedChars = {}

   self.m_camManager = CCamManager{ m_scene = self }
   self.m_textManager = CTextManager{ m_scene = self }
   self.m_musicManager = CMusicManager{ m_scene = self }

   self.m_camManager:init()
   self.m_textManager:init()
   self.m_musicManager:init()

   self.callbacksEnter = {}
   self.callbacksFirstFrame = {}

   ItemsData.validateItemsTemplates()

   runTimer(0, self, self.performOnFirstFrameCallbacks, false)
end

-- called after all objects are created and registered by name
function CScene:subscribeOnLocationEnter(func, ...)
   if not self.callbacksEnter then
      runTimerAdv(0, false, func, ...)
      return
   end
   local callback = {func=func, args=table.pack(...)}
   table.insert(self.callbacksEnter, callback)
end

-- called after all objects' OnLoadState finished
function CScene:subscribeOnFirstFrame(func, ...)
   if not self.callbacksFirstFrame then
      runTimerAdv(0, false, func, ...)
      return
   end
   local callback = {func=func, args=table.pack(...)}
   table.insert(self.callbacksFirstFrame, callback)
end

function CScene:performOnLocationEnterCallbacks()
   for _, callback in ipairs(self.callbacksEnter) do
      pcall(callback.func, unpack(callback.args))
   end
   self.callbacksEnter = nil
end

function CScene:performOnFirstFrameCallbacks()
   for _, callback in ipairs(self.callbacksFirstFrame) do
      pcall(callback.func, unpack(callback.args))
   end
   self.callbacksFirstFrame = nil
end

function CScene:OnLocationEnter()
   setPlayer(getMC())
   self.m_camManager:setCamPlayer()
   self.m_musicManager:setShuffle(true)
   self.m_musicManager:setDefaultTheme("idle")
   initLocationEnterUI()

   if getObj("start_trigger", true) and not (getScene():isLoadedGame() or getPersistentTable().optionalLoading or isDebug() or isEditor()) then
      blockUserControl()
   end

   SkySystem:init()
   WeatherSystem:init()
   runTimer(0.05, nil, function()
      SkySystem:update    (0.05)
      WeatherSystem:update(0.05)
   end, true)
   --[[
   snow_0:getPose():setParent(getPlayer():getPose())
   snow_0:getPose():resetLocalPose()
   snow_0:getPose():setLocalRot({x=180,y=90,z=0,})
   snow_0:getPose():setLocalPos({x=0,y=1000,z=0,})
   ]]

   --self:playIntro()
   self:performOnLocationEnterCallbacks()
   self:loadFromPersistentData()

   --Allows appearance module to reload the style tables before each getStyleFor in debug mode
   if isDebug() then
      Appearance.setDebugDataReload(true)
      NpcData.setDebugDataReload(true)
   end

   self:startAmbient()
end

function CScene:playIntro()
   log("playIntro")
   -- Character_0:execAnimSingle("intro", false)

   --[[Camera_0:setFile(".\\gdata\\cameras\\intro.sca")
   Camera_0:playAnimation("intro")
   activateCamera(Camera_0)]]
end

function CScene:OnLocationExit()
   setPlayer(getMC())
   self.m_musicManager:stopMusic()
end


function CScene:OnBreakBrush(brush)
   table.insert(self.m_breakBrushes, brush)
   if not self.m_breakBrushSubscribers then
      return
   end
   for key in pairs(self.m_breakBrushSubscribers) do
      local obj = self.m_breakBrushSubscribers[key]
      obj.onBreakBrush(obj, brush)
   end
end


function CScene:addBreakBrushSubscriber(obj)
   if not self.m_breakBrushSubscribers then
      self.m_breakBrushSubscribers = {}
   end
   table.insert(self.m_breakBrushSubscribers, obj)
end


function CScene:addCheckpoint(checkpoint)
   self.m_checkpoints = checkpoint
end

function CScene:OnSkipMovie()
end

function CScene:OnTrackEnd()
   self.m_musicManager:OnTrackEnd()
end

function CScene:onCharDie(char)
   if char == getPlayer() then
      runTimer(5, self, self.failedLevel, false)
   end
end

function CScene:onPlayerDetected(char, value)
   local index = getKeyByValue(self.m_playerDetectedChars, char)
   if value then
      if not index then
         table.insert(self.m_playerDetectedChars, char)
      end
   else
      if index then
         table.remove(self.m_playerDetectedChars, index)
      end
   end
   --[[
   if (table.getn(self.m_playerDetectedChars) > 0) then
      self.m_musicManager:playBattleTheme()
   else
      self.m_musicManager:stopBattleTheme()
   end]]
end

function CScene:completeLevel()
   self:endGame(1)
end


function CScene:failedLevel()
--[[
   if (not self.m_checkpoints) then
      self:endGame(0)
   else
      getPlayer():setCameraHeight(getDefaultPlayerCameraHeight(), 0)
      getPlayer():setCameraDist  (getDefaultPlayerCameraDistance(), 0)
      getPlayer():setCameraFov   (getDefaultPlayerCameraFov(), 0)
      getPlayer():respawn()
      --changeObjectPos(player, self.m_checkpoints)
   end
]]
end


--TODO:FIXME: get proper engine scene API
function CScene:startAmbient()
   local MC = getMC()
   if MC then
      if not self.ambientAspect then
         self.ambientAspect = MC:createAspect("Play_ambient")
      end
      self.ambientAspect:play()
   end
end

function CScene:playAmbient(name, char)
   if char == getMC() then
      self.MCAmbient = name
   end
   self.currentAmbient = name
   getPlayer():playSound("Set_State_" .. name)
end

---Allows to get back to actual ambient after remote bug control
function CScene:restoreAmbientForMC()
   self:playAmbient(self.MCAmbient, getMC())
end


function CScene:endGame(value)
   self:exitLocation(value)
end


function CScene:isBroken(brush)
   for key in pairs(self.m_breakBrushes) do
      if brush == self.m_breakBrushes[key] then
         return true
      end
   end
   return false
end

function CScene:OnSaveState(state)
   gameplayUI:showInfoTextEx("Game saved", "major", "")
   local quests_states = {}
   for k,v in pairs(quests) do
      if v.startNode then
         local newQuestState = {}
         if v.OnSaveState then
            v:OnSaveState(newQuestState)
            quests_states[k] = newQuestState
         end
      elseif v.activeStep then
         local qs = {}
         qs["activeStepName"] = v.activeStep.name
         local qsteps = {}
         local qrest = {}
         for k2,node in pairs(v.nodes) do
            if node.type == "step" and node.status then
               qsteps[node.name] = node.status
            else
               qrest[node.ID] = node.enabled
            end
         end
         qs["steps"] = qsteps
         qs["rest"] = qrest
         if v.log ~= "" then
            qs["log"] = v.log
         end

         --from CQuest:goToStepTimer
         if v.stepTimers and #v.stepTimers > 0 then
            qs["stepTimers"] = {}
            for _,params in ipairs(v.stepTimers) do
               table.insert(qs["stepTimers"], {step_name = params.step_name, timeLeft = params.timer:getTimeLeft(), silent = params.silent})
            end
         end
         --from CQuest:goToStepAtDayState
         if v.dayStateCbParams and #v.dayStateCbParams > 0 then
            qs["dayStateCbParams"] = {}
            for _, params in ipairs(v.dayStateCbParams) do
               --Exclude subscribeDayStateChange callback and name from params table
               table.insert(qs["dayStateCbParams"], {dayState = params.dayState, stepName = params.stepName, waitCount = params.waitCount})
            end
         end
         qs["hidden"] = v.hidden
         qs["tracked"] = v.tracked
         quests_states[k] = qs
         qs.scriptState = {}
         if v.OnSaveState then
            v:OnSaveState(qs.scriptState)
         end
      end
   end
   state.quests = quests_states

   --music
   state.music = {}
   self.m_musicManager:OnSaveState(state.music)

   --sky
   local sky = {}
   SkySystem:OnSaveState(sky)
   state.sky = sky

   --weather
   local weather = {}
   WeatherSystem:OnSaveState(weather)
   -- log("MUCH WEATHER DATA " .. tostring(weather))
   state.weather = weather
   state.currentAmbient = self.currentAmbient
   state.MCAmbient = self.MCAmbient
end

function CScene:OnLoadState(state)
   gameplayUI:showInfoTextEx("Game loaded", "major", "")
   if state.quests then
      for k,v in pairs(state.quests) do
         local q = getQuest(k)
         if q and q.new then
            if q.OnLoadState then
               self:subscribeOnFirstFrame(function()
                  local status, err = pcall(q.OnLoadState, q, v)
                  if not status then
                     log(string.format("ERROR while executing %s's OnLoadState:", q.name))
                     log(err)
                  end
               end)
            end
         elseif q then
            -- set active step
            if v.activeStepName then
               local activeStep = q:getStep(v.activeStepName)
               if activeStep then
                  q.activeStep = activeStep
                  q:setupQuestMarkers(true)
               end
            end
            -- set step states
            if v.steps then
               for k2,v2 in pairs(v.steps) do
                  local step = q:getStep(k2)
                  if step then
                     step.status = v2
                  end
               end
            end
            -- set conditions states
            if v.rest then
               for id,en in pairs(v.rest) do
                  local node = questSystem:findReference(q.nodes, id)
                  if node and en ~= nil then
                     node.enabled = en
                  end
               end
            end
            -- set quest log
            if v.log then
               q.log = v.log
            end

            if v.stepTimers then
               for _,params in ipairs(v.stepTimers) do
                  q:goToStepTimer(params.step_name, params.timeLeft, params.silent)
               end
            end
            if v.dayStateCbParams then
               for _,params in ipairs(v.dayStateCbParams) do
                  q:goToStepAtDayState(params.dayState, params.stepName, params.waitCount)
               end
            end

            if v.hidden ~= nil then
               q.hidden = v.hidden
            end
            if v.tracked ~= nil then
               q:setTracked(v.tracked)
            end
            if q.OnLoadState then
               local status, err = pcall(q.OnLoadState, q, v.scriptState)
               if not status then
                  log(string.format("ERROR while executing %s's OnLoadState:", q.name))
                  log(err)
               end
            end
         end
      end
   end

   --music
   if state.music then
      self.m_musicManager:OnLoadState(state.music)
   end

   --sky
   if state.sky ~= nil then
      SkySystem:OnLoadState(state.sky)
   end

   --weather
   if state.weather then
      WeatherSystem:OnLoadState(state.weather)
   end

   if state.MCAmbient then
      self.MCAmbient = state.MCAmbient
   end
   if state.currentAmbient then
      self:playAmbient(state.currentAmbient, getPlayer())
   end
end

--Load game state with params previously set in persistent data
function CScene:loadFromPersistentData()
   local options = tablex.deepcopy(getPersistentTable()).optionalLoading
   addToPersistentTable("optionalLoading", nil)

   if options then
      log(string.format("WARNING: Loading from an older save %s", options.saveName))
      local saveRetriever, err = loadfile(getSavegamesFolder() .. "/" .. options.saveName .. ".sav")
      if err then
         log(err)
         return
      end

      local saveData = saveRetriever()

      local playerStatus, playerState = pcall(function() return saveData.Characters.jack_sharp end)
      if playerStatus and playerState then
         local invDumpContainer = getObj("jack_crash_chest")
         local placeInvToContainer = false

         local player = getMC()
         player.setupInProgress = true
         log("Optional Loading:")
         local playerPosStatus
         if options.playerPosition then
            playerPosStatus = pcall(function()
               log("- Player Position")
               local pos = {x=playerState.pose_12, y=playerState.pose_13, z=playerState.pose_14}
               player:getPose():setPos(pos)
            end)
            if not playerPosStatus then
               log("Couldn't load player position")
            end
         end
         if (not options.playerPosition or not playerPosStatus) and invDumpContainer then
            placeInvToContainer = true
         end

         pcall(function()
            if options.level then
               log("- Levels")
               player:addLevels(playerState.scriptState.level - 1, true)
               if options.attributePoints then
                  log("- Attribute Points")
                  for statName, timesUpgraded in pairs(playerState.scriptState.assignedAttributes) do
                     --Means old save with badly named statNames
                     if stringx.startswith(statName, "Max") then
                        statName = statName:gsub("Max", "")
                        statName = statName:lower() .. "Max"
                     end
                     for i=1,timesUpgraded do
                        player:upgradeStat(statName)
                     end
                  end
               end
            end
         end)

         if options.inventory then
            --Delay item creation - because creation of large amounts of colliders could crash the game at the start
            runTimer(0.5, nil, function()
               local inventory
               if placeInvToContainer then
                  inventory = invDumpContainer:getInventory()
                  pcall(function()
                     log("- Dump Inventory To Container")
                     for _,itemTable in pairs(playerState.scriptState.inventory) do
                        --Exclude quest items
                        if not ItemsData.isItemQuestItem(itemTable.name) then
                           pcall(inventory.loadItemState, inventory, itemTable)
                        end
                     end
                     invDumpContainer:getInventory():destroyItemByName("hand_to_hand.wpn")
                     invDumpContainer:getInventory():destroyItemByName("scanner.itm")
                     invDumpContainer:getInventory():destroyItemByName("scanner_broken.itm")
                  end)
               else
                  inventory = player:getInventory()
                  pcall(function()
                     log("- Inventory")
                     inventory:destroyAllItems(true)
                     for _,itemTable in pairs(playerState.scriptState.inventory) do
                        --Exclude quest items, except scanner item
                        if not ItemsData.isItemQuestItem(itemTable.name) or itemTable.name == "scanner_broken.itm" or itemTable.name == "scanner.itm"
                           or itemTable.name == "hand_to_hand.wpn" then
                           pcall(inventory.loadItemState, inventory, itemTable)
                        end
                     end

                     if inventory:getItemByName("scanner_broken.itm") then
                        startQuest("broken_scanner")
                     end
                  end)
               end
               player.setupInProgress = false
            end, false)
         else
            player.setupInProgress = false
         end
      else
         log("Could not load player script state:")
         if playerState then
            log(playerState)
         else
            log("Could not find valid jack_sharp entry in savegame Characters table")
         end
      end

      if options.fastTravel then
         local q = getQuest("travel")
         q.hidden = true
         pcall(function()
            log("- Fast Travel")
            local ftData = saveData.Story.globals.fast_travel_destinations
            if ftData then
               for name, objState in pairs(ftData) do
                  if objState.discovered or objState.activated then --Supports legacy parameter 'activated'
                     local obj = getObj(name)
                     if obj and obj.__discover then
                        obj:__discover()
                        if not q:isStarted() then
                           q:startImediate()
                        end
                        q:writeLog("%s", obj.prettyName)
                     end
                  end
               end
            end
         end)
         q.hidden = false
      end
   end
end

function CScene:tryAutoSave()
   if isSavingEnabled() then
      if self.autoSaveTimer then
         self.autoSaveTimer:stop()
         self.autoSaveTimer = nil
      end
      log("Auto saved")
      saveGameSafe("autosave")
   elseif not self.autoSaveTimer then
      self.autoSaveTimer = runTimer(1.0, self, self.tryAutoSave, false)
   end
end

return {CScene=CScene}
