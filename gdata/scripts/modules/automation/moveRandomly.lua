local random = require "random"

return function()
   local coro = require "coroutines.helpers"
   local function pushButton(buttonName)
      pcall(function() getMC():OnControlDown(getButtonCode(buttonName)) end)
      coro.wait(random.normal(1, 10))
      pcall(function() getMC():OnControlUp(getButtonCode(buttonName)) end)
   end
   local buttonNames = {"FORWARD", "BACK", "LEFT", "RIGHT"}
   while true do
      coro.wait(0)
      pushButton(random.choice(buttonNames))
      coro.wait(random.random(0.2, 1))
   end
end
