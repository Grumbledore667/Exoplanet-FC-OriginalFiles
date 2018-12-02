local random = require "random"

return function()
   local coro = require "coroutines.helpers"
   local function pushButton(buttonName)
      pcall(function() getMC():OnControlDown(getButtonCode(buttonName)) end)
      coro.wait(0.25)
      pcall(function() getMC():OnControlUp(getButtonCode(buttonName)) end)
   end
   local buttonNames = {"HOLSTER", "HOTBAR1", "HOTBAR2", "HOTBAR3", "HOTBAR4", "HOTBAR5", "HOTBAR6", "ATTACK", "RELOAD"}
   while true do
      coro.wait(0)
      pushButton(random.choice(buttonNames))
      coro.wait(random.random(0.2, 1))
   end
end
