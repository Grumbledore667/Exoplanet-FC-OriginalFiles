local oo = require "loop.simple"

local tablex = require "pl.tablex"

local GUIUtils = require "ui.utils"

local CBaseModule = require "ui.baseModule"

---@class CAnnoyingHintUI : CBaseModule
local CAnnoyingHintUI = oo.class({
   layoutName = "annoyingHint.layout",
}, CBaseModule)
--add and complete methods are protected from multiplying

--Methods
function CAnnoyingHintUI:init()
   CBaseModule.init(self)

   self.taskList = {}
   self.pendingTasks = {}
   self.completedTasks = {}
end

function CAnnoyingHintUI:addTask(text, hintType)
   if self:isTaskPending(hintType) or self:isTaskCompleted(hintType) then return end
   log("TUTORIAL ANNOYING HINT: " .. hintType)
   if not getGameOption("tutorial") then
      log("While tutorial is disabled")
      return
   end
   if self:isTaskListEmpty() then
      self:setup(text)
   end
   self.pendingTasks[hintType] = true
   table.insert(self.taskList, {text = text, hintType = hintType})
end

function CAnnoyingHintUI:setup(text)
   if type(text) == "string" then
      self.wnd:setText(text)
   elseif type(text) == "function" then --get up to date text and show it
      local status, compiledText = pcall(text)
      if status and compiledText then
         self.wnd:setText(compiledText)
      end
   end

   self:show(true)
end

function CAnnoyingHintUI:completeTask(hintType)
   if not self:isTaskPending(hintType) or self:isTaskCompleted(hintType) then return end
   local taskID = string.match(tablex.search(self.taskList, hintType), "%d+")
   if taskID then
      taskID = tonumber(taskID)
      table.remove(self.taskList, taskID)

      if taskID == 1 and self.wnd:isVisible() then
         if self:isTaskListEmpty() then
            self:show(false)
         else
            self:setup(self.taskList[1].text)
         end
      end
   end
   self.pendingTasks[hintType] = nil
   self.completedTasks[hintType] = true
end

function CAnnoyingHintUI:onOptionUpdate()
   if not getGameOption("tutorial") then
      self.taskList = {}
      self.pendingTasks = {}
      self:show(false)
   end
end

function CAnnoyingHintUI:onDialogStart()
   self:show(false)
end

function CAnnoyingHintUI:onDialogEnd()
   if not self:isTaskListEmpty() then
      self:show(true)
   end
end

function CAnnoyingHintUI:isTaskPending(hintType)
   return self.pendingTasks[hintType] == true
end

function CAnnoyingHintUI:isTaskCompleted(hintType)
   return self.completedTasks[hintType] == true
end

function CAnnoyingHintUI:isTaskListEmpty()
   return #self.taskList == 0
end

return CAnnoyingHintUI
