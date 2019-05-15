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

local accuracy, states, taid

---Global event that is called every render frame, including paused game
function OnImGui()
   local WindowFlags = imgui.constant.WindowFlags
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
      imgui.End()
   end

   ---@type CCharacter
   local CVAR = console:getCVAR()
   local targetCharacter = hlp.isCharacter(CVAR) and CVAR or getMC()

   if accuracy and targetCharacter then
      local gun = targetCharacter:getWeaponSlotItem()
      if gun and gun.setAccuracy then
         imgui.Begin("Gun accuracy", true, {WindowFlags.NoTitleBar, WindowFlags.NoResize})
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

   if taid then
      local history = targetCharacter and targetCharacter.BT and targetCharacter.BT.history
      if history and #history then
         local status = {}
         for _, item in ipairs(history) do
            status[getmetatable(item)] = item.status[1]
         end

         local colorMap = {
            SUCCESS = {0, 1, 0, 1},
            RUNNING = {1, 1, 0, 1},
            FAILURE = {1, 0, 0, 1},
            FRESH   = {1, 1, 1, 1},
         }

         local function writeNodeStatus(node)
            imgui.SameLine(imgui.GetWindowWidth() - 100)
            local nodeStatus = status[node] or "FRESH"
            local r, g, b, a = unpack(colorMap[nodeStatus])
            imgui.TextColored(r, g, b, a, nodeStatus)
         end

         imgui.Begin("AI debugger")
         if imgui.TreeNodeEx("Behavior Tree Root", imgui.constant.TreeNodeFlags.DefaultOpen) then
            local function iterateTree(node)
               if not node then
                  return
               end
               local leaf = false
               if not (node.guard or node.child or node.children) then
                  leaf = true
               end
               local treeNodeName = node.className .. ' ' .. node.name
               local treeNode = imgui.TreeNodeEx(treeNodeName, leaf and imgui.constant.TreeNodeFlags.Leaf or 0)
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
end
