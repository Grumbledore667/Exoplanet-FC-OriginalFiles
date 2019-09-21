local imgui = _G.imgui
local console = require "ui.console"
local hlp = require "helpers"
local orderedPairs = require "orderedPairs".orderedPairs
local tablex = require "pl.tablex"
local ItemsData = require "itemsData"

local persistentData = require "global.persistentData"
local savedOptions


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


---Global event that is called every render frame, including paused game
function OnImGui()
   if not savedOptions then
      savedOptions = persistentData.getPersistentTable().imguiOptions or {}
      persistentData.getPersistentTable().imguiOptions = savedOptions
   end
   local opt = savedOptions
   do
      imgui.Begin("Debug widgets")
      local function Checkbox(name, checked)
         --First value returned is if checkbox was clicked, second value is actual checkbox state we just use that.
         return select(2, imgui.Checkbox(name, checked))
      end
      opt.accuracy = Checkbox("Accuracy", opt.accuracy); imgui.SameLine(); ShowHelpMarker("Requires character in CVAR or main character present with equipped gun.")
      opt.states = Checkbox("States", opt.states); imgui.SameLine(); ShowHelpMarker("Requires character in CVAR or main character present.")
      opt.taid = Checkbox("Ai ticks", opt.taid); imgui.SameLine(); ShowHelpMarker("Requires character in CVAR with behavior tree or main character present.")
      opt.quests = Checkbox("Quests", opt.quests); imgui.SameLine(); ShowHelpMarker("Show current quests state.")
      imgui.End()
   end

   ---@type CCharacter
   local CVAR = console:getCVAR()
   local targetCharacter = hlp.isCharacter(CVAR) and CVAR or getMC()

   if opt.accuracy and targetCharacter then
      local gun = targetCharacter:getWeaponSlotItem()
      if gun and gun.setAccuracy then
         local visible
         visible = imgui.Begin("Gun accuracy", true, imgui.bor{imgui.WindowFlags_NoTitleBar, imgui.WindowFlags_NoResize})
         if visible then
            imgui.Text(string.format("ItemsData accuracy: %f", ItemsData.getItemAccuracy(gun:getItemName())))
            imgui.Text(string.format("Quality accuracy mod: %f", gun:getQualityBonus("accuracyFlat")))
            imgui.Text("Final accuracy override")
            imgui.SameLine()
            ShowHelpMarker("Data above is just for convenience, to show you the values as they are in the engine. The slider sets the final value.")
            local _, value = imgui.SliderFloat("", gun:getAccuracy(), 0, 1, "%.3f", 0.15) -- reset 0.15 to 1 for linear scale
            gun:setAccuracy(value)
         end
         imgui.End()
      end
   end

   if opt.states then
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

   if opt.quests then
      local visible
      visible, opt.quests = imgui.Begin("Quests debug", opt.quests)
      if visible and opt.quests then
         local questParams = getQuestParams()
         for name, quest in orderedPairs(_G.quests) do
            local new = not not quest.finishNodes
            if imgui.CollapsingHeader(name .. (new and " (new)" or "")) then
               imgui.PushID(name)
               local started = quest:isStarted()
               imgui.Text("is started: " .. tostring(started))
               if not started then
                  imgui.SameLine()
                  if imgui.Button("start") then
                     if new then
                        quest:advanceNode(quest.startNode)
                     else
                        quest:start()
                     end
                  end
               end
               imgui.Text("is active: " .. tostring(quest:isActive()))
               if not new then imgui.Text("active step name: " .. tostring(quest:getActiveStepName())) end
               imgui.Text("is finished: " .. tostring(quest:isFinished()))
               if not new then imgui.Text("is failed: " .. tostring(quest:isFailed())) end
               if new then
                  if imgui.Button("save") then
                     testQuestState = {}
                     quest:OnSaveState(testQuestState)
                     quest:logq(require"inspect"(testQuestState))
                  end
                  if imgui.Button("load") then
                     local nodes = quest.nodes
                     for _, n in ipairs(nodes) do
                        n:reset()
                     end
                     if testQuestState then
                        quest:OnLoadState(testQuestState)
                     end
                  end
               end
               if imgui.BeginTabBar("tabbar##" .. name) then
                  if imgui.BeginTabItem("data", true) then
                     if imgui.TreeNode("topics:") then
                        for topic, topicState in orderedPairs(questParams[name] or {}) do
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
                              imgui.PopID() --topic
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
                     if new and imgui.TreeNode("suspended nodes:") then
                        local upNext = {quest.startNode}
                        local visited = {}
                        while #upNext > 0 do
                           local current = table.remove(upNext)
                           if type(current) == "boolean" then
                              if current then
                                 imgui.TreePop()
                              end
                           elseif not visited[current] then
                              visited[current] = true
                              local indent
                              if current.suspended then
                                 if current.startNode then
                                    indent = imgui.TreeNode(current.startNode.name)
                                 else
                                    imgui.BulletText(current.name)
                                    imgui.SameLine()
                                    if imgui.Button("advance") then
                                       runTimerAdv(0, false, current.release, current)
                                    end
                                    imgui.SameLine()
                                    ShowHelpMarker("Warning: doesn't work for all types of nodes")
                                 end
                                 imgui.SameLine(300)
                                 imgui.Text(current.className)
                              end
                              for i=#current.connections,1,-1 do
                                 table.insert(upNext, current.connections[i].toNode)
                              end
                              if indent then
                                 --queue up walking of subgraph nodes, then put special value to indicate if we need to pop tree
                                 table.insert(upNext, indent)
                                 table.insert(upNext, current.startNode)
                              end
                           end
                        end
                        imgui.TreePop()
                     end
                     imgui.EndTabItem()
                  end
                  if new and imgui.BeginTabItem("log", true) then
                     imgui.TextUnformatted(table.concat(quest.debugLogStrings, '\n'))
                     imgui.EndTabItem()
                  end
                  imgui.EndTabBar()
               end
               imgui.PopID() --name
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

   if opt.taid then
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

         local visible
         visible, opt.taid = imgui.Begin("AI debugger", opt.taid)
         if visible and opt.taid and imgui.TreeNodeEx("Behavior Tree Root", imgui.TreeNodeFlags_DefaultOpen) then
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
         imgui.End()
      end
   end

   if #callbacks > 0 then
      for _, callback in ipairs(tablex.copy(callbacks)) do
         pcall(callback)
      end
   end
end
