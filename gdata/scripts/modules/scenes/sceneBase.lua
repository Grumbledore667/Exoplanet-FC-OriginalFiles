local oo = require "loop.simple"
local CCamManager = (require "scenes.camManager").CCamManager
local CTextManager = (require "scenes.textManager").CTextManager
local CMusicManager = (require "scenes.musicManager").CMusicManager
local WeatherSystem = (require "environment.weather").WeatherSystem
local SkySystem = (require "environment.sky").SkySystem
local stringx = require "pl.stringx"

local CScene = oo.class(
   {
      m_camManager = nil,
      m_textManager = nil,
      m_musicManager = nil,
      m_breakBrushes = nil,
      m_playerDetectedChars = nil,
      m_breakBrushSubscribers = nil,
      m_checkpoints = nil,
   }
)

function CScene:OnControlDown(code)
   if gameplayUI:isConsoleVisible() then
      if code == 192 then -- `(~)
         gameplayUI:hideConsole()
      end
      return
   end

   if code == 192 and gameplayUI:isGameplayRootWindow() then -- `(~)
      gameplayUI:showConsole()
   end

   if (code == PC_F5 and isSavingEnabled()) then
      log( "saved" )
      saveGameSafe( "quicksave" )
   end

   if (code == PC_F9 and not isEditor()) then
      if not gSavegames then
         local listBox = CEGUI.toListbox( gameplayUI.wndSaveLoad:getChild( "Savegames" ) )
         initSavegamesList( listBox )
      end
      loadSaveVersionCheck( getLastSaveID() )
   end

   if ( isEditor() or isDebug("keys")) then
      if ( code == 190 ) then
         WeatherSystem:changeTimeRate(  5.0 )
         SkySystem:changeTimeRate    (  0.01 )
      end
      if ( code == 188 ) then
         WeatherSystem:changeTimeRate( -5.0 )
         SkySystem:changeTimeRate    ( -0.01 )
      end
   end

   if isDebug("keys") or isEditor() then
      if code == PC_B then
         if gameplayUI:getFocusObj() then
            gameplayUI:setupStylesEditor(gameplayUI:getFocusObj())
         end
      end
   end

end

function CScene:OnControlUp(code)
   if gameplayUI:isConsoleVisible() then
      return
   end
end


function CScene:OnLocationInit()
   setScene(self)

   self.m_breakBrushes = {}
   self.m_playerDetectedChars = {}

   self.m_camManager = CCamManager{ m_scene = self }
   self.m_textManager = CTextManager{ m_scene = self }
   self.m_musicManager = CMusicManager{ m_scene = self }

   self.m_camManager:init()
   self.m_textManager:init()
   self.m_musicManager:init()
end

function CScene:OnLocationEnter()
   setPlayer( getDefaultPlayer() )
   self.m_camManager:setCamPlayer()
   self.m_musicManager:setShuffle(true)
   self.m_musicManager:setDefaultTheme("idle")
   initLocationEnterUI()

   WeatherSystem:init()
   runTimer( 0.05, nil, function() WeatherSystem:update( 0.05 ) end, true )
   --[[
   snow_0:getPose():setParent( getPlayer():getPose() )
   snow_0:getPose():resetLocalPose()
   snow_0:getPose():setLocalRot( {x=180,y=90,z=0,} )
   snow_0:getPose():setLocalPos( {x=0,y=1000,z=0,} )
   ]]

   --self:playIntro()
   self:loadFromPersistentData()
end

function CScene:playIntro()
   log( "playIntro" )
   Character_0:execAnimSingle( "intro.caf", false )

   --[[Camera_0:setFile( ".\\gdata\\cameras\\intro.sca" )
   Camera_0:playAnimation( "intro" )
   activateCamera( Camera_0 )]]
end

function CScene:OnLocationExit()
   setPlayer( getDefaultPlayer() )
   self.m_musicManager:stopMusic()
end


function CScene:OnBreakBrush( brush )
   table.insert( self.m_breakBrushes, brush )
   if (not self.m_breakBrushSubscribers) then
      return
   end
   for key in pairs(self.m_breakBrushSubscribers) do
      local obj = self.m_breakBrushSubscribers[key]
      obj.onBreakBrush( obj, brush )
   end
end


function CScene:addBreakBrushSubscriber(obj)
   if (not self.m_breakBrushSubscribers) then
      self.m_breakBrushSubscribers = {}
   end
   table.insert(self.m_breakBrushSubscribers, obj)
end


function CScene:addCheckpoint( checkpoint )
   self.m_checkpoints = checkpoint
end

function CScene:OnSkipMovie()
   log("OnSkipMovie")
   --self.m_camManager:getCurCam():onSkip()
end

function CScene:onCharDie( char )
   if ( char == getPlayer() ) then
      runTimer( 5, self, self.failedLevel, false )
   end
end

function CScene:onPlayerDetected( char, value )
   local index = getKeyByValue(self.m_playerDetectedChars, char)
   if (value) then
      if (not index) then
         table.insert(self.m_playerDetectedChars, char)
      end
   else
      if (index) then
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
      getPlayer():setCameraHeight( getDefaultPlayerCameraHeight(), 0 )
      getPlayer():setCameraDist  ( getDefaultPlayerCameraDistance(), 0 )
      getPlayer():setCameraFov   ( getDefaultPlayerCameraFov(), 0 )
      getPlayer():respawn()
      --changeObjectPos( player, self.m_checkpoints )
   end
]]
end


function CScene:endGame(value)
   self:exitLocation(value)
end


function CScene:isBroken( brush )
   for key in pairs(self.m_breakBrushes) do
      if ( brush == self.m_breakBrushes[key] ) then
         return true
      end
   end
   return false
end

function CScene:OnSaveState( state )
   gameplayUI:showInfoTextEx("Game saved", "major", "")
   local quests_states = {}
   for k,v in pairs(quests) do
      if v.activeStep then
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
         if #v.daytime_timers > 0 then
            qs["daytime_timers"] = tableDeepCopy(v.daytime_timers)
         end
         qs["hidden"] = v.hidden
         qs["markersEnabled"] = v.markersEnabled
         quests_states[k] = qs
      end
   end
   state.quests = quests_states

   --sky
   local sky = {}
   SkySystem:OnSaveState(sky)
   state.sky = sky

   --weather
   local weather = {}
   WeatherSystem:OnSaveState(weather)
   -- log("MUCH WEATHER DATA " .. tostring(weather))
   state.weather = weather
end

function CScene:OnLoadState( state )
   gameplayUI:showInfoTextEx("Game loaded", "major", "")
   if state.quests then
      for k,v in pairs(state.quests) do
         local q = getQuest(k)
         if q then
            -- set active step
            if v.activeStepName then
               local activeStep = q:getStep(v.activeStepName)
               if activeStep then
                  q.activeStep = activeStep
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
            if v.daytime_timers then
               for i,dtimer in ipairs(v.daytime_timers) do
                  if dtimer.time == "day" then
                     q:goToStepAtDay(dtimer.params.step, dtimer.params.count)
                  elseif dtimer.time == "night" then
                     q:goToStepAtNight(dtimer.params.step, dtimer.params.count)
                  end
               end
            end
            if v.hidden ~= nil then
               q.hidden = v.hidden
            end
            if v.markersEnabled ~= nil then
               q.markersEnabled = v.markersEnabled
            end
            if q.OnLoadState then
               -- empty table for now, later add ability to save custom data
               local status, err = pcall(q.OnLoadState, q, {})
               if not status then
                  log(string.format("ERROR while executing %s's OnLoadState:", q.title))
                  log(err)
               end
            end
         end
      end
   end

   --sky
   if state.sky ~= nil then
      SkySystem:OnLoadState(state.sky)
   end

   --weather
   if state.weather then
      WeatherSystem:OnLoadState(state.weather)
   end
end

--Load game state with params previously set in persistent data
function CScene:loadFromPersistentData()
   local persistentString = getPersistentData()
   setPersistentData( "" )
   if persistentString and persistentString ~= "" then
      local f, err = loadstring( persistentString, "getPersistentData string" )
      if err then
         log(err)
         return
      end

      local persistentState = f()
      if type(persistentState) == "table" and persistentState.saveName then
         log(string.format("WARNING: Loading from an older save %s", persistentState.saveName))
         local saveRetriever, err = loadfile( getSavegamesFolder() .. "/" .. persistentState.saveName .. ".sav" )
         if err then
            log(err)
            return
         end

         local saveData = saveRetriever()

         local playerStatus, playerState = pcall(function() return saveData.Characters.jack_sharp end)
         if playerStatus and playerState then
            local invDumpContainer = getObj( "footlocker_tall_20" )
            local placeInvToContainer = false

            local player = getDefaultPlayer()
            --log(playerState)
            log("Optional Loading:")
            local playerPosStatus
            if persistentState.playerPosition then
               playerPosStatus = pcall(function()
                  log("- Player Position")
                  local pos = {x=playerState.pose_12, y=playerState.pose_13, z=playerState.pose_14}
                  player:getPose():setPos( pos )
               end)
               if not playerPosStatus then
                  log("Couldn't load player position")
               end
            end
            if (not persistentState.playerPosition or not playerPosStatus) and invDumpContainer then
               placeInvToContainer = true
            end

            pcall(function()
               if persistentState.level then
                  log("- Levels")
                  player:addLevels( playerState.scriptState.level - 1, true )
                  if persistentState.attributePoints then
                     log("- Attribute Points")
                     for statName, timesUpgraded in pairs(playerState.scriptState.assignedAttributes) do
                        --Means old save with badly named statNames
                        if stringx.startswith(statName, "Max") then
                           statName = statName:gsub("Max", "")
                           statName = statName:lower() .. "Max"
                        end
                        for i=1,timesUpgraded do
                           player:upgradeStat( statName )
                        end
                     end
                  end
               end
            end)

            if persistentState.inventory then
               if placeInvToContainer then
                  pcall(function()
                     log("- Dump Inventory To Container")
                     invDumpContainer.inventory.itemsManager:deserialize(playerState.scriptState.inventory)
                     invDumpContainer.inventory.itemsManager:destroyItemByName( "hand_to_hand.wpn" )
                     invDumpContainer.inventory.itemsManager:destroyItemByName( "scanner.itm" )
                  end)
               else
                  runTimer(0.05, nil, function()
                     pcall(function()
                        log("- Inventory")
                        if playerState.scriptState.inventory then
                           player.itemsManager:removeAllItems()
                           player.itemsManager:deserialize(playerState.scriptState.inventory)
                        end
                     end)

                     pcall(function()
                        for index,itemName in pairs(playerState.scriptState.hotbar) do
                           player.itemsManager:setToHotbarByName( index, itemName )
                        end
                     end)

                     pcall(function()
                        player.fastAccessSlots = tableDeepCopy( playerState.scriptState.fastAccessSlots )
                     end)

                     pcall(function()
                        local wpn = player.itemsManager:getItemByName( playerState.scriptState.weapon )
                        player:useItem( wpn )
                     end)

                     player:wearHair()
                     pcall(function()
                        for slotId, itemName in pairs(playerState.scriptState.equippedAttire) do
                           player.itemsManager:equipSlotWithItem( slotId, player.itemsManager:getItemByName(itemName).id, true )
                        end
                     end)
                  end, false)
               end
            end
         else
            log("Could not load player script state:")
            if playerState then
               log(playerState)
            else
               log("Could not find valid jack_sharp entry in savegame Characters table")
            end
         end

         if persistentState.fastTravel then
            local q = getQuest("travel")
            q.hidden = true
            pcall(function()
               log("- Fast Travel")
               for name, objState in pairs(saveData.Story.globals.fast_travel_destinations) do
                  if objState.activated then
                     local obj = getObj( name )
                     if obj and obj.register then
                        obj:register( true )
                        if not q:isStarted() then
                           q:startImediate()
                        end
                        q:writeLog(string.format("%s", obj.prettyName))
                     end
                  end
               end
            end)
            q.hidden = false
         end
      end
   end
end

function CScene:tryAutoSave()
   local player = getPlayer()
   if (not isEditor() and player
      and not player:getState("dead") and (player:getScriptClass() == "CMainCharacter") and not player:getState("resting")) then
      if not player:getState("talk") and not gameplayUI.fadeToBlackSequence then
         log( "Auto saved" )
         saveGameSafe( "autosave" )
      else
         runTimer( 1.0, self, self.tryAutoSave, false )
      end
   end
end

return {CScene=CScene}
