local imgui = _G.imgui
local console = require "ui.console"
local hlp = require "helpers"
local orderedPairs = require "orderedPairs".orderedPairs
local tablex = require "pl.tablex"
local ItemsData = require "itemsData"


local function ShowHelpMarker(desc)
   imgui.TextDisabled("(?)")
   if imgui.IsItemHovered() then
      imgui.BeginTooltip()
      imgui.PushTextWrapPos(imgui.GetFontSize() * 35)
      imgui.TextUnformatted(desc)
      imgui.PopTextWrapPos()
      imgui.EndTooltip()
   end
end

local callbacks = {}
function runTimerImgui(func)
   table.insert(callbacks, func)
end

local accuracy, states, taid, quests

---Global event that is called every render frame, including paused game
function OnImGui()
   do
      imgui.Begin("Debug widgets")
      local function Checkbox(name, checked)
         --At this version of lua imgui bindings some functions return mostly
         --useless status value first, and the actual needed state second. Until we
         --reverse this behavior in the bindings we can use that helper.
         return select(2, imgui.Checkbox(name, checked))
      end
      accuracy = Checkbox("Accuracy", accuracy); imgui.SameLine(); ShowHelpMarker("Requires character in CVAR or main character present with equipped gun.")
      states = Checkbox("States", states); imgui.SameLine(); ShowHelpMarker("Requires character in CVAR or main character present.")
      taid = Checkbox("Ai ticks", taid); imgui.SameLine(); ShowHelpMarker("Requires character in CVAR with behavior tree or main character present.")
      quests = Checkbox("Quests", quests); imgui.SameLine(); ShowHelpMarker("Show current quests state.")
      imgui.End()
   end

   ---@type CCharacter
   local CVAR = console:getCVAR()
   local targetCharacter = hlp.isCharacter(CVAR) and CVAR or getMC()

   if accuracy and targetCharacter then
      local gun = targetCharacter:getWeaponSlotItem()
      if gun and gun.setAccuracy then
         imgui.Begin("Gun accuracy", true, imgui.bor{imgui.WindowFlags_NoTitleBar, imgui.WindowFlags_NoResize})
         imgui.Text(string.format("ItemsData accuracy: %f", ItemsData.getItemAccuracy(gun:getItemName())))
         imgui.Text(string.format("Quality accuracy mod: %f", gun:getQualityBonus("accuracyFlat")))
         imgui.Text("Final accuracy override")
         imgui.SameLine()
         ShowHelpMarker("Data above is just for convenience, to show you the values as they are in the engine. The slider sets the final value.")
         local _, value = imgui.SliderFloat("", gun:getAccuracy(), 0, 1, "%.3f", 0.15) -- reset 0.15 to 1 for linear scale
         gun:setAccuracy(value)
         imgui.End()
      end
   end

   if states then
      if targetCharacter then
         imgui.Begin("State watcher")
         for name, value in orderedPairs(tablex.copy(targetCharacter.states)) do
            imgui.Text(name)
            imgui.SameLine(200)
            imgui.PushID(name)
            if imgui.Button(tostring(value)) then
               targetCharacter:setState(name, not value)
            end
            imgui.PopID()
         end
         imgui.End()
      end
   end

   if quests then
      imgui.Begin("Quests debug")
      for name, quest in orderedPairs(_G.quests) do
         if imgui.CollapsingHeader(name) then
            local started = quest:isStarted()
            imgui.Text("is started: " .. tostring(started))
            if not started then
               imgui.SameLine(); if imgui.Button("start") then quest:start() end
            end
            imgui.Text("is active: " .. tostring(quest:isActive()))
            imgui.Text("active step name: " .. tostring(quest:getActiveStepName()))
            imgui.Text("is finished: " .. tostring(quest:isFinished()))
            imgui.Text("is failed: " .. tostring(quest:isFailed()))
            if imgui.TreeNode("topics:") then
               for topic, topicState in orderedPairs(_G.__story_data.quests[name]) do
                  topic = string.match(topic, "^topic_(.+)")
                  if topic then
                     imgui.Text(string.format("%s:", topic))
                     imgui.SameLine(300)
                     imgui.PushID(topic)
                     if imgui.Button(tostring(topicState)) then
                        quest:setTopicVisible(topic, not topicState)
                     end
                     local customFunc = quest["getTopicVisible_" .. topic]
                     if customFunc and type(customFunc) == "function" then
                        imgui.SameLine()
                        ShowHelpMarker("Has custom visibility function")
                     end
                     imgui.PopID()
                  end
               end
               imgui.TreePop()
            end
            if imgui.TreeNode("variables:") then
               for variableName, value in orderedPairs(quest._variables) do
                  if variableName ~= "q" then
                     imgui.Text(tostring(variableName))
                     imgui.SameLine(300)
                     imgui.Text(tostring(value))
                  end
               end
               imgui.TreePop()
            end
         end
      end
      imgui.End()
   end

   local ad = dialogSystem.active_dialog
   if isDebug("dialogDebug") and ad then
      imgui.SetNextWindowPos(imgui.ImVec2(10, getScreenSize().y - 10), imgui.Cond_Always, imgui.ImVec2(0, 1))
      imgui.SetNextWindowBgAlpha(0.3)
      if imgui.Begin("Node data", nil, imgui.bor{
         imgui.WindowFlags_NoMove,
         imgui.WindowFlags_NoTitleBar,
         imgui.WindowFlags_NoResize,
         imgui.WindowFlags_AlwaysAutoResize,
         imgui.WindowFlags_NoSavedSettings,
         imgui.WindowFlags_NoFocusOnAppearing,
         imgui.WindowFlags_NoNav
      }) then
         imgui.Text(ad.name)
         if ad.active_message then
            local msg = ad.active_message
            imgui.Text("ID: " .. tostring(msg.ID))
            if msg.topic then
               local quest, topic = splitQuestTopic(msg:getTopic())
               imgui.Text(string.format("topic:\n %s\n %s", quest, topic))
            end
            if msg.animation then
               imgui.Text("animation: " .. msg.animation)
            end
            imgui.Text("time: " .. tostring(msg.time))

            for _, funcName in ipairs{"onStart", "onStop", "isVisible"} do
               if msg[funcName] then
                  imgui.Separator()
                  imgui.Text((string.gsub(msg.script_src, "\n\n+", "\n\n")))
                  break
               end
            end
         end
      end
      imgui.End()
   end

   if taid then
      local history = targetCharacter and targetCharacter.BT and targetCharacter.BT.history
      if history and #history then
         local status = {}
         for _, item in ipairs(history) do
            status[getmetatable(item)] = item.status[1]
         end

         local colorMap = {
            SUCCESS = imgui.ImVec4(0, 1, 0, 1),
            RUNNING = imgui.ImVec4(1, 1, 0, 1),
            FAILURE = imgui.ImVec4(1, 0, 0, 1),
            FRESH   = imgui.ImVec4(1, 1, 1, 1),
         }

         local function writeNodeStatus(node)
            imgui.SameLine(imgui.GetWindowWidth() - 100)
            local nodeStatus = status[node] or "FRESH"
            imgui.TextColored(colorMap[nodeStatus], nodeStatus)
         end

         imgui.Begin("AI debugger")
         if imgui.TreeNodeEx("Behavior Tree Root", imgui.TreeNodeFlags_DefaultOpen) then
            local function iterateTree(node)
               if not node then
                  return
               end
               local leaf = false
               if not (node.guard or node.child or node.children) then
                  leaf = true
               end
               local treeNodeName = node.className .. ' ' .. node.name
               local treeNode = imgui.TreeNodeEx(treeNodeName, leaf and imgui.TreeNodeFlags_Leaf or 0)
               writeNodeStatus(node)
               if treeNode then
                  if node.guard then
                     local guardNode = imgui.TreeNode("guard")
                     writeNodeStatus(node.guard)
                     if guardNode then
                        iterateTree(node.guard)
                        imgui.TreePop()
                     end
                  end
                  if node.child then
                     iterateTree(node.child)
                  elseif node.children then
                     for _, child in ipairs(node.children) do
                        iterateTree(child)
                     end
                  end
                  imgui.TreePop()
               end
            end
            iterateTree(targetCharacter.BT.child)
            imgui.TreePop()
         end
      end
      imgui.End()
   end

   if #callbacks > 0 then
      for _, callback in ipairs(tablex.copy(callbacks)) do
         pcall(callback)
      end
   end
end
