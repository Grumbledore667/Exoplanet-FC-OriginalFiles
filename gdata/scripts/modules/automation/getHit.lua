local random = require "random"

return function()
   local coro = require "coroutines.helpers"
   while true do
      coro.wait(0)

      getMC():hit(5)
      getMC():changeStatCount("health", 100)

      coro.wait(random.random(0.2, 1))
   end
end
